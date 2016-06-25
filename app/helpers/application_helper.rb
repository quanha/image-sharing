module ApplicationHelper
  def title(text)
    content_for :title, text
  end

  def link_to_add_fields(name, f, association)
    new_object = f.object.send(association).klass.new
    id = new_object.object_id
    fields = f.fields_for(association, new_object, child_index: id) do |builder|
      render('shared/admin/product_quantity', f: builder)
    end
    link_to(name, '#/', class: 'btn btn-sm btn-success add_product_quantity', data: {id: id, fields: fields.gsub('\n', '')})
  end
end