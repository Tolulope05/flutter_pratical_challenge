import 'package:flutter/services.dart';

class ThousandsSeparatorInputFormatter extends TextInputFormatter {
  static const separator = ','; // Change this to '.' for other locales

  @override
  TextEditingValue formatEditUpdate(
      TextEditingValue oldValue, TextEditingValue newValue) {
    // Short-circuit if the new value is empty
    if (newValue.text.isEmpty) {
      return newValue.copyWith(text: '');
    }

    // Handle "deletion" of separator character
    String oldValueText = oldValue.text.replaceAll(separator, '');
    String newValueText = newValue.text.replaceAll(separator, '');

    if (oldValue.text.endsWith(separator) &&
        oldValue.text.length == newValue.text.length + 1) {
      newValueText = newValueText.substring(0, newValueText.length - 1);
    }

    // Only process if the old value and new value are different
    if (oldValueText != newValueText) {
      int selectionIndex =
          newValue.text.length - newValue.selection.extentOffset;
      final chars = newValueText.split('');

      String newString = '';
      for (int i = chars.length - 1; i >= 0; i--) {
        if ((chars.length - 1 - i) % 3 == 0 && i != chars.length - 1) {
          newString = separator + newString;
        }
        newString = chars[i] + newString;
      }

      return TextEditingValue(
        text: newString.toString(),
        selection: TextSelection.collapsed(
          offset: newString.length - selectionIndex,
        ),
      );
    }

    // If the new value and old value are the same, just return as-is
    return newValue;
  }
}

class RemoveLeadingZeroFormatter extends TextInputFormatter {
  @override
  TextEditingValue formatEditUpdate(
    TextEditingValue oldValue,
    TextEditingValue newValue,
  ) {
    if (newValue.text.startsWith('0') && newValue.text.length > 1) {
      return newValue.copyWith(
        text: newValue.text.substring(1),
        selection: TextSelection.collapsed(offset: newValue.text.length - 1),
      );
    } else {
      return newValue;
    }
  }
}

class DecimalTextInputFormatter extends TextInputFormatter {
  DecimalTextInputFormatter({this.decimalRange = 2})
      : assert(decimalRange >= 0);

  final int decimalRange;

  @override
  TextEditingValue formatEditUpdate(
    TextEditingValue oldValue,
    TextEditingValue newValue,
  ) {
    String nValue = newValue.text;
    if (nValue.contains('.')) {
      List<String> split = nValue.split('.');
      if (split[1].length > decimalRange) {
        return oldValue;
      }
    }

    return newValue;
  }
}

class CurrencyInputFormatter extends TextInputFormatter {
  CurrencyInputFormatter({this.decimalRange = 2}) : assert(decimalRange >= 0);

  final int decimalRange;

  @override
  TextEditingValue formatEditUpdate(
    TextEditingValue oldValue,
    TextEditingValue newValue,
  ) {
    String nValue = newValue.text;
    if (nValue.contains('.')) {
      List<String> split = nValue.split('.');
      if (split[1].length > decimalRange) {
        return oldValue;
      }
    }

    return newValue;
  }
}

class UpperCaseInputFormatter extends TextInputFormatter {
  @override
  TextEditingValue formatEditUpdate(
    TextEditingValue oldValue,
    TextEditingValue newValue,
  ) {
    return newValue.copyWith(text: newValue.text.toUpperCase());
  }
}

class LowerCaseInputFormatter extends TextInputFormatter {
  @override
  TextEditingValue formatEditUpdate(
    TextEditingValue oldValue,
    TextEditingValue newValue,
  ) {
    return newValue.copyWith(text: newValue.text.toLowerCase());
  }
}

class CapitalizeWordsInputFormatter extends TextInputFormatter {
  @override
  TextEditingValue formatEditUpdate(
    TextEditingValue oldValue,
    TextEditingValue newValue,
  ) {
    return newValue.copyWith(text: capitalize(newValue.text));
  }

  String capitalize(String s) => s.split(' ').map((str) {
        if (str.isNotEmpty) {
          return str[0].toUpperCase() + str.substring(1);
        } else {
          return '';
        }
      }).join(' ');
}
