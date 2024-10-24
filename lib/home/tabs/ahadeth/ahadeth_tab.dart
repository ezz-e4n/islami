import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:islami/home/tabs/ahadeth/hadeth_model.dart';

import '../../../hadeth_details_screen.dart';

class AhadethTab extends StatelessWidget {
  List<HadethModel> allAhadeth = [];

  AhadethTab({
    super.key,
  }) {
    readAhadethFile();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Image.asset('assets/images/ahadeth_image.png'),
        Divider(
          thickness: 1,
          color: Theme.of(context).primaryColor,
        ),
        const Text('الاحاديث'),
        Divider(
          thickness: 1,
          color: Theme.of(context).primaryColor,
        ),
        Expanded(
          child: ListView.separated(
              itemBuilder: (context, index) => InkWell(
                    onTap: () {
                      Navigator.pushNamed(
                        context,
                        HadethDetailsScreen.routeName,
                        arguments: HadethModel(
                            allAhadeth[index].title, allAhadeth[index].content),
                      );
                    },
                    child: Text(
                      allAhadeth[index].title,
                      textAlign: TextAlign.center,
                    ),
                  ),
              separatorBuilder: (context, index) => const Divider(),
              itemCount: allAhadeth.length),
        ),
      ],
    );
  }

  readAhadethFile() {
    rootBundle.loadString('assets/files/ahadeth.txt').then((value) {
      List<String> ahadethContent = value.split('#');

      for (int i = 0; i < ahadethContent.length; i++) {
        List<String> hadethLines = ahadethContent[i].trim().split('\n');
        String title = hadethLines[0];
        hadethLines.removeAt(0);
        String content = hadethLines.toString();
        HadethModel hadethModel = HadethModel(title, content);
        allAhadeth.add(hadethModel);
      }
    });
  }
}
