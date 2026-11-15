# Review of PivotalSpherical (pull request #2311 at 13e0bd5)

**Verdict:** accepted

## Previous findings

The previous review, of `edbc9ff`, had no finding of its own; its `## Previous findings` bullets R01–R06 were all repaired there, and the passages they concern (`TauCetiRoadmap/PivotalSpherical/README.md` lines 180, 288, 387, 412, 568, and the DGNO sentence now at 453–454) are unchanged at this head.

## Verified sound

Conventions used in every row: associator `ω(g,h,l)`, evaluation `1`, coevaluation `ω(g,g⁻¹,g)⁻¹`, `dω` as displayed in 8.2.

| Statement | Instances | One side | Other side | Result | Change |
|---|---|---|---|---|---|
| 8.2 monoidality identity (derivation) | General `x, y`, `z = xy`; nested evaluation of `δ_{y⁻¹} ⊗ δ_{x⁻¹}` against `δ_x ⊗ δ_y` | Transport scalar `ω(y⁻¹,x⁻¹,z) ω(x⁻¹,x,y)⁻¹`; left side `j_z` times it | Nested left evaluation `j_x j_y ω(x,y,z⁻¹) ω(y,y⁻¹,x⁻¹)⁻¹` | Recomputed from the conventions; agrees with the displayed identity | None |
| 8.2 quotient as `dω` ratio | Expanded with normalization, any normalized `ω` | `dω(y,y⁻¹,x⁻¹,z)/(dω(x,y,z⁻¹,z)·dω(x,x⁻¹,x,y))` reduces to `j_z ω(y⁻¹,x⁻¹,z) ω(y,y⁻¹,x⁻¹)` over `j_x j_y ω(x,y,z⁻¹) ω(x⁻¹,x,y)` | Left side over right side of the identity at `j_g = ω(g,g⁻¹,g)` | Equal as a formal identity; `1` for a cocycle | None |
| 8.2 canonical structure, non-abelian | `S₃` over `ℚ`, `ω` the coboundary of a random normalized 2-cochain (88 distinct values) | Identity holds at all 36 pairs `(x, y)` | Inverse family `j_g⁻¹`: fails at 20 of 36 pairs | Canonical monoidal; inverse family excluded | None |
| Conventions Check, `C₃` coboundary | `b(1,2) = 2` over `ℚ` | `ω(1,2,1) = 1/2`, `ω(2,1,2) = 2`, coevaluation `2`, canonical component `1/2` | Inverse component `2`: ratio to canonical `4`, `4³ = 64 ≠ 1`; identity fails; dimensions `4` and `1/4` | As stated, including "not monoidal" | None |
| 8.3 pivotal pairing and dimensions | `j_g = χ(g) ω(g,g⁻¹,g)`; `Vecℤ`, `χ(1) = 2` | Coevaluation `ω(g⁻¹,g,g⁻¹)⁻¹ j_g⁻¹ = χ(g)⁻¹`; `leftDim = χ(g)⁻¹` (`1/2`) | Evaluation `j_g`; `rightDim = ω(g,g⁻¹,g)⁻¹ j_g = χ(g)` (`2`) | Matches `exactPairingCongrRight`, `leftTrace`, `rightTrace` at the pin; `dω(g⁻¹,g,g⁻¹,g) = ω(g,g⁻¹,g) ω(g⁻¹,g,g⁻¹)` | None |
| 8.4 rotation scalar | `gⁿ = 1`; `f = 1` in `Hom(𝟙, δ_g ⊗ δ_g^{⊗(n−1)})` | `pivotalRotate`: `χ(g)⁻¹ · ω(g⁻¹,g,g^{n−1})⁻¹ = χ(g)⁻¹ ω(g,g^{n−1},g)` | `tensorPowSuccIso V (n−1)`: `tensorPowAddIso` recursion gives `∏_{r=0}^{n−2} ω(g,gʳ,g)`, hom direction | Product `χ(g)⁻¹ ∏_{r=1}^{n−1} ω(g,gʳ,g)`, as stated | None |
| 8.4 small cases | `n = 1`, `g = 1`; `C₂` trivial `ω`, sign `χ`; `C₂`, `ω(1,1,1) = −1`, `χ = 1` | `1`; `χ(g)⁻¹ = −1`; `ω(g,g,g) = −1` | `finrank Hom(𝟙, 𝟙) = 1` (`frobeniusSchurIndicator_one`); Example `ν₂ = −1`; dimensions `1` | Consistent | None |
| 8.4 non-free case | `Hom(𝟙, X^{⊗n})` projective, not free | `LinearMap.trace` is `0` without a finite basis | Text: "otherwise the indicator is `0` by the convention of `LinearMap.trace`" | Agrees with the docstring of `frobeniusSchurIndicator` at the pin | None |
| Layer 8 Example, `C₃` with `ζ₉` | `ω(a,b,c) = ζ₉^{a(b+c−[b+c])}` | Normalized; cocycle defect `< 10⁻¹⁵` over all 81 quadruples; `ω(1,1,1) = 1`, `ω(1,2,1) = ζ₉³` | `ν₃(δ_1) = ζ₉³ = e^{2πi/3}`; `1² ≠ 0` in `C₃`, so `ν₂(δ_1) = 0` | As stated | None |

