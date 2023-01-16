import React from 'react';
import { useNavigate } from 'react-router-dom';

function Profile() {
    let navigate = useNavigate();
    return (
        <div>profile
            <button onClick={()=>{navigate('/')}}>home으로 이동</button>
        </div>
  );
}

export default Profile;