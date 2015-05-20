app/views
=================
This is view folder which holds your html outputs. You have the freedom to create any file or sub-folders.
This framework uses erb gem to generate the view. Views can be created fully or partially. Example,

<br>
#### To create simple erb view file:
```
# app/views/root.erb
<h1>This is root page</h1>
...
# To route it, use ' erb :root ' in controller
```
<br>
#### To create erb view file inside a sub-folder:
```
# app/views/users/new.erb
<h1>This is signup page</h1>
...
# To route it, use ' erb :"users/new" ' in controller
```

<br>
#### To create partial erb view file:
```
# app/views/partials/form.erb
<h1>This is partial forms for AJAX calls</h1>
...
# To use it in existing view .erb file, example:
	# in app/views/users/new.erb
	<h2> User Data </h2>
	<%= erb :"partial/form" %>
```
