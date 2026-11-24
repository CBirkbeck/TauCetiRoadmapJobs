# Review of PELModuli (pull request #3027 at 3bddf73)

**Verdict:** accepted

**Summary.** A review of the change against `main`: 2 changed lines since `b8f3652`. The only change is to the *Needs:* line of M2.5, which now also cites SchemeAndStackFoundations §4.3 ("deformation functors and their tangent spaces"). That is correct. On main, §4.3 defines predeformation functors, Schlessinger's conditions, the Rim–Schlessinger condition and the tangent space. M2.5 uses all of these: the finite tangent space `H¹(A₀, T_{A₀})`, the injective relative tangent maps, and the deformation-functor hypothesis of §4.4's `schlessinger_prorepresentable`. The description states the change exactly. There are no findings and no format notes. There is one small correction, in text this pull request did not write, and one fact about a reference link for the human reviewers.

## Previous findings

- None open. The previous review of this folder raised no findings. It had already marked R01 and R02 from the review before it as repaired.

## C01 — Untouched text: README, M2.5 (lines 2019, 2042, 2056) and M2.6 (line 2064): SchemeAndStackFoundations §4.2 does not use the name `ArtinLocalAlg` that these lines give it

A reader who searches for this declaration finds nothing. SchemeAndStackFoundations §4.2 on main (its README, line 6347 onward) calls the category `C_Λ`, the full subcategory of `Over (CommAlgCat.of Λ k)` on Artinian local `A` with `A → k` surjective. Neither its README nor its `Suggested.lean` contains `ArtinLocalAlg`, and neither do the pinned Mathlib and Tau Ceti. The object M2.5 describes is the right one; only the name is wrong. Writing "SchemeAndStackFoundations §4.2's Artinian coefficient category `C_Λ`" at the four places would fix it. Saying that `ArtinLocalAlg` is a proposed name would also work. The name is on the line this pull request changes, but the pull request did not write it, so a separate pull request is the place to fix it.

## Verified sound

| Statement | Instances tried | Values on each side | Result | Change |
| --- | --- | --- | --- | --- |
| M2.5 *Needs:* now cites §4.3 for deformation functors and their tangent spaces (line 2042) | `Def_{E₀}` with `E₀/𝔽_p` and `Λ = ℤ_p`; a complex abelian surface; the zero abelian scheme over `ℚ(t)` | M2.5 tangent dimensions 1, 4 (3 polarized), 0. In §4.3, `T_F = F(k[ε])`; `T` of `h_{Λ[[t]]}` is `k¹`; the one-point functor has `T = 0` | exact | none |
| §4.4 `schlessinger_prorepresentable`, as M2.5 applies it, needs §4.3's `IsDeformationFunctor` | `Def_{A₀}` with `dim A₀ = g`; the quotient of `h_{k[[t]]}` by `t ↦ −t`, `char k ≠ 2` | `Def_{A₀}` satisfies RS and `dim H¹(A₀, T) = g² < ∞`, so it is prorepresentable. The quotient fails H2 and has no hull | §4.3 is a genuine input | none |
| M2.5's coefficients against §4.3's classical setting (`Λ` complete Noetherian local, `Λ → k` surjective) | `Λ = W(k)` with `k` perfect of characteristic `p`; `Λ = k` in characteristic 0; `Λ = ℤ_p` with `k = 𝔽_{p²}` | `W(k) → k` and `id_k` are surjective. `ℤ_p → 𝔽_{p²}` is not; M2.5 first base-changes to `W(𝔽_{p²})` (lines 2039–2040) | consistent | none |
| The gloss on line 2042 against the supplier's sections | SchemeAndStackFoundations on main, lines 6347, 6385, 6456, 6550 | 4.2: `C_Λ`, no `ArtinLocalAlg`. 4.3: predeformation functors, H1–H4, `tangentSpace`. 4.4: Schlessinger's theorem. 4.6: smooth schemes and line bundles | three exact; one name absent | C01 |
| Affected text: Layer M2 dependencies (line 2501) and the scope bullet (line 4048) | the sections these lines list | "Layers 0–4" and "§§4.1–4.4" both contain 4.3 | consistent | none |
| Description: "PELModuli M2.5 (adds SchemeAndStackFoundations §4.3) … changed in these lines only" | the folder's diff since `b8f3652` | 1 line removed, 1 added (line 2042 only), adding "4.3" and its gloss | exact | none |
| `detPoly_classifies` (headline, unchanged) | `C = k × k` acting on `k` by the two projections; `C = 𝔽_p`, `M = 𝔽_p^p`, `N = 0` | `x₁` against `x₂`, not isomorphic; `x^p` against `1`, not isomorphic although both traces are `0` | both sides agree | none |
| `detPoly_classifies_charZero` (headline) | `k = C = ℚ`, `M = ℚ²`, `N = ℚ`; the `𝔽_p` case above | traces `2a` against `a`, not isomorphic; the `𝔽_p` case is excluded by `[CharZero k]` | sound | none |
| `compatibleComplexStructures_conjugacy` (headline) | `V = ℝ²`, `ω = e₁∧e₂`, `O = ℝ`; `J` the rotation by `+90°`, `J′ = −J` | `ω(e₁, Je₁) = 1 > 0`; for `−J` it is `−1`, excluded by `Compatible.positive` | sound | none |

