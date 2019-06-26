Pod::Spec.new do |s|

s.name         = "TPInAppReceipt"
s.version      = "2.0.3"
s.summary      = "Decode Apple Store Receipt and make it easy to read and validate it"

s.description  = "The library provides transparent way to decode and validate Apple Store Receipt. Pure swift, No OpenSSL!"

s.homepage     = "http://tikhop.com"

s.license      = "MIT"
# s.license    = { :type => "MIT", :file => "FILE_LICENSE" }

s.author       = { "Pavel Tikhonenko" => "hi@tikhop.com" }

# ――― Platform Specifics ――――――――――――――――――――――――――――――――――――――――――――――――――――――― #
#
#  If this Pod runs only on iOS or OS X, then specify the platform and
#  the deployment target. You can optionally include the target after the platform.
#

s.ios.deployment_target = '8.2'
s.osx.deployment_target = '10.11'

# ――― Source Location ―――――――――――――――――――――――――――――――――――――――――――――――――――――――――― #
#
#  Specify the location from where the source should be retrieved.
#  Supports git, hg, bzr, svn and HTTP.
#

s.source       = { :git => "https://github.com/tikhop/TPInAppReceipt.git", :tag => "#{s.version}" }

# ――― Source Code ―――――――――――――――――――――――――――――――――――――――――――――――――――――――――――――― #
#
#  CocoaPods is smart about how it includes source code. For source files
#  giving a folder will include any swift, h, m, mm, c & cpp files.
#  For header files it will include any header in the folder.
#  Not including the public_header_files will make all headers public.
#

s.source_files  = "TPInAppReceipt/Source/*.{swift}", "Vendor/CryptoSwift/*.{swift}"

# ――― Resources ―――――――――――――――――――――――――――――――――――――――――――――――――――――――――――――――― #

s.swift_version = '5.0'

s.ios.deployment_target = '9.0'
s.osx.deployment_target = '10.10'

s.resources  = "TPInAppReceipt/AppleIncRootCertificate.cer"


s.subspec 'SignatureVerification' do |cs|
    cs.ios.source_files  = "TPInAppReceipt/Source/*.{swift}", "Vendor/CryptoSwift/*.{swift}", "TPInAppReceipt/OpenSSL/ios/*.{h}"
    cs.osx.source_files  = "TPInAppReceipt/Source/*.{swift}", "Vendor/CryptoSwift/*.{swift}", "TPInAppReceipt/OpenSSL/macos/*.{h}"
    
    cs.ios.vendored_frameworks = "TPInAppReceipt/OpenSSL/ios/OpenSSL.framework"
    cs.ios.xcconfig = {
        'CLANG_ALLOW_NON_MODULAR_INCLUDES_IN_FRAMEWORK_MODULES' => 'YES',
        'GCC_C_LANGUAGE_STANDARD' => 'gnu11'
    }
    
    cs.osx.vendored_frameworks = "TPInAppReceipt/OpenSSL/macos/OpenSSL.framework"
    cs.osx.xcconfig = {
        'CLANG_ALLOW_NON_MODULAR_INCLUDES_IN_FRAMEWORK_MODULES' => 'YES',
        'GCC_C_LANGUAGE_STANDARD' => 'gnu11'
    }
    
    cs.preserve_paths = 'TPInAppReceipt/OpenSSL/*'
    
    cs.ios.exclude_files = 'TPInAppReceipt/OpenSSL/macos/**'
    cs.osx.exclude_files = 'TPInAppReceipt/OpenSSL/ios/**'
end

# ――― Project Settings ――――――――――――――――――――――――――――――――――――――――――――――――――――――――― #
#
#  If your library depends on compiler flags you can set them in the xcconfig hash
#  where they will only apply to your library. If you depend on other Podspecs
#  you can include multiple dependencies to ensure it works.

# s.requires_arc = true

end
