# Review of BallQuotientsAndComplexHyperbolicLattices (pull request #2425 at a4e5dee)

**Verdict:** accepted

No findings.

## Previous findings

- R01 — repaired (withdrawn; no change was needed): ShimuraVarieties §P.6 at its head 314489c (unchanged since 2026-11-10) already states "If `Z` is normal, prove normality of the quotient" and that finite algebraic invariant quotients over ℂ analytify to its construction. The previous review misread it.
- R02 — repaired: description, Approach and generality: "The toroidal compactification is for neat lattices; extension and Borel algebraicity are proved for torsion-free ones and fail for the modular group."
- R03 — repaired: the description lists 15 suppliers on main and the four open ones, and says "ShimuraCompactifications to delimit it and as the base of a later Part II; none is a dependency."

## Verified sound

| Statement | Instance | Roadmap side | Computed / source side | Result |
|---|---|---|---|---|
| Summary + §10.2, extension for torsion-free Γ | image of Γ(3) in PSL(2,ℤ); f: Δ* → X_Γ | X_Γ = ℙ¹ minus 4 points; f extends to Δ → (S*_Γ)^an = ℙ¹ | index 12, 12/3 = 4 cusps, g = 1 + 1 − 0 − 0 − 2 = 0; f omits 4 values, so big Picard gives at worst a pole | holds |
| Summary + §10.2 Check, torsion excluded | PSL(2,ℤ), f(z) = exp(1/z) into Y(1) ≅ ℂ | no extension to Δ → ℙ¹ | z_k = 1/(2πik): f = 1; z_k = 1/k: f = e^k → ∞; two limits at 0 | holds; the hypothesis is needed |
| Summary + §10.3 Borel algebraicity; MilneSVI Thm 3.14 line 1742 to line 1744 | V = 𝔸¹; Γ(3) image; PSL(2,ℤ) | maps ℂ → S_Γ algebraic for torsion-free Γ; exp: ℂ → Y(1) not | ℂ → ℙ¹ minus 4 points is constant (little Picard); exp hits 1 infinitely often, a nonconstant polynomial finitely often | holds |
| §10.1 hyperbolic embedding; Kiernan1972 line 57 to line 75, Deng2020 line 61 to line 63 | circle \|q\| = r | length √2π/\|log r\| → 0 | Kiernan (2): diameter of that circle → 0; Deng: torsion-free arithmetic quotients hyperbolically embedded in Baily–Borel | holds |
| §10.2 locators; Kiernan1972 Thm 1 line 111 to line 116, Thm 2 line 157 to line 160; MilneSVI Lemma 3.15 line 1746 to line 1748 | r = 0; r + s = 1 | Δ^s → X_Γ needs nothing; Δ* → X_Γ extends | Thm 1(ii) is the punctured disc; Thm 2 is normal-crossing complements; Milne: Δ*^r × Δ^s | holds |
| R01: §§7.1, 9.5 ← ShimuraVarieties §P.6 | z ↦ −z on ℂ, F = {±1} | (Z/F)^an = Z^an/F, normal | ℂ[z]^F = ℂ[z²]; §P.6 Check: quotient coordinate z²; §P.6 at 314489c states normality and the analytification | holds |
| R02: description generality | PSL(2,ℤ), exp(1/z) | extension and Borel algebraicity for torsion-free lattices, failing for the modular group | §§10.1–10.3, 10.4(a) assume torsion-free; §10.2 Check refutes the torsion case | holds |
| R03: description dependencies | 15 on main, 4 open, 3 named for scope | the list | all 15 folders on main at 51d880d (HopfRinow, ConformalMapping under Completed/); ShimuraCompactifications only at README lines 19 and 965 | holds |

The rows for untouched statements (the seven headlines of `Suggested.lean` and §§1.5–12.3) stand as in the previous review, of eeb54a8.

- Sources: 9 locators read against the cached texts (Kiernan1972 3, MilneSVI 4, Deng2020 1, plus Kiernan's definition of hyperbolic embedding); each supports §§10.1–10.4 as written, for torsion-free lattices.
- Cross-roadmap: ShimuraVarieties §P.6 read at head 314489c (`roadmaps show` and the file at that commit agree); the 19 suppliers named by the description resolved; `roadmaps resolve` reports no unresolved cross-roadmap citation, and its 21 Lean-name leads are supplier target names, as before.
- Gate: every check passes (`gate … OK`; the worker's run includes `build=0`). Depcheck: `depcheck: 242 roadmaps, 2267 edges, 0 problem(s)`. Nothing changes outside the folder.
- Lean: `Suggested.lean` has not changed since eeb54a8. `lake env lean` gives 7 `sorry` warnings and nothing else. The `#check @` comparison and the padding probe of the previous review still hold.
- Overlap check: scopes of RealSemisimpleLieGroups, ArithmeticFuchsianGroups, KleinianGroups, ShimuraVarieties, LieGroupsPartII, FuchsianOrbifolds, AdelicAlgebraicGroups and ConformalMappingPartII were read for eeb54a8, and ShimuraVarieties again now. The diff moves no ownership, and no open pull request changes or drops an id here. The owners stand: RealSemisimpleLieGroups §5.7 (ball, PU(1,n), sub-balls), ShimuraVarieties §§2.5–2.7 and 3.1–3.3, FuchsianOrbifolds Layers 0–4 and AdelicAlgebraicGroups §§3.4 and 4.3. All of them are cited.
- Source independence: changed passages only. The summary paragraph was compared by hand with Kiernan1972, MilneSVI and Deng2020 at the locators above, and scanned for 6-word runs shared with all 8 cached texts: none shared. Largest share is BaldiUllmo2023, 39 of 148 locators (the diff adds none). Contents were not compared again, since no layer was added, removed or reordered.
- Remark (untouched wording, no change asked): the summary's "holomorphic maps from algebraic varieties" is wider than §10.3's "smooth variety V" (MilneSVI line 1743 assumes nonsingular V).

## Not verifiable

- Borel1972 Theorem A (§10.2, arithmetic case): uncertified, so its locator was not checked.
- Goldman1999, Raghunathan1972, GarlandRaghunathan1970, Borel1969, BailyBorel1966, SiuYau1982, Cartan1957 and Alperin1987: uncertified or waived, as in the previous review; not cited by the changed passage.

## Source issues

- none

## For the human reviewers

- none
