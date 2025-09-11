import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:ecommerceapi/routes/app_routes.dart';
import 'package:flutter/material.dart';

void main()async{

runApp(ProviderScope(
  overrides: [],
  child:Main()
));
}
class Main extends ConsumerWidget{
  const Main({super.key});
  @override
  Widget build(BuildContext context, ref) {

return MaterialApp.router(

  debugShowCheckedModeBanner: false,
    routerConfig: router,);

      }

}