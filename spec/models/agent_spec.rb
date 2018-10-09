describe Agent, type: :model do

  describe "#all_transactions" do
    let(:agent) { create :agent }
    let!(:agent_selling_transactions) { create_list :uploaded_transaction, 5, selling_agent: agent }
    let!(:agent_listing_transactions) { create_list :uploaded_transaction, 5, listing_agent: agent }
    let!(:other_transactions) { create_list :uploaded_transaction, 10 }

    it "should return transactions where agent is respresented" do
      expect(agent.all_transactions.count).to eq 10
    end
  end

  describe "#recent_transactions" do
    let(:agent) { create :agent }
    let!(:recent_agent_selling_transactions) { create_list :uploaded_transaction, 5, selling_agent: agent, selling_date: 2.months.ago }
    let!(:recent_agent_listing_transactions) { create_list :uploaded_transaction, 5, listing_agent: agent, selling_date: 2.months.ago }
    let!(:old_agent_selling_transactions) { create_list :uploaded_transaction, 5, selling_agent: agent, selling_date: 1.year.ago }
    let!(:old_agent_listing_transactions) { create_list :uploaded_transaction, 5, listing_agent: agent, selling_date: 1.year.ago }
    let!(:other_transactions) { create_list :uploaded_transaction, 10 }

    it "should return transactions where agent is respresented and the selling date is less than 6 months ago" do
      expect(agent.recent_transactions.count).to eq 10
    end
  end

  describe "#full_name" do
    let(:agent) { create :agent, first_name: "Jane", last_name: "Smith" }

    it "should display the agent's first and last name" do
      expect(agent.full_name).to eq "Jane Smith"
    end
  end

end
