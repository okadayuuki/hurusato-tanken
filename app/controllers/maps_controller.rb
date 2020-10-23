class MapsController < ApplicationController
   def index
   end

  def map
   	  @post = Post.find(params[:id])
 	  results = Geocoder.search(params[:address])
 	  @latlng = results.first.coordinates
 	  # これでmap.js.erbで、経度緯度情報が入った@latlngを使える。

	  respond_to do |format|
 	    format.js
 	  end
   end

   private
   def post_params
     params.require(:post).permit(:title)
   end
end
