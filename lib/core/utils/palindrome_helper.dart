class PalindromeHelper {
  static bool isPalindrome(String text) {
    String cleanedText = text.replaceAll(RegExp(r'\s+'), '').toLowerCase();
    if (cleanedText.isEmpty) return false;

    String reversed = cleanedText.split('').reversed.join('');
    return cleanedText == reversed;
  }
}
