import 'package:flutter/material.dart';
import 'package:sajid_bazaar/presentation/pages/store_page/widgets/all_categories_widget.dart';

class StorePage extends StatelessWidget {
  const StorePage({super.key});

  @override
  Widget build(BuildContext context) {
    return const SafeArea(
      child: Scaffold(
        body: SingleChildScrollView(
          child: Column(
            children: [
              AllCategoriesWidget(),
            ],
          ),
        ),
      ),
    );
  }
}
