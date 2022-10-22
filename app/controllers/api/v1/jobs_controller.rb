class Api::V1::JobsController < ApplicationController
  before_action :set_item, only: [:show, :update, :destroy, :mark_deleted]

  def initialize
    super Job, [:place, :company_id, :name]
  end

  def index
    if params[:company_id]
      render json: { items: Job.find_by_company_id(params[:company_id]) }, except: [:id, :created_at, :updated_at]
    elsif params[:name] || params[:place]
      cond = []
      cond << ["name LIKE ?", "#{params[:name]}%"] if params[:name]
      if params[:place]
        if cond.length > 0
          cond[0][0] += " AND place LIKE ?"
          cond << "#{params[:place]}%"
        else
          cond << ["place LIKE ?", "#{params[:place]}%"]
        end
      end
      render json: { items: Job.where(*cond.flatten) }, except: [:id, :created_at, :updated_at]
    else
      super
    end
  end
end

