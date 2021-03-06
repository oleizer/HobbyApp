// Generated using SwiftGen, by O.Halligon — https://github.com/SwiftGen/SwiftGen

// swiftlint:disable sorted_imports
import Foundation
import UIKit

// swiftlint:disable file_length

protocol StoryboardType {
  static var storyboardName: String { get }
}

extension StoryboardType {
  static var storyboard: UIStoryboard {
    let name = self.storyboardName
    return UIStoryboard(name: name, bundle: Bundle(for: BundleToken.self))
  }
}

struct SceneType<T: Any> {
  let storyboard: StoryboardType.Type
  let identifier: String

  func instantiate() -> T {
    let identifier = self.identifier
    guard let controller = storyboard.storyboard.instantiateViewController(withIdentifier: identifier) as? T else {
      fatalError("ViewController '\(identifier)' is not of the expected class \(T.self).")
    }
    return controller
  }
}

struct InitialSceneType<T: Any> {
  let storyboard: StoryboardType.Type

  func instantiate() -> T {
    guard let controller = storyboard.storyboard.instantiateInitialViewController() as? T else {
      fatalError("ViewController is not of the expected class \(T.self).")
    }
    return controller
  }
}

protocol SegueType: RawRepresentable { }

extension UIViewController {
  func perform<S: SegueType>(segue: S, sender: Any? = nil) where S.RawValue == String {
    let identifier = segue.rawValue
    performSegue(withIdentifier: identifier, sender: sender)
  }
}

// swiftlint:disable explicit_type_interface identifier_name line_length type_body_length type_name
enum StoryboardScene {
  enum Activity: StoryboardType {
    static let storyboardName = "Activity"

    static let initialScene = InitialSceneType<UINavigationController>(storyboard: Activity.self)

    static let activityViewController = SceneType<HobbyApp.ActivityViewController>(storyboard: Activity.self, identifier: "ActivityViewController")
  }
  enum ActivityDetail: StoryboardType {
    static let storyboardName = "ActivityDetail"

    static let initialScene = InitialSceneType<HobbyApp.ActivityDetailViewController>(storyboard: ActivityDetail.self)

    static let activityDetailViewController = SceneType<HobbyApp.ActivityDetailViewController>(storyboard: ActivityDetail.self, identifier: "ActivityDetailViewController")
  }
  enum AddCity: StoryboardType {
    static let storyboardName = "AddCity"

    static let initialScene = InitialSceneType<HobbyApp.AddCityViewController>(storyboard: AddCity.self)

    static let addCityViewController = SceneType<HobbyApp.AddCityViewController>(storyboard: AddCity.self, identifier: "AddCityViewController")
  }
  enum City: StoryboardType {
    static let storyboardName = "City"

    static let initialScene = InitialSceneType<UINavigationController>(storyboard: City.self)

    static let cityViewController = SceneType<HobbyApp.CityViewController>(storyboard: City.self, identifier: "CityViewController")
  }
  enum Interest: StoryboardType {
    static let storyboardName = "Interest"

    static let initialScene = InitialSceneType<UINavigationController>(storyboard: Interest.self)

    static let interestViewController = SceneType<HobbyApp.InterestViewController>(storyboard: Interest.self, identifier: "InterestViewController")
  }
  enum Intro: StoryboardType {
    static let storyboardName = "Intro"

    static let initialScene = InitialSceneType<HobbyApp.IntroViewController>(storyboard: Intro.self)

    static let introViewController = SceneType<HobbyApp.IntroViewController>(storyboard: Intro.self, identifier: "IntroViewController")
  }
  enum LaunchScreen: StoryboardType {
    static let storyboardName = "LaunchScreen"

    static let initialScene = InitialSceneType<UIViewController>(storyboard: LaunchScreen.self)
  }
  enum Login: StoryboardType {
    static let storyboardName = "Login"

    static let initialScene = InitialSceneType<UINavigationController>(storyboard: Login.self)

    static let loginViewController = SceneType<HobbyApp.LoginViewController>(storyboard: Login.self, identifier: "LoginViewController")
  }
  enum Token: StoryboardType {
    static let storyboardName = "Token"

    static let initialScene = InitialSceneType<HobbyApp.TokenViewController>(storyboard: Token.self)

    static let tokenViewController = SceneType<HobbyApp.TokenViewController>(storyboard: Token.self, identifier: "TokenViewController")
  }
}

enum StoryboardSegue {
  enum Activity: String, SegueType {
    case toActivityDetail
  }
  enum City: String, SegueType {
    case toAddCity
    case toInterest
  }
  enum Intro: String, SegueType {
    case toLogin
  }
  enum Login: String, SegueType {
    case toToken
  }
  enum Token: String, SegueType {
    case toSelectCity
  }
}
// swiftlint:enable explicit_type_interface identifier_name line_length type_body_length type_name

private final class BundleToken {}
