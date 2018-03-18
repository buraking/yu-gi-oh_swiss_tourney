require 'net/http'

class SetsController < ApplicationController
  def new

  end

  def create
    CardFetchingJob.perform_later(params[:name])
    redirect_to new_set_path, notice: 'We are processing your data'
  end
end
