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

class DeleteSuperMarket extends SupermarketEvent {
  int? idSupermarket;

  DeleteSuperMarket({
    required this.idSupermarket,
  });
}

// lokasi
class AddLocationSupermarket extends SupermarketEvent {
  int idSupermarket;
  String locationName;

  AddLocationSupermarket({
    required this.idSupermarket,
    required this.locationName,
  });
}

class ViewLocationById extends SupermarketEvent {
  int idSupermarket;

  ViewLocationById({
    required this.idSupermarket,
  });
}
