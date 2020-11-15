module API
    module V1
      class DummyMedicaments < Grape::API
        include API::V1::Defaults
        resource :dummy_medicaments do
          desc "Return all dummy medicaments"
          get "" do
            DummyMedicament.all
          end
        desc "Return a dummy medicament"
          params do
            requires :id, type: String, desc: "ID of the user"
          end
          get ":id" do
            DummyMedicament.where(id: permitted_params[:id]).first!
          end
        end
      end
    end
  end