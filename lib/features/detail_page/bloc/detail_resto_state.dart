part of 'detail_resto_bloc.dart';

class DetailRestoState {
  final String message;
  final DetailStatusState status;
  final Restaurant? data;

  DetailRestoState({
    this.message = '',
    this.status = DetailStatusState.initial,
    this.data,
  });

  DetailRestoState copyWith({
    String? message,
    DetailStatusState? status,
    Restaurant? data,
  }) {
    return DetailRestoState(
      message: message ?? this.message,
      status: status ?? this.status,
      data: data ?? this.data,
    );
  }
}
