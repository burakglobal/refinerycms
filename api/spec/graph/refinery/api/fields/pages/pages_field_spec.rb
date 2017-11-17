# frozen_string_literal: true

require 'spec_helper'

module Refinery
  module Api
    module Fields
      module Pages
        describe 'PagesField' do

          let!(:page) { FactoryBot.create_list(:page, 5) }

          let(:context) { { } }
          let(:variables) { { } }

          let(:result) do
            GraphqlSchema.execute(
              query_string,
              context: context,
              variables: variables
            )
          end

          let(:query_string) do
            <<-QUERY
query {
  pages {
    title
  }
}
            QUERY
          end

          context "as a normal user" do
            it 'returns the pages' do
              pages = result['data']['pages']
              expect(pages.length).to eq(5)
            end
          end
        end
      end
    end
  end
  end