import 'package:flutter/material.dart';
import 'package:smart_madaris/album_screen.dart';
import 'package:smart_madaris/announce_screen.dart';
import 'package:smart_madaris/cantine_screen.dart';
import 'package:smart_madaris/cours_screen.dart';
import 'package:smart_madaris/emploie_temps.dart';
import 'package:smart_madaris/object_perdus_screen.dart';
import 'package:smart_madaris/performance_screen.dart';
import 'package:smart_madaris/screen_ui_template.dart';
import 'package:smart_madaris/student_form_screen.dart';

import 'absence_screen.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final List<Map<String, dynamic>> gridItems = [
      {
        'icon': 'assets/images/money.png',
        'label': 'Performance',
        'screen': PerformanceScreen(),
      },
      {
        'icon': 'assets/images/eleves.png',
        'label': 'Listes des eleves',
        'screen': StudentFormScreen(),
      },
      {'icon': 'assets/images/messages.png', 'label': 'Message'},
      {
        'icon': 'assets/images/cours_exercies.png',
        'label': 'Cours et exercises',
        'screen': CoursesScreen(),
      },
      {
        'icon': 'assets/images/announce.png',
        'label': 'Annoces',
        "screen": AnnounceScreen(),
      },
      {
        'icon': 'assets/images/cantine.png',
        'label': 'Cantine',
        'screen': CantineScreen(),
      },
      {
        'icon': 'assets/images/emploi.png',
        'label': 'Emploi du temps',
        'screen': SchoolScheduleScreen(),
      },
      {'icon': 'assets/images/cahier.png', 'label': 'Cahier de texte'},
      {
        'icon': 'assets/images/abs.png',
        'label': 'Absence',
        'screen': AbsenceScreen(),
      },
      {'icon': 'assets/images/fourniture.png', 'label': 'Fourniture scolaire'},
      {
        'icon': 'assets/images/album.png',
        'label': 'Album photo',
        'screen': AlbumScreen(),
      },
      {
        'icon': 'assets/images/perdus.png',
        'label': 'Objets perdus',
        'screen': ObjectPerdusScreen(),
      },
    ];

    return ScreenUiTemplate(
      screenTitle: 'Bienvenue dans l’espace de\n suivi scolaire',
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Expanded(
              child: Padding(
                padding: const EdgeInsets.all(16.0),
                child: GridView.builder(
                  gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 3,
                    crossAxisSpacing: 16,
                    mainAxisSpacing: 16,
                    childAspectRatio: 0.85,
                  ),
                  itemCount: gridItems.length,
                  itemBuilder: (context, index) {
                    return _buildGridItem(
                      iconPath: gridItems[index]['icon']!,
                      label: gridItems[index]['label']!,
                      ctx: context,
                      screenTarget: gridItems[index].containsKey("screen")
                          ? gridItems[index]["screen"]
                          : null,
                    );
                  },
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildGridItem({
    required String iconPath,
    required String label,
    required BuildContext ctx,
    Widget? screenTarget,
  }) {
    return GestureDetector(
      onTap: () {
        if (screenTarget != null) {
          Navigator.of(ctx).push(
            MaterialPageRoute(
              builder: (_) =>
                  ScreenUiTemplate(screenTitle: label, body: screenTarget),
            ),
          );
        }
      },
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Container(
            padding: const EdgeInsets.all(12),
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(20),
              boxShadow: [
                BoxShadow(
                  color: Colors.grey.withOpacity(0.2),
                  spreadRadius: 2,
                  blurRadius: 5,
                  offset: const Offset(0, 3),
                ),
              ],
            ),
            child: Image.asset(iconPath, height: 60, fit: BoxFit.contain),
          ),
          const SizedBox(height: 8),
          Text(
            label,
            textAlign: TextAlign.center,
            style: const TextStyle(
              fontSize: 13,
              fontWeight: FontWeight.bold,
              color: Color(0xFF333333),
            ),
          ),
        ],
      ),
    );
  }
}
