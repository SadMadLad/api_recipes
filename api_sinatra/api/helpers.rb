# frozen_string_literal: true

def required_params(params, keys)
  keys.map { |key| params[key] }
end

def user_hash(values)
  user_attributes = %w[id name age dob nationality programming_language]
  Hash[user_attributes.zip(values)]
end