- Diff: one README line (2042) changed; no Lean change. No file outside the pull request's own folders is changed.
- Supplier sections read: SchemeAndStackFoundations §§4.2, 4.3, 4.4 and 4.6 on main, identical at the merge base and at this head. `ArtinLocalAlg` searched for in that roadmap's README and `Suggested.lean` and in the pinned Mathlib and Tau Ceti: absent.
- Library declaration opened: `TauCeti.SymplecticForm.Compatible` (`TauCeti/Geometry/Symplectic/AlmostComplex.lean`, lines 571–575, positivity in its `positive` field).
- Automatic checks: all pass at 3bddf73. Dependency check: `depcheck: 132 roadmaps, 1474 edges, 0 problem(s)`, with no UPWARD or CYCLE line.
- Elaboration: `lake env lean` on `TauCetiRoadmap/PELModuli/Suggested.lean` gives three warnings, all `declaration uses sorry` (lines 62, 70, 80). `#check @name` of the four declarations on a copy of the file: every binder of the README statements is present; nothing changed.
- Seeded sample: the six targets (lines 1117, 1660, 1698, 2390, 2428, 2538) lie outside the changed and affected passages. The README flags no locator as unverified.
- Overlaps: no open pull request changes this roadmap or drops an id it cites, and this pull request drops no id of it.
- Description: the one sentence that names PELModuli (under "Corrections to `*Needs:*` lines") checked against the diff. The description has no summary block.

Overlap check: read AbelianSchemesAndArithmeticModuli, ShimuraCompactifications and HilbertModularVarietiesAndShimuraCurves (on main), and PELModuliPartII and ShimuraVarietiesPartII (open). The deformation-functor theory M2.5 cites has one owner, SchemeAndStackFoundations Layer 4 on main. Nothing shared.

Source independence: changed passages only. 1 passage compared, the added gloss on line 2042, set beside SchemeAndStackFoundations §4.3 (a roadmap, not a source); none shared. Largest share: Lan's thesis, about 91 locators by a pattern count (Kottwitz next, about 58). Contents not compared, since the diff adds, removes or reorders no layer.

Research link: M2's representability and deformation theory of PEL moduli are those of Kottwitz (1992, §5) and Lan (2008/2013, Ch. 1–2). Liu–Tian–Xiao–Zhang–Zhu (2022) use these integral models for unitary Shimura varieties, and Tsimerman (2018) and Lipnowski–Tsimerman (2018) use them for `A_g`. Rests on the README's summary and References.

## Not verifiable

- None. The changed line carries no source locator, and the six seeded targets lie outside the changed and affected passages, so they were not re-read this round.

## Source issues

- none

## For the human reviewers

- **Licence (text not changed by this pull request).** README References, line 4191: the link for Kottwitz, J. Amer. Math. Soc. 5 (1992), goes to a copy in another mathematician's course-reference folder on an IMJ-PRG host. That is neither the publisher's page nor the author's.
