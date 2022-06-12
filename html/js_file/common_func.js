var x_auth_tokens='';
var instanceIdList = [];
var flavorsIdList = [];
var networksIdList = [];
var imgsIdList = [];
var subnetIdList = [];
var subnetMap = [];
var projToken = [];
var projNumber = 1;
var tempNetwork;
var tempImg;
var tempFlavor;
var tempServer;
var createNetworkId;

function getInstanceList(){    
    $.each(instanceIdList,function(i,item){
        console.log(item.id);
    });
}

function getImgFromId(id){
    var imgItem;
    $.each(imgsIdList,function(i,item){
        if(item.id == id){
            imgItem = item;
            return;
        }
    });
    return imgItem;
}

function getFlavorFromId(id){
    var flavorItem;
    $.each(flavorsIdList,function(i,item){
        if(item.id == id){
            flavorItem = item;
            return;
        }
    });
    return flavorItem;
}

function CheckAllList(){
    console.log("--------------------------------------------------------------------");
    $.each(flavorsIdList,function(i,item){
        console.log("FlavorsIdList : " + item.id + " " + item.name + " " + item.ram + " " + item.disk + " " + item.vcpus);
    });
    $.each(networksIdList,function(i,item){
        console.log("networksIdList : " + item.id + " " + item.name + " " + item.status + " " + item.subnet);
    });
    $.each(imgsIdList,function(i,item){
        console.log("imgsIdList : " + item.id + " " + item.name + " " + item.mindisk);
    });
    $.each(subnetIdList,function(i,item){
        console.log("subnetIdList : " + item.id + " " + item.name + " " + item.gwip + " " + item.cidr);
    });
    $.each(instanceIdList,function(i,item){
        console.log("InstanceIdList : " + item.id + " "+ item.name + " " + item.status + " " + item.image + " " + item.flavor + " " + item.network.toString());
    });
}

