import 'package:ecommerce_app/src/features/authentication/data/fake_auth_repository.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class AccountScreenController extends StateNotifier<AsyncValue<void>> {
  AccountScreenController({required this.authRepository})
      : super(const AsyncData(null));
  final FakeAuthRepository authRepository;

  Future<void> signOut() async {
    // try {
    //   state = const AsyncValue.loading();
    //   await authRepository.signOut();
    //   state = const AsyncValue.data(null);
    //   return true;
    // } catch (e, st) {
    //   state = AsyncValue.error(e, st);
    //   return false;
    // }
    state = const AsyncLoading();
    state = await AsyncValue.guard(() => authRepository.signOut());
    // state = const AsyncValue.loading();
    // state = await AsyncValue.guard(() => authRepository.signOut());
    // return state.hasError == false;
  }
}

final accountScreenControllerProvider = StateNotifierProvider.autoDispose<
    AccountScreenController, AsyncValue<void>>((ref) {
  final authRepository = ref.watch(authRepositoryProvider);
  return AccountScreenController(authRepository: authRepository);
});
