ActiveAdmin.register Scolarite do

  # See permitted parameters documentation:
  # https://github.com/activeadmin/activeadmin/blob/master/docs/2-resource-customization.md#setting-up-strong-parameters
  #
  # Uncomment all parameters which should be permitted for assignment
  #
  # permit_params :filiere, :francais, :philosophie, :histoiregeo, :lv1, :lv2, :eps, :mathematique, :physiquechimie, :svt, :ses, :spemath, :spesvt, :spephysique, :tpe, :lv3, :user_id
  #
  # or
  #
   permit_params do
     permitted = [:filiere, :francais, :philosophie, :histoiregeo, :lv1, :lv2, :eps, :mathematique, :physiquechimie, :svt, :ses, :spemath, :spesvt, :spephysique, :tpe, :lv3, :user_id]
     permitted << :other if params[:action] == 'create'
     permitted
   end
  
end
