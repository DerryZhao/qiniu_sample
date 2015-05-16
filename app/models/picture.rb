require 'qiniu'

class Picture
 #上传图片
 def self.upload(key,bucket,path)
     upload_token = Qiniu.generate_upload_token :scope =>bucket,:escape => 1 
 	 Qiniu.upload_file :uptoken => upload_token,
                       :file => path,
                       :bucket => bucket,
                       :key => key,
                       :mime_type =>'image/png',
                       :enable_crc32_check => true
                       # :rotate => 0 
 end

 #下载图片
 def self.down_load(key)
      Qiniu.generate_download_token :pattern =>key,:expires_in => 100.seconds,
 end
 
 #删除图片
 def self.delete_image(key,bucket)
	 code, result, response_headers = Qiniu::Storage.delete(bucket,key)
	 code == 200
 end


 #图片可持续化存储
 def self.persist_save_image(key,bucket)
 	 #获取图片
	 response = Qiniu.get(bucket,key)
	 img_url = response["url"]
	 target_bucket = 'test'
	 target_key = "test.png"
	 mogrify_options = {
	   :thumbnail => "!120x120r",
	   :gravity => "center",
	   :crop => "!120x120a0a0",
	   :quality => 85,
	   :rotate => 0,
	   :format => "png",
	   :auto_orient => true
	 }
	 result = Qiniu.image_mogrify_save_as(target_bucket,target_key,img_url, mogrify_options)
	 delete_image(key)
  end
end