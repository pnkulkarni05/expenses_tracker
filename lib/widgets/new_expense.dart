import 'package:flutter/material.dart';
import 'package:expense_tracker/models/expense.dart';

class NewExpense extends StatefulWidget {
  const NewExpense({super.key});
  @override
  State<NewExpense> createState() {
    return _NewExpenseState();
  }
}

class _NewExpenseState extends State<NewExpense> {
  DateTime? _selectedDate;
  Category _selectedCategory = Category.food;
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

  void _presentDatePicker() async {
    final now = DateTime.now();
    final firstDate = DateTime(now.year - 1, now.month, now.day);
    final pickedDate = await showDatePicker(
        context: context, firstDate: firstDate, lastDate: now);

    setState(() {
      _selectedDate = pickedDate;
    });
  }

  void _submitExpenseData() {
    final enteredAmount = double.tryParse(_valueController.text);
    bool isInvalidAmount = enteredAmount == 0 || enteredAmount == null;
    if (isInvalidAmount ||
        _inputController.text.trim().isEmpty ||
        _selectedDate == null) {
      print("Please fill all the fields properly");
    }
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
          Row(
            children: [
              Expanded(
                child: TextField(
                  keyboardType: TextInputType.number,
                  controller: _valueController,
                  maxLength: 6,
                  decoration: const InputDecoration(
                    label: Text("Amount"),
                    prefix: Text("\$ "),
                  ),
                ),
              ),
              Expanded(
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Text(_selectedDate == null
                        ? "No date selected"
                        : format.format(_selectedDate!)),
                    IconButton(
                      onPressed: _presentDatePicker,
                      icon: (const Icon(Icons.calendar_month)),
                    )
                  ],
                ),
              )
            ],
          ),
          const SizedBox(
            height: 16,
          ),
          Row(
            children: [
              DropdownButton(
                  value: _selectedCategory,
                  items: Category.values
                      .map(
                        (category) => DropdownMenuItem(
                          value: category,
                          child: Text(category.name.toUpperCase()),
                        ),
                      )
                      .toList(),
                  onChanged: (value) {
                    setState(() {
                      _selectedCategory = value!;
                    });
                  }),
              const Spacer(),
              TextButton(
                onPressed: () {
                  Navigator.pop(context);
                },
                child: const Text("Cancel"),
              ),
              ElevatedButton(
                onPressed: _submitExpenseData,
                child: const Text("Add Expense"),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
