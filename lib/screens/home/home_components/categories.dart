import 'package:flutter/material.dart';
import 'package:movie_review_app/components/components.dart';
import 'package:movie_review_app/providers/home_provider.dart';
import 'package:movie_review_app/utils/app_config.dart';

class Categories extends StatelessWidget {
  final HomeProvider provider;
  const Categories({super.key, required this.provider});

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      scrollDirection: Axis.horizontal,
      child: Row(children: [
        for (var name in provider.categoryNames)
          GestureDetector(
            onTap: () {
              provider.changeSelectedCategory(name);
            },
            child: Padding(
                padding: const EdgeInsets.only(right: 30),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(name, style: AppConfigurations.title),
                    verticalGap(5),
                    Container(
                        height: 2,
                        width: 20,
                        color: name == provider.selectedCategoryNames
                            ? Colors.red
                            : Colors.transparent)
                  ],
                )),
          )
      ]),
    );
  }
}
