class ApplicationController < ActionController::Base
	Dotenv::Railtie.load if Rails.env == "development"
	def contentful
	  @client ||= Contentful::Client.new(
	    access_token: ENV['CONTENTFUL_ACCESS_TOKEN'],
	    space: ENV['CONTENTFUL_SPACE_ID'],
	    dynamic_entries: :auto,
	    raise_errors: true
	  )
	end
end
