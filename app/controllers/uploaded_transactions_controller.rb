class UploadedTransactionsController < ApplicationController
  def new
    @agent = Agent.find(params[:agent_id])
    @uploaded_transaction = @agent.uploaded_seller_transactions.new
  end

  def create
    agent = Agent.find(params[:agent_id])
    uploaded_transaction = agent.uploaded_seller_transactions.create(uploaded_transaction_params)

    if uploaded_transaction.save
      redirect_to agent_path(agent), notice: "Transaction saved!"
    else
      render "new"
    end
  end

  private

  def uploaded_transaction_params
    params.require(:uploaded_transaction).permit(:address, :city, :state, :zip, :listing_agent, :listing_price, :listing_date, :selling_price, :selling_agent, :selling_date, :status, :property_type)
  end
end
