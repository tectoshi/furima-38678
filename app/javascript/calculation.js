function calculation (){
  const itemPrice = document.getElementById("item-price") ;
  if (!itemPrice){ return false;}
  itemPrice.addEventListener("input", () => {
    const taxPrice = Math.floor(itemPrice.value * 0.1) ;
    const addTaxPrice = document.getElementById("add-tax-price") ;
    addTaxPrice.innerHTML = `${taxPrice}`;
    const SalesProfit = itemPrice.value - taxPrice ;
    const profit = document.getElementById("profit") ;
    profit.innerHTML = `${SalesProfit}`;
  });
};

window.addEventListener('load', calculation);
