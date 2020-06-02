// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'home_controller.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic

mixin _$HomeController on _HomeControllerBase, Store {
  final _$pedidoListAtom = Atom(name: '_HomeControllerBase.pedidoList');

  @override
  ObservableStream<List<PedidoModel>> get pedidoList {
    _$pedidoListAtom.context.enforceReadPolicy(_$pedidoListAtom);
    _$pedidoListAtom.reportObserved();
    return super.pedidoList;
  }

  @override
  set pedidoList(ObservableStream<List<PedidoModel>> value) {
    _$pedidoListAtom.context.conditionallyRunInAction(() {
      super.pedidoList = value;
      _$pedidoListAtom.reportChanged();
    }, _$pedidoListAtom, name: '${_$pedidoListAtom.name}_set');
  }

  final _$_HomeControllerBaseActionController =
      ActionController(name: '_HomeControllerBase');

  @override
  void getList() {
    final _$actionInfo = _$_HomeControllerBaseActionController.startAction();
    try {
      return super.getList();
    } finally {
      _$_HomeControllerBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  void save(PedidoModel model) {
    final _$actionInfo = _$_HomeControllerBaseActionController.startAction();
    try {
      return super.save(model);
    } finally {
      _$_HomeControllerBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  void delete(PedidoModel model) {
    final _$actionInfo = _$_HomeControllerBaseActionController.startAction();
    try {
      return super.delete(model);
    } finally {
      _$_HomeControllerBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  String toString() {
    final string = 'pedidoList: ${pedidoList.toString()}';
    return '{$string}';
  }
}
