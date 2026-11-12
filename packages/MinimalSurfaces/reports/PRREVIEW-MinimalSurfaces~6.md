# Review of MinimalSurfaces (pull request #2226 at 530ac52)
Folder: `TauCetiRoadmap/RiemannianGeometry/MinimalSurfaces/`
**Verdict:** needs changes

## R01 (P3) — The description's provenance note omits the rewritten 4.1–4.2 argument
**Location:** Description, "Note for reviewers": "The following were written with Claude Fable 5.2 in response to the review and are not taken from the TeX source: the `*Needs:*` lines, the Checks, … in 3.6, and the constants of … 7.4".
**Claim:** Since `4788ed5`, two passages were rewritten in response to the review: 4.1's global tangency principle, which replaces unique continuation, and both closing steps of the proof sketch for the headline 4.2. Neither comes from the TeX. The note does not list them, and its closing sentence ("written … from a TeX file") then implies that they do.
**Witness:** `README.md` lines 855–860, 890–891 and 898–900 reproduce word for word the repair text of R01 in the review of `4788ed5`.
**Repair:** In the note, replace "the two-dimensional Kato form of the Riemannian Simons inequality in 3.6, and the constants" with "the two-dimensional Kato form of the Riemannian Simons inequality in 3.6, the global tangency principle of 4.1 and the two closing steps of the proof sketch of 4.2, and the constants".

## Previous findings

- R01 — repaired: lines 855–860 "Include the global tangency principle [Chodosh, Corollary 19.6]: … then `f⁻¹(S)` is empty or all of Σ"; 4.2 uses it in both cases; line 916 "*Needs:* 4.1, 3.2, 3.3"; Scope line 38 and the description's MS4 bullet agree.
- R02 — repaired: 2.6 "*Sources:* [CM4, §0, notation for multi-valued graphs]"; 3.4 "*Sources:* [CM4, Appendix C, proof of Lemma C.1]"; line 847 "Establish a first-contact lemma ([Chodosh, proof of Theorem 20.1])".
- R03 — repaired: 2.3 "*Sources:* [Chodosh, proof of Theorem 32.5], for `g = g_Eucl`. The dependence on g is this roadmap's extension".
- R04 — repaired: line 2068 "[Frankel, §2, … pp. 69–70]", line 2110 "[Frankel, §2, generalized Hadamard theorem, p. 69]", line 2142 "[Frankel, §1, Theorem, p. 69, … pp. 70–71]". The text is paywalled (see Not verifiable).
- R05 — repaired: lines 294–296 "Also prove, from R5a's Gauss formula, that `Hess_Σ(x_i ∘ f) = ⟨II, e_i⟩` … this sum is `hessianCoordNormSq`", with the radius-ρ and `2ι` Checks; *Needs:* adds the Gauss formula.
- R06 — repaired: `Suggested.lean` line 72 "/-! ## Layer 5: local compactness and ε-regularity -/"; line 111 "/-! ## Layer 7: stability and the curvature estimate -/" now precedes 7.5.
- R07 — repaired: "CanonicalModelsAndGonality (#1726) cites 10.3 and 10.4 in its §8.4 and restates neither". At #1726 (`77620a3`), lines 136 and 1806 do this.

## Verified sound

| Statement | Instance | README / Lean side | Computed side | Result |
|---|---|---|---|---|
| 1.1 `Hess_Σ(x_i∘f) = ⟨II,e_i⟩`; `hessianCoordNormSq` | sphere of radius 2; catenoid at `v = 0` | `Σ_i |Hess x_i|² = |A|²` for an isometric immersion | `2/ρ² = ½ = |A|²`; principal curvatures `±1`, so `2 = 2` | holds; sign agrees with R5a's `B = −⟨X,Y⟩ν` |
| 1.1 isometry control | `2ι` on the unit `S²` | sum against `|A|²` of the image | `Hess(2x_i) = −2x_i g`, sum `Σ 8x_i² = 8`; image of radius 2 has `|A|² = ½` | holds; isometry needed |
| 4.1 global tangency | `f(Σ) = S = {x₃ = 0}` | `f⁻¹(S)` empty or Σ | all of Σ | holds |
| 4.1, minimality | unit sphere centred at `e₃`, `S = {x₃ = 0}` | one-sided contact | `f⁻¹(S)` = south pole only; excluded, `H ≠ 0` | minimality needed |
| 4.1, `∂S` | S the half-plane `{x₃ = 0, x₁ ≥ 0}`, f the plane `{x₃ = 0}` | `f⁻¹(S)` | a closed half-plane, not open; excluded since `f(Σ)` meets `∂S` | hypothesis needed |
| 4.1, one-sidedness | f the plane `{x₃ = x₁}`, `S = {x₃ = 0}` | `f⁻¹(S)` | a line; the planes cross, so excluded | hypothesis needed |
| 4.2 (Lean `range_eq_plane_of_minimal_of_nonneg`), case 1 | image meets `{x₃ = 0}` | `f(Σ) ⊂` plane, then the whole plane | immersion 2→2 is a local diffeomorphism (open image); properness gives a closed image | holds |
| 4.2, case 2 | `λ = 0.01`, contact at `t₀ = 0.05` | barrier over `{λ ≤ ρ ≤ λ cosh(t₀/λ)}` | `0.01·cosh 5 = 0.742`; height at `ρ = 0.5`: `0.05 − 0.0461 = 0.0039` | holds |
| 4.2, case 2 endgame | points under the contact barrier | one-sided contact; Σ compact | they lie on `S_t` with `t = x₃ + λ arccosh(ρ/λ) < t₀`; Σ is compact, which 3.3 excludes | holds; 3.3 in *Needs:* |
| 11.1 second variation | unit sphere and plane `{x₃ = 2}`; γ from `e₃` to `2e₃`; `V = e₁` | `−⟨II₁(v,v),γ′(0)⟩ + 0 + 0` | formula 1; `L(s) = √((s − sin s)² + (2 − cos s)²) = 1 + s²/2 + O(s⁴)` | holds |
| 11.2 Frankel | Clifford torus and great sphere `{x₁ = x₃}` in `S³` | the images meet | `(½,½,½,½)` lies on both | holds |
| 11.2, `Ric > 0` control | `{x₃ = 0}`, `{x₃ = ½}` in flat `ℝ³/ℤ³` | the images meet | disjoint, `Ric = 0` | hypothesis needed; [Chodosh, Ex. 20.2, p. 55] is the `Sⁿ` case |
| 11.3 preimages | `L(3,1)`, `(z₁,z₂) ↦ (ωz₁,ωz₂)`, `d = 3` | `γ̃ − 1 = d(γ − 1)` | Clifford torus: `0 = 3·0`; a sphere: `γ̃ = −2`, so no embedded minimal sphere | holds |
| 3.4 radius (new locator) | unit `S³`, `κ = 1` | `R < π/(2√κ) = 1.571`; [CM4] Lemma C.1 assumes `r₀ < π/(4√k) = 0.785` | `2r cot r`: `0.933` at `r = 1.2`, `−0.094` at `r = 1.6` | holds; the larger radius is R4.1's, which 3.4 cites |
| 2.6 (new locator) | helicoid `u = θ` over P | `w = u(ρ,θ+2π) − u(ρ,θ)`, as [CM4] line 102 | `w ≡ 2π > 0`: embedded | holds |

