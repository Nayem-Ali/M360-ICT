import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:m360_ict/src/core/utils/constants/app_fonts.dart';
import 'package:m360_ict/src/core/utils/extension/context_extension.dart';
import 'package:m360_ict/src/features/home/presentation/bloc/counter_bloc.dart';
import 'package:m360_ict/src/features/home/presentation/bloc/counter_event.dart';
import 'package:m360_ict/src/features/home/presentation/bloc/counter_state.dart';

class InfoTile extends StatefulWidget {
  const InfoTile({super.key});

  @override
  State<InfoTile> createState() => _InfoTileState();
}

class _InfoTileState extends State<InfoTile> {
  final List<String> _tileTitles = [
    "Total Number of People",
    "Total Number of Rooms",
    "Total area (sq)",
    "Total AC",
    "Total Refrigerators",
    "Total Computers",
    "Total Indoor Plants",
    "Total Kitchen Burner",
  ];

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<CounterBloc, CounterState>(
      builder: (context, state) {
        return Column(
          children:
              _tileTitles
                  .map(
                    (title) => Padding(
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
                            title,
                            style: context.titleMedium?.copyWith(fontFamily: AppFonts.poppins),
                          ),
                          Spacer(),
                          InkWell(
                            onTap: () {
                              context.read<CounterBloc>().add(
                                IncrementCounter(_tileTitles.indexOf(title)),
                              );
                            },
                            child: Container(
                              height: 25,
                              width: 25,
                              decoration: BoxDecoration(
                                color: Color(0xFFF7F7F7),
                                borderRadius: BorderRadius.circular(5),
                              ),
                              child: Icon(Icons.add),
                            ),
                          ),

                          Container(
                            width: context.width * 0.2,
                            alignment: Alignment.center,
                            margin: EdgeInsets.symmetric(horizontal: 4),
                            child: Text(
                              "${state.counters[_tileTitles.indexOf(title)]}",
                              style: context.headlineMedium?.copyWith(
                                fontFamily: AppFonts.poppins,
                              ),
                            ),
                          ),
                          InkWell(
                            onTap: () {
                              context.read<CounterBloc>().add(
                                DecrementCounter(_tileTitles.indexOf(title)),
                              );
                            },
                            child: Container(
                              height: 25,
                              width: 25,
                              decoration: BoxDecoration(
                                color: Color(0xFFF7F7F7),
                                borderRadius: BorderRadius.circular(5),
                              ),
                              child: Icon(Icons.remove),
                            ),
                          ),
                        ],
                      ),
                    ),
                  )
                  .toList(),
        );
      },
    );
  }
}
