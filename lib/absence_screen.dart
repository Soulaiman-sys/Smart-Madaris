import 'package:flutter/material.dart';

class AbsenceScreen extends StatefulWidget {
  const AbsenceScreen({super.key});

  @override
  State<AbsenceScreen> createState() => _AbsenceScreenState();
}

class _AbsenceScreenState extends State<AbsenceScreen> {
  int selectedStudent = 0;

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: ListView(
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

          /// CALENDAR
          calendarWidget(),

          const SizedBox(height: 20),

          /// TITLE
          const Center(
            child: Text(
              "Les absences du jour",
              style: TextStyle(
                fontSize: 28,
                fontWeight: FontWeight.bold,
                color: Colors.red,
              ),
            ),
          ),

          const SizedBox(height: 20),

          /// ABSENCES
          absenceTile("8:00 – 10:00", "Phiyisque chimie", "justifiée", true),

          absenceTile("10:00 – 12:00", "arabe", "", false),
        ],
      ),
    );
  }

  Widget studentCard(int index, String name, String image) {
    bool selected = selectedStudent == index;

    return Column(
      children: [
        Container(
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
                  style: const TextStyle(fontWeight: FontWeight.bold),
                ),
              ),
            ],
          ),
        ),
        const SizedBox(height: 8),
        GestureDetector(
          onTap: () {
            setState(() {
              selectedStudent = index;
            });
          },
          child: CircleAvatar(
            radius: 10,
            backgroundColor: selected ? Colors.orange : Colors.white,
            child: Container(
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                border: Border.all(color: Colors.black),
              ),
            ),
          ),
        ),
      ],
    );
  }

  /// CALENDAR
  Widget calendarWidget() {
    List days = ["LUN", "MAR", "MER", "JEU", "VEN", "SAM", "DIM"];

    List dates = List.generate(30, (index) => index + 1);

    return Container(
      padding: const EdgeInsets.all(16),
      color: const Color(0xffe6dbcf),
      child: Column(
        children: [
          /// MONTH
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: const [
              Icon(Icons.arrow_back),
              Text(
                "Octobre 2026",
                style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
              ),
              Icon(Icons.arrow_forward),
            ],
          ),

          const SizedBox(height: 20),

          /// WEEK DAYS
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: days
                .map((d) => Text(d, style: const TextStyle(fontSize: 12)))
                .toList(),
          ),

          const SizedBox(height: 20),

          /// DATES GRID
          GridView.builder(
            shrinkWrap: true,
            physics: const NeverScrollableScrollPhysics(),
            itemCount: dates.length,
            gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 7,
            ),
            itemBuilder: (context, index) {
              int day = dates[index];

              bool selected = day == 10;

              return Center(
                child: Container(
                  width: 35,
                  height: 35,
                  decoration: BoxDecoration(
                    color: selected ? Colors.deepOrange : Colors.transparent,
                    shape: BoxShape.circle,
                  ),
                  alignment: Alignment.center,
                  child: Text(
                    "$day",
                    style: TextStyle(
                      color: selected ? Colors.white : Colors.black,
                    ),
                  ),
                ),
              );
            },
          ),
        ],
      ),
    );
  }

  /// ABSENCE TILE
  Widget absenceTile(
    String time,
    String subject,
    String status,
    bool justified,
  ) {
    return ExpansionTile(
      backgroundColor: const Color(0xffe6dbcf),
      collapsedBackgroundColor: const Color(0xffe6dbcf),
      title: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(time),
          Text(
            subject,
            style: const TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
          ),
        ],
      ),
      trailing: justified
          ? const Text(
              "justifiée",
              style: TextStyle(
                color: Colors.green,
                fontWeight: FontWeight.bold,
              ),
            )
          : const Icon(Icons.arrow_drop_down, color: Colors.red),
      children: justified
          ? []
          : [
              Container(
                padding: const EdgeInsets.all(16),
                color: Colors.white,
                child: Column(
                  children: const [
                    Row(
                      children: [
                        Icon(Icons.radio_button_checked, color: Colors.orange),
                        SizedBox(width: 10),
                        Text(
                          "justifiée",
                          style: TextStyle(color: Colors.green),
                        ),
                      ],
                    ),
                    SizedBox(height: 10),
                    Row(
                      children: [
                        Icon(Icons.radio_button_unchecked, color: Colors.red),
                        SizedBox(width: 10),
                        Text(
                          "non justifiée",
                          style: TextStyle(color: Colors.red),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ],
    );
  }
}
