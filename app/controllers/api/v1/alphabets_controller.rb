class Api::V1::AlphabetsController < ApplicationController

    before_action :set_record, only: [:show]
  before_action :authorized, only: [:create, :update, :destroy]
 

    def index

        @records = Alphabet.all

        render json: @records
    end

    def show
        render json: @record
    end

    def create
        @rec = Alphabet.new(set_params)

        if @rec.save
            render json: @rec
        else
            render json: @rec.errors
        end

    end

  def update
@record = Alphabet.find(params[:id])
    if @record.update(set_params)
      render json: {notice: 'Record was successfully updated.'}
    else
      render json: @record.errors
    end

  end


    private

    def set_record
        @record = Alphabet.find_by('name',[params[:name]])
    end

    def set_params
        params.permit(:id, :name, :status)
    end

end
