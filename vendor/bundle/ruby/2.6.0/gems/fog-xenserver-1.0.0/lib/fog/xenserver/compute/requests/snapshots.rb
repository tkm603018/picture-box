module Fog
  module XenServer
    class Compute
      class Real
        def snapshots
          data = @connection.request(:parser => Fog::XenServer::Parsers::GetRecords.new, :method => "VM.get_all_records")
          data.keep_if { |vm| vm[:is_a_snapshot] }
          servers.load(data)
        rescue Fog::XenServer::RequestFailed => e
          []
        end
      end
    end
  end
end