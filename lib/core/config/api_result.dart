sealed class ApiResult<T> {}

class ApiSuccessResult<T> extends ApiResult<T> {
  final T data;
  ApiSuccessResult(this.data);
}

class ApiErrorResult<T> extends ApiResult<T> {
  String errorMessage;
  ApiErrorResult(this.errorMessage);
}
