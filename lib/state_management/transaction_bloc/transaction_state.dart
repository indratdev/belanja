part of 'transaction_bloc.dart';

abstract class TransactionState extends Equatable {
  const TransactionState();

  @override
  List<Object> get props => [];
}

abstract class FailureTransactionState extends TransactionState {
  String messageError;

  FailureTransactionState({
    required this.messageError,
  });
}

class TransactionInitial extends TransactionState {}

class LoadingInitialTransaction extends TransactionState {}

class FailureInitialTransaction extends FailureTransactionState {
  FailureInitialTransaction({required super.messageError});
}

class SuccessInitialTransaction extends TransactionState {
  Map<String, dynamic> result = {};

  SuccessInitialTransaction({
    required this.result,
  });

  @override
  List<Object> get props => [result];
}
