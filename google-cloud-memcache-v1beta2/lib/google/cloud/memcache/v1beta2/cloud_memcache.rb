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

# Auto-generated by gapic-generator-ruby. DO NOT EDIT!

require "gapic/common"
require "gapic/config"
require "gapic/config/method"

require "google/cloud/memcache/v1beta2/version"

require "google/cloud/memcache/v1beta2/cloud_memcache/credentials"
require "google/cloud/memcache/v1beta2/cloud_memcache/paths"
require "google/cloud/memcache/v1beta2/cloud_memcache/operations"
require "google/cloud/memcache/v1beta2/cloud_memcache/client"

module Google
  module Cloud
    module Memcache
      module V1beta2
        ##
        # Configures and manages Cloud Memorystore for Memcached instances.
        #
        #
        # The `memcache.googleapis.com` service implements the Google Cloud Memorystore
        # for Memcached API and defines the following resource model for managing
        # Memorystore Memcached (also called Memcached below) instances:
        # * The service works with a collection of cloud projects, named: `/projects/*`
        # * Each project has a collection of available locations, named: `/locations/*`
        # * Each location has a collection of Memcached instances, named:
        # `/instances/*`
        # * As such, Memcached instances are resources of the form:
        #   `/projects/{project_id}/locations/{location_id}/instances/{instance_id}`
        #
        # Note that location_id must be refering to a GCP `region`; for example:
        # * `projects/my-memcached-project/locations/us-central1/instances/my-memcached`
        #
        # To load this service and instantiate a client:
        #
        #     require "google/cloud/memcache/v1beta2/cloud_memcache"
        #     client = ::Google::Cloud::Memcache::V1beta2::CloudMemcache::Client.new
        #
        module CloudMemcache
        end
      end
    end
  end
end

helper_path = ::File.join __dir__, "cloud_memcache", "helpers.rb"
require "google/cloud/memcache/v1beta2/cloud_memcache/helpers" if ::File.file? helper_path
