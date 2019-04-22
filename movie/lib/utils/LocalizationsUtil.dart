import 'package:flutter/material.dart';

class LocalizationsUtil {
  LocalizationsUtil(this.locale);

  Locale locale;

  /// Call in screen to use.
  static LocalizationsUtil of(BuildContext context) {
    return Localizations.of<LocalizationsUtil>(context, LocalizationsUtil);
  }

  static Map<String, Map<String, String>> localizedValues = {
    'en': {
      /// Title screen
      'ok': 'Ok',
      'loading_3_dot': 'Loading...',
      'please_wait_for_a_moment': 'Please wait for a moment.',
      'next': 'Next',
      'phone_number_colon': 'Phone number:',
      'password_colon': 'Password',
      'back': 'Back',
      'forget_pwd': 'Forget passsword',
      'log_in': 'Log in',
      'send_again': 'Send again',
      'code_sent_to_space': 'Code sent to ',
      'please_input_verify_code': 'Please, input verify code',
      'waiting_up': 'Please, waiting up 60s to click "Send again"',
      'least_5_characters': 'Password must be at least 5 characters',
      'cancel': 'Cancel',
      'create_new_password': 'Create new password',

      'checkIn_history': 'CheckIn history',
      'input_search': 'Searching...',
      'services': 'Services',
      'about_us': 'About Us',
      'title': 'The system only scans up to 8 items',
      'completed': 'Completed',
      'confirm': 'Confirm',
      'survey': 'Survey',
      'question': 'Questions',
      'home_page': 'Home Page',
      'list_of_items': 'List of items',
      'check_in': 'Check In'
    },
    'vi': {
      'ok': 'Đồng ý',
      'loading_3_dot': 'Đang tải...',
      'please_wait_for_a_moment': 'Vui lòng chờ trong giây lát.',
      'next': 'Tiếp',
      'phone_number_colon': 'Số điện thoại:',
      'password_colon': 'Mật khẩu',
      'back': 'Quay lại',
      'forget_pwd': 'Quên mật khẩu',
      'log_in': 'Đăng nhập',
      'send_again': 'Gửi lại mã số',
      'code_sent_to_space': 'Mã số được gửi đến ',
      'checkIn_history': 'Lịch sử CheckIn',
      'input_search': 'Tìm kiếm...',
      'services': 'Dịch vụ của chúng tôi',
      'about_us': 'Thông tin nhà phát triển',
      'title': 'Hệ thống chỉ cho quét tối đa 8 items',
      'completed': 'Hoàn thành',
      'confirm': 'Xác nhận',
      'survey': 'Khảo sát',
      'question': 'Danh sách khảo sát',
      'home_page': 'Trang chủ',
      'list_of_items': 'Danh sách mục',
      'check_in': 'Check In',
    },
  };

  String get getCodeIncorrect {
    return localizedValues[locale.languageCode]['code_incorrect'];
  }

  String get getPasswordIsNotCorrect {
    return localizedValues[locale.languageCode]['password_is_not_correct'];
  }

  String get getPhoneNumberIsNotExist {
    return localizedValues[locale.languageCode]['phone_number_is_not_exist'];
  }

  String get getCannotConnectToServer {
    return localizedValues[locale.languageCode]['cannot_connect_to_server'];
  }

  String get getNumberTicketCheckInColon {
    return localizedValues[locale.languageCode]['number_ticket_check_in_colon'];
  }

  String get getHappening {
    return localizedValues[locale.languageCode]['happening'];
  }

  String get getFinished {
    return localizedValues[locale.languageCode]['finished'];
  }

  String get getEvent {
    return localizedValues[locale.languageCode]['event'];
  }

  String get getPhoneNumberColon {
    return localizedValues[locale.languageCode]['phone_number_colon'];
  }

  String get getPasswordColon {
    return localizedValues[locale.languageCode]['password_colon'];
  }

  String get getBack {
    return localizedValues[locale.languageCode]['back'];
  }

  String get getForgetPwd {
    return localizedValues[locale.languageCode]['forget_pwd'];
  }

  String get getSendAgain {
    return localizedValues[locale.languageCode]['send_again'];
  }

  String get getLogin {
    return localizedValues[locale.languageCode]['log_in'];
  }

  String get getCodeSentToSpace {
    return localizedValues[locale.languageCode]['code_sent_to_space'];
  }

