class TopController < ApplicationController
    def index
    @pictures = Picture.page(params[:page]).per(5)
    end
end
