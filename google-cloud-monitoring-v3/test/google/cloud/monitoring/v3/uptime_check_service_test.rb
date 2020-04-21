# frozen_string_literal: true

# Copyright 2020 Google LLC
#
# Licensed under the Apache License, Version 2.0 (the "License");
# you may not use this file except in compliance with the License.
# You may obtain a copy of the License at
#
#     https://www.apache.org/licenses/LICENSE-2.0
#
# Unless required by applicable law or agreed to in writing, software
# distributed under the License is distributed on an "AS IS" BASIS,
# WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
# See the License for the specific language governing permissions and
# limitations under the License.

require "simplecov"
require "minitest/autorun"

require "gapic/grpc/service_stub"

require "google/monitoring/v3/uptime_service_pb"
require "google/monitoring/v3/uptime_service_services_pb"
require "google/cloud/monitoring/v3/uptime_check_service"

class Google::Cloud::Monitoring::V3::UptimeCheckService::ClientTest < Minitest::Test
  class ClientStub
    attr_accessor :call_rpc_count, :requests

    def initialize response, operation, &block
      @response = response
      @operation = operation
      @block = block
      @call_rpc_count = 0
      @requests = []
    end

    def call_rpc *args
      @call_rpc_count += 1

      @requests << @block&.call(*args)

      yield @response, @operation if block_given?

      @response
    end
  end

  def test_list_uptime_check_configs
    # Create GRPC objects.
    grpc_response = Google::Cloud::Monitoring::V3::ListUptimeCheckConfigsResponse.new
    grpc_operation = GRPC::ActiveCall::Operation.new nil
    grpc_channel = GRPC::Core::Channel.new "localhost:8888", nil, :this_channel_is_insecure
    grpc_options = {}

    # Create request parameters for a unary method.
    parent = "hello world"
    page_size = 42
    page_token = "hello world"

    list_uptime_check_configs_client_stub = ClientStub.new grpc_response, grpc_operation do |name, request, options:|
      assert_equal :list_uptime_check_configs, name
      assert_kind_of Google::Cloud::Monitoring::V3::ListUptimeCheckConfigsRequest, request
      assert_equal "hello world", request.parent
      assert_equal 42, request.page_size
      assert_equal "hello world", request.page_token
      refute_nil options
    end

    Gapic::ServiceStub.stub :new, list_uptime_check_configs_client_stub do
      # Create client
      client = Google::Cloud::Monitoring::V3::UptimeCheckService::Client.new do |config|
        config.credentials = grpc_channel
      end

      # Use hash object
      client.list_uptime_check_configs({ parent: parent, page_size: page_size, page_token: page_token }) do |response, operation|
        assert_kind_of Gapic::PagedEnumerable, response
        assert_equal grpc_response, response.response
        assert_equal grpc_operation, operation
      end

      # Use named arguments
      client.list_uptime_check_configs parent: parent, page_size: page_size, page_token: page_token do |response, operation|
        assert_kind_of Gapic::PagedEnumerable, response
        assert_equal grpc_response, response.response
        assert_equal grpc_operation, operation
      end

      # Use protobuf object
      client.list_uptime_check_configs Google::Cloud::Monitoring::V3::ListUptimeCheckConfigsRequest.new(parent: parent, page_size: page_size, page_token: page_token) do |response, operation|
        assert_kind_of Gapic::PagedEnumerable, response
        assert_equal grpc_response, response.response
        assert_equal grpc_operation, operation
      end

      # Use hash object with options
      client.list_uptime_check_configs({ parent: parent, page_size: page_size, page_token: page_token }, grpc_options) do |response, operation|
        assert_kind_of Gapic::PagedEnumerable, response
        assert_equal grpc_response, response.response
        assert_equal grpc_operation, operation
      end

      # Use protobuf object with options
      client.list_uptime_check_configs Google::Cloud::Monitoring::V3::ListUptimeCheckConfigsRequest.new(parent: parent, page_size: page_size, page_token: page_token), grpc_options do |response, operation|
        assert_kind_of Gapic::PagedEnumerable, response
        assert_equal grpc_response, response.response
        assert_equal grpc_operation, operation
      end

      # Verify method calls
      assert_equal 5, list_uptime_check_configs_client_stub.call_rpc_count
    end
  end

  def test_get_uptime_check_config
    # Create GRPC objects.
    grpc_response = Google::Cloud::Monitoring::V3::UptimeCheckConfig.new
    grpc_operation = GRPC::ActiveCall::Operation.new nil
    grpc_channel = GRPC::Core::Channel.new "localhost:8888", nil, :this_channel_is_insecure
    grpc_options = {}

    # Create request parameters for a unary method.
    name = "hello world"

    get_uptime_check_config_client_stub = ClientStub.new grpc_response, grpc_operation do |name, request, options:|
      assert_equal :get_uptime_check_config, name
      assert_kind_of Google::Cloud::Monitoring::V3::GetUptimeCheckConfigRequest, request
      assert_equal "hello world", request.name
      refute_nil options
    end

    Gapic::ServiceStub.stub :new, get_uptime_check_config_client_stub do
      # Create client
      client = Google::Cloud::Monitoring::V3::UptimeCheckService::Client.new do |config|
        config.credentials = grpc_channel
      end

      # Use hash object
      client.get_uptime_check_config({ name: name }) do |response, operation|
        assert_equal grpc_response, response
        assert_equal grpc_operation, operation
      end

      # Use named arguments
      client.get_uptime_check_config name: name do |response, operation|
        assert_equal grpc_response, response
        assert_equal grpc_operation, operation
      end

      # Use protobuf object
      client.get_uptime_check_config Google::Cloud::Monitoring::V3::GetUptimeCheckConfigRequest.new(name: name) do |response, operation|
        assert_equal grpc_response, response
        assert_equal grpc_operation, operation
      end

      # Use hash object with options
      client.get_uptime_check_config({ name: name }, grpc_options) do |response, operation|
        assert_equal grpc_response, response
        assert_equal grpc_operation, operation
      end

      # Use protobuf object with options
      client.get_uptime_check_config Google::Cloud::Monitoring::V3::GetUptimeCheckConfigRequest.new(name: name), grpc_options do |response, operation|
        assert_equal grpc_response, response
        assert_equal grpc_operation, operation
      end

      # Verify method calls
      assert_equal 5, get_uptime_check_config_client_stub.call_rpc_count
    end
  end

  def test_create_uptime_check_config
    # Create GRPC objects.
    grpc_response = Google::Cloud::Monitoring::V3::UptimeCheckConfig.new
    grpc_operation = GRPC::ActiveCall::Operation.new nil
    grpc_channel = GRPC::Core::Channel.new "localhost:8888", nil, :this_channel_is_insecure
    grpc_options = {}

    # Create request parameters for a unary method.
    parent = "hello world"
    uptime_check_config = {}

    create_uptime_check_config_client_stub = ClientStub.new grpc_response, grpc_operation do |name, request, options:|
      assert_equal :create_uptime_check_config, name
      assert_kind_of Google::Cloud::Monitoring::V3::CreateUptimeCheckConfigRequest, request
      assert_equal "hello world", request.parent
      assert_equal Gapic::Protobuf.coerce({}, to: Google::Cloud::Monitoring::V3::UptimeCheckConfig), request.uptime_check_config
      refute_nil options
    end

    Gapic::ServiceStub.stub :new, create_uptime_check_config_client_stub do
      # Create client
      client = Google::Cloud::Monitoring::V3::UptimeCheckService::Client.new do |config|
        config.credentials = grpc_channel
      end

      # Use hash object
      client.create_uptime_check_config({ parent: parent, uptime_check_config: uptime_check_config }) do |response, operation|
        assert_equal grpc_response, response
        assert_equal grpc_operation, operation
      end

      # Use named arguments
      client.create_uptime_check_config parent: parent, uptime_check_config: uptime_check_config do |response, operation|
        assert_equal grpc_response, response
        assert_equal grpc_operation, operation
      end

      # Use protobuf object
      client.create_uptime_check_config Google::Cloud::Monitoring::V3::CreateUptimeCheckConfigRequest.new(parent: parent, uptime_check_config: uptime_check_config) do |response, operation|
        assert_equal grpc_response, response
        assert_equal grpc_operation, operation
      end

      # Use hash object with options
      client.create_uptime_check_config({ parent: parent, uptime_check_config: uptime_check_config }, grpc_options) do |response, operation|
        assert_equal grpc_response, response
        assert_equal grpc_operation, operation
      end

      # Use protobuf object with options
      client.create_uptime_check_config Google::Cloud::Monitoring::V3::CreateUptimeCheckConfigRequest.new(parent: parent, uptime_check_config: uptime_check_config), grpc_options do |response, operation|
        assert_equal grpc_response, response
        assert_equal grpc_operation, operation
      end

      # Verify method calls
      assert_equal 5, create_uptime_check_config_client_stub.call_rpc_count
    end
  end

  def test_update_uptime_check_config
    # Create GRPC objects.
    grpc_response = Google::Cloud::Monitoring::V3::UptimeCheckConfig.new
    grpc_operation = GRPC::ActiveCall::Operation.new nil
    grpc_channel = GRPC::Core::Channel.new "localhost:8888", nil, :this_channel_is_insecure
    grpc_options = {}

    # Create request parameters for a unary method.
    update_mask = {}
    uptime_check_config = {}

    update_uptime_check_config_client_stub = ClientStub.new grpc_response, grpc_operation do |name, request, options:|
      assert_equal :update_uptime_check_config, name
      assert_kind_of Google::Cloud::Monitoring::V3::UpdateUptimeCheckConfigRequest, request
      assert_equal Gapic::Protobuf.coerce({}, to: Google::Protobuf::FieldMask), request.update_mask
      assert_equal Gapic::Protobuf.coerce({}, to: Google::Cloud::Monitoring::V3::UptimeCheckConfig), request.uptime_check_config
      refute_nil options
    end

    Gapic::ServiceStub.stub :new, update_uptime_check_config_client_stub do
      # Create client
      client = Google::Cloud::Monitoring::V3::UptimeCheckService::Client.new do |config|
        config.credentials = grpc_channel
      end

      # Use hash object
      client.update_uptime_check_config({ update_mask: update_mask, uptime_check_config: uptime_check_config }) do |response, operation|
        assert_equal grpc_response, response
        assert_equal grpc_operation, operation
      end

      # Use named arguments
      client.update_uptime_check_config update_mask: update_mask, uptime_check_config: uptime_check_config do |response, operation|
        assert_equal grpc_response, response
        assert_equal grpc_operation, operation
      end

      # Use protobuf object
      client.update_uptime_check_config Google::Cloud::Monitoring::V3::UpdateUptimeCheckConfigRequest.new(update_mask: update_mask, uptime_check_config: uptime_check_config) do |response, operation|
        assert_equal grpc_response, response
        assert_equal grpc_operation, operation
      end

      # Use hash object with options
      client.update_uptime_check_config({ update_mask: update_mask, uptime_check_config: uptime_check_config }, grpc_options) do |response, operation|
        assert_equal grpc_response, response
        assert_equal grpc_operation, operation
      end

      # Use protobuf object with options
      client.update_uptime_check_config Google::Cloud::Monitoring::V3::UpdateUptimeCheckConfigRequest.new(update_mask: update_mask, uptime_check_config: uptime_check_config), grpc_options do |response, operation|
        assert_equal grpc_response, response
        assert_equal grpc_operation, operation
      end

      # Verify method calls
      assert_equal 5, update_uptime_check_config_client_stub.call_rpc_count
    end
  end

  def test_delete_uptime_check_config
    # Create GRPC objects.
    grpc_response = Google::Protobuf::Empty.new
    grpc_operation = GRPC::ActiveCall::Operation.new nil
    grpc_channel = GRPC::Core::Channel.new "localhost:8888", nil, :this_channel_is_insecure
    grpc_options = {}

    # Create request parameters for a unary method.
    name = "hello world"

    delete_uptime_check_config_client_stub = ClientStub.new grpc_response, grpc_operation do |name, request, options:|
      assert_equal :delete_uptime_check_config, name
      assert_kind_of Google::Cloud::Monitoring::V3::DeleteUptimeCheckConfigRequest, request
      assert_equal "hello world", request.name
      refute_nil options
    end

    Gapic::ServiceStub.stub :new, delete_uptime_check_config_client_stub do
      # Create client
      client = Google::Cloud::Monitoring::V3::UptimeCheckService::Client.new do |config|
        config.credentials = grpc_channel
      end

      # Use hash object
      client.delete_uptime_check_config({ name: name }) do |response, operation|
        assert_equal grpc_response, response
        assert_equal grpc_operation, operation
      end

      # Use named arguments
      client.delete_uptime_check_config name: name do |response, operation|
        assert_equal grpc_response, response
        assert_equal grpc_operation, operation
      end

      # Use protobuf object
      client.delete_uptime_check_config Google::Cloud::Monitoring::V3::DeleteUptimeCheckConfigRequest.new(name: name) do |response, operation|
        assert_equal grpc_response, response
        assert_equal grpc_operation, operation
      end

      # Use hash object with options
      client.delete_uptime_check_config({ name: name }, grpc_options) do |response, operation|
        assert_equal grpc_response, response
        assert_equal grpc_operation, operation
      end

      # Use protobuf object with options
      client.delete_uptime_check_config Google::Cloud::Monitoring::V3::DeleteUptimeCheckConfigRequest.new(name: name), grpc_options do |response, operation|
        assert_equal grpc_response, response
        assert_equal grpc_operation, operation
      end

      # Verify method calls
      assert_equal 5, delete_uptime_check_config_client_stub.call_rpc_count
    end
  end

  def test_list_uptime_check_ips
    # Create GRPC objects.
    grpc_response = Google::Cloud::Monitoring::V3::ListUptimeCheckIpsResponse.new
    grpc_operation = GRPC::ActiveCall::Operation.new nil
    grpc_channel = GRPC::Core::Channel.new "localhost:8888", nil, :this_channel_is_insecure
    grpc_options = {}

    # Create request parameters for a unary method.
    page_size = 42
    page_token = "hello world"

    list_uptime_check_ips_client_stub = ClientStub.new grpc_response, grpc_operation do |name, request, options:|
      assert_equal :list_uptime_check_ips, name
      assert_kind_of Google::Cloud::Monitoring::V3::ListUptimeCheckIpsRequest, request
      assert_equal 42, request.page_size
      assert_equal "hello world", request.page_token
      refute_nil options
    end

    Gapic::ServiceStub.stub :new, list_uptime_check_ips_client_stub do
      # Create client
      client = Google::Cloud::Monitoring::V3::UptimeCheckService::Client.new do |config|
        config.credentials = grpc_channel
      end

      # Use hash object
      client.list_uptime_check_ips({ page_size: page_size, page_token: page_token }) do |response, operation|
        assert_kind_of Gapic::PagedEnumerable, response
        assert_equal grpc_response, response.response
        assert_equal grpc_operation, operation
      end

      # Use named arguments
      client.list_uptime_check_ips page_size: page_size, page_token: page_token do |response, operation|
        assert_kind_of Gapic::PagedEnumerable, response
        assert_equal grpc_response, response.response
        assert_equal grpc_operation, operation
      end

      # Use protobuf object
      client.list_uptime_check_ips Google::Cloud::Monitoring::V3::ListUptimeCheckIpsRequest.new(page_size: page_size, page_token: page_token) do |response, operation|
        assert_kind_of Gapic::PagedEnumerable, response
        assert_equal grpc_response, response.response
        assert_equal grpc_operation, operation
      end

      # Use hash object with options
      client.list_uptime_check_ips({ page_size: page_size, page_token: page_token }, grpc_options) do |response, operation|
        assert_kind_of Gapic::PagedEnumerable, response
        assert_equal grpc_response, response.response
        assert_equal grpc_operation, operation
      end

      # Use protobuf object with options
      client.list_uptime_check_ips Google::Cloud::Monitoring::V3::ListUptimeCheckIpsRequest.new(page_size: page_size, page_token: page_token), grpc_options do |response, operation|
        assert_kind_of Gapic::PagedEnumerable, response
        assert_equal grpc_response, response.response
        assert_equal grpc_operation, operation
      end

      # Verify method calls
      assert_equal 5, list_uptime_check_ips_client_stub.call_rpc_count
    end
  end

  def test_configure
    grpc_channel = GRPC::Core::Channel.new "localhost:8888", nil, :this_channel_is_insecure

    client = block_config = config = nil
    Gapic::ServiceStub.stub :new, nil do
      client = Google::Cloud::Monitoring::V3::UptimeCheckService::Client.new do |config|
        config.credentials = grpc_channel
      end
    end

    config = client.configure do |c|
      block_config = c
    end

    assert_same block_config, config
    assert_kind_of Google::Cloud::Monitoring::V3::UptimeCheckService::Client::Configuration, config
  end
end
