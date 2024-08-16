import 'dart:io';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:myapp/constants.dart';

class CommonAdminPage extends StatefulWidget {
  final String title;
  final bool requiresImage;
  final bool requiresName;
  final bool requiresPrice;
  final bool requiresDescription;
  final List<String> categories;
  final List<String> subcategories;

  const CommonAdminPage({
    super.key,
    required this.title,
    this.requiresImage = false,
    this.requiresName = false,
    this.requiresPrice = false,
    this.requiresDescription = false,
    required this.categories,
    required this.subcategories,
  });

  @override
  // ignore: library_private_types_in_public_api
  _CommonAdminPageState createState() => _CommonAdminPageState();
}

class _CommonAdminPageState extends State<CommonAdminPage> {
  final TextEditingController _nameController = TextEditingController();
  final TextEditingController _priceController = TextEditingController();
  final TextEditingController _descriptionController = TextEditingController();
  File? _selectedImage;
  String? _selectedCategory;
  String? _selectedSubcategory;
  final ImagePicker _picker = ImagePicker();

  void _pickImage() async {
    final XFile? image = await _picker.pickImage(source: ImageSource.gallery);

    if (image != null) {
      setState(() {
        _selectedImage = File(image.path);
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title, style: const TextStyle(color: Colors.white)),
        backgroundColor: kPrimaryColor,
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            children: [
              if (widget.requiresImage) ...[
                GestureDetector(
                  onTap: _pickImage,
                  child: Container(
                    height: 150,
                    width: double.infinity,
                    decoration: BoxDecoration(
                      color: Colors.grey[200],
                      borderRadius: BorderRadius.circular(8.0),
                    ),
                    child: _selectedImage == null
                        ? const Icon(Icons.add_a_photo, size: 50, color: Colors.grey)
                        : Image.file(_selectedImage!, fit: BoxFit.cover),
                  ),
                ),
                const SizedBox(height: 16),
              ],
              if (widget.requiresName) ...[
                TextField(
                  controller: _nameController,
                  decoration: const InputDecoration(
                    labelText: 'Item Name',
                    border: OutlineInputBorder(),
                  ),
                ),
                const SizedBox(height: 16),
              ],
              if (widget.requiresPrice) ...[
                TextField(
                  controller: _priceController,
                  decoration: const InputDecoration(
                    labelText: 'Price',
                    border: OutlineInputBorder(),
                  ),
                  keyboardType: TextInputType.number,
                ),
                const SizedBox(height: 16),
              ],
              if (widget.requiresDescription) ...[
                TextField(
                  controller: _descriptionController,
                  decoration: const InputDecoration(
                    labelText: 'Description',
                    border: OutlineInputBorder(),
                  ),
                  maxLines: 4,
                ),
                const SizedBox(height: 16),
              ],
              if (widget.categories.isNotEmpty) ...[
                DropdownButtonFormField<String>(
                  value: _selectedCategory,
                  hint: const Text('Select Category'),
                  onChanged: (String? newValue) {
                    setState(() {
                      _selectedCategory = newValue;
                    });
                  },
                  items: widget.categories.map<DropdownMenuItem<String>>((String category) {
                    return DropdownMenuItem<String>(
                      value: category,
                      child: Text(category),
                    );
                  }).toList(),
                  decoration: const InputDecoration(
                    border: OutlineInputBorder(),
                  ),
                ),
                const SizedBox(height: 16),
              ],
              if (widget.subcategories.isNotEmpty) ...[
                DropdownButtonFormField<String>(
                  value: _selectedSubcategory,
                  hint: const Text('Select Subcategory'),
                  onChanged: (String? newValue) {
                    setState(() {
                      _selectedSubcategory = newValue;
                    });
                  },
                  items: widget.subcategories.map<DropdownMenuItem<String>>((String subcategory) {
                    return DropdownMenuItem<String>(
                      value: subcategory,
                      child: Text(subcategory),
                    );
                  }).toList(),
                  decoration: const InputDecoration(
                    border: OutlineInputBorder(),
                  ),
                ),
                const SizedBox(height: 16),
              ],
              ElevatedButton(
                onPressed: () {
                  // Implement the action (add/update/remove)
                },
                style: ElevatedButton.styleFrom(
                  backgroundColor: kPrimaryColor,
                  padding: const EdgeInsets.symmetric(horizontal: 32, vertical: 16),
                ),
                child: Text(
                  widget.title,
                  style: const TextStyle(fontSize: 18, color: Colors.white),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
