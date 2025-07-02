class ProductsModel {
  final String name;
  final double price;
  final int quantity;
  final String description;
  final bool isFragile;
  final DateTime? expiryDate;
  final String imageUrl;

  ProductsModel({
    required this.name,
    required this.price,
    required this.quantity,
    required this.description,
    required this.isFragile,
    this.expiryDate,
    required this.imageUrl,
  });
}

final List<ProductsModel> dumyProducts = [
  ProductsModel(
    name: 'Laptop',
    price: 1200.0,
    quantity: 10,
    description: 'High performance laptop for professionals.',
    isFragile: true,
    expiryDate: null,
    imageUrl:
        'https://images.unsplash.com/photo-1517336714731-489689fd1ca8?auto=format&fit=crop&w=400&q=80',
  ),
  ProductsModel(
    name: 'Organic Apples',
    price: 3.5,
    quantity: 100,
    description: 'Fresh organic apples from local farms.',
    isFragile: false,
    expiryDate: DateTime(2025, 7, 10),
    imageUrl:
        'https://images.unsplash.com/photo-1567306226416-28f0efdc88ce?auto=format&fit=crop&w=400&q=80',
  ),
  ProductsModel(
    name: 'Glass Vase',
    price: 25.0,
    quantity: 15,
    description: 'Decorative glass vase, handle with care.',
    isFragile: true,
    expiryDate: null,
    imageUrl:
        'https://images.unsplash.com/photo-1523983305870-58dbef1d639f?auto=format&fit=crop&w=400&q=80',
  ),
  ProductsModel(
    name: 'Coffee Beans',
    price: 15.0,
    quantity: 50,
    description: 'Premium roasted coffee beans.',
    isFragile: false,
    expiryDate: DateTime(2024, 12, 31),
    imageUrl:
        'https://images.unsplash.com/photo-1509042239860-f550ce710b93?auto=format&fit=crop&w=400&q=80',
  ),
];
