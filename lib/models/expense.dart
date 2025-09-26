import "package:flutter/material.dart";
import 'package:intl/intl.dart';
import "package:uuid/uuid.dart";

final formatter =
    DateFormat.yMd(); // set up to format a date pt1

const uuid = Uuid();

enum Category {
  food,
  travel,
  leisure,
  work,
} //allows a custom type that has predetermined values

const categoryIcons = {
  Category.food: Icons.lunch_dining,
  Category.travel: Icons.flight_takeoff,
  Category.leisure: Icons.movie,
  Category.work: Icons.work,
}; //map of category specific icons

class Expense {
  Expense({
    required this.title,
    required this.amount,
    required this.date,
    required this.category,
  }) : id = uuid.v4();
  //generates a unique id when initailized

  final String id;
  final String title;
  final double amount;
  final DateTime date; //a provided data type
  final Category category;

  String get formattedDate {
    return formatter.format(
      date,
    ); //pt 2 returned formated date
  }
}

class ExpenseBucket {
  // groups togther all the category expenses
  const ExpenseBucket({
    required this.category,
    required this.expenses,
  });

  ExpenseBucket.forCategory(
    List<Expense> allExpenses,
    this.category,
  ) : expenses = allExpenses
          .where((expense) => expense.category == category)
          .toList();

  final Category category;
  final List<Expense> expenses;

  double get totalExpenses {
    double sum = 0;

    for (final expense in expenses) {
      //goes through the list
      sum += expense.amount;
    }

    return sum;
  }
}
