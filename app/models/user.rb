class User
  include ActiveModel::Model
  include RemoteResource

  attr_accessor :email, :first_name, :last_name, :username, :role

  def list
    result, status = get_objects('/users/',self.class)
    result
  end

  def create
    result, status = post_object('/users/', self)
    result
  end

  def as_json options={}
   {email: email, first_name: first_name, last_name: last_name, username: username}
  end

end
