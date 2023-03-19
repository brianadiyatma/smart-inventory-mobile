import 'package:drop_down_list/drop_down_list.dart';
import 'package:drop_down_list/model/selected_list_item.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class Destination extends StatefulWidget {
  final bool isCitySelected;
  final List<SelectedListItem>? items;
  final String title;
  final Function onChange;

  const Destination({
    required this.isCitySelected,
    required this.title,
    required this.onChange,
    this.items,
    Key? key,
  }) : super(key: key);

  @override
  _DestinationState createState() => _DestinationState();
}

class _DestinationState extends State<Destination> {
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
        IconButton(
          iconSize: 20,
          color: Colors.blue[900],
          icon: const Icon(CupertinoIcons.pen),
          onPressed: widget.isCitySelected
              ? () {
                  FocusScope.of(context).unfocus();
                  onTextFieldTap();
                }
              : null,
        ),
      ],
    );
  }
}
