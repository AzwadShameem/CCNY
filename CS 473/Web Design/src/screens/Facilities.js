import React from "react";
import 'bootstrap/dist/css/bootstrap.min.css';
import { Container, Row, Col } from "react-bootstrap";
import './Facilities.css';
import ping_pong from '../images/ping_pong.jpg';
import gym from '../images/gym.jpg';
import swimmingpool from '../images/swimming-pool.jpg';
import { useJsApiLoader, GoogleMap, Marker } from '@react-google-maps/api'

const MapCenter = { lat: 40.6306668, lng: -73.9687654 }

export default function Reserve() {

    const { isLoaded } = useJsApiLoader({
        googleMapsApiKey: process.env.REACT_APP_GOOGLE_MAPS_API_KEY,
    })

    if (!isLoaded) {
        return <h1>Not loaded!</h1>
    }
    return (
        <>
            <Container>
                <Row>
                    <Col sm={8}>
                        <img src={ping_pong}></img>
                    </Col>
                    <Col sm={4}>
                        <div class="random">
                            <h3>Clubhouse</h3>
                            <h4>LET'S GET TOGETHER</h4>
                        </div>
                    </Col>
                </Row>
                <Row>
                    <Col sm={8}>
                        <img src={swimmingpool}></img>
                    </Col>
                    <Col sm={4}>
                        <div class="random">
                            <h3>Swimming Pool</h3>
                            <h4>READY TO HOST</h4>
                        </div></Col>
                </Row>
                <Row>
                    <Col sm={8}>
                        <img src={gym}></img>
                    </Col>
                    <Col sm={4}>
                        <div class="random">
                            <h3>GYM</h3>
                            <h4>LET'S HAVE SOME FUN</h4>
                        </div></Col>
                </Row>
            </Container>
            <center>
                <GoogleMap center={MapCenter} zoom={15} mapContainerStyle={{ width: '1000px', height: '500px' }}
                    options={{
                        zoomControl: false,
                        streetViewControl: false,
                        mapTypeControl: false,
                        fullscreenControl: false
                    }}>
                    <Marker position={Map} />
                </GoogleMap>
            </center>
        </>
    );
}
