import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mafqood/domain/usecases/login_usecase.dart';
import '../../../core/services/services_locator.dart';
import 'user_state.dart';

class UserCubit extends Cubit<UserState> {
  UserCubit() : super(UserInitial());

  static UserCubit get(context) => BlocProvider.of(context);
  LoginUsecase loginUsecase = LoginUsecase(authenticationBaseRepository: sl());

  void login({required String password, required String phone}) async {
    emit(LoginLoading());
    final response = await loginUsecase.execute(password: password, phone: phone);
    response.fold((l) {
      emit(LoginError(authErrorException: l));
    }, (r) {
      emit(LoginSuccess(authenticationEntity: r));
    });
  }
}
