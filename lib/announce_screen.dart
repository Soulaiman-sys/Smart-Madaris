import 'package:flutter/material.dart';

class AnnounceScreen extends StatefulWidget {
  @override
  _AnnounceScreenState createState() => _AnnounceScreenState();
}

class _AnnounceScreenState extends State<AnnounceScreen> {
  int selectedProfile = 0;

  List<Map<String, String>> items = [
    {
      "image": "https://images.unsplash.com/photo-1588072432836-e10032774350",
      "title": "Apprendre en jouant",
    },
    {
      "image": "https://images.unsplash.com/photo-1516627145497-ae6968895b74",
      "title": "Learn While Playing",
    },
    {
      "image": "https://images.unsplash.com/photo-1588072432836-e10032774350",
      "title": "Apprendre en jouant",
    },
    {
      "image": "https://images.unsplash.com/photo-1516627145497-ae6968895b74",
      "title": "Learn While Playing",
    },
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: BoxDecoration(
          image: DecorationImage(
            image: AssetImage("assets/bg.png"),
            fit: BoxFit.cover,
          ),
        ),
        child: SafeArea(
          child: Padding(
            padding: const EdgeInsets.all(16),
            child: Column(
              children: [
                /// Profiles
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    profileChip(
                      index: 0,
                      name: "Issam",
                      image:
                          "https://randomuser.me/api/portraits/children/1.jpg",
                    ),
                    const SizedBox(width: 20),
                    profileChip(
                      index: 1,
                      name: "nizar",
                      image:
                          "https://randomuser.me/api/portraits/children/2.jpg",
                    ),
                  ],
                ),

                const SizedBox(height: 30),

                /// Grid
                Expanded(
                  child: GridView.builder(
                    itemCount: items.length,
                    gridDelegate:
                        const SliverGridDelegateWithFixedCrossAxisCount(
                          crossAxisCount: 2,
                          crossAxisSpacing: 16,
                          mainAxisSpacing: 16,
                          childAspectRatio: 0.75,
                        ),
                    itemBuilder: (context, index) {
                      return learningCard(
                        items[index]["image"]!,
                        items[index]["title"]!,
                      );
                    },
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  /// Profile Button
  Widget profileChip({
    required int index,
    required String name,
    required String image,
  }) {
    bool selected = selectedProfile == index;

    return GestureDetector(
      onTap: () {
        setState(() {
          selectedProfile = index;
        });
      },
      child: Container(
        padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 6),
        decoration: BoxDecoration(
          color: selected ? Colors.white : Colors.transparent,
          borderRadius: BorderRadius.circular(30),
          border: Border.all(
            color: selected ? Colors.orange : Colors.black,
            width: 2,
          ),
        ),
        child: Row(
          children: [
            CircleAvatar(backgroundImage: NetworkImage(image)),
            const SizedBox(width: 10),
            Text(
              "$name  Ben ayad",
              style: TextStyle(fontWeight: FontWeight.bold),
            ),
          ],
        ),
      ),
    );
  }

  /// Card
  Widget learningCard(String image, String title) {
    return Container(
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(12),
        boxShadow: [BoxShadow(color: Colors.black12, blurRadius: 6)],
      ),
      child: Column(
        children: [
          Expanded(
            child: ClipRRect(
              borderRadius: BorderRadius.vertical(top: Radius.circular(12)),
              child: Image.network(
                image,
                width: double.infinity,
                fit: BoxFit.cover,
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(10),
            child: Text(
              title,
              textAlign: TextAlign.center,
              style: TextStyle(fontWeight: FontWeight.w500),
            ),
          ),
        ],
      ),
    );
  }
}
