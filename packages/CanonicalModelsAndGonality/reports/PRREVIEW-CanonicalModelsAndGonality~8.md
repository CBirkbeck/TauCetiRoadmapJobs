# Review of CanonicalModelsAndGonality (pull request #1726 at b184835)
**Verdict:** needs changes

## R01 (P3) — The new §9.3 headline cites a source that does not contain it

**Location:** `README.md:2059–2060`: “(Poonen 2007 and Derickx–van Hoeij 2014 use this inequality; the proof above is the standard one.)”. Also `:2218`, in the Poonen entry of the References: “and the specialization inequality of 9.3.”

**Claim:** `gonality_specialFiber_le` is now a headline, and its only locator is Poonen 2007, which neither states nor uses specialization under good reduction. Poonen reduces to `k = ℂ` and `k = 𝔽̄_p` by A.1(ii) instead.

**Witness:** poonen-2007, Appendix A, Prop. A.1(i)–(vii) (lines 327–337): no item concerns a DVR, and “reduction” occurs nowhere in the text. Derickx–van Hoeij, arXiv:1307.5719v3, §1, inequality (1), p. 1 (lines 20–22): `Gon_{𝔽_p}(C) ≤ Gon_ℚ(C)` at good `p`.

**Repair:** At `:2059–2060`, replace the parenthesis with “(Derickx–van Hoeij 2014, §1, inequality (1), p. 1, state the first inequality for a curve over `ℚ` with good reduction at `p`; the proof above gives it over every discrete valuation ring.)”. At `:2217–2218`, delete “, and the specialization inequality of 9.3”. In the Derickx–van Hoeij entry (`:2235`), after “52–71 —”, insert “§1, inequality (1) (the specialization inequality over `ℚ`, 9.3);”.

## Previous findings

- R01 — repaired: `Suggested.lean:675` states `gonality_specialFiber_le` with the two `TauCeti.AlgebraicGeometry` imports. The docstring (`:53–54`) now lists only §9.1 and §9.2 as not statable, and `README.md:2045–2048` names the theorem.
- R02 — not repaired: deferred (D01).
- R03 — repaired: `:1499–1501` reads “This is the quotient genus of `ag.quotient_curve`; the hgcwa `g0` column … are the sibling `GroupActionsOnRiemannSurfaces`'s (6.7)”. The 6.7 heading is renamed (`:1635`), and the orbit form is gone from *Owned here* (`:66–68`).
- R04 — repaired: `:851–853` read “Sources: Stacks, Tag 0E3C for the first; for the second, Tag 0E3D over each finite constant extension, with `Z` the subscheme of a nonzero `E`, and Tag 0H2V”, with a References entry at `:2202–2205`.
- R05 — repaired: `:1519–1520` cite `TauCeti.Place.differentExponent_eq_of_pow_sub_self_eq_of_ord_eq_neg`, `Different/ArtinSchreier/Basic.lean`, with exponent `(p − 1)(m + 1)`.
- R06 — repaired: the summary reads “the corollaries of Castelnuovo–Severi … Later layers prove the bielliptic and cyclic-trigonal criteria”. Group actions “receive the cyclic-trigonal predicate, the uniqueness of the trigonal pencil and involution fixed-point counts”.

## Deferred findings

- D01 — stands: at #1728's head (`bb14724`), `GroupActionsOnRiemannSurfaces/README.md:1696` still names this roadmap as consumer, and its §6.4 (`:1386–1389`) still proves `g ≤ 4` for two trigonal subfields.

## Verified sound

