import 'package:flutter/material.dart';

class InfoDialogWidget extends StatelessWidget {
  const InfoDialogWidget({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(right: 8.0),
      child: IconButton(
        onPressed: () {
          showDialog(
              context: context,
              builder: (BuildContext context) {
                return AlertDialog(
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(20)),
                  title: const Text('Info'),
                  content: const SingleChildScrollView(
                    child: Text(
                      'BMI - uz: TMI (tana massa indeksi), inson massasini bo\'y uzunligi kvadratiga bo\'lish orqali topiladi.'
                      '\nBMI index:\n18.5 dan kichik, vazn yetishmasligi\n18,5-24.9 normal vazn'
                      '\n25 dan katta bo\'lsa, vazn ortiqchalik',
                      style: TextStyle(height: 1.3),
                    ),
                  ),
                );
              });
        },
        icon: const Icon(
          Icons.info,
          color: Colors.black,
        ),
      ),
    );
  }
}
