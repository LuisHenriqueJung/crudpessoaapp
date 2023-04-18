import 'package:crud_pessoas/database/db_connection.dart';
import 'package:crud_pessoas/models/pessoa.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:mobx/mobx.dart';
part 'pessoa_controller.g.dart';

class Controller = ControllerBase with _$Controller;

abstract class ControllerBase with Store {
  @observable
  TextEditingController nomeController = TextEditingController();

  @observable
  TextEditingController enderecoController = TextEditingController();

  @observable
  TextEditingController idadeController = TextEditingController();

  @observable
  TextEditingController emailController = TextEditingController();

  @observable
  ObservableList<Pessoa> listPessoas = ObservableList();

  @observable
  Pessoa pessoa =
      Pessoa(nome: 'nome', endereco: 'endereco', idade: 0, email: 'email');

  @action
  limparCampos() {
    nomeController.clear();
    enderecoController.clear();
    idadeController.clear();
    emailController.clear();
  }

  @action
  Future cadastrarPessoa() async {
    Pessoa novaPessoa = Pessoa(
        nome: nomeController.text,
        endereco: enderecoController.text,
        idade: int.parse(idadeController.text),
        email: emailController.text);
    listPessoas.add(await DbConnection.instance.insertPessoa(novaPessoa));
    limparCampos();
    Modular.to.popAndPushNamed('/listagem');
  }

  @action
  Future readAllPessoas() async {
    listPessoas =
        ObservableList.of(await DbConnection.instance.readAllPessoas());
  }

  @action
  Future readPessoa(int id) async {
    pessoa = await DbConnection.instance.readPessoa(id);
  }

  @action
  Future updatePessoa() async {
    if (await DbConnection.instance.updatePessoa(pessoa) == 0) {
      Fluttertoast.showToast(msg: 'Erro ao deletar pessoa');
    }
  }

  @action
  Future deletePessoa(int id) async {
    await DbConnection.instance.deletePessoa(id);
    readAllPessoas();
  }
}
