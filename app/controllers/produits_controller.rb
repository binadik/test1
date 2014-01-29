class ProduitsController < ApplicationController
  before_action :set_produit, only: [:show, :edit, :update, :destroy]
  before_action :correct_user, only: [:edit, :update, :destroy]
  before_action :authenticate_user!, except: [:index, :show]

  # GET /produits
  # GET /produits.json
  def index
    @produits = Produit.all
  end

  # GET /produits/1
  # GET /produits/1.json
  def show
  end

  # GET /produits/new
  def new
    @produit = current_user.produits.build
  end

  # GET /produits/1/edit
  def edit
  end

  # POST /produits
  # POST /produits.json
  def create
    @produit = current_user.produits.build(produit_params)

    respond_to do |format|
      if @produit.save
        format.html { redirect_to @produit, notice: 'Produit was successfully created.' }
        format.json { render action: 'show', status: :created, location: @produit }
      else
        format.html { render action: 'new' }
        format.json { render json: @produit.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /produits/1
  # PATCH/PUT /produits/1.json
  def update
    respond_to do |format|
      if @produit.update(produit_params)
        format.html { redirect_to @produit, notice: 'Produit was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: 'edit' }
        format.json { render json: @produit.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /produits/1
  # DELETE /produits/1.json
  def destroy
    @produit.destroy
    respond_to do |format|
      format.html { redirect_to produits_url }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_produit
      @produit = Produit.find(params[:id])
    end

    def correct_user
      @produit = current_user.produits.find_by(id: params[:id])
      redirect_to produits_path, notice: " Vous n'etes pas autorisé à modifier ce produit" if @produit.nil?

    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def produit_params
      params.require(:produit).permit(:nom, :description, :image)
    end
end
