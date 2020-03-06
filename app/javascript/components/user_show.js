const boxMadeClickable = () => {
  document.querySelectorAll(".link").forEach((div) => {
        div.addEventListener("click", (e) =>  {
            let url = e.target.dataset.url
            window.location = url

        })
    })
}

export { boxMadeClickable };
