import 'package:flutter/material.dart';
import 'package:notes_app/modules/notes/domain/entities/note_entity.dart';

class NoteDetailView extends StatelessWidget {
  final NoteEntity note;

  const NoteDetailView({super.key, required this.note});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text(note.title)),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Text(note.description),
      ),
    );
  }
}
