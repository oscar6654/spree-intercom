Spree::LineItem.class_eval do

  include Spree::EventTracker

  after_commit :create_event_on_intercom, on: [:create, :update, :destroy], if: :conditions_satisfied?

  private

    def conditions_satisfied?
      user_present? && update_conditions_satisfied?
    end

    def user_present?
      order.user_id.present?
    end

    def update_conditions_satisfied?
      (resource_created? || resource_destroyed?) ? true : quantity_updated_to_non_zero_value?
    end

    def quantity_updated_to_non_zero_value?
      changed_attributes.include?(:quantity) && !quantity_changed.first.nil? && quantity != 0
    end

    def set_data
      {
        line_item_id: id,
        order_number: order.number,
        sku: variant.sku,
        user_id: order.user_id
      }
    end

    def create_data
      set_data
    end

    def update_data
      set_data
    end

    def destroy_data
      {
        name: name,
        order_number: order.number,
        sku: variant.sku,
        time: Time.current.to_i,
        user_id: order.user_id
      }
    end

end
