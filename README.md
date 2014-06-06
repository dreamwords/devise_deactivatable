# Devise Deactivatable

Deactivatable Support for Devise

## Usage

Add it to your Gemfile

```ruby
gem "devise_deactivatable"
```

Add the `deactivatable` module to your model:

```ruby
class User < ActiveRecord::Base
  devise :database_authenticatable, :deactivatable
end
```

And add the `deactivated_at` field to the database through a migration:


```ruby
class DeviseCreateUsers < ActiveRecord::Migration
  def change
    add_column :users, :deactivated_at, :datetime
  end
end
```

And you're ready to go!

## Contributing

* Fork it
* Write your changes
* Commit
* Send a pull request

## License

Apache License version 2. Copyright 2012-2014 Plataformatec http://plataformatec.com.br
