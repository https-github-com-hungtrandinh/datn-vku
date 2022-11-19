import 'package:clean_architecture/injection.dart';
import 'package:clean_architecture/presentation/pages/detailtopics/detail_view_model.dart';
import 'package:clean_architecture/presentation/pages/home/home_view_model.dart';
import 'package:clean_architecture/presentation/pages/initial.dart';
import 'package:clean_architecture/presentation/pages/search/search_view_model.dart';
import 'package:clean_architecture/presentation/pages/settings/settings_view_model.dart';
import 'package:clean_architecture/presentation/pages/tab/tab_view_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:provider/provider.dart';

import 'generated/l10n.dart';

void main() async {
  await init();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (context) => sl<HomeVM>()),
        ChangeNotifierProvider(create: (context) => sl<SettingsVM>()),
        ChangeNotifierProvider(create: (context) => sl<DetailVM>()),
        ChangeNotifierProvider(create: (context) => sl<TabVM>()),
        ChangeNotifierProvider(create: (context)=>sl<SearchVM>())
      ],
      child: MaterialApp(
          theme: ThemeData.dark(),
          localizationsDelegates: const [
            S.delegate,
            GlobalWidgetsLocalizations.delegate,
            GlobalCupertinoLocalizations.delegate,
          ],
          home: const InitialApp(),
          supportedLocales: S.delegate.supportedLocales),
    );
  }
}
