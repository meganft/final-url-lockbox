class Api::V1::ReadsController < ApplicationController
  skip_before_filter :verify_authenticity_token

  def update
    @read = Read.find params[:id]
  end

end
