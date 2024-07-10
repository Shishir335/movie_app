import 'package:flutter/material.dart';
import 'package:movie_review_app/components/components.dart';
import 'package:movie_review_app/components/serch_text_field.dart';
import 'package:movie_review_app/utils.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
          backgroundColor: AppConfigurations.backgroundColor,
          body: Padding(
            padding: const EdgeInsets.all(20),
            child:
                Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
              Text('Find Movies, Tv series, \nand more..',
                  style: AppConfigurations.headline),
              verticalGap(),
              const SearchTextField(),
              verticalGap(),
              SingleChildScrollView(
                scrollDirection: Axis.horizontal,
                child: Row(children: [
                  for (var name in names)
                    Padding(
                        padding: const EdgeInsets.only(right: 30),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(name, style: AppConfigurations.subtitle),
                            verticalGap(5),
                            Container(height: 2, width: 20, color: Colors.red)
                          ],
                        ))
                ]),
              ),
              verticalGap(),
              Expanded(
                child: GridView.builder(
                    shrinkWrap: true,
                    gridDelegate:
                        const SliverGridDelegateWithFixedCrossAxisCount(
                            crossAxisCount: 2,
                            mainAxisSpacing: 10,
                            crossAxisSpacing: 10),
                    itemCount: 10,
                    itemBuilder: (context, index) {
                      return Container(color: Colors.red);
                    }),
              )
            ]),
          )),
    );
  }

  List<String> names = [
    'Movies',
    'Tv Series',
    'Documentary',
    'Sports',
  ];
}
