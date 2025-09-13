import 'package:flutter/material.dart';
// import 'package:ecommerceapi/pages/widgets/video_widget.dart';
import 'package:ecommerceapi/providers/categoryprovider.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';


class MealPage extends ConsumerWidget {
  final String title;
  const MealPage({super.key, required this.title});

  @override
  Widget build(BuildContext context, WidgetRef ref) {

    final itemState = ref.watch(filterproductsprovider(title));
    return Scaffold(

        body:Center(

        child: itemState.when(data: (data){
          return ListView.builder(
            padding: EdgeInsets.only(top: 10, bottom: 10),
            itemCount: data.length,
            itemBuilder: (context, index) {
              final meal = data[index];
              print(meal);

              return Padding(
                padding: const EdgeInsets.symmetric(vertical: 400),

                child:Column(
                  mainAxisSize: MainAxisSize.min,
                  crossAxisAlignment: CrossAxisAlignment.center,

                  children: [
                    ListTile(
                      onTap: (){
                        // context.pushNamed(AppRoute.meal.name, extra: meal.id);
                      },
                      leading: CircleAvatar(
                        backgroundColor: Colors.grey[200],
                        child:
                        Column(
                          mainAxisSize: MainAxisSize.min,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            ClipOval(
                              child: Image.network(
                                meal.images.isNotEmpty ? meal.images[0] : 'https://picsum.photos/200/300',
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
                          ],
                        ),

                      ),
                      title:  Text(
                        meal.title,
                        style: const TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                        textAlign: TextAlign.center,
                      ),

                    )
                  ],
                ),
                 );
            },
          );
        }, error:(err,st){
          return Text(err.toString());
        }, loading: (){
          return Center(child: CircularProgressIndicator(),);
        })
    ),
    );









  }
}