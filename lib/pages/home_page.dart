// ignore_for_file: prefer_const_constructors

import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Menu inicial'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            ElevatedButton(
                onPressed: () => Modular.to.pushNamed('/cadastrar'),
                child: Text('Incluir Pessoa')),
            SizedBox(
              height: 50,
            ),
            ElevatedButton(
                onPressed: () => Modular.to.pushNamed('/listagem'),
                child: Text('Listar Pessoas')),
          ],
        ),
      ),
    );
  }
}
