import 'package:flutter/material.dart';

import '../homepage.dart';
import '../search.dart';

class ProfileePage extends StatelessWidget {
  const ProfileePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: const Color.fromARGB(255, 255, 255, 255),
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
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => const MyAppHome()),
                    );
                  },
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
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const SizedBox(height: 10),
          Padding(
            padding: const EdgeInsets.only(left: 18, top: 16),
            child: Row(
              children: [
                ClipOval(
                  child: Container(
                    width: 80,
                    height: 80,
                    child: Image.network(
                      'https://scontent.fgyd21-1.fna.fbcdn.net/v/t39.30808-6/310059064_829311808228044_5874002062186301737_n.jpg?_nc_cat=110&cb=99be929b-59f725be&ccb=1-7&_nc_sid=be3454&_nc_ohc=kScPo0WBZr4AX-UJl7Z&_nc_ht=scontent.fgyd21-1.fna&oh=00_AfBiddf3YzLxdXV-iwdokdOP8LEuCrvejLyWvLGPeVTfhA&oe=64DE5CD5',
                      fit: BoxFit.cover,
                    ),
                  ),
                ),
                const SizedBox(width: 8),
                const Padding(
                  padding: EdgeInsets.all(8.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'Togrul Ağayev',
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 15,
                          color: Colors.black,
                        ),
                      ),
                      SizedBox(height: 10),
                      Text(
                        '+994 993 33 37 99',
                        style: TextStyle(
                          fontSize: 14,
                          color: Colors.grey,
                        ),
                      ),
                      SizedBox(height: 10),
                      Text(
                        'Sifariş sayı: 99+',
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 15,
                          color: Colors.black,
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
          const SizedBox(height: 10),
          const Padding(
            padding: EdgeInsets.all(8.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'İndi Coin',
                  style: TextStyle(
                    fontSize: 16,
                    color: Color.fromARGB(255, 70, 69, 69),
                  ),
                  textAlign: TextAlign.start,
                ),
                Divider(
                  color: Color.fromARGB(255, 226, 216, 216),
                ),
                Text(
                  'Dostlarını dəvət et',
                  style: TextStyle(
                    fontSize: 16,
                    color: Color.fromARGB(255, 70, 69, 69),
                  ),
                  textAlign: TextAlign.start,
                ),
                Divider(
                  color: Color.fromARGB(255, 226, 216, 216),
                ),
                Text(
                  'Promo kodlar',
                  style: TextStyle(
                    fontSize: 16,
                    color: Color.fromARGB(255, 70, 69, 69),
                  ),
                  textAlign: TextAlign.start,
                ),
                Divider(
                  color: Color.fromARGB(255, 226, 216, 216),
                ),
                Text(
                  'Dəstək',
                  style: TextStyle(
                    fontSize: 16,
                    color: Color.fromARGB(255, 70, 69, 69),
                  ),
                  textAlign: TextAlign.start,
                ),
                Divider(
                  color: Color.fromARGB(255, 226, 216, 216),
                ),
              ],
            ),
          ),
          const Padding(
            padding: EdgeInsets.all(8.0),
            child: Text(
              ' AYARLAR',
              style: TextStyle(
                fontSize: 15,
                fontWeight: FontWeight.bold,
                color: Colors.black,
              ),
            ),
          ),
          const SizedBox(height: 10),
          const Text(
            '   Ünvanlarım',
            style: TextStyle(
              fontSize: 16,
              color: Color.fromARGB(255, 70, 69, 69),
            ),
          ),
          const Divider(
            color: Color.fromARGB(255, 226, 216, 216),
          ),
          const Text(
            '   Ayarlar',
            style: TextStyle(
              fontSize: 16,
              color: Color.fromARGB(255, 70, 69, 69),
            ),
          ),
          const Divider(
            color: Color.fromARGB(255, 226, 216, 216),
          ),
          const Text(
            '   Çıxış',
            style: TextStyle(
              fontSize: 16,
              color: Color.fromARGB(255, 70, 69, 69),
            ),
          ),
          const Divider(
            color: Color.fromARGB(255, 226, 216, 216),
          ),
          const Text(
            '   v1.1.16',
            style: TextStyle(
              fontSize: 16,
              color: Color.fromARGB(255, 70, 69, 69),
            ),
          ),
          const Divider(
            color: Color.fromARGB(255, 255, 253, 253),
          ),
          Expanded(
            child: Container(),
          ),
        ],
      ),
    );
  }
}

class DividerWithText extends StatelessWidget {
  final String text;
  final Color textColor;

  const DividerWithText({
    super.key,
    required this.text,
    required this.textColor,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        const Expanded(
          child: Divider(
            color: Color.fromARGB(255, 226, 216, 216),
          ),
        ),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 10),
          child: Text(
            text,
            style: TextStyle(
              fontSize: 14,
              color: textColor,
            ),
          ),
        ),
        const Expanded(
          child: Divider(
            color: Color.fromARGB(255, 226, 216, 216),
          ),
        ),
      ],
    );
  }
}
