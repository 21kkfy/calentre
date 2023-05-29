import 'package:calentre/app/home/presentation/bloc/home_bloc.dart';
import 'package:calentre/app/home/presentation/bloc/home_event.dart';
import 'package:calentre/config/constraints/constraints.dart';
import 'package:calentre/config/extensions/spacing.dart';
import 'package:calentre/config/theme/colors.dart';
import 'package:calentre/shared/button.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class AppTabBar extends StatelessWidget {
  const AppTabBar({super.key, required this.currentIndex});

  final int currentIndex;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          constraints: BoxConstraints(maxWidth: WebConstraints.maxWidth),
          // width: MediaQuery.of(context).size.width,
          padding: const EdgeInsets.symmetric(vertical: 24),

          child: Row(
            mainAxisSize: MainAxisSize.min,
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Expanded(
                child: AppButton(
                  gradient: currentIndex == 0 ? true : false,
                  title: "Events",
                  onPressed: () {
                    return BlocProvider.of<HomeViewBloc>(context)
                        .add(EventViewEvent());
                    // context.read<HomeViewBloc>().add(EventViewEvent());
                  },
                  icon: const FaIcon(
                    FontAwesomeIcons.calendarDay,
                    size: 20,
                  ),
                ),
              ),
              const SizedBox().x10(),
              Expanded(
                child: AppButton(
                  gradient: currentIndex == 1 ? true : false,
                  title: "History",
                  onPressed: () {
                    return context.read<HomeViewBloc>().add(HistoryViewEvent());
                  },
                  icon: const FaIcon(
                    FontAwesomeIcons.userClock,
                    size: 20,
                  ),
                ),
              ),
              const SizedBox().x10(),
              Expanded(
                child: AppButton(
                  gradient: currentIndex == 2 ? true : false,
                  title: "Payments",
                  onPressed: () {
                    return context.read<HomeViewBloc>().add(PaymentViewEvent());
                  },
                  icon: const FaIcon(
                    FontAwesomeIcons.creditCard,
                    size: 20,
                  ),
                ),
              ),
            ],
          ),
        ),
        Container(
            width: MediaQuery.of(context).size.width,
            decoration: BoxDecoration(
              border: Border(
                bottom: BorderSide(
                  color: AppColors.grey.s700,
                  width: 1.0,
                ),
              ),
            ))
      ],
    );
  }
}
