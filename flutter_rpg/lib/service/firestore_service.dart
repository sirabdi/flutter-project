import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter_rpg/models/character/character.dart';
import 'package:flutter_rpg/models/todo/todo.dart';
import 'package:logger/logger.dart';

class FirestoreService {
  static final Logger _logger = Logger();

  // CHARACTERS
  static final ref = FirebaseFirestore.instance
      .collection('characters')
      .withConverter(
        fromFirestore: Character.fromFirestore,
        toFirestore: (Character c, _) => c.toFirestore(),
      );

  // add character to firestore
  static Future<void> addCharacter(Character character) async {
    try {
      await ref.doc(character.id).set(character);
    } catch (e) {
      _logger.d('Error adding character', error: e);
    }
  }

  // get character from firestore
  static Future<QuerySnapshot<Character>> getCharacters() async {
    try {
      return await ref.get();
    } catch (e) {
      _logger.e('Error fetching characters', error: e);
      rethrow; // Re-throw the error to handle it in the calling code
    }
  }

  // update character in firestore
  static Future<void> updateCharacter(Character character) async {
    try {
      await ref.doc(character.id).update({
        'stats': character.statsAsMap,
        'points': character.points,
        'skills': character.skills.map((skill) => skill.id).toList(),
        'isFav': character.isFav,
      });
    } catch (e) {
      _logger.e('Error updating character', error: e);
    }
  }

  // delete character from firestore
  static Future<void> deleteCharacter(Character character) async {
    try {
      await ref.doc(character.id).delete();
    } catch (e) {
      _logger.e('Error deleting character', error: e);
    }
  }

  // --------------------------- //

  // TODOS
  static final refTodo = FirebaseFirestore.instance
      .collection('todos')
      .withConverter(
        fromFirestore: Todo.fromFirestore,
        toFirestore: (Todo c, _) => c.toFirestore(),
      );

  // add todo to firestore
  static Future<void> addTodo(Todo todo) async {
    try {
      await refTodo.doc(todo.id).set(todo);
    } catch (e) {
      _logger.d('Error adding todos', error: e);
    }
  }

  // get todo from firestore
  static Future<QuerySnapshot<Todo>> getTodos() async {
    try {
      return await refTodo.get();
    } catch (e) {
      _logger.e('Error fetching characters', error: e);
      rethrow; // Re-throw the error to handle it in the calling code
    }
  }
}
