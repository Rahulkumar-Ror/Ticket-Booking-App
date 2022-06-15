RSpec.describe 'Post' do
  context 'before publication' do
    it 'cannot have comments' do   #
      expect { Workshop.comments.build }.to raise_error(ActiveRecord::RecordInvalid)  # test code
    end
  end
end
