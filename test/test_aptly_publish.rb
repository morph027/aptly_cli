require 'minitest_helper.rb'
require "minitest/autorun"

require "aptly_cli"

describe AptlyCli::AptlyPublish do
 
  it "must include httparty methods" do
    AptlyCli::AptlyPublish.must_include HTTMultiParty
  end

describe "API List Publish" do

  let(:publish_api) { AptlyCli::AptlyPublish.new }

  before do
    VCR.insert_cassette 'publish_api', :record => :new_episodes
  end

  after do
    VCR.eject_cassette
  end

  it "records the fixture for listing publish points" do
    publish_api.publish_list()
  end

 end

describe "API Publish Repo" do

  let(:publish_api) { AptlyCli::AptlyPublish.new }

  before do
    VCR.insert_cassette 'publish_api', :record => :new_episodes
  end

  after do
    VCR.eject_cassette
  end

  it "records the fixture for publishing a snapshot" do
    publish_api.publish_repo(name = "main2/rocksoftware301", publish_options = { :sourcekind => 'snapshot', :distribution => 'precise2'})
  end

 end

describe "API Drop Repo" do

  let(:publish_api) { AptlyCli::AptlyPublish.new }

  before do
    VCR.insert_cassette 'publish_api', :record => :new_episodes
  end

  after do
    VCR.eject_cassette
  end

  it "records the fixture for droping a published repository" do
    publish_api.publish_drop(publish_options = { :prefix => "", :distribution => "radical2", :force => '1' })
  end
 
 end

end
