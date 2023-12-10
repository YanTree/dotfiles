# app name, folder, dst path type
let apps_info_table = []
let data_path_table = []
let path_table = []


# record key-value pairs
let path_type = {local: 'local', roaming: 'roaming'}


## -----------------------------------------------------------------------------------------
## app_info constructor
def put_app [app_info] {
    return $app_info
}

def get_app [app_info] {
    $apps_info_table | enumerate | each {|it| if $it.item.app == $app_info.app { $it.item }}
}

## app_info data
let app_nushell = {
    app: 'nushell'
    folder: 'nushell'
    path_type: $path_type.roaming
}

let app_lazygit = {
    app: 'lazygit'
    folder: 'lazygit'
    path_type: $path_type.roaming
}

let app_nvim = {
    app: 'neovim'
    folder: 'nvim'
    path_type: $path_type.local
}


let apps_info_table = $apps_info_table ++ $app_nushell
let apps_info_table = $apps_info_table ++ $app_lazygit
let apps_info_table = $apps_info_table ++ $app_nvim
## -----------------------------------------------------------------------------------------


## -----------------------------------------------------------------------------------------
## data_path
let config_path = $env.USERPROFILE | path join '.config'
let local_path = $env.LOCALAPPDATA
let roaming_path = $env.APPDATA

def put_data_path [path_type, path] {

    return {
        path_type: $path_type
        path: $path
    }
}

# now only two type folder
let data_path_table = ($data_path_table ++ (put_data_path $path_type.local $local_path))
let data_path_table = ($data_path_table ++ (put_data_path $path_type.roaming $roaming_path))

def get_data_path [path_type] {
    $data_path_table | enumerate | each {|it| if $it.item.path_type == $path_type { $it.item.path }}
}
## -----------------------------------------------------------------------------------------


## -----------------------------------------------------------------------------------------
## big table
def put [app_info, config_path] {
    let name = $app_info.app
    let folder = $app_info.folder
    let src_path = $config_path | path join $folder
    let dst_path = (get_data_path $app_info.path_type) | path join $folder

    return {
        app: $name
        src_path: $src_path
        dst_path: $dst_path
    }
}


let path_table = ($path_table ++ (put $app_nushell $config_path))
let path_table = ($path_table ++ (put $app_lazygit $config_path))
let path_table = ($path_table ++ (put $app_nvim $config_path))

def get [app_info] {
    $path_table | enumerate | each {|it| if $it.item.app == $app_info.app { $it.item }}
}
## -----------------------------------------------------------------------------------------


## -----------------------------------------------------------------------------------------
## create symbol link use ln
print 'Create symbol link...'
$path_table | enumerate | each {|it|
    # print $"(($it.item.dst_path))"
    # print $"(($it.item.src_path))"
    mklink /j ($it.item.dst_path) ($it.item.src_path)
    # ln -sf ($it.item.src_path) | into string ($it.item.dst_path) | into string
    #print $"($it.item.app)'s symbol link..."
}
#print 'All done!'

#$apps_info_table
#test_double $app_alacritty
#$data_path_table

#get_data_path $app_alacritty.path_type
#(get $app_alacritty).src_path
#(get $app_alacritty).dst_path
# def main [] {
#     $path_table | enumerate | each {|it|
#         ln -sf ($it.item.src_path) | into string ($it.item.dst_path) | into string
#         print $"($it.item.app)'s symbol link..."
#     }
# }