class PostsController < ApplicationController
  before_action :set_post, only: :show

  def index  
    @posts = contentful.entries(content_type: 'post', include: 1)
  end

  def show  
  	tags_entries = @post.tags
  	@tags = tags_entries.map {|tag| (contentful.entry tag.id).name}
  	@content = @post.content
  	# binding.pry
  	begin
  		@author = @post.author.name 
  	rescue Contentful::EmptyFieldError
  		@author = "Not Available"
  	end

  end

  private
  	def set_post
  		@post = contentful.entry post_params[:id]
  	end

  	def post_params
      params.permit(:id)
    end

end