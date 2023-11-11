document.addEventListener('DOMContentLoaded', function () {
    $('#reservationModal').on('show.bs.modal', function (event) {
        var button = $(event.relatedTarget); // モーダルを表示するためにクリックされたボタンを取得
        var planName = button.closest('.mb-4').data('plan-name'); // データ属性からプラン名を取得
        var planAbout = button.closest('.mb-4').data('plan-about'); // データ属性からプランの詳細情報を取得
        var planPrice = button.closest('.mb-4').data('plan-price');//データ属性からプラン価格の取得
        var campSiteId = button.closest('.mb-4').data('camp-site-id');//キャンプ場のID取得
        var planId = button.closest('.mb-4').data('plan-id');//プランのID取得

        // プラン名と詳細情報を設定
        var modal = $(this);
        modal.find('#PlanName').text(planName || '');
        modal.find('#PlanAbout').text(planAbout || '');
        modal.find('#PlanPrice').text(planPrice || '');
        
        modal.find('#camp-site-id').val(campSiteId);
        modal.find('#plan-id').val(planId);
        
    });
});
