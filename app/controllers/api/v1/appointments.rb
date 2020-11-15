module API
    module V1
      class Appointments < Grape::API
        include API::V1::Defaults
        resource :appointments do
          desc "Return all appointments"
          get "" do
            Appointment.all
          end


          desc "Creates new appointment."
          params do
            requires :structure_id, type: Integer, desc: "Username or email address"
            requires :doctor_id, type: Integer, desc: "Password"
            requires :reason, type: String, desc: "Password"
            requires :day, type: DateTime, desc: "Password"

            requires :content, type: String, desc: "Password"
            requires :patient_id, type: String, desc: "Password"
         end

         post :new do

            patient = ApiKey.find_by(access_token: params[:patient_id])
            
            if patient.present?
                appointment = Appointment.new
                appointment.doctor_id = params[:doctor_id]
                appointment.structure_id = params[:structure_id]
                appointment.patient_id = patient.user_id
                appointment.reason = params[:reason]
                appointment.content = params[:content]
                appointment.day = params[:day]
                appointment.start_time = params[:start_time]


                if appointment.save! 
                    {status: 'ok', appointment: appointment}
                else
                    {status: "no"}
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