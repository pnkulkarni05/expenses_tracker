import 'package:expense_tracker/widgets/expenses.dart';
import 'package:flutter/material.dart';

ColorScheme kColorScheme =
    ColorScheme.fromSeed(seedColor: const Color.fromARGB(255, 42, 50, 169));
void main() {
  runApp(
    MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData().copyWith(
          colorScheme: kColorScheme,
          appBarTheme: const AppBarTheme().copyWith(
            foregroundColor: kColorScheme.primaryContainer,
            backgroundColor: kColorScheme.onPrimaryContainer,
          )),
      home: const Scaffold(
        body: Expenses(),
      ),
    ),
  );
}
