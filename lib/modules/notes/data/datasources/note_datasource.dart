import 'package:notes_app/modules/notes/data/models/note_model.dart';

abstract class NoteDatasource {
  Future<List<NoteModel>> getAllNotes();
  Future<void> addNote(NoteModel note);
  Future<void> deleteNote(NoteModel note);
}
