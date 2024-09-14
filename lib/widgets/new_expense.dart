import 'package:flutter/material.dart';

class NewExpense extends StatefulWidget {
  const NewExpense({super.key});

  @override
  State<NewExpense> createState() => _NewExpenseState();
}

class _NewExpenseState extends State<NewExpense> {
  final _titleController = TextEditingController();
  final _expenseController = TextEditingController();

  @override
  void dispose() {
    _titleController.dispose();
    _expenseController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(16),
      child: Column(
        children: [
          TextField(
            controller: _titleController,
            maxLength: 50,
            decoration: const InputDecoration(
              label: Text('Expense title: '),
            ),
          ),
          TextField(
            controller: _expenseController,
            keyboardType: TextInputType.number,
            decoration: const InputDecoration(
              label: Text('Amount: '),
              prefixText: '\$ ',
            ),
          ),
          Row(
            children: [
              ElevatedButton(
                onPressed: () {  },
                child: const Text('Cancel'),
              ),
              ElevatedButton(
                onPressed: () {
                  print(_titleController.text);
                  print(_expenseController.text);
                },
                child: const Text('Save Expense'),
              ),

            ],
          ),
        ],
      ),
    );
  }
}
