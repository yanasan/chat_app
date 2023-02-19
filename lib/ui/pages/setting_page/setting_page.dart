import 'package:flutter/material.dart';
import 'package:flutter_datetime_picker/flutter_datetime_picker.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:intl/intl.dart';

final _dateTimeProvider = StateProvider.autoDispose<DateTime?>((ref) {
  return DateTime.now();
});

class SettingPage extends StatelessWidget {
  const SettingPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('設定'),
        automaticallyImplyLeading: false,
      ),
      body: Consumer(
        builder: (context, ref, child) {
          return Container(
            child: buildTimeField(),
          );
        },
      ),
    );
  }

  Widget buildTimeField() {
    return Consumer(
      builder: (context, ref, child) {
        var dateTime = ref.watch(_dateTimeProvider);
        final formatter = DateFormat('yyyy年MM月dd日H:m');
        return GestureDetector(
          onTap: () {
            DatePicker.showDateTimePicker(
              context,
              locale: LocaleType.jp,
              onConfirm: (time) {
                // limit.value = time;
                dateTime = time;
                print('$time');
              },
              currentTime: DateTime.now(),
              showTitleActions: true,
            );
          },
          child: Container(
            height: 60,
            width: 600,
            decoration: const BoxDecoration(
              border: Border(bottom: BorderSide()),
            ),
            child: Center(child: Text(formatter.format(dateTime!))),
          ),
        );
      },
    );
  }
}
