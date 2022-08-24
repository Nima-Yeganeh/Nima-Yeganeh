var context = {
    url: '{% url "talent_admin:create_coupon" %}',
    coupon_list: '{% url "payment:api:all_coupon" %}',
    active_API: '{% url "payment:api:update_coupon" %}',
}  