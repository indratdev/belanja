part of 'supermarket_bloc.dart';

abstract class SupermarketState extends Equatable {
  const SupermarketState();

  @override
  List<Object> get props => [];
}

class SupermarketInitial extends SupermarketState {}

// add new supermarket
class LoadingAddNewSupermarket extends SupermarketState {}

class FailureAddNewSupermarket extends SupermarketState {
  String messageError;

  FailureAddNewSupermarket({
    required this.messageError,
  });

  @override
  List<Object> get props => [messageError];
}

class SuccessAddNewSupermarket extends SupermarketState {
  int result;

  SuccessAddNewSupermarket({
    required this.result,
  });

  @override
  List<Object> get props => [result];
}

// !!! end new supermarket

// view supermarket
class LoadingViewSupermarket extends SupermarketState {}

class FailureViewSupermarket extends SupermarketState {
  String messageError;

  FailureViewSupermarket({
    required this.messageError,
  });

  @override
  List<Object> get props => [messageError];
}

class SuccessViewSupermarket extends SupermarketState {
  List<SupermarketModel> result;

  SuccessViewSupermarket({
    required this.result,
  });

  @override
  List<Object> get props => [result];
}

// !!! end view supermarket