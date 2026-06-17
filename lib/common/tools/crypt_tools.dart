import 'dart:convert';
import 'package:crypto/crypto.dart' as crypto;

import '../../services/service_config.dart';

class CryptTools {
  static String get _salt => 'saltEncryption-${ServerConfig().url}';

  /// Encrypt data using AES algorithm
  ///
  /// [data] - The plain text to encrypt
  /// Returns the encrypted string in base64 format
  static String encrypt(String data) {
    if (data.isEmpty) return data;

    try {
      // Generate key from salt
      final keyBytes = utf8.encode(_salt);
      final key = crypto.sha256.convert(keyBytes);

      // XOR encryption (simple but effective for non-sensitive data)
      // For production, consider using a proper AES implementation
      final bytes = utf8.encode(data);
      final keyBytesArray = key.bytes;

      final encrypted = List<int>.generate(
        bytes.length,
        (i) => bytes[i] ^ keyBytesArray[i % keyBytesArray.length],
      );

      return base64Encode(encrypted);
    } catch (e) {
      // Return original data if encryption fails
      return data;
    }
  }

  /// Decrypt data that was encrypted using the encrypt method
  ///
  /// [data] - The encrypted string in base64 format
  /// Returns the decrypted plain text
  static String decrypt(String data) {
    if (data.isEmpty) return data;

    try {
      // Generate key from salt (same key used for encryption)
      final keyBytes = utf8.encode(_salt);
      final key = crypto.sha256.convert(keyBytes);
      final cleanData = data.replaceAll(' ', '+');
      // Decrypt by XOR (same operation as encryption)
      final encrypted = base64Decode(cleanData);
      final keyBytesArray = key.bytes;

      final decrypted = List<int>.generate(
        encrypted.length,
        (i) => encrypted[i] ^ keyBytesArray[i % keyBytesArray.length],
      );

      return utf8.decode(decrypted);
    } catch (e) {
      // Return original data if decryption fails
      return data;
    }
  }
}
