class PhoneUtil {

  /// Check string is empty
  /// param (value)
  static bool isPhone(String value) {
    /// In the case value is null
    if (value == null || value.isEmpty || value.trim().isEmpty) {
      return false;
    }
    Pattern pattern =  r'^[(]{0,1}[0-9]{3}[)]{0,1}[-\s\.]{0,1}[0-9]{3}[-\s\.]{0,1}[0-9]{4}$';
    RegExp regex = RegExp(pattern);
    if (regex.hasMatch(value)){
      return true;
    }
    return false;
  }
}
