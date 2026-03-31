import 'package:flutter/material.dart';
import 'package:smart_madaris/screen_ui_template.dart';

import 'cour_exercise_screen.dart';

class CoursesScreen extends StatelessWidget {
  const CoursesScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xffF6F6F6),
      body: Column(
        children: [
          const SizedBox(height: 12),

          // STUDENTS
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16),
            child: Row(
              children: const [
                StudentChip(
                  name: "Issam Ben ayad",
                  image: "assets/user1.png",
                  selected: true,
                ),
                SizedBox(width: 10),
                StudentChip(name: "nizar Ben ayad", image: "assets/user2.png"),
              ],
            ),
          ),

          const SizedBox(height: 12),

          // SEARCH
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16),
            child: Container(
              padding: const EdgeInsets.symmetric(horizontal: 16),
              decoration: BoxDecoration(
                color: const Color(0xffFFF3E8),
                borderRadius: BorderRadius.circular(30),
              ),
              child: const TextField(
                decoration: InputDecoration(
                  hintText: "Recherche",
                  border: InputBorder.none,
                  suffixIcon: Icon(Icons.search),
                ),
              ),
            ),
          ),

          const SizedBox(height: 16),

          // SUBJECTS
          Expanded(
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16),
              child: ListView(
                children: const [
                  SubjectCard(title: "Francais", icon: "assets/cours/1.png"),
                  SubjectCard(title: "Arabe", icon: "assets/cours/2.png"),
                  SubjectCard(
                    title: "Mathématique",
                    icon: "assets/cours/3.png",
                    badge: 3,
                  ),
                  SubjectCard(title: "English", icon: "assets/cours/4.png"),
                  SubjectCard(
                    title: "SVT",
                    icon: "assets/cours/5.png",
                    badge: 3,
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class StudentChip extends StatelessWidget {
  final String name;
  final String image;
  final bool selected;

  const StudentChip({
    super.key,
    required this.name,
    required this.image,
    this.selected = false,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(6),
      decoration: BoxDecoration(
        color: selected ? Colors.orange : Colors.white,
        borderRadius: BorderRadius.circular(30),
      ),
      child: Row(
        children: [
          CircleAvatar(radius: 20, backgroundImage: AssetImage(image)),
          const SizedBox(width: 6),
          Text(
            name,
            style: TextStyle(
              color: selected ? Colors.white : Colors.black,
              fontSize: 14,
              fontWeight: FontWeight.bold,
            ),
          ),
        ],
      ),
    );
  }
}

class SubjectCard extends StatelessWidget {
  final String title;
  final String icon;
  final int badge;

  const SubjectCard({
    super.key,
    required this.title,
    required this.icon,
    this.badge = 0,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.of(context).push(
          MaterialPageRoute(
            builder: (_) => ScreenUiTemplate(
              screenTitle: "Cours et exercise",
              body: ExercisesScreen(),
            ),
          ),
        );
      },
      child: Container(
        margin: const EdgeInsets.symmetric(vertical: 8),
        padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 18),
        decoration: BoxDecoration(
          color: const Color(0xffFFF3E8),
          borderRadius: BorderRadius.circular(12),
        ),
        child: Row(
          children: [
            Expanded(
              child: Text(
                title,
                style: const TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),

            Stack(
              clipBehavior: Clip.none,
              children: [
                Image.asset(icon, height: 40),

                if (badge > 0)
                  Positioned(
                    right: -6,
                    top: -6,
                    child: Container(
                      padding: const EdgeInsets.all(4),
                      decoration: const BoxDecoration(
                        color: Colors.red,
                        shape: BoxShape.circle,
                      ),
                      child: Text(
                        badge.toString(),
                        style: const TextStyle(
                          color: Colors.white,
                          fontSize: 10,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                  ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
