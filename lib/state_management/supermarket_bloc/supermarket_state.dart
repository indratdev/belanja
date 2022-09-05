part of 'supermarket_bloc.dart';

abstract class SupermarketState extends Equatable {
  const SupermarketState();

  @override
  List<Object> get props => [];
}

abstract class FailureSupermarket extends SupermarketState {
  String messageError;

  FailureSupermarket({
    required this.messageError,
  });

  @override
  List<Object> get props => [messageError];
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

class LoadingDeleteSupermarket extends SupermarketState {}

class FailureDeleteSupermarket extends FailureViewSupermarket {
  FailureDeleteSupermarket({required super.messageError});
}

class SuccessDeleteSupermarket extends SupermarketState {
  int result;

  SuccessDeleteSupermarket({
    required this.result,
  });

  @override
  List<Object> get props => [result];
}

// location
class LoadingLocationSupermarket extends SupermarketState {}

class FailureLocationSupermarket extends FailureSupermarket {
  FailureLocationSupermarket({required super.messageError});
}

class SuccessAddLocationSupermarket extends SupermarketState {
  int result;

  SuccessAddLocationSupermarket({
    required this.result,
  });

  @override
  List<Object> get props => [result];
}

class LoadingViewLocationById extends SupermarketState {}

class FailureViewLocationById extends FailureSupermarket {
  FailureViewLocationById({required super.messageError});
}

class SuccessViewLocationById extends SupermarketState {
  List<SupermarketLocationModel> result;

  SuccessViewLocationById({
    required this.result,
  });

  @override
  List<Object> get props => [result];
}

class LoadingViewAllLocationById extends SupermarketState {}

class FailureViewAllLocationById extends FailureSupermarket {
  FailureViewAllLocationById({required super.messageError});
}

class SuccessViewAllLocationById extends SupermarketState {
  List<SupermarketLocationModel> result;

  SuccessViewAllLocationById({
    required this.result,
  });

  @override
  List<Object> get props => [result];
}

// delete location by id

class LoadingDeleteLocationByIdState extends SupermarketState {}

class FailureDeleteLocationById extends FailureSupermarket {
  FailureDeleteLocationById({required super.messageError});
}

class SuccessDeleteLocationById extends SupermarketState {
  int result;

  SuccessDeleteLocationById({
    required this.result,
  });

  @override
  List<Object> get props => [result];
}
