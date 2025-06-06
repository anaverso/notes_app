import 'package:notes_app/modules/notes/domain/entities/note_entity.dart';
import 'package:notes_app/modules/notes/domain/repositories/note_repository.dart';
import 'package:notes_app/modules/notes/domain/usecases/add_note.dart';

class AddNoteImpl implements AddNote {
  final NoteRepository repository;

  AddNoteImpl(this.repository);

  @override
  Future<void> call(String title, String description) {
    final noteEntity = NoteEntity(
      id: DateTime.now().millisecondsSinceEpoch,
      title: title,
      description: description,
    );
    return repository.addNote(noteEntity);
  }
}
