import React, {Component} from "react";
import FoodCard from "./food-card";

class App extends Component {
    static defaultProps = {
        foodData: []
    };

    render() {
      const renderFoodCard = foods => {
        return foods.map((food, idx) => {
            return <FoodCard key={idx} photo={food.photo} name={food.name} subIntro={food.subIntro} />;
        });
      };

      return <div id='app-food-card-container'>{renderFoodCard(this.props.foodData)}</div>;
    }
}

export default App;