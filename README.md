
# How to use

## install

### setup
```
bundle install
```

### make administrator user

```
rails c
u = User.find(1)
u.update(name: 'some admin_user name', admin: true, confirmed: true)
```
