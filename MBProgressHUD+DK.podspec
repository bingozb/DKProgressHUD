Pod::Spec.new do |s|
    s.name         = "MBProgressHUD+DK"
    s.version      = "1.1.1"
    s.ios.deployment_target = '7.0'
    s.summary      = "A simple second-dev of MBProgressHUD for Dankal."
    s.homepage     = "https://github.com/bingozb/DKProgressHUD.git"
    s.license              = { :type => "MIT", :file => "LICENSE" }
    s.author             = { "bingozb" => "454113692@qq.com" }
    s.source       = { :git => "https://github.com/bingozb/DKProgressHUD.git", :tag => "v1.1.1" }
    s.source_files  = "DKProgressHUD/*.{h,m}"
    s.resources          = "DKProgressHUD/DKProgressHUD.bundle"
    s.requires_arc = true
end