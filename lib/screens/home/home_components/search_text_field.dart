import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:movie_review_app/providers/home_provider.dart';
import 'package:movie_review_app/utils/app_config.dart';

class SearchTextField extends StatelessWidget {
  final HomeProvider provider;
  const SearchTextField({super.key, required this.provider});

  @override
  Widget build(BuildContext context) {
    return TextFormField(
        controller: provider.search,
        onChanged: (value) {
          provider.getSearch(value);
        },
        style: AppConfigurations.title,
        decoration: InputDecoration(
          hintText: 'Sherlock Holmes',
          hintStyle: AppConfigurations.hintText,
          prefixIcon:
              Icon(FontAwesomeIcons.search, color: AppConfigurations.hint),
          filled: true,
          fillColor: const Color(0xff211c31),
          border: OutlineInputBorder(
              borderSide: const BorderSide(color: Colors.transparent, width: 0),
              borderRadius: BorderRadius.circular(45)),
          enabledBorder: OutlineInputBorder(
              borderSide: const BorderSide(color: Colors.transparent, width: 0),
              borderRadius: BorderRadius.circular(45)),
          disabledBorder: OutlineInputBorder(
              borderSide: const BorderSide(color: Colors.transparent, width: 0),
              borderRadius: BorderRadius.circular(45)),
          focusedBorder: OutlineInputBorder(
              borderSide: const BorderSide(color: Colors.transparent, width: 0),
              borderRadius: BorderRadius.circular(45)),
        ));
  }
}
