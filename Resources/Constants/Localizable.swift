// Generated using SwiftGen, by O.Halligon — https://github.com/SwiftGen/SwiftGen

import Foundation

// swiftlint:disable file_length

// swiftlint:disable explicit_type_interface identifier_name line_length nesting type_body_length type_name
enum L10n {

  enum Activitydetail {

    enum Cell {
      /// Адрес
      static let address = L10n.tr("Localizable", "ActivityDetail.Cell.address")
      /// Возраст
      static let age = L10n.tr("Localizable", "ActivityDetail.Cell.age")
      /// Организатор
      static let organizer = L10n.tr("Localizable", "ActivityDetail.Cell.organizer")
      /// Цены
      static let price = L10n.tr("Localizable", "ActivityDetail.Cell.price")
    }
  }

  enum City {

    enum Navigation {
      /// Выбор города
      static let title = L10n.tr("Localizable", "City.Navigation.Title")
    }
  }

  enum Error {
    /// Неизвестная ошибка
    static let unknownError = L10n.tr("Localizable", "Error.UnknownError")
  }

  enum Intro {

    enum Message {
      /// Для продолжения Вам необходимо авторизироваться. Для этого нажмите кнопку "Продолжить"
      static let text = L10n.tr("Localizable", "Intro.Message.text")
    }

    enum Next {
      /// Продолжить
      static let title = L10n.tr("Localizable", "Intro.Next.title")
    }

    enum Welcome {
      /// Добро пожаловать в Тестоваое приложение
      static let text = L10n.tr("Localizable", "Intro.Welcome.text")
    }
  }

  enum Login {

    enum Emailtextfield {
      /// Email
      static let placeholder = L10n.tr("Localizable", "Login.EmailTextField.Placeholder")
      /// Почта
      static let title = L10n.tr("Localizable", "Login.EmailTextField.Title")
    }

    enum Infolabel {
      /// Для авторизации введите ваш адрес электронной почты на который будет выслан ключ который необходимо ввести на следущем экране
      static let text = L10n.tr("Localizable", "Login.InfoLabel.text")
    }

    enum Navigation {
      /// Авторизация
      static let title = L10n.tr("Localizable", "Login.Navigation.Title")
    }

    enum Nextbutton {
      /// Продолжить
      static let title = L10n.tr("Localizable", "Login.NextButton.title")
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
