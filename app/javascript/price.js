function price (){
  const price = document.getElementById("item-price");
  price.addEventListener("keyup", () => {
    const taxCount = Math.floor(price.value * 0.1);
    const tax = document.getElementById("add-tax-price");
    tax.innerHTML = `${taxCount}`;

    const profitCount = price.value - taxCount;
    const profit = document.getElementById("profit");
    profit.innerHTML = `${profitCount}`
  });
};

window.addEventListener('load' , price );