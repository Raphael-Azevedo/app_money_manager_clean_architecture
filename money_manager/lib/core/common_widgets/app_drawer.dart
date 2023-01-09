import 'package:flutter/material.dart';

class AppDrawer extends StatelessWidget {
  const AppDrawer({super.key});

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: Column(
        children: [
          Container(
            height: 80,
            color: Theme.of(context).colorScheme.primary,
            child: const Center(
              child: Text(
                'Money Manager',
                style: TextStyle(
                    color: Colors.white,
                    fontSize: 20,
                    fontWeight: FontWeight.bold),
              ),
            ),
          ),
          ListTile(
            leading: const Icon(Icons.home),
            title: const Text('Home'),
            onTap: () {},
          ),
          ListTile(
            leading: const Icon(Icons.payment),
            title: const Text('Transações'),
            onTap: () {},
          ),
          ListTile(
            leading: const Icon(Icons.add),
            title: const Text('Adicionar entrada'),
            onTap: () {},
          ),
          ListTile(
            leading: const Icon(Icons.remove),
            title: const Text('Adicionar gasto'),
            onTap: () {},
          ),
        ],
      ),
    );
  }
}
