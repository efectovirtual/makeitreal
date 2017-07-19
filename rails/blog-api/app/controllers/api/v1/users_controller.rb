module Api
  module V1
    class UsersController < ApplicationController
      # body = { user: { username: 'sescob', full_name: 'simon escobar'} }.to_json
      # headers = { 'Content-Type' => 'application/json' }
      # HTTParty.post('http://localhost:3000/api/v1/users', body: body, headers: headers)
      def create
        # params payload = {
        #   user: {
        #     username: '',
        #     full_name: ''
        #   }
        # }
        safe_params = params.require(:user).permit(:username, :full_name)
        user = User.new safe_params
        if user.save
          render json: user
        else
          render json: { errors: user.errors }, status: :unprocessable_entity # 422
        end
      end

      # HTTParty.get('http://localhost:3000/api/v1/users/1')
      def show
        user = User.includes(:articles).find params[:id]
        render json: { user: user, articles: user.articles.map(&:id) }
      end
    end
  end
end
