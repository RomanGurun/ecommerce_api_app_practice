import 'package:ecommerceapi/pages/home_page.dart';
import 'package:ecommerceapi/pages/home_page.dart';
import 'package:ecommerceapi/routes/route_enum.dart';
import 'package:go_router/go_router.dart';


final router = GoRouter(
  routes:[
    GoRoute(
      path: '/',
      builder: (context,state){
        return HomePage();
        
      },
  // routes: [
  //   GoRoute(path: )
  // ]
      
      
    )
  ]
);