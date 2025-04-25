import 'dart:convert';
import 'package:flutter/services.dart';
import 'package:notes_app/modules/notes/data/datasources/note_datasource.dart';
import 'package:notes_app/modules/notes/data/models/note_model.dart';
import 'package:notes_app/modules/notes/domain/entities/note_entity.dart';

class NoteDatasourceImpl implements NoteDatasource {
  @override
  Future<List<NoteEntity>> getAllNotes() async {
    final jsonString = await rootBundle.loadString(
      'assets/mock/mock_notes.json',
    );
    final List<dynamic> jsonList = json.decode(jsonString);
    return jsonList.map((json) => NoteModel.fromJson(json)).toList();
  }
}
