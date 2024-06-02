import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_messaging/firebase_messaging.dart';

class FirestoreServices {
  static saveUser(String name, email, uid) async {
    await FirebaseFirestore.instance.collection('users').doc(uid).set({
      'email': email,
      'name': name,
      'helped': 0,
      'token': await FirebaseMessaging.instance.getToken(),
      'joined':
          '${DateTime.now().day}/${DateTime.now().month}/${DateTime.now().year}'
    });
    
  }
}
