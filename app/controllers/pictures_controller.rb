class PicturesController < ApplicationController

    def index
        @picture = Picture.all.order(created_at: :desc)
    end

end
