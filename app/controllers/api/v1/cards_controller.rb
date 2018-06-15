class Api::V1::CardsController < Api::V1::ApiController
    
    before_action :set_card, only: [:show, :update, :destroy]
    
    def index
     
        @cards = Card.all
        
        render json: @cards
        
    end
    
    # GET /api/v1/cards/1
    
    def show
    
     render json: @card
    
    end
    
    # POST /api/v1/cards
    
    def create
    
        @card = Card.new card_params
        
        if @card.save
        
            render json: @card, status: :created
        
        else
        
            render json: @card.errors, status: :unprocessable_entity
        
        end
    
    end
    
    # PATCH/PUT /api/v1/cards/1
    
    def update
    
        if @card.update card_params
        
            render json: @card
        
        else
        
            render json: @card.errors, status: :unprocessable_entity
        
        end
    
    end
    
    # DELETE /api/v1/cards/1
    
    def destroy
    
        @card.destroy
    
    end
    
    private

        def set_card
        
             @card = Card.find(params[:id])
        
        end

        def card_params
        
            params.require(:card).permit(:name, :desc, :list_id)
        
        end

end
