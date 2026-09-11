part of 'wallet_cubit.dart';

@freezed
sealed class WalletState with _$WalletState {
  const WalletState._();

  const factory WalletState({
    @Default(true) bool isLoading,
    @Default(false) bool isSubmitting,
    DataError? error,
    @Default(0) int balance,
    @Default(<WalletEntryModel>[]) List<WalletEntryModel> entries,

    /// Top-up yang baru dibuat dan instruksinya masih perlu ditampilkan.
    WalletTopupModel? lastTopup,
  }) = _WalletState;

  bool get isEmpty => entries.isEmpty;
}
