// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'pessoa_controller.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic, no_leading_underscores_for_local_identifiers

mixin _$Controller on ControllerBase, Store {
  late final _$nomeControllerAtom =
      Atom(name: 'ItemControllerBase.nomeController', context: context);

  @override
  TextEditingController get nomeController {
    _$nomeControllerAtom.reportRead();
    return super.nomeController;
  }

  @override
  set nomeController(TextEditingController value) {
    _$nomeControllerAtom.reportWrite(value, super.nomeController, () {
      super.nomeController = value;
    });
  }

  late final _$enderecoControllerAtom =
      Atom(name: 'ItemControllerBase.enderecoController', context: context);

  @override
  TextEditingController get enderecoController {
    _$enderecoControllerAtom.reportRead();
    return super.enderecoController;
  }

  @override
  set enderecoController(TextEditingController value) {
    _$enderecoControllerAtom.reportWrite(value, super.enderecoController, () {
      super.enderecoController = value;
    });
  }

  late final _$idadeControllerAtom =
      Atom(name: 'ItemControllerBase.idadeController', context: context);

  @override
  TextEditingController get idadeController {
    _$idadeControllerAtom.reportRead();
    return super.idadeController;
  }

  @override
  set idadeController(TextEditingController value) {
    _$idadeControllerAtom.reportWrite(value, super.idadeController, () {
      super.idadeController = value;
    });
  }

  late final _$emailControllerAtom =
      Atom(name: 'ItemControllerBase.emailController', context: context);

  @override
  TextEditingController get emailController {
    _$emailControllerAtom.reportRead();
    return super.emailController;
  }

  @override
  set emailController(TextEditingController value) {
    _$emailControllerAtom.reportWrite(value, super.emailController, () {
      super.emailController = value;
    });
  }

  late final _$listPessoasAtom =
      Atom(name: 'ItemControllerBase.listPessoas', context: context);

  @override
  ObservableList<Pessoa> get listPessoas {
    _$listPessoasAtom.reportRead();
    return super.listPessoas;
  }

  @override
  set listPessoas(ObservableList<Pessoa> value) {
    _$listPessoasAtom.reportWrite(value, super.listPessoas, () {
      super.listPessoas = value;
    });
  }

  late final _$pessoaAtom =
      Atom(name: 'ItemControllerBase.pessoa', context: context);

  @override
  Pessoa get pessoa {
    _$pessoaAtom.reportRead();
    return super.pessoa;
  }

  @override
  set pessoa(Pessoa value) {
    _$pessoaAtom.reportWrite(value, super.pessoa, () {
      super.pessoa = value;
    });
  }

  late final _$cadastrarPessoaAsyncAction =
      AsyncAction('ItemControllerBase.cadastrarPessoa', context: context);

  @override
  Future<dynamic> cadastrarPessoa() {
    return _$cadastrarPessoaAsyncAction.run(() => super.cadastrarPessoa());
  }

  late final _$readAllPessoasAsyncAction =
      AsyncAction('ItemControllerBase.readAllPessoas', context: context);

  @override
  Future<dynamic> readAllPessoas() {
    return _$readAllPessoasAsyncAction.run(() => super.readAllPessoas());
  }

  late final _$readPessoaAsyncAction =
      AsyncAction('ItemControllerBase.readPessoa', context: context);

  @override
  Future<dynamic> readPessoa(int id) {
    return _$readPessoaAsyncAction.run(() => super.readPessoa(id));
  }

  late final _$updatePessoaAsyncAction =
      AsyncAction('ItemControllerBase.updatePessoa', context: context);

  @override
  Future<dynamic> updatePessoa() {
    return _$updatePessoaAsyncAction.run(() => super.updatePessoa());
  }

  late final _$deletePessoaAsyncAction =
      AsyncAction('ItemControllerBase.deletePessoa', context: context);

  @override
  Future<dynamic> deletePessoa(int id) {
    return _$deletePessoaAsyncAction.run(() => super.deletePessoa(id));
  }

  late final _$ItemControllerBaseActionController =
      ActionController(name: 'ItemControllerBase', context: context);

  @override
  dynamic limparCampos() {
    final _$actionInfo = _$ItemControllerBaseActionController.startAction(
        name: 'ItemControllerBase.limparCampos');
    try {
      return super.limparCampos();
    } finally {
      _$ItemControllerBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  String toString() {
    return '''
nomeController: ${nomeController},
enderecoController: ${enderecoController},
idadeController: ${idadeController},
emailController: ${emailController},
listPessoas: ${listPessoas},
pessoa: ${pessoa}
    ''';
  }
}
