class SubscribersController < ApplicationController
    before_action :set_subscriber, only: [:destroy]

  # GET /subscribers/new
  def new
    @subscriber = Subscriber.new
  end



  def create
  	@subscriber = Subscriber.new(subscriber_params)
	  	store = Store.find(@subscriber.store_id)
    respond_to do |format|
      if @subscriber.save
      	@subscriber.follow(store)
        format.html { redirect_to :back, notice: 'subscriber was successfully created.' }
        format.json { render action: 'show', status: :created, location: @subscriber }
      else
        format.html { render action: 'new' }
        format.json { render json: @subscriber.errors, status: :unprocessable_entity }
      end
    end
  end

  def destroy
 	store = Store.find(@subscriber.store_id)
  	@subscriber.stop_following(store)
  	@subscriber.destroy
  	redirect_to root_url
  end

   private
 	
 	def set_subscriber
      @subscriber = Subscriber.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def subscriber_params
      params.require(:subscriber).permit(:email,:city,:store_id,:status)
    end
end
