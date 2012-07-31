class ZencoderCallbackController < ApplicationController
	skip_before_filter :verify_authenticity_token

 
  def create
    zencoder_response = ''
    sanitized_params = sanitize_params(params)
    sanitized_params.each do |key, value|
      zencoder_response = key.gsub('\"', '"')
    end
		if sanitized_params[:output][:label] == "web"
			video = Video.find_by_zencoder_output_id(sanitized_params[:output][:id].to_s)
			if sanitized_params[:output][:state] == "finished" && video
				video.processed!
				sanitized_params[:output][:thumbnails].each do |thumbs| 
					thumbs[:images].each do |images|
						video.thumbnails << Thumbnail.new(:url => images["url"])
					end
				end
			end
		else
			video = VideoAd.find_by_zencoder_output_id(sanitized_params[:output][:id].to_s)
			if sanitized_params[:output][:state] == "finished" && video
				video.processed!
				sanitized_params[:output][:thumbnails].each do |thumbs| 
					thumbs[:images].each do |images|
						video.thumbnail = images["url"]
					end
				end
				video.save!
			end
		end
 
    render :nothing => true
  end

  private
 
  def sanitize_params(params)
    params.delete(:action)
    params.delete(:controller)
    params
  end
end
