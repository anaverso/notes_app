import 'package:notes_app/modules/notes/domain/entities/note_entity.dart';

abstract class NoteRepository {
  Future<List<NoteEntity>> getAllNotesEntity();
}
