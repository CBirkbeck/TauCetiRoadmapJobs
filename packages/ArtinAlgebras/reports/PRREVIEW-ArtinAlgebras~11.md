# Review of ArtinAlgebras (pull request #2190 at e1b2c59)
Folder: `TauCetiRoadmap/RepresentationTheory/ArtinAlgebras/`
**Verdict:** needs changes

## R01 (P3) — The description stops at the fifth commit

**Location:** pull-request description, last review-fix paragraph: “**Fourth review fix** (fifth commit): the §3.3 target, uniqueness of almost-split conflations, now names its route …”

**Claim:** the sixth commit changes the Tau Ceti supplier contract and the §3.3 *Needs:* line. The description was written for `210c6e0` and does not mention it.

**Witness:** `git log origin/main..HEAD` ends with `e1b2c59` after `210c6e0`. Its diff adds README:208–209 (two `mem_jacobsonRadical_iff_not_isSplit…` names), moves README:178–179, and appends README:821–825. No paragraph names these changes.

**Repair:** append to the description: “**Fifth review fixes** (sixth commit): `TauCeti.IsRightAlmostSplit.exists_iso_of_minimal` moves among the Tau Ceti results valid in any category; ‘From Tau Ceti’ adds `TauCeti.mem_jacobsonRadical_iff_not_isSplitMono` and `TauCeti.mem_jacobsonRadical_iff_not_isSplitEpi`; the §3.3 *Needs:* line lists the Tau Ceti inputs of the uniqueness route.”

## Previous findings

Ids refer to `packages/ArtinAlgebras/reports/PRREVIEW-ArtinAlgebras~10.md`.

- R01 — repaired: README:177–180 put “`TauCeti.IsRightAlmostSplit.exists_iso_of_minimal` (`TauCeti.CategoryTheory.AlmostSplit.Minimal`)” in the arbitrary-category sentence. “the last three” (187) now qualifies `isIrreducibleMorphism_iff_exists_isSplitMono`, `rightRadicalQuotientEquiv` and `leftRadicalQuotientEquiv`.
- R02 — repaired: README:821–825 append “for the uniqueness, Tau Ceti `TauCeti.jacobsonRadical`, … `TauCeti.mem_jacobsonRadical_iff_not_isSplitEpi`, `TauCeti.IsRightAlmostSplit.exists_iso_of_minimal`”. README:208–210 add both names “for a source, resp. target, with local endomorphism ring”.

## Verified sound

| Statement | Instances tried | Values computed | Result | Change |
| --- | --- | --- | --- | --- |
| “From Tau Ceti”, arbitrary category: `exists_iso_of_minimal` (177–180) | pinned signature; deflation `d : ℤ/4 → ℤ/2` over `ℤ/4`, with `b = 3` | Minimal.lean:163 assumes only `[Category C]`. `3≫d = d` since `3 ≡ 1 mod 2`, and `3` is a unit of `ℤ/4` | grouping matches the pin | none |
| “the last three for end terms with local endomorphism rings” (181–188) | the four declarations of the balanced sentence | `nonempty_iso`: `[Preadditive] [Balanced]` (Uniqueness.lean:92), no locality. Components.lean:40–42 and RadicalQuotient.lean:39–41 assume `IsLocalRing (End S.X₁)`, `IsLocalRing (End S.X₃)` | the last three are exactly the local ones | none |
| radical bullet: `…not_isSplitMono` for a local source, `…not_isSplitEpi` for a local target (208–210) | `pr₁ : k² → k`, `incl₁ : k → k²` | `pr₁` is split epi and `𝟙_k − incl₁≫pr₁ = 0`, so `pr₁ ∉ rad`. `pr₁` is not split mono, yet `𝟙 − pr₁≫incl₁ = diag(0,1)` is not invertible, so source locality is needed | pin: Radical/Basic.lean:337/343 omit `End Y`, 355/360 omit `End X`; matches | none |
| §3.3 *Needs:* inputs, both ends (819–825) | `ℤ/2 →i ℤ/4 →d ℤ/2` over `ℤ/4` | `Hom(ℤ/4,ℤ/2) = {0,d}`, `Hom(ℤ/2,ℤ/4) = {0,i}`, `i≫d = 0`, so `𝟙 − i≫u = 𝟙` and `𝟙 − v≫d = 𝟙`. Both lie in rad; `End(ℤ/2) = 𝔽₂` is local | source and target lemmas cover the inflation and the deflation | none |
| §3.3 left-end dual of `exists_iso_of_minimal` | two almost-split sequences starting at `k` over `k[ε]/(ε²)`, `f' = μf` | `e = μ·𝟙`, `f≫e = f'`. The dual follows in `Cᵒᵖ` through pinned `TauCeti.isLeftAlmostSplit_op_iff` (Basic.lean:230) | “dually” is supplied | none |
| seeded §3.3: [INP, Thm. 2.9 and Prop. 2.10, p. 12] | INP lines 779–811 (page marker 12 at line 743) | Thm 2.9: almost split ⟺ (AS1) with `C` endo-local ⟺ sink deflation. Prop 2.10(1): (AS1) ⟺ inflation left almost split | locators and page correct | none |

Rows for untouched statements stand as in the previous review, of `210c6e0`.

- Source locators checked against the text: 2 (INP Thm 2.9, Prop 2.10, INP lines 779–811). The seeded sample meets the change only in §3.3, whose changed *Needs:* line carries no locator.
- Library at the pin, 12 declarations opened: Radical/Basic.lean:166, 343, 360; AlmostSplit/Minimal.lean:167; AlmostSplit/Basic.lean:216, 230, 593, 606; Uniqueness.lean:138; Components.lean:68; RadicalQuotient.lean:119, 171; module paths match the README's parentheses.
- Gate: the worker's gate at `e1b2c59` passes. A hand run reports every check 0 except `outside-folder` for `TauCetiRoadmap/RepresentationTheory/README.md`, the family index, which is this pull request's own file and is unchanged since `210c6e0`.
- Elaboration: `lake env lean Suggested.lean` gives 19 `sorry` warnings and nothing else. `Suggested.lean` is unchanged since `210c6e0`, so the `#check @` comparison and the one-tactic probe (0 of 19 closed) stand.
- Dependency check: `depcheck: 206 roadmaps, 1897 edges, 0 problem(s)`, with no UPWARD or CYCLE line.
- Overlap check: read RepresentationTheory (main and the three open heads), QuiverRepresentations (main), GrothendieckEulerForms (main), GeneralAlgebraicKTheory (open). A search for almost-split conflations, right minimality and the two radical lemmas finds only the family-index line assigning them to ArtinAlgebras. Nothing is shared.
- Remark, untouched §3.3 text: the extension-class criterion assumes “indecomposable end terms”, while INP Thm 2.9(2) assumes `C` endo-local. The two agree in the Krull–Schmidt setting the *Needs:* line names.

## Not verifiable

- abm (Assem–Beligiannis–Marmaridis, CMS Conf. Proc. 24, 1998): no legal copy found, as in the previous review.
- ars, ass, kr03, au78, mu, Nakaoka–Palu: as in the previous reviews.

## Source issues

- none
