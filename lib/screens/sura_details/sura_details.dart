import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import 'sura_details_args.dart';

class SuraDetailsScreen extends StatefulWidget {
  static const String routeName = 'SuraDetailsScreen';

  const SuraDetailsScreen({super.key});

  @override
  State<SuraDetailsScreen> createState() => _SuraDetailsScreenState();
}

class _SuraDetailsScreenState extends State<SuraDetailsScreen> {
  List<String> verses = [];

  @override
  Widget build(BuildContext context) {
    SuraDetailsArgs args =
        ModalRoute.of(context)!.settings.arguments as SuraDetailsArgs;
    if (verses.isEmpty) {
      readFile(args.suraIndex);
    }
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
              title: Text(
                args.suraTitle,
              ),
            ),
            body: verses.isEmpty
                ? LinearProgressIndicator(
                    color: Theme.of(context).primaryColor,
                    backgroundColor: Colors.transparent,
                  )
                : ListView.separated(
                    itemBuilder: (context, index) => Text(
                      '${verses[index].trim()} (${index + 1})',
                      textAlign: TextAlign.center,
                    ),
                    separatorBuilder: (context, index) => Divider(
                      color: Theme.of(context).primaryColor,
                      height: 40,
                      thickness: .4,
                    ),
                    itemCount: verses.length,
                  ),
          ),
        ],
      ),
    );
  }

  readFile(int index) async {
    String sura = await rootBundle.loadString('assets/files/${index + 1}.txt');
    List<String> lines = sura.trim().split('\n');
    verses = lines;
    setState(() {});
  }
}
