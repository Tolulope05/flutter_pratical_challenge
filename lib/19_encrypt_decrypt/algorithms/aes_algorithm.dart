import 'dart:convert';
import 'dart:developer';

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
    log(encrypted!.base64);
  }

  static decryptAES(plainText) {
    final key = Key.fromUtf8(
        '82a645babc5cd41c9a2cb4d0d3ba17ad'); // my 32 length key................

    final iv = IV.fromLength(16);
    final encrypter = Encrypter(AES(key));
    decrypted = encrypter.decrypt(encrypted!, iv: iv);
    log(decrypted);
  }

//for Salsa Algorithms

  static Encrypted? encryptedSalsa;
  static String? decryptedSalsa;

  static encryptSalsa(plainText) {
    final key = Key.fromUtf8(
        '82a645babc5cd41c9a2cb4d0d3ba17ad'); // my 32 length key................

    final iv = IV.fromLength(8);
    final encrypter = Encrypter(Salsa20(key));
    encryptedSalsa = encrypter.encrypt(plainText, iv: iv);
    log(encryptedSalsa!.base64);
  }

  static decryptSalsa(plainText) {
    final key = Key.fromUtf8(
        '82a645babc5cd41c9a2cb4d0d3ba17ad'); // my 32 length key................

    final iv = IV.fromLength(8);
    final encrypter = Encrypter(Salsa20(key));
    decryptedSalsa = encrypter.decrypt(encryptedSalsa!, iv: iv);
    log(decryptedSalsa!);
  }

//for Fernet Algorithms

  static Encrypted? encryptedFernet;
  static String? decryptedFernet;

  static encryptFernet(plainText) {
    final key = Key.fromUtf8(
        '82a645babc5cd41c9a2cb4d0d3ba17ad'); // my 32 length key................

    final iv = IV.fromLength(8);
    final b64key = Key.fromUtf8(base64Url.encode(key.bytes));
    final fernet = Fernet(b64key);
    final encrypter = Encrypter(fernet);
    encryptedFernet = encrypter.encrypt(plainText, iv: iv);
    log(encryptedFernet!.base64);
    log(fernet.extractTimestamp(encryptedFernet!.bytes).toString());
  }

  static decryptFernet(plainText) {
    final key = Key.fromUtf8(
        '82a645babc5cd41c9a2cb4d0d3ba17ad'); // my 32 length key................

    final iv = IV.fromLength(8);
    final b64key = Key.fromUtf8(base64Url.encode(key.bytes));
    final fernet = Fernet(b64key);
    final encrypter = Encrypter(fernet);
    decryptedFernet = encrypter.decrypt(encryptedFernet!, iv: iv);
    log(decryptedFernet!);
  }
}
