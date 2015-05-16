#!/usr/bin/env ruby
require 'qiniu'
Qiniu.establish_connection! :access_key => 'api_key',
                            :secret_key => 'api_secret',
                            :block_size      => 1024*1024*4,
                            :chunk_size      => 1024*256,
                            :tmpdir          => Dir.tmpdir + File::SEPARATOR + 'Qiniu',
                            :enable_debug    => true,
                            :auto_reconnect  => true,
                            :max_retry_times => 3