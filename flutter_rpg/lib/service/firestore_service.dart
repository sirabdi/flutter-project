import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter_rpg/models/character.dart';
import 'package:logger/logger.dart';

class FirestoreService {
  static final Logger _logger = Logger();

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
}
