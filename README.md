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

### Model

#### Deactivate

```ruby
  u.deactivated?
  u.deactivate!
```

#### Scope

```ruby
  # scope
  User.deactivated
```

#### Customerize after_deactivate

```ruby
class User
  def after_deactivate
    # do something
  end
end
```

### Controller

You can send post request to '/users/deactivate' to deactivate the user. You can also customize the controller.


## Contributing

* Fork it
* Write your changes
* Commit
* Send a pull request

## License

Apache License version 2.
