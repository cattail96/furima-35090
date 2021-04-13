window.addEventListener('load',function(){
  const itemPrice = document.getElementById("item-price");
  let rate = 0.1
  itemPrice.addEventListener("keyup",() => {
    const commissionVal = itemPrice.value;
    const addTaxPrice = document.getElementById("add-tax-price");
    addTaxPrice.innerHTML = commissionVal * rate;
    const Profit = document.getElementById("profit");
    Profit.innerHTML = Math.floor(commissionVal - commissionVal * rate);
  })
})