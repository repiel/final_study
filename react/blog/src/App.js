/* eslint-disable */
import { useState } from 'react';
import './App.css';

function App() {

  let post = '블로그 내용이지롱~';
  let [메뉴, b] = useState(['메뉴 추천', '베스트', '떡국']);
  let [메뉴추천] = useState('오므라이스');
  let [좋아요, 수올리기] = useState(0);
  let [좋아요1, 수올리기1] = useState(0);
  let [좋아요2, 수올리기2] = useState(0);
  let [변경, 김치볶음밥] = useState('블로그 내용이지롱~');
  let [바꾸기, 바꾸기1] = useState(['메뉴', '워스트', '라면']);
  const [메뉴1, 메뉴변경] = useState(['오늘 점심 뭐먹지?', '메뉴', '워스트']);
  const [내용, 내용변경] = useState(['자장면', '오므라이스', '라면']);
  let [modal, setModal] = useState(false);
  let [_new, setNew] = useState(false);
  let [좋습니다, 수up] = useState(0,0,0);
  let [title, setTitle] = useState(0);



  return (
    <div className="App">
      <div className='black-nav'>
        <h4 id={post} style={{color:'yellowgreen', fontSize : '20px'}}
        >블로그 입니당</h4>
      </div>
      <button onClick={()=>{
        let copy = [...바꾸기];
        copy[0] = '메뉴 추천';
        copy[1] = '베스트';
        바꾸기1(copy);
      }}>글수정</button>

      <button onClick={()=>{
        let copy1 = [...메뉴1];
        let copy2 = [...내용];
        let copy3 = {}
        for ( let i= 0; i <copy1.length; i++){
          copy3[copy1[i]] = copy2[i];}
        copy1 = copy1.sort()
        let copy4 = []
        for (let i =0; i <copy1.length; i++){
          console.log(copy3[copy1[i]]);
          copy4.push(copy3[copy1[i]]);
        
        메뉴변경(copy1)
        내용변경(copy4)

        };
      }}>정렬하기</button>



      <div className="list">
      <h4> 오늘 점심 뭐먹지?<span onClick={()=>{수올리기(좋아요+1)}}>☺</span> {좋아요} </h4>
      <p> 글쎄..<button onClick={()=>{김치볶음밥('나는 김치볶음밥 추천')}}>눌러보아용❤</button>{변경}</p>
      </div>
      <div className="list">
      <h4> {바꾸기[0]}</h4>
      <p> {메뉴추천}</p>
      </div>
      <div className="list">
      <h4> {바꾸기[1]}</h4>
      <p> {바꾸기[2]}</p>
      </div>

      <div className="list">
      <h4> {메뉴1[0]}<span onClick={()=>{수올리기(좋아요+1)}}>☺</span> {좋아요} </h4>
      <p dangerouslySetInnerHTML={{__html: 내용[0]}}></p>
      </div>
      <div className="list">
      <h4> {메뉴1[1]} <span onClick={()=>{수올리기1(좋아요1+1)}}>💗</span> {좋아요1} </h4>
      <p> {내용[1]}</p>
      </div>
      <div className="list">
      <h4> {메뉴1[2]} <span onClick={()=>{수올리기2(좋아요2+1)}}>👌</span> {좋아요2} </h4>
      <p> {내용[2]}</p>
      </div>

      <div className="list">
        <h4 onClick={()=>{setModal(true)}}> 모달 보고 싶으면 눌러요</h4>
        <p> 왜 뭐 왜안돼</p>
      </div>
      <div className="list">
        <h4 onClick={()=>{setNew(true)}}> 두둥!</h4>
        <p> 제발 되어라</p>
      </div>

      {
        메뉴1.map(function(a, i){
          return <div className="list" key={i}>
          <h4 onClick={()=>{setModal(true); setTitle(i)}}>{a}<span onClick={()=>{수up(좋습니다+1)}}>💗</span>{좋습니다}</h4>
          <p>{i+1}</p>
          <p> {메뉴추천}</p>
          </div>
        })
      }

      <button onClick={()=>{setTitle(0)}}>글제목0</button>
      <button onClick={()=>{setTitle(1)}}>글제목1</button>
      <button onClick={()=>{setTitle(2)}}>글제목2</button>




      {
        modal == true ? <Modal color = {'plum'} 김치볶음밥={김치볶음밥} 메뉴1={메뉴1} 내용={내용} 변경={변경} title={title}/>: null
      }

      {
        _new == true ? <New/>: null
      }


    </div>
  );
}


function Modal(props){
  return (
    <div className='modal' style={{background : props.color}}>
    <h4> {props.메뉴1[props.title]}</h4>
    <p> {props.내용[1]} </p>
    <button onClick={()=>{props.김치볶음밥('블로그 내용 변경')}}> 수정</button>
  </div>
  );
}

function New(){
  return(
    <div className='new'>
      <h4>오늘도</h4>
      <p> 너무</p>
      <p> 수고많았어👍🧡</p>
    </div>
  );
}

export default App;
