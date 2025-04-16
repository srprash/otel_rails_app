require 'opentelemetry/sdk'
require 'opentelemetry/instrumentation/all'
require 'opentelemetry/exporter/otlp'
# require 'opentelemetry/instrumentation/rails'
# require 'opentelemetry/instrumentation/faraday'
# require 'opentelemetry/instrumentation/aws_sdk'
# require 'opentelemetry/instrumentation/active_record'

OpenTelemetry.logger = Logger.new($stdout, level: Logger::DEBUG)

OpenTelemetry::SDK.configure do |c|
#  c.service_name = 'otel_rails_app'
    c.use_all() # enables all instrumentation!
    otel_provider = Aws::Telemetry::OTelProvider.new 
    Aws.config[:telemetry_provider] = otel_provider
end
