import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:madang/constant/app_colors.dart';
import 'package:madang/constant/app_text.dart';
import 'package:madang/constant/state.dart';
import 'package:madang/features/detail_page/bloc/detail_resto_bloc.dart';
import 'package:madang/widgets/button/default_button.dart';
import 'package:madang/widgets/field/default_field.dart';

dialogWidget(
  BuildContext context, {
  required TextEditingController controller,
  required String id,
}) {
  final GlobalKey<FormState> formKey = GlobalKey<FormState>();

  return showModalBottomSheet(
    context: context,
    builder: (context) {
      return Container(
        padding: const EdgeInsets.all(20),
        width: MediaQuery.of(context).size.width,
        height: MediaQuery.of(context).size.height * 2 / 8 + 18,
        child: Form(
          key: formKey,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text('Add Review',
                  style: AppText.text14.copyWith(fontWeight: FontWeight.bold)),
              DefaultField(
                hintText: 'Add Review',
                inputType: TextInputType.text,
                maxLines: 3,
                controller: controller,
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Please enter Review';
                  }
                  return null;
                },
              ),
              BlocConsumer<DetailRestoBloc, DetailRestoState>(
                listener: (context, state) {
                  if (state.status == DetailStatusState.error) {
                    ScaffoldMessenger.of(context)
                        .showSnackBar(SnackBar(content: Text(state.message)));
                  }
                },
                builder: (context, state) {
                  return DefaultButton(
                    title: 'Submit',
                    onTap: () {
                      Navigator.of(context).pop();
                      if (!formKey.currentState!.validate()) {
                        return;
                      } else {
                        if (controller.text.isNotEmpty) {
                          context.read<DetailRestoBloc>().add(
                                OnAddReviewEvent(
                                  id: id,
                                  review: controller.text,
                                ),
                              );
                          controller.clear();
                        }
                      }
                    },
                    color: AppColors.white,
                  );
                },
              ),
            ],
          ),
        ),
      );
    },
  );
}
