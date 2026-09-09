import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:navy_wear/core/data_state.dart';
import 'package:navy_wear/core/domain/model/order/order_models.dart';
import 'package:navy_wear/core/domain/repositories/transaction_repositories.dart';
import 'package:navy_wear/di/injector.dart';

part 'order_list_cubit.freezed.dart';
part 'order_list_state.dart';

class OrderListCubit extends Cubit<OrderListState> {
  OrderListCubit()
      : _orders = injector<OrderRepository>(),
        super(const OrderListState());

  static OrderListCubit get(BuildContext context) => BlocProvider.of(context);

  final OrderRepository _orders;

  Future<void> load() async {
    emit(state.copyWith(isLoading: true, error: null));

    final result = await _orders.list();
    if (isClosed) return;

    emit(switch (result) {
      DataSuccess<List<OrderModel>>(:final data) =>
        state.copyWith(isLoading: false, orders: data),
      DataEmpty() => state.copyWith(isLoading: false, orders: const []),
      DataFailed(:final error) =>
        state.copyWith(isLoading: false, error: error),
      _ => state.copyWith(isLoading: false),
    });
  }

  void selectTab(OrderTab tab) => emit(state.copyWith(tab: tab));
}
