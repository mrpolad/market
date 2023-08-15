import 'package:dio/dio.dart';

import '../models/api.dart';

Future<List<Product>?> getProductsWithDio() async {
  var url = 'http://45.141.150.134:10/api';
  var res = await Dio().get(url);

  try {
    if (res.statusCode == 200) {
      var data = res.data as Map<String, dynamic>;
      var productsJson = data['products'] as List<dynamic>;
      return productsJson.map((e) => Product.fromJson(e)).toList();
    }
    // ignore: avoid_print
    print(res.statusCode);
  } catch (e) {
    // ignore: avoid_print
    print('Sehv var: $e');
  }
  return [];
}

Future<List<Category>?> getCategoryWithDio() async {
  var url = 'http://45.141.150.134:10/api';
  var res = await Dio().get(url);

  try {
    if (res.statusCode == 200) {
      var data = res.data as Map<String, dynamic>;
      var productsJson = data['categories'] as List<dynamic>;
      return productsJson.map((e) => Category.fromJson(e)).toList();
    }
    // ignore: avoid_print
    print(res.statusCode);
  } catch (e) {
    // ignore: avoid_print
    print('Sehv var: $e');
  }
  return [];
}

Future<List<CarouselP>?> getCarouselWithDio() async {
  var url = 'http://45.141.150.134:10/api';
  var res = await Dio().get(url);

  try {
    if (res.statusCode == 200) {
      var data = res.data as Map<String, dynamic>;
      var productsJson = data['carousel'] as List<dynamic>;
      return productsJson.map((e) => CarouselP.fromJson(e)).toList();
    }
    // ignore: avoid_print
    print(res.statusCode);
  } catch (e) {
    // ignore: avoid_print
    print('Sehv var: $e');
  }
  return [];
}

Future<List<Number>?> getNumberWithDio() async {
  var url = 'http://45.141.150.134:10/api';
  var res = await Dio().get(url);

  try {
    if (res.statusCode == 200) {
      var data = res.data as Map<String, dynamic>;
      var productsJson = data['number'] as List<dynamic>;
      return productsJson.map((e) => Number.fromJson(e)).toList();
    }
    // ignore: avoid_print
    print(res.statusCode);
  } catch (e) {
    // ignore: avoid_print
    print('Sehv var: $e');
  }
  return [];
}

Future<List<Number>?> getCodeWithDio() async {
  var url = 'http://45.141.150.134:10/api';
  var res = await Dio().get(url);

  try {
    if (res.statusCode == 200) {
      var data = res.data as Map<String, dynamic>;
      var productsJson = data['number'] as List<dynamic>;
      return productsJson.map((e) => Number.fromJson(e)).toList();
    }
    // ignore: avoid_print
    print(res.statusCode);
  } catch (e) {
    // ignore: avoid_print
    print('Sehv var: $e');
  }
  return [];
}

Future<List<Search>?> getSearchWithDio() async {
  var url = 'http://45.141.150.134:10/api';
  try {
    var response = await Dio().get(url);

    if (response.statusCode == 200) {
      var data = response.data as Map<String, dynamic>;
      var numbersJson = data['search'] as List<dynamic>;
      return numbersJson.map((e) => Search.fromJson(e)).toList();
    } else {
      print('API request failed with status code: ${response.statusCode}');
    }
  } catch (e) {
    print('API request failed with error: $e');
  }

  return [];
}
