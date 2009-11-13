class Upcase
  def initialize(app)
    @app = app
  end
  def call(env)
    status, headers, body = @app.call(env)
    body = [body] unless body.respond_to?(:to_ary)
    [status, headers, body.map { |b| b.upcase } ]
  end
end
