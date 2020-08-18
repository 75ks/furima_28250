if (document.URL.match( /new/ ) || document.URL.match( /edit/ )) {
  window.addEventListener('load', function(){
    let input = document.getElementById("item-price");
    let tax = document.getElementById("add-tax-price");
    let profit = document.getElementById("profit");
    input.addEventListener('keyup', function(){
      let input_price = document.getElementById("item-price").value;
      taxTest = input_price * 0.1;
      profitTest = input_price - (input_price * 0.1);
      tax.innerHTML = taxTest;
      profit.innerHTML = profitTest;
    });
  });
}