class BetterForms < ActionView::Helpers::FormBuilder
  def errors(name)
    return unless @object.errors[name]

    @template.content_tag(:div, class: 'form-error') do
      @object.errors[name].join(', ').capitalize
    end
  end
end
