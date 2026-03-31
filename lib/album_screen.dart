import 'package:flutter/material.dart';
import 'package:smart_madaris/album_detail.dart';
import 'package:smart_madaris/screen_ui_template.dart';

class AlbumScreen extends StatefulWidget {
  const AlbumScreen({super.key});

  @override
  State<AlbumScreen> createState() => _ActivitiesScreenState();
}

class _ActivitiesScreenState extends State<AlbumScreen> {
  int selectedStudent = 0;

  final List<Map<String, String>> activities = [
    {"image": "https://picsum.photos/300?1", "title": "Apprendre en jouant"},
    {"image": "https://picsum.photos/300?2", "title": "Learn While Playing"},
    {"image": "https://picsum.photos/300?3", "title": "Apprendre en jouant"},
    {"image": "https://picsum.photos/300?4", "title": "Learn While Playing"},
  ];

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Column(
        children: [
          /// STUDENT SELECTOR
          Padding(
            padding: const EdgeInsets.all(12),
            child: Row(
              children: [
                Expanded(
                  child: studentCard(
                    0,
                    "Issam Ben ayad",
                    "https://i.pravatar.cc/150?img=3",
                  ),
                ),
                const SizedBox(width: 10),
                Expanded(
                  child: studentCard(
                    1,
                    "nizar Ben ayad",
                    "https://i.pravatar.cc/150?img=5",
                  ),
                ),
              ],
            ),
          ),

          const SizedBox(height: 10),

          /// GRID
          Expanded(
            child: GridView.builder(
              padding: const EdgeInsets.symmetric(horizontal: 16),
              itemCount: activities.length,
              gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 2,
                mainAxisSpacing: 16,
                crossAxisSpacing: 16,
                childAspectRatio: 0.75,
              ),
              itemBuilder: (context, index) {
                final item = activities[index];
                return GestureDetector(
                  onTap: () {
                    Navigator.of(context).push(
                      MaterialPageRoute(
                        builder: (builder) => ScreenUiTemplate(
                          screenTitle: 'Album photo',
                          body: AlbumDetailScreen(image: item["image"]!),
                        ),
                      ),
                    );
                  },
                  child: ActivityCard(
                    image: item["image"]!,
                    title: item["title"]!,
                  ),
                );
              },
            ),
          ),
        ],
      ),
    );
  }

  Widget studentCard(int index, String name, String image) {
    bool selected = selectedStudent == index;

    return GestureDetector(
      onTap: () {
        setState(() {
          selectedStudent = index;
        });
      },
      child: Container(
        padding: const EdgeInsets.all(6),
        decoration: BoxDecoration(
          border: Border.all(
            color: selected ? Colors.orange : Colors.black,
            width: 2,
          ),
          borderRadius: BorderRadius.circular(30),
          color: Colors.white,
        ),
        child: Row(
          children: [
            CircleAvatar(backgroundImage: NetworkImage(image)),
            const SizedBox(width: 8),
            Expanded(
              child: Text(
                name,
                style: const TextStyle(fontWeight: FontWeight.w600),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class ActivityCard extends StatelessWidget {
  final String image;
  final String title;

  const ActivityCard({super.key, required this.image, required this.title});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(6),
        boxShadow: [
          BoxShadow(
            blurRadius: 6,
            offset: Offset(0, 3),
            color: Colors.black.withOpacity(0.15),
          ),
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          /// IMAGE
          Hero(
            tag: image,
            child: ClipRRect(
              borderRadius: const BorderRadius.vertical(
                top: Radius.circular(6),
              ),
              child: Image.network(
                image,
                height: 160,
                width: double.infinity,
                fit: BoxFit.cover,
              ),
            ),
          ),

          /// TITLE
          Padding(
            padding: const EdgeInsets.all(10),
            child: Text(
              title,
              style: const TextStyle(fontSize: 14, fontWeight: FontWeight.w500),
            ),
          ),
        ],
      ),
    );
  }
}
