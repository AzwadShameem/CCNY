import React from 'react';
import {useState} from 'react';
import './Form.css'
function Form() {
    const [name, setName]=useState('');
    const [phone, setPhone]=useState("");
    const [email, setEmail]=useState('');
    const [subject, setSubject]=useState('');
    const [message, setMessage]=useState('');
    const [isPending, setIsPending]= useState(false);

    const handleSubmit = (e) =>{
        e.preventDefault();
        const contact_message = {name, phone, email,subject, message};
        console.log(contact_message)
        
        setIsPending(true);

        //this the contact_message object has to be stored in the database
        //has to be done between setIsPending(true) and setIsPending(False)
        console.log("the message has been submitted!");

        setIsPending(false)

        setName("");
        setPhone("");
        setEmail("");
        setSubject("");
        setMessage("");

        alert("Your message has been submitted!")
    }

    return (
        <div className='contact_us_form'>
            <form onSubmit={handleSubmit}>
                <label>Name: </label>
                <input type="text" required value={name} onChange={(e)=> setName(e.target.value)}/>
                <label>Phone: </label>
                <input type="text" value={phone} onChange={(e)=> setPhone(e.target.value)}/>
                <label>Email: </label>
                <input type="text" required value={email} onChange={(e)=> setEmail(e.target.value)}/>
                <label>Subject: </label>
                <input type="text" required value={subject} onChange={(e)=> setSubject(e.target.value)}/>
                <label>Message: </label>
                <textarea required rows="6" value={message} onChange={(e)=> setMessage(e.target.value)}></textarea>
                <button>Submit</button>
            </form>
        </div>
    );
}

export default Form