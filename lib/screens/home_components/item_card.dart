import 'package:flutter/material.dart';
import 'package:movie_review_app/components/components.dart';
import 'package:movie_review_app/utils/app_config.dart';
import 'package:movie_review_app/utils/urls.dart';

class ItemCard extends StatelessWidget {
  const ItemCard({super.key, required this.name, required this.poster});

  final String? name;
  final String? poster;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        ClipRRect(
            borderRadius: BorderRadius.circular(30),
            child: poster == null
                ? const Padding(
                    padding: EdgeInsets.symmetric(vertical: 50),
                    child: Center(child: Icon(Icons.image, size: 100)),
                  )
                : Image.network(Urls.posterPath + poster!,
                    loadingBuilder: (context, child, loadingProgress) {
                    if (loadingProgress == null) {
                      return child;
                    }
                    return const CircularProgressIndicator();
                  }, fit: BoxFit.cover)),
        verticalGap(10),
        Text(name ?? 'Movie', style: AppConfigurations.title),
      ],
    );
  }
}
