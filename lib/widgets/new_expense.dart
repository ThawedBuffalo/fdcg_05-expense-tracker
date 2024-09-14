import 'package:flutter/material.dart';

class NewExpense extends StatefulWidget {
  const NewExpense({super.key});

  @override
  State<NewExpense> createState() => _NewExpenseState();
}

class _NewExpenseState extends State<NewExpense> {
  final _titleController = TextEditingController();
  final _expenseController = TextEditingController();

  void _presentDatePicker (){
    final now = DateTime.now();
    final firstDate = DateTime(now.year - 1, now.month, now.day);
    showDatePicker(
        context: context,
        firstDate: firstDate,
        lastDate: now);
  }

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
          Row(
            children: [
              Expanded(
                child: TextField(
                  controller: _expenseController,
                  keyboardType: TextInputType.number,
                  decoration: const InputDecoration(
                    label: Text('Amount: '),
                    prefixText: '\$ ',
                  ),
                ),
              ),
              const SizedBox(width: 16,),
              Expanded(
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    const Text('Selected date'),
                    IconButton(
                        onPressed: _presentDatePicker,
                        icon: const Icon(Icons.calendar_month))
                  ],
                ),
              )
            ]
          ),
          Row(
            children: [
              ElevatedButton(
                onPressed: () {
                  Navigator.pop(context);
                },
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
