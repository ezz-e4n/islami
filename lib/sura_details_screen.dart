import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import 'sura_args.dart';

class SuraDetailsScreen extends StatefulWidget {
  static const String routeName = 'SuraDetailsScreen';

  const SuraDetailsScreen({super.key});

  @override
  State<SuraDetailsScreen> createState() => _SuraDetailsScreenState();
}

class _SuraDetailsScreenState extends State<SuraDetailsScreen> {
  static List<String> verses = [];

  @override
  Widget build(BuildContext context) {
    SuraArgs args = ModalRoute.of(context)!.settings.arguments as SuraArgs;
    loadFile(args.index);

    return Stack(
      children: [
        Image.asset(
          'assets/images/main_bg.png',
          width: double.infinity,
          height: double.infinity,
          fit: BoxFit.fill,
        ),
        Scaffold(
          appBar: AppBar(
            title: Text(args.suraName),
          ),
          body: verses.isEmpty
              ? const Center(child: CircularProgressIndicator())
              : ListView.separated(
                  itemBuilder: (context, index) => Text(
                    '${verses[index]}(${index + 1})',
                    textDirection: TextDirection.rtl,
                    textAlign: TextAlign.center,
                  ),
                  separatorBuilder: (context, index) => const Divider(),
                  itemCount: verses.length,
                ),
        ),
      ],
    );
  }

  void loadFile(int index) async {
    String file = await rootBundle.loadString('assets/files/${index + 1}.txt');
    List<String> lines = file.split('\n');
    verses = lines;
    setState(() {});
  }
}
