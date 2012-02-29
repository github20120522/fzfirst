// insertAdjacentHTML(), insertAdjacentText() and insertAdjacentElement()
// for Netscape 6/Mozilla by Thor Larholm me@jscript.dk
// Usage: include this code segment at the beginning of your document
// before any other Javascript contents.

if(typeof HTMLElement!="undefined" && !HTMLElement.prototype.insertAdjacentElement){
	HTMLElement.prototype.insertAdjacentElement = function(where,parsedNode)
	{		
		switch (where){
			case 'beforeBegin':
				this.parentNode.insertBefore(parsedNode,this)
				break;
			case 'afterBegin':
				this.insertBefore(parsedNode,this.firstChild);
				break;
			case 'beforeEnd':				
				this.appendChild(parsedNode);
				break;
			case 'afterEnd':
				if (this.nextSibling) 
					this.parentNode.insertBefore(parsedNode,this.nextSibling);
				else this.parentNode.appendChild(parsedNode);
				break;
		}
	}

	HTMLElement.prototype.insertAdjacentHTML = function(where,htmlStr)
	{
		var r = this.ownerDocument.createRange();
		r.setStartBefore(this);
		var parsedHTML = r.createContextualFragment(htmlStr);
		this.insertAdjacentElement(where,parsedHTML)
	}


	HTMLElement.prototype.insertAdjacentText = function(where,txtStr)
	{
		var parsedText = document.createTextNode(txtStr)
		this.insertAdjacentElement(where,parsedText)
	}
}

/**=============================================功能解释==================================================
* 功能：绘制证件打印的调整版面
* 参数：certSize    
*				数组，证件大小[width,height]，单位cm(1cm=37.795px)。例如：[19.5,19.5]。
*       certData    
*				字符串，证件数据，以逗号分隔。例如："'姓名','性别','国籍'"。
*       certDataPos 
*				字符串，证件数据的位置[top,left]，单位px。例如："[['180px','100px'],['200px','100px']]"。
*       certBackImg 
*				字符串，证件背景图相对地址。例如："img/marry.jpg"。
*=======================================================================================================**/
/**=============================================修改历史====================================================
* version  changelog                                                           date
* ==========================================================================================================
* 0.3.0    修改函数drawCert(certSize,certBackImg,certData,certDataPos)，       2006-12-22   
*          调整为drawCert(certSize,certData,certDataPos,certBackImg)，
*          这样可以有背景也可以没有背景
*=========================================================================================================**/
function drawCert(certSize,certData,certDataPos,certBackImg){
	//背景容器背景的width、height
	backWidth=certSize[0]*37.795+'px';
	backHeight=certSize[1]*37.795+'px';	
	
	//证件数据	
	if(certData.charAt(0)!='['&& certData.charAt(certData.length-1)!=']')
		certData = eval("["+certData+"]");
	else
		certData = eval(certData);
	
	//证件数据位置
	certDataPos = eval(certDataPos);	
	
	//创建certPanel
	var certPanelDiv=document.createElement("div");
	
	certPanelDiv.id="certPanel"
	certPanelDiv.className="cert";
	
	certPanelDiv.style.width=backWidth;
	certPanelDiv.style.height=backHeight;	
	
	scrollPanel.insertAdjacentElement("beforeEnd",certPanelDiv);	
	
	//在certPanel上绘制背景	
	if(certBackImg)
		certPanelDiv.insertAdjacentHTML("beforeEnd","<img id='backImg' src='"+certBackImg+"' width='"+backWidth+"' height='"+backHeight+"'/>");	
	
	//在certPanel上绘制数据	
	for(i=0;i<certData.length;i++){
		var certDataSpan=document.createElement("span")
				
		certDataSpan.name="certData";
		certDataSpan.className="data";
		
		//如果数据和位置长度不一致采用默认值
		if(i<certDataPos.length){
			certDataSpan.style.top=certDataPos[i][0];
			certDataSpan.style.left=certDataPos[i][1];
		}else{
			certDataSpan.style.top=20*i+"px";
			certDataSpan.style.left=20+"px";
		}
		
		//IE支持innerText，FireFox和NetScape支持textContent不支持innerText
		if(navigator.appName.indexOf("Explorer") > -1){
			certDataSpan.innerText=certData[i];
		} else{
			certDataSpan.textContent=certData[i];
		}		
		
		//使文字能够拖动
		makeDraggable(certDataSpan);
		
		certPanelDiv.insertAdjacentElement("beforeEnd",certDataSpan)
	}
}

//存储scrollPanel宽和高的临时变量
var scrollPanelWidth;
var scrollPanelHeight;

//打印前执行动作
function bodyOnBeforePrint() {
	//存储scrollPanel宽和高
	scrollPanelWidth = scrollPanel.style.width;
	scrollPanelHeight = scrollPanel.style.height;
	
	//隐藏scrollPanel
	scrollPanel.style.width = certPanel.style.width ;
	scrollPanel.style.height = certPanel.style.height;
	scrollPanel.style.overflow="hidden";
	
	//隐藏certPanel
	certPanel.style.top=0;
	certPanel.style.left=0;
	certPanel.style.borderTopWidth=0;
	certPanel.style.borderLeftWidth=0;
	certPanel.style.borderRightWidth=0;
	certPanel.style.borderBottomWidth=0;
	
	//隐藏backImg
	backImg.style.display ="none"
}

//打印后执行动作
function bodyOnAfterPrint() {
	//显示scrollPanel
	scrollPanel.style.width = scrollPanelWidth ;
	scrollPanel.style.height = scrollPanelHeight;
	scrollPanel.style.overflow = "scroll";	
	
	//显示certPanel
	certPanel.style.top=0
	certPanel.style.left=0
	certPanel.style.borderTopWidth=2
	certPanel.style.borderLeftWidth=2
	certPanel.style.borderRightWidth=2
	certPanel.style.borderBottomWidth=2
	
	//显示backImg
	backImg.style.display ="block"
}

//收集数据的位置
function collectDataPos() {
	var posArray = [];
	//获得页面上的span元素，
	//getElementsByTagName在ie、mozilla、netscape上通用
	var dataList=document.getElementsByTagName("span");
	for(var i=0;i<dataList.length;i++){
		//过滤证件元素
		if(dataList[i].name=="certData"){			
			posArray[posArray.length]=[dataList[i].style.top,dataList[i].style.left];
		}
	}
		
	return posArray.toJSONString();
}

//添加一个数据元
//注意：需要在页面上增加一个<input type="text" id="dataDetail" value="">
function addDataObj(){
	var dataValueObj = document.getElementById("dataDetail");
	
	if(dataValueObj&&dataValueObj.value!=""){
		var certDataSpan=document.createElement("span")
					
		certDataSpan.name="certData";
		certDataSpan.className="data";
		
		//默认位置		
		certDataSpan.style.top=20+"px";
		certDataSpan.style.left=20+"px";
		
		
		//IE支持innerText，FireFox和NetScape支持textContent不支持innerText
		if(navigator.appName.indexOf("Explorer") > -1){
			certDataSpan.innerText=dataValueObj.value;
		} else{
			certDataSpan.textContent=dataValueObj.value;
		}		
		
		//使文字能够拖动
		makeDraggable(certDataSpan);
		
		//证件画板
		var certPanelDiv=document.getElementById("certPanel");
		if(certPanelDiv)		
			certPanelDiv.insertAdjacentElement("beforeEnd",certDataSpan)
			
		dataValueObj.value = "";
	}
}