  String get getNext {
    return localizedValues[locale.languageCode]['next'];
  }

  String get getLoading3Dot {
    return localizedValues[locale.languageCode]['loading_3_dot'];
  }

  String get getOk {
    return localizedValues[locale.languageCode]['ok'];
  }

  String get getCancel {
    return localizedValues[locale.languageCode]['cancel'];
  }

  String get getPleaseWaitForAMoment {
    return localizedValues[locale.languageCode]['please_wait_for_a_moment'];
  }

  String get getInputVerifyCode {
    return localizedValues[locale.languageCode]['please_input_verify_code'];
  }

  String get getWaitingUp {
    return localizedValues[locale.languageCode]['waiting_up'];
  }

  String get getLeast5Characters {
    return localizedValues[locale.languageCode]['least_5_characters'];
  }

  String get getCreateNewPassword {
    return localizedValues[locale.languageCode]['create_new_password'];
  }

  String get getConfirmPassword {
    return localizedValues[locale.languageCode]['confirm_password'];
  }

  String get getIncorrectTickets {
    return localizedValues[locale.languageCode]['incorrect_tickets'];
  }

  String get getWelcome {
    return localizedValues[locale.languageCode]['welcome'];
  }

  String get getComeTo {
    return localizedValues[locale.languageCode]['come_to'];
  }

  String get getFailedCheckIn {
    return localizedValues[locale.languageCode]['failed_check_in'];
  }

  String get getScanQRCode {
    return localizedValues[locale.languageCode]['scan_qr_code'];
  }

  String get getCountCheckInColonBlank {
    return localizedValues[locale.languageCode]['count_check_in_colon_blank'];
  }

  String get getCheckIn {
    return localizedValues[locale.languageCode]['check_in'];
  }

  String get getSynchronizedData {
    return localizedValues[locale.languageCode]['synchronized_data'];
  }

  String get getLastSynchronized {
    return localizedValues[locale.languageCode]['last_synchronized'];
  }

  String get getCreateEvent {
    return localizedValues[locale.languageCode]['create_event'];
  }

  String get getInputEventCodeColon {
    return localizedValues[locale.languageCode]['input_event_code_colon'];
  }

  String get getAdd {
    return localizedValues[locale.languageCode]['add'];
  }

  String get getPersonalTitle {
    return localizedValues[locale.languageCode]['personal_title'];
  }

  String get getPersonalFile {
    return localizedValues[locale.languageCode]['personal_profile'];
  }

  String get getContributeIdeas {
    return localizedValues[locale.languageCode]['contribute_ideas'];
  }

  String get getTabInformation {
    return localizedValues[locale.languageCode]['tab_information'];
  }

  String get getTabList {
    return localizedValues[locale.languageCode]['tab_list'];
  }

  String get createSuccessfully {
    return localizedValues[locale.languageCode]['create_successfully'];
  }

  String get createFailure {
    return localizedValues[locale.languageCode]['create_failure'];
  }

  String get noEvents {
    return localizedValues[locale.languageCode]['no_events'];
  }

  String get eventNotFound {
    return localizedValues[locale.languageCode]['event_not_found'];
  }

  String get getLogOut {
    return localizedValues[locale.languageCode]['log_out'];
  }

  String get getSuccessfullySync {
    return localizedValues[locale.languageCode]['successfully_sync'];
  }

  String get getCheckInHistory {
    return localizedValues[locale.languageCode]['checkIn_history'];
  }

  String get getInputSearch {
    return localizedValues[locale.languageCode]['input_search'];
  }

  String get getServices {
    return localizedValues[locale.languageCode]['services'];
  }

  String get getAboutUs {
    return localizedValues[locale.languageCode]['about_us'];
  }

  String get getTitle {
    return localizedValues[locale.languageCode]['title'];
  }

  String get getCompleted {
    return localizedValues[locale.languageCode]['completed'];
  }

  String get getConfirm {
    return localizedValues[locale.languageCode]['confirm'];
  }

  String get getSurvey {
    return localizedValues[locale.languageCode]['survey'];
  }

  String get getQuestion {
    return localizedValues[locale.languageCode]['question'];
  }

  String get getHomePage {
    return localizedValues[locale.languageCode]['home_page'];
  }

  String get getListOfItems {
    return localizedValues[locale.languageCode]['list_of_items'];
  }
}
