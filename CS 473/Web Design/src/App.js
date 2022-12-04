import React, {useState, useEffect} from 'react';
import logo from './logo.svg';
import './App.css';
import Header from './Header';
import Home from './screens/Home';
import PlansPricing from './screens/PlansPricing';
import Facilities from './screens/Facilities';
import Reserve from './screens/Reserve';
import Blog from './screens/Blog';
import {BrowserRouter as Router, Routes, Route} from 'react-router-dom';

function App() {
  return (
    <Router>
      <div className="App">
        {/* Header*/}
        <Header/>
        <div className="content">
          {/* App Body */}
          <Routes>
            <Route exact path="/" element={<Home/>}/>
            <Route exact path="/home" element={<Home/>}/>
            <Route exact path="/plans&pricing" element={<PlansPricing/>}/>
            <Route exact path="/reserve" element={<Reserve/>}/>
            <Route exact path="/blog" element={<Blog/>}/>
            <Route exact path="/facilities" element={<Facilities/>}/>
          </Routes>
        </div>
      </div>
    </Router>
  );
}

export default App;
