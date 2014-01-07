class Ability
  include CanCan::Ability

  # Primitive caching
  @@permissions = nil

  def initialize(user)
    @@permissions ||= user.permissions
    @@permissions.each do |permission|
      if permission.subject.present?
        if permission.subject.capitalize == permission.subject
          if permission.subject_id.present?
            can permission.action.to_sym, permission.subject.constantize, id: permission.subject_id
          else
            can permission.action.to_sym, permission.subject.constantize
          end
        else
          if permission.subject.present?
            can permission.action.to_sym, permission.subject.to_sym
          end
        end
      else
        can permission.action.to_sym
      end
    end
  end
end
