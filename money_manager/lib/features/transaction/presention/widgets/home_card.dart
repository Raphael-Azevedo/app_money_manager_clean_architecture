import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';

import '../controller/transaction_controller.dart';

class HomeCard extends StatefulWidget {
  final TransactionController controller;

  const HomeCard({required this.controller,
    Key? key,
  }) : super(key: key);

  @override
  State<HomeCard> createState() => _HomeCardState();
}
class _HomeCardState extends State<HomeCard> {
  
 
  @override
  Widget build(BuildContext context) {
    
    return Container(
      height: 260,
      decoration: BoxDecoration(
        color: Theme.of(context).colorScheme.primary,
        borderRadius: const BorderRadius.only(
          bottomLeft: Radius.circular(35),
          bottomRight: Radius.circular(35),
        ),
      ),
      child: Observer(
        builder: ((_) => Column(
              children: [
                Column(
                  children: [
                    Padding(
                      padding: const EdgeInsets.only(top: 30.0, bottom: 20),
                      child: Text(
                        'R\$ ${widget.controller.valueTotal.toStringAsFixed(2)}',
                        style: const TextStyle(
                            color: Colors.white,
                            fontSize: 30,
                            fontWeight: FontWeight.bold),
                      ),
                    ),
                    const Padding(
                      padding: EdgeInsets.only(bottom: 20),
                      child: Text(
                        'Saldo total disponível após efetuado os débitos',
                        style: TextStyle(
                          color: Colors.white,
                        ),
                      ),
                    ),
                  ],
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    Container(
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(25),
                          color: Colors.green),
                      width: 180,
                      child: ListTile(
                        leading: const Icon(Icons.download,
                            color: Colors.white, size: 40),
                        title: const Text(
                          'Entradas',
                          style: TextStyle(
                            color: Colors.white,
                          ),
                        ),
                        subtitle: FittedBox(
                          child: Text(
                            widget.controller.valueEntrance.toStringAsFixed(2),
                            style: const TextStyle(
                              color: Colors.white,
                              fontWeight: FontWeight.bold,
                              fontSize: 25,
                            ),
                          ),
                        ),
                      ),
                    ),
                    Container(
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(25),
                          color: Colors.red),
                      width: 180,
                      child: ListTile(
                        leading: const Icon(Icons.upload,
                            color: Colors.white, size: 40),
                        title: const Text(
                          'Gastos',
                          style: TextStyle(
                            color: Colors.white,
                          ),
                        ),
                        subtitle: FittedBox(
                          child: Text(
                            widget.controller.valueCost.toStringAsFixed(2),
                            style: const TextStyle(
                              color: Colors.white,
                              fontWeight: FontWeight.bold,
                              fontSize: 25,
                            ),
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ],
            )),
      ),
    );
  }
}
              // if (state is TransactionInitialState) {
              //   return const Center(
              //     child: CircularProgressIndicator(),
              //   );