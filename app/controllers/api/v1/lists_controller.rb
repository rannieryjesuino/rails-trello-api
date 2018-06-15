class Api::V1::ListsController < Api::V1::ApiController
    
    before_action :set_list, only: [:show, :update, :destroy]
    
    def index
     
        @lists = List.all
        
        render json: @lists
        
    end
    
    # GET /api/v1/lists/1
    
    def show
    
     render json: @list
    
    end
    
    # POST /api/v1/lists
    
    def create
    
        @list = List.new list_params
        
        if @list.save
        
            render json: @list, status: :created
        
        else
        
            render json: @list.errors, status: :unprocessable_entity
        
        end
    
    end
    
    # PATCH/PUT /api/v1/lists/1
    
    def update
    
        if @list.update list_params
        
            render json: @list
        
        else
        
            render json: @list.errors, status: :unprocessable_entity
        
        end
    
    end
    
    # DELETE /api/v1/lists/1
    
    def destroy
    
        parametros = list_params
        
        # Caso seja fornecido um id de alguma lista, antes de ser destruída todos os cards serão transferidos.
        unless parametros[:list_id].nil?
            @list.cards.each do |card|
                card.update list_id: parametros[:list_id]
            end
        end
    
        @list.destroy
    
    end
    
    private
    
        def set_list
        
             @list = List.find(params[:id])
        
        end
        
        def list_params
        
            params.require(:list).permit(:name, :board_id, :list_id)
        
        end

end
