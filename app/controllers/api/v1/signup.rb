module API
    module V1
      class Signup < Grape::API
        include API::V1::Defaults
       

        resource :user do

            desc "Creates and returns access_token if valid login"
            params do
                requires :profile_type, type: String, desc: "Username or email address"
                requires :last_name, type: String, desc: "Username or email address"
                requires :first_name, type: String, desc: "Username or email address"
                requires :civility, type: String, desc: "Username or email address"
                requires :country_id, type: Integer, desc: "Username or email address"
                requires :locality_id, type: Integer, desc: "Username or email address"
                requires :email, type: String, desc: "Username or email address"
                requires :password, type: String, desc: "Password"
                requires :password_confirmation, type: String, desc: "Username or email address"

            end

            post :signup do
=begin
              if params[:login].include?("@")
                user = User.find_by_email(params[:login].downcase)
              else
                user = User.find_by_login(params[:login].downcase)
              end
          
              if user && user.authenticate(params[:password])
                key = ApiKey.create(user_id: user.id)
                {token: key.access_token}
              else
                error!('Unauthorized.', 401)
              end
=end
                profile_type = params[:profile_type].strip if params[:profile_type].present?
                last_name = params[:last_name].strip if params[:last_name].present?
                first_name = params[:first_name].strip if params[:first_name].present?
                civility = params[:civility].strip if params[:civility].present?
                country_id = params[:country_id] if params[:country_id].present?
                locality_id = params[:locality_id] if params[:locality_id].present?

                email = params[:email].strip if params[:email].present?
                password = params[:password]
                password_confirmation = params[:password_confirmation]


                if email.nil? or password.nil? or password_confirmation.nil?
                    error!({error_code: 404, error_message: "Invalid Email or Password."},401)
                    return
                end

                if password != password_confirmation
                    error!({error_code: 404, error_message: "Invalid Password."},401)
                    return
                end

                user = User.where(email: email.downcase).first
                if user.present?
                    error!({error_code: 404, error_message: "Invalid Email."},401)
                    return
                end

                user = User.new
                user.role_id = Role.find_by(name: "Patient").id 
                user.email = email
                user.password = password
                user.password_confirmation = password_confirmation

                if user.save
                    profile = Profile.new
                    profile.profile_type = profile_type
                    profile.last_name= last_name
                    profile.first_name = first_name
                    profile.civility= civility
                    profile.country_id = country_id
                    profile.locality_id = locality_id
                    profile.user_id = user.id
                    profile.save!
                    

                    
                    puts "USER_ID: #{user.id}"
                    api_key = ApiKey.where("user_id = ? AND active =?",  user.id, true).first
                    
                    if api_key.present?
                      {status: 'ok', token: api_key.access_token}#.to_json
                    else
                      key = ApiKey.create(user_id: user.id)
                      {status: 'ok', token: key.access_token}#.to_json
                    end
                else
                    {status: 'error'}#.to_json

                end

                
            end
          
            desc "Returns pong if logged in correctly"
            params do
              requires :token, type: String, desc: "Access token."
            end
            get :ping do
              authenticate!
              { message: "pong" }
            end
          end

      end
    end
end