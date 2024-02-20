import 'package:flutter/material.dart';

class MyButton extends StatelessWidget {
  final String name;
  final Function()? onpress;
  const MyButton({required this.name, this.onpress});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 50,
      width: 120,
      child: ElevatedButton(
        onPressed: onpress,
        style: ElevatedButton.styleFrom(
          primary: Colors.green.shade500,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(10),
          ),
        ),
        child: Text(
          name,
          style: const TextStyle(color: Colors.white, fontSize: 28),
        ),
      ),
    );
  }
}
/*width: double.infinity,
                height: 550,
                padding: const EdgeInsets.all(20.0),
                decoration: const BoxDecoration(
                  borderRadius: BorderRadius.only(
                    bottomRight: Radius.circular(450),
                  ),
                  color: Color.fromARGB(141, 76, 175, 79),
                ), */