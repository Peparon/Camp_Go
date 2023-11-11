$(document).on('turbolinks:load', function () {
  // 今日の日付を取得
  var today = new Date();

  // 開始日のdatepickerを初期化
  $('#start_datepicker').datepicker({
    dateFormat: 'mm/dd',
    minDate: today, // 今日以降の日付のみ選択可能
    autoclose: true,
    todayHighlight: true,
  });

  // 終了日のdatepickerを初期化
  $('#end_datepicker').datepicker({
    dateFormat: 'mm/dd',
    minDate: today, // 今日以降の日付のみ選択可能
    autoclose: true,
    todayHighlight: true,
  });
  
  // 開始日が選択されたときのイベントリスナーを追加
  $('#start_datepicker').on('change', function () {
    // 開始日の選択された日付を取得
    var selectedStartDate = $('#start_datepicker').datepicker('getDate');
    
    // 終了日のdatepickerのminDateを開始日の選択された日付以降に設定
    $('#end_datepicker').datepicker('option', 'minDate', selectedStartDate);
  });
});
