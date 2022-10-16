class StringUtils {
  static String getFirstName(String? name) {
    if (name == null) {
      return '';
    }

    String firstName = name.split(' ')[0];

    return firstName;
  }

  static String getFirstLetter(String? str) {
    if (str == null) {
      return '';
    }

    String firstLetter = str.substring(0, 1).toUpperCase();

    return firstLetter;
  }
}
