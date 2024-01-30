import 'package:expense_tracker/widgets/expenses_list/expense_item.dart';
import 'package:flutter/material.dart';
import 'package:expense_tracker/models/expense.dart';

class ExpensesList extends StatelessWidget {
  const ExpensesList(
      {required this.onRemoveExpense, required this.myList, super.key});

  final List<Expense> myList;
  final void Function(Expense expense) onRemoveExpense;

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: myList.length,
      itemBuilder: (context, index) => Dismissible(
        key: ValueKey(myList[index]),
        child: ExpenseItem(
          myList[index],
        ),
        onDismissed: (direction) {
          onRemoveExpense(myList[index]);
        },
      ),
    );
  }
}
