import 'package:api_usage/pages/404.dart';
import 'package:flutter/material.dart';
import 'package:api_usage/pages/profile/sms.dart'; // SmsPage2 import edildi

import '../../models/api.dart';
import '../../services/api_check.dart';

void main() {
  runApp(const MaterialApp(home: ProfilePage()));
}

class ProfilePage extends StatefulWidget {
  const ProfilePage({super.key});

  @override
  _ProfilePageState createState() => _ProfilePageState();
}

class _ProfilePageState extends State<ProfilePage> {
  final TextEditingController _phoneNumberController = TextEditingController();
  List<Number> numbers = [];

  @override
  void initState() {
    super.initState();
    fetchData();
  }

  Future<void> fetchData() async {
    List<Number>? fetchedNumbers = await getNumberWithDio();
    setState(() {
      numbers = fetchedNumbers!;
    });
  }

  void sendPhoneNumber() {
    String phoneNumber = _phoneNumberController.text;

    bool isNumberValid = checkNumberWithApi(phoneNumber);

    if (isNumberValid) {
      Navigator.push(
        context,
        MaterialPageRoute(builder: (context) => SmsPage(phoneNumber)),
      );
    } else {
      Navigator.push(
        context,
        MaterialPageRoute(builder: (context) => const Problem()),
      );
    }
  }

  bool checkNumberWithApi(String phoneNumber) {
    return numbers.any((number) => number.number == phoneNumber);
  }

  @override
  void dispose() {
    _phoneNumberController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Profil'),
        backgroundColor: const Color.fromARGB(255, 57, 33, 95),
      ),
      body: Column(
        children: [
          const Spacer(flex: 2),
          const Center(
            child: Text(
              'Mobil Nömrəniz',
              style: TextStyle(fontSize: 20),
            ),
          ),
          const SizedBox(height: 10),
          Expanded(
            child: Column(
              children: [
                Row(
                  children: [
                    Expanded(
                      child: Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: TextField(
                          controller: _phoneNumberController,
                          keyboardType: TextInputType.phone,
                          decoration: const InputDecoration(
                            hintText: '+994 50 XXX XX XX',
                            border: OutlineInputBorder(),
                          ),
                        ),
                      ),
                    ),
                    const SizedBox(width: 10),
                    GestureDetector(
                      onTap: sendPhoneNumber,
                      child: const Row(
                        children: [
                          Text(''),
                          Padding(
                            padding: EdgeInsets.all(8.0),
                            child: Icon(
                              Icons.send,
                              color: Color.fromARGB(255, 57, 33, 95),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: 10),
                const Text(
                  '',
                  style: TextStyle(
                      fontSize: 19, color: Color.fromARGB(255, 0, 0, 0)),
                ),
              ],
            ),
          ),
          const Spacer(flex: 3),
        ],
      ),
    );
  }
}

class SmsPage extends StatelessWidget {
  final String phoneNumber;

  const SmsPage(this.phoneNumber, {super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('SMS Təsdiqləmə'),
        backgroundColor: const Color.fromARGB(255, 57, 33, 95),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Center(
            child: Text(
              'SMS kodu göndərildi: $phoneNumber',
              style: const TextStyle(fontSize: 20),
            ),
          ),
          const SizedBox(height: 20),
          ElevatedButton(
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => SmsPage2(phoneNumber)),
              );
            },
            child: const Text('SMS Təsdiqlə'),
          ),
        ],
      ),
    );
  }
}
