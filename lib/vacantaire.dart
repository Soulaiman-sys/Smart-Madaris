import 'package:flutter/material.dart';

class VacataireScreen extends StatefulWidget {
  const VacataireScreen({super.key});

  @override
  State<VacataireScreen> createState() => _VacataireScreenState();
}

class _VacataireScreenState extends State<VacataireScreen> {
  bool isExpandedMonday = true;

  List<bool> switches = [true, true, false];

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        // PROFILE CARD
        Container(
          margin: const EdgeInsets.all(16),
          padding: const EdgeInsets.all(12),
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(16),
          ),
          child: Row(
            children: [
              const CircleAvatar(
                radius: 30,
                backgroundImage: NetworkImage(
                  "https://i.pravatar.cc/150?img=3",
                ),
              ),
              const SizedBox(width: 12),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: const [
                  Text(
                    "mohamed karim",
                    style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                  ),
                  SizedBox(height: 4),
                  Text("La matiere : mathématiques"),
                  Text("Classe : Tc-1Bac"),
                ],
              ),
            ],
          ),
        ),

        // LIST
        Expanded(
          child: ListView(
            children: [
              buildDay(
                title: "Lundi",
                expanded: isExpandedMonday,
                onTap: () {
                  setState(() {
                    isExpandedMonday = !isExpandedMonday;
                  });
                },
                content: buildMondayContent(),
              ),
              buildDay(title: "Mardi"),
              buildDay(title: "Mercredi"),
              buildDay(title: "Jeudi"),
              buildDay(title: "Vendredi"),
              buildDay(title: "Samedi"),
              buildDay(title: "Dimanche"),
            ],
          ),
        ),
      ],
    );
  }

  Widget buildDay({
    required String title,
    bool expanded = false,
    VoidCallback? onTap,
    Widget? content,
  }) {
    return Container(
      color: Colors.brown[50],
      child: Column(
        children: [
          ListTile(
            title: Text(
              title,
              style: const TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
            trailing: Icon(
              expanded ? Icons.keyboard_arrow_up : Icons.keyboard_arrow_down,
              color: Colors.red,
            ),
            onTap: onTap,
          ),
          if (expanded && content != null) content,
          const Divider(),
        ],
      ),
    );
  }

  Widget buildMondayContent() {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 16),
      color: Colors.brown[50],
      child: Column(
        children: [
          const SizedBox(height: 8),

          // HEADER ROW
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: const [
              Text(
                "Temps",
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  color: Colors.red,
                ),
              ),
              Text(
                "Sujet",
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  color: Colors.red,
                ),
              ),
              SizedBox(width: 50),
            ],
          ),

          const SizedBox(height: 10),

          buildRow("8:00 - 10:00", "Mathématique", 0),
          buildRow("10:00 - 12:00", "Mathématique", 1),
          buildRow("12:00 - 13:00", "Mathématique", 2),

          const SizedBox(height: 10),
        ],
      ),
    );
  }

  Widget buildRow(String time, String subject, int index) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 6),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(time),
          Text(subject),
          Switch(
            value: switches[index],
            onChanged: (val) {
              setState(() {
                switches[index] = val;
              });
            },
            activeColor: Colors.green,
          ),
        ],
      ),
    );
  }
}
