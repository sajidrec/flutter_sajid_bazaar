import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';

class FavouritePage extends StatelessWidget {
  const FavouritePage({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Padding(
          padding: const EdgeInsets.symmetric(
            vertical: 5,
            horizontal: 5,
          ),
          child: ListView.separated(
            itemBuilder: (context, index) => InkWell(
              onTap: () {},
              child: ListTile(
                leading: CachedNetworkImage(
                  imageUrl:
                      "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcRJLtBmMcXbiM8k1bNd48Fu08N6XQyjvBi7WQ&s",
                  // height: Get.height / 8,
                ),
                trailing: const Text("\$1000"),
                title: const Text("Sajid"),
              ),
            ),
            separatorBuilder: (context, index) => const SizedBox(height: 5),
            itemCount: 20,
          ),
        ),
      ),
    );
  }
}
