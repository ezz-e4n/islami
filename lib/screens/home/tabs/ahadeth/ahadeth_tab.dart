import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:islami/screens/home/tabs/ahadeth/hadeth_model.dart';

import 'hadeth_details.dart';

class AhadethTab extends StatefulWidget {
  AhadethTab({super.key});

  @override
  State<AhadethTab> createState() => _AhadethTabState();
}

class _AhadethTabState extends State<AhadethTab> {
  List<HadethModel> allAhadeth = [];

  @override
  Widget build(BuildContext context) {
    if (allAhadeth.isEmpty) {
      readAhadethFile();
    }
    return Column(
      children: [
        Expanded(
            flex: 3, child: Image.asset('assets/images/ahadeth_image.png')),
        Divider(color: Theme.of(context).primaryColor),
        const Text(
          'Ahadeth',
        ),
        Divider(color: Theme.of(context).primaryColor),
        Expanded(
          flex: 7,
          child: ListView.separated(
            //shrinkWrap: true,
            itemBuilder: (context, index) => InkWell(
              onTap: () {
                Navigator.pushNamed(
                  context,
                  HadethDetails.routeName,
                  arguments: HadethModel(
                      allAhadeth[index].title, allAhadeth[index].content),
                );
              },
              child: Text(
                allAhadeth[index].title,
                textAlign: TextAlign.center,
              ),
            ),
            separatorBuilder: (context, index) => Divider(
              color: Theme.of(context).primaryColor,
              height: 25,
            ),
            itemCount: allAhadeth.length,
          ),
        ),
      ],
    );
  }

  readAhadethFile() {
    rootBundle.loadString('assets/files/ahadeth.txt').then((value) {
      List<String> ahadethContent = value.split('#');
      for (int i = 0; i < ahadethContent.length; i++) {
        int lastIndexOfFirstLine = ahadethContent[i].trim().indexOf('\n');
        String title =
            ahadethContent[i].trim().substring(0, lastIndexOfFirstLine);
        String content =
            ahadethContent[i].trim().substring(lastIndexOfFirstLine + 1);
        HadethModel hadethModel = HadethModel(title, content);
        allAhadeth.add(hadethModel);
        setState(() {});
      }
    });
  }
}
