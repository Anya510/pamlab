import 'package:flutter/material.dart';
import 'wine.dart';
import 'wine_card.dart';

void main() {
  runApp(WineShopApp());
}

class WineShopApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Wine Shop',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: WineListScreen(),
    );
  }
}

class WineListScreen extends StatefulWidget {
  @override
  _WineListScreenState createState() => _WineListScreenState();
}

class _WineListScreenState extends State<WineListScreen> {
  String? _selectedType = 'All';
  String? _selectedStyle = 'All';
  String? _selectedCountry = 'All';

  List<Wine> wines = [
    Wine(
      name: 'Cricova Cabernet Sauvignon',
      description: 'Red Wine (Clean and Flinty) from Champagne Blanc...',
      price: 23256.596,
      isAvailable: true,
      imageUrl:
          'https://livrareflori.md/files/getfilecdn/56362/vin-cricova-ornament-rose-demidulce-0.75l-w445-h445.jpeg',
      type: 'Red Wine',
      style: 'Still',
      country: 'France',
    ),
    Wine(
      name: 'Cricova Pastoral',
      description: 'White Wine (Iron and Flint) from Burgundy...',
      price: 23256.596,
      isAvailable: true,
      imageUrl:
          'https://winechateau.co.uk/wp-content/uploads/2022/07/Feteasca-Wine.jpg',
      type: 'White Wine',
      style: 'Still',
      country: 'France',
    ),
    Wine(
      name: 'Feteasca Neagra',
      description: 'Sparkling Wine from Champagne, France...',
      price: 23256.596,
      isAvailable: false,
      imageUrl:
          'https://winechateau.co.uk/wp-content/uploads/2022/07/cricova-semidry-red.jpg',
      type: 'Sparkling Wine',
      style: 'Sparkling',
      country: 'France',
    ),
    Wine(
      name: 'Chisinau Rose',
      description: 'Red Wine from Jumilla, Spain...',
      price: 18956.49,
      isAvailable: true,
      imageUrl:
          'https://bestbuyliquors.com/media/catalog/product/cache/ae951d999521a598e95129c0582cc30f/c/r/cricova-lidia.jpg',
      type: 'Red Wine',
      style: 'Still',
      country: 'Spain',
    ),
    Wine(
      name: 'Cricova Rose',
      description: 'Red Wine from Sardinia, Italy...',
      price: 20567.32,
      isAvailable: true,
      imageUrl:
          'https://livrareflori.md/files/getfilecdn/57023/vin-cricova-vintage-sauvignon-alb-sec-0.75l-85-w445-h445.jpeg',
      type: 'Red Wine',
      style: 'Still',
      country: 'Italy',
    ),
    Wine(
      name: 'Rose Wine Porto',
      description: 'White Wine from Vinho Verde, Portugal...',
      price: 15467.89,
      isAvailable: true,
      imageUrl:
          'https://winechateau.co.uk/wp-content/uploads/2022/07/Cabernet-Sauvignon-1.jpg',
      type: 'White Wine',
      style: 'Still',
      country: 'Portugal',
    ),
  ];

  @override
  Widget build(BuildContext context) {
    List<Wine> filteredWines = wines.where((wine) {
      final matchesType = _selectedType == 'All' || wine.type == _selectedType;
      final matchesStyle =
          _selectedStyle == 'All' || wine.style == _selectedStyle;
      final matchesCountry =
          _selectedCountry == 'All' || wine.country == _selectedCountry;
      return matchesType && matchesStyle && matchesCountry;
    }).toList();

    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Wine Shop',
          style: TextStyle(
            fontSize: 24,
            fontWeight: FontWeight.bold,
            color: const Color.fromARGB(255, 17, 6, 36),
            letterSpacing: 1.5,
          ),
        ),
        backgroundColor: const Color.fromARGB(255, 238, 226, 255),
        actions: [
          IconButton(
            icon: Icon(Icons.search),
            onPressed: () {
              // Funcționalitate de căutare
            },
          ),
          IconButton(
            icon: Icon(Icons.shopping_cart),
            onPressed: () {
              // Funcționalitate de coș de cumpărături
            },
          ),
        ],
      ),
      body: Container(
        decoration: BoxDecoration(
          gradient: LinearGradient(
            colors: [Colors.deepPurple.shade50, Colors.deepPurple.shade100],
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
          ),
        ),
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.all(10.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  DropdownButton<String>(
                    hint: Text(
                      'Type',
                      style: TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.bold,
                        color: Colors.deepPurple.shade800,
                      ),
                    ),
                    value: _selectedType,
                    items: ['All', 'Red Wine', 'White Wine', 'Sparkling Wine']
                        .map((type) => DropdownMenuItem(
                              value: type,
                              child: Text(
                                type,
                                style: TextStyle(
                                  fontSize: 16,
                                  fontWeight: FontWeight.bold,
                                  color: Colors.deepPurple.shade700,
                                ),
                              ),
                            ))
                        .toList(),
                    onChanged: (value) {
                      setState(() {
                        _selectedType = value;
                      });
                    },
                  ),
                  DropdownButton<String>(
                    hint: Text(
                      'Style',
                      style: TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.bold,
                        color: Colors.deepPurple.shade800,
                      ),
                    ),
                    value: _selectedStyle,
                    items: ['All', 'Still', 'Sparkling']
                        .map((style) => DropdownMenuItem(
                              value: style,
                              child: Text(
                                style,
                                style: TextStyle(
                                  fontSize: 16,
                                  fontWeight: FontWeight.bold,
                                  color: Colors.deepPurple.shade700,
                                ),
                              ),
                            ))
                        .toList(),
                    onChanged: (value) {
                      setState(() {
                        _selectedStyle = value;
                      });
                    },
                  ),
                  DropdownButton<String>(
                    hint: Text(
                      'Country',
                      style: TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.bold,
                        color: Colors.deepPurple.shade800,
                      ),
                    ),
                    value: _selectedCountry,
                    items: ['All', 'France', 'Italy', 'Spain', 'Portugal']
                        .map((country) => DropdownMenuItem(
                              value: country,
                              child: Text(
                                country,
                                style: TextStyle(
                                  fontSize: 16,
                                  fontWeight: FontWeight.bold,
                                  color: Colors.deepPurple.shade700,
                                ),
                              ),
                            ))
                        .toList(),
                    onChanged: (value) {
                      setState(() {
                        _selectedCountry = value;
                      });
                    },
                  ),
                ],
              ),
            ),
            Expanded(
              child: ListView.builder(
                itemCount: filteredWines.length,
                itemBuilder: (context, index) {
                  return WineCard(
                    wine: filteredWines[index],
                    onFavoriteToggle: () {
                      setState(() {
                        filteredWines[index].isFavorite =
                            !filteredWines[index].isFavorite;
                      });
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
