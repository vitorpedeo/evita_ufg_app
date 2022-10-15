class StringUtils {
  static String getFirstName(String? name) {
    if (name == null) {
      return '';
    }

    String firstName = name.split(' ')[0];

    return firstName;
  }
}
