$pkg_name="portqryv2"
$pkg_origin="drakoswraith"
$pkg_version="0.1.3"
$pkg_maintainer="drakoswraith@gmail.com"
$pkg_license=@("MIT")
$pkg_upstream_url="https://github.com/drakoswraith/habplan_portqryv2"
$pkg_description="PortQryV2 is a network port testing tool for Windows"
$pkg_maintainer="drakoswraith@gmail.com"
$pkg_source="https://download.microsoft.com/download/0/d/9/0d9d81cf-4ef2-4aa5-8cea-95a935ee09c9/PortQryV2.exe"
$pkg_shasum="6471c5190a99e3d1f337fcfef1fc410e8d487b66e093f924700e186cbd398dc0"
$pkg_filename="PortQryV2.exe"
$pkg_bin_dirs=@("bin")

function Invoke-Unpack {
    Start-Process "$HAB_CACHE_SRC_PATH/$pkg_filename" -Wait -ArgumentList "/T:$(Resolve-Path $HAB_CACHE_SRC_PATH)/$pkg_dirname/ /C /Q"
    Start-Process "$HAB_CACHE_SRC_PATH/$pkg_dirname/PORTQR~1.EXE" -Wait -ArgumentList "/auto `"$(Resolve-Path $HAB_CACHE_SRC_PATH)/$pkg_dirname`""
    remove-item "$HAB_CACHE_SRC_PATH/$pkg_dirname/PORTQR~1.EXE"
}

function Invoke-Install {
    Move-Item PortQry.exe "$pkg_prefix/bin" -Force
}