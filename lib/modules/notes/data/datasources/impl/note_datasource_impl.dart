import 'dart:convert';
import 'package:notes_app/modules/notes/data/datasources/note_datasource.dart';
import 'package:notes_app/modules/notes/data/models/note_model.dart';
import 'package:shared_preferences/shared_preferences.dart';

class NoteDatasourceImpl implements NoteDatasource {
  static const _key = 'notes';

  Future<SharedPreferences> get _prefs async =>
      await SharedPreferences.getInstance();

  Future<void> _saveNotes(List<NoteModel> notes) async {
    final prefs = await _prefs;
    final encoded = json.encode(notes.map((n) => n.toJson()).toList());
    await prefs.setString(_key, encoded);
  }

  @override
  Future<List<NoteModel>> getAllNotes() async {
    final prefs = await _prefs;
    final jsonString = prefs.getString(_key);
    if (jsonString == null) return [];
    final List decoded = json.decode(jsonString);
    return decoded.map((e) => NoteModel.fromJson(e)).toList();
  }

  @override
  Future<void> addNote(NoteModel note) async {
    final notes = await getAllNotes();
    final newNotes = [...notes, note];
    await _saveNotes(newNotes);
  }

  @override
  Future<void> deleteNote(NoteModel note) async {
    final notes = await getAllNotes();
    notes.removeWhere((n) => n.id == note.id);
    await _saveNotes(notes);
  }
}
