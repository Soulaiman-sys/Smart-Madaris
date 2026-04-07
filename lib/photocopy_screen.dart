import 'package:flutter/material.dart';

class PhotocopyScreen extends StatelessWidget {
  const PhotocopyScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        /// 🌫 Background
        Container(decoration: const BoxDecoration(color: Color(0xFFF4F4F4))),

        Column(
          children: [
            const SizedBox(height: 20),

            Expanded(
              child: SingleChildScrollView(
                padding: const EdgeInsets.symmetric(horizontal: 16),
                child: Column(
                  children: [
                    _buildDropdown("Classe"),
                    const SizedBox(height: 12),

                    _buildInput("Sujet"),
                    const SizedBox(height: 12),

                    _buildInput("Date"),
                    const SizedBox(height: 12),

                    _buildTextArea(),
                    const SizedBox(height: 20),

                    /// ☁️ Upload Box
                    _buildUploadBox(),

                    const SizedBox(height: 40),

                    /// 🚀 Button
                    _buildButton(),
                    const SizedBox(height: 30),
                  ],
                ),
              ),
            ),
          ],
        ),
      ],
    );
  }

  /// 🔝 Header
  Widget _buildHeader() {
    return Container(
      height: 120,
      decoration: const BoxDecoration(
        gradient: LinearGradient(
          colors: [Color(0xFFFF8A00), Color(0xFFFF5C00)],
        ),
        borderRadius: BorderRadius.only(
          bottomLeft: Radius.circular(30),
          bottomRight: Radius.circular(30),
        ),
      ),
      child: SafeArea(
        child: Stack(
          children: const [
            Positioned(
              left: 16,
              top: 10,
              child: Icon(Icons.arrow_back, color: Colors.white),
            ),
            Center(
              child: Text(
                "Photocopy",
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 22,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
            Positioned(
              left: 60,
              top: 10,
              child: Icon(Icons.print, color: Colors.black),
            ),
          ],
        ),
      ),
    );
  }

  /// 🔽 Dropdown
  Widget _buildDropdown(String hint) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 20),
      decoration: BoxDecoration(
        color: const Color(0xFFEDE3D9),
        borderRadius: BorderRadius.circular(30),
      ),
      child: DropdownButtonHideUnderline(
        child: DropdownButton<String>(
          dropdownColor: const Color(0xFFEDE3D9),
          hint: Text(hint),
          isExpanded: true,
          items: ["A", "B", "C"]
              .map((e) => DropdownMenuItem(value: e, child: Text("Classe $e")))
              .toList(),
          onChanged: (value) {},
        ),
      ),
    );
  }

  /// 🔤 Input
  Widget _buildInput(String hint) {
    return TextField(
      decoration: InputDecoration(
        hintText: hint,
        filled: true,
        fillColor: const Color(0xFFEDE3D9),
        contentPadding: const EdgeInsets.symmetric(
          horizontal: 20,
          vertical: 16,
        ),
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(30),
          borderSide: BorderSide.none,
        ),
      ),
    );
  }

  /// 📝 Text Area
  Widget _buildTextArea() {
    return TextField(
      maxLines: 5,
      decoration: InputDecoration(
        hintText: "Texte",
        filled: true,
        fillColor: const Color(0xFFEDE3D9),
        contentPadding: const EdgeInsets.all(20),
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(25),
          borderSide: BorderSide.none,
        ),
      ),
    );
  }

  /// ☁️ Upload Box
  Widget _buildUploadBox() {
    return GestureDetector(
      onTap: () {
        // open file picker
      },
      child: Container(
        width: 150,
        height: 150,
        decoration: BoxDecoration(
          color: const Color(0xFFEDE3D9),
          borderRadius: BorderRadius.circular(30),
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: const [
            Icon(Icons.cloud_upload_outlined, size: 40),
            SizedBox(height: 8),
            Text("Upload"),
          ],
        ),
      ),
    );
  }

  /// 🚀 Button
  Widget _buildButton() {
    return SizedBox(
      width: 200,
      child: ElevatedButton(
        onPressed: () {},
        style: ElevatedButton.styleFrom(
          backgroundColor: const Color(0xFFF97A25),
          padding: const EdgeInsets.symmetric(vertical: 16),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(30),
          ),
          elevation: 0,
        ),
        child: const Text(
          "DEMANDE",
          style: TextStyle(
            fontSize: 18,
            fontWeight: FontWeight.bold,
            color: Colors.white,
            letterSpacing: 1,
          ),
        ),
      ),
    );
  }
}
