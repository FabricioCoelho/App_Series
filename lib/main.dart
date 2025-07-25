import 'package:flutter/material.dart';
import 'package:flutter_application_1/add_tv_show_screen.dart';
import 'package:flutter_application_1/custom_drawer.dart';
import 'package:flutter_application_1/tv_show_data.dart';
import 'package:flutter_application_1/tv_show_model.dart';
import 'package:flutter_application_1/tv_show_screen.dart';
import 'package:google_fonts/google_fonts.dart';

void main() {
  runApp(const MainApp());
}

class MainApp extends StatefulWidget {
  const MainApp({super.key});

  @override
  State<MainApp> createState() => _MainAppState();
}

class _MainAppState extends State<MainApp> {
  final List<TvShow> tvShows = favTvShowList;

  // Screen control
  int currentScreenIndex = 0;

  List<Widget> get screens => [
    TvShowScreen(tvShows: tvShows),
    AddTvShowScreen(),
  ];

  @override
  Widget build(BuildContext context) {
    var color = const Color.fromARGB(255, 56, 117, 147);
    var colorScheme = ColorScheme.fromSeed(
      seedColor: color,
      brightness: Brightness.light,
    );
    var colorSchemeDark = ColorScheme.fromSeed(
      seedColor: color,
      brightness: Brightness.dark,
    );

    var customTheme = ThemeData(
      colorScheme: colorScheme,
      fontFamily: GoogleFonts.lato().fontFamily,
      appBarTheme: AppBarTheme(
        centerTitle: true,
        toolbarHeight: 100,
        backgroundColor: colorScheme.primary,
        titleTextStyle: GoogleFonts.lobster(
          fontSize: 46,
          fontWeight: FontWeight.bold,
          color: colorScheme.onPrimary,
        ),
      ),
      cardTheme: CardThemeData(
        color: colorScheme.secondaryContainer,
        shadowColor: colorScheme.onSurface,
        elevation: 5,
        margin: EdgeInsets.symmetric(horizontal: 16, vertical: 8),
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
      ),
    );

    var customThemeDark = ThemeData(
      colorScheme: colorSchemeDark,
      fontFamily: GoogleFonts.lato().fontFamily,
      appBarTheme: AppBarTheme(
        centerTitle: true,
        toolbarHeight: 100,
        backgroundColor: colorSchemeDark.onPrimary,
        titleTextStyle: GoogleFonts.lobster(
          fontSize: 46,
          fontWeight: FontWeight.bold,
          color: colorSchemeDark.primary,
        ),
      ),
      cardTheme: CardThemeData(
        color: colorSchemeDark.secondaryContainer,
        shadowColor: colorSchemeDark.onSurface,
        elevation: 5,
        margin: EdgeInsets.symmetric(horizontal: 16, vertical: 8),
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
      ),
    );

    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: customTheme,
      darkTheme: customThemeDark,
      themeMode: ThemeMode.system,

      home: Scaffold(
        appBar: AppBar(title: const Text('Eu Amo Séries')),
        drawer: CustomDrawer(),
        body: screens[currentScreenIndex],
      ),
    );
  }
}
