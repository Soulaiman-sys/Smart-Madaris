import 'package:flutter/material.dart';

class CantineScreen extends StatelessWidget {
  const CantineScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Column(
        children: [
          /// SEARCH BAR
          Padding(
            padding: const EdgeInsets.all(16),
            child: TextField(
              decoration: InputDecoration(
                hintText: "Recherche",
                prefixIcon: Icon(Icons.search),
                filled: true,
                fillColor: Colors.white,
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(30),
                  borderSide: BorderSide.none,
                ),
              ),
            ),
          ),

          /// DATE
          Text(
            "01/01/2026",
            style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
          ),

          const SizedBox(height: 20),

          /// GRID
          Expanded(
            child: GridView.count(
              padding: const EdgeInsets.symmetric(horizontal: 20),
              crossAxisCount: 2,
              childAspectRatio: 0.8,
              children: const [
                MealCard(
                  day: "Lundi",
                  image: "https://picsum.photos/200",
                  description: "Riz, boeuf teriyaki\nSalade de légumes\nPomme",
                ),
                MealCard(
                  day: "Mardi",
                  image: "https://picsum.photos/201",
                  description: "Riz, poulet katsu\nSalade de légumes\nPudding",
                ),
                MealCard(
                  day: "Mercredi",
                  image: "https://picsum.photos/202",
                  description:
                      "Onigiri, omelette aux œufs\nSalade de légumes\nPoire",
                ),
                MealCard(
                  day: "Jeudi",
                  image: "https://picsum.photos/203",
                  description:
                      "Riz, tempura de crevettes\nSalade de légumes\nYaourt",
                ),
              ],
            ),
          ),

          /// BUTTON
          Padding(
            padding: const EdgeInsets.only(bottom: 20),
            child: ElevatedButton(
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.orange,
                padding: const EdgeInsets.symmetric(
                  horizontal: 40,
                  vertical: 14,
                ),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(30),
                ),
              ),
              onPressed: () {},
              child: const Text(
                "COMMANDE",
                style: TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                  color: Colors.white,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class MealCard extends StatefulWidget {
  final String day;
  final String image;
  final String description;

  const MealCard({
    super.key,
    required this.day,
    required this.image,
    required this.description,
  });

  @override
  State<MealCard> createState() => _MealCardState();
}

class _MealCardState extends State<MealCard> {
  bool selected = false;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        /// IMAGE + DAY
        Stack(
          alignment: Alignment.center,
          children: [
            CircleAvatar(
              radius: 45,
              backgroundImage: NetworkImage(widget.image),
            ),

            Positioned(
              left: 0,
              child: Transform.rotate(
                angle: -1.2,
                child: Text(
                  widget.day,
                  style: const TextStyle(
                    fontSize: 14,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
            ),
          ],
        ),

        const SizedBox(height: 8),

        /// DESCRIPTION
        Container(
          padding: const EdgeInsets.all(10),
          decoration: BoxDecoration(
            color: const Color(0xFFFFD54F),
            borderRadius: BorderRadius.circular(12),
          ),
          child: Text(
            widget.description,
            style: const TextStyle(fontSize: 12, fontWeight: FontWeight.bold),
          ),
        ),

        const SizedBox(height: 8),

        /// CHECKBOX
        Checkbox(
          value: selected,
          //checkColor: Colors.green,
          activeColor: Colors.green,
          onChanged: (v) {
            setState(() {
              selected = v!;
            });
          },
        ),
      ],
    );
  }
}
