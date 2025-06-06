import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';

Future<bool?> showConfirmDeleteDialog(BuildContext context) => showDialog<bool>(
  context: context,
  builder:
      (context) => AlertDialog(
        title: const Text("Confirm Delete"),
        content: const Text("Do you want to delete this note?"),
        actions: [
          TextButton(
            onPressed: () => Modular.to.pop(false),
            child: const Text("Cancel"),
          ),
          TextButton(
            onPressed: () => Modular.to.pop(true),
            child: const Text("Delete", style: TextStyle(color: Colors.red)),
          ),
        ],
      ),
);
