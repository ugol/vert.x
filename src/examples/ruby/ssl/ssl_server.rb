# Copyright 2011 the original author or authors.
#
# Licensed under the Apache License, Version 2.0 (the "License");
# you may not use this file except in compliance with the License.
# You may obtain a copy of the License at
#
#      http://www.apache.org/licenses/LICENSE-2.0
#
# Unless required by applicable law or agreed to in writing, software
# distributed under the License is distributed on an "AS IS" BASIS,
# WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
# See the License for the specific language governing permissions and
# limitations under the License.

require "vertx"
include Vertx

@server = NetServer.new
@server.ssl = true
@server.key_store_path="server-keystore.jks"
@server.key_store_password="wibble"
@server.connect_handler { |socket| socket.data_handler { |data| socket.write_buffer(data) } }
@server.listen(4443)

def vertx_stop
  @server.close
end



