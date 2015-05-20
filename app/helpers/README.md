app/helpers/*.rb
=================
This is your helper folder. Helper supports DRY (Don't Repeat Yourself) practices by allowing its methods
to be across the applications. Hence, repetitive methods or functions are encouraged to be placed inside
a helper file.

The helper can be created manually like controller file. To ensure the functions are working in the helpers,
any helper file should has the helpers loop. Example:
```
# app/helpers/html.rb
helpers do
	# for repetitive <em> in html view
	def em(param)
		...
	end

	# for repetitive math calculation
	def calculate_square(param)
		param * param
	end
	
	# More repetitive functions
	...
end
```

<br><br>
Any function within helpers loop can be called directly like a Ruby modules' methods. Example:
```
# app/controllers/root.rb
post '/' do
	calculate_square(params[:input])
end
```

```
# app/views/root.erb
<html>
	...
	<%= em("String") %>
	...
</html>
```

More information can be found here: http://www.sinatrarb.com/faq.html#helpview