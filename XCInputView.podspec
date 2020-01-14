Pod::Spec.new do |spec|
  spec.name         = "XCInputView"
  spec.version      = "0.0.1"
  spec.summary      = "XCInputView."
  spec.description  = <<-DESC
XCInputView 简单文本输入框视图的封装
                   DESC
  spec.homepage     = "https://github.com/fanxiaocong/XCInputView"
  spec.license      = "MIT"
  spec.author             = { "@fanxiaocong" => "1016697223@qq.com" }
  spec.source       = { :git => "https://github.com/fanxiaocong/XCInputView.git", :tag => "#{spec.version}" }
  spec.source_files  = "XCInputView/*.{h,m,xib}"
end
