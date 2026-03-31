import 'package:flutter/material.dart';

class SchoolScheduleScreen extends StatelessWidget {
  const SchoolScheduleScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Column(
        children: [
          /// STUDENT SELECTOR
          Container(
            padding: const EdgeInsets.all(10),
            child: Row(
              children: [
                Expanded(
                  child: StudentCard(
                    name: "Issam Ben ayad",
                    image: "https://i.pravatar.cc/150?img=3",
                    selected: true,
                  ),
                ),
                const SizedBox(width: 10),
                Expanded(
                  child: StudentCard(
                    name: "nizar Ben ayad",
                    image: "https://i.pravatar.cc/150?img=5",
                    selected: false,
                  ),
                ),
              ],
            ),
          ),

          const SizedBox(height: 10),

          /// DAYS
          Expanded(
            child: ListView(
              children: const [
                DayTile(title: "Lundi", open: false),
                DayTile(title: "Mardi", open: true),
                DayTile(title: "Mercredi", open: false),
                DayTile(title: "jeudi", open: false),
                DayTile(title: "vendredi", open: false),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

class StudentCard extends StatelessWidget {
  final String name;
  final String image;
  final bool selected;

  const StudentCard({
    super.key,
    required this.name,
    required this.image,
    required this.selected,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
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
    );
  }
}

class DayTile extends StatelessWidget {
  final String title;
  final bool open;

  const DayTile({super.key, required this.title, required this.open});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(vertical: 6),
      child: ExpansionTile(
        initiallyExpanded: open,
        backgroundColor: const Color(0xffe6dbcf),
        collapsedBackgroundColor: const Color(0xffe6dbcf),
        title: Text(
          title,
          style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 20),
        ),
        trailing: const Icon(
          Icons.arrow_drop_down,
          color: Colors.red,
          size: 30,
        ),
        children: [
          Container(
            color: Color(0xffe6dbcf),
            padding: const EdgeInsets.all(16),
            child: const ScheduleTable(),
          ),
        ],
      ),
    );
  }
}

class ScheduleTable extends StatelessWidget {
  const ScheduleTable({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        /// HEADER
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: const [
            Text(
              "Temps",
              style: TextStyle(color: Colors.red, fontWeight: FontWeight.bold),
            ),
            Text(
              "Sujet",
              style: TextStyle(color: Colors.red, fontWeight: FontWeight.bold),
            ),
            Text(
              "Professeur",
              style: TextStyle(color: Colors.red, fontWeight: FontWeight.bold),
            ),
          ],
        ),

        const SizedBox(height: 12),

        scheduleRow("8:00 - 10:00", "Francais", "adil"),
        scheduleRow("10:00 - 12:00", "Mathématique", "salim"),
        scheduleRow("12:00 - 13:00", "pause", "-"),
        scheduleRow("13:00 - 14:00", "Svt", "yassir"),
      ],
    );
  }

  static Widget scheduleRow(String time, String subject, String teacher) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 6),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [Text(time), Text(subject), Text(teacher)],
      ),
    );
  }
}
