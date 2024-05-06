import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:habita/page_manager.dart';
import 'package:habita/src/features/auth/presentation/bloc/auth_bloc.dart';
import 'package:habita/src/features/settings/presentation/widgets/settings_widgets/profile_picture.dart';

class HomePage extends StatefulWidget {
  static route() => MaterialPageRoute(
        builder: (context) => const HomePage(),
      );
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.all(16.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          'Hello,',
                          style: Theme.of(context).textTheme.displayMedium,
                        ),
                        Text(
                          '${context.read<AuthBloc>().state.user!.name}👋',
                          style: Theme.of(context).textTheme.displayMedium,
                          overflow: TextOverflow.ellipsis,
                          maxLines: 1,
                        ),
                      ],
                    ),
                    const Spacer(),
                    GestureDetector(
                      onTap: () => context
                          .findAncestorStateOfType<PageManagerState>()!
                          .switchPage(3),
                      child: ProfilePicture(
                        size: MediaQuery.of(context).size.height * 0.09,
                        showBorder: false,
                      ),
                    ),
                  ],
                ),
                const SizedBox(
                  height: 60,
                ),
                // Center(
                //     child: HabitaCircularIndicator(
                //   textStyle: Theme.of(context).textTheme.titleLarge!,
                //   size: 200,
                //   value: 20,
                //   maxValue: 100,
                //   width: 10,
                // ))
              ],
            ),
          ),
        ),

        // child: Center(
        //   child: HabitaHeatMap(dataSets: {},),
        // ),
      ),
    );
  }
}
