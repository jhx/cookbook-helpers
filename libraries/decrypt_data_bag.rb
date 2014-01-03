#
# Cookbook Name:: helpers
# Library:: decrypt_data_bag
#
# Copyright 2012, James Hardie Building Products, Inc.
#
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
#

class Chef
  class Recipe
    def decrypt_data_bag(bag, item = node.chef_environment,
        secret_file = Chef::Config[:encrypted_data_bag_secret])
      Chef::Log.info self.class
      Chef::DataBag.validate_name!(bag.to_s)
      Chef::DataBagItem.validate_id!(item)
      secret = Chef::EncryptedDataBagItem.load_secret(secret_file)
      Chef::EncryptedDataBagItem.load(bag, item, secret)
    rescue Exception
      Chef::Log.error("Failed to load data bag item: #{bag.inspect} #{item.inspect}")
      raise
    end
  end
end
