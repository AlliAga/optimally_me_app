import 'dart:async';

abstract class Debounce {
  Timer? _debounce;

  void debounce({required Duration duration, required void Function() func}) {
    if (_debounce?.isActive ?? false) _debounce?.cancel();
    _debounce = Timer(duration, func);
  }
}
