def call_that_method(env)
  Server.call(env)
end

class Server
  def self.call(env)
    [200, {}, ["It's all good"]]
  end
end
