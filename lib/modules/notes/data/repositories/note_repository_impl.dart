import 'package:notes_app/modules/notes/data/models/note_model.dart';
import 'package:notes_app/modules/notes/domain/entities/note_entity.dart';
import 'package:notes_app/modules/notes/domain/repositories/note_repository.dart';
import 'package:notes_app/modules/notes/data/datasources/note_datasource.dart';

class NoteRepositoryImpl implements NoteRepository {
  final NoteDatasource datasource;

  NoteRepositoryImpl(this.datasource);

  @override
  Future<List<NoteEntity>> getAllNotesEntity() async {
    final models = await datasource.getAllNotes();
    return models;
  }

  @override
  Future<void> addNote(NoteEntity note) async {
    final model = NoteModel(
      id: note.id,
      title: note.title,
      description: note.description,
    );
    await datasource.addNote(model);
  }

  @override
  Future<void> deleteNote(NoteEntity note) async {
    final model = NoteModel(
      id: note.id,
      title: note.title,
      description: note.description,
    );
    await datasource.deleteNote(model);
  }
}
