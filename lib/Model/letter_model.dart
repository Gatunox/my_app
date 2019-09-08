import 'dart:convert';
import 'dart:io';

class Letter {
  int id;
  String value;
  bool enabled;

  Letter({id, value, enabled})
      : this.id = id,
        this.value = value,
        this.enabled = enabled;

  int get letter_id {
    return id;
  }

  void set letter_id(int id) {
    this.id = id;
  }

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

  @override
  bool operator ==(other) {
    if (identical(this, other)) return true;
    if (other.runtimeType != runtimeType) return false;
    final Letter otherLetter = other;
    return otherLetter.id == id &&
        otherLetter.value == value &&
        otherLetter.enabled == enabled;
  }

  @override
  bool contains(Object other) {
    if (identical(this, other)) return true;
    return value.contains(other);
  }
}
