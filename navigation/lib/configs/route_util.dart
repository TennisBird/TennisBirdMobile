enum PAGES {
  splash,
  welcome,
  login,
  register,
  home,
  error,
}

extension AppPageExtension on PAGES {
  String get screenPath {
    switch (this) {
      case PAGES.splash:
        return "/";
      case PAGES.welcome:
        return "/welcome";
      case PAGES.login:
        return "/login";
      case PAGES.register:
        return "/register";
      case PAGES.home:
        return "/home";
      case PAGES.error:
        return "/error";
      default:
        return "/";
    }
  }

  String get screenName{
    switch (this) {
      case PAGES.splash:
        return "SPLASH";
      case PAGES.welcome:
        return "WELCOME";
      case PAGES.login:
        return "LOGIN";
      case PAGES.register:
        return "REGISTER";
      case PAGES.home:
        return "HOME";
      case PAGES.error:
        return "ERROR";
      default:
        return "SPLASH";
    }
  }
}
