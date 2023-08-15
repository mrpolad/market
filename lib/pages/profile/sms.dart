import 'package:api_usage/pages/404.dart';
import 'package:api_usage/pages/profile/true.dart';
import 'package:flutter/material.dart';
import '../../models/api.dart';
import '../../services/api_check.dart';

class SmsPage2 extends StatefulWidget {
  final String phoneNumber;

  const SmsPage2(this.phoneNumber, {super.key});

  @override
  _SmsPage2State createState() => _SmsPage2State();
}

class _SmsPage2State extends State<SmsPage2> {
  List<Number> numbers = [];
  final TextEditingController _smsCodeController = TextEditingController();
  bool isCodeCorrect = true;

  @override
  void dispose() {
    _smsCodeController.dispose();
    super.dispose();
  }

  Future<void> fetchData() async {
    List<Number>? fetchedNumbers = await getCodeWithDio();
    setState(() {
      numbers = fetchedNumbers!;
    });
  }

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
              'SMS kodu göndərildi: ${widget.phoneNumber}',
              style: const TextStyle(fontSize: 20),
            ),
          ),
          const SizedBox(height: 20),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: TextField(
              controller: _smsCodeController,
              keyboardType: TextInputType.number,
              decoration: const InputDecoration(
                hintText: 'SMS Kodunu Daxil edin',
                border: OutlineInputBorder(),
              ),
            ),
          ),
          const SizedBox(height: 20),
          ElevatedButton(
            onPressed: () async {
              bool isCodeValid =
                  await checkSmsCodeWithApi(_smsCodeController.text);

              setState(() {
                isCodeCorrect = isCodeValid;
              });

              if (isCodeCorrect) {
                // ignore: use_build_context_synchronously
                Navigator.pushReplacement(
                  context,
                  MaterialPageRoute(
                      builder: (context) => const CongratulationsPage(
                            message: 'Təbrikler, Siz qeydiyyatı tamamlandınız.',
                          )),
                );
              } else {
                // ignore: use_build_context_synchronously
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => const Problem()),
                );
              }
            },
            child: const Text('SMS təsdiqlə'),
          ),
          if (!isCodeCorrect)
            const Padding(
              padding: EdgeInsets.all(10.0),
              child: Text(
                'SMS Kod yanlışdır! Zəhmət olmasa yenidən yoxlayın.',
                style: TextStyle(
                  color: Colors.red,
                ),
              ),
            ),
        ],
      ),
    );
  }

  Future<bool> checkSmsCodeWithApi(String smsCode) async {
    List<Number>? fetchedNumbers = await getNumberWithDio();
    return fetchedNumbers!.any((number) => number.smsCode == smsCode);
  }
}
