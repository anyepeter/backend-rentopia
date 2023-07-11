class AuthenticateController < ApplicationController
    def login 
        @user = User.find_by(login_required)
        if @user
         token = JsonWebToken.encode(user_id: @user.id)
         time = Time.now + 7.days.to_i
         render json: { token:token, exp: time.strftime('%m-%d-%Y %H:%M'),
                        user: UserSerializer.new(@user) }, status: :ok
       else
        render json: { errors: e.message }, status: :unauthorized
       end
      end 
 
      private
 
      def login_required
          params.permit(:email, :password)
      end
end
