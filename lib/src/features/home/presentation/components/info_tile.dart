import 'package:flutter/material.dart';
import 'package:m360_ict/src/core/utils/constants/app_fonts.dart';
import 'package:m360_ict/src/core/utils/extension/context_extension.dart';

class InfoTile extends StatefulWidget {
  const InfoTile({super.key, required this.title, required this.number});

  final String title;
  final int number;

  @override
  State<InfoTile> createState() => _InfoTileState();
}

class _InfoTileState extends State<InfoTile> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Row(
        children: [
          Container(
            height: 25,
            width: 25,
            margin: EdgeInsets.only(right: 8),
            decoration: BoxDecoration(
              color: Theme.of(context).primaryColor,
              borderRadius: BorderRadius.circular(15),
            ),
          ),
          Text(
            widget.title,
            style: context.titleMedium?.copyWith(fontFamily: AppFonts.poppins),
          ),
          Spacer(),
          Container(
            height: 25,
            width: 25,
            decoration: BoxDecoration(
              color: Color(0xFFF7F7F7),
              borderRadius: BorderRadius.circular(5),
            ),
            child: Icon(Icons.add),
          ),

          Container(
            width: context.width * 0.2,
            alignment: Alignment.center,
            margin: EdgeInsets.symmetric(horizontal: 4),
            child: Text(
              "${widget.number}",
              style: context.headlineMedium?.copyWith(fontFamily: AppFonts.poppins),
            ),
          ),
          Container(
            height: 25,
            width: 25,
            decoration: BoxDecoration(
              color: Color(0xFFF7F7F7),
              borderRadius: BorderRadius.circular(5),
            ),
            child: Icon(Icons.remove),
          ),
        ],
      ),
    );
  }
}
