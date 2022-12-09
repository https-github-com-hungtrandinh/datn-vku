import 'dart:io';
import 'package:clean_architecture/core/value/image.dart';
import 'package:clean_architecture/presentation/bloc/register_selection/register_selection_bloc.dart';
import 'package:clean_architecture/presentation/bloc/register_selection/register_selection_event.dart';
import 'package:clean_architecture/presentation/bloc/register_selection/register_selection_state.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../core/util/image_picker.dart';
import '../../../core/value/strings.dart';

class ProfilePhotoSection extends StatefulWidget {
  const ProfilePhotoSection({Key? key}) : super(key: key);

  @override
  State<ProfilePhotoSection> createState() => _ProfilePhotoSectionState();
}

class _ProfilePhotoSectionState extends State<ProfilePhotoSection> {
  File? file;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 32),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const SizedBox(height: 95),
          const Text(
            Strings.addPhoto,
            style: TextStyle(
              color: Colors.white,
              fontSize: 18,
            ),
          ),
          Expanded(
            child: Center(
              child: BlocBuilder<RegisterSelectionBloc, RegisterSelectionState>(
                  builder: (context, state) {
                return InkWell(
                  onTap: () async {
                    context
                        .read<RegisterSelectionBloc>()
                        .add(ChangedAvatar(await getFromGallery()));
                  },
                  child: Container(
                    width: MediaQuery.of(context).size.width * 0.55,
                    height: MediaQuery.of(context).size.width * 0.55,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(
                          MediaQuery.of(context).size.width * 0.55 / 2),
                      border: Border.all(
                        color: Colors.white,
                        width: 2,
                      ),
                    ),
                    child: Center(
                        child: Container(
                      width: MediaQuery.of(context).size.width * 0.5,
                      height: MediaQuery.of(context).size.width * 0.5,
                      clipBehavior: Clip.antiAlias,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(
                            MediaQuery.of(context).size.width * 0.55 / 2),
                      ),
                      child: state.file == null
                          ? Image.asset(
                              ImageSrc.feMaleAvatar,
                              fit: BoxFit.cover,
                            )
                          : Image.file(
                              state.file!,
                              fit: BoxFit.cover,
                            ),
                    )),
                  ),
                );
              }),
            ),
          ),
          const SizedBox(height: 92),
        ],
      ),
    );
  }
}
