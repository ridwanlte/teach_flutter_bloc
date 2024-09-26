import 'dart:convert';
import 'dart:developer';

import '../../../data/data_provider.dart';
import '../models/product_model/product.dart';

class ProductRepository {
  DataProvider dataProvider = DataProvider();
  Future<List<Product>> getProducts() async {
    try {
      final response = await DataProvider.getRequest(
          endpoint: "products");
      if (response.statusCode == 200) {
        final List data = json.decode(response.body)['products'];
        return data.map((e) => Product.fromJson(e)).toList();
      } else {
        throw "Error loading product";
      }
    } catch (e) {
      rethrow;
    }
  }

  Future getDetailProduct(int? id) async {
    try {
      final response = await DataProvider.getRequest(endpoint: "product/$id");
      if (response.statusCode == 200) {
        final data = Product.fromJson(json.decode(response.body));
        return data;
      } else {
        throw "Error loading detail product";
      }
    } catch (e) {
      rethrow;
    }
  }

  Future putProduct(int? id, String? title) async {
    try {
      final response = await DataProvider.putRequest(endpoint: "product/$id", body: {
        'title': title
      });
      log("put data: ${response.statusCode}: ${response.body}");
      if(response.statusCode == 200) {
        final data = Product.fromJson(json.decode(response.body));
        return data;
      } else {
        throw "Error loading put product";
      }
    } catch (e) {
      rethrow;
    }
  }
}
