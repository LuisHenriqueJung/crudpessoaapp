// ignore_for_file: prefer_const_constructors

import 'package:crud_pessoas/components/custom_textfield.dart';
import 'package:crud_pessoas/controller/pessoa_controller.dart';

import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter_modular/flutter_modular.dart';

class CadastrarPage extends StatelessWidget {
  const CadastrarPage({super.key});

  @override
  Widget build(BuildContext context) {
    var pessoaController = Modular.get<Controller>();

    return Scaffold(
      appBar: AppBar(
        title: Text('Cadastrar Pessoa'),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(12.0),
          child: Column(
            children: [
              SizedBox(
                height: 30,
              ),
              CustomTextField(
                controller: pessoaController.nomeController,
                hint: 'Nome',
                label: 'Insira o nome',
                keyboardType: TextInputType.name,
              ),
              SizedBox(
                height: 30,
              ),
              CustomTextField(
                controller: pessoaController.emailController,
                hint: 'email',
                label: 'Insira o email',
                keyboardType: TextInputType.emailAddress,
              ),
              SizedBox(
                height: 30,
              ),
              CustomTextField(
                controller: pessoaController.idadeController,
                hint: 'Idade',
                label: 'Insira a idade',
                keyboardType: TextInputType.number,
              ),
              SizedBox(
                height: 30,
              ),
              CustomTextField(
                  controller: pessoaController.enderecoController,
                  hint: 'Endereço ',
                  label: 'Insira o endereço'),
              SizedBox(
                height: 30,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  ElevatedButton(
                      onPressed: () => pessoaController.cadastrarPessoa(),
                      child: Text('Ok')),
                  SizedBox(
                    width: 50,
                  ),
                  ElevatedButton(
                      onPressed: () {
                        pessoaController.limparCampos();
                        Modular.to.popAndPushNamed('/listagem');
                      },
                      child: Text('Cancelar'))
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}
