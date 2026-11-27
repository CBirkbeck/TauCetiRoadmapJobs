# Review of MarkovDiffusionOperators (pull request #3148 at e8ab424)

**Verdict:** accepted

**Summary.** Accepted: this incremental re-review of the 16 lines changed since `23492cb` finds no blocking point. The three small corrections of the previous review are repaired, and the repairs are correct: the integration by parts in the criterion for `LS(C)` now has unambiguous letters, the Ornstein–Uhlenbeck facts are cited from the section that states them, and the docstring of `gibbsMeasure` says exactly what integrability does in `gibbs_brascampLieb`. There are no small corrections and three format notes, none blocking. The book [BGL] still could not be read legally; that, a licence question, the library pin and the future-roadmaps subsection are left for the human reviewers.

## N01 — [HelfferSjostrand] is still cited without a locator

Layer 11, README line 253, cites the article as a whole; the other references of the layer carry a theorem or a page.

## N02 — The `*Needs:*` line of Layer 9 still lists OrnsteinUhlenbeckSemigroup §1.2

README line 227 has "§§1.1–1.3 and 2.1", and the pull request's description repeats it; after this change the Ornstein–Uhlenbeck item (line 210) and the supplier contract (line 351) consume §1.1, §1.3 and §2.1 only. "§§1.1, 1.3 and 2.1" would match them.

## N03 — With "`main`" removed, nothing tells a reader that seven of the cited Tau Ceti files are newer than the pinned commit

README line 331 now says the declarations of `Analysis/Semigroups/Generation/Form.lean`, `MeasureTheory/Integral/Entropy.lean`, the profile file and the four `Probability/Concentration/Poincare/` files "are consumed from Tau Ceti", and `Suggested.lean` line 39 says the profile is "implemented in Tau Ceti"; at the pinned commit none of these files exists (the pinned `Analysis/Semigroups/Generation/` has no `Form.lean`, there is no `Probability/Concentration/Poincare/`, and no declaration `gaussianIsoperimetricProfile`). The line below already says "at the pinned commit" of the Hessian operator; a matching clause here ("in Tau Ceti after the pinned commit") would keep the distinction without naming a branch.

## Questions for the author

- Carried from the previous review, still open: Layer 6 says that [BGL, Theorem 3.3.23] states the finiteness of `μ` without ergodicity, and Layer 10 that [BGL, Theorem 8.5.3] is stated for `f ∈ A₀`. Does a standing convention of the book at these theorems supply ergodicity, or the constants? The book could not be read.

## Previous findings

The previous review had no finding (R); its small corrections and format notes are accounted for here.

- C01 — repaired: "for bounded `k ∈ A ∩ 𝒟(L)` and `w ∈ A ∩ 𝒟(ℰ)` with `Lw ∈ L¹(μ)` only (here, with `v = log P_t f`, `w = Γ(v)` and `Lw = 2Γ₂(v) + 2Γ(v, Lv)`, in `L¹` by Layer 5)".
- C02 — repaired: "Consumed from that roadmap: the semigroup law, the integral formula above (its Mehler form) and the contraction of `L²(γ)` (§1.1), reversibility for `γ` (§1.3) and the backward equation"; the contract agrees. The `*Needs:*` range is N02 above.
- C03 — repaired: "In `gibbs_brascampLieb` it is what makes `μ_V` a probability measure and the statement non-trivial: a positive-definite Hessian does not imply integrability (`V = eˣ`), and without it `gibbsMeasure V = 0`".
- N01 — not repaired: "[HelfferSjostrand; BGL, Lemma 4.9.2, (4.9.2)]" (N01 above).
- N02 — repaired: "are consumed from Tau Ceti;" and "implemented in Tau Ceti as"; what the repair leaves unsaid is N03 above.

## Verified sound

| Statement | Instances tried | Values computed | Result | Change |
|---|---|---|---|---|
| Layer 8 criterion: integration by parts for `Lw ∈ L¹` | `ζ_j k ∈ A₀`, `w = Γ(v)`, `v = log P_t f` | F7: `∫ ζ_j k Lw = −∫ ζ_j Γ(k, w) − ∫ k Γ(ζ_j, w)`; last term `≤ ‖k‖_∞ √ℰ(ζ_j) √ℰ(w) → 0`. `Lw = LΓ(v) = 2Γ₂(v) + 2Γ(v, Lv)` by the definition of `Γ₂` | sound; letters now distinct | none |
| Layer 9, `P_t = Q_t` for Ornstein–Uhlenbeck | which facts are consumed, which proved | Supplier §1.1 states composition law, the integral (Mehler) form, `Lᵖ(γ)` contraction for `1 ≤ p < ∞`; density step needs the uniform bound `‖Q_t‖ ≤ 1`, now consumed. Self-adjoint `B ⊇ L̄` self-adjoint gives `B = L̄` | sound | N02 |
| `gibbsMeasure` docstring / `gibbs_brascampLieb` | `¬ Integrable e^{−V}`; `V = eˣ`, `d = 1` | `V'' = eˣ > 0`, `∫ e^{−eˣ} dx = ∞` (integrand → 1 at `−∞`); `volume.tilted (−V) = 0`; scratch statement with `¬ Integrable` closes by `simp` with `tilted_of_not_integrable`: `0 ≤ 0` | docstring true | none |
| `gaussianIsoperimetricProfile` docstring | library name at the pin | no declaration of that name in the pinned Tau Ceti; restated body unchanged | pointer is to a later commit | N03 |

