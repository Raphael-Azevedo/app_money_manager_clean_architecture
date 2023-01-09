import 'package:flutter/material.dart';

import '../../features/home/presention/pages/add_transaction_page.dart';

class AppButton extends StatelessWidget {
  final String text;
  final IconData iconButton;
  const AppButton({
    Key? key,
    required this.text,
    required this.iconButton,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.pushNamed(context, AddTransactionPage.route);
      },
      child: Container(
        height: 40,
        decoration: BoxDecoration(
            gradient: const LinearGradient(
              colors: [
                Color.fromARGB(255, 149, 33, 136),
                Color.fromARGB(255, 193, 137, 200),
              ],
              begin: Alignment.centerLeft,
              end: Alignment.centerRight,
            ),
            borderRadius: const BorderRadius.all(
              Radius.circular(35.0),
            ),
            boxShadow: [
              BoxShadow(
                color: Colors.purple.withOpacity(0.3),
                spreadRadius: 4,
                blurRadius: 10,
                offset: const Offset(0, 3),
              )
            ]),
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Center(
            child: Row(
              children: [
                Icon(
                  iconButton,
                  color: Colors.white,
                ),
                Text(
                  text,
                  style: const TextStyle(color: Colors.white),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
