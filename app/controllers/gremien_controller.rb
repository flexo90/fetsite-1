class GremienController < ApplicationController
  # GET /gremien
  # GET /gremien.json
 before_filter {@toolbar_elements=[]}
  def verwalten
    @gremien = Gremium.all
    @gremientabs=Gremium.tabs
    @toolbar_elements << {:text=>I18n.t('common.new'),:path=>new_gremium_path() ,:icon=>:plus} if can? :new, Gremium
    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @gremien }
    end
  end

  def index 
    @gremien = Gremium.order(:typ).order(:name)
    @gremientabs=Gremium.tabs
  
  end


  # GET /gremien/1
  # GET /gremien/1.json
  def show
    @gremium = Gremium.find(params[:id])
    @gremientabs=Gremium.tabs
    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @gremium }
    end
  end

  # GET /gremien/new
  # GET /gremien/new.json
  def new
    @gremium = Gremium.new

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @gremium }
    end
  end

  # GET /gremien/1/edit
  def edit
    @gremium = Gremium.find(params[:id])
  end

  # POST /gremien
  # POST /gremien.json
  def create
    @gremium = Gremium.new(params[:gremium])

    respond_to do |format|
      if @gremium.save
        format.html { redirect_to @gremium, notice: 'Gremium was successfully created.' }
        format.json { render json: @gremium, status: :created, location: @gremium }
      else
        format.html { render action: "new" }
        format.json { render json: @gremium.errors, status: :unprocessable_entity }
      end
    end
  end

  # PUT /gremien/1
  # PUT /gremien/1.json
  def update
    @gremium = Gremium.find(params[:id])

    respond_to do |format|
      if @gremium.update_attributes(params[:gremium])
        format.html { redirect_to @gremium, notice: 'Gremium was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: @gremium.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /gremien/1
  # DELETE /gremien/1.json
  def destroy
    @gremium = Gremium.find(params[:id])
    @gremium.destroy

    respond_to do |format|
      format.html { redirect_to gremien_url }
      format.json { head :no_content }
    end
  end
end
