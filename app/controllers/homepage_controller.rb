class HomepageController < ApplicationController

  def index
    @users = []
    @user = current_or_guest_user
  end

  # def url_for(*args)
  #   options = args.extract_options!
  #   return super unless options.present?
  #   handle = options.delete(:handlebars)
  #   url = super(*(args.push(options)))
  #   handle ? url.gsub(/%7B%7B(.+)%7D%7D/){|m| "{{#{$1}}}"} : url
  # end

end
