app/models/*.rb
=================
This is your ActiveRecord model folder. Each model.rb file should be created with singular noun,
aligning to ActiveRecord naming convention requirement. 

The model file can be created manually or using rake instruction. You're recommended to create
your model file using rake instruction:
```
$ rake generate:model NAME=<singular_model_name>
```

Unlike Rails, this framework does not generate migration file automatically. Hence, you're required
to handle your migration file separately.