class UserInfoController < ApplicationController
    before_action :authenticate_user!

    PERMITTED_ATTRIBUTES = %i(
      uuid
      name
      email
      password
    )

    def read
      render json: current_user
    end

    def write
      current_user.update( user_params )

      render json: current_user
    end

    private; def user_params
      params.require( :user ).permit( PERMITTED_ATTRIBUTES )
    end
end
