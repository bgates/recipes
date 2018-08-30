class SizeConversionsController < ApplicationController

  def index
    @conversions = SizeConversion.where(ingredient_id: params[:ingredient_id])
    render layout: false
  end
end
