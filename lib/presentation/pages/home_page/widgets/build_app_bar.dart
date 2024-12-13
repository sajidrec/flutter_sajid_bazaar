import 'package:flutter/material.dart';
import 'package:sajid_bazaar/presentation/utils/app_colors_util.dart';

class BuildAppBar extends StatelessWidget implements PreferredSizeWidget {
  const BuildAppBar({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return AppBar(
      toolbarHeight: 0,
      backgroundColor: AppColorsUtil.backgroundGreen,
      foregroundColor: AppColorsUtil.foreGroundWhite,
      bottom: TabBar(
        indicatorColor: AppColorsUtil.foreGroundWhite,
        unselectedLabelColor: AppColorsUtil.foreGroundUnselected,
        labelColor: AppColorsUtil.foreGroundWhite,
        tabs: const [
          Tab(
            icon: Icon(Icons.store_rounded),
            text: "Store",
          ),
          Tab(
            icon: Icon(Icons.favorite_outline_sharp),
            text: "Favourite",
          ),
          Tab(
            icon: Icon(Icons.shopping_cart),
            text: 'Carts',
          ),
          Tab(
            icon: Icon(Icons.person),
            text: 'Profile',
          ),
        ],
      ),
    );
  }

  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight * 1.6);
}
