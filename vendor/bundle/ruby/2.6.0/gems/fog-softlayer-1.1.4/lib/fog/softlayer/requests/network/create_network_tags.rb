#
# Author:: Matt Eldridge (<matt.eldridge@us.ibm.com>)
# © Copyright IBM Corporation 2014.
#
# LICENSE: MIT (http://opensource.org/licenses/MIT)
#

module Fog
  module Network
    class Softlayer

      class Mock
        def create_network_tags(id, tags = [])
          raise ArgumentError, "Tags argument for #{self.class.name}##{__method__} must be Array." unless tags.is_a?(Array)
          response = Excon::Response.new
          response.status = self.get_network(id).status

          if response.status == 200
            tags.each do |tag|
              @tags << {
                  'empRecordId' => nil,
                  'id' => Fog::Mock.random_numbers(7),
                  'resourceTableId' => id,
                  'tagId' => tagId = Fog::Mock.random_numbers(5),
                  'tagTypeId' => 1,
                  'usrRecordId' => 123456,
                  'tag' => { 'accountId' => 987654, 'id' => tagId, 'internal' => 0, 'name' => tag },
                  'tagType'=>{'description'=>'Vlan', 'keyName'=>'NETWORK_VLAN'}
              }
            end
            response.body = true
          else
            response.body = {
                "error"=>"Unable to find object with id of '#{id}'.",
                "code"=>"SoftLayer_Exception_ObjectNotFound"
            }
          end
          response
        end
      end

      class Real
        def create_network_tags(id, tags = [])
          raise ArgumentError, "Tags argument for #{self.class.name}##{__method__} must be Array." unless tags.is_a?(Array)
          self.request(:network_vlan, "#{id}/set_tags", :body => tags.join(','), :http_method => :post)
        end
      end
    end
  end
end
