class AllHeader
  include Rack::Utils

  def initialize(app)
    @app = app
  end

  def call(env)
    status, headers, body = @app.call(env)
    body = [body] unless body.respond_to?(:to_ary)
    new_body = (["<html><head></head><body><h1>"] + body + ["</h1></body></html>"]).join
    [status, headers, [new_body]]
  end
end
