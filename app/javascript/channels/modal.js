document.addEventListener("DOMContentLoaded", function() {
  const deleteButtons = document.querySelectorAll(".delete-room-btn");
  const modal = new bootstrap.Modal(document.getElementById("deleteModal"));
  const modalRoomImage = document.getElementById("modal-room-image");
  const modalRoomName = document.getElementById("modal-room-name");
  const modalRoomPrice = document.getElementById("modal-room-price");
  const modalDeleteButton = document.getElementById("modal-delete-button");

  deleteButtons.forEach(button => {
    button.addEventListener("click", function(event) {
      event.preventDefault();

      const roomId = this.dataset.roomId;
      const roomName = this.dataset.roomName;
      const roomPrice = this.dataset.roomPrice;
      const roomImage = this.dataset.roomImage;

      modalRoomImage.src = roomImage;
      modalRoomName.textContent = roomName;
      modalRoomPrice.textContent = `¥ ${roomPrice} / 日`;
      modalDeleteButton.setAttribute("formaction", `/rooms/${roomId}`);

      modal.show();
    });
  });
});
