import 'package:notes_app/modules/notes/domain/entities/note_entity.dart';

abstract class DeleteNote {
  Future<void> call(NoteEntity note);
}
