if Rails.env.development?
  GraphiQL::Rails.config.headers['Authorization'] = lambda { |_ctx|
    'Base eyJhbGciOiJIUzI1NiJ9.eyJtZW1iZXJfaWQiOjEsImV4cCI6NDY4Nzc1OTk3Nn0.wGKjUAaVO331VRJYgF7wOHMwf3ilbQs14GsY2_OFoMY'
  }
end
