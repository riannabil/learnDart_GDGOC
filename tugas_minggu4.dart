import 'package:flutter/material.dart';

void main() {
  runApp(const MyWatchlistApp());
}

class MyWatchlistApp extends StatelessWidget {
  const MyWatchlistApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'My Watchlist App',
      theme: ThemeData(primarySwatch: Colors.blue, useMaterial3: true),
      home: const MainNavigation(),
    );
  }
}

class MainNavigation extends StatefulWidget {
  const MainNavigation({super.key});

  @override
  State<MainNavigation> createState() => _MainNavigationState();
}

class _MainNavigationState extends State<MainNavigation> {
  // --- 1. DATA (JSON-like List) ---
  final List<Map<String, dynamic>> movieData = [
    {
      "judul": "Inception",
      "genre": "Sci-Fi",
      "rating": 5,
      "status": "Sudah Tonton",
    },
    {
      "judul": "The Dark Knight",
      "genre": "Action",
      "rating": 5,
      "status": "Sudah Tonton",
    },
    {
      "judul": "Interstellar",
      "genre": "Sci-Fi",
      "rating": 4,
      "status": "Belum",
    },
    {
      "judul": "The Godfather",
      "genre": "Crime",
      "rating": 5,
      "status": "Sudah Tonton",
    },
    {"judul": "Pulp Fiction", "genre": "Crime", "rating": 4, "status": "Belum"},
    {
      "judul": "The Matrix",
      "genre": "Action",
      "rating": 4,
      "status": "Sudah Tonton",
    },
    {"judul": "Gladiator", "genre": "Action", "rating": 4, "status": "Belum"},
    {
      "judul": "Parasite",
      "genre": "Thriller",
      "rating": 5,
      "status": "Sudah Tonton",
    },
  ];

  int _selectedIndex = 0;

  // Fungsi untuk mengubah halaman (Logika Stateful)
  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    // List halaman yang akan ditampilkan
    final List<Widget> _pages = [
      // HALAMAN 1: GRID VIEW (2 KOLOM)
      GridView.builder(
        padding: const EdgeInsets.all(10),
        gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 2, // 2 Kolom sesuai tugas
          crossAxisSpacing: 10,
          mainAxisSpacing: 10,
        ),
        itemCount: movieData.length,
        itemBuilder: (context, index) {
          return Container(
            decoration: BoxDecoration(
              color: Colors.blueAccent.withOpacity(0.1),
              borderRadius: BorderRadius.circular(15),
              border: Border.all(color: Colors.blueAccent),
            ),
            child: Center(
              child: Text(
                movieData[index]['judul'][0], // Inisial film
                style: const TextStyle(
                  fontSize: 40,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
          );
        },
      ),

      // HALAMAN 2: LIST VIEW
      ListView.builder(
        itemCount: movieData.length,
        itemBuilder: (context, index) {
          final movie = movieData[index];
          // TANTANGAN: Logika warna berbeda berdasarkan status
          final Color statusColor = movie['status'] == "Sudah Tonton"
              ? Colors.green.shade100
              : Colors.orange.shade100;

          return Card(
            color: statusColor,
            margin: const EdgeInsets.symmetric(horizontal: 10, vertical: 5),
            child: ListTile(
              title: Text(
                movie['judul'],
                style: const TextStyle(fontWeight: FontWeight.bold),
              ),
              subtitle: Text(
                "${movie['genre']} • Rating: ${movie['rating']}/5",
              ),
              trailing: Text(
                movie['status'],
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  color: movie['status'] == "Sudah Tonton"
                      ? Colors.green
                      : Colors.orange,
                ),
              ),
            ),
          );
        },
      ),
    ];

    return Scaffold(
      appBar: AppBar(
        title: const Text("My Watchlist App"),
        backgroundColor: Colors.blue,
        foregroundColor: Colors.white,
      ),
      body: _pages[_selectedIndex],
      // --- 2. BOTTOM NAVIGATION BAR ---
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: _selectedIndex,
        onTap: _onItemTapped,
        items: const [
          BottomNavigationBarItem(
            icon: Icon(Icons.grid_view),
            label: "Grid View",
          ),
          BottomNavigationBarItem(icon: Icon(Icons.list), label: "List View"),
        ],
      ),
    );
  }
}
