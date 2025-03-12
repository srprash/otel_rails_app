require 'opentelemetry/sdk'
require 'opentelemetry/instrumentation/all'
# require 'opentelemetry/exporter/otlp'
# require 'opentelemetry/instrumentation/rails'
# require 'opentelemetry/instrumentation/faraday'
# require 'opentelemetry/instrumentation/aws_sdk'
# require 'opentelemetry/instrumentation/active_record'

OpenTelemetry::SDK.configure do |c|
  c.service_name = 'otel_rails_app'
  c.use_all() # enables all instrumentation!
#   c.use 'OpenTelemetry::Instrumentation::Rails'
#   c.use 'OpenTelemetry::Instrumentation::Faraday'
#   c.use 'OpenTelemetry::Instrumentation::AwsSdk'
#   c.use 'OpenTelemetry::Instrumentation::ActiveRecord'
#   c.add_span_processor(
#     OpenTelemetry::SDK::Trace::Export::BatchSpanProcessor.new(
#       OpenTelemetry::Exporter::OTLP::Exporter.new(endpoint: 'http://localhost:4318')
#     )
#   )
end
