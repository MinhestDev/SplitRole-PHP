<?php
// Bắt đầu session
session_start();

// Kiểm tra xem người dùng có quyền staff hay không
if (!isset($_SESSION['username']) || $_SESSION['level'] != 'staff') {
    // Nếu không phải là staff, chuyển hướng về trang đăng nhập
    header('Location: login.php');
    exit(); // Ngừng thực thi tiếp
}
?>

<!DOCTYPE html>
<html lang="vi">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Staff Dashboard</title>
</head>
<body>
    <h1>Chào mừng, <?php echo $_SESSION['username']; ?>!</h1>
    <p>Đây là trang dành cho nhân viên của bạn.</p>
    <a href="logout.php">Đăng xuất</a>
</body>
</html>
