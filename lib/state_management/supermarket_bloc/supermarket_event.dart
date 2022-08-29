part of 'supermarket_bloc.dart';

abstract class SupermarketEvent extends Equatable {
  const SupermarketEvent();

  @override
  List<Object> get props => [];
}

class ViewAllSupermarket extends SupermarketEvent {}

class AddNewSuperMarket extends SupermarketEvent {
  String nameSupermarket;

  AddNewSuperMarket({
    required this.nameSupermarket,
  });
}
