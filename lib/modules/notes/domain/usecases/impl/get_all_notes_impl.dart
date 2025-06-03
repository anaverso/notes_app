import 'package:notes_app/modules/notes/domain/entities/note_entity.dart';
import 'package:notes_app/modules/notes/domain/repositories/note_repository.dart';
import 'package:notes_app/modules/notes/domain/usecases/get_all_notes.dart';

class GetAllNotesImpl implements GetAllNotes {
  final NoteRepository repository;

  GetAllNotesImpl(this.repository);

  @override
  Future<List<NoteEntity>> call() => repository.getAllNotesEntity();
}
