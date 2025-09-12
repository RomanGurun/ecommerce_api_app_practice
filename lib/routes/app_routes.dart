import 'package:ecommerceapi/pages/home_page.dart';
import 'package:ecommerceapi/pages/home_page.dart';
import 'package:ecommerceapi/routes/route_enum.dart';
import 'package:go_router/go_router.dart';
import 'package:ecommerceapi/pages/meal_page.dart';

final router = GoRouter(
  routes:[
    GoRoute(
      path: '/',
      builder: (context,state){
        return HomePage();
        
      },
  routes: [
    GoRoute(path: 'meal-page',
    name:AppRoute.meal.name,
      builder: (context,stateok){
      return MealPage(title: stateok.extra as String);
      }
    )
  ]
      
      
    )
  ]
);