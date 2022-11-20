function calculation (){
  const itemPrice = document.getElementById("item-price") ;
  itemPrice.addEventListener("input", () => {
    const taxPrice = itemPrice.value * 0.1 ;
    const addTaxPrice = document.getElementById("add-tax-price") ;
    addTaxPrice.innerHTML = `${Math.floor(taxPrice)}`;
    const SalesProfit = itemPrice.value - taxPrice ;
    const profit = document.getElementById("profit") ;
    profit.innerHTML = `${Math.floor(SalesProfit)}`;
  });
};

window.addEventListener('load', calculation);
