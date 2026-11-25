# Review of HodgeTateLatticesAndLubinTateLogarithms (pull request #3027 at f0da4ff)
Folder: `TauCetiRoadmap/RiemannHypothesisForDirichletLFunctions/HodgeTateLatticesAndLubinTateLogarithms/`
**Verdict:** accepted

**Summary.** Accepted: an incremental re-review of the 19 lines changed since `3bddf73`, with no findings, no small corrections and no format notes. Both small corrections of the previous review are repaired (the chain of inequalities in the *Method* label of 0.5h, and the account of Pilloni–Stroh at `p = 2`). The new attributions to the formal proof in 2.4 and 3.3 were checked against its Lean source and agree with it. One question to the author is carried over; nothing is left for a human to decide.

## Questions for the author

- The *Origin* of 0.18a (line 558) and the reference entry place the Raynaud extension in Faltings–Chai, chapter III. NeronModelsAndSemistableAbelianVarieties cites it at chapter II §1. Is chapter III meant for the finite and toric parts of the torsion only? I could not open Faltings–Chai (no legal copy) to check.

## Previous findings

The previous review had no findings and two small corrections.

- C01 (0.5h *Method* sentence) — repaired: line 396 now reads "`p^{2g}(p−1)·deg(Hom/𝔄) ≥ 2·colength(𝒜)`, and `2·colength(𝒜) ≥ p^{2g}·deg(ω_{A[p]}) = p^{2g}(p−1)·g·v(c)`", which is the chain of the route and agrees with (4).
- C02 (Pilloni–Stroh at `p = 2`) — repaired: the reference entry and the *Origin* labels of 0.5a and 0.17a now say that at `p = 2` the source argues conditionally on an unwritten bound with exponent `2` (Remarque 1.10); PS16 lines 221–228 say so.

## Verified sound

| Statement | Instances tried | Values on each side | Result |
|---|---|---|---|
| 0.5h *Method* chain against (4) | `μ_p × ℤ/p`, `g = 1`, `v(c) = 1/(p−1)` | `2·colength(𝒜) = p²`; `p^{2g}·deg(ω_{A[p]}) = p²(p−1)·v(c) = p²`; chain `≥ p² ≥ p²` closes with equality | holds |
| 0.5a *Origin*: Pilloni–Stroh at `p = 2`, "`p^2` in place of `p^{1/(p−1)}`" | PS16 lines 221–228, 245–250 | Thm 1.9: `p ≥ 3`, valuation `≥ 1/(p−1)`. Rem. 1.10: `p = 2`, valuation `≥ 2`, i.e. `4·ω ⊆ ω^mod`; not written up | holds |
| 2.4 *Route*: only the first assertion of (a) is the formal statement | `HT.FarguesExact`, read in `FarguesExact.lean` | Conclusion: `hodgeTateLinear G x = 0 ↔ ∀ y, dlogLinear G y = 0 → B x y = 0`; no rank, no saturation, no image over `C` | holds |
| 2.4 *Method*: frame `A_inf[X]/(pX − ([ε] − 1), X²)` with `x^p ∈ p·ker θ` | formal source (`rel`, `pd`); `p = 2`; odd `p` | Source: ideal `(pX − μ, X²)`, `μ = [ε] − 1`; `pd`: `x^p = p·y`, `θ y = 0`. `p = 2`: `ξ² = 2(X + ξ)`. Odd `p`: `ξ^p ≡ ([ε]−1)^{p−1} = p^{p−1}X^{p−1} = 0 (mod p·ker θ)` | holds |
| 3.3 *Route*: `DworkMv` does not assume `K` complete | `Formalism.InvariantFactorPaths.G7.DworkMv` | Binders: `NormedField K`, `IsUltrametricDist K`, `CharZero K`, `‖p‖ = p⁻¹`, `‖σa − a^p‖ ≤ p⁻¹` on the unit ball; no `CompleteSpace` | holds |
| [FormalProof] reference entry: "2.4 (the first assertion of (a), and (b))" | against the *Route* of 2.4 | Same scope in both places; (b) remains `dlog_lagrangian` | holds |

The rows of the previous review for untouched statements stand as in that review, of `3bddf73`.

- Source locators checked against the text in this round: 3 in PS16 (Théorème 1.9, Remarque 1.10, Lemme 1.12) and 5 declarations of [FormalProof] (`FarguesExact`, `farguesExact`, `DworkMv`, the frame's defining ideal, its property `pd`).
- The four file paths of [FormalProof] cited in 2.4 and 3.3 exist at the first commit `40e56bab` of the repository and are unchanged in the copy read.
- Cross-roadmap citations in the changed passages: HodgeTateAndCanonicalSubgroups §§2.4, 2.5, 5.5 only, unchanged since the previous review, which resolved them.
- Headings: none added, removed or renumbered by the change; `Suggested.lean` unchanged.
- Overlap check: read ProjectiveModelsAndPeriodBoundsOnShimuraVarieties, TaylorBoundsAndDepthsOnHeightTwoFormalGroups, ArithmeticVolumesAndIntegralFormsOnUnitaryShimuraVarieties (consumers); nothing shared; no open pull request changes this roadmap or drops an id it cites.
- Dependency check: `depcheck: 122 roadmaps, 1394 edges, 0 problem(s)`; no UPWARD or CYCLE line (run with the board's local merge-order file).
- Automatic checks: all passed; the files changed outside this folder lie in the roadmap folders and family indexes the pull request owns. `lake env lean` on `Suggested.lean`: two `sorry` warnings (lines 68 and 106), nothing else.
- The pull request's text: it has no sentence about this folder that the change makes wrong; the change removes no section, declaration or supplier.

Source independence: changed passages only; 5 passages compared with 2 sources (PS16, [FormalProof]), none shared beyond formulas the mathematics forces; largest share [FormalProof]; arrangement not compared, since the diff adds, removes or reorders no layer.

Research link: 0.5b and 2.4 are the integral Hodge–Tate bounds of Fargues (2010, 2011); Pilloni–Stroh (2016) build the modified Hodge bundle on them, which 0.5a–0.5c and 0.17 generalise; 3.2–3.4 rest on Hazewinkel's functional-equation lemma (1978), the Dieudonné–Dwork lemma (Krattenthaler–Rivoal 2011) and Gross–Hopkins (1994). Rests on the README's references and on Far11, PS16, KR08 as read.

## Not verifiable

- Faltings–Chai, chapter III (the question above): no legal copy.
- The remaining *Method of the formal proof* labels, untouched by this change, were not compared with the formal source in this round.

## Source issues

- none

## For the human reviewers

- The recorded decisions were applied and do not bear on this folder's change: it removes no section, and its six *Corollary of:* lines name sections present at this head.
