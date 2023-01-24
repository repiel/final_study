import React, {Component} from "react";
import './food-card.scss';
import styled from 'styled-components';
import {withRouter} from 'react-router-dom';
import { border, height } from "styled-components";

const ImageCard = styled.div`
    height: 200px;
    border-top-right-radius: 0.5rem;
    border-top-left-radius: 0.5rem;
    background-color: #f5f5f5;
    background-image: ${p => (p.photo ? `url('${p.photo}')` : '')};
    background-position: 50% 50%;
    background-size: cover;
`;

class FoodCard extends Component {
    static defaultProps = {
        name: 'Traditional-food-not-found',
        photo: '',
        subIntro: 'There is no food data'
    };

    render() {
      return (
        <div className="food-card">
            {/* photo url 주입*/}
            <ImageCard photo={this.props.photo} />
            <div className="food-card-name">
                <span>{this.props.name}</span>
            </div>
            <div className="food-card-content">{this.props.subIntro}</div>
        </div>
      );
    }
}

export default withRouter(FoodCard);