import 'package:dio/dio.dart';
import 'package:retrofit/retrofit.dart';
import 'package:web_app_demo/model/about_app_configuration_api/about_app_configuration_model.dart';
import 'package:web_app_demo/model/data_api/data_model.dart';
import 'package:web_app_demo/model/exit_popup_configuration_api/exit_popup_configuration_model.dart';
import 'package:web_app_demo/model/onboarding_title_api/onboarding_title_model.dart';
import 'package:web_app_demo/model/onesignal_configuration_api/onesignal_configuration_model.dart';
import 'package:web_app_demo/model/progress_bar_style_api/progress_bar_style_model.dart';
import 'package:web_app_demo/model/share_content_api/share_content_model.dart';
import 'package:web_app_demo/model/splash_screen_api/splash_model.dart';
import 'package:web_app_demo/model/theme_style_api/theme_style_model.dart';

part 'get_all_api.g.dart';

@RestApi(baseUrl: 'http://iselino.mallorcas.eu/api/')
abstract class ApiClient {
  factory ApiClient(Dio dio, {String baseUrl}) = _ApiClient;

  @GET('splash-configuration')
  Future<SplashModel> splashData();

  @GET('app-configurations')
  Future<DataModel> data();

  @GET('progress-bars')
  Future<ProgressBarStyleModel> progressBarStyleData();

  @GET('exit-popup-configuration')
  Future<ExitPopupConfigurationModel> exitPopupConfigurationData();

  @GET('share-content')
  Future<ShareContentModel> shareContentData();

  @GET('theme-style')
  Future<ThemeStyleModel> themeStyleData();

  @GET('about-app-configurations')
  Future<AboutAppConfigurationModel> aboutAppConfigurationData();

  @GET('walk-through')
  Future<OnBoardingTitleModel> onBoardingTitleData();

  @GET('onesignal-configuration')
  Future<OnesignalConfigurationModel> onesignalConfigurationData();
}
