Pod::Spec.new do |s|
  s.name             = "Braintree"
  s.version          = "5.0.0"
  s.summary          = "Braintree v.zero: A modern foundation for accepting payments"
  s.description      = <<-DESC
                       Braintree is a full-stack payments platform for developers

                       This CocoaPod will help you accept payments in your iOS app.

                       Check out our development portal at https://developers.braintreepayments.com.
  DESC
  s.homepage         = "https://www.braintreepayments.com/how-braintree-works"
  s.documentation_url = "https://developers.braintreepayments.com/ios/start/hello-client"
  s.screenshots      = "https://raw.githubusercontent.com/braintree/braintree_ios/master/Docs/screenshot.png"
  s.license          = "MIT"
  s.author           = { "Braintree" => "code@getbraintree.com" }
  s.source           = { :git => "https://github.com/braintree/braintree_ios.git", :tag => s.version.to_s }
  s.social_media_url = "https://twitter.com/braintree"

  s.platform         = :ios, "12.0"
  s.requires_arc     = true
  s.compiler_flags = "-Wall -Werror -Wextra"

  s.default_subspecs = %w[Core Card PayPal]

  s.subspec "Core" do |s|
    s.source_files  = "Sources/BraintreeCore/**/*.{h,m}"
    s.public_header_files = "Sources/BraintreeCore/Public/BraintreeCore/*.h"
  end

  s.subspec "Apple-Pay" do |s|
    s.source_files  = "Sources/BraintreeApplePay/**/*.{h,m}"
    s.public_header_files = "Sources/BraintreeApplePay/Public/BraintreeApplePay/*.h"
    s.dependency "Braintree/Core"
    s.frameworks = "PassKit"
  end

  s.subspec "Card" do |s|
    s.source_files  = "Sources/BraintreeCard/**/*.{h,m}"
    s.public_header_files = "Sources/BraintreeCard/Public/BraintreeCard/*.h"
    s.dependency "Braintree/Core"
  end

  s.subspec "DataCollector" do |s|
    s.source_files = "Sources/BraintreeDataCollector/**/*.{h,m}"
    s.public_header_files = "Sources/BraintreeDataCollector/Public/BraintreeDataCollector/*.h"
    s.vendored_library = "Sources/BraintreeDataCollector/Kount/libDeviceCollectorLibrary.a"
    s.dependency "Braintree/Core"
  end

  s.subspec "PayPal" do |s|
    s.source_files = "Sources/BraintreePayPal/**/*.{h,m}"
    s.public_header_files = "Sources/BraintreePayPal/Public/BraintreePayPal/*.h"
    s.dependency "Braintree/Core"
    s.dependency "Braintree/PayPalDataCollector"
  end

  s.subspec "Venmo" do |s|
    s.source_files = "Sources/BraintreeVenmo/**/*.{h,m}"
    s.public_header_files = "Sources/BraintreeVenmo/Public/BraintreeVenmo/*.h"
    s.dependency "Braintree/Core"
    s.dependency "Braintree/PayPalDataCollector"
  end

  s.subspec "UnionPay" do |s|
    s.source_files  = "Sources/BraintreeUnionPay/**/*.{h,m}"
    s.public_header_files = "Sources/BraintreeUnionPay/Public/BraintreeUnionPay/*.h"
    s.frameworks = "UIKit"
    s.dependency "Braintree/Card"
    s.dependency "Braintree/Core"
  end

  s.subspec "PayPalDataCollector" do |s|
    s.source_files = "Sources/PayPalDataCollector/**/*.{h,m}"
    s.public_header_files = "Sources/PayPalDataCollector/Public/PayPalDataCollector/*.h"
    s.frameworks = "MessageUI", "SystemConfiguration", "CoreLocation", "UIKit"
    s.vendored_frameworks = "Frameworks/PPRiskMagnes.xcframework"
    s.dependency "Braintree/Core"
  end

  s.subspec "AmericanExpress" do |s|
    s.source_files  = "Sources/BraintreeAmericanExpress/**/*.{h,m}"
    s.public_header_files = "Sources/BraintreeAmericanExpress/Public/BraintreeAmericanExpress/*.h"
    s.dependency "Braintree/Core"
  end

  s.subspec "PaymentFlow" do |s|
    s.source_files = "Sources/BraintreePaymentFlow/**/*.{h,m}"
    s.public_header_files = "Sources/BraintreePaymentFlow/Public/BraintreePaymentFlow/*.h"
    s.weak_frameworks = "SafariServices"
    s.dependency "Braintree/Core"
    s.dependency "PayPalDataCollector"
  end

  s.subspec "ThreeDSecure" do |s|
    s.source_files = "Sources/BraintreeThreeDSecure/**/*.{h,m}"
    s.public_header_files = "Sources/BraintreeThreeDSecure/Public/BraintreeThreeDSecure/*.h"
    s.dependency "Braintree/PaymentFlow"
    s.vendored_frameworks = "Frameworks/CardinalMobile.framework"
  end

  # https://github.com/CocoaPods/CocoaPods/issues/10065#issuecomment-694266259
  s.pod_target_xcconfig = { 'EXCLUDED_ARCHS[sdk=iphonesimulator*]' => 'arm64' }
  s.user_target_xcconfig = { 'EXCLUDED_ARCHS[sdk=iphonesimulator*]' => 'arm64' }
end

