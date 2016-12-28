class HongsController < ApplicationController
  def index
    @hongs = Hong.all
  end

  def new
    @hong = Hong.new
  end

  def create
    @hong = Hong.new(zip_params)

    if @hong.save
      redirect_to hongs_path, notice: "The zip(or 7z,tar...) #{@hong.name} has been uploaded."
    else
      render 'new'
    end

  end

  def destroy
    @hong = Hong.find(params[:id])
    @hong.destroy
    redirect_to hongs_path, notice:  "The zip(or 7z,tar...)  #{@hong.name} has been deleted."
  end

  private
  def zip_params
    params.require(:hong).permit(:name, :attachment)
  end

end
