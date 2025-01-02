
// import 'package:property_crm/app/auth/application/auth_provider.dart';
// import 'package:property_crm/app/auth/use_cases/auth_usecases.dart';
// import 'package:property_crm/app/home/application/home_provider.dart';
// import 'package:property_crm/app/home/use_cases/home_usecase.dart';
// import 'package:property_crm/app/lead/application/lead_provider.dart';
// import 'package:property_crm/app/lead/usecases/lead_use_cases.dart';
// import 'package:property_crm/app/lending/use_cases/lending_use_case.dart';
// import 'package:property_crm/app/tab/application/tab_provider.dart';
// import 'package:property_crm/repository/home/home_repository.dart';
import 'package:provider/provider.dart';

import '../app/lending/application/lending_provider.dart';
import '../app/lending/use_cases/lending_use_case.dart';
import '../repository/repository.dart';
// import '../app/lending/application/lending_provider.dart';
// import '../repository/repository.dart';

class AppProviders {
  static AppProviders shared = AppProviders();

  // ============================= Repository
  get _lendingRepo => LendingRepository();
  // get _authRepo => AuthRepository();
  // get _leadRepo => LeadRepository();
  // get _homeRepo => HomeRepository();
  //
  //
  // // ================================= useCases
  get _lendingUseCase => LendingUseCase(repo: _lendingRepo);
  // get _authUseCase => AuthUseCases(authRepository: _authRepo);
  // get _leadUseCase => LeadUseCases(leadRepository: _leadRepo);
  // get _homeUseCase => HomeUseCase(homeRepo: _homeRepo);
  //
  //
  // // ============================= Provider
  get lendingProvider => ChangeNotifierProvider(create: (context) => LendingProvider(useCase: _lendingUseCase));
  // get authProvider => ChangeNotifierProvider(create: (context) => AuthProvider(authUseCases: _authUseCase));
  // get leadProvider => ChangeNotifierProvider(create: (context) => LeadProvider(leadUseCases: _leadUseCase));
  // get tabProvider => ChangeNotifierProvider(create: (context) => TabProvider());
  // get homeProvider => ChangeNotifierProvider(create: (context) => HomeProvider(homeUseCase: _homeUseCase));

}