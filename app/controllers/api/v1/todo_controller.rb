class Api::V1::TodoController < ApplicationController
    def index
        render json: {status: 200, message: "Hello world?"}
    end
end
