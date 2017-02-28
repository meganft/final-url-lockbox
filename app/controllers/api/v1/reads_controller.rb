class Api::V1::ReadsController < ApplicationController

  def update
    binding.pry
    @read = Read.find params[:id]

    # @link.assign_attributes link_params
    # just_read = @link.read_changed? && @link.read
    # if @link.save
    #   Read.create(link: @link) if just_read
    #   head :no_content
    # else
    #   render json: @link.errors.full_messages, status: 500
    # end
  end

end
