# Uncomment the next line to define a global platform for your project
# platform :ios, '9.0'

target 'MandiriSubmission' do
  # Comment the next line if you don't want to use dynamic frameworks
  use_frameworks!
  source 'https://cdn.cocoapods.org/'
  
  workspace 'MandiriSubmission'

  # Pods for MandiriSubmission
  pod 'Alamofire', '~> 5.2'
  target 'MandiriSubmissionTests' do
    inherit! :search_paths
    # Pods for testing
  end

  target 'MandiriSubmissionUITests' do
    # Pods for testing
  end

end

target 'Sources' do
  project 'Modules/Sources/Sources'
  pod 'Alamofire', '~> 5.2'
  
end
