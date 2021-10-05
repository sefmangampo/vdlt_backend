class Api::V1::WordEntriesController < ApplicationController
 
  before_action :set_record, only: [:show_by_slug]
  before_action :find_by_id, only: [:show, :update, :destroy]
  before_action :authorized, only: [:create, :update, :destroy]

  def index
    @records = WordEntry.all

    render json: @records
  end 

  def show_by_slug
    render json: @record
  end	

  def show_by_letter

    @records = WordEntry.where(alphabet_id:  [params[:id]])
    render json: @records

  end

  def show

    render json: @record
  end

  def create
    @rec = WordEntry.new(set_params)

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

  def find_by_id
    @record = WordEntry.find(params[:id])
  end

  def set_record
    @record = WordEntry.find_by(orig_word:  [params[:name]])
  end

  def set_params
    params.permit(:id, :orig_word, :correct_word, :alphabet_id, :book_part, :user_id)
  end

end
