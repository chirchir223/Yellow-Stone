<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<style type="text/css">
    :root {
        --color-beige: #FBF5EF;
        --color-font-black: #333;
        --color-font-light-black: #555;
        --font-family: normal Avenir, Arial, georgia;
    }

    * {
        margin: 0;
        padding: 0;
        color: var(--color-font-black);
        font-family: var(--font-family);
    }

    header {
        border-top: solid 2px black;
        background: var(--color-beige);
        position: fixed; /* 헤더를 화면에 고정합니다. */
        top: 0;
        width: 100%;
        display: flex;
        flex-direction: column;
        align-items: center;
        z-index: 1000; /* 다른 요소들 위에 헤더를 배치합니다. */
    }

    header .head-wrap .head-wrap-inner {
        height: 120px;
        width: 1100px;
        position: relative;
        border: var(--temp-border);
    }

    .head-logo {
        position: relative;
        top: 20px;
        right: 50px;
        width: 190px;
        height: 80px;
        bottom: 100px;
        margin: auto;
    }

    header .head-wrap .head-wrap-inner .head-menu-top-nav {
        /* sign 위치이동 */
        position: absolute;
        left: 880px;
        top: 21px;
    }

    header .head-wrap .head-wrap-inner .head-menu-top-nav ul {
        list-style: none;
    }

    header .head-wrap .head-wrap-inner .head-menu-top-nav ul li {
        float: left;
        color: var(--color-font-light-black);
        font-size: 15px;
        text-align: center;
        height: 20px;
        border: var(--temp-border);
        margin-right: 20px;
    }

    header .head-wrap .head-wrap-inner .head-menu-top-nav ul li a {
        text-decoration: none;
    }

    header .head-wrap .head-wrap-inner .head-menu-top-nav ul li a:hover {
        text-decoration: underline;
    }

    header .head-wrap .head-wrap-inner .head-menu-top-nav ul .top-nav01 {
        width: 76px;
    }

    header .head-wrap .head-wrap-inner .head-menu-top-nav ul .top-nav02 {
        width: 106px;
    }

    header .head-wrap-sub {
        position: absolute;
        top: 60px;
        width: 1100px;
        height: 66px;
        border: var(--temp-border);
    }

    header .head-wrap-sub {
        display: flex;
        justify-content: flex-end;
    }

    header .head-wrap-sub ul {
        list-style: none;
        width: 737px;
        display: flex;
        justify-content: space-between;
        border: var(--temp-border);
    }

    header .head-wrap-sub ul li {
        text-align: left;
        flex: auto;
    }

    header .head-wrap-sub ul li a {
        text-decoration: none;
        display: block;
        margin: auto;
        text-transform: uppercase;
        text-align: center;
        font-size: 18px;
        padding-top: 10px;
        height: 66px;
    }

 
@keyframes slideIn {
    0% {
        opacity: 0;
        transform: translateY(-10px);
    }
    100% {
        opacity: 1;
        transform: translateY(0);
    }
}

.head-menu-main-nav ul ul {
    display: none;
    position: absolute;
    top: 90%; 
    left: -50%;
    background-color: var(--color-beige); 
    width: 200%; 
    list-style: none;
    padding: 10px 0; 
}

.head-menu-main-nav ul li:hover > ul {
    display: block;
    animation: slideIn 0.3s ease forwards;
}



@keyframes expand {
    0% {
        max-height: 0;
        opacity: 0;
    }
    100% {
        max-height: 500px;
        opacity: 1;
    }
}

.head-menu-main-nav ul ul li {
    width: 100%;
    text-align: left;
    overflow: hidden;
    max-height: 0;
    opacity: 0;
    animation: expand 0.5s ease forwards;
}


</style>

<%
String memid = (String) session.getAttribute("memid");
%>

<body>

    <header>
        <div class="head-wrap">
            <div class="head-wrap-inner">
            
                <a href="cafe_main.jsp">
                    <img class="head-logo" src="<%=request.getContextPath()%>/images/Yellow stone.png" alt="Cafe Logo">
                </a>
                <nav class="head-menu-top-nav">
                    <ul>
                        
                       <li class="top-nav03">
                            <% if (memid == null || memid.isEmpty()) { %>
                                <a href="login_main.jsp">Sign In</a>
                            <% } else { %>
                                <%= memid %>님<a class="logout" href="logout.jsp">로그아웃</a>
                            <% } %>
                        </li>
                        <li class="top-nav04"><a href="#">My Page</a></li>
                        
                    </ul>
                </nav>
            </div>
            <div class="head-wrap-sub">
                <nav class="head-menu-main-nav">
                    <ul>
                        <li class="main-nav01">
                            <a href="CS.jsp">STORY</a>
                            <ul>
                                <li><a href="CS.jsp">coffee story</a></li>
                                
                            </ul>
                        </li>
                        <li class="main-nav02">
                            <a href="Menu.jsp">Menu</a>
                            <ul>
                                <li><a href="Coffee.jsp">coffee</a></li>
                                <li><a href="Beverage.jsp">Beverage</a></li>
                                <li><a href="shad.jsp">shake & ade</a></li>
                                
                            </ul>
                        </li>
                        <li class="main-nav03">
                           <a href="Store.jsp">Store</a>
                            <ul>
                                <li><a href="#">TEA</a></li>
                                <li><a href="#">CAKE</a></li>
                                <li><a href="#">COFFEE BEANS</a></li>
                                
                            </ul>
                        </li>
                        <li class="main-nav04">
                            <a href="list.jsp">customer</a>
                            <ul>
                                <li><a href="list.jsp">Q&A</a></li>                       
                               
                            </ul>
                        </li>
                    </ul>
                </nav>
            </div>
        </div>
    </header>

    <div style="padding-top: 150px;">
        <!-- 페이지 내용 -->
    </div>

</body>
