import 'package:dio/dio.dart';
import 'package:ecommerce_app/models/product.dart';

class ProductService {

  final Dio dio = Dio();

  Future<List<Product>> fetchProducts() async {
    try {
      final response = await dio.get('https://dummyjson.com/products');
      if (response.statusCode == 200) {
        List<dynamic> data = response.data['products'];
        return data.map((json) => Product.fromJson(json)).toList();
      } else {
        throw Exception('Failed to load products');
      }
    } catch (e) {
      throw Exception('Failed to load products: $e');
    }
  }
}