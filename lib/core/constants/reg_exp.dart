class RegularExp{
  static RegExp egyptPhoneRegex = RegExp(r'^01[0125][0-9]{8}$');
  static RegExp passwordRegex = RegExp(r'^(?=.*?[A-Z])(?=.*?[a-z])(?=.*?[0-9])(?=.*?[!@#\$&*~]).{6,}$');
  static RegExp splitStringRegex = RegExp('r^\S(0|1)\-(\w+)');
}
