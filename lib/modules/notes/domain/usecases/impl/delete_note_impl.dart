import 'package:notes_app/modules/notes/domain/entities/note_entity.dart';
import 'package:notes_app/modules/notes/domain/repositories/note_repository.dart';
import 'package:notes_app/modules/notes/domain/usecases/delete_note.dart';

class DeleteNoteImpl implements DeleteNote {
  final NoteRepository repository;

  DeleteNoteImpl(this.repository);

  @override
  Future<void> call(NoteEntity note) => repository.deleteNote(note);
}
