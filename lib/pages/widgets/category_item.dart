import 'package:flutter/material.dart';
import 'package:ecommerceapi/providers/categoryprovider.dart';
import 'package:ecommerceapi/routes/route_enum.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';


class CategoryItemPage extends ConsumerWidget {
  final String category;
  const CategoryItemPage({super.key, required this.category});

  @override
  Widget build(BuildContext context, ref) {
    final itemState = ref.watch(productsprovider(category));
    return Scaffold(
        body: itemState.when(data: (data){
          return ListView.builder(
            padding: EdgeInsets.only(top: 10, bottom: 10),
            itemCount: data.length,
            itemBuilder: (context, index) {
              final meal = data[index];
              print(meal);

              return ListTile(
                onTap: (){
                  // context.pushNamed(AppRoute.meal.name, extra: meal.idMeal);
                },
                leading: CircleAvatar(
                backgroundColor: Colors.grey[200],
              child: ClipOval(
              child: Image.network(
              meal.images.isNotEmpty ? meal.images[0] : 'https://via.placeholder.com/150',
              fit: BoxFit.cover,
              width: 40,
              height: 40,
              errorBuilder: (context, error, stackTrace) {
              return Image.asset(
              'assets/images/placeholder.png', // your local placeholder
              fit: BoxFit.cover,
              width: 40,
              height: 40,
              );
              },
              ),
              ),
                ),
                title: Text(meal.title),
              );
            },
          );
        }, error:(err,st){
          return Text(err.toString());
        }, loading: (){
          return Center(child: CircularProgressIndicator(),);
        })
    );
  }
}