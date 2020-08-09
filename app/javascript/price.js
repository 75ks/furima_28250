window.addEventListener('load', function(){
  let input = document.getElementById("item-price");
  let tax = document.getElementById("add-tax-price");
  let profit = document.getElementById("profit");
  input.addEventListener('keyup', function(){
    taxTest = 1000 * 0.1;
    profitTest = 1000 - (1000 * 0.1);
    tax.innerHTML = taxTest;
    profit.innerHTML = profitTest;
  });
});