Rows for untouched statements stand as in the previous review, of `edbc9ff`.

- Source locators checked: 2 adjoining the changed passages: ns line 360 (Definition 3.1, p. 8), dgno line 307 (Proposition 2.3, p. 7). The changed passages add no locator.
- Pinned declarations opened: Tau Ceti `TauCeti/CategoryTheory/Monoidal/TensorPow.lean:54,68,158` (`tensorPow`, `tensorPowAddIso`, `tensorPowSuccIso`), `TauCeti/CategoryTheory/Monoidal/Pivotal/Basic.lean:187,239` (`pivotalExactPairing`, `pivotalCategoryOfRightRigid`), `Pivotal/Trace.lean:88,93`, `Pivotal/FrobeniusSchur.lean:76,159,287`; Mathlib `Mathlib/CategoryTheory/Monoidal/Rigid/Basic.lean:626` (`exactPairingCongrRight`).
- Both names added to *Needs:* lines (`TauCeti.pivotalCategoryOfRightRigid`, `TauCeti.tensorPowSuccIso`) resolve at the pin; no cross-roadmap citation was added.
- Gate at `13e0bd5`: every check `0`, `OK`, on the worker's run (with `build=0`) and on a second run. No change outside the folder; worktree clean.
- Dependency-check output: `depcheck: 245 roadmaps, 2207 edges, 0 problem(s)`; no UPWARD or CYCLE line.
- Direct elaboration of `TauCetiRoadmap/PivotalSpherical/Suggested.lean`: 19 `sorry` warnings, nothing else. The file is identical to the one at `edbc9ff`, so the signature probe of the previous review stands; Layer 8 has no Lean statement.
- Pull-request title and description read against this head: 0 contradictions; the change adds or removes no heading, declaration or supplier, and the Layer 8 clause of the description still describes it.

Overlap check: read PresentationsOfMonoidalCategories, OcneanuRigidity, CategoricalOperatorAlgebras, QuantumGroups, TemperleyLieb; PivotalSpherical owns `Vec^ω_G`, its pivotal structures and indicators; PresentationsOfMonoidalCategories cites Layer 8.1 as a consumer (its README lines 144 and 365); nothing else shared with the changed passages.

Source independence: changed passages only; 4 passages compared with 3 sources (ns, dgno, egno), none shared: the added text is computation in the roadmap's own conventions; largest share egno, 16 of 32 bracketed source citations. Contents not compared again: no layer was added, removed or reordered.

## Not verifiable

- `freyd-yetter`: settled as uncertified; no changed passage cites it.

## Source issues

- none

## For the human reviewers

- none
