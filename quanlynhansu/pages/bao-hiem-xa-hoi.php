<?php

// create session
session_start();

if (isset($_SESSION['username']) && isset($_SESSION['level'])) {
	// include file
	include('../layouts/header.php');
	include('../layouts/topbar.php');
	include('../layouts/sidebar.php');

	if (isset($_POST['edit'])) {
		$id = $_POST['idBhxh'];
		echo "<script>location.href='sua-bao-hiem-xa-hoi.php?p=socialinsurance&a=socialinsurance&id=" . $id . "'</script>";
	}

	// show data (kết hợp tên nhân viên từ bảng nhanvien)
	$showData = "SELECT bhxh.id, bhxh.mabaohiem, bhxh.masobaohiem, nv.ten_nv AS tennhanvien, bhxh.ngaysinh, bhxh.diachi, bhxh.noidangkybhxh, bhxh.ngaydangky, bhxh.thoihansudung FROM bao_hiem_xa_hoi bhxh JOIN nhanvien nv ON bhxh.tennhanvien = nv.id ORDER BY bhxh.id DESC";

	$result = mysqli_query($conn, $showData);

	$arrShow = array();
	if ($result && mysqli_num_rows($result) > 0) {
		while ($row = mysqli_fetch_assoc($result)) {
			$arrShow[] = $row;
		}
	}


	// create code room
	$levelCode = "MTD" . time();

	// add record
	if (isset($_POST['save'])) {
		// create array error
		$error = array();
		$success = array();
		$showMess = false;

		// Capture form data
		$masobaohiem = isset($_POST['masobaohiem']) ? $_POST['masobaohiem'] : '';
		$tenNhanVien = isset($_POST['nhanVien']) ? $_POST['nhanVien'] : ''; // Changed from tenNhanVien to nhanVien
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
			$insert = "INSERT INTO bao_hiem_xa_hoi(mabaohiem, masobaohiem, tennhanvien, ngaysinh, diachi, noidangkybhxh, ngaydangky, thoihansudung) 
			VALUES('$levelCode', '$masobaohiem', '$tenNhanVien', '$ngaySinh', '$diachi', '$noidangkybhxh', '$ngaydangky', '$thoihansudung')";

			mysqli_query($conn, $insert);
			$success['success'] = 'Thêm bảo hiểm xã hội thành công';
			echo '<script>setTimeout("window.location=\'bao-hiem-xa-hoi.php?p=bhxh&a=bhxh\'",1000);</script>';
		}
	}

	// hien thi nhan vien
	$nv = "SELECT id, ma_nv, ten_nv FROM nhanvien ORDER BY id DESC";
	$resultNV = mysqli_query($conn, $nv);
	$arrNV = array();
	while ($rowNV = mysqli_fetch_array($resultNV)) {
		$arrNV[] = $rowNV;
	}


	// delete record
	if (isset($_POST['delete'])) {
		$showMess = true;

		$id = $_POST['idBhxh'];
		$delete = "DELETE FROM bao_hiem_xa_hoi WHERE id = $id";
		mysqli_query($conn, $delete);
		$success['success'] = 'Xóa bảo hiểm xã hội thành công.';
		echo '<script>setTimeout("window.location=\'bao-hiem-xa-hoi.php?p=bhxh&a=bhxh\'",1000);</script>';
	}

