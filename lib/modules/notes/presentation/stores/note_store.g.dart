// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'note_store.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic, no_leading_underscores_for_local_identifiers

mixin _$NoteStore on _NoteStoreBase, Store {
  late final _$notesAtom = Atom(name: '_NoteStoreBase.notes', context: context);

  @override
  ObservableList<NoteEntity> get notes {
    _$notesAtom.reportRead();
    return super.notes;
  }

  @override
  set notes(ObservableList<NoteEntity> value) {
    _$notesAtom.reportWrite(value, super.notes, () {
      super.notes = value;
    });
  }

  late final _$loadNotesAsyncAction =
      AsyncAction('_NoteStoreBase.loadNotes', context: context);

  @override
  Future<void> loadNotes() {
    return _$loadNotesAsyncAction.run(() => super.loadNotes());
  }

  @override
  String toString() {
    return '''
notes: ${notes}
    ''';
  }
}
