import 'package:flutter/material.dart';
import 'package:sos_volaille/views/Veterinaire/home/boite_message_page.dart';
import 'package:sos_volaille/views/Veterinaire/home/clients_page.dart';
import 'package:sos_volaille/views/Veterinaire/home/communaute_page.dart';
import 'package:sos_volaille/views/Veterinaire/home/profil_page.dart';

class AccueilPage extends StatefulWidget {
  @override
  _AccueilPageState createState() => _AccueilPageState();
}

class _AccueilPageState extends State<AccueilPage> {
  bool showImage = false; // Changed to false to display the video

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          // Stack des cercles colorés (le code que vous avez fourni)
          Stack(
            children: [
              // ... (rest of the code is the same as before)
            ],
          ),

          // Publicité (Remplacez cette partie par votre publicité)
          Container(
            height: 300, // Hauteur de la publicité
            color: Color.fromARGB(
                255, 84, 84, 82), // Remplacez par le style de votre publicité
            alignment: Alignment.center,
            child: Stack(
              alignment: Alignment.center,
              children: [
                // Image de la publicité (Affichez seulement si showImage est vrai)
                if (showImage)
                  Image.asset(
                    'lib/images/logo.png', // Remplacez par le chemin de votre image publicitaire
                    width: double.infinity,
                    height: double.infinity,
                    fit: BoxFit.cover,
                  ),

                // Vidéo de la publicité (Affichez seulement si showImage est faux)

                // Autres éléments superposés dans la publicité
                Positioned(
                  bottom: 16,
                  left: 16,
                  child: Text(
                    'Super Promotion !',
                    style: TextStyle(
                      fontSize: 18,
                      color: Colors.white,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
              ],
            ),
          ),

          // Le reste du contenu de la page (GridView avec les containers d'images)
          Expanded(
            child: GridView.count(
              crossAxisCount: 2,
              padding: EdgeInsets.all(
                  16), // Ajoute un espace autour de tous les containers
              children: [
                // Première image (Communaute)
                Padding(
                  padding: const EdgeInsets.all(
                      8.0), // Ajoute un espace autour de ce container
                  child: Container(
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(50),
                      color: Colors.grey[300],
                    ),
                    child: GestureDetector(
                      onTap: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => CommunautePage()),
                        );
                      },
                      child: Image.asset(
                        'lib/images/communaute.png',
                        width: 100,
                        height: 100,
                      ),
                    ),
                  ),
                ),

                // Deuxième image (Clients)
                Padding(
                  padding: const EdgeInsets.all(
                      8.0), // Ajoute un espace autour de ce container
                  child: Container(
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(50),
                      color: Colors.grey[300],
                    ),
                    child: GestureDetector(
                      onTap: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => ClientsPage()),
                        );
                      },
                      child: Image.asset(
                        'lib/images/clients.png',
                        width: 100,
                        height: 100,
                      ),
                    ),
                  ),
                ),

                // Troisième image (BoiteMessage)
                Padding(
                  padding: const EdgeInsets.all(
                      8.0), // Ajoute un espace autour de ce container
                  child: Container(
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(50),
                      color: Colors.grey[300],
                    ),
                    child: GestureDetector(
                      onTap: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => BoiteMessage()),
                        );
                      },
                      child: Image.asset(
                        'lib/images/boite_message.png',
                        width: 100,
                        height: 100,
                      ),
                    ),
                  ),
                ),

                // Quatrième image (Profil)
                Padding(
                  padding: const EdgeInsets.all(
                      8.0), // Ajoute un espace autour de ce container
                  child: Container(
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(50),
                      color: Colors.grey[300],
                    ),
                    child: GestureDetector(
                      onTap: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(builder: (context) => ProfilPage()),
                        );
                      },
                      child: Image.asset(
                        'lib/images/profil.png',
                        width: 100,
                        height: 100,
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
