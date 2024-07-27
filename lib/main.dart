import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:jaggy/features/news_display/data_sources/save_following/local_save_following.dart';
import 'package:jaggy/features/news_display/presentation/cubit/news_provider_cubit.dart';
import 'package:jaggy/features/news_display/presentation/provider/news_follower_provider.dart';
import 'package:jaggy/features/news_display/presentation/ui/pages/news_headlines_page.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    print(String.fromEnvironment('API'));
    print('API_KEY');
    return ChangeNotifierProvider(
      create: (context) => NewsFollowerProvider(LocalFollowingSave()),
      child: MaterialApp(
          debugShowCheckedModeBanner: false,
          theme: ThemeData(
            textTheme: GoogleFonts.poppinsTextTheme(),
            colorScheme:
                ColorScheme.fromSeed(seedColor: Colors.deepPurpleAccent),
            useMaterial3: true,
          ),
          home: BlocProvider(
            create: (context) => NewsProviderCubit(),
            child: NewsHeadlinesPage(),
          )),
    );
  }
}
