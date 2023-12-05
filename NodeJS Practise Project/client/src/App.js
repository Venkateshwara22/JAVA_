
//import { Link } from 'react-router-dom/cjs/react-router-dom.min';
import './App.css';
import CreatePost from './Pages/CreatePost.';
import Home from './Pages/Home';
import {BrowserRouter as Router, Route, Switch, Link} from "react-router-dom";

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
  <Route path="/createPost" exact component={CreatePost} /> {/* Fix the typo here */}
</Switch>

   </Router>
    </div>
  );
}

export default App;
