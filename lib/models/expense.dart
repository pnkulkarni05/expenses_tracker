import 'package:uuid/uuid.dart';

const uuid = Uuid();

enum Category { food, travel, leisure, work }

class Expense {
  Expense({
    required this.amount,
    required this.expense,
    required this.date,
    required this.category,
  }) : id = uuid.v4();
  final String id;
  final double amount;
  final String expense;
  final DateTime date;
  final Category category;
}
