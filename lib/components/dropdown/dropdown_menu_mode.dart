import 'package:dropdown_search/dropdown_search.dart';
import 'package:flutter/material.dart';

class DropDownMenuMode extends StatefulWidget {
  final String hinttext;
  final List<dynamic> items;
  final dynamic selectedItem;
  final Function setdata;
  final TextEditingController? controller;
  final String validationText;
  final double borderRadius;
  final Icon? icon;
  final bool enabled;
  final bool showClose;
  final bool enabledValidation;
  const DropDownMenuMode(
      {Key? key,
      required this.hinttext,
      required this.validationText,
      this.selectedItem,
      this.showClose = false,
      this.icon,
      this.enabled = true,
      this.enabledValidation = true,
      this.borderRadius = 20,
      this.controller,
      required this.items,
      required this.setdata})
      : super(key: key);

  @override
  // ignore: library_private_types_in_public_api
  _DropDownMenuModeState createState() => _DropDownMenuModeState();
}

class _DropDownMenuModeState extends State<DropDownMenuMode> {
  bool valid = true;
  bool showcancel = false;

  @override
  void initState() {
    showcancel = widget.showClose;
    setState(() {});
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      // margin: const EdgeInsets.fromLTRB(20, 0, 20, 5),
      height: valid ? 50 : 70,
      child: DropdownSearch<dynamic>(
        showSearchBox: true,
        enabled: widget.enabled,
        validator: widget.enabled && widget.enabledValidation
            ? (v) {
                if (v == null) {
                  setState(() {
                    valid = false;
                  });
                  return widget.validationText;
                } else {
                  setState(() {
                    valid = true;
                  });
                  return null;
                }
              }
            : null,
        dropdownSearchDecoration: InputDecoration(
          contentPadding:
              const EdgeInsets.symmetric(vertical: 0, horizontal: 15),
          prefixIcon: widget.icon,
          
          enabledBorder: OutlineInputBorder(
            borderSide: BorderSide(color:const Color(0xff6B779A).withOpacity(0.05)),
            borderRadius: BorderRadius.circular(widget.borderRadius),
          ),
          border: OutlineInputBorder(
            // borderSide: BorderSide.none,
            borderRadius: BorderRadius.circular(widget.borderRadius),
          ),
          filled: true,
          alignLabelWithHint: false,
          labelText: widget.hinttext,
          

          // hintText: widget.hinttext,
          // labelText: widget.hinttext,
          fillColor:const Color(0xffEBF6F7),
        ),
        // dropdownSearchDecoration: InputDecoration(
        //   contentPadding:
        //       const EdgeInsets.symmetric(vertical: 0, horizontal: 10),
        //   label: Text(widget.hinttext),
        //   alignLabelWithHint: false,
        //   border: OutlineInputBorder(
        //     borderRadius: BorderRadius.circular(15.0),
        //   ),
        // ),

        // dropdownSearchDecoration: InputDecoration(
        //   alignLabelWithHint: false,
        //   hintText: widget.hinttext,
        //   filled: true,
        //   fillColor: Colors.white,
        //   contentPadding: const EdgeInsets.fromLTRB(12, 0, 0, 0),
        //   border: const OutlineInputBorder(),
        // ),

        mode: Mode.MENU,
        items: widget.items.map((e) => e).toList(),
        // popupItemBuilder: (ctx, dyn, bo) {
        //   return Text("data");
        // },
        itemAsString: (val) {
          if (val.runtimeType == String) {
            return val;
          }
          return val.name;
        },
        showClearButton: showcancel,
        onChanged: (val) {
          if (val != null) {
            setState(() {
              showcancel = true;
            });
          }
          widget.setdata(val);
        },
        selectedItem: widget.selectedItem,
        dropdownBuilder: widget.selectedItem == null
            ? null
            : (context, val) {
                if (val == null) {
                  return Container();
                }
                if (val.runtimeType == String) {
                  return LimitedBox(
                    child: Text(
                      val ?? "",
                      overflow: TextOverflow.ellipsis,
                    ),
                  );
                }
                return LimitedBox(
                  child: Text(
                    val.name ?? "",
                    overflow: TextOverflow.ellipsis,
                  ),
                );
              },
      ),
    );
  }
}
