import 'package:flutter/material.dart';

import '../models/api.dart';
import '../services/api_check.dart';
import 'profile/profile.dart'; // dio paketini eklemeyi unutmayın

class SearchPage extends StatefulWidget {
  const SearchPage({Key? key}) : super(key: key);

  @override
  _SearchPageState createState() => _SearchPageState();
}

class _SearchPageState extends State<SearchPage> {
  List<Search>? search = [];

  @override
  void initState() {
    super.initState();
    fetchData();
  }

  Future<void> fetchData() async {
    List<Search>? fetchedSearch = await getSearchWithDio(); // API
    setState(() {
      search = fetchedSearch;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: const Color.fromARGB(255, 86, 81, 95),
        titleSpacing: 0,
        title: Align(
          alignment: Alignment.centerLeft,
          child: SizedBox(
            width: double.infinity,
            child: TextField(
              decoration: InputDecoration(
                suffixIcon: const Icon(Icons.search, color: Colors.black),
                hintText: 'Axtar',
                fillColor: Colors.white,
                filled: true,
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(12),
                  borderSide: BorderSide.none,
                ),
              ),
            ),
          ),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const SizedBox(height: 20),
            for (var search in search!)
              _buildImageRow(search.photo, search.name),
          ],
        ),
      ),
      bottomNavigationBar: BottomAppBar(
        color: const Color.fromARGB(255, 255, 255, 255),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            const Divider(height: 0, color: Colors.grey),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                IconButton(
                  onPressed: () {},
                  icon: const Icon(
                    Icons.home_outlined,
                    color: Color.fromARGB(126, 115, 58, 126),
                    size: 40,
                  ),
                ),
                IconButton(
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => const SearchPage()),
                    );
                  },
                  icon: const Icon(
                    Icons.search_rounded,
                    color: Color.fromARGB(126, 115, 58, 126),
                    size: 38,
                  ),
                ),
                IconButton(
                  onPressed: () {},
                  icon: const Icon(
                    Icons.shopping_basket,
                    color: Color.fromARGB(126, 115, 58, 126),
                  ),
                  iconSize: 35,
                ),
                IconButton(
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => const ProfileePage()),
                    );
                  },
                  icon: const Icon(
                    Icons.person_2_outlined,
                    color: Color.fromARGB(126, 115, 58, 126),
                  ),
                  iconSize: 35,
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildImageRow(String photo, String name) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Row(
        children: [
          ClipRRect(
            borderRadius: BorderRadius.circular(10),
            child: Image.network(
              photo,
              height: 70,
              width: 70,
              fit: BoxFit.cover,
            ),
          ),
          const SizedBox(width: 10),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  name,
                  style: const TextStyle(fontSize: 18),
                ),
                const SizedBox(height: 5),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
