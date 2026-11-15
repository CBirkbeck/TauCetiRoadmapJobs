# Review of FourierDeligneTransform (pull request #2132 at b215ba1)

**Verdict:** accepted

No findings. Incremental re-review of the 4 lines changed since ec08a18 (`TauCetiRoadmap/FourierDeligneTransform/README.md:3` and `:14`), and of the pull request's title and description against this head.

## Previous findings

- R01 — repaired: description now reads “For constant-rank vector bundles over qcqs 𝔽_p-schemes, it constructs FT_ψ … Duality is stated over Noetherian bases for bounded constructible inputs of finite Tor amplitude”; the summary block qualifies duality likewise.
- R02 — repaired: description now reads “the Euler–Poincaré formula on smooth connected affine curves over algebraically closed fields for lisse sheaves free over finite local coefficient rings, or … finite extensions of ℚ_ℓ or ℚ̄_ℓ, with ℓ ≠ p”.
- R03 — repaired: description now reads “Adds the new roadmap folder `TauCetiRoadmap/FourierDeligneTransform`: `README.md` (639 lines), `Suggested.lean` (57 lines, no declarations), and `metadata.toml` (one line).”

## Verified sound

| Statement or scope | Instances | Computed values: changed text versus target | Result | Change |
|---|---|---|---|---|
| README:3 and :14, “constant-rank vector bundle over a qcqs 𝔽_p-scheme”, against §3.2 (README:353) | S = ⊔_ℕ Spec 𝔽₃; S = Spec 𝔽₃ ⊔ Spec 𝔽₃ with ranks 0 and 1 | First: quasi-compact = false, excluded by both. Second: shift [r] would be [0] and [1]; excluded by both. | Summary and ownership equal §3.2 | none |
| README:3, duality “over Noetherian bases for bounded constructible inputs of finite Tor amplitude”, against §3.5 (README:410) | Spec 𝔽₃, r = 0, Λ = 𝔽₇, K = M = Λ; Spec 𝔽₃[x₁, x₂, …] | Control: RHom(Λ, Λ) = Λ on both sides, twist (0). Infinite polynomial ring: qcqs = true, Noetherian = false; excluded by both. | Summary equals §3.5 (S Noetherian, K ∈ Dᵇ_ctf) | none |
| README:3, “under the Tor bounds of §3.6”, against §3.6 (README:420, :438) | Λ = ℤ/9, p = 2, ψ(1) = −1, K₁ = K₂ = (ℤ/3)_{𝔸¹} | Tor_i^{ℤ/9}(ℤ/3, ℤ/3) = ℤ/3 for every i ≥ 0: K₁ ⊠ K₂ ∉ D⁺; ψ(1) − 1 = −2 = 7, a unit. | Bound needed and now stated | none |
| README:3, trace identity and Frobenius exchange “over finite fields”, against §3.8 | S = Spec 𝔽_q, r = 1, K = Λ_{𝔸¹} | Sum side: −Σ_e 1 = −q at 0′, −Σ_e ψ(Tr(e e′)) = 0 elsewhere. Sheaf side: σ′_*Λ(−1)[−1] has trace (−1)¹·q = −q at 0′, 0 elsewhere. | Agree; §3.8 has S (or S₀) over 𝔽_q | none |
| Description: line counts, “no declarations”, “adds the new roadmap folder” | base versus head | Folder absent on base; 639 + 57 + 1 = 697 lines, +697/−0; 0 Lean declarations; 0 paths outside the folder. | Description correct | none |
| Description: “Over perfect fields with field coefficients” (affine line); “equivalence of hearts … over fields” | README:501; §§4.1–4.2 | Layer 5: k perfect, Λ a finite field, E or ℚ̄_ℓ. Layer 4: S = Spec k. | Description correct | none |

Other adversarial rows stand as in the previous review, of ec08a18.

- Increment: 4 changed README lines (2 sentences), 0 changed Lean statements, 0 paths outside the folder; head b215ba15918858954d794a099ed4086345800ab3 confirmed.
- Pull request text: title, the summary block and every prose sentence compared with the head; scope, coefficient, consumer (README “Downstream consumers”), supplier and validation sentences all agree with it. Of the nine suppliers, six are on main and three are open roadmaps earlier in the merge order, as the description says.
- Source locators reopened for the passages the changed text depends on: 4 (LAU87 lines 372–373, 389–390 and 553–555; KL85 lines 388–391); each supports the statement cited. The rest of the seeded sample lies outside the change and stands as verified before.
- Library declarations: none new; `Suggested.lean` is unchanged with 0 declarations, so signature and one-tactic probes have no instances.
- Cross-roadmap: the citations of this roadmap by ExponentialSumsAndCircleMethodPartII, PotentialAutomorphyDworkMotivesPartII and EtaleCohomologyFoundations (§§2.2–2.6, 2.8, 5.3) resolve unchanged; the change drops or renumbers no id.
- Gate rerun at this head: every counter 0, `OK`. Dependency check: `depcheck: 244 roadmaps, 2210 edges, 0 problem(s)`; no UPWARD or CYCLE line.
- `lake env lean` on `TauCetiRoadmap/FourierDeligneTransform/Suggested.lean`: exit 0, no output.
- Remark: the “How to read the build” paragraph and the Layer 3 heading say “on a vector bundle” without the qualifiers; the standing hypotheses at README:353 supply them.

Overlap check: read EtaleCohomologyFoundations (main and open revision), SheafConvolutionOnAbelianVarieties and ExponentialSumsAndCircleMethodPartII where they name the transform; nothing shared: each cites FourierDeligneTransform as owner of the transform, and the changed ownership sentence only narrows this roadmap's claim.

Source independence: changed passages only; 2 passages compared with 2 sources (LAU87, KL85), none shared beyond the standard phrase for a vector bundle of constant rank; largest share LAU87, 151 of 202 locators as counted in the previous review; no layer added, removed or reordered, so the contents were not compared again.

## Not verifiable

- SGA45-ST and KW01 are settled as uncertified and cited by locator only; no changed passage depends on them.
- The extraction uncertainties at LAU87 line 971 and KL85 line 446 noted before lie outside the changed text.

## Source issues

- none

## For the human reviewers

- none