The rows for the statements this diff leaves unchanged stand as in the review of `4788ed5`. They cover 2.3–3.6, 5.1–10.5 and 12.1, including the headlines 5.1, 7.5, 7.6 and 10.3 of `Suggested.lean`.

- **Source locators checked against the text: 9.**
  - [Chodosh] (15 September 2025): Corollary 7.9 (p. 27), Theorem 8.1 (p. 28), Corollary 19.6 (pp. 53–54), Exercise 20.2 (p. 55) and Theorem 32.5 (p. 78).
  - Also the proof of Theorem 20.1 (p. 54). It runs the contact argument over the neck radius of `Γ_{ε,r}` rather than over translates; the proof of Corollary 19.4 is the translation form.
  - [CM4] (arXiv:math/0210119v1): §0 (lines 97–102) and Appendix C, Lemma C.1 (lines 971–977).
  - [White] §§2–3 states only the traced form (line 657). 1.1's Hessian identity rests on R5a's Gauss formula.
- **Seeded sample.**
  - 11.1–11.3 fall in the changed passages. Chodosh Exercise 20.2 matches 11.2; Frankel, Lee and Bernstein could not be read.
  - The other twelve sample targets are outside the changed passages and stand as in the review of `4788ed5`.
- **Cross-roadmap citations resolved.**
  - R5a's Gauss formula and `B = −⟨X,Y⟩ν` on the sphere: parent `README.md` lines 2885–2886 and 2916.
  - GeometricCurrents G6 (main, line 703).
  - CanonicalModelsAndGonality at #1726 (`77620a3`, lines 136 and 1806).
- **Gate.**
  - The worker's run passes every check.
  - My run reports only `depcheck: NOT IN ORDER: MinimalSurfaces` and `outside-folder: TauCetiRoadmap/RiemannianGeometry/README.md`, which is the pull request's own family index; neither is a finding.
  - The dependency check against the candidate order gives `depcheck: 206 roadmaps, 1899 edges, 0 problem(s)`.
- **Elaboration.**
  - `lake env lean Suggested.lean` gives 5 `sorry` warnings and nothing else.
  - `#check @` on all 7 declarations matches `signatures.md`; no binder is lost.
  - In the Lean file the diff moves only section comments, so the previous one-tactic probe still stands.
- **Outside the folder.** The pull request changes nothing outside the folder and the family index; since `4788ed5` nothing outside the folder changed.
- **Overlap check.** Read RiemannianGeometry, Surfaces and PositiveMass (main).
  - None of them states the first-contact lemma, the global tangency principle or the coordinate-Hessian identity.
  - The local one-sided principle under 3.2 belongs to GeometricCurrents G6.
  - `roadmaps grep` for "global tangency", "geometric maximum principle" and "half-space theorem" over main and every open head finds only this pull request and DifferentialGeometry 12.6, which is Stokes' theorem on a half-space.

## Not verifiable

- [Frankel] (Ann. of Math. 83, doi:10.2307/1970471): the sources service reaches only JSTOR. The §1/§2 and page locators of 11.1–11.3 are unread, and the open papers that cite Frankel give neither section nor page.
- [Bernstein] (math.jhu.edu notes): the server returned HTTP 403, so Theorem 3.1 (11.3) is unread.
- [Lee], Chapters 6 and 10 (GTM 176): paywalled.
- [CM], §1.1 (AMS GSM 121): no legal copy found, so 1.1's first source is unread.
- [HM], Theorem 1: paywalled. 4.2 was checked against [Chodosh, Theorem 20.1].

## Source issues

- **Misprint** in Chodosh at Corollary 19.6, proof, p. 54: the source intersects Σ₁ with itself and U; it should intersect Σ₁ with Σ₂ and U; affects nothing.
