import "package:cloud_firestore/cloud_firestore.dart";
import "package:firebase_auth/firebase_auth.dart";
import "package:flutter/material.dart";

class Avatars extends StatefulWidget {
  const Avatars({super.key});

  @override
  State<Avatars> createState() => _AvatarsState();
}

class _AvatarsState extends State<Avatars> {
  int selectedAvatarIndex = -1;
  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    return Scaffold(
      appBar: AppBar(
        title: Text("Select your Avatar: "),
        automaticallyImplyLeading: false,
      ),
      body: GridView.builder(
        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 2,
        ),
        itemCount: 8,
        itemBuilder: (context, index) {
          return GestureDetector(
            onTap: () {
              setState(() {
                selectedAvatarIndex = index;
              });
            },
            child: Container(
              padding: EdgeInsets.all(8),
              margin: EdgeInsets.all(8),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(100),
                border: Border.all(
                  color: selectedAvatarIndex == index
                      ? Colors.green
                      : Colors.transparent,
                  width: 5,
                ),
              ),
              child: Image.asset(
                'assets/images/avatar${index + 1}.png',
                width: size.width * 0.3,
                height: size.width * 0.3,
              ),
            ),
          );
        },
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          uploadindex();
          Navigator.of(context).pushNamed('/home');
          print('Selected Avatar Index: $selectedAvatarIndex');
        },
        child: Icon(Icons.check, size: 30, color: Colors.white),
        backgroundColor: Colors.blue,
      ),
    );
  }

  Future<void> uploadindex() async {
    try {
      User? user = FirebaseAuth.instance.currentUser;
      if (user != null) {
        await FirebaseFirestore.instance
            .collection('users')
            .doc(user.uid)
            .update({'avatarIndex': selectedAvatarIndex + 1});
      }
    } catch (e) {
      print('Error uploading avatar index: $e');
    }
  }
}
