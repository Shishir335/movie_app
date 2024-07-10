import 'package:flutter/material.dart';
import 'package:movie_review_app/utils.dart';

class SearchTextField extends StatelessWidget {
  const SearchTextField({super.key});

  @override
  Widget build(BuildContext context) {
    return TextFormField(
        decoration: InputDecoration(
      hintText: 'Sherlock Holmes',
      hintStyle: AppConfigurations.hintText,
      prefixIcon: Icon(Icons.search, color: AppConfigurations.hint),
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
