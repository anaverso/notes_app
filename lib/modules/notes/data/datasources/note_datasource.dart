import 'package:notes_app/modules/notes/domain/entities/note_entity.dart';

abstract class NoteDatasource {
  Future<List<NoteEntity>> getAllNotes();
}
