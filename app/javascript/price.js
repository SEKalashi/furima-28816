function PriceCheck() {

  const itemPrice = document.getElementById("item-price")
  const addTaxPrice = document.getElementById("add-tax-price")
  const profit = document.getElementById("profit")
  
  itemPrice.addEventListener('keyup', function(){
    const inputPrice = document.getElementById("item-price").value
    let taxPrice = inputPrice * 0.1
    addTaxPrice.innerHTML = taxPrice
    profit.innerHTML = inputPrice - taxPrice
  })
}
window.addEventListener('load', PriceCheck)