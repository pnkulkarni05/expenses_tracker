import 'package:uuid/uuid.dart';

const uuid = Uuid();

class Expense {
  Expense({required this.amount, required this.expense, required this.date})
      : id = uuid.v4();
  final String id;
  final double amount;
  final String expense;
  final DateTime date;
}