import 'package:flutter/material.dart';
import 'package:isar/isar.dart';
import 'package:path_provider/path_provider.dart';
import 'package:prueba/models/note.dart';

class NoteDatabase extends ChangeNotifier {
  static late Isar isar;

    // I N I T I A L I Z E D A T A B A S E
    static Future<void> initialize() async {
        final dir = await getApplicationDocumentsDirectory();
        isar = await Isar.open(
          [NoteSchema],
          directory: dir.path,
        );
    }
    //ist of notes
    final List<Note> currentNotes = [];

    // C R E A T E
    Future<void> addNote(String textFromUser) async {
        //create
        final newNote = Note()..text = textFromUser;

        //save
        await isar.writeTxn(() => isar.notes.put(newNote));

        //re-read from db
        fetchNotes();
    }

    // R E A D
    Future<void> fetchNotes() async {
        List<Note> fetchedNotes = await isar.notes.where().findAll();
        currentNotes.clear();
        currentNotes.addAll(fetchedNotes);
        notifyListeners();
    }

    // U P D A T E
    Future<void> updateNote(int id, String newText) async {
        //update
        final existingNote = await isar.notes.get(id);
        if (existingNote != null) {
            existingNote.text = newText;
            await isar.writeTxn(() => isar.notes.put(existingNote));
            await fetchNotes();
        }
        
    }
    // D E L E T E
    Future <void> deleteNote (int id) async {
        //delete
        await isar.writeTxn(() => isar.notes.delete(id));
        await fetchNotes();
    }
}