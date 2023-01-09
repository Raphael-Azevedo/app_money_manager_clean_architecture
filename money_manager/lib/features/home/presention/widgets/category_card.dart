import 'package:flutter/material.dart';

class CategoryCard extends StatefulWidget {
  final String cardName;
  final IconData iconButton;
  const CategoryCard(
      {super.key, required this.cardName, required this.iconButton});

  @override
  State<CategoryCard> createState() => _CategoryCardState();
}

class _CategoryCardState extends State<CategoryCard> {
  bool selecionado = false;
  late int valorSelecionado;
  @override
  Widget build(BuildContext context) {
    return Tooltip(
      message: widget.cardName,
      child: InkWell(
        onTap: () {
          setState(() {
            selecionado = !selecionado;
            valorSelecionado = 1;
          });
        },
        child: AnimatedContainer(
          margin: const EdgeInsets.symmetric(horizontal: 5),
          height: 45,
          width: 45,
          duration: const Duration(milliseconds: 200),
          curve: Curves.easeInOut,
          decoration: BoxDecoration(
            color: selecionado
                ? Theme.of(context).colorScheme.primary
                : Colors.grey,
            borderRadius: BorderRadius.circular(45),
          ),
          child: Icon(widget.iconButton),
        ),
      ),
    );
  }
}
