
document.addEventListener('DOMContentLoaded', () => {
	star();
});

function star() {
	const stars = document.querySelectorAll('.star');
	const ratingText = document.getElementById('rating-text');
	const ratingValue = document.getElementById('rating-value');
	let currentRating = 0;

	const ratings = {
		1: "Rất tệ",
		2: "Tệ",
		3: "Bình thường",
		4: "Tốt",
		5: "Rất tốt"
	};

	stars.forEach(star => {
		star.addEventListener('click', () => {
			const value = star.getAttribute('data-value');
			currentRating = value;
			updateRating(value);
		});

		star.addEventListener('mouseover', () => {
			highlightStars(star.getAttribute('data-value'));
		});

		star.addEventListener('mouseout', () => {
			resetHover();
		});
	});

	function updateRating(value) {
		stars.forEach(star => {
			star.classList.remove('selected');
		});
		for (let i = 0; i < value; i++) {
			stars[i].classList.add('selected');
		}
		ratingText.textContent = ratings[value];
		ratingValue.value = value;
	}

	function highlightStars(value) {
		resetHover();
		for (let i = 0; i < value; i++) {
			stars[i].classList.add('hovered');
		}
	}

	function resetHover() {
		stars.forEach(star => {
			star.classList.remove('hovered');
		});
		for (let i = 0; i < currentRating; i++) {
			stars[i].classList.add('selected');
		}
	}

	//SEND DỮ LIÊ
	function sendEvaluationToBackend(evalueData) {
		fetch('/api/evaluate', {
			method: 'POST',
			headers: {
				'Content-Type': 'application/json',
			},
			body: JSON.stringify(evalueData),
		})
			.then(response => {
				if (response.ok) {
					return response.text(); // Nếu thành công, trả về nội dung phản hồi
				} else {
					throw new Error('Đã xảy ra lỗi khi gửi đánh giá.');
				}
			})
			.then(data => {
				console.log(data); // In ra nội dung phản hồi từ server (ví dụ: "Đã nhận đánh giá thành công!")
				// Xử lý phản hồi từ server nếu cần
			})
			.catch(error => {
				console.error('Lỗi:', error); // In ra lỗi nếu xảy ra lỗi trong quá trình gửi yêu cầu hoặc nhận phản hồi
				// Xử lý lỗi nếu cần
			});
	}

	// Ví dụ: Gọi hàm sendEvaluationToBackend khi người dùng submit form đánh giá
	const submitButton = document.getElementById('submit-button');
	submitButton.addEventListener('click', function(event) {
		event.preventDefault(); // Ngăn chặn hành vi mặc định của form (nếu có)

		// Lấy dữ liệu từ form (ví dụ: quality, star, content là các trường trong form)
		const evalueData = {
			quality: document.getElementById('quality').value,
			//			star: parseInt(document.getElementById('star').value),
			content: document.getElementById('content').value
			// Thêm các trường khác nếu cần
		};

		//		sendEvaluationToBackend(evalueData); // Gửi dữ liệu đánh giá đến backend
	});

}


document.addEventListener('DOMContentLoaded', () => {
	function image() {
		let imagesArray = [];
		let inputSaveImage = document.querySelector("#file-upload");
		let showImg = document.querySelector(".show-img-div");
		let message = document.querySelector(".message");

		function isImageExists(image) {
			return imagesArray.some(existingImage => existingImage.name === image.name);
		}

		if (inputSaveImage) {
			inputSaveImage.addEventListener("change", (event) => {
				const files = event.target.files;
				const maxSize = 5 * 1024 * 1024;
				const allowedTypes = ['image/png', 'image/jpeg', 'image/jpg'];
				const newImageCount = files.length;

				for (let index = 0; index < files.length; index++) {
					const image = files[index];

					if (!isImageExists(image)) {
						if (newImageCount > 4) {
							message.innerHTML = "Bạn chỉ có thể tải lên tối đa 4 ảnh.";
							message.style.cssText = "background-color:#f8d7da; color:#b71c1c";
							inputSaveImage.value = '';
							return;
						} else if (image.size > maxSize) {
							message.innerHTML = "Kích thước file ảnh quá lớn, vui lòng chọn file khác.";
							message.style.cssText = "background-color: #f8d7da; color:#b71c1c";
							return;
						} else if (!allowedTypes.includes(image.type)) {
							message.innerHTML = "Loại file không hợp lệ, vui lòng chọn file ảnh có định dạng PNG, JPEG hoặc JPG.";
							message.style.cssText = "background-color: #f8d7da; color:#b71c1c";
							return;
						} else {
							message.innerHTML = "";
							message.style.cssText = "";
							imagesArray.push(image);
						}
					}
				}
				displayImage();
			});
		} else {
			console.log("Element with id 'file-upload' not found.");
		}

		function displayImage() {
			showImg.innerHTML = "";
			imagesArray.forEach((imageFile, index) => {
				const img = document.createElement('img');
				img.src = URL.createObjectURL(imageFile);
				img.alt = 'image';

				const span = document.createElement('span');
				span.textContent = '×';
				span.style.cursor = 'pointer';
				span.onclick = function() {
					imagesArray.splice(index, 1);
					displayImage();
				};

				const imageContainer = document.createElement('div');
				imageContainer.classList.add('image');
				imageContainer.appendChild(img);
				imageContainer.appendChild(span);

				showImg.appendChild(imageContainer);
			});
		}
	}

	image();
});


