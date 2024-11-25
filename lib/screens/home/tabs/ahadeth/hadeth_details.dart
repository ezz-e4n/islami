import 'package:flutter/material.dart';

import 'hadeth_model.dart';

class HadethDetails extends StatelessWidget {
  static const String routeName = 'HadethDetails';

  const HadethDetails({super.key});

  @override
  Widget build(BuildContext context) {
    HadethModel args =
        ModalRoute.of(context)!.settings.arguments as HadethModel;
    return SafeArea(
      child: Stack(
        children: [
          Image.asset(
            'assets/images/bg_image.png',
            fit: BoxFit.fill,
            width: double.infinity,
            height: double.infinity,
          ),
          Scaffold(
            appBar: AppBar(
              title: Text(args.title),
            ),
            body: SingleChildScrollView(
                child: Card(
              margin: const EdgeInsets.all(15),
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(20),
                  side: BorderSide(
                      color: Theme.of(context).primaryColor, width: 2)),
              elevation: 20,
              child: Padding(
                padding: const EdgeInsets.all(20),
                child: Text(
                  args.content,
                  textAlign: TextAlign.center,
                ),
              ),
            )),
          ),
        ],
      ),
    );
  }
}
