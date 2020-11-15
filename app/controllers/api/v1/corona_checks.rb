module API
    module V1
      class CoronaChecks < Grape::API
        include API::V1::Defaults
        resource :corona_checks do
          desc "Return all appointments"
          get "" do
            CoronaCheck.all
          end


          desc "Creates new appointment."
          params do
            requires :phone, type: String, desc: ""
            requires :exposition, type: Boolean, desc: ""
            requires :fever, type: Boolean, desc: ""
            requires :cough, type: Boolean, desc: ""
            requires :difficulty_breathing, type: Boolean, desc: ""
            requires :runny_nose, type: Boolean, desc: ""
            requires :unusual_tiredness, type: Boolean, desc: ""
            requires :sore_throat, type: Boolean, desc: ""
            requires :stiffness, type: Boolean, desc: ""
            requires :diarrhea, type: Boolean, desc: ""
            requires :longetude, type: Float, desc: ""
            requires :latitude, type: Float, desc: ""


         end

         post :new do

            
            corona_check = CoronaCheck.new
            corona_check.phone = params[:phone]
            corona_check.exposition = params[:exposition]
            corona_check.fever = params[:fever]
            corona_check.cough = params[:cough]
            corona_check.difficulty_breathing = params[:difficulty_breathing]
            corona_check.runny_nose = params[:runny_nose]
            corona_check.stiffness = params[:stiffness]
            corona_check.sore_throat = params[:sore_throat]
            corona_check.unusual_tiredness = params[:unusual_tiredness]
            corona_check.diarrhea = params[:diarrhea]
            corona_check.longetude = params[:longetude]
            corona_check.latitude = params[:latitude]

                if corona_check.save! 
                    {status: 'ok', data: corona_check}
                else
                    {status: "no"}
                end

            
         end


          desc "Return a locality"
          params do
            requires :id, type: String, desc: "ID of the user"
          end
          get ":id" do
            CoronaCheck.where(id: permitted_params[:id]).first!
          end
        end
      end
    end
  end