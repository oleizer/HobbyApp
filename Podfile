platform :ios, '10.0'

target 'HobbyApp' do
    use_frameworks!
    pod 'Crashlytics'
    pod 'AlamofireImage'
pod 'PINCache', '3.0.1-beta.6'
pod 'PINRemoteImage', '3.0.0-beta.13'
	pod 'Validator'
    pod 'Fabric'
	pod 'PromiseKit'
    pod 'Moya'
    pod 'SnapKit'
    pod 'SwiftGen'
    pod 'MBProgressHUD'
    pod 'KeychainAccess'
    pod 'SwiftLint'
    pod 'SwiftyUserDefaults'
    pod 'SwiftyJSON'
    target 'HobbyAppTests' do
    inherit! :search_paths
    #Put pods used for both test targets here
    end
end

post_install do |installer|
    installer.pods_project.targets.each do |target|
        target.build_configurations.each do |config|
            config.build_settings['ENABLE_BITCODE'] = 'YES'
            config.build_settings['SWIFT_VERSION'] = '4.0'
            config.build_settings['IPHONEOS_DEPLOYMENT_TARGET'] = '10.0'
        end
    end
end
                
