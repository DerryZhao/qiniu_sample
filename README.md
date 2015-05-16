# qiniu_sample
七牛云存储针对ruby 简单使用例
#环境ruby2.0 + rails4.2
安装

在您 Ruby 应用程序的 Gemfile 文件中，添加如下一行代码：
 * gem 'qiniu', '~> 6.4.1'

然后，在应用程序所在的目录下，可以运行 bundle 安装依赖包：

$ bundle
或者，可以使用 Ruby 的包管理器 gem 进行安装：

$ gem install qiniu
使用方法

###在项目config/initializers 新建文件qiniu_sdk.rb.并添加以下代码：                                                                     #!/usr/bin/env ruby
require 'qiniu'
Qiniu.establish_connection! :access_key => 七牛帐号key,
                            :secret_key => 七牛帐号secret,
                            :block_size      => 1024*1024*4,
                            :chunk_size      => 1024*256,
                            :tmpdir          => Dir.tmpdir + File::SEPARATOR + 'Qiniu',
                            :enable_debug    => true,
                            :auto_reconnect  => true,
                            :max_retry_times => 3

command: bin/rails console Start the Rails console
上传图片
 Picture.upload(key,bucket,path)

参数具体意义，请查看官方文档
 https://github.com/qiniu/ruby-sdk/tree/master/docs