import 'package:flutter/material.dart';

class NewExpense extends StatefulWidget {
  const NewExpense({super.key});
  @override
  State<NewExpense> createState() {
    return _NewExpenseState();
  }
}

class _NewExpenseState extends State<NewExpense> {
  //Approach 1 for storing the input written by user in the textfield.

  /* var _inputTitle;
  void _getExpenseTitle(String title) {
    _inputTitle = title;
  } */

  //Approach 2 for storing the input written by user in the textfield using controller.

  final _inputController = TextEditingController();
  final _valueController = TextEditingController();

  @override
  void dispose() {
    _inputController.dispose();
    _valueController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(16),
      child: Column(
        children: [
          TextField(
            controller: _inputController,
            maxLength: 50,
            decoration: const InputDecoration(
              label: Text("Title"),
            ),
          ),
          TextField(
            keyboardType: TextInputType.number,
            controller: _valueController,
            maxLength: 6,
            decoration: const InputDecoration(
              label: Text("Amount"),
              prefix: Text("\$ "),
            ),
          ),
          Row(
            children: [
              TextButton(
                onPressed: () {
                  Navigator.pop(context);
                },
                child: const Text("Cancel"),
              ),
              ElevatedButton(
                onPressed: () {
                  print(_inputController.text);
                  print(_valueController.text);
                },
                child: const Text("Add Expense"),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
