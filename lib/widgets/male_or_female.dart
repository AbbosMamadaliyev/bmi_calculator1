import 'package:flutter/material.dart';

class MaleOrFemale extends StatelessWidget {
  const MaleOrFemale({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 24.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Expanded(
            child: Container(
              decoration: buildBoxDecorationSex('images/male.jpg'),
              height: 100,
            ),
          ),
          Expanded(
            child: Container(
              decoration: buildBoxDecorationSex('images/female.jpg'),
              height: 100,
            ),
          ),
        ],
      ),
    );
  }

  BoxDecoration buildBoxDecorationSex(image) {
    return BoxDecoration(
      color: Colors.white,
      shape: BoxShape.circle,
      image: DecorationImage(
        image: AssetImage(image),
      ),
      boxShadow: [
        BoxShadow(
          blurRadius: 15,
          color: Colors.grey,
        ),
      ],
    );
  }
}
