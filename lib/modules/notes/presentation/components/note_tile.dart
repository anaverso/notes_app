import 'package:flutter/material.dart';
import 'package:notes_app/modules/notes/domain/entities/note_entity.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:notes_app/common/resources/routes.dart';

class NoteTile extends StatelessWidget {
  final NoteEntity note;

  const NoteTile({super.key, required this.note});

  @override
  Widget build(BuildContext context) {
    return ListTile(
      title: Text(note.title),
      subtitle: Text(note.description),
      onTap: () {
        Modular.to.pushNamed(noteDetailRoute, arguments: note);
      },
    );
  }
}
