module Msf::Payload::Adapter::Fetch::HTTP

  include Msf::Exploit::EXE
  include Msf::Payload::Adapter
  include Msf::Payload::Adapter::Fetch
  include Msf::Payload::Adapter::Fetch::Server::HTTP

  def initialize(*args)
    super
  end

  def cleanup_handler
    if @fetch_service
      cleanup_http_fetch_service(@fetch_service, @delete_resource)
      @fetch_service = nil
    end

    super
  end

  def setup_handler
    @fetch_service = start_http_fetch_handler(srvname, @srvexe) unless datastore['FetchHandlerDisable']
    super
  end

end
