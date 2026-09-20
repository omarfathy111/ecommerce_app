import '../models/product.dart';

class ProductState {
  final bool isLoading;
  final List<Product> products;
  final String? errorMessage;

  ProductState({
    this.isLoading = false,
    this.products = const [],
    this.errorMessage,
  });
}