class BannerImagesManager {
  final Map<String, Map<String, String>> _categoryBannerImages = {
    'Living Area': {
      'Chair': 'assets/images/banner/living/livingareachair1.jpeg',
      'Table': 'assets/images/banner/living/livingareatable.jpg',
      'Sofa': 'assets/images/banner/living/livingareasofa.jpg',
    },
    'Bed Room': {
      'Cupboard': 'assets/images/banner/bedroom/bedroomcupboard.jpg',
      'Bed': 'assets/images/banner/bedroom/bedroombed.jpg',
      'Chair': 'assets/images/banner/bedroom/bedroomchair.jpg',
      'Sofa': 'assets/images/banner/bedroom/bedroomsofa.jpg',
    },
    'Garden': {
      'Chair': 'assets/images/banner/garden/gardenchair.jpg',
      'Table': 'assets/images/banner/garden/gardentable.jpg',
      'Swing': 'assets/images/banner/garden/gardensofas.jpg',
    },
    'Office': {
      'Desk': 'assets/images/banner/office/officetable.jpg',
      'Chair': 'assets/images/banner/office/officechair.jpg',
      'Sofa': 'assets/images/banner/office/officesofa.jpg',
    },
    'Dining': {
      'Table': 'assets/images/banner/dining/diningareatable.jpg',
      'Chair': 'assets/images/banner/dining/diningareachair.jpg',
      'Cabinet': 'assets/images/banner/dining/diningareacabinet.jpg',
    },
    'Ancient': {
      'Table': 'assets/images/banner/ancient/ancienttable.jpg',
      'Chair': 'assets/images/banner/ancient/ancientchair.jpg',
      'Sofa': 'assets/images/banner/ancient/ancientsofa.jpg',
      'Bed': 'assets/images/banner/ancient/ancientbed.jpg',
    },
  };

  List<String> getBannerImages(String category, List<String> items) {
    final itemMap = _categoryBannerImages[category];

    if (itemMap == null) {
      return [];
    }

    final paths = items.map((item) {
      if (!itemMap.containsKey(item)) {
        return '';
      }
      return itemMap[item]!;
    }).where((path) => path.isNotEmpty).toList();

    return paths;
  }
}
