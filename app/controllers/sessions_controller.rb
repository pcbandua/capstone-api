class SessionsController < ApplicationController
  def create
    user = Employer.find_by(email: params[:email]) || Apprentice.find_by(email: params[:email])
    if user && user.authenticate(params[:password])
      jwt = JWT.encode(
        {
          user_id: user.id, # the data to encode
          exp: 24.hours.from_now.to_i, # the expiration time
        },
        Rails.application.credentials.fetch(:secret_key_base), # the secret key
        "HS256" # the encryption algorithm
      )
      render json: { jwt: jwt, email: user.email, user_id: user.id }, status: :created
    else
      render json: {}, status: :unauthorized
    end
  end
end

# class SessionsController < ApplicationController

#   # def create
#   #   employer = Employer.find_by(email: params[:email])
#   #   if employer && employer.authenticate(params[:password])
#   #     jwt = JWT.encode(
#   #       {
#   #         employer_id: employer.id, # the data to encode
#   #         exp: 24.hours.from_now.to_i, # the expiration time
#   #       },
#   #       Rails.application.credentials.fetch(:secret_key_base), # the secret key
#   #       "HS256" # the encryption algorithm
#   #     )
#   #     render json: { jwt: jwt, email: employer.email, employer_id: employer.id }, status: :created
#   #   else
#   #     render json: {}, status: :unauthorized
#   #   end
#   # end

#   # def create
#   #   apprentice = Apprentice.find_by(email: params[:email])
#   #   if apprentice && apprentice.authenticate(params[:password])
#   #     jwt = JWT.encode(
#   #       {
#   #         user_id: apprentice.id, # the data to encode
#   #         exp: 24.hours.from_now.to_i, # the expiration time
#   #       },
#   #       Rails.application.credentials.fetch(:secret_key_base), # the secret key
#   #       "HS256" # the encryption algorithm
#   #     )
#   #     render json: { jwt: jwt, email: apprentice.email, user_id: apprentice.id }, status: :created
#   #   else
#   #     render json: {}, status: :unauthorized
#   #   end
#   # end
# end
