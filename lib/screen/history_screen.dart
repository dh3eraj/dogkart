import 'package:dogkart/bloc/history/history_cubit.dart';
import 'package:dogkart/model/dog_mage.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class HistoryScreen extends StatefulWidget {
  const HistoryScreen({super.key});
  @override
  _HistoryScreenState createState() => _HistoryScreenState();
}

class _HistoryScreenState extends State<HistoryScreen> {
  late HistoryCubit _cubit;
  List<DogImage> dogsList = [];

  @override
  void initState() {
    _cubit = context.read<HistoryCubit>();
    _cubit.getDogList();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<HistoryCubit, HistoryState>(
      listener: (context, state) {
        state.maybeWhen(
            loaded: (dogs) {
              setState(() {
                dogsList = dogs.reversed.toList();
              });
            },
            orElse: () {});
      },
      builder: (context, state) {
        return state.maybeWhen(
          loading: () => Center(
            child: CircularProgressIndicator(),
          ),
          loaded: (dog) => dogsList.isNotEmpty
              ? ListView.separated(
                  itemBuilder: (context, index) => Image.network(
                        dogsList[index].url,
                        errorBuilder: (context, error, stackTrace) => Image.network(
                            "https://www.freepnglogos.com/uploads/dog-png/bow-wow-gourmet-dog-treats-are-healthy-natural-low-4.png"),
                      ),
                  separatorBuilder: (context, index) => Divider(),
                  itemCount: dogsList.length)
              : Center(
                  child: Text("No Data Found"),
                ),
          error: (error) => Center(
            child: Text("Something Went Wrong!"),
          ),
          orElse: () => Center(
            child: Text("History"),
          ),
        );
      },
    );
  }
}
