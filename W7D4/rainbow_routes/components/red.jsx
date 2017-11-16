import React from 'react';
import { Route, Link, NavLink } from 'react-router-dom';
import Orange from './orange';
import Yellow from './yellow';

class Red extends React.Component {
  render() {
    return(
      <div>
        <h2 className="red"></h2>
          <NavLink exact to='/red'>Red</NavLink>
          <NavLink to='/red/orange'>Orange</NavLink>
          <NavLink to='/red/yellow'>Yellow</NavLink>

        <Route path='/red/orange' render={Orange}/>
        <Route path='/red/yellow' render={Yellow}/>
      </div>
    );
  }
}

export default Red;
