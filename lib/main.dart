import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Kartu Identitas Digital',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        fontFamily: 'Montserrat',
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.red),
        useMaterial3: true,
      ),
      home: const Scaffold(
        backgroundColor: Color(0xFFF8EAEA),
        body: Center(
          child: IdCardWithSideAccent(),
        ),
      ),
    );
  }
}

class IdCardWithSideAccent extends StatelessWidget {
  const IdCardWithSideAccent({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 320,
      height: 480,
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(32),
        boxShadow: [
          BoxShadow(
            color: Colors.red.withOpacity(0.12),
            blurRadius: 18,
            offset: const Offset(0, 8),
          ),
        ],
      ),
      child: Stack(
        children: [
          // Side accent merah dengan tulisan vertikal
          Positioned(
            right: 0,
            top: 0,
            bottom: 0,
            child: Container(
              width: 64,
              decoration: const BoxDecoration(
                gradient: LinearGradient(
                  colors: [Color(0xFF8B3A4A), Color(0xFFD32F2F)],
                  begin: Alignment.topCenter,
                  end: Alignment.bottomCenter,
                ),
                borderRadius: BorderRadius.only(
                  topRight: Radius.circular(32),
                  bottomRight: Radius.circular(32),
                ),
              ),
              child: RotatedBox(
                quarterTurns: 1,
                child: Center(
                  child: Text(
                    "Profile card",
                    style: TextStyle(
                      color: Colors.white,
                      fontWeight: FontWeight.bold,
                      letterSpacing: 2,
                      fontSize: 17,
                      fontFamily: 'Montserrat',
                    ),
                  ),
                ),
              ),
            ),
          ),
          // Main content (Column)
          Padding(
            padding: const EdgeInsets.only(right: 64, left: 24, top: 32, bottom: 24),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                // Foto persegi dengan border dan sudut membulat
                Container(
                  width: 120,
                  height: 150,
                  decoration: BoxDecoration(
                    border: Border.all(
                      color: Colors.grey.shade400,
                      width: 2,
                    ),
                    borderRadius: BorderRadius.circular(10),
                    color: Colors.white,
                  ),
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(8),
                    child: Image.asset(
                      '../assets/profile.jpg',
                      fit: BoxFit.cover,
                    ),
                  ),
                ),
                const SizedBox(height: 24),
                // Nama (rata tengah, rapi)
                const Text(
                  "Anggita wahyudini putri",
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 26,
                    color: Color(0xFF8B3A4A),
                    fontFamily: 'Montserrat',
                    letterSpacing: 1.2,
                  ),
                ),
                const SizedBox(height: 10),
                // Deskripsi (rata tengah, multi-baris)
                const Text(
                  "UI/UX Design\nWeb Development",
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    fontSize: 15,
                    color: Colors.black87,
                    height: 1.3,
                    fontFamily: 'Poppins',
                  ),
                ),
                // Tahun dan label
                const Text(
                  "2022\nInformatics Engineering Student",
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    color: Color(0xFFD32F2F),
                    fontWeight: FontWeight.bold,
                    fontSize: 17,
                    fontFamily: 'Montserrat',
                    height: 1.2,
                  ),
                ),
                const SizedBox(height: 18),
                // Row ikon sosial media
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    SocialMediaIcon(
                      icon: Icons.facebook,
                      color: Colors.blue[800]!,
                    ),
                    const SizedBox(width: 16),
                    SocialMediaIcon(
                      icon: Icons.email,
                      color: Colors.red[400]!,
                    ),
                    const SizedBox(width: 16),
                    SocialMediaIcon(
                      icon: Icons.linked_camera,
                      color: Colors.grey[900]!,
                    ),
                  ],
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

class SocialMediaIcon extends StatelessWidget {
  final IconData icon;
  final Color color;

  const SocialMediaIcon({
    super.key,
    required this.icon,
    required this.color,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 38,
      height: 38,
      decoration: BoxDecoration(
        color: color.withOpacity(0.13),
        shape: BoxShape.circle,
        border: Border.all(color: color.withOpacity(0.35)),
      ),
      child: Icon(
        icon,
        color: color,
        size: 20,
      ),
    );
  }
}
