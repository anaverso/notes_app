import 'package:notes_app/modules/notes/domain/entities/note_entity.dart';
import 'package:notes_app/modules/notes/domain/repositories/note_repository.dart';
import 'package:notes_app/modules/notes/domain/usecases/add_note.dart';

class AddNoteImpl implements AddNote {
  final NoteRepository repository;

  AddNoteImpl(this.repository);

  @override
  Future<void> call(NoteEntity note) => repository.addNote(note);
}
