import 'package:flutter/material.dart';

class FormListTitle extends StatefulWidget {
  final double height;
  final String title;
  final int? record;
  final void Function(String search)? onSearch;
  const FormListTitle({
    Key? key,
    this.height = 60,
    required this.title,
    this.record,
    this.onSearch(String search)?,
  }) : super(key: key);

  @override
  State<FormListTitle> createState() => _FormListTitleState();
}

class _FormListTitleState extends State<FormListTitle> {
  late TextEditingController tecSearch;

  @override
  void initState() {
    tecSearch = TextEditingController();
    super.initState();
  }

  @override
  void dispose() {
    tecSearch.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.only(
        left: 5,
      ),
      height: widget.height,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Row(
            crossAxisAlignment: CrossAxisAlignment.end,
            children: [
              Text(
                widget.title,
                style: Theme.of(context).primaryTextTheme.titleLarge!.copyWith(
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                    ),
              ),
              const SizedBox(width: 10),
            ],
          ),
        ],
      ),
    );
  }
}
