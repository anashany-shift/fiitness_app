import 'package:fitness_app/features/exercise/view/widgets/exercise_video_dialog.dart';
import 'package:fitness_app/features/exercise/view/widgets/exrcise_card.dart';
import 'package:fitness_app/features/exercise/view_model/cubit/exercise_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class ExerciseCardListView extends StatelessWidget {
  const ExerciseCardListView({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<ExerciseCubit, ExerciseState>(
      builder: (context, state) {
        if (state.exerciseEntity?.isLoading == true) {
          return Center(child: CircularProgressIndicator());
        }
        if (state.exerciseEntity?.errorMessage != null) {
          return Center(
            child: Text(state.exerciseEntity?.errorMessage ?? "error"),
          );
        }
        if (state.exerciseEntity?.data != null) {
          final exercise = state.exerciseEntity?.data;
          return Expanded(
            child: ListView.builder(
              itemCount: exercise?.length ?? 0,
              itemBuilder: (context, index) {
                final item = exercise?[index];
                return ExerciseCard(
                  youtubeLink: item?.youtubeLink??"",
                 title: item?.exerciseName ?? "",
                disc: item?.primeMoverMuscle??"",
                  onPlayTap: (){
                    if(item!.youtubeLink.isNotEmpty){
                      showDialog(context: context, builder: (context) {
                        return ExerciseVideoDialog(youtubeLink: item.youtubeLink);
                      },);
                    }else{
                      ScaffoldMessenger.of(context).showSnackBar(
                         const SnackBar(content: Text("No video available")),
                       );
                    }
                  },
                );
              },
            ),
          );
        } else {
          return SizedBox.shrink();
        }
      },
    );
  }
}
