import 'package:flutter/material.dart';

class SearchBox extends StatelessWidget {
  const SearchBox({
    Key? key,
    required this.hintText,
    required this.borderColor,
    required this.underLineColor,
  }) : super(key: key);

  final String hintText;
  final Color borderColor;
  final Color underLineColor;

  //Function searchFunction;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8),
      child: TextField(
        textAlignVertical: TextAlignVertical.center,
        onChanged: (value) {},
        decoration: InputDecoration(
          filled: true,
          fillColor: Colors.white,
          hintText: hintText,
          suffixIcon: const Icon(Icons.search),
          contentPadding:
              const EdgeInsets.only(left: 20.0, bottom: 5.0, top: 5.0),
          focusedBorder: OutlineInputBorder(
            borderSide: BorderSide(color: borderColor),
            borderRadius: BorderRadius.circular(10),
          ),
          enabledBorder: UnderlineInputBorder(
            borderSide: BorderSide(color: underLineColor),
            borderRadius: BorderRadius.circular(10),
          ),
        ),
      ),
    );
  }
}
