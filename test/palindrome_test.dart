import 'package:flutter_test/flutter_test.dart';
import 'package:suitmedia_mobile_dev_intern/core/utils/palindrome_helper.dart';

void main() {
  group('Palindrome Validation Unit Tests', () {
    test('Harus bernilai true untuk kata palindrome kasur rusak', () {
      expect(PalindromeHelper.isPalindrome('kasur rusak'), isTrue);
    });

    test(
      'Harus bernilai true untuk kalimat palindrome multi-word step on no pets',
      () {
        expect(PalindromeHelper.isPalindrome('step on no pets'), isTrue);
        expect(PalindromeHelper.isPalindrome('put it up'), isTrue);
      },
    );

    test('Harus bernilai false untuk kata non-palindrome suitmedia', () {
      expect(PalindromeHelper.isPalindrome('suitmedia'), isFalse);
    });

    test('Harus bernilai false untuk string kosong', () {
      expect(PalindromeHelper.isPalindrome(''), isFalse);
      expect(PalindromeHelper.isPalindrome('   '), isFalse);
    });
  });
}
