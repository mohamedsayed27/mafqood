import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:jwt_decoder/jwt_decoder.dart';
import 'package:mafqood/core/cache_manager/cache_keys.dart';
import 'package:mafqood/core/cache_manager/shared_preferences.dart';
import 'package:mafqood/core/constants/constants.dart';
import 'package:mafqood/domain/usecases/auth_usecases/forget_password_usecase.dart';
import 'package:mafqood/domain/usecases/auth_usecases/login_usecase.dart';
import 'package:mafqood/domain/usecases/auth_usecases/reset_password_usecase.dart';
import '../../../data/models/user_data_model.dart';
import '../../../domain/usecases/auth_usecases/register_usecase.dart';
import '../../../domain/usecases/auth_usecases/verify_phone.dart';
import 'user_state.dart';

class UserCubit extends Cubit<UserState> {
  UserCubit(this.loginUsecase, this.registerUsecase, this.verifyPhoneUsecase,
      this.resetPasswordUsecase, this.forgetPasswordUsecase)
      : super(UserInitial());

  static UserCubit get(context) => BlocProvider.of(context);
  final LoginUsecase loginUsecase;

  final RegisterUsecase registerUsecase;

  final VerifyPhoneUsecase verifyPhoneUsecase;

  final ResetPasswordUsecase resetPasswordUsecase;

  final ForgetPasswordUsecase forgetPasswordUsecase;

  UserDataModel? userDataModel;

  void login({
    required String password,
    required String phone,
  }) async {
    emit(LoginLoading());
    final response =
        await loginUsecase(LoginParameter(password: password, phone: phone));
    response.fold((l) {
      emit(LoginError(authErrorException: l));
    }, (r) {
      emit(LoginSuccess(authenticationEntity: r));
    });
  }

  void register(RegisterParameter registerParameter) async {
    emit(RegisterLoading());
    final response = await registerUsecase(registerParameter);
    response.fold((l) {
      emit(RegisterError(authErrorException: l));
    }, (r) {
      emit(RegisterSuccess(authenticationEntity: r));
    });
  }

  void verifyPhone({
    required String code,
    required String phone,
  }) async {
    emit(VerifyPhoneLoading());
    final response = await verifyPhoneUsecase(
        VerifyPhoneParameter(phone: phone, code: code));
    response.fold((l) {
      emit(VerifyPhoneError(authErrorException: l));
    }, (r) {
      emit(VerifyPhoneSuccess(authenticationEntity: r));
    });
  }

  void resetPassword({
    required String password,
    required String code,
    required String phone,
  }) async {
    emit(ResetPasswordLoading());
    final response = await resetPasswordUsecase(
        ResetPasswordParameters(password: password, phone: phone, code: code));
    response.fold((l) {
      emit(ResetPasswordError(authErrorException: l));
    }, (r) {
      emit(ResetPasswordSuccess(authenticationEntity: r));
    });
  }

  void forgetPassword({
    required String phone,
  }) async {
    emit(ForgetPasswordLoading());
    final response = await forgetPasswordUsecase(phone);
    response.fold((l) {
      emit(ForgetPasswordError(authErrorException: l));
    }, (r) {
      emit(ForgetPasswordSuccess(authenticationEntity: r));
    });
  }

  void getUserData({required String? token}) async {
    emit(GetUserDataLoading());
    try {
      Map<String, dynamic> decodedToken = JwtDecoder.decode(token!);
      userDataModel = UserDataModel.fromJson(decodedToken);
      if (userId == null) {
        print(userId);
        CacheHelper.saveData(
          key: CacheKeys.userId,
          value: userDataModel!.nameid,
        ).whenComplete(() {
          userId = CacheHelper.getData(key: CacheKeys.userId);
        });
      }
      print(userId);
      emit(GetUserDataSuccess(userDataModel: userDataModel!));
    } catch (error) {
      emit(GetUserDataError(error: error.toString()));
    }
  }
}
