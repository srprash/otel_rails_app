class ApiController < ApplicationController
    require 'faraday'
    require 'aws-sdk-s3'
  
    def http_call
      response = Faraday.get('https://jsonplaceholder.typicode.com/todos/1')
      render json: response.body
    end
  
    # def db_call
    #   time = ActiveRecord::Base.connection.execute('SELECT NOW()').first
    #   render json: { time: time }
    # end
  
    def s3_call
      s3 = Aws::S3::Client.new(region: 'us-east-1')
      buckets = s3.list_buckets.buckets.map(&:name)
      render json: { buckets: buckets }
    end
  end
  