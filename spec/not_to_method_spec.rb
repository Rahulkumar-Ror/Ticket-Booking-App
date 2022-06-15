RSpec.describe "not_to method" do
  it 'checks that two values do not match' do
    expect(5).not_to eq(52)
	end

	it 'checks that two values do not match' do
    expect('Hello').not_to eq('hello')
	end

	it 'checks that two values do not match' do
    expect([1,2,3]).not_to eq([1,2])
	end

end