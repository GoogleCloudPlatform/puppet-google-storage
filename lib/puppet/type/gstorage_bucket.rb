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

require 'google/object_store'
require 'google/storage/property/boolean'
require 'google/storage/property/bucket_acl'
require 'google/storage/property/bucket_action'
require 'google/storage/property/bucket_condition'
require 'google/storage/property/bucket_cors'
require 'google/storage/property/bucket_lifecycle'
require 'google/storage/property/bucket_logging'
require 'google/storage/property/bucket_name'
require 'google/storage/property/bucket_owner'
require 'google/storage/property/bucket_project_team'
require 'google/storage/property/bucket_rule'
require 'google/storage/property/bucket_versioning'
require 'google/storage/property/bucket_website'
require 'google/storage/property/enum'
require 'google/storage/property/integer'
require 'google/storage/property/string'
require 'google/storage/property/string_array'
require 'google/storage/property/time'
require 'puppet'

Puppet::Type.newtype(:gstorage_bucket) do
  @doc = <<-DOC
    The Buckets resource represents a bucket in Google Cloud Storage. There is
    a single global namespace shared by all buckets. For more information, see
    Bucket Name Requirements. Buckets contain objects which can be accessed by
    their own methods. In addition to the acl property, buckets contain
    bucketAccessControls, for use in fine-grained manipulation of an existing
    bucket's access controls. A bucket is always owned by the project team
    owners group.
  DOC

  autorequire(:gauth_credential) do
    credential = self[:credential]
    raise "#{ref}: required property 'credential' is missing" if credential.nil?
    [credential]
  end

  ensurable

  newparam :credential do
    desc <<-DESC
      A gauth_credential name to be used to authenticate with Google Cloud
      Platform.
    DESC
  end

  newparam(:name, namevar: true) do
    # TODO(nelsona): Make this description to match the key of the object.
    desc 'The name of the Bucket.'
  end

  newparam(:project, parent: Google::Storage::Property::String) do
    desc 'A valid API project identifier.'
  end

  newparam(:predefined_default_object_acl,
           parent: Google::Storage::Property::Enum) do
    desc <<-DOC
      Apply a predefined set of default object access controls to this bucket.
      Acceptable values are:  - "authenticatedRead": Object owner gets OWNER
      access, and   allAuthenticatedUsers get READER access.  -
      "bucketOwnerFullControl": Object owner gets OWNER access, and   project
      team owners get OWNER access.  - "bucketOwnerRead": Object owner gets
      OWNER access, and project   team owners get READER access.  - "private":
      Object owner gets OWNER access.  - "projectPrivate": Object owner gets
      OWNER access, and project team   members get access according to their
      roles.  - "publicRead": Object owner gets OWNER access, and allUsers get
      READER access.
    DOC
    newvalue(:authenticatedRead)
    newvalue(:bucketOwnerFullControl)
    newvalue(:bucketOwnerRead)
    newvalue(:private)
    newvalue(:projectPrivate)
    newvalue(:publicRead)
  end

  newproperty(:acl, parent: Google::Storage::Property::BucketAclArray) do
    desc 'Access controls on the bucket.'
  end

  newproperty(:cors, parent: Google::Storage::Property::BucketCorsArray) do
    desc "The bucket's Cross-Origin Resource Sharing (CORS) configuration."
  end

  newproperty(:id, parent: Google::Storage::Property::String) do
    desc <<-DOC
      The ID of the bucket. For buckets, the id and name properities are the
      same. (output only)
    DOC
  end

  newproperty(:lifecycle, parent: Google::Storage::Property::BucketLifecycle) do
    desc <<-DOC
      The bucket's lifecycle configuration. See
      https://developers.google.com/storage/docs/lifecycle for more
      information.
    DOC
  end

  newproperty(:location, parent: Google::Storage::Property::String) do
    desc <<-DOC
      The location of the bucket. Object data for objects in the bucket resides
      in physical storage within this region. Defaults to US. See the
      developer's guide for the authoritative list.
    DOC
  end

  newproperty(:logging, parent: Google::Storage::Property::BucketLogging) do
    desc <<-DOC
      The bucket's logging configuration, which defines the destination bucket
      and optional name prefix for the current bucket's logs.
    DOC
  end

  newproperty(:metageneration, parent: Google::Storage::Property::Integer) do
    desc 'The metadata generation of this bucket.'
  end

  newproperty(:name, parent: Google::Storage::Property::String) do
    desc 'The name of the bucket'
  end

  newproperty(:owner, parent: Google::Storage::Property::BucketOwner) do
    desc <<-DOC
      The owner of the bucket. This is always the project team's owner group.
    DOC
  end

  newproperty(:project_number, parent: Google::Storage::Property::Integer) do
    desc <<-DOC
      The project number of the project the bucket belongs to. (output only)
    DOC
  end

  newproperty(:storage_class, parent: Google::Storage::Property::Enum) do
    desc <<-DOC
      The bucket's default storage class, used whenever no storageClass is
      specified for a newly-created object. This defines how objects in the
      bucket are stored and determines the SLA and the cost of storage. Values
      include MULTI_REGIONAL, REGIONAL, STANDARD, NEARLINE, COLDLINE, and
      DURABLE_REDUCED_AVAILABILITY. If this value is not specified when the
      bucket is created, it will default to STANDARD. For more information, see
      storage classes.
    DOC
    newvalue(:MULTI_REGIONAL)
    newvalue(:REGIONAL)
    newvalue(:STANDARD)
    newvalue(:NEARLINE)
    newvalue(:COLDLINE)
    newvalue(:DURABLE_REDUCED_AVAILABILITY)
  end

  newproperty(:time_created, parent: Google::Storage::Property::Time) do
    desc 'The creation time of the bucket in RFC 3339 format. (output only)'
  end

  newproperty(:updated, parent: Google::Storage::Property::Time) do
    desc 'The modification time of the bucket in RFC 3339 format. (output only)'
  end

  newproperty(:versioning,
              parent: Google::Storage::Property::BucketVersioning) do
    desc "The bucket's versioning configuration."
  end

  newproperty(:website, parent: Google::Storage::Property::BucketWebsite) do
    desc <<-DOC
      The bucket's website configuration, controlling how the service behaves
      when accessing bucket contents as a web site. See the Static Website
      Examples for more information.
    DOC
  end

  # Returns all properties that a provider can export to other resources
  def exports
    provider.exports
  end
end
