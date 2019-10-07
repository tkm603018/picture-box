class ImagepostsController < ApplicationController
def index
    @imageposts =Picture.all.order(created_at: :desc)
end

def show
    @imagepost = Picture.find_by(id: params[:id])
    puts @imagepost.inspect
end

def new
    @imagepost = Picture.new
end

def create
    Picture.create!(post_params)
    redirect_to("/imageposts/index")
end

def edit
    @imageposts = Picture.find_by(id: params[:id])
end

def update
end

def destroy
end

private
def post_params

end
end
