import 'package:mobx/mobx.dart';
import 'package:notes_app/modules/notes/domain/entities/note_entity.dart';
import 'package:notes_app/modules/notes/domain/usecases/add_note.dart';
import 'package:notes_app/modules/notes/domain/usecases/delete_note.dart';
import 'package:notes_app/modules/notes/domain/usecases/get_all_notes.dart';

part 'note_store.g.dart';

// ignore: library_private_types_in_public_api
class NoteStore = _NoteStoreBase with _$NoteStore;

abstract class _NoteStoreBase with Store {
  final GetAllNotes getAllNotes;
  final AddNote addNote;
  final DeleteNote deleteNoteUsecase;

  _NoteStoreBase(this.getAllNotes, this.addNote, this.deleteNoteUsecase) {
    loadNotes();
  }

  @observable
  ObservableList<NoteEntity> notes = ObservableList<NoteEntity>();

  @action
  Future<void> loadNotes() async {
    notes = ObservableList.of(await getAllNotes());
  }

  @action
  Future<void> addNewNote(NoteEntity note) async {
    await addNote(note);
    await loadNotes();
  }

  @action
  Future<void> deleteNote(NoteEntity note) async {
    await deleteNoteUsecase(note);
    notes.removeWhere((n) => n.id == note.id);
  }
}
