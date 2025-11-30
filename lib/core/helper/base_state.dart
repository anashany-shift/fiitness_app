import 'package:equatable/equatable.dart';

class BaseState<T> extends Equatable {
  final bool? isLoading;
  final String? errorMessage;
  final T? data;
  const BaseState({this.data, this.errorMessage, this.isLoading = false});
  factory BaseState.error(String? message) => BaseState(errorMessage: message);
  factory BaseState.success(T? data) => BaseState(data: data);
  factory BaseState.loading() => BaseState(isLoading: true);
  @override
  List<Object?> get props => [isLoading, errorMessage, data];
}