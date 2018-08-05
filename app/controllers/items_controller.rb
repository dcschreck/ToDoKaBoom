class ItemsController < ApplicationController
    def show
        @item = Item.find(params[:id])
    end

    def new
        @item = Item.new
    end

    def create
        @item = Item.new(item_params)
        @item.user = current_user

        if @item.save
          flash[:notice] = "To-Do has been saved."
          redirect_to root_path
        else
          flash.now[:alert] = "There was an issue saving your To-Do."
          render :new
        end
    end

    def destroy
        @item = Item.find(params[:id])

        if @item.destroy
            flash[:notice] = "\"#{@item.name}\" was deleted sucessfully."
            redirect_to root_path
        else
            flash.now[:alert] = "There was an error deleting the Wiki."
            render root_path
        end
    end

    private
    def item_params
        params.require(:item).permit(:name)
    end
end
