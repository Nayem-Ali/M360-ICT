import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:m360_ict/src/core/router/route_name.dart';
import 'package:m360_ict/src/core/utils/constants/app_fonts.dart';
import 'package:m360_ict/src/core/utils/constants/images_path.dart';
import 'package:m360_ict/src/core/utils/extension/context_extension.dart';
import 'package:m360_ict/src/features/home/data/model/place_model.dart';
import 'package:m360_ict/src/features/home/presentation/bloc/bloc.dart';
import 'package:m360_ict/src/features/home/presentation/bloc/event.dart';
import 'package:m360_ict/src/features/home/presentation/bloc/state.dart';
import 'package:m360_ict/src/features/home/presentation/components/carbon_emission_rate.dart';
import 'package:m360_ict/src/features/home/presentation/components/overlapping_images.dart';
import 'package:m360_ict/src/features/home/presentation/components/place_condition.dart';

class PlaceCard extends StatefulWidget {
  const PlaceCard({super.key});

  @override
  State<PlaceCard> createState() => _PlaceCardState();
}

class _PlaceCardState extends State<PlaceCard> {
  @override
  void initState() {
    context.read<PlaceBloc>().add(GetPlaceEvent());
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<PlaceBloc, PlaceState>(
      listener: (context, state) {},
      builder: (context, state) {
        if (state is PlaceSuccessState) {
          return SizedBox(
            height: context.height * 0.65,
            child: ListView.builder(
              padding: const EdgeInsets.all(8.0),
              itemCount: state.places.length,
              itemBuilder: (context, index) {
                Place place = state.places[index];
                return Card(
                  child: Container(
                    padding: const EdgeInsets.all(16),
                    height: context.height * 0.2,
                    child: Column(
                      children: [
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text(
                              place.placeName,
                              style: context.titleLarge?.copyWith(fontFamily: AppFonts.poppins),
                            ),
                            PlaceCondition(condition: place.carbonEmissionCondition),
                          ],
                        ),
                        Spacer(),
                        Row(
                          children: [
                            CarbonEmissionRate(place: place),
                            Spacer(),
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.end,
                              children: [
                                Stack(
                                  alignment: Alignment.centerRight,
                                  children: [
                                    OverlappingImages(
                                      images: place.peopleImage,
                                      imageRadius: 25,
                                      overlapOffset: 19,
                                      borderWidth: 3,
                                    ),
                                    Container(
                                      height: 50,
                                      width: 50,
                                      decoration: BoxDecoration(
                                        color: Colors.grey.shade400,
                                        borderRadius: BorderRadius.circular(30),
                                        border: Border.all(width: 3, color: Colors.white),
                                      ),
                                      child: Center(
                                        child: Text(
                                          "+${1 + place.totalPeoples - place.peopleImage.length}",
                                          style: context.titleMedium?.copyWith(
                                            color: Theme.of(context).colorScheme.onPrimary,
                                            fontFamily: AppFonts.poppins,
                                            fontWeight: FontWeight.bold,
                                          ),
                                        ),
                                      ),
                                    ),
                                  ],
                                ),

                                InkWell(
                                  onTap:
                                      () {
                                        context.pushNamed(RouteName.placeDetails, extra: place);
                                      },
                                  child: Text(
                                    "View Details \u25BA",
                                    style: context.titleSmall?.copyWith(
                                      color: Theme.of(context).colorScheme.primary,
                                      fontFamily: AppFonts.poppins,
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                );
              },
            ),
          );
        } else if (state is PlaceFailureState) {
          return Center(child: Text("No Data Found"));
        } else {
          return SizedBox.shrink();
        }
      },
    );
  }
}
