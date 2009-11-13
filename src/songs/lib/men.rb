class Men
  def initialize(app)
    @app = app
  end

  def call(env)
    status, headers, body = @app.call(env)
    new_body = []
    body.each do |b| 
      new_body<< b.gsub(/man/, 'boy').gsub(/men/, 'boys').
        gsub(/Man/, 'Boy').gsub(/Men/, 'Boys').
        gsub(/Girl/, 'Gal')
    end
    [status, headers, new_body]
  end
end
