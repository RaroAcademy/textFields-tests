import 'package:cpf_cnpj_validator/cpf_validator.dart';
import 'package:password_strength/password_strength.dart';

class Validators {
  String validateName(String value) {
    return value.isEmpty ? "Preencha corretamente o nome!" : null;
  }

  String validateAge(String value) {
    if (value.length != 10) {
      return "Insira data no formato dd/mm/yyyy";
    } else {
      final dateList = value.split("/");
      try {
        if ((0 >= int.tryParse(dateList[0])) ||
            int.tryParse(dateList[0]) > 31) {
          return "Digite um dia válido";
        } else if (1 > int.tryParse(dateList[1]) ||
            int.tryParse(dateList[1]) > 12) {
          return "Digite um mês válido";
        }

        final date = DateTime(
          int.tryParse(dateList[2]),
          int.tryParse(dateList[1]),
          int.tryParse(dateList[0]),
        );

        bool has18 =
            DateTime.now().subtract(Duration(days: 6570)).isAfter(date);
        bool hasLessThan120 =
            DateTime.now().subtract(Duration(days: 43800)).isAfter(date);

        if (has18) {
          if (hasLessThan120) {
            return "Data inválida";
          }
          return null;
        } else {
          return "É necessário ser maior de 18 anos";
        }
      } catch (e) {
        return "Insira data no formato dd/mm/yyyy";
      }
    }
  }

  String cpfValidator(String value) {
    if (CPFValidator.isValid(value)) {
      return null;
    } else {
      return "CPF inválido";
    }
  }

  String validatePassword(String value, String value1) {
    if (value != value1) {
      return "As senhas não conferem";
    }
    double strength = estimatePasswordStrength(value);
    if (strength > 0.4) {
      return null;
    } else {
      var myRichRunesMessage = new Runes(
        ' \u{1F512} Escolha uma senha mais forte',
      );

      return new String.fromCharCodes(myRichRunesMessage);
    }
  }
}
