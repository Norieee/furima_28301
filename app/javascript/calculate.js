window.addEventListener('load', function(){
  const price = document.getElementById('item-price');
  const addTaxPrice = document.getElementById('add-tax-price');
  const profit = document.getElementById('profit');

  price.addEventListener('input', (e) => {
    const innerPrice = price.value;
    const tax = innerPrice / 10;
    const pro = innerPrice - tax;
    addTaxPrice.innerHTML = tax;
    profit.innerHTML = pro;
  });
});