| Statement | Instances tried | Values computed on each side | Result |
|---|---|---|---|
| 9.3 `gonality_specialFiber_le` | `ℙ¹_{ℤ_(p)}`; `y²=x³−x` over `ℤ_(5)` (`Δ=64`) | `1 ≤ 1`; `2 ≤ 2` | True |
| 9.3, constant extension | `ℙ¹_{R'}`, `R'/R` unramified quadratic, viewed over `R` | `gon_κ(κ'(t)) = 2`, `gon_K(K'(t)) = [K':K]·1 = 2` | True; `hex` fails here, yet `2 ≤ 2` |
| 9.3, direction | smooth `ℂ[[t]]`-family `tw = q`, `w² = f₄` (genus 3) | generic plane quartic with a `K`-point: 3; special hyperelliptic: 2 | `2 ≤ 3` strict, so the reverse inequality is false |
| 9.3, hypotheses | `y² = x³ + p` over `ℤ_(p)`, `p ≥ 5` | special fibre a cusp | excluded by `[Smooth f]` |
| 9.3, elaborated type | `#check @…` printed explicitly | `κ`-algebra is `functionFieldBaseAlgebra` through `OverClass.fromOver (specialFiber R f)`; every binder kept | Correct structure map. No single tactic closes it (`simp`, `rfl`, `le_rfl`, `omega`, `decide`, `trivial`) |
| 2.5 `isBasePointFree_of_two_mul_genus_le` vs Tag 0E3C | `ℙ¹`, `D = 0`; elliptic `2O`; genus 2, `deg D = 4` | `ℓ(−P) = 0 < 1`; `ℓ(2O−P) = 1 < 2`; `ℓ(D−P) = 2 < 3` | True; Situation 6.2 needs `H⁰ = k` (`hex`) and no perfectness |
| 2.5 `isVeryAmple_of_two_mul_genus_add_one_le` vs Tags 0E3D, 0H2V | elliptic `3O`; genus 2, `deg 5`; genus 2, `2K` | `ℓ(3O−E) = 1 = 3−2`; `2g−1+deg Z = 5 ≤ 5`, `ℓ(D−E) = 2 = 4−2`; `ℓ(2K−E) = 2 ≠ 3−2` | True; `2K` (degree `2g`) is not very ample, so `2g+1` is needed |
| 6.3 Artin–Schreier citation | `y²+y = x⁵` over `𝔽₂`, `m = 5`, `p = 2` | exponent `(2−1)(5+1) = 6`; `2g−2 = 2 = 2(−2)+6` | Agrees with the 6.3 Check (“different degree six”) |
| `:183–188` supply; table `:2183` | two degree-3 subfields; hyperelliptic genus-2 involution; signature `(1; 2⁴)` | `g ≤ (3−1)(3−1) = 4 < 5`; `deg Fix = 6 = 2g+2`; `4 = 2(2·1−2+4·½)` | True: 5.2(f), 6.3, 6.7 |
| 6.7 (sample) | Fermat quartic, `z ↦ −z`; `y² = x⁸+3x⁴+1`, `x ↦ −x` | 4 fixed points each, quotient genus `1`; only the second hyperelliptic | True; it combines 5.2(f), 6.2 and 6.6 and needs no external locator |
| Description: “9 layers and 61 milestones” | heading count at the head | 9 `## Layer`, 61 `### k.n` | True |

The rows for untouched statements stand as in the previous review, of `86fe709`.

- **Gate:** the worker's gate passes at `b184835` (`build=0`). My rerun has the same counts except `depcheck: NOT IN ORDER`, which comes from the default order. With the candidate order: `depcheck: 205 roadmaps, 1896 edges, 0 problem(s)`, with no UPWARD, CYCLE or `moved:` line. Nothing changes outside the folder.
- **Elaboration:** `lake env lean Suggested.lean` exits 0 with 51 `sorry` warnings and nothing else.
- **Sources, 7 locators checked:** Stacks Curves Situation 6.2 (stacks-project line 496), Tags 0E3C, 0E3D and 0H2V (lines 2490–2521); poonen-2007 lines 13–75 and 326–381; Derickx–van Hoeij v3 lines 17–40 and 573–596.
- **Tau Ceti `2fd255d`, 10 declarations opened:** `Fibers.lean:43, 55`; `Scheme/BaseAlgebra.lean:102`; `Different/Hurwitz.lean:72, 120`; `Different/Galois.lean:134`; `Different/ArtinSchreier/Basic.lean:130`; `Hyperelliptic/Basic.lean:87`; `FunctionField/Basic.lean:51`; `Curves/StableReduction/Model/`.
- **Cross-roadmap citations resolved:** ModularCurves §0A.1 and §0A.4–0A.5 resolve at #2140 through its label rule (`:4495`, Layer 0.1 items 1, 4 and 5 at `:774–791`), so the overlap lead needs no change. GroupActionsOnRiemannSurfaces is at #1728 (`:122`, `:1379–1392`, `:1696`). #1707, #1722, #1727 and #2130 cite this roadmap, and none cites 6.7, 9.3 or the old 6.7 heading.
- **Overlap check:** read AlgebraicCurves (main, #1807, #1808), AdelicImagesAndModularCurves (#1727), GroupActionsOnRiemannSurfaces (#1728) and HyperellipticCurves (#1707). Gonality under good reduction is owned here only (searched open heads and main). The fibres and the quotient genus are Tau Ceti's. Trigonal uniqueness is D01.
- **Remarks (no change asked):**
  - At `:1501`, “(6.7)” is this roadmap's 6.7 by the README's convention (another roadmap's sections are written “its N”); the sibling has no 6.7.
  - `[PerfectField κ]` is not used by the first inequality of 9.3: its proof sketch works over any residue field.

## Not verifiable

- Derickx 2012 (the thesis that Derickx–van Hoeij credit for inequality (1)), Frey 1994 and Deuring 1942 are not cached and are paywalled or not online. The published J. Algebra version of Derickx–van Hoeij was not read; only arXiv v3 was.

## Source issues

- **Misprint** in Derickx–van Hoeij 2014 (arXiv:1307.5719v3) at §1, p. 1: the source says a prime of good reduction “of then”, omitting the curve; it should read “of `C`, then”; affects nothing.
