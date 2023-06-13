## Explore Encrypt & Decrypt Data in Flutter

### 1. Encrypt & Decrypt Data in Flutter

#### 1.1. Encrypt & Decrypt Data in Flutter

- Encrypt & Decrypt Data in Flutter

```dart
import 'package:encrypt/encrypt.dart' as encrypt;

class EncryptDecryptData {
  static final key = encrypt.Key.fromUtf8('my 32 length key................');
  static final iv = encrypt.IV.fromLength(16);

  static String encryptData(String data) {
    final encrypter = encrypt.Encrypter(encrypt.AES(key));
    final encrypted = encrypter.encrypt(data, iv: iv);
    return encrypted.base64;
  }

  static String decryptData(String data) {
    final encrypter = encrypt.Encrypter(encrypt.AES(key));
    final decrypted = encrypter.decrypt64(data, iv: iv);
    return decrypted;
  }
}
```

##### 1.1.2 Types of Encryption

- AES
- Salsa20
- Fernet
- RSA
- Chacha20
- Twofish
- Blowfish
- Triple DES
- DES
- Rabbit
- SQRL

##### 1.1.3. Create a Key

- Create a Key

```dart
import 'package:encrypt/encrypt.dart' as encrypt;

class EncryptDecryptData {
  static final key = encrypt.Key.fromUtf8('my 32 length key................');
  static final iv = encrypt.IV.fromLength(16);
}
```

##### 1.1.4. Encrypt Data

- Encrypt Data

```dart

import 'package:encrypt/encrypt.dart' as encrypt;

class EncryptDecryptData {
  static final key = encrypt.Key.fromUtf8('my 32 length key................');
  static final iv = encrypt.IV.fromLength(16);

  static String encryptData(String data) {
    final encrypter = encrypt.Encrypter(encrypt.AES(key));
    final encrypted = encrypter.encrypt(data, iv: iv);
    return encrypted.base64;
  }
}
```

##### 1.1.5. Decrypt Data

- Decrypt Data

```dart

import 'package:encrypt/encrypt.dart' as encrypt;

class EncryptDecryptData {
  static final key = encrypt.Key.fromUtf8('my 32 length key................');
  static final iv = encrypt.IV.fromLength(16);

  static String decryptData(String data) {
    final encrypter = encrypt.Encrypter(encrypt.AES(key));
    final decrypted = encrypter.decrypt64(data, iv: iv);
    return decrypted;
  }
}
```

##### 1.1.6. Image gif from media

![Preview](/display/encrypt.gif)






## Author - Tolulope Fakunle (Flutter Develoer)

