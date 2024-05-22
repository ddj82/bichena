
function insertchk() {
		var istrue = true;
		
		var id = document.getElementById('id');
		var pw = document.getElementById('pw');
		var pw1 = document.getElementById('pw1');
		var name = document.getElementById('name');
		var nick = document.getElementById('nick');
		var birth = document.getElementById('birth');
		var tel = document.getElementById('tel');
		var email = document.getElementById('email');
		var postcode = document.getElementById('postcode');
		var address = document.getElementById('address');
		var detail = document.getElementById('detailAddress');
		
		var idPattern = /^[A-Za-z]{1}[A-Za-z0-9]{8,}$/;
		var pwPattern = /^(?=.*[a-zA-Z])(?=.*[!@#$%^*+=-])(?=.*[0-9]).{8,15}$/;
		var emailPattern = /^[a-zA-Z0-9._-]+@[a-zA-Z0-9.-]+\.[a-zA-Z]{2,4}$/i;
		var namePattern = /^[가-힣a-zA-Z]+$/;
		var nickPattern = /^[가-힣a-zA-Z]+$/;
		
		var idErrorMessage = document.getElementById('idErrorMessage');
		var pwErrorMessage = document.getElementById('pwErrorMessage');
		var pw1ErrorMessage = document.getElementById('pw1ErrorMessage');
		var emailNoneMessage = document.getElementById('emailNoneMessage');
		var postcodeErrorMessage = document.getElementById('postcodeErrorMessage');
		var addressErrorMessage = document.getElementById('addressErrorMessage');
		var detailErrorMessage = document.getElementById('detailErrorMessage');
		var nickErrorMessage = document.getElementById('nickErrorMessage');
		
		
		if (id.value.trim() === '' || !idPattern.test(id.value)) {
        	id.focus();
        	idErrorMessage.style.display = 'block';
        	istrue = false;
    	}
		if(pw.value == '' || pw.value == null || !pwPattern.test(pw.value)) {
			pw.focus();
			pwErrorMessage.style.display = 'block';
			istrue = false;
		}
		if(pw1.value != pw.value) {
			pw1.focus();
			pw1ErrorMessage.style.display = 'block';
			istrue = false;
		}
		if(name.value == '' || !namePattern.test(name.value)) {
			name.focus();
			istrue = false;
		}
		if(!nickPattern.test(nick.value)) {
			nick.focus();
			nickErrorMessage.style.display = 'block';
			istrue = false;
		}
		if(birth.value == '' || birth.value == null) {
			birth.focus();
			istrue = false;
		}
		if(email.value == '' || email.value == null || !emailPattern.test(email.value)) {
			email.focus();
			emailErrorMessage.style.display = 'block'
			istrue = false;
		}
		if(postcode.value == '' || postcode.value == null) {
			postcode.focus();
			postcodeErrorMessage.style.display = 'block';
			istrue = false;
		}
		if(address.value == '' || address.value == null) {
			address.focus();
			addressErrorMessage.style.display = 'block';
			istrue = false;
		}
		if(detail.value == '' || detail.value == null) {
			detail.focus();
			detailErrorMessage.style.display = 'block';
			istrue = false;
		}
		
		if(cnt == 0) {
			istrue = false;
		}
		if(nickCheck == 0) {
			istrue = false;
		}
		if(emailCheck == 0) {
			istrue = false;
		}
		if(!istrue){
			alert('입력한 정보를 다시 확인해주세요.');
		}
		console.log(istrue);
		return istrue;
		
	}

	function idInput() {
		var id = document.getElementById('id');
		var idErrorMessage = document.getElementById('idErrorMessage');
		var idNoneMessage = document.getElementById('idNoneMessage');
		var idCheckMessage = document.getElementById('idCheckMessage');

		id.focus();

		id.addEventListener('input', function() {
			var pattern = /^[A-Za-z]{1}[A-Za-z0-9]{8,}$/; // 정규 표현식 패턴
			var idvalue = id.value;
			if(idvalue == '') {
				idNoneMessage.style.display = 'block';
				idErrorMessage.style.display = 'none'; // Display error message				
				idCheckMessage.style.display = 'none'; // Display error message				
			} else if(!pattern.test(idvalue)) {
				idErrorMessage.style.display = 'block'; // Display error message				
				idCheckMessage.style.display = 'none'; // Display error message				
				idNoneMessage.style.display = 'none'; // Display error message				
			} else {
				idErrorMessage.style.display = 'none'; // Hide error message
				idNoneMessage.style.display = 'none';
			}
		});
	}
	function pwInput() {
		var pw = document.getElementById('pw');
		var pwErrorMessage = document.getElementById('pwErrorMessage');

		pw.focus(); // Focus on the input field

		pw.addEventListener('input', function() {
			var pattern = /^(?=.*[a-zA-Z])(?=.*[!@#$%^*+=-])(?=.*[0-9]).{8,15}$/; // 정규 표현식 패턴
			var pwvalue = pw.value.trim();
			if(!pattern.test(pwvalue)) {
				pwErrorMessage.style.display = 'block'; // Display error message				
			} else {
				pwErrorMessage.style.display = 'none'; // Hide error message
			}
		});
	}
	
	function nickInput() {
		var nick = document.getElementById('nick');
		var nickErrorMessage = document.getElementById('nickErrorMessage');

		nick.focus(); // Focus on the input field

		nick.addEventListener('input', function() {
			var pattern = /^[가-힣a-zA-Z]+$/; // 정규 표현식 패턴
			var nickvalue = nick.value.trim();
			if(!pattern.test(nickvalue)) {
				nickErrorMessage.style.display = 'block'; // Display error message				
			} else {
				nickErrorMessage.style.display = 'none'; // Hide error message
			}
		});
	}
	
	function pw1Input() {
		var pw1 = document.getElementById('pw1');
		var pw1ErrorMessage = document.getElementById('pw1ErrorMessage');
		var pw = document.getElementById('pw');
		
		pw1.focus(); // Focus on the input field

		pw1.addEventListener('input', function() {
			var pw1value = pw1.value.trim();
			if (pw1value == '' || pw1value != pw.value.trim()) {
				pw1ErrorMessage.style.display = 'block'; // Display error message
			} else {
				pw1ErrorMessage.style.display = 'none'; // Hide error message
			}
		});
	}
	function nameInput() {
		var name = document.getElementById('name');
		var nameErrorMessage = document.getElementById('nameErrorMessage');

		name.focus(); // Focus on the input field

		name.addEventListener('input', function() {
			var namevalue = name.value.trim();
			var pattern = /^[가-힣a-zA-Z]+$/;
			if (!pattern.test(namevalue)) {
				nameErrorMessage.style.display = 'block'; // Display error message
			} else {
				nameErrorMessage.style.display = 'none'; // Hide error message
			}
		});
	}
	
	function birthInput() {
		var birth = document.getElementById('birth');
		var birthErrorMessage = document.getElementById('birthErrorMessage');

		birth.focus(); // Focus on the input field

		birth.addEventListener('input', function() {
			var birthvalue = birth.value.trim();
			if (birthvalue == "") {
				birthErrorMessage.style.display = 'block'; // Display error message
			} else {
				birthErrorMessage.style.display = 'none'; // Hide error message
			}
		});
	}
	function telInput() {
		var tel = document.getElementById('tel');
		var telErrorMessage = document.getElementById('telErrorMessage');

		tel.focus(); // Focus on the input field

		tel.addEventListener('input', function() {
			var telvalue = tel.value.trim();
			if (telvalue == "") {
				telErrorMessage.style.display = 'block'; // Display error message
			} else {
				telErrorMessage.style.display = 'none'; // Hide error message
			}
		});
	}
	function emailInput() {
		var email = document.getElementById('email');
		var emailErrorMessage = document.getElementById('emailErrorMessage');
		var emailNoneMessage = document.getElementById('emailNoneMessage');		

		email.focus(); // Focus on the input field

		email.addEventListener('input', function() {
			var emailPattern = /^[a-zA-Z0-9._-]+@[a-zA-Z0-9.-]+\.[a-zA-Z]{2,4}$/i;
			var emailvalue = email.value.trim();
			if (emailvalue == "") {
				emailNoneMessage.style.display = 'block';
				emailErrorMessage.style.display = 'none';						
			} else if (!emailPattern.test(emailvalue)){
				emailErrorMessage.style.display = 'block';						
				emailNoneMessage.style.display = 'none';
			} else {
				emailErrorMessage.style.display = 'none';
				emailNoneMessage.style.display = 'none';
			}
		});
	}
	function postcodeInput() {
		var postcode = document.getElementById('postcode');
		var postcodeErrorMessage = document.getElementById('postcodeErrorMessage');

		postcode.focus(); // Focus on the input field

		postcode.addEventListener('blur', function() {
			var postcodevalue = postcode.value.trim();
			if (postcodevalue == "") {
				postcodeErrorMessage.style.display = 'block'; // Display error message
			} else {
				postcodeErrorMessage.style.display = 'none'; // Hide error message
			}
		});
	}
	function addressInput() {
		var address = document.getElementById('address');
		var addressErrorMessage = document.getElementById('addressErrorMessage');

		address.focus(); // Focus on the input field

		address.addEventListener('blur', function() {
			var addressvalue = address.value.trim();
			if (addressvalue == "") {
				addressErrorMessage.style.display = 'block'; // Display error message
			} else {
				addressErrorMessage.style.display = 'none'; // Hide error message
			}
		});
	}
	function detailInput() {
		var detail = document.getElementById('detailAddress');
		var detailErrorMessage = document.getElementById('detailErrorMessage');

		detail.focus(); // Focus on the input field

		detail.addEventListener('blur', function() {
			var detailvalue = detail.value.trim();
			if (detailvalue == "") {
				detailErrorMessage.style.display = 'block'; // Display error message
			} else {
				detailErrorMessage.style.display = 'none'; // Hide error message
			}
		});
	}