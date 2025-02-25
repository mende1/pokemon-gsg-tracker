import { Controller } from "@hotwired/stimulus"

// Conecta ao data-controller="pokemon"
export default class extends Controller {
  toggleCaptured(event) {
    const pokemonId = event.currentTarget.dataset.pokemonId;

    fetch(`/pokemons/${pokemonId}/toggle_captured`, {
      method: "PATCH",
      headers: {
        "Content-Type": "application/json",
        "X-CSRF-Token": document.querySelector('meta[name="csrf-token"]').content,
        "Accept": "text/vnd.turbo-stream.html"
      }
    })
        .then(response => response.text())
        .then(html => Turbo.renderStreamMessage(html)); // Atualiza Turbo Stream manualmente
  }
}