class NonprofitsController < ApplicationController
  def index
    @nonprofits = Nonprofit.all
  end

  def new
    @nonprofit = Nonprofit.new
  end

  def create
    @nonprofit = Nonprofit.new(nonprofit_params)
    if @nonprofit.save
      respond_to do |format|
        format.html { redirect_to nonprofits_path }
        format.js
      end
    else
      render 'new'
    end
  end

  def show
    @nonprofit = Nonprofit.find(params[:id])
  end

  def destroy
    @nonprofit = Nonprofit.find(params[:id])
    @nonprofit.destroy
    redirect_to root_url
  end

private
  def nonprofit_params
    params.require(:nonprofit).permit(:name, :description)
  end
end
