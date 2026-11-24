# Review of PELModuli (pull request #3027 at 6f088b9)

**Verdict:** accepted

**Summary.** A review of the change against `main`: 2 changed lines since `b8f3652`. The only change is the *Needs:* line of M2.5, which now also cites SchemeAndStackFoundations §4.3 ("deformation functors and their tangent spaces"); I checked it against that section on main and it is correct: §4.3 defines the tangent space `F(k[ε])` and the deformation-functor condition that M2.5's use of Schlessinger's theorem requires, in the same coefficient setting. The description states the change exactly. There are no findings and no format notes; there is one small correction, in text this pull request did not write, and one fact about a reference link for the human reviewers.

## Previous findings

- None open. The previous review raised no findings; its one small correction (C01 below) lies in untouched text and is carried as such.

## C01 — Untouched text: README, M2.5 (lines 2019, 2042, 2056) and M2.6 (line 2064): SchemeAndStackFoundations §4.2 does not use the name `ArtinLocalAlg` that these lines give it

A reader who searches for this declaration finds nothing. SchemeAndStackFoundations §4.2 on main (its README, line 6347 onward) calls the category `C_Λ`, the full subcategory of `Over (CommAlgCat.of Λ k)` on Artinian local `A` with `A → k` surjective; neither its README nor its `Suggested.lean` contains `ArtinLocalAlg`, and neither do the pinned Mathlib and Tau Ceti. The object M2.5 describes is the right one; only the name is wrong. Writing "SchemeAndStackFoundations §4.2's Artinian coefficient category `C_Λ`" at the four places would fix it, as would saying that `ArtinLocalAlg` is a proposed name. The name stands on the line this pull request changes, but the pull request did not write it, so a separate pull request is the place for it.

## Verified sound

| Statement | Instances tried | Values on each side | Result | Change |
| --- | --- | --- | --- | --- |
| M2.5 *Needs:* cites §4.3 for deformation functors and tangent spaces (line 2042) | `Def_{E₀}`, `E₀/𝔽_p`, `Λ = ℤ_p`; complex abelian surface; zero abelian scheme over `ℚ(t)` | M2.5 tangent dimensions `g² =` 1, 4 (polarized `g(g+1)/2 = 3`), 0; §4.3: `T_F = F(k[ε])`, `T(h_{Λ[[t]]}) = k¹`, `T(h_k) = 0` | agree | none |
| §4.4 `schlessinger_prorepresentable` as used in M2.5 needs §4.3's `IsDeformationFunctor` (RS) and `H3` | `Def_{A₀}`, `dim A₀ = g`; `h_{k[[t]]}/(t ↦ −t)`, `char k ≠ 2` | `Def_{A₀}`: RS holds, `dim H¹(A₀, T) = g² < ∞`; the quotient: tangent addition fails (H2 fails), not prorepresentable | §4.3 is a real input | none |
| M2.5's coefficients against §4.3's classical setting (`Λ` complete Noetherian local, `Λ → k` surjective) | `Λ = W(k)`, `k` perfect; `Λ = k`, characteristic 0; `ℤ_p` with `k = 𝔽_{p²}` | first two surjective onto `k`; `ℤ_p → 𝔽_{p²}` not, and M2.5 base-changes to `W(𝔽_{p²})` first (lines 2039–2040) | consistent | none |
| The gloss on line 2042 against the supplier's headings | SchemeAndStackFoundations on main, lines 6347, 6385, 6456, 6550 | 4.2 `C_Λ` (no `ArtinLocalAlg`); 4.3 H1–H4, RS, `tangentSpace`; 4.4 Schlessinger's theorem; 4.6 smooth schemes and line bundles | three exact, one name absent | C01 |
| Affected text: M2 dependencies (line 2501), scope bullet (lines 4043–4049) | the section ranges they list | "Layers 0–4" and "§§4.1–4.4" both contain 4.3 | consistent | none |
| Description: "PELModuli M2.5 (adds SchemeAndStackFoundations §4.3)" | the folder's diff since `b8f3652` | 1 line removed, 1 added, line 2042 only: "4.3" and its gloss | exact | none |
| `detPoly_classifies` (headline, unchanged) | `C = k × k` on `k` by each projection; `C = 𝔽_p`, `M = 𝔽_p^p`, `N = 0`; `M = N = 0` | `x₁` vs `x₂`: differ, not isomorphic; `x^p` vs `1`: differ, not isomorphic (traces both 0); `1 = 1`, isomorphic | both directions agree | none |
| `detPoly_classifies_charZero` (headline, unchanged) | `k = C = ℚ`, `M = ℚ²`, `N = ℚ`; the `𝔽_p` case above | traces `2a` vs `a`: differ, not isomorphic; `𝔽_p` case (traces 0 = 0, not isomorphic) excluded by `[CharZero k]` | sound | none |
| `compatibleComplexStructures_conjugacy` (headline, unchanged) | `V = ℝ²`, `ω = e₁∧e₂`, `O = ℝ`; `J` rotation by `+90°`, `J′ = −J` | `ω(e₁, Je₁) = 1 > 0`; for `−J` it is `−1`, so `−J` is not compatible and the statement does not claim `J ∼ −J` | sound | none |

