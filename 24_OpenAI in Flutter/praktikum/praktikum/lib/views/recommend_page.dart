import 'package:flutter/material.dart';
import 'package:praktikum/services/openai_api.dart';
import 'result_page.dart';

class RecomendationPage extends StatefulWidget {
  const RecomendationPage({Key? key});

  @override
  State<RecomendationPage> createState() => _RecomendationPageState();
}

class _RecomendationPageState extends State<RecomendationPage> {
  final RecomendationService _recommendationService = RecomendationService();

  TextEditingController harga = TextEditingController();
  TextEditingController kamera = TextEditingController();
  TextEditingController penyimpanan = TextEditingController();
  String gptOutput = '';
  bool isLoading = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      appBar: AppBar(
        title:
            const Text("Phone Recommendations", style: TextStyle(fontSize: 18)),
        backgroundColor: Color(0xFF6750A4),
      ),
      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(20.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              SizedBox(height: 20),
              buildTextField(
                harga,
                'Budget',
                'E.g: 10000000',
                TextInputType.text,
                borderColor: Colors.blue,
                textColor: Colors.black,
              ),
              buildTextField(
                kamera,
                'Camera (MP)',
                'E.g: 48mp',
                TextInputType.text,
                borderColor: Colors.blue,
                textColor: Colors.black,
              ),
              buildTextField(
                penyimpanan,
                'Internal Storage',
                'E.g: 64gb',
                TextInputType.text,
                borderColor: Colors.blue,
                textColor: Colors.black,
              ),
              SizedBox(height: 15),
              Align(
                alignment: Alignment.centerRight,
                child: Center(
                  child: ElevatedButton(
                    onPressed: () {
                      submit();
                    },
                    style: ElevatedButton.styleFrom(
                      primary: Color(0xFF6750A4),
                      fixedSize: Size(200, 40),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(8.0),
                      ),
                    ),
                    child: const Text('Get Recommendations'),
                  ),
                ),
              ),
              const SizedBox(height: 15),
            ],
          ),
        ),
      ),
    );
  }

  Widget buildTextField(
    TextEditingController controller,
    String label,
    String hint,
    TextInputType keyboardType, {
    Color borderColor = Colors.grey,
    Color textColor = Colors.black,
  }) {
    return Container(
      margin: const EdgeInsets.only(bottom: 10),
      child: TextField(
        controller: controller,
        keyboardType: keyboardType,
        decoration: InputDecoration(
          labelText: label,
          hintText: hint,
          focusedBorder: UnderlineInputBorder(
            borderSide: BorderSide(
                color: Color(0xFF6750A4)), // Warna garis bawah saat aktif
          ),
          enabledBorder: UnderlineInputBorder(
            borderSide: BorderSide(
                color: Color(0xFF6750A4)), // Warna garis bawah saat non-aktif
          ),
          fillColor: Colors.grey[200],
          filled: true,
          contentPadding: const EdgeInsets.symmetric(horizontal: 15),
          labelStyle: TextStyle(color: textColor),
          hintStyle: TextStyle(color: textColor),
        ),
      ),
    );
  }

  Future<void> submit() async {
    setState(() {
      isLoading = true;
    });

    try {
      gptOutput = await _recommendationService.getRecommendation(
        harga,
        kamera,
        penyimpanan,
      );

      Navigator.push(
        context,
        MaterialPageRoute(
          builder: (context) => ResultPage(result: gptOutput),
        ),
      );
    } finally {
      setState(() {
        isLoading = false;
      });
    }
  }
}
