import 'package:notes_app/modules/notes/domain/entities/note_entity.dart';
import 'package:notes_app/modules/notes/domain/repositories/note_repository.dart';
import 'package:notes_app/modules/notes/data/datasources/note_datasource.dart';

class NoteRepositoryImpl implements NoteRepository {
  final NoteDatasource datasource;

  NoteRepositoryImpl(this.datasource);

  @override
  Future<List<NoteEntity>> getAllNotesEntity() {
    return datasource.getAllNotes();
  }
}
