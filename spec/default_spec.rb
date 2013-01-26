require 'chefspec'

describe 'helpers::default' do
  let (:chef_run) { ChefSpec::ChefRunner.new.converge 'helpers::default' }
  
  it 'should test library method decrypt_data_bag' do
    pending 'TODO: figure out how to test libraries'
  end # it 'should test library method decrypt_data_bag'
  
end # describe 'helpers::default'
