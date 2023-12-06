<?php

use App\Http\Controllers\AuthController;
use App\Http\Controllers\DashboardController;
use App\Http\Controllers\karyawanController;
use App\Http\Controllers\PresensiController;
use Illuminate\Support\Facades\Route;

/*
|--------------------------------------------------------------------------
| Web Routes
|--------------------------------------------------------------------------
|
| Here is where you can register web routes for your application. These
| routes are loaded by the RouteServiceProvider within a group which
| contains the "web" middleware group. Now create something great!
|
*/



Route::middleware(['guest:karyawan'])->group(function(){
    Route::get('/', function () {
        return view('auth.login');
    })->name('login');
    Route::post('/proseslogin', [AuthController::class, 'proseslogin']);
});

Route::middleware(['guest:user'])->group(function(){
    Route::get('/panel', function () {
        return view('auth.loginadmin');
    })->name('loginadmin');

    Route::post('/prosesloginadmin', [AuthController::class, 'prosesloginadmin']);

});

Route::middleware(['auth:karyawan'])->group(function () {
    Route::get('/dashboard',[DashboardController::class, 'index']);
    Route::get('/proseslogout', [AuthController::class, 'proseslogout']);

    //presensi
    Route::get('/presensi/create', [PresensiController::class,'create']);
    Route::post('/presensi/store', [PresensiController::class, 'store']);

    //edit profile
    Route::get('/editprofile', [PresensiController::class,'editprofile']);
    Route::post('/presensi/{nik}/updateprofile', [PresensiController::class, 'updateprofile']);

    //Histori
    Route::get('/presensi/histori', [PresensiController::class, 'histori']);
    Route::get('/gethistory', [PresensiController::class, 'gethistori']);
});

Route::middleware(['auth:user'])->group(function(){
    Route::get('/proseslogoutadmin', [AuthController::class, 'proseslogoutadmin']);
    Route::get('/pindahkeuser', [AuthController::class, 'pindahkeuser']);
    Route::get('/panel/dashboardadmin', [DashboardController::class, 'dashboardadmin']);

    //karyawann
    Route::get('/karyawan', [karyawanController::class, 'index']);
    Route::post('/karyawan/store', [karyawanController::class, 'store']);
    Route::post('/karyawan/edit', [karyawanController::class, 'edit']);
    Route::post('/karyawan/{nik}/update', [karyawanController::class, 'update']);
    Route::post('/karyawan/{nik}/delete', [karyawanController::class, 'delete']);


    //Presensi
    Route::get('/presensi/monitoring', [PresensiController::class, 'monitoring']);

});

