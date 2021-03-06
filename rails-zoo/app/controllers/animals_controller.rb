class AnimalsController < ApplicationController
    def index
        @animals = Animal.all
    end

    def new
        @animal = Animal.new
    end

    def create
        new
        if @animal.update(animal_params)
            redirect_to animals_path
        else
            render 'new'
        end
    end

    def edit
        @animal = Animal.find(params[:id])
    end

    def update
        animal = Animal.find(params[:id])
        if animal.update(animal_params)
            redirect_to animal_path(animal)
        else
            render 'edit'
        end
    end

    def show
        @animal = Animal.find(params[:id])
    end

    def destroy
        animal = Animal.find(params[:id])
        animal.destroy
        redirect_to animals_path
    end

    private

    def animal_params
        params.require(:animal).permit(:name, :species, :age)
    end
end
