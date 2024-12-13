import 'package:flutter/material.dart';
import 'package:sajid_bazaar/presentation/pages/home_page/widgets/build_app_bar.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return const SafeArea(
      child: DefaultTabController(
        length: 4,
        child: Scaffold(
          appBar: BuildAppBar(),
          body: Center(
            child: Text("Home Page"),
          ),
        ),
      ),
    );
  }
}
