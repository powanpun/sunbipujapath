class Result<T, U> {
  DataError? _error;
  T? _value;

  Result.success(T value) {
    this._value = value;
  }

  Result.error(DataError error) {
    this._error = error;
  }

  bool isError() {
    return _value == null;
  }

  bool isSuccess() {
    return _value != null;
  }

  T? getValue() {
    if (_value == null) throw NullThrownError();
    return _value;
  }

  DataError? getErrorMsg() {
    if (_error == null) throw NullThrownError();
    return _error;
  }
}

class DataError {
  final String message;
  final int errorCode;

  DataError(this.message, this.errorCode);
}