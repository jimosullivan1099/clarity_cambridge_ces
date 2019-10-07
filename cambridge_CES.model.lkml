connection: "clarity_cambridge"

# include all views in this project
include: "*.view"

# include all dashboards in this project


explore: Cambridge_CES {}

# # Select the views that should be a part of this model,
# # and define the joins that connect them together.
#
# - explore: order_items
#   joins:
#     - join: orders
#       sql_on: ${orders.id} = ${order_items.order_id}
#     - join: users
#       sql_on: ${users.id} = ${orders.user_id}
