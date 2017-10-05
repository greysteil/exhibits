# frozen_string_literal: true

require 'rails_helper'

RSpec.describe 'Bibliography resource integration test', type: :feature do
  subject(:document) { SolrDocument.new(to_solr_hash) }

  let(:bibliography_resource) do
    BibliographyResource.new(
      bibtex_file: File.open(file).read, exhibit: exhibit
    )
  end

  let(:file) { 'spec/fixtures/bibliography/article.bib' }
  let(:exhibit) { FactoryGirl.create(:exhibit) }
  let(:title_fields) do
    %w(title_display title_full_display title_uniform_search title_sort)
  end
  let(:author_fields) do
    %w(author_person_full_display author_sort)
  end
  let(:to_solr_hash) { bibliography_resource.document_builder.to_solr.first }

  it 'can write the document to solr' do
    expect { bibliography_resource.reindex }.not_to raise_error
  end

  context 'to_solr' do
    it 'has a doc id' do
      expect(document[:id]).to eq 'QTWBAWKX'
    end

    it 'has the BibTeX key' do
      expect(document['bibtex_key_ss']).to eq ['http://zotero.org/groups/1051392/items/QTWBAWKX']
    end

    it 'is a reference document' do
      expect(document.reference?).to be_truthy
    end

    it 'has some titles' do
      title_fields.each do |field_name|
        expect(document[field_name]).to eq ['Quelques observations sur le porc-'\
          'épic et le hérisson dans la littérature et l’iconographie médiévale']
      end
    end

    it 'has authors' do
      author_fields.each do |field_name|
        expect(document[field_name]).to eq ['Wille, Clara']
      end
    end

    it 'has BibTeX' do
      expect(document.bibtex.to_s).to include '@article{http://zotero.org/groups/1051392/items/QTWBAWKX'
    end

    it 'has formatted bibliography in HTML' do
      expect(document.formatted_bibliography).to match(/^Wille, Clara/)
    end

    it 'has spotlight data' do
      expect(document).to include :spotlight_resource_id_ssim, :spotlight_resource_type_ssim
    end

    it 'skips undefined fields' do
      expect(document['place']).to be_nil
    end

    context 'article' do
      it 'has publication title' do
        expect(document['pub_display']).to eq ['Reinardus. Yearbook of the International Reynard Society']
      end

      it 'has a volume' do
        expect(document['volume_ssm']).to eq ['17']
      end

      it 'has pages' do
        expect(document['pages_ssm']).to eq ['181–201']
      end

      it 'has a year' do
        expect(document['pub_year_isi']).to eq [2004]
      end

      it 'has a DOI' do
        expect(document['doi_ssim']).to eq ['10.1075/rein.17.14wil']
      end
    end

    context 'book' do
      let(:file) { 'spec/fixtures/bibliography/book.bib' }

      it 'has a publisher' do
        expect(document['pub_display']).to eq ['Faculdade de Letras da Universidade de Coimbra']
      end

      it 'has an edition' do
        expect(document['edition_ssm']).to eq ['1st']
      end

      it 'has an address' do
        expect(document['location_ssi']).to eq ['Coimbra']
      end
    end

    context 'book section' do
      let(:file) { 'spec/fixtures/bibliography/incollection.bib' }

      it 'has a book title' do
        expect(document['book_title_ssim'].first).to match(/^Legenda aurea/)
      end

      it 'has a series' do
        expect(document['series_ssi']).to eq ['Textes et Études du Moyen Âge']
      end

      it 'has an editor ' do
        expect(document['editor_ssim']).to eq ['Dunn-Lardeau, B.']
      end
    end

    context 'thesis' do
      let(:file) { 'spec/fixtures/bibliography/phdthesis.bib' }

      it 'has a degree type' do
        expect(document['thesis_type_ssm']).to eq ['B.Litt.']
      end

      it 'has a university' do
        expect(document['university_ssim']).to eq ['University of Oxford']
      end
    end
  end

  context 'with related documents' do
    let(:file) { 'spec/fixtures/bibliography/noauthor.bib' }

    it '#related_document_ids' do
      expect(document.bibtex[0].keywords).to eq 'dg156sv6886, test, aa111bb2222'
      expect(document.related_document_ids.length).to eq 2
      expect(document.related_document_ids).to include 'dg156sv6886'
      expect(document.related_document_ids).to include 'aa111bb2222'
      expect(document.related_document_ids).not_to include 'test' # strips out "test"
    end
  end
  context 'with no title' do
    let(:file) { 'spec/fixtures/bibliography/notitle.bib' }

    it 'is skipped' do
      expect(to_solr_hash).to be_nil
    end
  end
  context 'with no author' do
    let(:file) { 'spec/fixtures/bibliography/noauthor.bib' }

    it 'is not skipped' do
      expect(to_solr_hash['author_person_full_display']).to be_nil
      title_fields.each do |field_name|
        expect(to_solr_hash).to include field_name
      end
    end
  end
  context 'with no keywords' do
    let(:file) { 'spec/fixtures/bibliography/nokeywords.bib' }

    it 'is skipped' do
      expect(to_solr_hash).to be_nil
    end
  end
  context 'with TeX-ified title' do
    subject(:document) do
      SolrDocument.new(bibliography_resource.document_builder.to_solr.first)
    end

    let(:file) { 'spec/fixtures/bibliography/texifiedtitle.bib' }

    before do
      allow(BibTeX.log).to receive(:warn).with(/Lexer: unbalanced braces at 210/)
    end

    it 'does not parse the BibTeX cleanly' do
      expect { document }.not_to raise_error
      expect(BibTeX.log).to have_received(:warn)
    end

    it 'parses the titles' do
      title_fields.each do |field_name|
        expect(document[field_name].first).to match(/Language and Mortality/)
      end
    end
  end
end