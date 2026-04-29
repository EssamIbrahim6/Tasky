import 'package:flutter/material.dart';

class AlertDialogPriority extends StatefulWidget {
  AlertDialogPriority({super.key, required this.callback});
  void Function(int index) callback;

  @override
  State<AlertDialogPriority> createState() => _AlertDialogPriorityState();
}

class _AlertDialogPriorityState extends State<AlertDialogPriority> {
  int _selectedPriority = 0;
  final List<int> _priorities = List.generate(10, (index) => index);

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      title: const Text('Select Priority'),
      content: Wrap(
        spacing: 8,
        runSpacing: 8,
        children: _priorities.map((priority) {
          final isSelected = _selectedPriority == priority;
          return ItemTaskPriority(
            priority,
            isSelected,
            onTap: () {
              setState(() {
                _selectedPriority = priority;
                widget.callback(_selectedPriority);
              });

              Navigator.of(context).pop(priority);
            },
          );
        }).toList(),
      ),
      actions: [
        TextButton(
          onPressed: () => Navigator.of(context).pop(),
          child: const Text('Cancel'),
        ),
      ],
    );
  }
}

class ItemTaskPriority extends StatelessWidget {
  const ItemTaskPriority(this.index, this.isSelected, {this.onTap});

  final int index;
  final bool isSelected;
  final VoidCallback? onTap;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: AnimatedContainer(
        duration: const Duration(milliseconds: 400),
        padding: const EdgeInsets.symmetric(vertical: 7, horizontal: 20),
        margin: const EdgeInsets.only(right: 3, bottom: 10),
        decoration: BoxDecoration(
          color: isSelected ? const Color(0xff5f53e1) : null,
          borderRadius: BorderRadius.circular(10),
          border: Border.all(
            color: isSelected ? const Color(0xff5f53e1) : Colors.grey,
          ),
        ),
        child: Text(
          index.toString(),
          style: TextStyle(
            color: isSelected ? Colors.white : Colors.black,
            fontWeight: isSelected ? FontWeight.bold : FontWeight.normal,
          ),
        ),
      ),
    );
  }
}
