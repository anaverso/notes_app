import 'package:flutter_modular/flutter_modular.dart';
import 'package:notes_app/modules/notes/data/datasources/impl/note_datasource_impl.dart';
import 'package:notes_app/modules/notes/data/datasources/note_datasource.dart';
import 'package:notes_app/modules/notes/data/repositories/note_repository_impl.dart';
import 'package:notes_app/modules/notes/domain/entities/note_entity.dart';
import 'package:notes_app/modules/notes/domain/repositories/note_repository.dart';
import 'package:notes_app/modules/notes/domain/usecases/add_note.dart';
import 'package:notes_app/modules/notes/domain/usecases/delete_note.dart';
import 'package:notes_app/modules/notes/domain/usecases/get_all_notes.dart';
import 'package:notes_app/modules/notes/domain/usecases/impl/add_note_impl.dart';
import 'package:notes_app/modules/notes/domain/usecases/impl/delete_note_impl.dart';
import 'package:notes_app/modules/notes/domain/usecases/impl/get_all_notes_impl.dart';
import 'package:notes_app/modules/notes/presentation/stores/note_store.dart';
import 'package:notes_app/modules/notes/presentation/views/add_note_view.dart';
import 'package:notes_app/modules/notes/presentation/views/note_detail_view.dart';
import 'package:notes_app/modules/notes/presentation/views/notes_list_view.dart';
import 'package:notes_app/common/resources/routes.dart';

class AppModule extends Module {
  @override
  void binds(Injector i) {
    // Data
    i.add<NoteDatasource>(NoteDatasourceImpl.new);
    i.add<NoteRepository>(NoteRepositoryImpl.new);
    // Domain
    i.add<GetAllNotes>(GetAllNotesImpl.new);
    i.add<AddNote>(AddNoteImpl.new);
    i.add<DeleteNote>(DeleteNoteImpl.new);
    // Presentation
    i.addSingleton(NoteStore.new);
  }

  @override
  void routes(RouteManager r) {
    r
      ..child(Modular.initialRoute, child: (_) => NotesListView())
      ..child(addNoteRoute, child: (_) => const AddNoteView())
      ..child(
        noteDetailRoute,
        child: (_) {
          final note = r.args.data as NoteEntity;
          return NoteDetailView(note: note);
        },
      );
  }
}
