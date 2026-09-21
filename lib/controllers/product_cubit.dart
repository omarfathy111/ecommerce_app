import 'package:ecommerce_app/controllers/product_state.dart';
import 'package:ecommerce_app/models/product.dart';
import 'package:ecommerce_app/services/product_service.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class ProductCubit extends Cubit<ProductState> {
  final ProductService productService;

  List<Product> allProducts = [];

  String searchQuery = '';
  String selectedCategory = 'All';

  ProductCubit(this.productService) : super(ProductState());

  Future<void> fetchProducts() async {
    emit(
      ProductState(
        isLoading: true,
      ),
    );

    try {
      final products = await productService.fetchProducts();

      allProducts = products;

      emit(
        ProductState(
          isLoading: false,
          products: products,
        ),
      );
    } catch (e) {
      emit(
        ProductState(
          isLoading: false,
          errorMessage: e.toString(),
        ),
      );
    }
  }

  void searchProducts(String query) {
    searchQuery = query;

    _applyFilters();
  }

  void filterProductsByCategory(String category) {
    selectedCategory = category;

    _applyFilters();
  }

  void _applyFilters() {
    List<Product> filteredProducts = allProducts;

    if (selectedCategory != 'All') {
      filteredProducts = filteredProducts
          .where(
            (product) => product.category == selectedCategory,
          )
          .toList();
    }

    if (searchQuery.isNotEmpty) {
      filteredProducts = filteredProducts
          .where(
            (product) => product.title.toLowerCase().contains(
                  searchQuery.toLowerCase(),
                ),
          )
          .toList();
    }

    emit(
      ProductState(
        isLoading: false,
        products: filteredProducts,
      ),
    );
  }

  List<String> getCategories() {
    return [
      'All',
      ...allProducts
          .map((product) => product.category)
          .toSet()
    ];
  }
}