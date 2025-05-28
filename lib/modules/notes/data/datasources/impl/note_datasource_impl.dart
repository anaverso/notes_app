import 'dart:convert';
import 'package:notes_app/modules/notes/data/datasources/note_datasource.dart';
import 'package:notes_app/modules/notes/data/models/note_model.dart';
import 'package:shared_preferences/shared_preferences.dart';

class NoteDatasourceImpl implements NoteDatasource {
  static const _key = 'notes';

  @override
  Future<List<NoteModel>> getAllNotes() async {
    final prefs = await SharedPreferences.getInstance();
    final jsonString = prefs.getString(_key);
    if (jsonString == null) return [];
    final List decoded = json.decode(jsonString);
    return decoded.map((e) => NoteModel.fromJson(e)).toList();
  }

  @override
  Future<void> addNote(NoteModel note) async {
    final prefs = await SharedPreferences.getInstance();
    final notes = await getAllNotes();
    final newNotes = [...notes, note];
    final encoded = json.encode(newNotes.map((n) => n.toJson()).toList());
    await prefs.setString(_key, encoded);
  }

  @override
  Future<void> deleteNote(NoteModel note) async {
    final prefs = await SharedPreferences.getInstance();
    final notes = await getAllNotes(); // já traz como List<NoteModel>
    final updatedNotes = notes.where((n) => n.id != note.id).toList();

    final encoded = json.encode(updatedNotes.map((n) => n.toJson()).toList());
    await prefs.setString(_key, encoded);
  }
}
