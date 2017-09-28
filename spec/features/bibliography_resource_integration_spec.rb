# frozen_string_literal: true

require 'rails_helper'

RSpec.describe 'Bibliography resource integration test', type: :feature do
  subject(:bibliograpy_resource) { BibliographyResource.new(url: 'article.bib', exhibit: exhibit) }

  let(:exhibit) { FactoryGirl.create(:exhibit) }
  let(:title_fields) do
    %w(title_display title_uniform_search)
  end

  it 'can write the document to solr' do
    expect { bibliograpy_resource.reindex }.not_to raise_error
  end

  context 'to_solr' do
    subject(:document) do
      bibliograpy_resource.document_builder.to_solr.first
    end

    it 'has a doc id' do
      expect(document[:id]).to eq 'QTWBAWKX'
    end

    it 'has some titles' do
      title_fields.each do |field_name|
        expect(document[field_name]).to eq ['Quelques observations sur le porc-'\
          'épic et le hérisson dans la littérature et l’iconographie médiévale']
      end
    end

    it 'has spotlight data' do
      expect(document).to include :spotlight_resource_id_ssim, :spotlight_resource_type_ssim
    end
  end
end
