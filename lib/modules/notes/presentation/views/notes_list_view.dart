import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:notes_app/modules/notes/presentation/stores/note_store.dart';
import 'package:notes_app/modules/notes/presentation/components/note_tile.dart';

class NotesListView extends StatelessWidget {
  NotesListView({super.key});

  final NoteStore store = Modular.get<NoteStore>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Notas'), centerTitle: true),
      body: Observer(
        builder:
            (_) => ListView.builder(
              itemCount: store.notes.length,
              itemBuilder: (context, index) {
                final note = store.notes[index];
                return NoteTile(note: note);
              },
            ),
      ),
    );
  }
}