- Diff: one README line (2042) changed; no Lean change. The pull request's other changes all lie in the roadmap folders named as its own.
- Supplier sections read: SchemeAndStackFoundations §§4.2, 4.3, 4.4, 4.6 on main; that folder is not changed by this pull request, so main's text is the head's.
- Library searches at the pins: `ArtinLocalAlg` in Mathlib and Tau Ceti, absent.
- Automatic checks: all pass at 6f088b9. Dependency check output: `depcheck: 129 roadmaps, 1446 edges, 0 problem(s)`; no UPWARD or CYCLE line.
- Elaboration: `lake env lean` on `TauCetiRoadmap/PELModuli/Suggested.lean` gives three warnings, all `declaration uses sorry` (lines 62, 70, 80). The elaborated types of the four declarations were compared with the README statements: every binder is present; nothing changed.
- Seeded sample: the six targets lie outside the changed and affected passages; the README flags no locator as unverified. The changed line carries no source locator.
- Overlaps: no open pull request changes this roadmap or drops an id it cites; this pull request drops no id of it. Record: 7 layers at the merge base, none removed or retitled.
- Description: the one sentence naming PELModuli (under "Corrections to `*Needs:*` lines") checked against the diff.

Overlap check: read AbelianSchemesAndArithmeticModuli, ShimuraCompactifications, HilbertModularVarietiesAndShimuraCurves (on main) and PELModuliPartII, ShimuraVarietiesPartII (open) as listed closest; the deformation-functor theory the changed line cites has one owner, SchemeAndStackFoundations Layer 4 on main; nothing shared.

Source independence: changed passages only; 1 passage compared (the added gloss on line 2042, set beside SchemeAndStackFoundations §4.3, a roadmap and not a source), none shared; largest share Lan's thesis, roughly 90 locators (Kottwitz next); contents not compared, since the diff adds, removes or reorders no layer.

Research link: M2's representability and deformation theory of PEL moduli problems are those of Kottwitz (1992, §5) and Lan (2008/2013, Ch. 1–2), the integral models on which current work on unitary and Siegel Shimura varieties is built. Rests on the README's summary and References.

## Not verifiable

- None. The changed line has no source locator, and the seeded targets lie outside the changed and affected passages, so no source text was needed this round.

## Source issues

- none

## For the human reviewers

- **Licence (text not changed by this pull request).** README References, line 4191: the link for Kottwitz, J. Amer. Math. Soc. 5 (1992), points to a copy in another mathematician's course-reference folder on an IMJ-PRG host, neither the publisher's page nor the author's.
