import 'package:ecommerceapi/models/category_products.dart';
import 'package:ecommerceapi/models/products.dart';
import 'package:ecommerceapi/models/user.dart';
import 'package:ecommerceapi/repository/sell_repository.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

final categoryproductprovider = FutureProvider<List<CategoryProduct>>((ref){
  return SellsRepository.getCategoryProduct();
});

final productsprovider = FutureProvider.family<List<Product>,String>((ref,categoryname){
  return SellsRepository.getProduct(categoryname: categoryname);

});

final userprovider = FutureProvider<List<UserModel>>((ref){
  return SellsRepository.getUser();

});

