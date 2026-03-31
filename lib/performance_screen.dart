import 'package:flutter/material.dart';

class PerformanceScreen extends StatelessWidget {
  const PerformanceScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        SizedBox(height: 20),
        // PROFILES
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: const [
            _ProfileItem(image: "assets/user1.png", name: "Issam Ben ayad"),
            SizedBox(width: 16),
            _ProfileItem(image: "assets/user2.png", name: "nizar Ben ayad"),
          ],
        ),

        const SizedBox(height: 20),

        // LIST
        Expanded(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16),
            child: ListView(
              children: [
                MonthExpansionTile(
                  title: "Frais d'inscription",
                  color: Colors.lightGreen,
                  child: const Text(
                    "Payé le 05/09/2025\nMontant: 300 MAD",
                    style: TextStyle(color: Colors.white),
                  ),
                ),

                MonthExpansionTile(
                  title: "SEPT",
                  color: Colors.redAccent,
                  child: const Text(
                    "Non payé",
                    style: TextStyle(color: Colors.white),
                  ),
                ),

                MonthExpansionTile(
                  title: "OCT",
                  color: Colors.redAccent,
                  child: const Text(
                    "Non payé",
                    style: TextStyle(color: Colors.white),
                  ),
                ),
                MonthExpansionTile(
                  title: "NOV",
                  color: Colors.redAccent,
                  child: const Text(
                    "Non payé",
                    style: TextStyle(color: Colors.white),
                  ),
                ),
                MonthExpansionTile(
                  title: "DEC",
                  color: Colors.redAccent,
                  child: const Text(
                    "Non payé",
                    style: TextStyle(color: Colors.white),
                  ),
                ),
                MonthExpansionTile(
                  title: "JAN",
                  color: Colors.redAccent,
                  child: const Text(
                    "Non payé",
                    style: TextStyle(color: Colors.white),
                  ),
                ),
                MonthExpansionTile(
                  title: "FEV",
                  color: Colors.redAccent,
                  child: const Text(
                    "Non payé",
                    style: TextStyle(color: Colors.white),
                  ),
                ),
                MonthExpansionTile(
                  title: "MAR",
                  color: Colors.redAccent,
                  child: const Text(
                    "Non payé",
                    style: TextStyle(color: Colors.white),
                  ),
                ),
                MonthExpansionTile(
                  title: "AVR",
                  color: Colors.redAccent,
                  child: const Text(
                    "Non payé",
                    style: TextStyle(color: Colors.white),
                  ),
                ),
                MonthExpansionTile(
                  title: "MAY",
                  color: Colors.redAccent,
                  child: const Text(
                    "Non payé",
                    style: TextStyle(color: Colors.white),
                  ),
                ),
                MonthExpansionTile(
                  title: "JUN",
                  color: Colors.redAccent,
                  child: const Text(
                    "Non payé",
                    style: TextStyle(color: Colors.white),
                  ),
                ),
                MonthExpansionTile(
                  title: "JUL",
                  color: Colors.redAccent,
                  child: const Text(
                    "Non payé",
                    style: TextStyle(color: Colors.white),
                  ),
                ),
                MonthExpansionTile(
                  title: "AUG",
                  color: Colors.redAccent,
                  child: const Text(
                    "Non payé",
                    style: TextStyle(color: Colors.white),
                  ),
                ),
              ],
            ),
          ),
        ),
      ],
    );
  }
}

class MonthExpansionTile extends StatefulWidget {
  final String title;
  final Color color;
  final Widget child;

  const MonthExpansionTile({
    super.key,
    required this.title,
    required this.color,
    required this.child,
  });

  @override
  State<MonthExpansionTile> createState() => _MonthExpansionTileState();
}

class _MonthExpansionTileState extends State<MonthExpansionTile>
    with SingleTickerProviderStateMixin {
  bool _expanded = false;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(vertical: 6),
      decoration: BoxDecoration(
        color: widget.color,
        borderRadius: BorderRadius.circular(30),
      ),
      child: Column(
        children: [
          // HEADER
          InkWell(
            borderRadius: BorderRadius.circular(30),
            onTap: () {
              setState(() => _expanded = !_expanded);
            },
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 14),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    widget.title,
                    style: const TextStyle(
                      color: Colors.white,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                  AnimatedRotation(
                    turns: _expanded ? 0.5 : 0,
                    duration: const Duration(milliseconds: 250),
                    child: const Icon(
                      Icons.keyboard_arrow_down,
                      color: Colors.black,
                    ),
                  ),
                ],
              ),
            ),
          ),

          // EXPANDED CONTENT
          AnimatedCrossFade(
            firstChild: const SizedBox.shrink(),
            secondChild: Padding(
              padding: const EdgeInsets.fromLTRB(16, 0, 16, 14),
              child: widget.child,
            ),
            crossFadeState: _expanded
                ? CrossFadeState.showSecond
                : CrossFadeState.showFirst,
            duration: const Duration(milliseconds: 250),
          ),
        ],
      ),
    );
  }
}

class _ProfileItem extends StatelessWidget {
  final String image;
  final String name;

  const _ProfileItem({required this.image, required this.name});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        CircleAvatar(radius: 30, backgroundImage: AssetImage(image)),
        const SizedBox(width: 10),
        Text(
          name,
          style: const TextStyle(fontSize: 14, fontWeight: FontWeight.bold),
        ),
      ],
    );
  }
}
