import 'package:drop_down_list/drop_down_list.dart';
import 'package:drop_down_list/model/selected_list_item.dart';
import 'package:flutter/material.dart';

class AppTextFieldSTTP extends StatefulWidget {
  final TextEditingController textEditingController;
  final String hint;
  final bool isCitySelected;
  final bool readOnly;
  final List<SelectedListItem>? items;
  final String title;
  final Function onChange;

  const AppTextFieldSTTP({
    required this.textEditingController,
    required this.hint,
    required this.readOnly,
    required this.isCitySelected,
    required this.title,
    required this.onChange,
    this.items,
    Key? key,
  }) : super(key: key);

  @override
  _AppTextFieldSTTPState createState() => _AppTextFieldSTTPState();
}

class _AppTextFieldSTTPState extends State<AppTextFieldSTTP> {
  final TextEditingController _searchTextEditingController =
      TextEditingController();

  /// This is on text changed method which will display on city text field on changed.
  void onTextFieldTap() {
    DropDownState(
      DropDown(
        bottomSheetTitle: Text(
          widget.title,
          style: const TextStyle(
            fontWeight: FontWeight.bold,
            fontSize: 20.0,
          ),
        ),
        data: widget.items ?? [],
        selectedItems: (List<dynamic> selectedList) {
          List<String> list = [];

          for (var item in selectedList) {
            if (item is SelectedListItem) {
              list.add(item.name);
              widget.textEditingController.text = item.name;

              widget.onChange(item.value);
              // widget.onChange(item.value.toString());
            }
          }
        },
        enableMultipleSelection: false,
      ),
    ).showModal(context);
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const SizedBox(
          height: 5.0,
        ),
        TextFormField(
          controller: widget.textEditingController,
          readOnly: widget.readOnly,
          cursorColor: Colors.black,
          onTap: widget.isCitySelected
              ? () {
                  FocusScope.of(context).unfocus();
                  onTextFieldTap();
                }
              : null,
          decoration: InputDecoration(
            filled: true,
            fillColor: Colors.black12,
            contentPadding:
                const EdgeInsets.only(left: 8, bottom: 0, top: 0, right: 15),
            hintText: widget.hint,
            border: const OutlineInputBorder(
              borderSide: BorderSide(
                width: 0,
                style: BorderStyle.none,
              ),
              borderRadius: BorderRadius.all(
                Radius.circular(8.0),
              ),
            ),
          ),
        ),
        const SizedBox(
          height: 15.0,
        ),
      ],
    );
  }
}
