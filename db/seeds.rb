Order.create!([
  {description: "Test Description 1", due_date: "2018-07-04", status: "draft", amount_cents: 100, amount_currency: "USD"},
  {description: "Test Description 2", due_date: "2018-06-27", status: "draft", amount_cents: 1000, amount_currency: "INR"},
  {description: "Test Description 3", due_date: "2018-06-29", status: "draft", amount_cents: 1000, amount_currency: "USD"}
])
