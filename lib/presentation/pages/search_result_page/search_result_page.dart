import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:sajid_bazaar/utils/app_colors_util.dart';

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
        appBar: AppBar(
          backgroundColor: AppColorsUtil.backgroundGreen,
          foregroundColor: AppColorsUtil.foreGroundWhite,
          centerTitle: true,
          title: Text(searchedKeyWord),
        ),
        body: Padding(
          padding: const EdgeInsets.all(4.0),
          child: GridView.builder(
            gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 2, // Number of columns
              crossAxisSpacing: 3,
              mainAxisSpacing: 3,
            ),
            itemCount: 20, // Total number of items
            itemBuilder: (context, index) {
              return Container(
                decoration: BoxDecoration(
                  color: AppColorsUtil.backgroundLightGreen,
                ),
                child: Column(
                  children: [
                    Expanded(
                      child: CachedNetworkImage(
                        fit: BoxFit.cover,
                        imageUrl:
                            "https://mwqlqdcwkbcwwoijdkjw.supabase.co/storage/v1/object/public/bazaar_items/reccomended_items/apple.jpg",
                      ),
                    ),
                    const Column(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        Text("Dummy name"),
                        Text("Price : 100"),
                        Text("Stocks : 100"),
                      ],
                    ),
                  ],
                ),
              );
            },
          ),
        ),
      ),
    );
  }
}
