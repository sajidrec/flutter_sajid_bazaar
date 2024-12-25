import 'package:flutter/material.dart';
import 'package:sajid_bazaar/data/models/item_card_model.dart';

class ItemDetailsPage extends StatefulWidget {
  final ItemCardModel itemDetailsData;

  const ItemDetailsPage({
    super.key,
    required this.itemDetailsData,
  });

  @override
  State<ItemDetailsPage> createState() => _ItemDetailsPageState();
}

class _ItemDetailsPageState extends State<ItemDetailsPage> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
      body: Column(
        children: [
          Text("Item details ${widget.itemDetailsData.name}"),
        ],
      ),
    ));
  }
}
