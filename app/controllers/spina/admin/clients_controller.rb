module Spina
  module Admin
    class ClientsController < AdminController
      before_filter :set_breadcrumb

      layout "spina/admin/website"

      def show
        @client = Client.find(params[:id])
      end

      def index
        @client = Client.all
      end

      def new
        add_breadcrumb "New client", spina.new_admin_client_path

        @client = Client.new
      end

      def edit
        @client = Client.find(params[:id])
        add_breadcrumb @client.name
      end

      def create
        @client = Client.new(client_params)

        add_breadcrumb "New client"
        if @client.save
          redirect_to spina.admin_client_url, notice: "Client successfully created."
        else
          render :new
        end
      end

      def update
        @client = Client.find(params[:id])

        add_breadcrumb @client.name

        if @client.update_attributes(client_params)
          redirect_to spina.admin_client_url, notice: "Client saved"
        else
          render :edit
        end
      end

      def destroy
        @client = Client.find(params[:id])
        @client.destroy
        redirect_to spina.admin_client_url, notice: "Client has been deleted."
      end

      private

      def set_breadcrumb
        add_breadcrumb "Client", spina.admin_clients_path
      end

      def client_params
        params.require(:client).permit(:name, :employee_name, :employee_title)
      end
    end
  end
end
