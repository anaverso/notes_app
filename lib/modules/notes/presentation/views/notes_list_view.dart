import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:notes_app/modules/notes/presentation/components/confirm_delete_dialog.dart';
import 'package:notes_app/modules/notes/presentation/stores/note_store.dart';
import 'package:notes_app/modules/notes/presentation/components/note_tile.dart';

class NotesListView extends StatelessWidget {
  NotesListView({super.key});

  final NoteStore store = Modular.get<NoteStore>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Notes'), centerTitle: true),
      body: Observer(
        builder:
            (_) => ListView.builder(
              itemCount: store.notes.length,
              itemBuilder: (context, index) {
                final note = store.notes[index];

                return Dismissible(
                  key: Key(note.id.toString()),
                  background: Container(
                    color: Colors.red,
                    alignment: Alignment.centerRight,
                    padding: const EdgeInsets.symmetric(horizontal: 20),
                    child: const Icon(Icons.delete, color: Colors.white),
                  ),
                  direction: DismissDirection.endToStart,
                  confirmDismiss: (_) => showConfirmDeleteDialog(context),
                  onDismissed: (_) async {
                    await store.deleteNote(note);
                  },
                  child: NoteTile(note: note),
                );
                //return NoteTile(note: note);
              },
            ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Modular.to.pushNamed('/add');
        },
        tooltip: "Add note",
        child: const Icon(Icons.add),
      ),
    );
  }
}
