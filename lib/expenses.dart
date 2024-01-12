import 'package:expense_tracker/models/expense.dart';
import 'package:flutter/material.dart';

class Expenses extends StatefulWidget {
  const Expenses({super.key});
  @override
  State<Expenses> createState() {
    return _ExpensesState();
  }
}

class _ExpensesState extends State<Expenses> {
  final List<Expense> _registeredExpenses = [
    Expense(
      title: 'Flutter Course',
      amount: 499,
      date: DateTime.now(),
      category: Category.work,
    ),
    Expense(
      title: 'Movie',
      amount: 300,
      date: DateTime.now(),
      category: Category.leisure,
    ),
    Expense(
      title: 'Birthday Party',
      amount: 499,
      date: DateTime.now(),
      category: Category.food,
    ),
  ];
  @override
  Widget build(BuildContext context) {
    return const Text("Expenses Tracker");
  }
}
