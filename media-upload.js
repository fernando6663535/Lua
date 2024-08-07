// Abre o crea una base de datos IndexedDB
let db;
const request = indexedDB.open("mediaDatabase", 1);

request.onupgradeneeded = function(event) {
    db = event.target.result;
    db.createObjectStore("media", { keyPath: "id", autoIncrement: true });
};

request.onsuccess = function(event) {
    db = event.target.result;
    loadMediaFromIndexedDB();
};

request.onerror = function(event) {
    console.error("Database error: " + event.target.errorCode);
};

// Función para manejar la vista previa de los archivos subidos
function handleFileUpload(event, type) {
    const file = event.target.files[0];
    const errorMessage = document.getElementById('error-message');
    
    if (!file) {
        showError("No file selected.");
        return;
    }

    if (type === 'video' && !file.type.startsWith('video/')) {
        showError("Invalid file type for video. Please select a video file.");
        return;
    }

    if (type === 'image' && !file.type.startsWith('image/')) {
        showError("Invalid file type for image. Please select an image file.");
        return;
    }

    if (type === 'audio' && !file.type.startsWith('audio/')) {
        showError("Invalid file type for audio. Please select an audio file.");
        return;
    }

    const reader = new FileReader();
    const loader = document.getElementById('loader');

    // Mostrar el loader antes de empezar a leer el archivo
    if (type === 'video') {
        loader.classList.remove('hidden');
    }

    reader.onload = function(e) {
        const fileUrl = e.target.result;
        if (type === 'profile') {
            saveProfileImageToIndexedDB(fileUrl);
            displayProfileImage(fileUrl);
        } else {
            saveFileToIndexedDB(fileUrl, type);
            displayMedia(fileUrl, type);
        }

        // Ocultar el loader después de completar la carga
        if (type === 'video') {
            loader.classList.add('hidden');
        }
    };

    reader.onerror = function() {
        showError("Error reading the file. Please try again.");
    };

    reader.readAsDataURL(file);
}

// Función para mostrar un mensaje de error
function showError(message) {
    const errorMessage = document.getElementById('error-message');
    errorMessage.textContent = message;
    errorMessage.classList.remove('hidden');
    setTimeout(() => {
        errorMessage.classList.add('hidden');
    }, 5000); // Ocultar el mensaje después de 5 segundos
}

// Función para guardar la imagen de perfil en IndexedDB
function saveProfileImageToIndexedDB(fileUrl) {
    const transaction = db.transaction(["media"], "readwrite");
    const objectStore = transaction.objectStore("media");
    objectStore.put({ id: 'profileImage', fileUrl, type: 'profile' });
}

// Función para cargar la imagen de perfil desde IndexedDB
function loadProfileImageFromIndexedDB() {
    const transaction = db.transaction(["media"], "readonly");
    const objectStore = transaction.objectStore("media");
    const request = objectStore.get('profileImage');

    request.onsuccess = function(event) {
        const profileData = event.target.result;
        if (profileData) {
            displayProfileImage(profileData.fileUrl);
        }
    };
}

// Función para mostrar la imagen de perfil en la vista previa
function displayProfileImage(fileUrl) {
    const profileImage = document.getElementById('profile-image');
    profileImage.src = fileUrl;
}

// Función para guardar el archivo en IndexedDB
function saveFileToIndexedDB(fileUrl, type) {
    const transaction = db.transaction(["media"], "readwrite");
    const objectStore = transaction.objectStore("media");
    objectStore.add({ fileUrl, type });
}

// Función para cargar los archivos desde IndexedDB
function loadMediaFromIndexedDB() {
    const transaction = db.transaction(["media"], "readonly");
    const objectStore = transaction.objectStore("media");
    const request = objectStore.getAll();

    request.onsuccess = function(event) {
        const mediaData = event.target.result;
        mediaData.forEach(media => {
            if (media.type === 'profile') {
                displayProfileImage(media.fileUrl);
            } else {
                displayMedia(media.fileUrl, media.type);
            }
        });
    };
}

// Función para mostrar el archivo en la vista previa
function displayMedia(fileUrl, type) {
    const mediaPreview = document.getElementById('media-preview');
    const mediaElement = document.createElement(type === 'image' ? 'img' : (type === 'video' ? 'video' : 'audio'));

    mediaElement.src = fileUrl;
    mediaElement.controls = type === 'video' || type === 'audio';
    mediaElement.autoplay = type === 'audio'; // Reproducción automática para audio
    mediaElement.loop = type === 'audio'; // Opcional: Repetir el audio
    mediaElement.alt = `Uploaded ${type.charAt(0).toUpperCase() + type.slice(1)}`;
    
    // Ajustar el tamaño de las imágenes y videos
    if (type !== 'audio') { // No aplicar estilo a audio
        mediaElement.style.maxWidth = '150px'; // Ajustar el tamaño
        mediaElement.style.maxHeight = '150px'; // Ajustar el tamaño
    }

    mediaPreview.appendChild(mediaElement);
}

// Función para eliminar todos los archivos
function clearAllMedia() {
    const transaction = db.transaction(["media"], "readwrite");
    const objectStore = transaction.objectStore("media");
    const request = objectStore.clear();

    request.onsuccess = function() {
        const mediaPreview = document.getElementById('media-preview');
        while (mediaPreview.firstChild) {
            mediaPreview.removeChild(mediaPreview.firstChild);
        }
    };
}

// Agregar eventos a los botones y campos de entrada de archivo
document.getElementById('upload-image-button').addEventListener('click', () => {
    document.getElementById('upload-image-input').click();
});

document.getElementById('upload-video-button').addEventListener('click', () => {
    document.getElementById('upload-video-input').click();
});

document.getElementById('upload-audio-button').addEventListener('click', () => {
    document.getElementById('upload-audio-input').click();
});

document.getElementById('clear-all-button').addEventListener('click', () => {
    clearAllMedia();
});

document.getElementById('upload-image-input').addEventListener('change', (event) => {
    handleFileUpload(event, 'image');
});

document.getElementById('upload-video-input').addEventListener('change', (event) => {
    handleFileUpload(event, 'video');
});

document.getElementById('upload-audio-input').addEventListener('change', (event) => {
    handleFileUpload(event, 'audio');
});

// Cargar la imagen de perfil desde IndexedDB cuando se carga la página
loadProfileImageFromIndexedDB();