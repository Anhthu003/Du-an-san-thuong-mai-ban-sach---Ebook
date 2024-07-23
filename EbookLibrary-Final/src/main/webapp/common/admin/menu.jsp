<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<aside class="main-sidebar sidebar-dark-primary elevation-4">
	<!-- Brand Logo -->
	<a href="/admin/home" class="brand-link"> <img
		src="/assets/dist/img/AdminLTELogo.png" alt="AdminLTE Logo"
		class="brand-image img-circle elevation-3" style="opacity: .8">
		<span class="brand-text font-weight-light"> AdminLTE </span>
	</a>
	<!-- Sidebar -->
	<div class="sidebar">
		<!-- Sidebar user panel (optional) -->
		<div class="user-panel mt-3 pb-3 mb-3 d-flex">
			<div class="image">
				<img src="/assets/img/account/${account.avatar}"
					class="img-circle elevation-2" alt="${account.avatar}">
			</div>
			<div class="info">
				<a href="/admin/home" class="d-block">      <c:choose>
                                <c:when test="${account!=null}">
                                    ${account.username}
                                </c:when>
                                <c:otherwise>
                                    Tài khoản
                                </c:otherwise>
                            </c:choose>
				</a>
			</div>
		</div>

		<!-- SidebarSearch Form -->
		<div class="form-inline">
			<div class="input-group" data-widget="sidebar-search">
				<input class="form-control form-control-sidebar" type="search"
					placeholder="Search" aria-label="Search">
				<div class="input-group-append">
					<button class="btn btn-sidebar">
						<i class="fas fa-search fa-fw"></i>
					</button>
				</div>
			</div>
		</div>

		<!-- Sidebar Menu -->
		<nav class="mt-2">
			<ul class="nav nav-pills nav-sidebar flex-column"
				data-widget="treeview" role="menu" data-accordion="false">
				<!-- Add icons to the links using the .nav-icon class
           with font-awesome or any other icon font library -->
				<li class="nav-item menu-open"><a href="/admin/home"
					class="nav-link active"> <i
						class="nav-icon fas fa-tachometer-alt"></i>
						<p>
							Trang chủ
							
						</p>
				</a> 
    

				<li class="nav-item"><a href="#" class="nav-link"> <i
						class="nav-icon fas fa-edit"></i>
						<p>
							Quản lý <i class="fas fa-angle-left right"></i>
						</p>
				</a>
					<ul class="nav nav-treeview">
						<li class="nav-item"><a href="/admin/accountmanager"
							class="nav-link"> <i class="far fa-circle nav-icon"></i>
								<p>Account</p>
						</a></li>
						<li class="nav-item"><a href="/admin/sellermanager"
							class="nav-link"> <i class="far fa-circle nav-icon"></i>
								<p>Seller</p>
						</a></li>
						<li class="nav-item"><a href="/admin/productmanager"
							class="nav-link"> <i class="far fa-circle nav-icon"></i>
								<p>Sản phẩm</p>
						</a></li>
						<li class="nav-item"><a href="/admin/vouchermanager"
							class="nav-link"> <i class="far fa-circle nav-icon"></i>
								<p>Voucher</p>
						</a></li>
					</ul></li>
				<li class="nav-item"><a href="#" class="nav-link"> <i
						class="nav-icon fas fa-chart-pie"></i>
						<p>
							Thống Kê <i class="right fas fa-angle-left"></i>
						</p>
				</a>
					<ul class="nav nav-treeview">
						<li class="nav-item"><a href="/admin/orderstatistical"
							class="nav-link"> <i class="far fa-circle nav-icon"></i>
								<p>Doanh thu</p>
						</a></li>
					</ul>
					<ul>
						<li class="nav-item"><a href="#" class="nav-link"> <i
								class="fa-solid fa-arrow-right"></i>
								<p>
									Quay lại <i class="right fas fa-angle-left"></i>
								</p>
						</a>
							<ul class="nav nav-treeview">
								<li class="nav-item"><a href="/user/home" class="nav-link">

										<p>home user</p>
								</a></li>
							</ul></li>

					</ul></li>


			</ul>
		</nav>
		<!-- /.sidebar-menu -->
	</div>
	<!-- /.sidebar -->
</aside>
