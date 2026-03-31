import 'package:flutter/material.dart';

class ExercisesScreen extends StatelessWidget {
  ExercisesScreen({super.key});

  final List<Map<String, String>> items = [
    {"title": "Exercices du jour", "date": "02/01/2026"},
    {"title": "Exercices du jour", "date": "01/01/2026"},
    {"title": "Leçon du jour", "date": "01/01/2026"},
    {"title": "Exercices du jour", "date": "04/01/2026"},
    {"title": "Exercices du jour", "date": "03/01/2026"},
    {"title": "Exercices du jour", "date": "05/01/2026"},
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xfff4f4f4),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(16),
          child: Column(
            children: [
              /// Search Bar
              TextField(
                decoration: InputDecoration(
                  hintText: "Recherche",
                  prefixIcon: Icon(Icons.search),
                  filled: true,
                  fillColor: Color(0xffe8ded6),
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(30),
                    borderSide: BorderSide.none,
                  ),
                ),
              ),

              const SizedBox(height: 20),

              /// Grid
              Expanded(
                child: GridView.builder(
                  itemCount: items.length,
                  gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 2,
                    crossAxisSpacing: 16,
                    mainAxisSpacing: 16,
                    childAspectRatio: 0.9,
                  ),
                  itemBuilder: (context, index) {
                    return ExerciseCard(
                      title: items[index]["title"]!,
                      date: items[index]["date"]!,
                    );
                  },
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class ExerciseCard extends StatelessWidget {
  final String title;
  final String date;

  const ExerciseCard({required this.title, required this.date});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(12),
        boxShadow: [
          BoxShadow(color: Colors.black12, blurRadius: 6, offset: Offset(0, 3)),
        ],
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Icon(Icons.menu_book_outlined, size: 70),
          const SizedBox(height: 12),
          Text(title, style: TextStyle(fontWeight: FontWeight.w600)),
          Text(date, style: TextStyle(color: Colors.grey)),
        ],
      ),
    );
  }
}