//CHECK TEXT
document.addEventListener('DOMContentLoaded', () => {
	document.getElementById("quality").addEventListener('change', function(event) {
		let inputQuality = document.getElementById('quality');
		let errorNameQuality = document.getElementById('errorQuality');

		checkText(inputQuality, errorNameQuality);
	});

	document.getElementById("content").addEventListener('change', function(event) {
		let inputContent = document.getElementById('content');
		let errorNameContent = document.getElementById('errorContent');

		checkText(inputContent, errorNameContent);
	});
});

function checkText(input, errorName) {


		////////////////////////////////////////////////////////////////////////////////////////////////////
		// In this section, we set the user authentication, user and app ID, model details, and the URL
		// of the text we want as an input. Change these strings to run your own example.
		///////////////////////////////////////////////////////////////////////////////////////////////////

		// Your PAT (Personal Access Token) can be found in the Account's Security section
		const PAT = 'c9bcfa03a89c476b91936cab785c8b0d';
		// Specify the correct user_id/app_id pairings
		// Since you're making inferences outside your app's scope
		const USER_ID = 'gnwcvstmaqvo';
		const APP_ID = "my-first-application-b21dep";
		// Change these to whatever model and text URL you want to use
		const MODEL_ID = 'moderation-multilingual-text-classification';
		const MODEL_VERSION_ID = '79c2248564b0465bb96265e0c239352b';
		const RAW_TEXT = input.value;
		// To use a hosted text file, assign the url variable
		// const TEXT_FILE_URL = 'https://samples.clarifai.com/negative_sentence_12.txt';
		// Or, to use a local text file, assign the url variable
		// const TEXT_FILE_BYTES = 'YOUR_TEXT_FILE_BYTES_HERE';

		///////////////////////////////////////////////////////////////////////////////////
		// YOU DO NOT NEED TO CHANGE ANYTHING BELOW THIS LINE TO RUN THIS EXAMPLE
		///////////////////////////////////////////////////////////////////////////////////

		const raw = JSON.stringify({
			"user_app_id": {
				"user_id": USER_ID,
				"app_id": APP_ID
			},
			"inputs": [
				{
					"data": {
						"text": {
							"raw": RAW_TEXT
							// url: TEXT_URL, allow_duplicate_url: true 
							// raw: fileBytes
						}
					}
				}
			]
		});

		const requestOptions = {
			method: 'POST',
			headers: {
				'Accept': 'application/json',
				'Authorization': 'Key ' + PAT
			},
			body: raw
		};

		// NOTE: MODEL_VERSION_ID is optional, you can also call prediction with the MODEL_ID only
		// https://api.clarifai.com/v2/models/{YOUR_MODEL_ID}/outputs
		// this will default to the latest version_id

		//         fetch("https://api.clarifai.com/v2/models/" + MODEL_ID + "/versions/" + MODEL_VERSION_ID + "/outputs", requestOptions)
		// .then(response => response.text())
		// .then(result => console.log(result))
		// .catch(error => console.log('error', error));
		fetch("https://api.clarifai.com/v2/models/" + MODEL_ID + "/versions/" + MODEL_VERSION_ID + "/outputs", requestOptions)
			.then(response => response.text()) // Read the response as text
			.then(result => {
				console.log(result); // Log the raw response
				return JSON.parse(result); // Parse the raw response as JSON
			})
			.then(result => {
				try {
					// Process the result
					if (result.outputs && result.outputs.length > 0) {
						const concepts = result.outputs[0].data.concepts;
						const toxicConcept = concepts.find(concept => concept.name === 'toxic');
						if (toxicConcept && toxicConcept.value >= 0.01) {
							errorName.innerText = "Câu không phù hợp";
							input.value = '';
						} else {
							errorName.innerText = "*";
						}
					} else {
						errorName.innerText = "Không có dữ liệu phản hồi.";
					}
				} catch (error) {

				}
			})
			.catch(error => {

			});
	}
