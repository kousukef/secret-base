$(function() {
    
    //最初のselectboxに初期値を渡す
    $('<option disabled selected>選択してください</option>').prependTo($('#select-first'));
    
    //selectを作るfunctionを定義
    function create_category(selected_box){
    
      //select boxの選択された値を取得
      var category_id = selected_box.val();
      // select新しく作るとき前のselect を削除する
      selected_box.nextAll('.select-box').remove();
        $.ajax({
          teype: 'GET',
          url: '/category',
          data: {category_id: category_id},
          dataType: 'json'
        }).done(function(categories){
        if ($.isEmptyObject(categories) === false){
          //新しいselectとその初期値を追加
          var select = $('<select>').attr({name: 'product[category_id]'}).addClass('form-control select-box');
          select.appendTo($('.select-boxes'));
          //新しいselectを取得
          var new_select = $('.select-box').last();
          $('<option disabled selected>選択してください</option>').appendTo(new_select);
          //送られてきたデータでselectのoption追加
          $.each(categories, function(index, category){
            $('<option>').val(category.id).text(category.name).appendTo($(new_select));
          })
        }
        })
        .fail(function(){
        alert('カテゴリー取得に失敗しました');
        });
      }
    //selectを作る
    $('.select-boxes').on('change', '.select-box', function(){
      var selected_box = $(this);
      create_category(selected_box);
    });
  });
  