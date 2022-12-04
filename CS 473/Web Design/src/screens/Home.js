import React from "react";
import './Home.css';
import home_top from '../images/home_top.png'
import home_two from '../images/home_two.png'
import home_three from '../images/home_three.png'
import home_four from '../images/home_four.png'
import Form from "./Form";

export default function Home(){
    const handleScroll = () =>{
        window.scroll({
            top:document.body.offsetHeight,
            left:0,
            behavior: 'smooth',
        })
    }
    return(
        <div className="home_body">
            <div className='top_image_row'>
                <img src={home_top} className="welcome" />
                <div className='top_image_text'>
                    <div className='overlay'>Brooklyn Table Tennis Club</div>
                    <button className='contact_button' onClick={handleScroll}> Contact </button>
                </div>
            </div>
            <div className='about_us'>
                <div className='about_us_text'>
                    <h1>About Us</h1>
                    <p>It all starts with a dream: a dream to be healthy, a dream to be
                        strong, a dream to be fast, and a dream to be #1. At Brooklyn Table
                        Tennis Club, we've been making dreams come true since 2000. Our
                        Brooklyn facility has been designed to provide an outstanding
                        environment for athletes of all levels and abilities. Whether you're a
                        novice or a professional, reach your potential with Brooklyn Table
                        Tennis Club.</p>
                </div>
                <img src={home_two} className="about_us_image" />
            </div>
            <div className="amenities">
                <h1>Amenities</h1>
                <h4>EVERYTHING YOU NEED</h4>
            </div>
            <div className='about_us'>
                <div className='about_us_text'>
                    <h1>Competetive Pricing</h1>
                    <p>After a hard day at work, there’s no better way to train than letting go of all 
                        your worries at our state-of-the-art Sports & Fitness Club. Our Competitive Pricing 
                        has all the necessary accompaniments to make your experience as enjoyable as can be. 
                        For more information about staying fit and active with us, please contact us below.</p>
                </div>
                <img src={home_three} className="about_us_image" />
            </div>
            <div className='about_us'>
                <img src={home_four} className="about_us_image" />
                <div className='about_us_text'>
                    <h1>1 Year Warranty</h1>
                    <p>Our newly renovated 1 Year Warranty is fully equipped with the latest amenities. 
                        More than just a place for sports, at Brooklyn Table Tennis Club, we’re here to offer 
                        you great experiences every step of the way. Stop by for a tour, and see what we can offer 
                        you.</p>
                </div>
            </div>
            <div className="contact_us">
                <div className="contact_us_text">
                    <h1>Contact Us</h1>
                    <p>1100 Coney Island Ave #8, Brooklyn, NY 11230, USA</p>
                    <p>(718) 421-2200</p>
                </div>
                <div className="contact_us_form">
                    <Form/>
                </div>
            </div>
        </div>
    );
}