// swiftlint:disable all
// Generated using SwiftGen — https://github.com/SwiftGen/SwiftGen

import Foundation

// swiftlint:disable superfluous_disable_command file_length implicit_return prefer_self_in_static_references

// MARK: - Strings

// swiftlint:disable explicit_type_interface function_parameter_count identifier_name line_length
// swiftlint:disable nesting type_body_length type_name vertical_whitespace_opening_braces
internal enum L10n {
  /// Account management
  internal static let accountManagementButton = L10n.tr("Localizable", "account_management_button", fallback: "Account management")
  /// Add
  internal static let addFinancesButton = L10n.tr("Localizable", "add_finances_button", fallback: "Add")
  /// Address
  internal static let addressLabel = L10n.tr("Localizable", "address_label", fallback: "Address")
  /// Country, City, Street, House, Apartment
  internal static let addressTextfield = L10n.tr("Localizable", "address_textfield", fallback: "Country, City, Street, House, Apartment")
  /// Already have an account?
  internal static let alreadyRegisterLabel = L10n.tr("Localizable", "already_register_label", fallback: "Already have an account?")
  /// Bonuses
  internal static let bonusesLabel = L10n.tr("Localizable", "bonuses_label", fallback: "Bonuses")
  /// Date of birth
  internal static let dateOfBirthLabel = L10n.tr("Localizable", "date_of_birth_label", fallback: "Date of birth")
  /// yyyy.mm.dd
  internal static let dateOfBirthTextfield = L10n.tr("Localizable", "date_of_birth_textfield", fallback: "yyyy.mm.dd")
  /// Email
  internal static let emailLabel = L10n.tr("Localizable", "email_label", fallback: "Email")
  /// Enter email
  internal static let emailTextfield = L10n.tr("Localizable", "email_textfield", fallback: "Enter email")
  /// Female
  internal static let femaleString = L10n.tr("Localizable", "female_string", fallback: "Female")
  /// Finances
  internal static let financeLabel = L10n.tr("Localizable", "finance_label", fallback: "Finances")
  /// Gender
  internal static let genderLabel = L10n.tr("Localizable", "gender_label", fallback: "Gender")
  /// INN
  internal static let innLabel = L10n.tr("Localizable", "inn_label", fallback: "INN")
  /// Enter INN
  internal static let innTextfield = L10n.tr("Localizable", "inn_textfield", fallback: "Enter INN")
  /// Localizable.strings
  ///   StorePrime
  /// 
  ///   Created by Artyom Tabachenko on 02.07.2023.
  internal static let maleString = L10n.tr("Localizable", "male_string", fallback: "Male")
  /// Name
  internal static let nameLabel = L10n.tr("Localizable", "name_label", fallback: "Name")
  /// Enter a name
  internal static let nameTextfield = L10n.tr("Localizable", "name_textfield", fallback: "Enter a name")
  /// Not registered yet?
  internal static let notRegisteredYetLabel = L10n.tr("Localizable", "not_registered_yet_label", fallback: "Not registered yet?")
  /// OR
  internal static let orLabel = L10n.tr("Localizable", "or_label", fallback: "OR")
  /// Orders
  internal static let ordersButton = L10n.tr("Localizable", "orders_button", fallback: "Orders")
  /// Password
  internal static let passwordLabel = L10n.tr("Localizable", "password_label", fallback: "Password")
  /// Enter the password
  internal static let passwordTextfield = L10n.tr("Localizable", "password_textfield", fallback: "Enter the password")
  /// Phone number
  internal static let phoneNumberLabel = L10n.tr("Localizable", "phone_number_label", fallback: "Phone number")
  /// +7(___)-___-__-__
  internal static let phoneNumberTextfield = L10n.tr("Localizable", "phone_number_textfield", fallback: "+7(___)-___-__-__")
  /// Purchases
  internal static let purchasesLabel = L10n.tr("Localizable", "purchases_label", fallback: "Purchases")
  /// Sign In
  internal static let signInButton = L10n.tr("Localizable", "sign_in_button", fallback: "Sign In")
  /// Authorization
  internal static let signInLabel = L10n.tr("Localizable", "sign_in_label", fallback: "Authorization")
  /// Sign out
  internal static let signOutButton = L10n.tr("Localizable", "sign_out_button", fallback: "Sign out")
  /// Sign Up
  internal static let signUpButton = L10n.tr("Localizable", "sign_up_button", fallback: "Sign Up")
  /// Register as a customer
  internal static let signUpCustomerButton = L10n.tr("Localizable", "sign_up_customer_button", fallback: "Register as a customer")
  /// Registration
  internal static let signUpLabel = L10n.tr("Localizable", "sign_up_label", fallback: "Registration")
  /// Register as a seller
  internal static let signUpSellerButton = L10n.tr("Localizable", "sign_up_seller_button", fallback: "Register as a seller")
  /// Surname
  internal static let surnameLabel = L10n.tr("Localizable", "surname_label", fallback: "Surname")
  /// Enter a surname
  internal static let surnameTextfield = L10n.tr("Localizable", "surname_textfield", fallback: "Enter a surname")
  /// Title
  internal static let titleLabel = L10n.tr("Localizable", "title_label", fallback: "Title")
  /// Enter a name
  internal static let titleTextfield = L10n.tr("Localizable", "title_textfield", fallback: "Enter a name")
}
// swiftlint:enable explicit_type_interface function_parameter_count identifier_name line_length
// swiftlint:enable nesting type_body_length type_name vertical_whitespace_opening_braces

// MARK: - Implementation Details

extension L10n {
  private static func tr(_ table: String, _ key: String, _ args: CVarArg..., fallback value: String) -> String {
    let format = BundleToken.bundle.localizedString(forKey: key, value: value, table: table)
    return String(format: format, locale: Locale.current, arguments: args)
  }
}

// swiftlint:disable convenience_type
private final class BundleToken {
  static let bundle: Bundle = {
    #if SWIFT_PACKAGE
    return Bundle.module
    #else
    return Bundle(for: BundleToken.self)
    #endif
  }()
}
// swiftlint:enable convenience_type
