import 'package:flutter/material.dart';

void main() {
  runApp(const ProfileCardApp());
}

class ProfileCardApp extends StatelessWidget {
  const ProfileCardApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        backgroundColor: Colors.white, // Fond blanc
        appBar: AppBar(
          title: const Text('Profile Card'),
          backgroundColor: Colors.pink[400], // AppBar en rose clair
        ),
        body: const ProfileCard(),
      ),
    );
  }
}

class ProfileCard extends StatelessWidget {
  const ProfileCard({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        // Partie 1 : Avatar (photo) avec contour et icône superposée
        const SizedBox(height: 20),
        Container(
          decoration: BoxDecoration(
            shape: BoxShape.circle, // Forme circulaire
            border: Border.all(
              color: Colors
                  .pink[400]!, // Couleur du contour (rose clair, comme AppBar)
              width: 4, // Épaisseur du contour
            ),
          ),
          child: Stack(
            alignment: Alignment.center,
            children: [
              CircleAvatar(
                radius: 80, // Taille de l'avatar
                backgroundImage: const AssetImage('images/photoProfil.jpg'),
              ),
            ],
          ),
        ),
        const SizedBox(height: 20),

        // Partie 2 : Titre
        const Text(
          'Sara Zidoune', // Remplace par les vraies données
          style: TextStyle(
            fontSize: 24,
            fontWeight: FontWeight.bold,
          ),
        ),
        const SizedBox(height: 10),

        // Partie 3 : Cartes pour afficher les détails
        Expanded(
          child: ListView(
            padding: const EdgeInsets.all(20),
            children: [
              _buildInfoCard(
                icon: Icons.computer, // Icône pour le métier
                text: 'Ingénieure en Informatique', // Titre professionnel
                color: Colors.pink[400]!, // Couleur rose
              ),
              _buildInfoCard(
                icon: Icons.email,
                text: 'sarazidoune085@gmail.com',
                color: Colors.pink[400]!,
              ),
              _buildInfoCard(
                icon: Icons.phone,
                text: '+33 6 56 68 04 12',
                color: Colors.pink[400]!,
              ),
              _buildInfoCard(
                icon: Icons.link,
                text: 'https://www.linkedin.com/in/saraZ',
                color: Colors.pink[400]!,
              ),
              _buildInfoCard(
                icon: Icons.code, // Icône reflétant GitHub
                text:
                    'https://github.com/sara-zidoune', // Lien vers votre GitHub
                color: Colors.pink[400]!, // Couleur rose plus foncée
              ),
            ],
          ),
        ),
      ],
    );
  }

  // Widget pour créer une carte
  Widget _buildInfoCard({
    required IconData icon,
    required String text,
    required Color color,
  }) {
    return Card(
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(15)),
      margin: const EdgeInsets.symmetric(vertical: 10),
      elevation: 3, // Ombre sous la carte
      child: Padding(
        padding: const EdgeInsets.all(15),
        child: Row(
          children: [
            Icon(icon, color: color, size: 30), // Icône plus grande
            const SizedBox(width: 15),
            Expanded(
              child: Text(
                text,
                style: const TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
