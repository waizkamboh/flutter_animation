class ScrollItems {
  final String image;
  final String name;
  final int color;

  ScrollItems({
    required this.image,
    required this.name,
    required this.color,
  });
}

final dataItems = <ScrollItems>[
  ScrollItems(name: "Chicken", image: "assets/images/chicken.png", color: 0xFFFF6F61),
  ScrollItems(name: "Burger", image: "assets/images/burger.png", color: 0xFF4A90E2),
  ScrollItems(name: "Noodles", image: "assets/images/noodles.png", color: 0xFF50E3C2),
  ScrollItems(name: "Lemon", image: "assets/images/lemon.png", color: 0xFFF5A623),
  ScrollItems(name: "Rum", image: "assets/images/rum.png", color: 0xFFD0021B),
  ScrollItems(name: "Cheese", image: "assets/images/cheese.png", color: 0xFF8E44AD),
  ScrollItems(name: "Ice Cream", image: "assets/images/ice_cream.png", color: 0xFF16A085),
  ScrollItems(name: "Pizza", image: "assets/images/pizza.png", color: 0xFF2980B9),
];