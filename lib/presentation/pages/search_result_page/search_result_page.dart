import 'package:flutter/material.dart';

class SearchResultPage extends StatelessWidget {
  const SearchResultPage({
    super.key,
    required this.searchedKeyWord,
  });

  final String searchedKeyWord;

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Center(
          child: Text("Search Keyword $searchedKeyWord"),
        ),
      ),
    );
  }
}
