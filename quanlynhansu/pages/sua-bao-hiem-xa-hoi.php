<?php

// create session
session_start();

if (isset($_SESSION['username']) && isset($_SESSION['level'])) {
	// include file
	include('../layouts/header.php');
	include('../layouts/topbar.php');
	include('../layouts/sidebar.php');

	if (isset($_GET['id'])) {
		$id = $_GET['id'];
		// show data
		$showData = "SELECT bhxh.id, bhxh.mabaohiem, bhxh.masobaohiem, bhxh.tennhanvien, bhxh.ngaysinh, bhxh.diachi, bhxh.noidangkybhxh, bhxh.ngaydangky, bhxh.thoihansudung FROM bao_hiem_xa_hoi bhxh WHERE id = $id";
		$result = mysqli_query($conn, $showData);
		$row = mysqli_fetch_array($result);
	}

	// hien thi nhan vien
	$nv = "SELECT id, ma_nv, ten_nv FROM nhanvien ORDER BY id DESC";
	$resultNV = mysqli_query($conn, $nv);
	$arrNV = array();
	while ($rowNV = mysqli_fetch_array($resultNV)) {
		$arrNV[] = $rowNV;
	}

	// update record
	if (isset($_POST['save'])) {
		// create array error
		$error = array();
		$success = array();
		$showMess = false;

		// get data from form
		$masobaohiem = isset($_POST['masobaohiem']) ? $_POST['masobaohiem'] : '';
		$tenNhanVien = isset($_POST['nhanVien']) ? $_POST['nhanVien'] : ''; // Changed to match format in add page
		$ngaySinh = isset($_POST['ngaySinh']) ? $_POST['ngaySinh'] : '';
		$diachi = isset($_POST['diachi']) ? $_POST['diachi'] : '';
		$noidangkybhxh = isset($_POST['noidangkybhxh']) ? $_POST['noidangkybhxh'] : '';
		$ngaydangky = isset($_POST['ngaydangky']) ? $_POST['ngaydangky'] : '';
		$thoihansudung = isset($_POST['thoihansudung']) ? $_POST['thoihansudung'] : '';

		// validate
		if (empty($masobaohiem))
			$error['masobaohiem'] = 'Vui lòng nhập mã số bảo hiểm!';

		if (!$error) {
			$showMess = true;
			$update = "UPDATE bao_hiem_xa_hoi SET 
                  masobaohiem = '$masobaohiem',
                  tennhanvien = '$tenNhanVien',
                  ngaysinh = '$ngaySinh',
                  diachi = '$diachi',
                  noidangkybhxh = '$noidangkybhxh',
                  ngaydangky = '$ngaydangky',
                  thoihansudung = '$thoihansudung'
                  WHERE id = $id";
			mysqli_query($conn, $update);
			$success['success'] = 'Cập nhật bảo hiểm xã hội thành công';
			echo '<script>setTimeout("window.location=\'bao-hiem-xa-hoi.php?p=bhxh&a=bhxh\'",1000);</script>';
		}
	}

?>
	<!-- Content Wrapper. Contains page content -->
	<div class="content-wrapper">
		<!-- Content Header (Page header) -->
		<section class="content-header">
			<h1>
				Bảo hiểm xã hội
			</h1>
			<ol class="breadcrumb">
				<li><a href="index.php?p=index&a=statistic"><i class="fa fa-dashboard"></i> Tổng quan</a></li>
				<li><a href="bao-hiem-xa-hoi.php?p=bhxh&a=bhxh">Bảo hiểm xã hội</a></li>
				<li class="active">Chỉnh sửa bảo hiểm xã hội</li>
			</ol>
		</section>

		<!-- Main content -->
		<section class="content">
			<div class="row">
				<div class="col-xs-12">
					<div class="box box-primary">
						<div class="box-header with-border">
							<h3 class="box-title">Chỉnh sửa bảo hiểm xã hội</h3>
							<div class="box-tools pull-right">
								<button type="button" class="btn btn-box-tool" data-widget="collapse"><i class="fa fa-minus"></i></button>
								<button type="button" class="btn btn-box-tool" data-widget="remove"><i class="fa fa-remove"></i></button>
							</div>
						</div>
						<!-- /.box-header -->
						<div class="box-body">
							<?php
							// show error
							if (isset($error)) {
								if ($showMess == false) {
									echo "<div class='alert alert-danger alert-dismissible'>";
									echo "<button type='button' class='close' data-dismiss='alert' aria-hidden='true'>&times;</button>";
									echo "<h4><i class='icon fa fa-ban'></i> Lỗi!</h4>";
									foreach ($error as $err) {
										echo $err . "<br/>";
									}
									echo "</div>";
								}
							}
							?>
							<?php
							// show success
							if (isset($success)) {
								if ($showMess == true) {
									echo "<div class='alert alert-success alert-dismissible'>";
									echo "<h4><i class='icon fa fa-check'></i> Thành công!</h4>";
									foreach ($success as $suc) {
										echo $suc . "<br/>";
									}
									echo "</div>";
								}
							}
							?>
							<form action="" method="POST">
								<div class="row">
									<div class="col-md-12">
										<div class="form-group">
											<label for="exampleInputEmail1">Mã bảo hiểm xã hội<span style="color: red;">*</span>: </label>
											<input type="text" class="form-control" id="exampleInputEmail1" name="mabaohiem" value="<?php echo $row['mabaohiem']; ?>" readonly>
										</div>
										<div class="form-group">
											<label>Mã số bảo hiểm xã hội <span style="color: red;">*</span>: </label>
											<input type="text" class="form-control" id="exampleInputEmail1" placeholder="Nhập mã số bảo hiểm" name="masobaohiem" value="<?php echo $row['masobaohiem']; ?>">
											<small style="color: red;"><?php if (isset($error['masobaohiem'])) {
																			echo "Mã bảo hiểm xã hội không được để trống";
																		} ?></small>
										</div>
										<div class="form-group">
											<label for="exampleInputEmail1">Chọn nhân viên: </label>
											<select class="form-control" name="nhanVien">
												<?php
												foreach ($arrNV as $nv) {
													$selected = ($nv['id'] == $row['tennhanvien']) ? 'selected' : '';
													echo "<option value='" . $nv['id'] . "' $selected>" . $nv['ma_nv'] . " - " . $nv['ten_nv'] . "</option>";
												}
												?>
											</select>
										</div>
										<div class="form-group">
											<label>Ngày sinh: </label>
											<input type="date" class="form-control" id="exampleInputEmail1" name="ngaySinh" value="<?php echo $row['ngaysinh']; ?>">
										</div>
										<div class="form-group">
											<label>Địa chỉ: </label>
											<textarea class="form-control" name="diachi"><?php echo $row['diachi']; ?></textarea>
										</div>
										<div class="form-group">
											<label>Nơi đăng ký bhxh: </label>
											<textarea class="form-control" name="noidangkybhxh"><?php echo $row['noidangkybhxh']; ?></textarea>
										</div>
										<div class="form-group">
											<label>Ngày đăng ký: </label>
											<input type="date" class="form-control" id="exampleInputEmail1" name="ngaydangky" value="<?php echo $row['ngaydangky']; ?>">
										</div>
										<div class="form-group">
											<label for="exampleInputEmail1">Thời hạn sử dụng<span style="color: red;">*</span>: </label>
											<input type="text" class="form-control" id="exampleInputEmail1" placeholder="Nhập thời hạn sử dụng" name="thoihansudung" value="<?php echo $row['thoihansudung']; ?>">
										</div>
										<!-- /.form-group -->
										<?php
										echo "<button type='submit' class='btn btn-warning' name='save'><i class='fa fa-save'></i> Lưu lại</button>";
										?>
									</div>
									<!-- /.col -->
								</div>
								<!-- /.row -->
							</form>
						</div>
						<!-- /.box-body -->
					</div>
					<!-- /.box -->
				</div>
				<!-- /.col -->
			</div>
			<!-- /.row -->
		</section>
		<!-- /.content -->
	</div>

<?php
	// include
	include('../layouts/footer.php');
} else {
	// go to pages login
	header('Location: dang-nhap.php');
}

?>
