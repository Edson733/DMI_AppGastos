class Validations {
  static String? validateEmail(String? value) {
    final RegExp emailRegExp = RegExp(
      r'^[\w-\.]+@([\w-]+\.)+[\w-]{2,4}$',
    );

    if (value == null || value.isEmpty) {
      return 'Por favor, coloque su correo electrónico';
    } else if (!emailRegExp.hasMatch(value)) {
      return 'Por favor, coloque un correo electrónico válido';
    }
    return null;
  }

  static String? validatePassword(String? value) {
    if (value == null || value.isEmpty) {
      return 'Por favor, coloque su contraseña';
    }
    return null;
  }

  static String? validateConfirmPassword(String? password, String? confirmPassword) {
    if (confirmPassword == null || confirmPassword.isEmpty) {
      return 'Por favor, confirme su contraseña';
    } else if (confirmPassword != password) {
      return 'Las contraseñas no coinciden';
    }
    return null;
  }

  static String? validateVerificationCode(String? value) {
    final RegExp codeRegExp = RegExp(r'^\d{6}$');

    if (value == null || value.isEmpty) {
      return 'Por favor, ingrese el código de verificación';
    } else if (!codeRegExp.hasMatch(value)) {
      return 'El código de verificación debe tener 6 dígitos';
    }
    return null;
  }
}