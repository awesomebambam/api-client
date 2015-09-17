class AuthClient
  attr_accessor :base_uri

  def initialize
  end

  class << self
    def get(path)
      path = absolute_path(path)
      RestClient.get(path)
    end

    def post(path,data)
      path = absolute_path(path)
      RestClient.post path, data, content_type: :json
    end

    def absolute_path(relative_path)
      "http://localhost:4000#{relative_path}"
    end
  end
end