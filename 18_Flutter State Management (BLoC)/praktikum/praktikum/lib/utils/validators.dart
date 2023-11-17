bool isValidName(String? value) {
  if (value == null || value.isEmpty) return false;
  final words = value.split(' ');
  if (words.length < 2) return false;
  for (final word in words) {
    if (!RegExp(r'^[A-Z][a-z]*$').hasMatch(word)) {
      return false;
    }
  }
  return true;
}

bool isValidPhoneNumber(String? value) {
  if (value == null || value.isEmpty) return false;
  return RegExp(r'^0[0-9]{7,14}$').hasMatch(value);
}
