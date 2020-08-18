if (document.URL.match( /new/ ) || document.URL.match( /edit/ )) {  
  document.addEventListener('DOMContentLoaded', function(){
    const ImageList = document.getElementById('image-list')

    const createImageHTML = (blob) => {
      const imageElement = document.createElement('div')
      const blobImage = document.createElement('img')
      blobImage.setAttribute('id', 'image-list-child')
      blobImage.setAttribute('src', blob)
      imageElement.appendChild(blobImage)
      ImageList.appendChild(imageElement)
    }

    document.getElementById('item-image').addEventListener('change', function(e){
      const imageContent = document.querySelector('#image-list-child');
      if (imageContent){
        imageContent.remove();
      };
      
      const file = e.target.files[0];
      const blob = window.URL.createObjectURL(file);

      createImageHTML(blob)
    });
  });
} 