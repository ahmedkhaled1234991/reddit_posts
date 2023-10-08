import 'package:flutter/material.dart';
import 'package:mvc_pattern/mvc_pattern.dart';

import '../home_controller.dart';

class DeleteDialog extends StatefulWidget {
  final Function(int) onDeleteConfirmed;
  final int index;

  const DeleteDialog(
      {super.key, required this.index, required this.onDeleteConfirmed});

  @override
  _DeleteDialogState createState() => _DeleteDialogState();
}

class _DeleteDialogState extends StateMVC<DeleteDialog> {
  _DeleteDialogState() : super(HomeController()) {
    con = HomeController();
  }
  late HomeController con;

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      backgroundColor: Colors.black,
      insetPadding: const EdgeInsets.symmetric(horizontal: 20),
      title: const Text(
        "Are you sure?",
        style: TextStyle(color: Colors.white),
      ),
      content: const Text(
        "You cannot restore comments that have been deleted.",
        style: TextStyle(color: Colors.white),
      ),
      actions: [
        ElevatedButton(
          style: ElevatedButton.styleFrom(
            backgroundColor: Colors.grey[800],
            fixedSize: const Size(130, 40),
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(22),
            ),
          ),
          onPressed: () {
            Navigator.pop(context);
          },
          child: const Text(
            "CANCEL",
            style: TextStyle(color: Colors.white),
          ),
        ),
        ElevatedButton(
          style: ElevatedButton.styleFrom(
            backgroundColor: Colors.red,
            fixedSize: const Size(130, 40),
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(22),
            ),
          ),
          onPressed: () {
            widget.onDeleteConfirmed(widget.index);
            Navigator.pop(context);
          },
          child: const Text(
            "DELETE",
            style: TextStyle(color: Colors.white),
          ),
        ),
      ],
    );
  }
}
