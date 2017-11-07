// Generated using SwiftGen, by O.Halligon — https://github.com/SwiftGen/SwiftGen

#if os(OSX)
  import AppKit.NSFont
  typealias Font = NSFont
#elseif os(iOS) || os(tvOS) || os(watchOS)
  import UIKit.UIFont
  typealias Font = UIFont
#endif

// swiftlint:disable file_length

struct FontConvertible {
  let name: String
  let family: String
  let path: String

  func font(size: CGFloat) -> Font! {
    return Font(font: self, size: size)
  }

  func register() {
    guard let url = url else { return }
    var errorRef: Unmanaged<CFError>?
    CTFontManagerRegisterFontsForURL(url as CFURL, .process, &errorRef)
  }

  fileprivate var url: URL? {
    let bundle = Bundle(for: BundleToken.self)
    return bundle.url(forResource: path, withExtension: nil)
  }
}

extension Font {
  convenience init!(font: FontConvertible, size: CGFloat) {
    #if os(iOS) || os(tvOS) || os(watchOS)
    if !UIFont.fontNames(forFamilyName: font.family).contains(font.name) {
      font.register()
    }
    #elseif os(OSX)
    if let url = font.url, CTFontManagerGetScopeForURL(url as CFURL) == .none {
      font.register()
    }
    #endif

    self.init(name: font.name, size: size)
  }
}

// swiftlint:disable identifier_name line_length type_body_length
enum FontFamily {
  enum SFUIDisplay {
    static let black = FontConvertible(name: "SFUIDisplay-Black", family: "SF UI Display", path: "SF-UI-Display-Black.otf")
    static let bold = FontConvertible(name: "SFUIDisplay-Bold", family: "SF UI Display", path: "SF-UI-Display-Bold.otf")
    static let heavy = FontConvertible(name: "SFUIDisplay-Heavy", family: "SF UI Display", path: "SF-UI-Display-Heavy.otf")
    static let light = FontConvertible(name: "SFUIDisplay-Light", family: "SF UI Display", path: "SF-UI-Display-Light.otf")
    static let medium = FontConvertible(name: "SFUIDisplay-Medium", family: "SF UI Display", path: "SF-UI-Display-Medium.otf")
    static let regular = FontConvertible(name: "SFUIDisplay-Regular", family: "SF UI Display", path: "SF-UI-Display-Regular.otf")
    static let semibold = FontConvertible(name: "SFUIDisplay-Semibold", family: "SF UI Display", path: "SF-UI-Display-Semibold.otf")
    static let thin = FontConvertible(name: "SFUIDisplay-Thin", family: "SF UI Display", path: "SF-UI-Display-Thin.otf")
    static let ultralight = FontConvertible(name: "SFUIDisplay-Ultralight", family: "SF UI Display", path: "SF-UI-Display-Ultralight.otf")
  }
  enum SFUIText {
    static let bold = FontConvertible(name: "SFUIText-Bold", family: "SF UI Text", path: "SF-UI-Text-Bold.otf")
    static let boldItalic = FontConvertible(name: "SFUIText-BoldItalic", family: "SF UI Text", path: "SF-UI-Text-BoldItalic.otf")
    static let heavy = FontConvertible(name: "SFUIText-Heavy", family: "SF UI Text", path: "SF-UI-Text-Heavy.otf")
    static let heavyItalic = FontConvertible(name: "SFUIText-HeavyItalic", family: "SF UI Text", path: "SF-UI-Text-HeavyItalic.otf")
    static let italic = FontConvertible(name: "SFUIText-Italic", family: "SF UI Text", path: "SF-UI-Text-RegularItalic.otf")
    static let light = FontConvertible(name: "SFUIText-Light", family: "SF UI Text", path: "SF-UI-Text-Light.otf")
    static let lightItalic = FontConvertible(name: "SFUIText-LightItalic", family: "SF UI Text", path: "SF-UI-Text-LightItalic.otf")
    static let medium = FontConvertible(name: "SFUIText-Medium", family: "SF UI Text", path: "SF-UI-Text-Medium.otf")
    static let mediumItalic = FontConvertible(name: "SFUIText-MediumItalic", family: "SF UI Text", path: "SF-UI-Text-MediumItalic.otf")
    static let regular = FontConvertible(name: "SFUIText-Regular", family: "SF UI Text", path: "SF-UI-Text-Regular.otf")
    static let semibold = FontConvertible(name: "SFUIText-Semibold", family: "SF UI Text", path: "SF-UI-Text-Semibold.otf")
    static let semiboldItalic = FontConvertible(name: "SFUIText-SemiboldItalic", family: "SF UI Text", path: "SF-UI-Text-SemiboldItalic.otf")
  }
}
// swiftlint:enable identifier_name line_length type_body_length

private final class BundleToken {}
