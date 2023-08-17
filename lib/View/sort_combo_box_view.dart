import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';

/// WidgetTestで使用するKey
final sortComboBoxKey = UniqueKey();

class SortComboBoxView extends StatefulWidget {
  const SortComboBoxView({
    super.key,
    required this.dropDownValues,
    required this.isSelectedValue,
    required this.updateSelectedValue,
    required this.parentColumnKey,
  });
  final List<String> dropDownValues;
  final String isSelectedValue;
  final Function updateSelectedValue;
  final GlobalKey parentColumnKey;

  @override
  State<SortComboBoxView> createState() => _SortComboBoxViewState();
}

class _SortComboBoxViewState extends State<SortComboBoxView> {
  double parentHeight = 0;

  @override
  void initState() {
    SchedulerBinding.instance.addPostFrameCallback((timeStamp) {
      RenderBox? parentColumnBox = widget.parentColumnKey.currentContext
          ?.findRenderObject() as RenderBox?;
      if (parentColumnBox != null) {
        setState(() {
          parentHeight = parentColumnBox!.size.height;
        });
      }
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: parentHeight * 0.1,
      child: Center(
        child: DropdownButton(
          items: [
            for (var value in widget.dropDownValues) ...[
              DropdownMenuItem(
                value: value,
                child: Text(value),
              ),
            ]
          ],
          key: sortComboBoxKey,
          value: widget.isSelectedValue,
          onChanged: (String? value) {
            if (value == null || value.isEmpty) return;
            widget.updateSelectedValue(value);
          },
        ),
      ),
    );
  }
}
