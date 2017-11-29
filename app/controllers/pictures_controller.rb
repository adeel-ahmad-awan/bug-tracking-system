class PicturesController < ApplicationController


  def create
    @bug = Bug.find(params[:bug_id])
    @picture = @bug.pictures.build(picture_params)
    authorize @picture
    if @picture.save
       redirect_to  bug_path(@bug)
    else
      redirect_to  bug_path(@bug), :flash => { :error => "Image cannot be added. Try again..." }
    end
  end

  def index
    @bug = Bug.find(params[:bug_id])
    @picture = @bug.pictures.build
    @allpictures = @bug.pictures.all
  end

  def destroy
    @picture = Picture.find(params[:id])
    authorize @picture
    @picture.destroy
    redirect_to bug_pictures_path(@picture.bug_id)
  end

  private

  def picture_params
    params.require(:picture).permit(:description, :image)
  end

end
