import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:payment/Features/payment/presentation/controller/payment/payment_bloc.dart';
import 'package:payment/Features/payment/presentation/view/payment_view.dart';

import 'Features/payment/domain/use case/payment_use_case.dart';
import 'core/common/service/injection.dart';
import 'generated/l10n.dart';

void main() {
  configureDependencies();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});
  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      designSize: const Size(375, 812),
      useInheritedMediaQuery: true,
      builder: (BuildContext context, Widget? child) {
        return MaterialApp(
          localizationsDelegates: const [
            S.delegate,
            GlobalMaterialLocalizations.delegate,
            GlobalWidgetsLocalizations.delegate,
            GlobalCupertinoLocalizations.delegate,
          ],
          supportedLocales: S.delegate.supportedLocales,
          locale: const Locale('ar'),
          debugShowCheckedModeBanner: false,
          home: BlocProvider(
            create: (context) => PaymentBloc(
              processPaymentUseCase: getIt.get<ProcessPaymentUseCase>(),
            ),
            child: const PaymentView(),
          ),
        );
      },
    );
  }
}
