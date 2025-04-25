import 'package:notes_app/modules/notes/domain/entities/note_entity.dart';

abstract class GetAllNotes {
  Future<List<NoteEntity>> call();
}
