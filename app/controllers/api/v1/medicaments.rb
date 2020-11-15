module API
    module V1
      class Medicaments < Grape::API
        include API::V1::Defaults
        resource :medicaments do
          desc "Return all medicaments"
          get "" do
            Medicament.all
          end


          desc "Return by name"
          params do
            requires :name, type: String, desc: "ID of the user"
          end
          get "/search/:name" do 
              Medicament.search_by_name(permitted_params[:name]) 

 
          end



        desc "Return a medicaments"
          params do
            requires :id, type: String, desc: "ID of the user"
          end
          get ":id" do
            Medicament.where(id: permitted_params[:id]).first!
          end
        end
      end
    end
  end