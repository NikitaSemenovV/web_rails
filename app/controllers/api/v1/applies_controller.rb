class Api::V1::AppliesController < ApplicationController
  before_action :set_item, only: [:show, :update, :destroy, :mark_deleted]

  def initialize
    super Apply, [:job_id, :geek_id]
  end

  def index
    if params[:geek_id]
      render json: {items: Apply.find_by_geek_id(params[:geek_id]) }, except: [:created_at, :updated_at]
    elsif params[:job_id]
      render json: {items: Apply.find_by_job_id(params[:job_id]) }, except: [:created_at, :updated_at]
    elsif params[:readed]
      render json: {items: Apply.find_by_read(params[:readed]) }, except: [:created_at, :updated_at]
    elsif params[:invited]
      render json: {items: Apply.find_by_read(params[:invited]) }, except: [:created_at, :updated_at]
    else
      super
    end
  end
end


