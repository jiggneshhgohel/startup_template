// Reference: http://developmentmode.wordpress.com/2011/05/09/defining-custom-functions-on-jquery/
(function ($) {

  doctorsListingContainer = function() {
    return $('.doctors-listing-container');
  };

  findDoctorRowContainingGivenRemoveBtn = function(removeBtn) {
    return removeBtn.closest('.doctor-row');
  };

  extractDoctorRemovePathFromGivenRemoveBtn = function(removeBtn) {
    return removeBtn.attr('data-remove-path');
  };

  doctorNameFromGivenDoctorRow = function(doctorRow) {
    return doctorRow.find('.doctor-name').attr('data-name');
  };

  removeDoctorForm = function() {
    return $('.remove-doctor-form-container form');
  };

  bindClickEventOnGivenRemoveDoctorBtn = function(removeBtn) {
    removeBtn.off('click').on('click', function() {
      var removePath = extractDoctorRemovePathFromGivenRemoveBtn(removeBtn);

      var doctorRow = findDoctorRowContainingGivenRemoveBtn(removeBtn);

      var doctorName = doctorNameFromGivenDoctorRow(doctorRow);

      var message = "Are you sure you want to remove the doctor '" + doctorName + "'?";
      var result = confirm(message);

      if (result) {
        var formObj = removeDoctorForm();

        formObj.attr('action', removePath)
        formObj.submit();
      }
    });
  }

  bindClickEventOnRemoveDoctorButtons = function() {
    var removeBtns = doctorsListingContainer().find('.remove-doctor');

    removeBtns.each(function() {
      var btn = $(this);

      bindClickEventOnGivenRemoveDoctorBtn(btn);
    });
  }

}(jQuery));

$(document).ready(function(){
  if (doctorsListingContainer().length > 0) {
    bindClickEventOnRemoveDoctorButtons();
  }
});
