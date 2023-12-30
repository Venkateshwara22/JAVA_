
//import { Link } from 'react-router-dom/cjs/react-router-dom.min';
import './App.css';
import CreatePost from './Pages/CreatePost.';
import Home from './Pages/Home';
import {BrowserRouter as Router, Route, Switch, Link} from "react-router-dom";
import Post from './Pages/Post';
//sometimes switch wont work then download the lower version of react-router-dom or use routes
function App() {

  
  
  return (
    <div className="App">
   <Router>
   <Link to="/createPost" style={{ fontSize: '28px', fontFamily: 'Roboto, sans-serif', textDecoration: 'none', color: 'yellow' }}>
   📝Add Your Favourite Movies📝
  </Link>
 
  <Switch>
  <Route path="/" exact component={Home} />
  <Route path="/createPost" exact component={CreatePost} /> 
  <Route path="/post/:id" exact component={Post} /> 
</Switch>

   </Router>
    </div>
  );
}

export default App;
