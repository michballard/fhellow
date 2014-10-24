class AboutController < ApplicationController

    def show
      @user = current_or_guest_user

    end

    def index
      @user = current_or_guest_user

    end
end