?>
	<!-- Modal -->
	<div class="modal fade" id="exampleModal" tabindex="-1" role="dialog" aria-labelledby="exampleModalLabel" aria-hidden="true">
		<div class="modal-dialog" role="document">
			<div class="modal-content">
				<form method="POST">
					<div class="modal-header">
						<span style="font-size: 18px;">Thông báo</span>
						<button type="button" class="close" data-dismiss="modal" aria-label="Close">
							<span aria-hidden="true">&times;</span>
						</button>
					</div>
					<div class="modal-body">
						<input type="hidden" name="idBhxh">
						Bạn có thực sự muốn xóa bảo hiểm xã hội này?
					</div>
					<div class="modal-footer">
						<button type="button" class="btn btn-secondary" data-dismiss="modal">Hủy bỏ</button>
						<button type="submit" class="btn btn-primary" name="delete">Xóa</button>
					</div>
				</form>
			</div>
		</div>
	</div>

	<!-- Content Wrapper. Contains page content -->
	<div class="content-wrapper">
		<!-- Content Header (Page header) -->
		<section class="content-header">
			<h1>
				Bảo hiểm xã hội
			</h1>
			<ol class="breadcrumb">
				<li><a href="index.php?p=index&a=statistic"><i class="fa fa-dashboard"></i> Tổng quan</a></li>
				<li><a href="trinh-do.php?p=staff&a=level">Bảo hiểm xã hội</a></li>
				<li class="active">Danh sách bảo hiểm xã hội</li>
			</ol>
		</section>

		<!-- Main content -->
		<section class="content">
			<div class="row">
				<div class="col-xs-12">
					<div class="box box-primary">
						<div class="box-header with-border">
							<h3 class="box-title">Thêm bảo hiểm xã hội</h3>
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
											<input type="text" class="form-control" id="exampleInputEmail1" name="levelCode" value="<?php echo $levelCode; ?>" readonly>
										</div>
										<div class="form-group">
											<label>Mã số bảo hiểm xã hội <span style="color: red;">*</span>: </label>
											<input type="text" class="form-control" id="exampleInputEmail1" placeholder="Nhập mã số bảo hiểm" name="masobaohiem" value="<?php echo isset($_POST['masobaohiem']) ? $_POST['masobaohiem'] : ''; ?>">
											<small style="color: red;"><?php if (isset($error['masobaohiem'])) {
																			echo "Mã bảo hiểm xã hội không được để trống";
																		} ?></small>
										</div>
										<div class="form-group">
											<label for="exampleInputEmail1">Chọn nhân viên: </label>
											<select class="form-control" name="nhanVien">
												<option value="chon">--- Chọn nhân viên ---</option>
												<?php
												foreach ($arrNV as $nv) {
													echo "<option value='" . $nv['id'] . "'>" . $nv['ma_nv'] . " - " . $nv['ten_nv'] . "</option>";
												}
												?>
											</select>
										</div>
										<div class="form-group">
											<label>Ngày sinh: </label>
											<input type="date" class="form-control" id="exampleInputEmail1" name="ngaySinh" value="<?php echo date("Y-m-d"); ?>">
										</div>
										<div class="form-group">
											<label>Địa chỉ: </label>
											<textarea class="form-control" name="diachi"><?php echo isset($_POST['diachi']) ? $_POST['diachi'] : ''; ?></textarea>
										</div>
										<div class="form-group">
											<label>Nơi đăng ký bhxh: </label>
											<textarea class="form-control" name="noidangkybhxh"><?php echo isset($_POST['noidangkybhxh']) ? $_POST['noidangkybhxh'] : ''; ?></textarea>
										</div>
										<div class="form-group">
											<label>Ngày đăng ký: </label>
											<input type="date" class="form-control" id="exampleInputEmail1" name="ngaydangky" value="<?php echo date("Y-m-d"); ?>">
										</div>
										<div class="form-group">
											<label for="exampleInputEmail1">Thời hạn sử dụng<span style="color: red;">*</span>: </label>
											<input type="text" class="form-control" id="exampleInputEmail1" placeholder="Nhập thời hạn sử dụng" name="thoihansudung">
										</div>
										<!-- /.form-group -->
										<?php
										echo "<button type='submit' class='btn btn-primary' name='save'><i class='fa fa-plus'></i> Thêm việc bảo hiểm xã hội</button>";
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
					<div class="box">
						<div class="box-header">
							<h3 class="box-title">Danh sách bảo hiểm xã hội</h3>
						</div>
						<!-- /.box-header -->
						<div class="box-body">
							<div class="table-responsive">
								<table id="example1" class="table table-bordered table-striped">
									<thead>
										<tr>
											<th>STT</th>
											<th>Mã bảo hiểm xã hội</th>
											<th>Mã số bảo hiểm xã hội</th>
											<th>Tên nhân viên</th>
											<th>Ngày sinh</th>
											<th>Địa chỉ</th>
											<th>Nơi đăng ký bhxh</th>
											<th>Ngày đăng ký</th>
											<th>Thời hạn sử dụng</th>
											<th>Sửa</th>
											<th>Xóa</th>
										</tr>
									</thead>
									<tbody>
										<?php
										$count = 1;
										foreach ($arrShow as $arrS) {
										?>
											<tr>
												<td><?php echo $count; ?></td>
												<td><?php echo $arrS['mabaohiem']; ?></td>
												<td><?php echo $arrS['masobaohiem']; ?></td>
												<td><?php echo $arrS['tennhanvien']; ?></td>
												<td><?php echo $arrS['ngaysinh']; ?></td>
												<td><?php echo $arrS['diachi']; ?></td>
												<td><?php echo $arrS['noidangkybhxh']; ?></td>
												<td><?php echo $arrS['ngaydangky']; ?></td>
												<td><?php echo $arrS['thoihansudung']; ?></td>
												<th>
													<?php
													echo "<form method='POST'>";
													echo "<input type='hidden' value='" . $arrS['id'] . "' name='idBhxh'/>";
													echo "<button type='submit' class='btn bg-orange btn-flat'  name='edit'><i class='fa fa-edit'></i></button>";
													echo "</form>";
													?>

												</th>
												<th>
													<?php
													echo "<button type='button' class='btn bg-maroon btn-flat' data-toggle='modal' data-target='#exampleModal' data-whatever='" . $arrS['id'] . "'><i class='fa fa-trash'></i></button>";
													?>
												</th>
											</tr>
										<?php
											$count++;
										}
										?>
									</tbody>
								</table>
							</div>
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
