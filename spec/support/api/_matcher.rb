# frozen_string_literal: true

RSpec::Matchers.define :match_response_schema do |schema|
  match do |repsonse|
    schema_directory = "#{Dir.pwd}/spec/support/api/schemas"
    schema_path = "#{schema_directory}/#{schema}.json"
    JSON::Validator.validate!(schema_path, repsonse.body, strict: true)
  end
end
