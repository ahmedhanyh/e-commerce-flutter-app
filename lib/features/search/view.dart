import 'package:final_flutter_project/features/search/cubit.dart';
import 'package:final_flutter_project/features/search/state.dart';
import 'package:final_flutter_project/features/widgets/loading_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/svg.dart';
import '../../core/resources/app_colors.dart';
import '../products/view.dart';

class SearchScreen extends StatefulWidget {
  const SearchScreen({super.key});

  @override
  State<SearchScreen> createState() => _SearchScreenState();
}

class _SearchScreenState extends State<SearchScreen> {
  // TextEditingController searchController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (_) => SearchCubit(),
      child: BlocConsumer<SearchCubit, SearchState>(
        listener: (context, state) {
          if (state is ResultsObtained) {
            Navigator.of(context).push(
              MaterialPageRoute(builder: (context){
                return ListScreen(title: "Search results", items: state.results,);
              })
            );
          }
        },
        builder: (context, state) {
          final cubit = context.read<SearchCubit>();
          if (state is GettingResults) {
            return LoadingScreen(message: "Getting results...");
          }
          return Scaffold(
            backgroundColor: Colors.white,
            appBar: AppBar(
              backgroundColor: Colors.white,
              title: Container(
                child: TextFormField(
                  controller: cubit.searchController,
                  onFieldSubmitted: (value) {
                    cubit.getResults();
                  },
                  decoration: InputDecoration(
                    fillColor: secondaryColor,
                    filled: true,
                    prefixIcon: Padding(
                      padding: const EdgeInsets.all(16),
                      child: SvgPicture.asset("assets/icons/search_small.svg"),
                    ),
                    suffixIcon: GestureDetector(
                      onTap: () {
                        cubit.searchController.clear();
                      },
                      child: Padding(
                        padding: const EdgeInsets.all(14),
                        child: SvgPicture.asset("assets/icons/search_cancel.svg",),
                      ),
                    ),
                    hintText: "Search here",
                    hintStyle: TextStyle(
                      fontSize: 12,
                      fontWeight: FontWeight.w400,
                      color: Color(0xff9B9999),
                    ),
                    border: OutlineInputBorder(
                      borderSide: BorderSide(color: secondaryColor),
                      borderRadius: BorderRadius.circular(30),
                    ),
                    enabledBorder: OutlineInputBorder(
                      borderSide: BorderSide(color: secondaryColor),
                      borderRadius: BorderRadius.circular(30),
                    ),
                    focusedBorder: OutlineInputBorder(
                      borderSide: BorderSide(color: primaryColor),
                      borderRadius: BorderRadius.circular(30),
                    ),
                  ),
                ),
              ),
            ),
          );
        },
      ),
    );
  }
}