import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import 'screens/home/views/home_screen.dart';

class MyAppView extends StatelessWidget {
  const MyAppView({super.key});

  @override
  Widget build(BuildContext context) {
    return AnnotatedRegion(
      value: SystemUiOverlayStyle.dark,
      child: MaterialApp(
        title: "Expense Tracker",
        debugShowCheckedModeBanner: false,
        theme: ThemeData(
          scaffoldBackgroundColor: Colors.grey.shade100,
          colorScheme: const ColorScheme.light(
              // background: Colors.grey.shade100,
              // onBackground: Colors.black,
              surfaceTint: Colors.transparent,
              primary: Color(0xFF00B2E7),
              secondary: Color(0xFFE064F7),
              tertiary: Color(0xFFFF8D6C),
              outline: Colors.grey),
        ),
        home: const HomeScreen(),
      ),
    );
  }
}
