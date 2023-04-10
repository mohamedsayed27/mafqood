import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mafqood/domain/usecases/forget_password_usecase.dart';
import 'package:mafqood/domain/usecases/login_usecase.dart';
import 'package:mafqood/domain/usecases/reset_password_usecase.dart';
import '../../../core/services/services_locator.dart';
import '../../../domain/usecases/register_usecase.dart';
import '../../../domain/usecases/verify_phone.dart';
import 'user_state.dart';

class UserCubit extends Cubit<UserState> {
  UserCubit() : super(UserInitial());

  static UserCubit get(context) => BlocProvider.of(context);
  LoginUsecase loginUsecase =
      LoginUsecase(authenticationBaseRepository: sl());
  RegisterUsecase registerUsecase =
      RegisterUsecase(authenticationBaseRepository: sl());
  VerifyPhoneUsecase verifyPhoneUsecase =
      VerifyPhoneUsecase(authenticationBaseRepository: sl());
  ResetPasswordUsecase resetPasswordUsecase =
      ResetPasswordUsecase(authenticationBaseRepository: sl());
  ForgetPasswordUsecase forgetPasswordUsecase =
      ForgetPasswordUsecase(authenticationBaseRepository: sl());

  void login({
    required String password,
    required String phone,
  }) async {
    emit(LoginLoading());
    final response =
        await loginUsecase.execute(password: password, phone: phone);
    response.fold((l) {
      print(l);
      emit(LoginError(authErrorException: l));
    }, (r) {
      print(r);
      emit(LoginSuccess(authenticationEntity: r));
    });
  }

  void register({
    required String password,
    required String phone,
    required String firstName,
    required String lastName,
  }) async {
    emit(RegisterLoading());
    final response = await registerUsecase.execute(
        password: password,
        phone: phone,
        firstName: firstName,
        lastName: lastName);
    response.fold((l) {
      print(l);
      emit(RegisterError(authErrorException: l));
    }, (r) {
      print(r);
      emit(RegisterSuccess(authenticationEntity: r));
    });
  }

  void verifyPhone({
    required String code,
    required String phone,
  }) async {
    emit(VerifyPhoneLoading());
    final response = await verifyPhoneUsecase.execute(phone: phone, code: code);
    response.fold((l) {
      print(l);
      emit(VerifyPhoneError(authErrorException: l));
    }, (r) {
      print(r);
      emit(VerifyPhoneSuccess(authenticationEntity: r));
    });
  }

  void resetPassword({
    required String password,
    required String code,
    required String phone,
  }) async {
    emit(ResetPasswordLoading());
    final response = await resetPasswordUsecase.execute(
        password: password, phone: phone, code: code);
    response.fold((l) {
      print(l);
      emit(ResetPasswordError(authErrorException: l));
    }, (r) {
      print(r);
      emit(ResetPasswordSuccess(authenticationEntity: r));
    });
  }

  void forgetPassword({
    required String phone,
  }) async {
    emit(ForgetPasswordLoading());
    final response = await forgetPasswordUsecase.execute(phone: phone);
    response.fold((l) {
      print(l);
      emit(ForgetPasswordError(authErrorException: l));
    }, (r) {
      print(r);
      emit(ForgetPasswordSuccess(authenticationEntity: r));
    });
  }
}
