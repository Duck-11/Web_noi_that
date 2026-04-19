<%@ page contentType="text/html;charset=UTF-8" %>
<%
    String user = (String) session.getAttribute("user");
%>

<!DOCTYPE html>
<html lang="vi">
<head>
    <meta charset="UTF-8">
    <title>Nội Thất Hiện Đại - Trang Chủ</title>

    <!-- Font Awesome -->
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.5.0/css/all.min.css">

    <link rel="stylesheet" href="Style.css">
</head>
<body>

<header class="banner">
    DECOR LUXURY - NÂNG TẦM KHÔNG GIAN SỐNG
</header>

<nav class="top-menu">
    <div class="nav-links">
        <a href="index.jsp">Trang Chủ</a>
        <a href="#">Sản Phẩm</a>
        <a href="#">Khuyến Mãi</a>
        <a href="#">Liên Hệ</a>
    </div>

    <div class="auth-buttons">

        <a href="#" class="cart-btn" onclick="return false;">
            <i class="fa-solid fa-cart-shopping"></i>
            Giỏ hàng <span class="cart-count" id="cartCount">0</span>
        </a>

        <% if(user != null){ %>
            <span style="color:white;">Xin chào, <%= user %></span>
            <a href="logout.jsp">Đăng xuất</a>
        <% } else { %>
            <a href="#" class="btn-login" onclick="openLogin()">Đăng Nhập</a>
            <a href="#" class="btn-register" onclick="openRegister()">Đăng Ký</a>
        <% } %>

    </div>
</nav>

<div class="container">

    <aside class="left-menu">
        <h3>DANH MỤC</h3>
        <ul>
            <li>Phòng Khách</li>
            <li>Phòng Ngủ</li>
            <li>Phòng Bếp</li>
            <li>Bàn Ghế Làm Việc</li>
            <li>Trang Trí Decor</li>
            <li>Đèn Chiếu Sáng</li>
        </ul>
    </aside>

    <main class="content">
        <h2 style="margin-bottom: 20px; color: #333;">Sản Phẩm Nổi Bật</h2>

        <div class="product">
            <img src="https://images.unsplash.com/photo-1555041469-a586c61ea9bc" />
            <h4>Sofa Da Cao Cấp</h4>
            <p>15.000.000đ</p>
            <button onclick="addToCart()">Thêm vào giỏ</button>
        </div>

        <div class="product">
            <img src="https://images.unsplash.com/photo-1583847268964-b28dc2f51ac9" />
            <h4>Bàn Ăn Gỗ Sồi</h4>
            <p>8.500.000đ</p>
            <button onclick="addToCart()">Thêm vào giỏ</button>
        </div>

        <div class="product">
            <img src="https://images.unsplash.com/photo-1524758631624-e2822e304c36" />
            <h4>Ghế Xoay Ergonomic</h4>
            <p>3.200.000đ</p>
            <button onclick="addToCart()">Thêm vào giỏ</button>
        </div>

    </main>
</div>

<footer class="footer">
    <p>Nhóm 3 - Lã Ngọc Huyền | Trần Anh Đức | Nguyễn Phi Long | 2026</p>
</footer>

<!-- ================= MODAL LOGIN ================= -->
<div id="loginModal" class="modal">
    <div class="modal-box">
        <span class="close" onclick="closeModal('loginModal')">&times;</span>

        <h2>Đăng nhập</h2>

        <form action="loginServlet" method="post">
            <input type="text" name="username" placeholder="Email" required>
            <input type="password" name="password" placeholder="Mật khẩu" required>
            <button type="submit" name="action" value="login">Đăng nhập</button>
        </form>

        <p style="color: #ffffff">
            
                    <a href="#" style="color: #ffffff">Quên mật khẩu</a>
                    <span>|</span>
            <a href="#" onclick="switchModal('loginModal','registerModal')" style="color: #ffffff">Đăng ký</a>
        </p>
    </div>
</div>

<!-- ================= MODAL REGISTER ================= -->
<div id="registerModal" class="modal">
    <div class="modal-box">
        <span class="close" onclick="closeModal('registerModal')">&times;</span>

        <h2>Đăng ký</h2>

        <form action="loginServlet" method="post">
            <input type="text" name="username" placeholder="Email" required>
            <input type="password" name="password" placeholder="Mật khẩu" required>
            <input type="password" name="password" placeholder="Nhập lại mật khẩu" required>

            <button type="submit" name="action" value="register">Đăng ký</button>
        </form>

        <p style="color: #ffffff" >Đã có tài khoản?
            <a href="#" onclick="switchModal('registerModal','loginModal')" style="color: #ffffff">Đăng nhập</a>
        </p>
    </div>
