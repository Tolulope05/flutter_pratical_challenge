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

## Author - Tolulope Fakunle (Flutter Develoer)

