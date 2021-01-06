require_relative '../lib/rhymera'

describe 'new list' do
  rhyme_list = Rhymera::List.new(function: 'getRhymes', word: 'fly')
  port_list = Rhymera::List.new(function: 'getPortmanteaus', word: 'fly')

  context 'JSON parser' do
    it 'creates an array of hashes in @object' do
      expect(rhyme_list.object.class).to eq(Array)
      expect(rhyme_list.object.first.class).to eq(Hash)
    end
  end

  context 'Entries' do
    it 'creates an array of Rhyme objects in @entries' do
      expect(rhyme_list.type).to eq('getRhymes')
      expect(rhyme_list.entries.first.class).to eq(Rhymera::Rhyme)
    end
    it 'creates an array of Portmanteau objects in @entries' do
      expect(port_list.type).to eq('getPortmanteaus')
      expect(port_list.entries.first.class).to eq(Rhymera::Portmanteau)
    end
  end
end
