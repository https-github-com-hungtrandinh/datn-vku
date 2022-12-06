import 'package:clean_architecture/presentation/bloc/register/register_bloc.dart';
import 'package:clean_architecture/presentation/bloc/register/register_event.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../core/util/rouder_text_field.dart';
import '../../../core/value/strings.dart';
import '../../bloc/register/register_state.dart';

class MajorSection extends StatefulWidget {
  const MajorSection({Key? key}) : super(key: key);

  @override
  State<MajorSection> createState() => _MajorSectionState();
}

class _MajorSectionState extends State<MajorSection> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 32),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const SizedBox(height: 95),
          nameUser(),
          Expanded(
            child: Center(child: _majorInput()),
          ),
          const SizedBox(height: 92),
        ],
      ),
    );
  }

  Widget nameUser() {
    return BlocBuilder<RegisterBloc, RegisterState>(builder: (context, state) {
      return Text(
        "${Strings.alright} ${state.userName}${Strings.whatIsMajor}",
        style: const TextStyle(
          color: Colors.white,
          fontSize: 18,
        ),
      );
    });
  }

  Widget _majorInput() {
    return BlocBuilder<RegisterBloc, RegisterState>(builder: (context, state) {
      return TextFormField(
        controller: TextEditingController(text: state.major),
        style: const TextStyle(
          fontWeight: FontWeight.w600,
          color: Colors.white,
        ),
        textAlign: TextAlign.center,
        readOnly: true,
        onTap: () {
          showModalBottom();
        },
        decoration: InputDecoration(
          contentPadding:
              const EdgeInsets.symmetric(horizontal: 24, vertical: 20),
          hintText: Strings.yourMaJor,
          hintStyle: const TextStyle(
            fontWeight: FontWeight.w600,
            color: Colors.white,
          ),
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(16),
            borderSide: BorderSide.none,
          ),
          filled: true,
          fillColor: Colors.black.withOpacity(0.05),
        ),
      );
    });
  }

  void showModalBottom() {
    showModalBottomSheet(
      isScrollControlled: true,
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.vertical(top: Radius.circular(15.0)),
      ),
      context: context,
      builder: (context) {
        return BlocBuilder<RegisterBloc, RegisterState>(
          builder: (context, state) {
            return DraggableScrollableSheet(
              expand: false,
              builder:
                  (BuildContext context, ScrollController scrollController) {
                return Padding(
                  padding: const EdgeInsets.all(16.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      RoundedTextFieldWidget(
                        hintText: Strings.search,
                        suffixIcon: const Icon(
                          Icons.search,
                          color: Colors.grey,
                        ),
                        onChanged: (value) {
                          context.read<RegisterBloc>().add(SearchMajor(value));
                        },
                      ),
                      const SizedBox(height: 16),
                      Expanded(
                        child: ListView.separated(
                            itemBuilder: (context, index) {
                              return InkWell(
                                  onTap: () {
                                    context.read<RegisterBloc>().add(
                                        ChangedMajor((state.listMajorInSearch
                                                    .isNotEmpty ||
                                                state.searchMajor.isNotEmpty)
                                            ? state
                                                .listMajorInSearch[index].major
                                            : state.listMajor[index].major));
                                    Navigator.pop(context);
                                  },
                                  child: ListTile(
                                    title: Text(
                                      (state.listMajorInSearch.isNotEmpty ||
                                              state.searchMajor.isNotEmpty)
                                          ? state.listMajorInSearch[index].major
                                          : state.listMajor[index].major,
                                      style: const TextStyle(
                                          fontSize: 16, color: Colors.white),
                                    ),
                                  ));
                            },
                            separatorBuilder: (context, index) =>
                                const SizedBox(height: 1),
                            itemCount: (state.listMajorInSearch.isNotEmpty ||
                                    state.searchMajor.isNotEmpty)
                                ? state.listMajorInSearch.length
                                : state.listMajor.length),
                      ),
                    ],
                  ),
                );
              },
            );
          },
        );
      },
    );
  }
}
