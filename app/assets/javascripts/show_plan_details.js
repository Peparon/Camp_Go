$(document).on('turbolinks:load', function() {
  $(document).on('click', '.show-plan-details', function(e) {
    e.preventDefault();
    var planId = $(this).data('plan-id');

    // Ajaxリクエストを送信
    $.ajax({
      url: '/user/camp_sites/get_plan_details', // サーバーサイドのルートへのパス
      type: 'GET',
      data: { plan_id: planId },
      success: function(response) {
        // サーバーサイドからの応答を処理
        $('#PlanName').text(response.name);
        $('#PlanAbout').text(response.about);
        $('#PlanPrice').text(response.price);
        $('#reservationModal').modal('show');
      },
      error: function(error) {
        console.error(error);
      }
    });
  });
});
