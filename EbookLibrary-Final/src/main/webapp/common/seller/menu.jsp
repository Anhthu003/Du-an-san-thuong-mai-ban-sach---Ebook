<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
    <%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
        <aside class="main-sidebar sidebar-dark-primary elevation-4">
            <!-- Brand Logo -->
            <a href="/seller/home" class="brand-link"> <img src="/assets/dist/img/AdminLTELogo.png" alt="AdminLTE Logo"
                    class="brand-image img-circle elevation-3" style="opacity: .8">
                <span class="brand-text font-weight-light"> SellerLTE </span>
            </a>
            <!-- Sidebar -->
            <div class="sidebar">
                <!-- Sidebar user panel (optional) -->
                <div class="user-panel mt-3 pb-3 mb-3 d-flex">
                    <div class="image">
                        <img src="/assets/img/account/${account.avatar}" class="img-circle elevation-2" alt="${account.avatar}">
                    </div>
                    <div class="info">
                        <a href="/seller/home" class="d-block">
                           <c:if
									test="${account.username!=null}">${account.username}</c:if> <c:if
									test="${account.username==null}">Tài khoản</c:if> <%-- <c:if test="${account!=null}"></c:if>
                                <c:if test="${account==null}"></c:if> --%>
                        </a>
                    </div>
                </div>

                <!-- SidebarSearch Form -->
                <div class="form-inline">
                    <div class="input-group" data-widget="sidebar-search">
                        <input class="form-control form-control-sidebar" type="search" placeholder="Search"
                            aria-label="Search">
                        <div class="input-group-append">
                            <button class="btn btn-sidebar">
                                <i class="fas fa-search fa-fw"></i>
                            </button>
                        </div>
                    </div>
                </div>

                <!-- Sidebar Menu -->
                <nav class="mt-2">
                    <ul class="nav nav-pills nav-sidebar flex-column" data-widget="treeview" role="menu"
                        data-accordion="false">
                        <li class="nav-item menu-open"><a href="/seller/home" class="nav-link active"> <i
                                    class="nav-icon fas fa-tachometer-alt"></i>
                                <p>
                                    Trang chủ
                                </p>
                            </a> </li>

                        <li class="nav-item"><a href="#" class="nav-link"> <i class="nav-icon fas fa-edit"></i>
                                <p>
                                    Quản lý <i class="fas fa-angle-left right"></i>
                                </p>
                            </a>
                            <ul class="nav nav-treeview">
                                <li class="nav-item"><a href="/seller/productmanager" class="nav-link"> <i
                                            class="far fa-circle nav-icon"></i>
                                        <p>Sản phẩm</p>
                                    </a></li>
                                <li class="nav-item"><a href="/seller/ordermanager" class="nav-link"> <i
                                            class="far fa-circle nav-icon"></i>
                                        <p>Đơn Hàng</p>
                                    </a></li>
                                <li class="nav-item"><a href="/seller/vouchermanager" class="nav-link"> <i
                                            class="far fa-circle nav-icon"></i>
                                        <p>Voucher</p>
                                    </a></li>
                            </ul>
                        </li>
                        <li class="nav-item"><a href="#" class="nav-link"> <i class="nav-icon fas fa-chart-pie"></i>
                                <p>
                                    Thống Kê <i class="right fas fa-angle-left"></i>
                                </p>
                            </a>
                            <ul class="nav nav-treeview">
                                <li class="nav-item"><a href="/seller/orderstatistical" class="nav-link"> <i
                                            class="far fa-circle nav-icon"></i>
                                        <p>Đơn hàng</p>
                                    </a></li>
                            </ul>
                        </li>
                        <li class="nav-item"><a href="#" class="nav-link"> <i class="fa-solid fa-arrow-right"></i>
                                <p>
                                    Quay lại <i class="right fas fa-angle-left"></i>
                                </p>
                            </a>
                            <ul class="nav nav-treeview">
                                <li class="nav-item"><a href="/user/home" class="nav-link">
                                      <i class="bi bi-arrow-left-circle-fill"></i>
                                        <p>home user</p>
                                    </a>
                                </li>
                            </ul>
                        </li>
                    </ul>
                </nav>
                <!-- /.sidebar-menu -->
            </div>
            <!-- /.sidebar -->
        </aside>