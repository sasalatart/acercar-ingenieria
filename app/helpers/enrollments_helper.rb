module EnrollmentsHelper
  def enrollment_button(user, enrollable)
    enrolled = user.enrolled_in?(enrollable)

    classes = 'enroller button-link button-inline'
    classes << (enrolled ? ' unenroll red' : ' enroll green')

    button_tag data: { id: enrollable.id, type: enrollable.class.name }, class: classes do
      enrolled ? 'Dejar de Seguir' : 'Seguir'
    end
  end
end
