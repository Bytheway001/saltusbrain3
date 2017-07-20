ActiveAdmin.register User do
	permit_params :id,:email, :password, :password_confirmation, :contratos_attributes=>[:id,:inicio,:servicio_id,:fin,:_destroy]
	controller do
		def update
			if params[:user][:password].blank? && params[:user][:password_confirmation].blank?
				params[:user].delete("password")
				params[:user].delete("password_confirmation")
			end
			super
		end
	end
	index do
		column "Correo Electrónico" do |user|
			link_to user.email, admin_user_path(user)
		end
		column 'Servicios Contratados', :count_contratos

	end

	show do
		attributes_table do
			row :email
		end

		panel 'Contratos Actuales' do
			table_for user.contratos do |c|
				column :servicio
				column :inicio
				column :fin
			end
		end
	end
	form title: "Nuevo Usuario" do |f|
		inputs "Detalles" do
			input :email
			input :password
			input :password_confirmation
		end
		f.inputs 'Contratos' do
			f.has_many :contratos, allow_destroy: true do |a|
				a.input :inicio
				a.input :servicio_id, :as => :select, :collection=> Servicio.all
				a.input :fin
			end
		end
		actions
	end
# See permitted parameters documentation:
# https://github.com/activeadmin/activeadmin/blob/master/docs/2-resource-customization.md#setting-up-strong-parameters
#
# permit_params :list, :of, :attributes, :on, :model
#
# or
#
# permit_params do
#   permitted = [:permitted, :attributes]
#   permitted << :other if params[:action] == 'create' && current_user.admin?
#   permitted
# end

end
