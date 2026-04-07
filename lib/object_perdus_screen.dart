import 'package:flutter/material.dart';
import 'package:smart_madaris/object_perdu_form.dart';
import 'package:smart_madaris/screen_ui_template.dart';

class ObjectPerdusScreen extends StatelessWidget {
  const ObjectPerdusScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final List<Map<String, String>> items = [
      {"image": "https://picsum.photos/300?1", "date": "21\\01\\2026"},
      {"image": "https://picsum.photos/300?2", "date": "21\\01\\2026"},
      {"image": "https://picsum.photos/300?3", "date": "21\\01\\2026"},
      {"image": "https://picsum.photos/300?4", "date": "05\\02\\2026"},
      {"image": "https://picsum.photos/300?5", "date": "31\\12\\2026"},
      {"image": "https://picsum.photos/300?6", "date": "22\\11\\2026"},
    ];

    return SafeArea(
      child: GridView.builder(
        padding: const EdgeInsets.all(16),
        itemCount: items.length,
        gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 2,
          mainAxisSpacing: 16,
          crossAxisSpacing: 16,
          childAspectRatio: 0.8,
        ),
        itemBuilder: (context, index) {
          final item = items[index];
          return GalleryCard(image: item["image"]!, date: item["date"]!);
        },
      ),
    );
  }
}

class GalleryCard extends StatelessWidget {
  final String image;
  final String date;

  const GalleryCard({super.key, required this.image, required this.date});

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        Navigator.of(context).push(
          MaterialPageRoute(
            builder: (ctx) => ScreenUiTemplate(
              screenTitle: "Object perdu",
              body: ObjectPerduFormScreen(image: image, date: date),
            ),
          ),
        );
      },
      child: Container(
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(6),
          boxShadow: [
            BoxShadow(
              color: Colors.black.withOpacity(0.15),
              blurRadius: 6,
              offset: const Offset(0, 3),
            ),
          ],
        ),
        child: Column(
          children: [
            /// IMAGE
            Expanded(
              child: Padding(
                padding: const EdgeInsets.all(8),
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(4),
                  child: Image.network(
                    image,
                    width: double.infinity,
                    fit: BoxFit.cover,
                  ),
                ),
              ),
            ),

            /// DATE
            Padding(
              padding: const EdgeInsets.only(bottom: 10),
              child: Text(
                date,
                style: const TextStyle(
                  fontSize: 13,
                  fontWeight: FontWeight.w500,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
