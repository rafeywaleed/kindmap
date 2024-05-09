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
          // Handle avatar selection, e.g., save the selected index to a database
          // For now, let's just print the selected index
          print('Selected Avatar Index: $selectedAvatarIndex');
        },
        child: Icon(Icons.check, size: 30, color: Colors.white),
        backgroundColor: Colors.blue,
      ),
    );
  }
}