function call_api(strategy, uri, header, bd, callback, action,asyncData = true){
    if(strategy == "GET"){
        $.ajax(
            {
                url: uri,
                type:strategy,
                headers:header,
                async:asyncData,
                success: function(data, textStatus, request) {                                
                    if(action == "getImgs"){
                        $.each(data.images,function(i,item){
                            var obj = {
                                id:'',
                                name:'',
                                mindisk:'',
                                status:'',
                                imgType:''
                            }
                            obj.id = item.id;
                            obj.name = item.name;
                            imgsIdList.push(obj);
                        });
                        // $.each(imgsIdList,function(i,item){
                        //     console.log(item.name.toString() +' : '+ item.id.toString());                                        
                        // });
                    }
                    else if(action == "getImgDetail"){
                        tempImg = data;
                    }
                    else if(action == "getNetworks"){
                        $.each(data.networks,function(i,item){
                            // console.log(item.id);
                            var obj = {
                                name:'',
                                id:'',
                                status:'',
                                subnet:'',
                                cidr:'',
                                isExternal:''
                            };
                            obj.name = item.name;
                            obj.id = item.id;
                            networksIdList.push(obj);
                        });
                        // console.log(data);
                        // show network name and id
                        // $.each(networksIdList,function(i,item){
                        //     console.log("network " + item.name.toString() +' : '+ item.id.toString());                                        
                        // });
                    }
                    else if(action == "getNetworkDetail"){
                        // console.log(data);
                        tempNetwork = data;
                        // console.log(data);
                    }
                    else if(action == "getServers"){
                        $.each(data.servers,function(i,item){
                            // console.log(item.id);
                            var obj = {
                                name:'',
                                id:'',
                                status:'',
                                network:[],
                                image:'',
                                flavor:'',
                            };
                            obj.id = item.id;
                            obj.name = item.name;
                            window.instanceIdList.push(obj);

                        });                        
                        // $.each(instanceIdList,function(i,item){
                        //     console.log(item.name.toString() +' : '+ item.id.toString());                                        
                        // });
                    }
                    else if(action == "getServerDetail"){
                        tempServer = data;
                    }
                    else if(action == "getFlavors"){
                        $.each(data.flavors,function(i,item){
                            var obj = {
                                name:'',
                                id:'',
                                ram:'',
                                disk:'',
                                vcpus:''
                            };
                            obj.id = item.id;
                            obj.name = item.name;
                            flavorsIdList.push(obj);
                        });
                        // $.each(flavorsIdList,function(i,item){
                        //     console.log(item.name.toString() +' : '+ item.id.toString());                                        
                        // });
                    }
                    else if(action == "getFlavorDetail"){
                        tempFlavor = data;
                    }
                    else if(action == "getSubnets"){
                        $.each(data.subnets,function(i,item){
                            var obj = {
                                name:'',
                                id:'',
                                gwip:'',
                                cidr:''
                            };
                            
                            obj.id = item.id;
                            obj.name = item.name;
                            obj.gwip = item.gateway_ip;
                            obj.cidr = item.cidr;                            
                            
                            subnetMap[item.id] = item.cidr;
                            subnetIdList.push(obj);
                        });
                        // $.each(subnetIdList,function(i,item){
                        //     console.log("subnet " + item.name.toString() +' : '+ item.id.toString()+ ' '+item.gwip + ' '+item.cidr);
                        // });
                    }
                    else if(action == "getSubnetDetail"){
                        console.log(data);
                    }
                    else if(action == "getProjects"){
                        
                        for(i = 1;i<data.projects.length;i++){                            
                            projToken.push(data.projects[i].id);
                        }
                        console.log(projToken);
                        
                    }
                    else{
                        console.log("unknown");
                    }
                },
                error: function(msg){
                    console.log(msg)
                }                            
            }
        );
    }else if(strategy == "POST"){
        $.ajax(
            {
                url: uri,
                type:strategy,
                headers:header,
                async:asyncData,
                data:JSON.stringify(bd),
                success: function(data, textStatus, request) {
                    // X-Subject-Token
                    if(action == "getAuth"){
                        x_auth_tokens = request.getResponseHeader('X-Subject-Token');
                        console.log(x_auth_tokens);
                    }
                    else if(action == "createNetwork"){
                        createNetworkId = data.network.id;                        
                    }
                    else if(action == "createSubnet"){
                        // console.log(data);
                    }
                    else if(action == "createServer"){
                        // console.log(data);
                    }
                    else if(action == "startServer"){
                        // console.log("Start Success");
                    }else if(action == "stopServer"){
                        // console.log("Stop Success");
                    }else if(action == "rebootServer"){
                        // console.log("Reboot Success");
                    }else if(action == "deleteServer"){
                        // console.log("Delete Success")
                    }
                    else{
                        console.log("unknown");
                    }
                },
                error: function(msg){
                    console.log(msg);
                }
            }
        );
    }else if(strategy == "DELETE"){
        $.ajax(
            {
                url: uri,
                type:strategy,
                headers:header,
                async:asyncData,                
                success: function(data, textStatus, request) {                    
                    if(action == "deleteServer"){
                        console.log("Delete Success");
                    }
                    else if(action == "deleteNetwork"){
                        console.log("Delete Network Success")
                    }
                    else if(action == "deleteImage"){
                        console.log("Delete Image Success")
                    }
                    else{
                        console.log("unknown");
                    }
                },
                error: function(msg){
                    console.log(msg);
                }
            }
        );
    }else{
        console.log("Unknown Strategy")
    }
} 

function getCookie(name) {
    const value = `; ${document.cookie}`;
    const parts = value.split(`; ${name}=`);
    if (parts.length === 2) return parts.pop().split(';').shift();
}

function proj_selected(proj_sel_num){
    document.cookie = 'proj_num='+proj_sel_num;
    projNumber = proj_sel_num;
    location.reload();
}

$(document).ready(function () {

    $('#sidebarCollapse').click(function () {
        $('#sidebar').toggleClass('active');
    });
})