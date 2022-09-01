class Errors {
  final String messageError;

  Errors({required this.messageError});

  @override
  String toString() => messageError;
}

class UnExistSupermarketException implements Exception {
  @override
  String toString() => 'Data Supermarket Sudah Ada';
}

class DataInputNullException implements Exception {
  @override
  String toString() => 'Data Input Kosong';
}

class UnExistLocationSupermarketException implements Exception {
  @override
  String toString() => 'Lokasi Supermarket Sudah Ada';
}
