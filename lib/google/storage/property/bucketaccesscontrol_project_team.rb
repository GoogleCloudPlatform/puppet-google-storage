# Copyright 2018 Google Inc.
# Licensed under the Apache License, Version 2.0 (the "License");
# you may not use this file except in compliance with the License.
# You may obtain a copy of the License at
#
#     http://www.apache.org/licenses/LICENSE-2.0
#
# Unless required by applicable law or agreed to in writing, software
# distributed under the License is distributed on an "AS IS" BASIS,
# WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
# See the License for the specific language governing permissions and
# limitations under the License.

# ----------------------------------------------------------------------------
#
#     ***     AUTO GENERATED CODE    ***    AUTO GENERATED CODE     ***
#
# ----------------------------------------------------------------------------
#
#     This file is automatically generated by Magic Modules and manual
#     changes will be clobbered when the file is regenerated.
#
#     Please read more about how to change this file in README.md and
#     CONTRIBUTING.md located at the root of this package.
#
# ----------------------------------------------------------------------------

require 'google/storage/property/base'

module Google
  module Storage
    module Data
      # A class to manage data for ProjectTeam for bucket_access_control.
      class BuckAcceContProjTeam
        include Comparable

        attr_reader :project_number
        attr_reader :team

        def to_json(_arg = nil)
          {
            'projectNumber' => project_number,
            'team' => team
          }.reject { |_k, v| v.nil? }.to_json
        end

        def to_s
          {
            project_number: project_number,
            team: team
          }.reject { |_k, v| v.nil? }.map { |k, v| "#{k}: #{v}" }.join(', ')
        end

        def ==(other)
          return false unless other.is_a? BuckAcceContProjTeam
          compare_fields(other).each do |compare|
            next if compare[:self].nil? || compare[:other].nil?
            return false if compare[:self] != compare[:other]
          end
          true
        end

        def <=>(other)
          return false unless other.is_a? BuckAcceContProjTeam
          compare_fields(other).each do |compare|
            next if compare[:self].nil? || compare[:other].nil?
            result = compare[:self] <=> compare[:other]
            return result unless result.zero?
          end
          0
        end

        private

        def compare_fields(other)
          [
            { self: project_number, other: other.project_number },
            { self: team, other: other.team }
          ]
        end
      end

      # Manages a BuckAcceContProjTeam nested object
      # Data is coming from the GCP API
      class BuckAcceContProjTeamApi < BuckAcceContProjTeam
        def initialize(args)
          @project_number = Google::Storage::Property::String.api_munge(args['projectNumber'])
          @team = Google::Storage::Property::Enum.api_munge(args['team'])
        end
      end

      # Manages a BuckAcceContProjTeam nested object
      # Data is coming from the Puppet manifest
      class BuckAcceContProjTeamCatalog < BuckAcceContProjTeam
        def initialize(args)
          @project_number = Google::Storage::Property::String.unsafe_munge(args['project_number'])
          @team = Google::Storage::Property::Enum.unsafe_munge(args['team'])
        end
      end
    end

    module Property
      # A class to manage input to ProjectTeam for bucket_access_control.
      class BuckAcceContProjTeam < Google::Storage::Property::Base
        # Used for parsing Puppet catalog
        def unsafe_munge(value)
          self.class.unsafe_munge(value)
        end

        # Used for parsing Puppet catalog
        def self.unsafe_munge(value)
          return if value.nil?
          Data::BuckAcceContProjTeamCatalog.new(value)
        end

        # Used for parsing GCP API responses
        def self.api_munge(value)
          return if value.nil?
          Data::BuckAcceContProjTeamApi.new(value)
        end
      end
    end
  end
end
