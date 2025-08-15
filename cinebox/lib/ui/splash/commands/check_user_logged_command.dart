import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'check_user_logged_command.g.dart';

@riverpod
class CheckUserLoggedCommand extends _$CheckUserLoggedCommand {
  @override
  Future<bool?> build() async => null;

  Future<void> execute() async {
    state = AsyncLoading();

    await Future.delayed(const Duration(seconds: 10));

    state = AsyncData(false);
  }
}
