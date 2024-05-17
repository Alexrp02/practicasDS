class CasasController < ApplicationController
    def index 
        @casas = Casa.where(propietario:params[:propietario])
        #@casas = Casa.all
        render json: @casas, include: :dormitorios
    end

    def show
        @casa = Casa.find(params[:id])
        render json: @casa, include: :dormitorios
      end

    def create
        @casa = Casa.create(casa_params)
        if @casa.save
            render json: @casa, include: :dormitorios, status: :created
        else
            render json: @casa.errors, status: :unprocessable_entity
        end
    end

    def update
        @casa = Casa.find(params[:id])
        if @casa.update(casa_params)
            render json: @casa
        else
            render json: @casa.errors, status: :unprocessable_entity
        end
    end

    def destroy
        @casa = Casa.find(params[:id])
        if @casa.destroy
            head :ok
        else
            render json: { error: "Failed to delete" }, status: :unprocessable_entity
        end
    end

    def deleteAll
        Dormitorio.delete_all
        Casa.delete_all
        head :ok
    end

    private
    def casa_params
        params.require(:casa).permit(:tipo_casa, :cocina, :banio, :sala_estar, :propietario, dormitorios_attributes: [:id, :descripcion, :_destroy])
    end
end
