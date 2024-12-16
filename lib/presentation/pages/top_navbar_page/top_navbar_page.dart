import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:sajid_bazaar/presentation/controllers/top_navbar_page_controller.dart';
import 'package:sajid_bazaar/presentation/pages/top_navbar_page/widgets/build_app_bar.dart';

class TopNavbarPage extends StatefulWidget {
  const TopNavbarPage({super.key});

  @override
  State<TopNavbarPage> createState() => _TopNavbarPageState();
}

class _TopNavbarPageState extends State<TopNavbarPage> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: GetBuilder<TopNavbarPageController>(
        builder: (topNavbarPageController) {
          return DefaultTabController(
            length: 4,
            child: Scaffold(
              appBar: const BuildAppBar(),
              body: topNavbarPageController.getScreen,
            ),
          );
        },
      ),
    );
  }
}
