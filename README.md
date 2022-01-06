# Setup

```
asdf local ruby 3.0.1
asdf local nodejs 14.15.0
npm install --global yarn

yarn install
bundle install
```

If you are one of that rich kids with a new fancy MacBook Pro M1 and have a problem with installing nodeJS, please try to type 
```
arch -x86_64 zsh
asdf local ruby 3.0.1
asdf local nodejs 14.15.0
npm install --global yarn

yarn install
bundle install
```

# Starting app

```
rails server
```
if everything went ok you should be able to navigate to
```
localhost:3000
```
and see RoR default welcome page

