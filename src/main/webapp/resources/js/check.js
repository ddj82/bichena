
function insertchk() {
		var istrue = true;
		
		var id = document.getElementById('id');
		var pw = document.getElementById('pw');
		var pw1 = document.getElementById('pw1');
		var name = document.getElementById('name');
		var gender = document.getElementById('gender');
		var birth = document.getElementById('birth');
		var tel = document.getElementById('tel');
		var email = document.getElementById('email');
		var postcode = document.getElementById('postcode');
		var address = document.getElementById('address');
		var detail = document.getElementById('detailAddress');
		
		var idPattern = /^[a-z0-9_\-]+$/;
		var pwPattern = /^[a-zA-Z0-9_\-~!@#$%^&*()]+$/;
		var birthPattern = /^(19[0-9][0-9]|20\d{2})-(0[0-9]|1[0-2])-(0[1-9]|[1-2][0-9]|3[0-1])$/;
		var telPattern = /^[0-9]{11}$/;
		var emailPattern = /^[a-zA-Z0-9_\-~!#$%^&*()]+@[a-zA-Z0-9_\-]+(\.[a-zA-Z0-9_\-]+)*$/;
		
		if(id.value == '' || id.value == null) {
			id.focus();
			istrue = false;
		}
		if(pw.value == '' || pw.value == null) {
			pw.focus();
			istrue = false;
		}
		if(pw1.value != pw.value) {
			pw1.focus();
			istrue = false;
		}
		if(name.value == '' || name.value == null) {
			name.focus();
			istrue = false;
		}
		if(gender.value == '' || gender.value == null) {
			id.focus();
			istrue = false;
		}
		if(birth.value == '' || birth.value == null) {
			birth.focus();
			istrue = false;
		}
		if(email.value == '' || email.value == null || !emailPattern.test(email.value)) {
			email.focus();
			istrue = false;
		}
		if(postcode.value == '' || postcode.value == null) {
			postcode.focus();
			istrue = false;
		}
		if(address.value == '' || address.value == null) {
			address.focus();
			istrue = false;
		}
		if(detail.value == '' || detail.value == null) {
			detail.focus();
			istrue = false;
		}
		
		if(cnt == 0) {
			alert('아이디 중복체크를 해주세요');
			istrue = false;
		}
		console.log(istrue);
		return istrue;
		
	}

	function idInput() {
		var id = document.getElementById('id');
		var idErrorMessage = document.getElementById('idErrorMessage');

		id.focus(); // Focus on the input field

		id.addEventListener('blur', function() {
			var pattern = /^[a-z0-9_\-]+$/; // 정규 표현식 패턴
			var idvalue = id.value.trim();
			if(!pattern.test(idvalue)) {
				idErrorMessage.style.display = 'block'; // Display error message				
			} else {
				idErrorMessage.style.display = 'none'; // Hide error message
			}
		});
		
		
		
	}
	function pwInput() {
		var pw = document.getElementById('pw');
		var pwErrorMessage = document.getElementById('pwErrorMessage');

		pw.focus(); // Focus on the input field

		pw.addEventListener('blur', function() {
			var pattern = /^(?=.*[a-zA-Z])(?=.*[!@#$%^*+=-])(?=.*[0-9]).{8,15}$/; // 정규 표현식 패턴
			var pwvalue = pw.value.trim();
			if(!pattern.test(pwvalue)) {
				pwErrorMessage.style.display = 'block'; // Display error message				
			} else {
				pwErrorMessage.style.display = 'none'; // Hide error message
			}
		});
	}
	function pw1Input() {
		var pw1 = document.getElementById('pw1');
		var pw1ErrorMessage = document.getElementById('pw1ErrorMessage');
		var pw = document.getElementById('pw');
		
		pw1.focus(); // Focus on the input field

		pw1.addEventListener('blur', function() {
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

		name.addEventListener('blur', function() {
			var namevalue = name.value.trim();
			if (namevalue == "") {
				nameErrorMessage.style.display = 'block'; // Display error message
			} else {
				nameErrorMessage.style.display = 'none'; // Hide error message
			}
		});
	}
	function genderInput() {
		var gender = document.getElementById('name');
		var genderErrorMessage = document.getElementById('genderErrorMessage');

		gender.focus(); // Focus on the input field

		gender.addEventListener('blur', function() {
			var gendervalue = gender.value.trim();
			if (gendervalue == "") {
				genderErrorMessage.style.display = 'block'; // Display error message
			} else {
				genderErrorMessage.style.display = 'none'; // Hide error message
			}
		});
	}
	function birthInput() {
		var birth = document.getElementById('birth');
		var birthErrorMessage = document.getElementById('birthErrorMessage');

		birth.focus(); // Focus on the input field

		birth.addEventListener('blur', function() {
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

		tel.addEventListener('blur', function() {
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

		email.addEventListener('blur', function() {
			var emailPattern = /^[a-zA-Z0-9_\-~!#$%^&*()]+@[a-zA-Z0-9_\-]+(\.[a-zA-Z0-9_\-]+)*$/;
			var emailvalue = email.value.trim();
			if (emailvalue == "") {
				emailNoneMessage.style.display = 'block';
			} else if (!emailPattern.test(emailvalue)){
				emailErrorMessage.style.display = 'block';						
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
		var detail = document.getElementById('detail');
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