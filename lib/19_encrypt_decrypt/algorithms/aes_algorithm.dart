import 'dart:convert';

import 'package:encrypt/encrypt.dart';

class EncryptData {
//for AES Algorithms

  static Encrypted? encrypted;
  static var decrypted;

  static encryptAES(plainText) {
    final key = Key.fromUtf8(
        '82a645babc5cd41c9a2cb4d0d3ba17ad'); //  my 32 length key................

    final iv = IV.fromLength(16);
    final encrypter = Encrypter(AES(key));
    encrypted = encrypter.encrypt(plainText, iv: iv);
    print(encrypted!.base64);
  }

  static decryptAES(plainText) {
    final key = Key.fromUtf8(
        '82a645babc5cd41c9a2cb4d0d3ba17ad'); // my 32 length key................

    final iv = IV.fromLength(16);
    final encrypter = Encrypter(AES(key));
    decrypted = encrypter.decrypt(encrypted!, iv: iv);
    print(decrypted);
  }

//for Salsa Algorithms

  static Encrypted? encryptedSalsa;
  static var decryptedSalsa;

  static encryptSalsa(plainText) {
    final key = Key.fromUtf8(
        '82a645babc5cd41c9a2cb4d0d3ba17ad'); // my 32 length key................

    final iv = IV.fromLength(8);
    final encrypter = Encrypter(Salsa20(key));
    encryptedSalsa = encrypter.encrypt(plainText, iv: iv);
    print(encryptedSalsa!.base64);
  }

  static decryptSalsa(plainText) {
    final key = Key.fromUtf8(
        '82a645babc5cd41c9a2cb4d0d3ba17ad'); // my 32 length key................

    final iv = IV.fromLength(8);
    final encrypter = Encrypter(Salsa20(key));
    decryptedSalsa = encrypter.decrypt(encryptedSalsa!, iv: iv);
    print(decryptedSalsa);
  }

//for Fernet Algorithms

  static Encrypted? encryptedFernet;
  static var decryptedFernet;

  static encryptFernet(plainText) {
    final key = Key.fromUtf8(
        '82a645babc5cd41c9a2cb4d0d3ba17ad'); // my 32 length key................

    final iv = IV.fromLength(8);
    final b64key = Key.fromUtf8(base64Url.encode(key.bytes));
    final fernet = Fernet(b64key);
    final encrypter = Encrypter(fernet);
    encryptedFernet = encrypter.encrypt(plainText, iv: iv);
    print(encryptedFernet!.base64);
    print(fernet.extractTimestamp(encryptedFernet!.bytes));
  }

  static decryptFernet(plainText) {
    final key = Key.fromUtf8(
        '82a645babc5cd41c9a2cb4d0d3ba17ad'); // my 32 length key................

    final iv = IV.fromLength(8);
    final b64key = Key.fromUtf8(base64Url.encode(key.bytes));
    final fernet = Fernet(b64key);
    final encrypter = Encrypter(fernet);
    decryptedFernet = encrypter.decrypt(encryptedFernet!, iv: iv);
    print(decryptedFernet);
  }
}
