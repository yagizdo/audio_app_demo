import '../../utils/extensions/validation_query.dart';

class Validator {

  static String? email(String? value) {
    if (ValidationQuery.emailValidationQuery.hasMatch(value!)) {
      return null;
    }
    return "Lütfen geçerli bir e-posta adresi giriniz";
  }

  static String? name(String? value) {
    if (value == null || value.isEmpty) {
      return "Lütfen adınızı giriniz";
    } else if (value.length < 3) {
      return "Adınızı eksik girdiniz";
    }
    return null;
  }

  static String? phoneNumber(String? value) {
    if (value == null || value.isEmpty) {
      return "Lütfen telefon numaranızı giriniz";
    } else if (value.length < 11) {
      return "Telefon numaranızı eksik girdiniz";
    } else if (value.length > 11) {
      return "Telefon numaranızı fazla girdiniz";
    } else if (value.startsWith("0") == false) {
      return "Telefon numaranızı başında 0 olacak şekilde giriniz";
    } else if (!ValidationQuery.phoneNumValidationQuery.hasMatch(value)) {
      return "Telefon numaranızı hatalı girdiniz";
    }
    return null;
  }

  static String? password(String? value) {
    if (value == null || value.isEmpty) {
      return "Lütfen şifrenizi giriniz";
    } else if (value.length < 8) {
      return "Lütfen minimum 8 haneli şifre giriniz";
    }
    return null;
  }

  static String? confirmPassword(String? value, String? password) {
    if (value == null || value.isEmpty) {
      return "Lütfen şifrenizi tekrar giriniz";
    } else if (value != password) {
      return "Şifreleriniz uyuşmuyor";
    }
    return null;
  }
}