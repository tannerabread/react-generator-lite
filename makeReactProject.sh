#!/bin/bash


echo "Please enter a name for your React project"
read name
mkdir $name
cd $name


cat > package.json <<- EOM
{
  "name": "$name",
  "version": "0.1.0",
  "private": true,
  "dependencies": {
    "react": "^18.1.0",
    "react-dom": "^18.1.0",
    "react-scripts": "5.0.1"
  },
  "scripts": {
    "start": "react-scripts start",
    "build": "react-scripts build",
    "eject": "react-scripts eject"
  },
  "eslintConfig": {
    "extends": [
      "react-app"
    ]
  },
  "browserslist": {
    "production": [
      ">0.2%",
      "not dead",
      "not op_mini all"
    ],
    "development": [
      "last 1 chrome version",
      "last 1 firefox version",
      "last 1 safari version"
    ]
  },
  "prettier": {
    "trailingComma": "es5",
    "tabWidth": 2,
    "semi": false,
    "singleQuote": true
  }
}

EOM

cat > README.md <<- EOM
This project was made with the lite React App generator (with prettier config attached to package.json)

This was my normal config when creating new React apps. I thought the create-react-app generator was too bulky.

Copies the package.json from a default create-react-app

EOM

# git stuff
git init
cat > .gitignore <<- EOM
# See https://help.github.com/articles/ignoring-files/ for more about ignoring files.

# dependencies
/node_modules
/.pnp
.pnp.js

# testing
/coverage

# production
/build

# misc
.DS_Store
.env.local
.env.development.local
.env.test.local
.env.production.local

npm-debug.log*
yarn-debug.log*
yarn-error.log*

EOM

# make project files
mkdir -p {public,src}

cat > public/index.html <<- EOM
<!DOCTYPE html>
<html lang="en">
  <head>
    <meta charset="utf-8" />
    <meta name="viewport" content="width=device-width, initial-scale=1" />
    <meta name="theme-color" content="#000000" />
    <meta
      name="description"
      content="Web site created using TanneraBread's react app generator"
    />
    <title>$name</title>
  </head>
  <body>
    <noscript>You need to enable JavaScript to run this app.</noscript>
    <div id="root"></div>
  </body>
</html>

EOM

cat > public/robots.txt <<- EOM
# https://www.robotstxt.org/robotstxt.html
User-agent: *
Disallow:

EOM

cat > src/index.css <<- EOM
* {
  box-sizing: border-box;
}

body {
  margin: 0;
  font-family: -apple-system, BlinkMacSystemFont, 'Segoe UI', 'Roboto', 'Oxygen',
    'Ubuntu', 'Cantarell', 'Fira Sans', 'Droid Sans', 'Helvetica Neue',
    sans-serif;
  -webkit-font-smoothing: antialiased;
  -moz-osx-font-smoothing: grayscale;
}

EOM

cat > src/index.js <<- EOM
import { createRoot } from 'react-dom/client'

import App from './App'
import './index.css'

const root = createRoot(document.getElementById('root'))
root.render(<App />)

EOM

cat > src/App.js <<- EOM
const App = () => {
  return <div className="App">Welcome to the React-Lite Generator</div>
}

export default App

EOM


code . 

npm install
npm start
