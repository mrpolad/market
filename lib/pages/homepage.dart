import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';

import '../models/api.dart';
import '../services/api_check.dart';
import 'profile/number.dart';
import 'search.dart';

class MyAppHome extends StatefulWidget {
  const MyAppHome({Key? key}) : super(key: key);

  @override
  _MyAppHomeState createState() => _MyAppHomeState();
}

class _MyAppHomeState extends State<MyAppHome> {
  final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();
  List<Product> products = [];
  List<Category> categories = [];
  List<CarouselP> carousel = [];

  @override
  void initState() {
    super.initState();
    fetchData();
  }

  Future<void> fetchData() async {
    List<Product>? fetchedProducts = await getProductsWithDio();
    if (fetchedProducts != null) {
      setState(() {
        products = fetchedProducts;
      });
    }

    List<Category>? fetchedCategory = await getCategoryWithDio();
    if (fetchedCategory != null) {
      setState(() {
        categories = fetchedCategory;
      });
    }
    List<CarouselP>? fetchedCarousel = await getCarouselWithDio();
    if (fetchedCategory != null) {
      setState(() {
        carousel = fetchedCarousel!;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: _scaffoldKey,
      appBar: AppBar(
        leadingWidth: 60,
        leading: Padding(
          padding: const EdgeInsets.only(left: 20),
          child: Image.network(
            'https://icones.pro/wp-content/uploads/2021/02/icone-de-broche-de-localisation-violette.png',
            height: 40,
          ),
        ),
        title: const Text(
          "Bakı",
          style: TextStyle(color: Colors.black),
        ),
        actions: const [
          Icon(
            Icons.arrow_drop_down_outlined,
            color: Colors.black,
          ),
          SizedBox(
            width: 20,
          )
        ],
        backgroundColor: const Color.fromARGB(255, 255, 255, 255),
        elevation: 0,
      ),
      backgroundColor: const Color.fromARGB(255, 255, 255, 255),
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
                          builder: (context) => const ProfilePage()),
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
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const SizedBox(height: 20),
            CarouselSlider(
              items: carousel.map((carousel) {
                return Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Row(
                    children: [
                      Expanded(
                        child: ClipRRect(
                          borderRadius: BorderRadius.circular(16),
                          child: Image.network(
                            carousel.photoc!,
                            height: 250,
                            width: 100,
                            fit: BoxFit.cover,
                          ),
                        ),
                      ),
                    ],
                  ),
                );
              }).toList(),
              options: CarouselOptions(
                viewportFraction: 1.0,
                autoPlay: true,
              ),
            ),
            const SizedBox(height: 20),
            const Padding(
              padding: EdgeInsets.only(left: 16),
              child: Text(
                'Endirimlər',
                style: TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                  color: Colors.black,
                ),
              ),
            ),
            const SizedBox(height: 10),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: CarouselSlider.builder(
                itemCount: products.length,
                itemBuilder: (BuildContext context, int index, int innerIndex) {
                  return Container(
                    margin: const EdgeInsets.symmetric(horizontal: 10),
                    child: Column(
                      children: [
                        ClipRRect(
                          borderRadius: BorderRadius.circular(16),
                          child: Image.network(
                            products[index].photo,
                            width: 150,
                            height: 125,
                            fit: BoxFit.cover,
                          ),
                        ),
                        const SizedBox(height: 5),
                        Text(
                          products[index].name,
                          style: const TextStyle(
                            fontSize: 16,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        const SizedBox(height: 5),
                        Text(
                          '${products[index].formattedPrice} ₼',
                          style: const TextStyle(
                            fontSize: 14,
                            color: Colors.grey,
                          ),
                        ),
                        const SizedBox(height: 5),
                        ElevatedButton(
                          onPressed: () {},
                          child: const Text('Almaq'),
                        ),
                      ],
                    ),
                  );
                },
                options: CarouselOptions(
                  height: 310,
                  enlargeCenterPage: true,
                  viewportFraction: 0.5,
                  initialPage: 0,
                  enableInfiniteScroll: true,
                  autoPlay: true,
                  onPageChanged: (index, reason) {
                    // Her sayfa değiştiğinde
                  },
                ),
              ),
            ),
            const Padding(
              padding: EdgeInsets.only(left: 16),
              child: Text(
                'Məhsul Kateqoriyaları',
                style: TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                  color: Colors.black,
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Column(
                children:
                    List.generate((categories.length / 2).ceil(), (index) {
                  int startIndex = index * 2;
                  int endIndex = (index + 1) * 2;
                  endIndex = endIndex > categories.length
                      ? categories.length
                      : endIndex;

                  return Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children:
                        List.generate(endIndex - startIndex, (innerIndex) {
                      int categoryIndex = startIndex + innerIndex;
                      return Container(
                        margin: const EdgeInsets.symmetric(horizontal: 10),
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(16),
                        ),
                        child: Column(
                          children: [
                            ClipRRect(
                              borderRadius: BorderRadius.circular(16),
                              child: Image.network(
                                categories[categoryIndex].cphoto!,
                                width: 150,
                                height: 150,
                                fit: BoxFit.cover,
                              ),
                            ),
                            const SizedBox(height: 10),
                            Text(
                              categories[categoryIndex].cname!,
                              style: const TextStyle(
                                fontSize: 16,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                            const SizedBox(height: 10),
                          ],
                        ),
                      );
                    }),
                  );
                }),
              ),
            ),
            const SizedBox(
              height: 10,
            )
          ],
        ),
      ),
    );
  }
}
