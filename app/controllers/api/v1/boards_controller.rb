class Api::V1::BoardsController < Api::V1::ApiController

    before_action :set_board, only: [:show, :update, :destroy]

    def index

        @boards = Board.all

        render json: @boards

    end

    # GET /v1/boards/1

    def show

     render json: @board

    end

    # POST /v1/boards

    def create

        @board = Board.new board_params

        if @board.save

            render json: @board, status: :created

        else

            render json: @board.errors, status: :unprocessable_entity

        end

    end

    # PATCH/PUT /v1/boards/1

    def update

        if @board.update board_params

            render json: @board

        else

            render json: @board.errors, status: :unprocessable_entity

        end

    end

    # DELETE /v1/boards/1

    def destroy

        @board.destroy

    end

    private

        def set_board

             @board = Board.find(params[:id])

        end

        def board_params

            params.require(:board).permit(:name)

        end

end
