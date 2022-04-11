import 'dart:typed_data';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:instg_app/resources/storage_methods.dart';

class AuthMethods {
  final FirebaseAuth _auth = FirebaseAuth.instance;
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;

  //! sign up User
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
        print(userCredential.user!.uid);
        //!!!!
        String photoUrl = await StorageMethods()
            .uploadImageToStorage('profilePics', file, false);

        //!!!! add user to our database
        await _firestore.collection('users').doc(userCredential.user!.uid).set({
          'username': username,
          'uid': userCredential.user!.uid,
          'email': email,
          'bio': bio,
          'followers': [],
          'following': [],
          'photoUrl': photoUrl,
        });
        res = 'success';
      }
    } catch (err) {
      res = err.toString();
    }

    return res;
  }
}
