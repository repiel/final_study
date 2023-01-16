import{BrowserRouter, Routes, Route, Link} from 'react-router-dom';
import Home from'./pages/home';
import About from'./pages/about';
import Profile from'./pages/profile';

function App() {
  return (
  <BrowserRouter>
  <header>헤더입니다.</header>
    <nav>
      <Link to={''}>Home </Link>
      <Link to={'/about'}>About </Link>
      <Link to={'/profile'}>Profile </Link>
    </nav>
    <Routes>
      <Route path='/' element={<Home />}/>
      <Route path='/about' element={<About />}/>
      <Route path='/profile' element={<Profile />}/>
    </Routes>
    <footer>footer입니다.</footer>
  </BrowserRouter>
  );
}

export default App;

// 라우터 버전을 6으로 새로 설치해야 한다.
// nav는 네비게이션 바로 클릭하면 이동할 수 있게끔한다.
// nav를 사용하려면 link를 import 해야 한다.
// link와 href의 차이점, link는 자연스럽게 넘어가고, href는 새로고침이 되므로 매끄럽지 않다. 따라서 link를 사용하는 편이 좋다.
// BrowserRouter, Routes, Route 이 친구들은 세트이다.
// header와 footer는 routes의 위와 밑 단이므로 어느 링크를 가도 고정이다.