import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:sajid_bazaar/presentation/pages/carts_page/widgets/buy_all_button_widget.dart';

class CartsPage extends StatelessWidget {
  const CartsPage({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Stack(
          children: [
            ListView.separated(
              itemBuilder: (context, index) => ListTile(
                title: const Text("Sajid"),
                subtitle: const Text("Hossain"),
                leading: CachedNetworkImage(
                  imageUrl:
                      "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcRJLtBmMcXbiM8k1bNd48Fu08N6XQyjvBi7WQ&s",
                ),
                trailing: const Expanded(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      Text("Unit Price : \$1000"),
                      Text("Quantity : 100"),
                    ],
                  ),
                ),
              ),
              separatorBuilder: (context, index) => const SizedBox(
                height: 5,
              ),
              itemCount: 20,
            ),
            const BuyAllButtonWidget()
          ],
        ),
      ),
    );
  }
}
