RSpec.describe 'comparison matchers' do
  it 'allows for comparison with built-in Ruby operators' do   
    expect(10).to be > 5
    expect(10).to be < 33
    expect(10).to be >= 10
    expect(10).to be <= 33
  end
end
