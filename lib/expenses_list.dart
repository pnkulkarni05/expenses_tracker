import 'package:flutter/material.dart';
import 'package:expense_tracker/models/expense.dart';

class ExpensesList extends StatelessWidget {
  const ExpensesList({required this.myList, super.key});

  final List<Expense> myList;

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
        itemCount: myList.length,
        itemBuilder: (context, index) => Text(myList[index].title));
  }
}
