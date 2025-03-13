class ApiController < ApplicationController
    require 'faraday'
    require 'aws-sdk-s3'

    S3_CLIENT = Aws::S3::Client.new(region: 'us-east-1')
  
    def say_hello
      name = params[:name]
      render json: { response: "Hello #{name}"}
    end
    
    def http_call
      id = params[:id]
      response = Faraday.get("https://jsonplaceholder.typicode.com/todos/#{id}")
      render json: response.body
    end
  
    # def db_call
    #   time = ActiveRecord::Base.connection.execute('SELECT NOW()').first
    #   render json: { time: time }
    # end
  
    def s3_listBucket_call
      buckets = S3_CLIENT.list_buckets.buckets.map(&:name)
      render json: { buckets: buckets }
    end

    def describe_s3_bucket
      bucket_name = params[:bucket_name]  # Capture the bucket name from URL
  
      begin
        response = S3_CLIENT.get_bucket_location(bucket: bucket_name)
        render json: { bucket_name: bucket_name, region: response.location_constraint }
      rescue Aws::S3::Errors::NoSuchBucket
        render json: { error: "Bucket '#{bucket_name}' not found" }, status: 404
      rescue Aws::S3::Errors::ServiceError => e
        render json: { error: e.message }, status: 500
      end
    end

    def sns_publish
      sns = Aws::SNS::Client.new(region: 'us-east-1')
      sns.publish message: 'ruby sending message to sns'
    end
  end
  