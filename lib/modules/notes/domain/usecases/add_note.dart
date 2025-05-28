import 'package:notes_app/modules/notes/domain/entities/note_entity.dart';

abstract class AddNote {
  Future<void> call(NoteEntity note);
}
