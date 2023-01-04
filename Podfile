# Uncomment the next line to define a global platform for your project
# platform :ios, '9.0'

target 'Instagram Clone' do
  # Comment the next line if you don't want to use dynamic frameworks
  use_frameworks!

  # Pods for Instagram Clone
	#Appirater
	pod 'Appirater'

  target 'Instagram CloneTests' do
    inherit! :search_paths
    # Pods for testing
  end

  target 'Instagram CloneUITests' do
    # Pods for testing
  end

    post_install do |installer|
     installer.pods_project.targets.each do |target|
         target.build_configurations.each do |config|
            if config.build_settings['IPHONEOS_DEPLOYMENT_TARGET'].to_f < 13.0
              config.build_settings['IPHONEOS_DEPLOYMENT_TARGET'] = '13.0'
            end
         end
     end
  end

end
