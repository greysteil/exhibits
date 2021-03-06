# frozen_string_literal: true

require 'rails_helper'

describe Spotlight::Exhibit do
  describe 'exhibit extensions' do
    context 'when an exhibit is published' do
      let(:exhibit) { FactoryBot.create(:exhibit, published: false) }

      it 'kicks off a SendPublishStateChangeNotificationJob sending published = true' do
        allow(SendPublishStateChangeNotificationJob).to receive(:perform_later)

        exhibit.published = true
        exhibit.save!

        expect(SendPublishStateChangeNotificationJob).to have_received(:perform_later).with(
          a_hash_including(published: true)
        )
      end
    end

    context 'when an exhibit is un-published' do
      let(:exhibit) { FactoryBot.create(:exhibit, published: true) }

      it 'kicks off a SendPublishStateChangeNotificationJob sending published = false' do
        allow(SendPublishStateChangeNotificationJob).to receive(:perform_later)

        exhibit.published = false
        exhibit.save!

        expect(SendPublishStateChangeNotificationJob).to have_received(:perform_later).with(
          a_hash_including(published: false)
        )
      end
    end

    context 'when an the published state of an exhibit has not changed' do
      let(:exhibit) { FactoryBot.create(:exhibit, published: false) }

      it 'does not kick off a SendPublishStateChangeNotificationJob' do
        allow(SendPublishStateChangeNotificationJob).to receive(:perform_later)

        exhibit.subtitle = 'The sub-title of the exhibit'
        exhibit.save!

        expect(SendPublishStateChangeNotificationJob).not_to have_received(:perform_later)
      end
    end
  end
end
