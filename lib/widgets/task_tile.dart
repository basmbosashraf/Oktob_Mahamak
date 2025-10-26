import 'package:flutter/material.dart';

class TaskTile extends StatelessWidget {
  final String task;
  final bool isCompleted;
  final VoidCallback onDelete;
  final VoidCallback onToggle;

  const TaskTile({
    super.key,
    required this.task,
    required this.isCompleted,
    required this.onDelete,
    required this.onToggle,
  });

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: const EdgeInsets.symmetric(vertical: 8),
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(15)),
      elevation: 2,
      child: ListTile(
        leading: Checkbox(
          value: isCompleted,
          activeColor: const Color(0xFFFFB6C1),
          onChanged: (_) => onToggle(),
        ),
        title: Text(
          task,
          textAlign: TextAlign.right,
          style: TextStyle(
            fontSize: 19,
            decoration:
                isCompleted ? TextDecoration.lineThrough : TextDecoration.none,
            color: isCompleted ? Colors.grey : Colors.black,
          ),
        ),
        trailing: IconButton(
          icon: const Icon(Icons.delete, color: Colors.redAccent),
          onPressed: onDelete,
        ),
      ),
    );
  }
}
