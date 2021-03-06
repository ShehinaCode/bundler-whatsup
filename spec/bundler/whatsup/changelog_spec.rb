require 'spec_helper'
require 'bundler/whatsup/changelog'

describe Bundler::Whatsup::Changelog do
  let(:parsed_changelog) {
    { '1.0' => { fixes: ['fix #1', 'fix #2'], features: ['feature #1', 'feature #2'] },
      '1.2.2' => { fixes: ['fix #1', 'fix #2'], features: ['feature #1', 'feature #2'] },
      '2.0.3' => { improvements: ['improve #1', 'improve #2'], fixes: ['fixes #1'] } }
  }
  let(:changelog) { described_class.new(parsed_changelog)}

  describe '#initialize' do
    context 'when initialized with not Hash of Hashes { Symbol => Array }' do
      let(:hash_of_hashes) { { a: {}, b: {} } }

      it { expect(described_class.new('')).to raise_error }
      it { expect(described_class.new(Hash.new)).to raise_error }
      it { expect(described_class.new(:hash_of_hashes)).to raise_error }
    end
  end

  describe '#versions' do
    subject { changelog.versions }

    it { is_expected.to be_an(Array).and all be_an_instance_of Bundler::Whatsup::GemVersion }
  end

  describe '#changes_for' do
    subject { changelog.changes_for('1.0') }

    it { is_expected.to be_an_instance_of Bundler::Whatsup::GemVersion }
  end

  describe '#changes_after' do
    subject { changelog.changes_after(changelog.versions.first.to_s) }

    it { is_expected.to be_an_instance_of Bundler::Whatsup::Changes }
  end

end
