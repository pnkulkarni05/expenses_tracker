import 'package:flutter/material.dart';
import 'package:expense_tracker/models/expense.dart';

class ExpenseItem extends StatelessWidget {
  const ExpenseItem(this.expense, {super.key});

  final Expense expense;

  @override
  Widget build(BuildContext context) {
    var amt = expense.amount;
    return Card(
      child: Column(
        children: [
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 16, horizontal: 20),
            child: Text(expense.title),
          ),
          const SizedBox(
            height: 4,
          ),
          Row(
            children: [
              Text(
                ('\$ $amt'),
              ),
              const Spacer(),

              /* This Spacer widget takes all the available space between the two widgets.
              In this case it takes space between the Text widget above the spacer and the Row widget below the spacer.*/

              Row(
                children: [
                  Icon(categoryIcons[expense.category]),
                  const SizedBox(
                    width: 8,
                  ),
                  Text(
                    expense.formattedDate,
                  ),
                ],
              )
            ],
          )
        ],
      ),
    );
  }
}
