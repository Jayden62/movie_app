class StringUtil {
  /// Check string is empty
  /// param (value)
  static bool isEmpty(String value) {
    /// In the case value is null
    if (value == null) {
      return true;
    }

    /// In the case value is empty
    if (value.isEmpty || value.trim().isEmpty) {
      return true;
    }
    return false;
  }

  /// Check string is empty
  /// param (value)
  static bool isNotEmpty(String value) {
    /// In the case value is null
    if (value == null) {
      return false;
    }

    /// In the case value is empty
    if (value.isEmpty || value.trim().isEmpty) {
      return false;
    }
    return true;
  }

  /// Init string
  /// param (value)
  static String initText(String value) {
    /// In the case value is null
    if (value == null) {
      return '';
    }
    return value;
  }
}
