ActiveAdmin.register Post do
    menu :label => "Blog Posts"

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
    permit_params :title, :admin_user_id, :category, :created_at, :body
    index do
        column :title
        column "Author",:admin_user
        column :category
        column :created_at
        actions
    end
    
    

    
    
    class HtmlInput < Formtastic::Inputs::TextInput
      def to_html
        puts "this is my modified version of TextInput"
        input_wrapping do
          label_html <<
          "<div style='width: 78%; float: left'>".html_safe <<
          builder.text_area(method, input_html_options.merge(:class => 'ckeditor')) <<
          "</div><br style='clear: both'/>".html_safe
        end
      end
    end

    form do |f|
       f.inputs "Post" do
           f.input :category
           f.input :admin_user
           f.input :title
#           f.cktext_area :body , :class => 'ckeditor'
           f.input :body, :as => :html
       end
       f.actions
    end

end
 