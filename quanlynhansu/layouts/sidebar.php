<?php

// get active sidebar
if (isset($_GET['p']) && isset($_GET['a'])) {
	$p = $_GET['p'];
	$a = $_GET['a'];
}

?>

<!-- Left side column. contains the logo and sidebar -->
<aside class="main-sidebar">
	<!-- sidebar: style can be found in sidebar.less -->
	<section class="sidebar">
		<!-- Sidebar user panel -->
		<div class="user-panel">
			<div class="pull-left image">
				<img src="../uploads/images/<?php echo $row_acc['hinh_anh']; ?>" class="img-circle" alt="User Image">
			</div>
			<div class="pull-left info">
				<p>
					<?php echo $row_acc['ten']; ?> <?php echo $row_acc['ho']; ?>
				</p>
			</div>
		</div>
		<!-- search form -->
		<form action="#" method="get" class="sidebar-form">
			<div class="input-group">
				<input type="text" name="q" class="form-control" placeholder="Tìm kiếm...">
				<span class="input-group-btn">
					<button type="submit" name="search" id="search-btn" class="btn btn-flat"><i class="fa fa-search"></i>
					</button>
				</span>
			</div>
		</form>
		<!-- /.search form -->
		<!-- sidebar menu: : style can be found in sidebar.less -->
		<ul class="sidebar-menu" data-widget="tree">
			<li class="header">DANH MỤC QUẢN TRỊ</li>
			<li class="<?php if ($p == 'index') echo 'active'; ?> treeview">
				<a href="#">
					<i class="fa fa-dashboard"></i> <span>Tổng quan</span>
					<span class="pull-right-container">
						<i class="fa fa-angle-left pull-right"></i>
					</span>
				</a>
				<ul class="treeview-menu">
					<li class="<?php if ($a == 'statistic') echo 'active'; ?>"><a href="index.php?p=index&a=statistic"><i class="fa fa-circle-o"></i> Thống kê</a></li>
				</ul>
			</li>

			<?php if ($row_acc['quyen'] == 1) { ?>
				<li class="<?php if ($p == 'staff') echo 'active'; ?> treeview">
					<a href="#">
						<i class="fa fa-users"></i>
						<span>Nhân viên</span>
						<span class="pull-right-container">
							<i class="fa fa-angle-left pull-right"></i>
						</span>
					</a>
					<ul class="treeview-menu">
						<li class="<?php if (($p == 'staff') && ($a == 'room')) echo 'active'; ?>"><a href="phong-ban.php?p=staff&a=room"><i class="fa fa-circle-o"></i> Phòng ban</a></li>
						<li class="<?php if (($p == 'staff') && ($a == 'position')) echo 'active'; ?>"><a href="chuc-vu.php?p=staff&a=position"><i class="fa fa-circle-o"></i> Chức vụ</a></li>
						<li class="<?php if (($p == 'staff') && ($a == 'level')) echo 'active'; ?>"><a href="trinh-do.php?p=staff&a=level"><i class="fa fa-circle-o"></i> Trình độ</a></li>
						<li class="<?php if (($p == 'staff') && ($a == 'specialize')) echo 'active'; ?>"><a href="chuyen-mon.php?p=staff&a=specialize"><i class="fa fa-circle-o"></i> Chuyên môn</a></li>
						<li class="<?php if (($p == 'staff') && ($a == 'certificate')) echo 'active'; ?>"><a href="bang-cap.php?p=staff&a=certificate"><i class="fa fa-circle-o"></i> Bằng cấp</a></li>
						<li class="<?php if (($p == 'staff') && ($a == 'employee-type')) echo 'active'; ?>"><a href="loai-nhan-vien.php?p=staff&a=employee-type"><i class="fa fa-circle-o"></i> Loại nhân viên</a></li>
						<li class="<?php if (($p == 'staff') && ($a == 'add-staff')) echo 'active'; ?>"><a href="them-nhan-vien.php?p=staff&a=add-staff"><i class="fa fa-circle-o"></i> Thêm mới nhân viên</a></li>
						<li class="<?php if (($p == 'staff') && ($a == 'list-staff')) echo 'active'; ?>"><a href="danh-sach-nhan-vien.php?p=staff&a=list-staff"><i class="fa fa-circle-o"></i> Danh sách nhân viên</a></li>
					</ul>
				</li>
			<?php } ?>


			<li class="<?php if ($p == 'salary') echo 'active'; ?> treeview">
				<a href="#">
					<i class="fa fa-money"></i>
					<span>Quản lý lương</span>
					<span class="pull-right-container">
						<i class="fa fa-angle-left pull-right"></i>
					</span>
				</a>
				<ul class="treeview-menu">
					<li class="<?php if (($p == 'salary') && ($a == 'salary')) echo 'active'; ?>"><a href="bang-luong.php?p=salary&a=salary"><i class="fa fa-circle-o"></i> Bảng tính lương</a></li>

					<?php if ($row_acc['quyen'] == 1) { ?>
						<li class="<?php if (($p == 'salary') && ($a == 'calculator')) echo 'active'; ?>"><a href="tinh-luong.php?p=salary&a=calculator"><i class="fa fa-circle-o"></i> Tính lương</a></li>
					<?php } ?>
				</ul>
			</li>
			<li class="<?php if ($p == 'collaborate') echo 'active'; ?> treeview">
				<a href="#">
					<i class="fa fa-files-o"></i>
					<span>Quản lý công tác</span>
					<span class="pull-right-container">
						<i class="fa fa-angle-left pull-right"></i>
					</span>
				</a>
				<ul class="treeview-menu">
					<?php if ($row_acc['quyen'] == 1) { ?>
						<li class="<?php if (($p == 'collaborate') && ($a == 'add-collaborate')) echo 'active'; ?>"><a href="cong-tac.php?p=collaborate&a=add-collaborate"><i class="fa fa-circle-o"></i> Tạo công tác</a></li>
					<?php } ?>
					<li class="<?php if (($p == 'collaborate') && ($a == 'list-collaborate')) echo 'active'; ?>"><a href="danh-sach-cong-tac.php?p=collaborate&a=list-collaborate"><i class="fa fa-circle-o"></i> Danh sách công tác</a></li>
				</ul>
			</li>

			<?php if ($row_acc['quyen'] == 1) { ?>
				<li class="<?php if ($p == 'group') echo 'active'; ?> treeview">
					<a href="#">
						<i class="fa fa-users"></i> <span>Nhóm nhân viên</span>
						<span class="pull-right-container">
							<i class="fa fa-angle-left pull-right"></i>
						</span>
					</a>
					<ul class="treeview-menu">
						<li class="<?php if (($p == 'group') && ($a == 'add-group')) echo 'active'; ?>"><a href="tao-nhom.php?p=group&a=add-group"><i class="fa fa-circle-o"></i> Tạo nhóm</a></li>
						<li class="<?php if (($p == 'group') && ($a == 'list-group')) echo 'active'; ?>"><a href="danh-sach-nhom.php?p=group&a=list-group"><i class="fa fa-circle-o"></i> Danh sách nhóm</a></li>
					</ul>
				</li>
			<?php } ?>

			<li class="<?php if ($p == 'bonus-discipline') echo 'active'; ?> treeview">
				<a href="#">
					<i class="fa fa-star"></i> <span>Khen thưởng - Kỷ luật</span>
					<span class="pull-right-container">
						<i class="fa fa-angle-left pull-right"></i>
					</span>
				</a>
				<ul class="treeview-menu">
					<li class="<?php if (($p == 'bonus-discipline') && ($a == 'bonus')) echo 'active'; ?>"><a href="khen-thuong.php?p=bonus-discipline&a=bonus"><i class="fa fa-circle-o"></i>Khen thưởng</a></li>
					<li class="<?php if (($p == 'bonus-discipline') && ($a == 'discipline')) echo 'active'; ?>"><a href="ky-luat.php?p=bonus-discipline&a=discipline"><i class="fa fa-circle-o"></i> Kỷ luật</a></li>
				</ul>
			</li>

			<li class="<?php if ($p == 'bonus-discipline') echo 'active'; ?> treeview">
				<a href="#">
					<i class="fa fa-list"></i> <span>Công việc</span>
					<span class="pull-right-container">
						<i class="fa fa-angle-left pull-right"></i>
					</span>
				</a>
				<ul class="treeview-menu">
					<li class="<?php if (($p == 'todolist-discipline') && ($a == 'list-todolist')) echo 'active'; ?>"><a href="todolist.php"><i class="fa fa-circle-o"></i>Công việc cần làm</a></li>

				</ul>
			</li>

			<?php if ($row_acc['quyen'] == 1) { ?>
				<li class="<?php if ($p == 'bonus-discipline') echo 'active'; ?> treeview">
					<a href="#">
						<i class="fa fa-heartbeat"></i> <span>Bảo hiểm xã hội</span>
						<span class="pull-right-container">
							<i class="fa fa-angle-left pull-right"></i>
						</span>
					</a>
					<ul class="treeview-menu">
						<li class="<?php if (($p == 'bonus-discipline') && ($a == 'bonus')) echo 'active'; ?>">
							<a href="bao-hiem-xa-hoi.php?p=bhxh&a=bhxh"><i class="fa fa-circle-o"></i>Quản lý bảo hiểm xã hội</a>
						</li>
					</ul>
				</li>
			<?php } ?>
			<li class="<?php if ($p == 'bonus-discipline') echo 'active'; ?> treeview">
				<a href="#">
					<i class="fa fa-calendar"></i>
					<span>Đơn xin phép</span>
					<span class="pull-right-container">
						<i class="fa fa-angle-left pull-right"></i>
					</span>
				</a>
				<ul class="treeview-menu">
					<li class="<?php if (($p == 'bonus-discipline') && ($a == 'bonus')) echo 'active'; ?>">
						<a href="don-xin-phep.php"><i class="fa fa-circle-o"></i>Tạo đơn xin phép</a>
					</li>
				</ul>
			</li>


			<li class="<?php if ($p == 'account') echo 'active'; ?> treeview">
				<a href="#">
					<i class="fa fa-user"></i> <span>Tài khoản</span>
					<span class="pull-right-container">
						<i class="fa fa-angle-left pull-right"></i>
					</span>
				</a>
				<ul class="treeview-menu">
					<li class="<?php if ($a == 'profile') echo 'active'; ?>"><a href="thong-tin-tai-khoan.php?p=account&a=profile"><i class="fa fa-circle-o"></i> Thông tin tài khoản</a></li>
					<?php if ($row_acc['quyen'] == 1) { ?>
						<li class="<?php if ($a == 'add-account') echo 'active'; ?>"><a href="tao-tai-khoan.php?p=account&a=add-account"><i class="fa fa-circle-o"></i> Tạo tài khoản</a></li>
						<li class="<?php if (($p == 'account') && ($a == 'list-account')) echo 'active'; ?>"><a href="ds-tai-khoan.php?p=account&a=list-account"><i class="fa fa-circle-o"></i> Danh sách tài khoản</a></li>
					<?php } ?>
					<li class="<?php if ($a == 'changepass') echo 'active'; ?>"><a href="doi-mat-khau.php?p=account&a=changepass"><i class="fa fa-circle-o"></i> Đổi mật khẩu</a></li>
					<li><a href="dang-xuat.php"><i class="fa fa-circle-o"></i> Đăng xuất</a></li>
				</ul>
			</li>
			</li>
		</ul>
	</section>
	<!-- /.sidebar -->
</aside>
