class ApplicationController < ActionController::API
  def initialize(kclass = nil, permit = nil)
    @class = kclass
    @permit = permit
  end

  def index
    render json: { "#{@class.table_name}": @class.all }, except: [:id, :created_at, :updated_at]
  end

  def show
    render json: @item
  end

  def create
    @item = @class.new(item_params)
    if @item.save
      render json: @item.as_json, status: :created
    else
      render json: {user: @item.errors, status: :no_content}
    end
  end

  def update
    if @item.update(item_params)
      render json: @item
    else
      render json: @item.errors, status: :unprocessable_entity
    end
  end

  def destroy
    if @item.destroy
      render json: @item
    else
      render json: @item.errors, status: :unprocessable_entity
    end
  end

  def mark_deleted
    if @item.deleted
      puts "deleted: "
      render json: { "deleted_#{@class.class.name}": [],
                     deleted_already: :not_modified,
      }
    else
      @item.mark_delete # model method
      render json: { "deleted_#{@class.class.name}": @item,
                     code: 200,
                     status: :success,
      }, except: [:created_at, :updated_at]
    end
  end

  rescue_from ActiveRecord::RecordNotFound do
    render json: { error: 'No such record in Database; check params',
                   status: :not_found,
    }
  end

  def catch_404
    raise ActionController::RoutingError.new(params[:path])
  end

  rescue_from ActionController::RoutingError do |exception|
    logger.error "Routing error occurred: #{exception}"
    # render plain: '404 Not found', status: 404
    render json: { error: 'No route matches; check routes',
                   status: :no_route,
    }
  end

  protected
  def set_item
    if params[@class.class.name + '_id']
      params[:id] = params[@class.class.name + '_id']
    end
    @item = @class.find(params[:id])
  end
  def item_params
    params.permit(*@permit)
  end
end
