import React from "react";
import 'bootstrap/dist/css/bootstrap.min.css';
import './PlansPricing.css';

export default function PlansPricing() {
    const listItems1 = ["6 classes"]
    const listItems2 = ["3 individual sessions"]
    const listItems3 = ["Online resources"]
    const listItems4 = [ "1 Guest Pass"]
    const listItems5 = [ "Free WiFi"]
    const listItems6 = [ "Weekly newsletter"]
    const listItems7 = ["Priority Support"]
    return(
        <div className="wrapper">
            <Card3
            title = "Beginner"
            h1= "$15"
            para = "Explore the basics with this introductory courses"
            i1={listItems1}
            i2={listItems2}
            i3={listItems3}
            />

            <Card6
            title = "Pro"
            h1= "$30"
            para = "Every month Perfect for creatives, freelancers, and experienced"
            i1={listItems1}
            i2={listItems2}
            i3={listItems3}
            i4={listItems4}
            i5={listItems5}
            i6={listItems6}
            />

            <Card7
            title="VIP"
            h1="$50"
            para="Every month Unlimited access to professional"
            i1={listItems1}
            i2={listItems2}
            i3={listItems3}
            i4={listItems4}
            i5={listItems5}
            i6={listItems6}
            i7={listItems7}
            />
        </div>

    );
}

function Card3(props) {
    return (
        <div className="card">
            <div className="card_body">
                <h2 className="card_title">{props.title}</h2>
                <h1 className="card_h1"> {props.h1} </h1>
                <br></br>
                <p> {props.para} </p>
            </div>
            <button className="card_btn" >Select</button>
            <br>
            </br>
            <li className="card_listItems"> {props.i1} </li>
            <li className="card_listItems"> {props.i2} </li>
            <li className="card_listItems"> {props.i3} </li>
        </div>
    )
}

function Card6(props) {
    return (
        <div className="card">
            <div className="card_body">
                <h2 className="card_title">{props.title}</h2>
                <h1 className="card_h1"> {props.h1} </h1>
                <br></br>
                <p> {props.para} </p>
            </div>
            <button className="card_btn" >Select</button>
            <br>
            </br>
            <li className="card_listItems"> {props.i1} </li>
            <li className="card_listItems"> {props.i2} </li>
            <li className="card_listItems"> {props.i3} </li>
            <li className="card_listItems"> {props.i4} </li>
            <li className="card_listItems"> {props.i5} </li>
            <li className="card_listItems"> {props.i6} </li>
        </div>
    )
}

function Card7(props) {
    return (
        <div className="card">
            <div className="card_body">
                <h2 className="card_title">{props.title}</h2>
                <h1 className="card_h1"> {props.h1} </h1>
                <br></br>
                <p> {props.para} </p>
            </div>
            <button className="card_btn" >Select</button>
            <br>
            </br>
            <li className="card_listItems"> {props.i1} </li>
            <li className="card_listItems"> {props.i2} </li>
            <li className="card_listItems"> {props.i3} </li>
            <li className="card_listItems"> {props.i4} </li>
            <li className="card_listItems"> {props.i5} </li>
            <li className="card_listItems"> {props.i6} </li>
            <li className="card_listItems"> {props.i7} </li>
        </div>
    )
}