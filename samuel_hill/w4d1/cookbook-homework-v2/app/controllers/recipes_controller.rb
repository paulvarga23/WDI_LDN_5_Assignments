class RecipesController < ApplicationController

	def index
		@recipes = Recipe.all
	end

	def new
		@recipe = Recipe.new
	end

	def create
		@recipe = Recipe.create(params[:recipe])

		respond_to do |format|
      		if @recipe.save
		        format.html { redirect_to recipes_path, notice: 'Recipe was successfully created.' }
		        format.json { render json: @recipe, status: :created, location: @recipe }
     		 else
			    format.html { render action: "new" }
			    format.json { render json: @recipe.errors, status: :unprocessable_entity }
			 end
    	end
	end

	def edit
		@recipe = Recipe.find(params[:id])
	end

	def show
		@recipe = Recipe.find(params[:id])
	end

	def update
		@recipe = Recipe.find(params[:id])
      	@recipe.update_attributes(params[:recipe])
      	
      	respond_to do |format|
      		if @recipe.update_attributes(params[:recipe])
		        format.html { redirect_to recipes_path, notice: 'Recipe was successfully updated.' }
		        format.json { head :no_content }
      		else
		        format.html { render action: "edit" }
		        format.json { render json: @recipe.errors, status: :unprocessable_entity }
      		end
    	end
    end

    def destroy
    	@recipe = Recipe.find(params[:id])
	    @recipe.destroy
	    redirect_to recipes_path
	end

end
