import 'package:flutter/material.dart';
import 'wine.dart';

class WineCard extends StatelessWidget {
  final Wine wine;
  final VoidCallback onFavoriteToggle;

  WineCard({required this.wine, required this.onFavoriteToggle});

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: EdgeInsets.symmetric(vertical: 10, horizontal: 8),
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(12),
      ),
      elevation: 5,
      child: Container(
        decoration: BoxDecoration(
          gradient: LinearGradient(
            colors: [Colors.deepPurple.shade50, Colors.deepPurple.shade100],
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
          ),
          borderRadius: BorderRadius.circular(12),
        ),
        padding: EdgeInsets.all(10),
        child: ListTile(
          leading: ClipRRect(
            borderRadius: BorderRadius.circular(8.0),
            child: Image.network(
              wine.imageUrl,
              width: 60,
              height: 60,
              fit: BoxFit.cover,
            ),
          ),
          title: Text(
            wine.name,
            style: TextStyle(
              fontSize: 18,
              fontWeight: FontWeight.bold,
              color: Colors.deepPurple.shade800,
            ),
          ),
          subtitle: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(height: 5),
              Text(
                wine.description,
                style: TextStyle(
                  fontSize: 14,
                  color: Colors.deepPurple.shade600,
                  fontStyle: FontStyle.italic,
                ),
              ),
              SizedBox(height: 5),
              Text(
                'Price: \$${wine.price.toStringAsFixed(2)}',
                style: TextStyle(
                  fontSize: 14,
                  fontWeight: FontWeight.w500,
                  color: Colors.deepPurple.shade700,
                ),
              ),
              Text(
                'Country: ${wine.country}',
                style: TextStyle(
                  fontSize: 14,
                  fontWeight: FontWeight.w500,
                  color: Colors.deepPurple.shade700,
                ),
              ),
              Text(
                wine.isAvailable ? 'Available' : 'Unavailable',
                style: TextStyle(
                  color: wine.isAvailable ? Colors.green : Colors.red,
                  fontWeight: FontWeight.bold,
                  fontSize: 14,
                ),
              ),
            ],
          ),
          trailing: IconButton(
            icon: Icon(
              wine.isFavorite ? Icons.favorite : Icons.favorite_border,
              color: wine.isFavorite ? Colors.red : Colors.deepPurple.shade400,
            ),
            onPressed: onFavoriteToggle,
          ),
        ),
      ),
    );
  }
}
