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

                return Dismissible(
                  key: Key(note.id.toString()),
                  background: Container(
                    color: Colors.red,
                    alignment: Alignment.centerRight,
                    padding: const EdgeInsets.symmetric(horizontal: 20),
                    child: const Icon(Icons.delete, color: Colors.white),
                  ),
                  direction: DismissDirection.endToStart,
                  confirmDismiss: (_) async {
                    return await showDialog(
                      context: context,
                      builder:
                          (context) => AlertDialog(
                            title: const Text("Confirm Delete"),
                            content: const Text(
                              "Do you want to delete this note?",
                            ),
                            actions: [
                              TextButton(
                                onPressed:
                                    () => Navigator.of(context).pop(false),
                                child: const Text("Cancel"),
                              ),
                              TextButton(
                                onPressed:
                                    () => Navigator.of(context).pop(true),
                                child: const Text(
                                  "Delete",
                                  style: TextStyle(color: Colors.red),
                                ),
                              ),
                            ],
                          ),
                    );
                  },
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
