import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:tasky/auth/data/model/app_user.dart';

abstract class AuthAppFirebase {
  CollectionReference<AppUser> get _getCollection => FirebaseFirestore.instance
      .collection("users")
      .withConverter<AppUser>(
        fromFirestore: (snapshot, options) =>
            AppUser.fromJson(snapshot.data()!),
        toFirestore: (user, options) => user.toJson(),
      );

  Future<void> addUser(AppUser user) async {
    try {
      await _getCollection.doc(user.id).set(user);
    } catch (e) {
      return null;
    }
  }

  Future<void> deleteUser(String id) async {
    await _getCollection.doc(id).delete();
  }

  Future<void> updateUser(AppUser user) async {
    await _getCollection.doc(user.id).update(user.toJson());
  }
}
