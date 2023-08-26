// window.addEventListener('load', function() {
//   const priceInput = document.getElementById("item-price");
//   const addTaxDom  = document.getElementById("add-tax-price");
//   const profits    = document.getElementById("profit");
//   priceInput.addEventListener("input", () => { 
//     const inputValue = priceInput.value;
//     console.log(inputValue);
//   });
//   addTaxDom.innerHTML = price * 0.1
// });


window.addEventListener('load', function() {
  const priceInput = document.getElementById("item-price");
  const addTaxDom = document.getElementById("add-tax-price");
  const profits = document.getElementById("profit");

  priceInput.addEventListener("input", () => {
    const inputValue = parseFloat(priceInput.value); 
    console.log(inputValue);

    const taxAmount = inputValue * 0.1; 
    addTaxDom.innerHTML = taxAmount; 

    const profit = inputValue - taxAmount; 
    profits.innerHTML = profit; 
  });
});
