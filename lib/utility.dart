import 'dart:io' show Platform;

String? getDesktopUserAgent() {
  if (Platform.isIOS) {
    return "Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/605.1.15 (KHTML, like Gecko) Version/16.2 Safari/605.1.15";
  } else if (Platform.isAndroid) {
    return "Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/108.0.0.0 Safari/537.36";
  }
  return null;
}

String? getMobileUserAgent() {
  if (Platform.isIOS) {
    return "Mozilla/5.0 (iPhone; CPU iPhone OS 16_2 like Mac OS X) AppleWebKit/605.1.15 (KHTML, like Gecko) GSA/242.1.493995244 Mobile/15E148 Safari/604.1";
  } else if (Platform.isAndroid) {
    return "Mozilla/5.0 (Linux; Android 13; SM-G988B) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/108.0.0.0 Mobile Safari/537.36";
  }
  return null;
}

String whatsappURL() {
  return "https://web.whatsapp.com/";
}

String telegramURL() {
  return 'https://web.telegram.org/k/';
}

String instagramURL() {
  return 'https://www.instagram.com/';
}

String twitterURL() {
  return 'https://mobile.twitter.com/';
}

String tiktokURL() {
  return 'https://www.tiktok.com/';
}

String facebookURL() {
  return 'https://m.facebook.com/';
}
