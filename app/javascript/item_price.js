window.addEventListener('load', function() {
  const priceInput = document.getElementById("item-price");
  const addTaxDom = document.getElementById("add-tax-price");
  const profits = document.getElementById("profit");

  priceInput.addEventListener("input", () => {
    const inputValue = parseFloat(priceInput.value); 
    
    const taxAmount = Math.floor(inputValue * 0.1); 
    addTaxDom.innerHTML = taxAmount; 

    const profit = inputValue - taxAmount; 
    profits.innerHTML = profit; 
  });
});