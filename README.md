
# How to use

## First thing to do

### setup
```
bundle install
rake db:migrate
```

### Make administrator user

```
rails c
u = User.find(1)
u.update(name: 'some admin_user name', admin: true, confirmed: true)
```

### When new user attempt to login
- log in as administrator account
- make new user login by giving an access rights on admin panel
