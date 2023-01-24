import React,  { Component } from 'react';
import './App.scss';
import koreaFoodData from './food-data';
import FoodCardList from './food-card-list';

import {Route, redirect, withRouter, Switch} from 'react-router-dom';
import FoodSpecific from './food-specific';


class App extends Component {
  state = {
    foodData : koreaFoodData
  };

  render() {
    return (
      <div id='app-container'>
        <div id='app'>
          <div id='app-header'>
            <span>한국의 전통 음식</span>
          </div>

          <Route path='/foods' render={() => <FoodCardList foodData={this.state.foodData} />} />
        </div>
      </div>
    );
  }
}

export default withRouter(App);
