import 'package:do_an_application/base/controllers/base_refresh_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_rx/src/rx_workers/utils/debouncer.dart';

abstract class BasePageSearchController<T> extends BaseRefreshGetxController {
  /// List kiểu Rx: list item trong page.
  final rxList = RxList<T>();

  /// Controller của NestscrollView.
  late final scrollController = ScrollController();

  final debouncer = Debouncer(delay: const Duration(seconds: 1));

  /// `scrollOffset`: biến trạng thái vị trí scroll.
  final scrollOffset = 0.0.obs;

  final appBarHeight = 70.0;

  /// Controller của input search.
  final searchController = TextEditingController();

  int pageNumber = 1;
  int totalRecords = 0;

  /// Hàm search
  Future<void> functionSearch();

  /// Kiểm tra vị trí scroll ở vị trí đầu.
  bool isScrollToTop() {
    return scrollOffset <= (appBarHeight - kToolbarHeight / 2);
  }

  @override
  void onClose() {
    debouncer.cancel();
    searchController.dispose();
    super.onClose();
  }
}
