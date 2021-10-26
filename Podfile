# Uncomment the next line to define a global platform for your project
# platform :ios, '9.0'

source 'https://github.com/CocoaPods/Specs.git'
platform :ios, '8.0' # or platform :osx, '10.10' if your target is OS X.
use_frameworks!

post_install do |installer|
  installer.pods_project.build_configurations.each do |config|
    config.build_settings["EXCLUDED_ARCHS[sdk=iphonesimulator*]"] = "arm64"
  end
end

def shared_pods
  pod 'RxSwift', '~> 5'
  pod 'RxCocoa', '~> 5'
  pod 'SwiftLint'
  pod 'FittedSheets', '~> 1.4.6'
  pod 'Swinject'
  pod 'SwinjectAutoregistration'
  pod 'RxDataSources', '~> 4.0'
  pod 'Kingfisher'

end

workspace 'App'

target 'KumparanUser' do
  use_frameworks!
  shared_pods

end

