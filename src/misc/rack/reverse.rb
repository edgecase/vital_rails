class Reverse
  def initialize(app)
    @app = app
  end
  def call(env)
    status, headers, body = @app.call(env)
    body = [body] unless body.respond_to?(:to_ary)
    [status, headers, body.first.reverse]
  end
end
