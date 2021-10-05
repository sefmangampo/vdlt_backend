class Api::V1::TranslationsController < ApplicationController

  before_action :set_record, only: [:show, :update, :destroy]
  before_action :authorized!, only: [:create, :update, :destroy]
 
  def index
     @records = Translation.all #find_by(word_entry_id:  [params[:id]])

     render json: @records
  end

  def show_translations_by_entry 
    @records = Translation.where(word_entry_id:  [params[:id]])
    render json: @records
  end

  def show

    render json: @record
  end

  def create
    @rec = Translation.new(set_params)

    if @rec.save
      render json: @rec
    else
      render json: @rec.errors
    end

  end

  def update
    if @record.update(set_params)
      render json: {notice: 'Record was successfully updated.'}
    else
      render json: @record.errors
    end

  end

  def destroy
    @record.destroy

    render json: {notice: 'Record was successfully removed.'}
  end


  private

  def set_record
    @record =  Translation.find(params[:id])
  end

  def set_params
    params.permit(:id, :word_entry_id, :orig, :translated, :example_orig)
  end

end
