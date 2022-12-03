// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'cart_state.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic, no_leading_underscores_for_local_identifiers

mixin _$CartState on _CartState, Store {
  Computed<double>? _$totalPriceComputed;

  @override
  double get totalPrice =>
      (_$totalPriceComputed ??= Computed<double>(() => super.totalPrice,
              name: '_CartState.totalPrice'))
          .value;

  late final _$cartAtom = Atom(name: '_CartState.cart', context: context);

  @override
  Map<Product, int> get cart {
    _$cartAtom.reportRead();
    return super.cart;
  }

  @override
  set cart(Map<Product, int> value) {
    _$cartAtom.reportWrite(value, super.cart, () {
      super.cart = value;
    });
  }

  late final _$_CartStateActionController =
      ActionController(name: '_CartState', context: context);

  @override
  void addProduct(Product product) {
    final _$actionInfo =
        _$_CartStateActionController.startAction(name: '_CartState.addProduct');
    try {
      return super.addProduct(product);
    } finally {
      _$_CartStateActionController.endAction(_$actionInfo);
    }
  }

  @override
  void removeProduct(Product product) {
    final _$actionInfo = _$_CartStateActionController.startAction(
        name: '_CartState.removeProduct');
    try {
      return super.removeProduct(product);
    } finally {
      _$_CartStateActionController.endAction(_$actionInfo);
    }
  }

  @override
  void reduceProduct(Product product) {
    final _$actionInfo = _$_CartStateActionController.startAction(
        name: '_CartState.reduceProduct');
    try {
      return super.reduceProduct(product);
    } finally {
      _$_CartStateActionController.endAction(_$actionInfo);
    }
  }

  @override
  String toString() {
    return '''
cart: ${cart},
totalPrice: ${totalPrice}
    ''';
  }
}
