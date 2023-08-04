import 'package:flutter/material.dart';

class ClientsPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Clients'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              'Liste des clients',
              style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 20),
            Expanded(
              child: ListView.builder(
                itemCount: 10, // Remplacez 10 par le nombre réel de clients que vous avez
                itemBuilder: (context, index) {
                  return ListTile(
                    leading: CircleAvatar(
                      // Remplacez cet avatar par l'image du client s'il y en a une
                      child: Icon(Icons.person),
                    ),
                    title: Text('Client ${index + 1}'),
                    subtitle: Text('Informations sur le client ${index + 1}'),
                    onTap: () {
                      // Ajoutez ici la logique pour accéder aux détails du client
                    },
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
