import 'package:flutter/material.dart';
// import 'package:ecommerceapi/pages/widgets/video_widget.dart';
import 'package:ecommerceapi/providers/categoryprovider.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';


class MealPage extends ConsumerWidget {
  final String title;
  const MealPage({super.key, required this.title});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    // final mealState = ref.watch(mealDetailProvider(idMeal));
    // return Scaffold(
    //   appBar: AppBar(
    //     title: Text(idMeal),
    //   ),
    //   body: mealState.when(
    //       data: (data){
    //         return Padding(
    //           padding: const EdgeInsets.all(8.0),
    //           child: ListView(
    //             children: [
    //
    //               PlayVideoFromYoutube(videoId: data['strYoutube'].split('=')[1] ?? ''),
    //               SizedBox(height: 10,),
    //               Text(data['strMeal'] ?? ''),
    //               SizedBox(height: 10,),
    //               Image.network(data['strMealThumb'] ?? ''),
    //               SizedBox(height: 10,),
    //               Text(data['strInstructions'] ?? ''),
    //             ],
    //           ),
    //         );
    //       },
    //       error: (err, st) => Text(err.toString()),
    //       loading: () => Center(child: CircularProgressIndicator(),)
    //   ),
    // );

    final itemState = ref.watch(filterproductsprovider(title));
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
                  // context.pushNamed(AppRoute.meal.name, extra: meal.id);
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