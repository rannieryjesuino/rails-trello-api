class Api::V1::ListsController < Api::V1::ApiController

    before_action :set_list, only: [:show, :update, :destroy]

    # GET /v1/lists

    def index

        @lists = List.all

        render json: @lists

    end

    # GET /v1/lists/1

    def show

     render json: @list

    end

    # POST /v1/lists

    def create

        @list = List.new list_params

        if @list.save

            render json: @list, status: :created

        else

            render json: @list.errors, status: :unprocessable_entity

        end

    end

    # PATCH/PUT /v1/lists/1

    def update

        if @list.update list_params

            render json: @list

        else

            render json: @list.errors, status: :unprocessable_entity

        end

    end

    # DELETE /v1/lists/1

    def destroy

      # Caso seja fornecido um id de alguma lista, antes de ser destruída todos os cards serão transferidos.
        if params.has_key?(:list_id)
          id = params.fetch(:list_id)
          transfer_list = List.find(id)

          if(@list.board_diferente(id))
              render json: {errors: "Não é possível mudar as atividades para uma lista em um quadro diferente!"}
              return
          end

          @list.cards.each do |card|
              card.list = transfer_list
              card.save
          end

          # Limpando a lista de cards da lista, para que não sejam deletados quando a mesma for deletada
          @list.cards = []
          @list.save
        end

        @list.destroy
        render json: {message: "Lista deletada com sucesso!"}


    end

    private

        def set_list

             @list = List.find(params[:id])

        end

        def list_params

            params.require(:list).permit(:name, :board_id, :list_id)

        end

end
