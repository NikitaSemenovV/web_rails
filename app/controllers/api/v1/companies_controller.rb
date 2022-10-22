class Api::V1::CompaniesController < ApplicationController
  before_action :set_item, only: [:show, :update, :destroy, :mark_deleted]

  def initialize
    super Company, [:location, :name]
  end

  def index
    if params[:name] || params[:location]
      cond = []
      cond << ["name LIKE ?", "#{params[:name]}%"] if params[:name]
      if params[:location]
        if cond.length > 0
          cond[0][0] += " AND location LIKE ?"
          cond << "#{params[:location]}%"
        else
          cond << ["location LIKE ?", "#{params[:location]}%"]
        end
      end
      render json: { items: Job.where(*cond.flatten) }, except: [:id, :created_at, :updated_at]
    else
      super
    end
  end
end
