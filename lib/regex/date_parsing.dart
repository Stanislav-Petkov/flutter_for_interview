bool matchesPattern(String input, String pattern) {
  final regex = RegExp(pattern);
  return regex.hasMatch(input);
}

void main() {
  final dateString1 = '10-10-2010';
  final dateString2 = '2010-10-10';
  final pattern1 = r'\d{2}-\d{2}-\d{4}'; // yyyy-MM-dd format pattern
  // regex to match yyyy-MM-dd
  final pattern2 = (r'^\d{4}-\d{2}-\d{2}$');
  if (matchesPattern(dateString2, pattern1)) {
    print('String matches the pattern.');
  } else {
    print('String does not match the pattern.');
  }
}