The rows for the statements the change does not touch stand as in the previous review, of `23492cb`.

- Source locators checked against the text: none; the changed passages carry no new locator, and the seeded sample (1.1, 1.2, 2.1, 2.2, 2.3, 4.1, 4.2) falls outside the changed passages (all its locators are into [BGL], unreadable).
- Library declarations opened at the pin: Mathlib `MeasureTheory.Measure.tilted`, `tilted_of_not_integrable` (`Mathlib/MeasureTheory/Measure/Tilted.lean:42, 46`); the pinned Tau Ceti directory `TauCeti/Analysis/Semigroups/Generation/` (no `Form.lean`) and `TauCeti/Probability/` (no `Concentration/Poincare/`, no `gaussianIsoperimetricProfile`).
- Cross-roadmap citations resolved at the open head: OrnsteinUhlenbeckSemigroup §1.1 (the kernels and the semigroup on functions: Mehler form, `Lᵖ(γ)` contraction by Jensen and the invariance of 1.3), §1.2 (Mehler's kernel), §1.3 (reversibility and invariance), §2.1 (generator and backward equation).
- Automatic checks: all passed. Dependency check: `depcheck: 94 roadmaps, 1055 edges, 0 problem(s)`; no upward or cyclic line. The pull request changes nothing outside the folder.
- Elaboration of `TauCetiRoadmap/MarkovDiffusionOperators/Suggested.lean`: ten `sorry` warnings, nothing else; no `set_option`, no sorried data. The change touches two docstrings only; no signature changed, so the elaborated types stand as checked before.
- The pull request's title and description agree with this head (ten `sorry`s, three imports, the open dependency on OrnsteinUhlenbeckSemigroup); the one loose range is in N02.

Overlap check: read LogConcaveFunctionalInequalities, OrnsteinUhlenbeckSemigroup, GaussianIsoperimetryAndClusters; shared, with owners as the README states: the Gibbs Poincaré and logarithmic Sobolev inequalities (LogConcaveFunctionalInequalities §§2.3–2.4, second proof here), the Ornstein–Uhlenbeck kernel semigroup, its Mehler form, `Lᵖ` contraction, Mehler's formula and Hermite eigenfunctions (OrnsteinUhlenbeckSemigroup, consumed in Layer 9), the Gaussian profile and Gaussian isoperimetry (GaussianIsoperimetryAndClusters §1.1, Layer 8). The change moves the `L²(γ)` contraction from "proved here" to "consumed", which removes a second proof of a supplier's fact.

Source independence: changed passages only; 3 changed passages read, none could be compared with a source, since the only source they cite ([BGL]) could not be read; largest share BGL, as in the previous reviews; no layer was added, removed or reordered, so the arrangement was not compared again, and the contents of [BGL] remain unread.

Research link: Layers 6–8 and 10 are the `Γ₂` results of Bakry–Émery theory in the form of Bakry, Gentil and Ledoux (2014), with the semigroup proof of Gaussian isoperimetry; Layer 11 is the Brascamp–Lieb inequality (1976) by Hörmander's method and the Helffer–Sjöstrand representation (1994). Rests on the README's references; of these only the errata was read.

## Not verifiable

- Every [BGL] locator, including Proposition 5.7.3 of the changed Layer 8 bullet and the seeded sample's locators: the book resolves only to a paywalled page.
- [FOT, Theorem 1.4.1], [Davies, §1.3], [Hörmander, Theorem 2.2.1], [CorderoErausquin2005, p. 402], [BrascampLieb, Theorem 4.1], [HelfferSjostrand]: paywalled or no legal copy found.
- Whether the Lean statements resemble the external formalisation named in the Provenance section: not compared.

## Source issues

- none

## For the human reviewers

- **Not tested.** [BGL] carries most of the README's bracketed citations; neither its text nor its table of contents could be read, so wording and arrangement were not compared with it, including the six subjects of README lines 308–313.
- **Licence.** The Provenance section (README line 359) names an Apache-2.0 repository by the pull request's author that formalises [BGL]; `Suggested.lean` was not compared with it.
- **Library pin.** Layer 2 builds the semigroup with `IsCoercive.formSemigroup`, and Layers 7–10 use `PoincareInequality`, `LogSobolevInequality`, `entropy` and the profile; none is at the pinned Tau Ceti commit, and README line 331 no longer says so (N03).
- **Scope.** README lines 305–315 describe six future roadmaps and say "Contributors should not work from it"; whether a roadmap should carry such a plan is not decided here.