</div>
<!-- LOGIN MODAL -->
<div id="loginModal" class="modal-overlay">
    <div class="modal-box">
        <h2>Đăng nhập</h2>

        <form action="loginServlet" method="post">
            <input type="text" name="username" placeholder="Email" required>
            <input type="password" name="password" placeholder="Mật khẩu" required>

            <button type="submit" name="action" value="login">Đăng nhập</button>
        </form>

        <p>
            <a href="#" onclick="switchModal('loginModal','registerModal')">Đăng ký</a>
        </p>
    </div>
</div>

<!-- REGISTER MODAL -->
<div id="registerModal" class="modal-overlay">
    <div class="modal-box">
        <h2>Đăng ký</h2>

        <form action="loginServlet" method="post">
            <input type="text" name="username" placeholder="Email" required>
            <input type="password" name="password" placeholder="Mật khẩu" required>

            <button type="submit" name="action" value="register">Đăng ký</button>
        </form>

        <p>
            <a href="#" onclick="switchModal('registerModal','loginModal')">Đăng nhập</a>
        </p>
    </div>
</div>


        <div id="chatIcon" onclick="toggleChat()" >🍃</div>

        <!-- 🔥 CHAT SIDEBAR -->
        <div id="chatSidebar">
            <div class="chat-header">
                Chat AI
                <span onclick="toggleChat()" style="cursor:pointer;">&times;</span>
            </div>

            <div id="chatMessages"></div>

            <div class="chat-input">
                <input type="text" id="chatInput" placeholder="Nhập câu hỏi...">
                <button onclick="sendMsg()">Gửi</button>
            </div>
        </div>

<script>
let cartCount = 0;
function addToCart() {
    cartCount++;
    document.getElementById('cartCount').textContent = cartCount;
}

// ===== MODAL =====
function openLogin() {
    document.getElementById("loginModal").style.display = "flex";
}
function openRegister() {
    document.getElementById("registerModal").style.display = "flex";
}
function closeModal(id) {
    document.getElementById(id).style.display = "none";
}
function switchModal(closeId, openId) {
    closeModal(closeId);
    document.getElementById(openId).style.display = "flex";
}

// chatbot
            function toggleChat() {
                let chat = document.getElementById("chatSidebar");
                // Nếu đang ẩn hoặc chưa có giá trị, thì cho hiện ra
                chat.classList.toggle("open");
            }

            let isSending = false;

            function sendMsg() {
                let input = document.getElementById("chatInput");
                let btn = document.querySelector(".chat-input button");
                let msg = input.value.trim();

                if (msg === "" || isSending)
                    return;
                
                 addMessage("Bạn", msg);
                input.value = "";

                // Khóa giao diện
                isSending = true;
                btn.disabled = true;
                btn.innerText = "...";

                // Hiện tin nhắn của bạn lên khung chat
                let localReply = botReply(msg);
                    if (localReply) {
                    addMessage("Bot", localReply);
                    return;
                }

                fetch("<%=request.getContextPath()%>/ChatServlet", {
                    method: "POST",
                    headers: {"Content-Type": "application/x-www-form-urlencoded"},
                    body: "message=" + encodeURIComponent(msg)
                })
                        .then(res => res.text())
                        .then(data => {
                            if (data.includes("429")) {
                                addMessage("Bot", "Hạn mức API đã hết, vui lòng thử lại sau 1 phút! ☕");
                            } else if (data.includes("Error") || data === "") {
                                addMessage("Bot", "Không tìm thấy dữ liệu sản phẩm phù hợp.");
                            } else {
                                addMessage("Bot", data);
                            }
                        })
                        .catch(err => {
                            addMessage("Bot", "Lỗi kết nối Server.");
                        })
                        .finally(() => {
                            // Ép giãn cách 3 giây để tránh lỗi 429
                            setTimeout(() => {
                                isSending = false;
                                btn.disabled = false;
                                btn.innerText = "Gửi";
                            }, 3000);
                        });
            }

            function addMessage(sender, text) {
                if(!text) return;
                let box = document.getElementById("chatMessages");
                let className = (sender === "Bạn") ? "user-msg" : "bot-msg";
                box.innerHTML += `<p class="${className}"><b>${sender}:</b> ${text}</p>`;
                box.scrollTop = box.scrollHeight;
            }

            /* 🔥 CHATBOT LOGIC OFFLINE */
            function botReply(msg) {
                msg = msg.toLowerCase();

                // 👋 CHÀO HỎI
                if (msg.includes("xin chào") || msg.includes("hello") || msg.includes("hi")) {
                    return "Xin chào 👋! Mình là trợ lý nội thất. Bạn muốn tìm sản phẩm gì?";
                }
            }

</script>

</body>
</html>
