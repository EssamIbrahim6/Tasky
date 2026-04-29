import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:tasky/features/auth/data/model/app_user.dart';
import 'package:firebase_auth/firebase_auth.dart';


abstract class AuthAppFirebase {
  static CollectionReference<AppUser> get getCollection => FirebaseFirestore.instance
      .collection("users")
      .withConverter<AppUser>(
        fromFirestore: (snapshot, options) =>
            AppUser.fromJson(snapshot.data()!),
        toFirestore: (user, options) => user.toJson(),
      );
  static Future<void> addUser(AppUser user) async {
    try {
      await getCollection.doc(user.id).set(user);
    } catch (e) {
      return null;
    }
  }

 static Future<void> deleteUser(String id) async {
    try {
      await getCollection.doc(id)!.delete();
    } catch (e) {
      return null;
    }
  }


 static Future<void> updateUser(AppUser user) async {
    try {
      await getCollection.doc(user.id).update(user.toJson());
    } catch (e) {
      return null;
    }
  }
 static Future<bool> login({required String email, required String password}) async {
    try {
      var userCredential = await FirebaseAuth.instance
          .signInWithEmailAndPassword(email: email, password: password);
      return true;

      // Navigator.of(context).pop();
      // return true;
    } on FirebaseAuthException catch (e) {
      // Navigator.of(context).pop();

      if (e.code == 'user-not-found') {
        false;
        // DialogApp.showErrorDialog(context, 'No user found');
      } else if (e.code == 'wrong-password') {
        // DialogApp.showErrorDialog(context, 'Wrong password');
      }
    } catch (e) {
      // Navigator.of(context).pop();
      // return false;
    }
    return false;
  }

 static Future<AppUser?> register({required AppUser user}) async {
    try {
      var credential = await FirebaseAuth.instance
          .createUserWithEmailAndPassword(
            email: user.email as String,
            password: user.password as String,
          );
      user.id = credential.user!.uid;
      addUser(user);
      return user;

      // return true;
    } on FirebaseAuthException catch (e) {
      // Navigator.of(context).pop();

      if (e.code == 'weak-password') {
        // DialogApp.showErrorDialog(context, 'Weak password');
      } else if (e.code == 'email-already-in-use') {
        // DialogApp.showErrorDialog(context, 'Email already used');
      }

      // return false;
    } catch (e) {
     
    }
    return null;
  }
}
