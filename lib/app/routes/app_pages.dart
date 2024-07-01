import 'package:get/get.dart';

import '../modules/bindings/auth/create_account_binding.dart';
import '../modules/views/auth/create_account_view.dart';
import '../modules/bindings/auth/new_password_screen_binding.dart';
import '../modules/views/auth/new_password_screen_view.dart';
import '../modules/bindings/auth/otp_screen_binding.dart';
import '../modules/views/auth/otp_screen_view.dart';
import '../modules/bindings/auth/profile_info_add_screen_binding.dart';
import '../modules/views/auth/profile_info_add_screen_view.dart';
import '../modules/bindings/auth/sign_in_binding.dart';
import '../modules/views/auth/sign_in_view.dart';
import '../modules/bindings/location/add_manu_loca_screen_binding.dart';
import '../modules/views/location/add_manu_loca_screen_view.dart';
import '../modules/bindings/location/loca_allow_permi_screen_binding.dart';
import '../modules/views/location/loca_allow_permi_screen_view.dart';
import '../modules/bindings/home/add_card_binding.dart';
import '../modules/views/home/add_card_view.dart';
import '../modules/bindings/home/book_appointment_binding.dart';
import '../modules/views/home/book_appointment_view.dart';
import '../modules/bindings/bookings/bookings_screen_binding.dart';
import '../modules/views/bookings/bookings_screen/bookings_screen_view.dart';
import '../modules/bindings/bottom_navigation_bar_binding.dart';
import '../modules/views/bottom_navigation_bar_view.dart';
import '../modules/bindings/bookings/cancle_booking_binding.dart';
import '../modules/views/bookings/cancle_booking_view.dart';
import '../modules/bindings/home/category_binding.dart';
import '../modules/views/home/category_view.dart';
import '../modules/bindings/chat/chat_screen_binding.dart';
import '../modules/views/chat/chat_screen_view.dart';
import '../modules/bindings/chat/consultation_screen_binding.dart';
import '../modules/views/chat/consultation_screen_view.dart';
import '../modules/bindings/home/doctor_details_binding.dart';
import '../modules/views/home/doctor_details/doctor_details_view.dart';
import '../modules/bindings/explore_screen_binding.dart';
import '../modules/views/explore_screen_view.dart';
import '../modules/bindings/profile/favorites_screen_binding.dart';
import '../modules/views/profile/favorites_screen/favorites_screen_view.dart';
import '../modules/bindings/home/filter_screen_binding.dart';
import '../modules/views/home/filter_screen_view.dart';
import '../modules/bindings/home/get_direction_binding.dart';
import '../modules/views/home/get_direction_view.dart';
import '../modules/bindings/profile/help_center_binding.dart';
import '../modules/views/profile/help_center/help_center_view.dart';
import '../modules/bindings/home/home_binding.dart';
import '../modules/views/home/home_view.dart';
import '../modules/bindings/home/hospital_detail_binding.dart';
import '../modules/views/home/hospital_detail/hospital_detail_view.dart';
import '../modules/bindings/home/location_done_binding.dart';
import '../modules/views/home/location_done_view.dart';
import '../modules/bindings/chat/message_screen_binding.dart';
import '../modules/views/chat/message_screen_view.dart';
import '../modules/bindings/home/my_appointment_binding.dart';
import '../modules/views/home/my_appointment_view.dart';
import '../modules/bindings/home/nearby_hospitals_binding.dart';
import '../modules/views/home/nearby_hospitals_view.dart';
import '../modules/bindings/home/notification_screen_binding.dart';
import '../modules/views/home/notification_screen_view.dart';
import '../modules/bindings/onboarding_screen_binding.dart';
import '../modules/views/onboarding_screen_view.dart';
import '../modules/bindings/profile/password_manager_binding.dart';
import '../modules/views/profile/password_manager_view.dart';
import '../modules/bindings/home/patient_details_binding.dart';
import '../modules/views/home/patient_details_view.dart';
import '../modules/bindings/home/payment_binding.dart';
import '../modules/views/home/payment_view.dart';
import '../modules/bindings/home/payment_methods_binding.dart';
import '../modules/views/home/payment_methods_view.dart';
import '../modules/bindings/profile/privacy_policy_binding.dart';
import '../modules/views/profile/privacy_policy_view.dart';
import '../modules/bindings/profile/profile_screen_binding.dart';
import '../modules/views/profile/profile_screen_view.dart';
import '../modules/bindings/bookings/review/doctor_review_screen_binding.dart';
import '../modules/views/bookings/review/doctor_review_screen_view.dart';
import '../modules/bindings/bookings/review/hospital_review_screen_binding.dart';
import '../modules/views/bookings/review/hospital_review_screen_view.dart';
import '../modules/bindings/home/review_summary_binding.dart';
import '../modules/views/home/review_summary_view.dart';
import '../modules/bindings/search_screen_binding.dart';
import '../modules/views/search_screen_view.dart';
import '../modules/bindings/home/select_package_binding.dart';
import '../modules/views/home/select_package_view.dart';
import '../modules/bindings/profile/settings_binding.dart';
import '../modules/views/profile/settings_view.dart';
import '../modules/bindings/splash_screen_binding.dart';
import '../modules/views/splash_screen_view.dart';
import '../modules/bindings/home/top_specialist_binding.dart';
import '../modules/views/home/top_specialist_view.dart';
import '../modules/bindings/chat/video_call_screen_binding.dart';
import '../modules/views/chat/video_call_screen_view.dart';
import '../modules/bindings/welcome_screen_binding.dart';
import '../modules/views/welcome_screen_view.dart';
import '../modules/bindings/profile/your_profile_binding.dart';
import '../modules/views/profile/your_profile_view.dart';

