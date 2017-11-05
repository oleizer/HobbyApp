// Generated using SwiftGen, by O.Halligon — https://github.com/SwiftGen/SwiftGen

import Foundation

// swiftlint:disable file_length

// swiftlint:disable explicit_type_interface identifier_name line_length nesting type_body_length type_name
enum L10n {

  enum Intro {

    enum Message {
      /// Для продолжения нажмите кнопку "Продолжить"
      static let text = L10n.tr("Localizable", "Intro.Message.text")
    }

    enum Next {
      /// Продолжить
      static let title = L10n.tr("Localizable", "Intro.Next.title")
    }

    enum Welcome {
      /// Добро пожаловать\nЭто проект шаблон
      static let text = L10n.tr("Localizable", "Intro.Welcome.text")
    }
  }

  enum Login {

    enum Navigation {
      /// Авторизация
      static let title = L10n.tr("Localizable", "Login.Navigation.Title")
    }
  }
}
// swiftlint:enable explicit_type_interface identifier_name line_length nesting type_body_length type_name

extension L10n {
  private static func tr(_ table: String, _ key: String, _ args: CVarArg...) -> String {
    let format = NSLocalizedString(key, tableName: table, bundle: Bundle(for: BundleToken.self), comment: "")
    return String(format: format, locale: Locale.current, arguments: args)
  }
}

private final class BundleToken {}
