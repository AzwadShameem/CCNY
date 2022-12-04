import React, {useState, useEffect} from "react";
import { Container, Row, Col } from 'react-bootstrap';
import 'bootstrap/dist/css/bootstrap.min.css';
import './Blog.css'

export default function Blog(){
    const [results, setResults] = useState([])
    const url = 'https://sportscore1.p.rapidapi.com/sports/2/events?page=1';
    const options = {
        method: 'GET',
        headers: {
            'X-RapidAPI-Host': 'sportscore1.p.rapidapi.com',
            'X-RapidAPI-Key': 'a5de092c0dmsh48378ae8bef3decp1694e0jsn5c6302f02bac'
        }
    };

    useEffect(() => {
        fetch(url, options)
        .then(res => res.json())
        .then(json => setResults(json.data))
        .catch(err => console.error('error:' + err));
        console.log(results) 
    }, []) 

    return(
        <div className="BlogPage"> 
            {results.length > 0 && (
                <div className="BlogContainer">
                    {results.map((match) => (
                        <BlogPost 
                            homeTeamName={match.home_team.name}
                            homeTeamLogo={match.home_team.logo}
                            homeTeamScore={match.home_score}
                            awayTeamName={match.away_team.name}
                            awayTeamLogo={match.away_team.logo}
                            awayTeamScore={match.away_score}
                            />
                    ))}
               </div>
           )} 
        </div>
    );
}

function BlogPost(match) {
    return ( 
        <Container className="postBox">
            <Row>
                <Col md="1"/>
                <Col className="postTeam" md="3"> 
                    <img src={match.homeTeamLogo} alt=''/>
                    <p>{match.homeTeamName}</p>
                </Col>
                <Col md="1">
                    {(match.homeTeamScore != null) ? (
                        <p className="postScore">{match.homeTeamScore.display}</p>
                    ) : (
                        <p>{0}</p>
                    )}
                </Col>
                <Col md="2">
                    <p className="postDash">-</p>
                </Col>
                <Col md="1">
                    {(match.awayTeamScore != null) ? (
                        <p className="postScore">{match.awayTeamScore.display}</p>
                    ) : (
                        <p>{0}</p>
                    )}
                </Col>
                <Col className="postTeam" md="3"> 
                    <img src={match.awayTeamLogo} alt=''/>
                    <p>{match.awayTeamName}</p>
                </Col>
                <Col md="1"/>
            </Row>
        </Container>
    )
}