part 'app_routes.dart';

class AppPages {
  AppPages._();

  static const INITIAL = Routes.SPLASH_SCREEN;

  static final routes = [
    GetPage(
      name: _Paths.HOME,
      page: () => const HomeView(),
      binding: HomeBinding(),
    ),
    GetPage(
      name: _Paths.SPLASH_SCREEN,
      page: () => const SplashScreenView(),
      binding: SplashScreenBinding(),
    ),
    GetPage(
      name: _Paths.WELCOME_SCREEN,
      page: () => const WelcomeScreenView(),
      binding: WelcomeScreenBinding(),
    ),
    GetPage(
      name: _Paths.ONBOARDING_SCREEN,
      page: () => const OnboardingScreenView(),
      binding: OnboardingScreenBinding(),
    ),
    GetPage(
      name: _Paths.SIGN_IN,
      page: () => const SignInView(),
      binding: SignInBinding(),
    ),
    GetPage(
      name: _Paths.CREATE_ACCOUNT,
      page: () => const CreateAccountView(),
      binding: CreateAccountBinding(),
    ),
    GetPage(
      name: _Paths.OTP_SCREEN,
      page: () => const OtpScreenView(),
      binding: OtpScreenBinding(),
    ),
    GetPage(
      name: _Paths.NEW_PASSWORD_SCREEN,
      page: () => const NewPasswordScreenView(),
      binding: NewPasswordScreenBinding(),
    ),
    GetPage(
      name: _Paths.PROFILE_INFO_ADD_SCREEN,
      page: () => const ProfileInfoAddScreenView(),
      binding: ProfileInfoAddScreenBinding(),
    ),
    GetPage(
      name: _Paths.LOCA_ALLOW_PERMI_SCREEN,
      page: () => const LocaAllowPermiScreenView(),
      binding: LocaAllowPermiScreenBinding(),
    ),
    GetPage(
      name: _Paths.ADD_MANU_LOCA_SCREEN,
      page: () => const AddManuLocaScreenView(),
      binding: AddManuLocaScreenBinding(),
    ),
    GetPage(
      name: _Paths.BOTTOM_NAVIGATION_BAR,
      page: () => const BottomNavigationBarView(),
      binding: BottomNavigationBarBinding(),
    ),
    GetPage(
      name: _Paths.EXPLORE_SCREEN,
      page: () => const ExploreScreenView(),
      binding: ExploreScreenBinding(),
    ),
    GetPage(
      name: _Paths.BOOKINGS_SCREEN,
      page: () => const BookingsScreenView(),
      binding: BookingsScreenBinding(),
    ),
    GetPage(
      name: _Paths.CHAT_SCREEN,
      page: () => const ChatScreenView(),
      binding: ChatScreenBinding(),
    ),
    GetPage(
      name: _Paths.PROFILE_SCREEN,
      page: () => const ProfileScreenView(),
      binding: ProfileScreenBinding(),
    ),
    GetPage(
      name: _Paths.FAVORITES_SCREEN,
      page: () => const FavoritesScreenView(),
      binding: FavoritesScreenBinding(),
    ),
    GetPage(
      name: _Paths.DOCTOR_DETAILS,
      page: () => const DoctorDetailsView(),
      binding: DoctorDetailsBinding(),
    ),
    GetPage(
      name: _Paths.BOOK_APPOINTMENT,
      page: () => const BookAppointmentView(),
      binding: BookAppointmentBinding(),
    ),
    GetPage(
      name: _Paths.SELECT_PACKAGE,
      page: () => const SelectPackageView(),
      binding: SelectPackageBinding(),
    ),
    GetPage(
      name: _Paths.PATIENT_DETAILS,
      page: () => const PatientDetailsView(),
      binding: PatientDetailsBinding(),
    ),
    GetPage(
      name: _Paths.PAYMENT_METHODS,
      page: () => const PaymentMethodsView(),
      binding: PaymentMethodsBinding(),
    ),
    GetPage(
      name: _Paths.ADD_CARD,
      page: () => const AddCardView(),
      binding: AddCardBinding(),
    ),
    GetPage(
      name: _Paths.REVIEW_SUMMARY,
      page: () => const ReviewSummaryView(),
      binding: ReviewSummaryBinding(),
    ),
    GetPage(
      name: _Paths.PAYMENT,
      page: () => const PaymentView(),
      binding: PaymentBinding(),
    ),
    GetPage(
      name: _Paths.GET_DIRECTION,
      page: () => const GetDirectionView(),
      binding: GetDirectionBinding(),
    ),
    GetPage(
      name: _Paths.LOCATION_DONE,
      page: () => const LocationDoneView(),
      binding: LocationDoneBinding(),
    ),
    GetPage(
      name: _Paths.TOP_SPECIALIST,
      page: () => const TopSpecialistView(),
      binding: TopSpecialistBinding(),
    ),
    GetPage(
      name: _Paths.NEARBY_HOSPITALS,
      page: () => const NearbyHospitalsView(),
      binding: NearbyHospitalsBinding(),
    ),
    GetPage(
      name: _Paths.HOSPITAL_DETAIL,
      page: () => const HospitalDetailView(),
      binding: HospitalDetailBinding(),
    ),
    GetPage(
      name: _Paths.SEARCH_SCREEN,
      page: () => const SearchScreenView(),
      binding: SearchScreenBinding(),
    ),
    GetPage(
      name: _Paths.FILTER_SCREEN,
      page: () => const FilterScreenView(),
      binding: FilterScreenBinding(),
    ),
    GetPage(
      name: _Paths.CANCLE_BOOKING,
      page: () => const CancleBookingView(),
      binding: CancleBookingBinding(),
    ),
    GetPage(
      name: _Paths.DOCTOR_REVIEW_SCREEN,
      page: () => const DoctorReviewScreenView(),
      binding: DoctorReviewScreenBinding(),
    ),
    GetPage(
      name: _Paths.HOSPITAL_REVIEW_SCREEN,
      page: () => const HospitalReviewScreenView(),
      binding: HospitalReviewScreenBinding(),
    ),
    GetPage(
      name: _Paths.MY_APPOINTMENT,
      page: () => const MyAppointmentView(),
      binding: MyAppointmentBinding(),
    ),
    GetPage(
      name: _Paths.MESSAGE_SCREEN,
      page: () => const MessageScreenView(),
      binding: MessageScreenBinding(),
    ),
    GetPage(
      name: _Paths.CATEGORY,
      page: () => const CategoryView(),
      binding: CategoryBinding(),
    ),
    GetPage(
      name: _Paths.NOTIFICATION_SCREEN,
      page: () => const NotificationScreenView(),
      binding: NotificationScreenBinding(),
    ),
    GetPage(
      name: _Paths.VIDEO_CALL_SCREEN,
      page: () => const VideoCallScreenView(),
      binding: VideoCallScreenBinding(),
    ),
    GetPage(
      name: _Paths.CONSULTATION_SCREEN,
      page: () => const ConsultationScreenView(),
      binding: ConsultationScreenBinding(),
    ),
    GetPage(
      name: _Paths.YOUR_PROFILE,
      page: () => const YourProfileView(),
      binding: YourProfileBinding(),
    ),
    GetPage(
      name: _Paths.SETTINGS,
      page: () => const SettingsView(),
      binding: SettingsBinding(),
    ),
    GetPage(
      name: _Paths.HELP_CENTER,
      page: () => const HelpCenterView(),
      binding: HelpCenterBinding(),
    ),
    GetPage(
      name: _Paths.PRIVACY_POLICY,
      page: () => const PrivacyPolicyView(),
      binding: PrivacyPolicyBinding(),
    ),
    GetPage(
      name: _Paths.PASSWORD_MANAGER,
      page: () => const PasswordManagerView(),
      binding: PasswordManagerBinding(),
    ),
  ];
}
