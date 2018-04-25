module RailsBaseHeaders

  def other_logged_in_headers
    {client: 'client_id_test', :'access-token' => 'token_test', uid: users(:logged).email}
  end

  def logged_in_headers_admin
    {client: 'client_id_test', :'access-token' => 'token_test', uid: users(:admin_logged).email}
  end

  def client_in_headers
    {client: 'client_id_test', :'access-token' => 'token_test', uid: users(:client).email}
  end

  def url_auth
    # "?authkey=#{integrations(:one).auth_key}"
  end
end
