module RemoteResource
  def get_objects(path,klass)
    data = AuthClient.get(path)
    parsed_data = JSON.parse(data)
    objects = create_objects(parsed_data,klass)
    return objects, nil
  end

  def create_objects(data,klass)
    if data.is_a?(Array)
      data.map{|args| klass.new(args)}
    else
      klass.new(data)
    end
  end

  def post_object(path, object)
    data = { object.class.name.downcase => object.as_json}
    AuthClient.post(path,data)
  end
end
