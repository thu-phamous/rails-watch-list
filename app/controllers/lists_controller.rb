class ListsController < ApplicationController
  #ruft alle Listen der Datenbank auf und zeigt sie in einer Liste an
  def index
    @lists = List.all
  end
  #details einer Liste wird angezeigt.
  #Sie holt die entsprechende Liste über die id und speichert sie in @list
  def show
    @list = List.find(params[:id])
  end
  #Damit erstellt der User ein neues List Objekt
  def new
    @list = List.new
  end

  def create
    @list = List.new(name: params[:list][:name])
    if @list.save
      render json: @list
    else
      render json: @list.errors, status: :unprocessable_entity
    end
  end

  def destroy
    @list = List.find(params[:id])
    if @list
      @list.destroy
      render json: {message: "liste gelöscht mit id #{params[:id]}"}
    else
      render json: {error: "liste mit id #{params[:id]} kann nicht gefunden werden"}, status: 404
    end
  end
end
