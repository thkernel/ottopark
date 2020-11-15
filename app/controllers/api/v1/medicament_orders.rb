module API
    module V1
      class MedicamentOrders < Grape::API
        include API::V1::Defaults
        resource :medicament_orders do
          desc "Return all appointments"
          get "" do
            MedicamentOrder.all
          end


          desc "Creates new appointment."
          params do
            requires :structure_id, type: Integer, desc: "Username or email address"
            requires :medicament_id, type: Integer, desc: "Password"
            requires :unity, type: String, desc: "Password"
            requires :quantity, type: Integer, desc: "Password"
            requires :patient_id, type: String, desc: "Password"
         end

         post :new do

            patient = ApiKey.find_by(access_token: params[:patient_id])
            
            if patient.present?
                medicament_order = MedicamentOrder.new
                medicament_order.structure_id = params[:structure_id]
                medicament_order.patient_id = patient.user_id
                
                if medicament_order.save!
                
                    medicament_order_item = MedicamentOrderItem.new
                    medicament_order_item.medicament_order_id = medicament_order.id
                    medicament_order_item.medicament_id = params[:medicament_id]
                    medicament_order_item.quantity = params[:quantity]
                    medicament_order_item.unity = params[:unity]


                    if medicament_order_item.save! 
                        {status: 'ok', medicament_order: medicament_order}
                    else
                        {status: "no"}
                    end
                end

            else
                error!({error_code: 422, error_message: "Impossible de traiter la requette."},422)
                return
            end
         end


          desc "Return a locality"
          params do
            requires :id, type: String, desc: "ID of the user"
          end
          get ":id" do
            Advice.where(id: permitted_params[:id]).first!
          end
        end
      end
    end
  end