toxls
=====

Exporting data as XLS format 

Installation and Configuration
==============================

Add to_xls gem in your Gemfile after that execute bundle install command.

add below to RAILS_ROOT/config/initializers/mime_types.rb

*Mime::Type.register_alias "text/excel", :xls*

Usage
=====

routes file

```
	match 'export_emp_details' => "emps#export_emp_details", :as => "export_emp_details"
``` 	

Emp model {first_name , last_name)

```
	def full_name
  		"#{self.first_name} #{self.last_name}"  	
  	end
```

Email model {emp_id # relation, email_name}

```
	def email_name
  		self.email
  	end
```

Emp Controller

```
	def export_emp_details
	    @emps = Emp.all
	    respond_to do |format|      
	      format.xls { 
	       send_data @emps.to_xls(:headers => ["First Name", "Last Name", "Full Name", "Email"], :columns => [:first_name, :last_name, :full_name, {:email => :email_name} ], :cell_format => {:color => :blue}, :header_format => {:weight => :bold}, ), :filename => 'emp_details.xls' 
	      }      
	    end    
  	end
```

View#index

```
	<%= link_to 'Export Emp Details', export_emp_details_path(:format => 'xls') %>
```
