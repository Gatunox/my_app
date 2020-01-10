import 'dart:convert';
import 'dart:io';

class Letter {
  String value;
  bool enabled;
  int points_to;

  Letter({value, enabled})
      : this.value = value,
        this.enabled = enabled ?? false;

  String get letter_value {
    return value;
  }

  void set letter_value(String value) {
    this.value = value;
  }

  bool get letter_enabled {
    return enabled;
  }

  void set letter_enabled(bool value) {
    this.enabled = value;
  }

  int get letter_pointes_to {
    return points_to;
  }

  void set letter_pointer_to(int points_to) {
    this.points_to = points_to;
  }

  @override
  bool operator ==(other) {
    if (identical(this, other)) return true;
    if (other.runtimeType != runtimeType) return false;
    final Letter otherLetter = other;
    return otherLetter.value == value;
  }

  @override
  bool contains(Object other) {
    if (identical(this, other)) return true;
    return value.contains(other);
  }
}
