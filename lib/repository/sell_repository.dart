import 'package:ecommerceapi/models/category_products.dart';
import 'package:ecommerceapi/models/products.dart';
import 'package:ecommerceapi/models/user.dart';
import 'package:dio/dio.dart';
// final categories = (response.data as List)
//     .map((e) => CategoryModel.fromMap(e))
//     .toList();

// for (var category in categories) {
// print("${category.id} → ${category.name}");
// }

class SellsRepository{
  static final Dio dio = Dio();
  static Future<List<CategoryProduct>> getCategoryProduct() async{
    try{
      final response = await dio.get("https://api.escuelajs.co/api/v1/categories");
      return  (response.data as List)
          .map((e)=> CategoryProduct.fromJson(e)).toList();

    }catch(err){
      print(err);
      throw "Something went wrong";

    }
  }

  static Future<List<Product>> getProduct({required int categoryId}) async{
    try{
      final response = await dio.get("https://api.escuelajs.co/api/v1/categories/$categoryId/products");
      return (response.data as List)
          .map((e)=> Product.fromMap(e as Map<String,dynamic>)).toList();

    }catch(err){
      print(err);
      throw "Something went wrong";

    }
  }
  static Future<List<UserModel>> getUser() async{
    try{
      final response = await dio.get("https://api.escuelajs.co/api/v1/users");
      return (response.data as List)
          .map((e)=> UserModel.fromJson(e)).toList();

    }catch(err){
      print(err);
      throw "Something went wrong";

    }
  }




}