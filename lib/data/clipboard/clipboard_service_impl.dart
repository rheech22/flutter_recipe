import 'package:flutter/services.dart';
import 'package:flutter_recipe/domain/clipboard/clipboard_service.dart';

// NOTE: data source 레이어보다는 서비스였다면 자연스러웠을 듯
class ClipboardServiceImpl implements ClipboardService {
  @override
  Future<void> copy(String text) async {
    await Clipboard.setData(ClipboardData(text: text));
  }

  @override
  Future<String?> getText() async {
    final clipboardData = await Clipboard.getData('text/plain');

    return clipboardData?.text;
  }
}
