import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter_zoom_drawer/flutter_zoom_drawer.dart';

import 'earphone_page.dart';
import 'menu_screen.dart';

class EarphoneHome extends StatelessWidget {
  const EarphoneHome({super.key});

  @override
  Widget build(BuildContext context) {
    return const ZoomDrawer(
      angle: 0,
      mainScreenScale: 0.1,
      borderRadius: 40,
      menuScreen: MenuScreenPage(),
      mainScreen: EarphonePage(),
    );
  }
}
