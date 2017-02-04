<?php
	/**
	 * 会员模型类
	 */
	class MemberModel extends Model
	{
		public function __construct(){
			parent::__construct();//验证对象及本模型对象
			$this->_fields = array('id','user','pass','data');
			$this->_tables = array(DB_FREFIX.'member');
			$this->_checkObj = new MemberCheck();
		}
		/**
		 * 添加会员方法
		 */
		public function addMember(){
			list($_user)= $this->getRequest()->getParam(array($_POST['user']));
			$_where = array("user='$_user'");
			if(!$this->_checkObj->addCheck($this,$_where)){
				$this->_checkObj->error();
			}
			$_addData = $this->getRequest()->add($this->_fields);
			$_addData['pass'] = md5($_addData['pass']);
			$_addData['last_ip'] = $_SERVER["REMOTE_ADDR"];
			$_addData['data'] = time();
			return parent::add($_addData);
		}

		/**
		 * 验证会员名称是否重复
		 * @param [type:array] $_where [会员名]
		 */
		public function OneMember(Array $_param){
			return parent::isOne($_param);
		}

		//获取条数
		public function totalMember(){
			return parent::total();
		}

		//删除指定内容
		public function deleteMember(){
			list($_id) = $this->getRequest()->getParam(array($_GET['id']));
			$_where = array("id='{$_id}'");
			if(!$this->_checkObj->findOneCheck($this,$_where)){
				$this->_checkObj->error();
			}
			return parent::delete($_where);
		}

		//获取指定的一条数据
		public function findOneMember($_member = ''){
			if(!$_member){
				list($_id) = $this->getRequest()->getParam(array($_GET['id']));
				$_where = array("id='{$_id}'");
				if(!$this->_checkObj->findOneCheck($this,$_where)){
					$this->_checkObj->error();
				}
			}else{
				$_where = array("user = '$_member'");
			}
			return parent::select(array('id'),array('where'=>$_where,'limit' =>'1'));
		}

/*		//获取指定的一条登录数据
		public function findOneLogin(){
			list($_user) = $this->getRequest()->getParam(array($_POST['user']));
			$this->_tables = array(DB_FREFIX.'member a',DB_FREFIX.'level b');
			return parent::select(array('a.id','a.user','a.login_count','a.last_time','a.last_ip','a.level','b.level_name'),array('where'=>array('a.level=b.id',"user='$_user'"),'limit' =>$this->_limit,'order'=>'a.id asc'));
		}*/

/*		//修改指定的一条数据
		public function updateMember(){
			list($_id) = $this->getRequest()->getParam(array($_GET['id']));
			$_where = array("id='{$_id}'");
			if(!$this->_checkObj->findOneCheck($this,$_where)){
				$this->_checkObj->error();
			}
			if(!$this->_checkObj->updateCheck($this)){
				$this->_checkObj->error();
			}
			$_updataData = $this->getRequest()->update($this->_fields);
			$_updataData['pass'] = md5($_updataData['pass']);
			return parent::update($_updataData,array('where'=>$_where));
		}
*/

/*		//获取所有会员
		public  function  getAllMember(){
			$this->_tables = array(DB_FREFIX.'member a',DB_FREFIX.'level b');
			return $this->select(array('a.id','a.user','a.login_count','a.last_time','a.last_ip','a.level','b.level_name'),array('where'=>array("a.level=b.id"),'limit' =>$this->_limit,'order'=>'a.id asc'));
		}*/

		//检查是否会员登录数据是否正确
		public function checkLogin(){
			list($_user,$_pass) = $this->getRequest()->getParam(array($_POST['user'],$_POST['pass']));
			$_param = array("user='{$_user}'","pass='".md5($_pass)."'");
			if(!$this->_checkObj->loginCheck($this,$_POST,$_param)){
				$this->_checkObj->error();
			}else{
				return true;
			}
		}

		//修改登录会员的信息
		public function countLogin(){
			list($_user) = $this->getRequest()->getParam(array($_POST['user']));
			$_where = array("user='{$_user}'");
			$_updataData['data'] =time();
			$_updataData['last_ip'] = $_SERVER["REMOTE_ADDR"];
			$_SESSION['member'] = $_POST['user'];
			if(isset($_POST['keep']) && $_POST['keep'] == 'on'){
				setcookie('auto',$_POST['user'],time()+24*3600*7);
			}
			return parent::update($_updataData,array('where'=>$_where));
		}


		//ajax检查会员名或者密码是否正确
		public function ajaxCheckLogin($_user,$_pass){
			list($_user,$_pass) = $this->getRequest()->getParam(array($_user,$_pass));
			$_param = array("user='{$_user}'","pass='".md5($_pass)."'");
			$this->_checkObj->ajaxCheckLogin($this,$_param);
		}

		//检查验证码是否正确
		public function ajaxCheckCode(){
			list($_code) = $this->getRequest()->getParam(array($_POST['code']));
			$this->_checkObj->checkCode($_code);
		}

	}
?>