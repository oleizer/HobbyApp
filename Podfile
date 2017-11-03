platform :ios, '10.0'

target 'HobbyApp' do
    use_frameworks!
    pod 'Crashlytics'
	pod 'Validator'
    pod 'Fabric'
    pod 'Moya'
    pod 'SnapKit'
    pod 'SwiftGen'
    pod 'SwiftLint'
    target 'HobbyAppTests' do
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
                
