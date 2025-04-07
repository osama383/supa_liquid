import 'package:flutter/material.dart';
import 'package:supa_liquid/theme.dart';

import 'core/routes/routes.dart';

class Supaliquid extends StatelessWidget {
  const Supaliquid({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      routerConfig: goRouter,
      debugShowCheckedModeBanner: false,
      theme: nobotTheme,
      themeMode: ThemeMode.light,
      title: 'Supa - liquid',
      locale: View.of(context).platformDispatcher.locale,
    );
  }
}
