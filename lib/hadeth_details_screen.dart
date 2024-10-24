import 'package:flutter/material.dart';

import 'home/tabs/ahadeth/hadeth_model.dart';

class HadethDetailsScreen extends StatelessWidget {
  static const String routeName = 'HadethDetailsScreen';

  @override
  Widget build(BuildContext context) {
    HadethModel hadeth =
        ModalRoute.of(context)!.settings.arguments as HadethModel;
    return Stack(
      children: [
        Image.asset(
          'assets/images/main_bg.png',
          fit: BoxFit.fill,
          width: double.infinity,
          height: double.infinity,
        ),
        Scaffold(
          appBar: AppBar(
            title: Text(
              hadeth.title,
            ),
          ),
          body: Card(
            child: Text(
              hadeth.content,
              textDirection: TextDirection.rtl,
            ),
          ),
        ),
      ],
    );
  }
}
