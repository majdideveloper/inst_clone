import 'dart:developer';
import 'dart:typed_data';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:instg_app/models/user.dart' as model;
import 'package:instg_app/resources/storage_methods.dart';

class AuthMethods {
  final FirebaseAuth _auth = FirebaseAuth.instance;
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;

  //!!!!!get all user details
  Future<model.User> getUserDetails() async {
    User currentUser = _auth.currentUser!;

    DocumentSnapshot snap =
        await _firestore.collection('users').doc(currentUser.uid).get();

    return model.User.fromSnap(snap);
  }

  //!!!!! sign up User
  Future<String> signUpUser({
    required String email,
    required String password,
    required String username,
    required String bio,
    required Uint8List file,
  }) async {
    String res = 'some error occurred';

    try {
      if (email.isNotEmpty ||
          password.isNotEmpty ||
          bio.isNotEmpty ||
          username.isNotEmpty ||
          file != null) {
        UserCredential userCredential = await _auth
            .createUserWithEmailAndPassword(email: email, password: password);
        log(userCredential.user!.uid);
        //!!!!
        String photoUrl = await StorageMethods()
            .uploadImageToStorage('profilePics', file, false);

        //!!!! add user to our database

        model.User user = model.User(
          username: username,
          uid: userCredential.user!.uid,
          email: email,
          bio: bio,
          followers: [],
          following: [],
          photoUrl: photoUrl,
        );

        await _firestore
            .collection('users')
            .doc(userCredential.user!.uid)
            .set(user.toJson());
        res = 'success';
      }
    } catch (err) {
      res = err.toString();
    }

    return res;
  }

  //!!!!!Login in user
  Future<String> loginUser({
    required String email,
    required String password,
  }) async {
    String res = 'some error occurred';
    try {
      await _auth.signInWithEmailAndPassword(email: email, password: password);

      res = 'login success';
    } catch (err) {
      String res = err.toString();
    }
    return res;
  }
}
