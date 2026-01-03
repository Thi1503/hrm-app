import 'package:get/get_core/src/get_interface.dart';
import 'package:get/get_instance/src/extension_instance.dart';

extension GetInstanceExtension on GetInterface {
  /// The findOrNull method will return the instance if it is registered;
  /// otherwise, it will return null.
  S? findOrNull<S>({String? tag}) {
    if (isRegistered<S>(tag: tag)) {
      return find<S>(tag: tag);
    }
    return null;
  }
}
