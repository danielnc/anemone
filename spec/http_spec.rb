require File.dirname(__FILE__) + '/spec_helper'

module Anemone
  describe HTTP do

    describe "fetch_page" do
      before(:each) do
        FakeWeb.clean_registry
      end

      it "should still return a Page if an exception occurs during the HTTP connection" do
        class HTTP
          def refresh_connection
            raise "test exception"
          end
        end

        http = HTTP.new
        http.fetch_page(URI('http://www.example.com')).should be_an_instance_of(Page)
      end
    end
  end
end