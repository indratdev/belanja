part of 'transaction_bloc.dart';

abstract class TransactionEvent extends Equatable {
  const TransactionEvent();

  @override
  List<Object> get props => [];
}

class InitialTransactionEvent extends TransactionEvent {}

class ChangeSupernLocationEvent extends TransactionEvent {
  String supermarketName;

  ChangeSupernLocationEvent({
    required this.supermarketName,
  });
}
