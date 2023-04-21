# format(format_string, arguments_to_be_formatted)
# the format string is a sequence of elements wrapped in double quotes, beginning with a percent sign. The elements in brackets are optional.
# "%[flags][width][.precision]type"

monthly_payment = 1000.22355432

monthly_payment.truncate(2)

monthly_payment = format("%.2f", monthly_payment)
puts monthly_payment