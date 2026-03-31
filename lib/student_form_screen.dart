import 'package:flutter/material.dart';

class StudentFormScreen extends StatelessWidget {
  const StudentFormScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xffF5F5F5),
      body: Column(
        children: [
          const SizedBox(height: 20),
          // PROFILE IMAGE
          const Padding(
            padding: EdgeInsets.symmetric(horizontal: 24),
            child: ProfileImage(),
          ),
          const SizedBox(height: 20),

          // FORM
          Expanded(
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20),
              child: ListView(
                children: const [
                  EditableField(hint: "Nom"),
                  EditableField(hint: "Prenom"),
                  EditableField(hint: "Date de naissance"),
                  EditableField(hint: "classe", showEdit: false),
                  EditableField(hint: "Id Massar", showEdit: false),
                  EditableField(hint: "Tel"),
                  EditableField(hint: "Adresse"),

                  SizedBox(height: 20),

                  // BUTTON
                  Center(child: _UpdateButton()),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class _UpdateButton extends StatelessWidget {
  const _UpdateButton();

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 45,
      width: 140,
      decoration: BoxDecoration(
        gradient: const LinearGradient(
          colors: [Colors.orange, Colors.deepOrange],
        ),
        borderRadius: BorderRadius.circular(30),
      ),
      child: const Center(
        child: Text(
          "MODIFIER",
          style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
        ),
      ),
    );
  }
}

class ProfileImage extends StatelessWidget {
  const ProfileImage({super.key});

  @override
  Widget build(BuildContext context) {
    return Stack(
      alignment: Alignment.center,
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: const [
            Icon(Icons.chevron_left, size: 32),
            Icon(Icons.chevron_right, size: 32),
          ],
        ),

        Stack(
          children: [
            Container(
              height: 150,
              width: 150,
              decoration: BoxDecoration(
                color: Colors.orange,
                borderRadius: BorderRadius.circular(20),
                image: const DecorationImage(
                  image: AssetImage("assets/student.jpg"),
                  fit: BoxFit.cover,
                ),
              ),
            ),
            Positioned(
              bottom: 8,
              right: 8,
              child: Container(
                padding: const EdgeInsets.all(6),
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(8),
                ),
                child: const Icon(Icons.edit, size: 18),
              ),
            ),
          ],
        ),
      ],
    );
  }
}

class EditableField extends StatelessWidget {
  final String hint;
  final bool showEdit;

  const EditableField({super.key, required this.hint, this.showEdit = true});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(vertical: 6),
      padding: const EdgeInsets.symmetric(horizontal: 14),
      decoration: BoxDecoration(
        color: const Color(0xffFFF6EE),
        borderRadius: BorderRadius.circular(30),
        border: Border.all(color: Colors.black12),
      ),
      child: Row(
        children: [
          Expanded(
            child: TextField(
              decoration: InputDecoration(
                hintText: hint,
                border: InputBorder.none,
              ),
            ),
          ),
          if (showEdit) const Icon(Icons.edit, size: 18),
        ],
      ),
    );
  }
}
