import 'package:flutter/material.dart';

class DemandeScreen extends StatelessWidget {
  const DemandeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        const SizedBox(height: 20),
        Expanded(
          child: ListView(
            //padding: const EdgeInsets.symmetric(horizontal: 16),
            children: const [
              DemandItem(index: "01", title: "Certificat scolaire"),
              DemandItem(index: "02", title: "Certificat de départ"),
              DemandItem(index: "03", title: "Résultats scolaires"),
              DemandItem(index: "04", title: "Résultats scolaires"),
              DemandItem(index: "05", title: "Résultats scolaires"),
            ],
          ),
        ),
      ],
    );
  }
}

class DemandItem extends StatelessWidget {
  final String index;
  final String title;

  const DemandItem({super.key, required this.index, required this.title});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Container(
        margin: const EdgeInsets.only(bottom: 16),
        child: Stack(
          clipBehavior: Clip.none,
          children: [
            /// 📄 Card
            Positioned(
              child: Container(
                width: MediaQuery.of(context).size.width * .8,
                height: 80,
                padding: const EdgeInsets.symmetric(
                  vertical: 20,
                  horizontal: 16,
                ),
                decoration: BoxDecoration(
                  color: const Color(0xFFEDE3D9),
                  borderRadius: BorderRadius.circular(20),
                ),
                child: Center(
                  child: Text(
                    title,
                    style: const TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                ),
              ),
            ),
            Positioned(
              top: 12.5,
              left: -20,
              child: Container(
                width: 55,
                height: 55,
                alignment: Alignment.center,
                decoration: BoxDecoration(
                  color: const Color(0xFFF2A900),
                  borderRadius: BorderRadius.circular(16),
                ),
                child: Text(
                  index,
                  style: const TextStyle(
                    color: Colors.white,
                    fontWeight: FontWeight.bold,
                    fontSize: 16,
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
