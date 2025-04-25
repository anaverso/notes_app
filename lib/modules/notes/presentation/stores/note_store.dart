import 'package:mobx/mobx.dart';
import 'package:notes_app/modules/notes/domain/entities/note_entity.dart';
import 'package:notes_app/modules/notes/domain/usecases/get_all_notes.dart';

part 'note_store.g.dart';

class NoteStore = _NoteStoreBase with _$NoteStore;

abstract class _NoteStoreBase with Store {
  final GetAllNotes getAllNotes;

  _NoteStoreBase(this.getAllNotes) {
    loadNotes();
  }

  @observable
  ObservableList<NoteEntity> notes = ObservableList<NoteEntity>();

  @action
  Future<void> loadNotes() async {
    final result = await getAllNotes();
    notes = ObservableList.of(result);
    print('Notas carregadas: ${notes.map((e) => e.title).toList()}');
  }
}
