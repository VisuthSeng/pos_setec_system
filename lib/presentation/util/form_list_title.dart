import 'package:flutter/material.dart';
import 'package:pos_setec_system/presentation/widget/button_icon.dart';

import 'package:pos_setec_system/presentation/widget/textbox_search.dart';

class FormListTitle extends StatefulWidget {
  final String title;
  final void Function(String search)? onSearch;
  final void Function()? onPress;
  final int? record;

  const FormListTitle({
    super.key,
    required this.fnSearch,
    required this.tecSearch,
    this.onSearch,
    required this.title,
    this.record,
    this.onPress,
  });

  final FocusNode fnSearch;
  final TextEditingController tecSearch;

  @override
  State<FormListTitle> createState() => _FormListTitleState();
}

class _FormListTitleState extends State<FormListTitle> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 15, right: 5),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          SizedBox(
            width: 200,
            child: Row(
              children: [
                Text(
                  widget.title,
                  style:
                      Theme.of(context).primaryTextTheme.titleLarge!.copyWith(
                            fontSize: 20,
                            color: Colors.black,
                            fontWeight: FontWeight.bold,
                          ),
                ),
                const SizedBox(width: 10),
                if (widget.record != null)
                  Padding(
                    padding: const EdgeInsets.only(top: 10),
                    child: Text(
                      '${widget.record!} record',
                      style: Theme.of(context)
                          .primaryTextTheme
                          .bodyLarge!
                          .copyWith(fontSize: 10, color: Colors.black),
                    ),
                  ),
                const SizedBox(
                  width: 10,
                ),
                if (widget.onPress != null)
                  ButtonIcon(
                      icon: Icons.add,
                      onPress: () {
                        widget.onPress!();
                      }),
              ],
            ),
          ),
          if (widget.onSearch != null)
            SizedBox(
              width: 150,
              child: TextboxSearch(
                focusNode: widget.fnSearch,
                controller: widget.tecSearch,
                label: 'Search',
                isReadOnly: false,
                onChanged: ((value) => {
                      widget.onSearch!(value),
                    }),
              ),
            ),
        ],
      ),
    );
  }
}
