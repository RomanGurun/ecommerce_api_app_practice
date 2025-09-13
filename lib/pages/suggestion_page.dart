import 'package:flutter/material.dart';
// import 'package:ecommerceapi/pages/widgets/video_widget.dart';
import 'package:ecommerceapi/providers/categoryprovider.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';


class SuggestionPage extends ConsumerWidget {
  const SuggestionPage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {

    return Scaffold(
      body:
      Center(
        child:Column(

          mainAxisSize: MainAxisSize.min,  //
          children:[

            Text("Welcome TO Suggestion Page"),
          ],
        ),

      ),
       );

  }
}