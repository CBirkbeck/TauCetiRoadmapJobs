# Review of MappingClassGroupsAndCanonicalRepresentations (pull request #2266 at e40458f)

**Verdict:** needs changes

## R01 (P3) — The description misstates which suppliers are open and whose they are

**Location:** pull request description, paragraph "Dependencies": "In open pull requests of ours: … #1056 (FormalConnectionsOpers) … #1015 (NoncompactQuantumSymmetry) … #1169 (TeichmullerGeometry). Roadmaps on main are cited by name; everything else named in the README is a consumer, not a prerequisite."

**Claim:** Two sentences are contradicted by the head. Three of the listed pull requests are another author's, and two suppliers the README cites are neither on main nor in the list, so they are not "consumers".

**Witness:** #1169, #1056, #1015 are by kim-em. `TauCetiRoadmap/MappingClassGroupsAndCanonicalRepresentations/README.md` lines 85–86 and 142–145 cite FiniteGroupInvariants §10.5 (#1708, roed-math) and MixedHodgeModulesAndIrregularHodgeTheory §§3.1–3.3, 5.6 (no pull request) as suppliers.

**Repair:** Replace the two sentences by: "In open pull requests of ours: … (the list without #1056, #1015, #1169). In open pull requests of other authors: #1056 (FormalConnectionsOpers), #1015 (NoncompactQuantumSymmetry) and #1169 (TeichmullerGeometry), all kim-em, and #1708 (FiniteGroupInvariants, roed-math). MixedHodgeModulesAndIrregularHodgeTheory (§§3.1–3.3, 5.6) is a supplier with no pull request yet. Roadmaps on main are cited by name; StableReductionPartII, NonabelianLevelStructures and MotivicStructuresInModuliOfCurves are consumers."

## R02 (P3) — §7.3 cites a lemma for a step that is inside its proof

**Location:** `TauCetiRoadmap/MappingClassGroupsAndCanonicalRepresentations/README.md` lines 2472–2475: "a local system on `C°` as in §7.2 whose monodromy is induced from a representation of a finite-index subgroup of `PMod(g, n + 1)` has quasi-unipotent local monodromy … (Landesman–Litt, Lemma 8.3.3, p. 40)".

**Claim:** Lemma 8.3.3 states integrality of `Pρ`, which is §7.4's target (line 2489 cites it correctly). Quasi-unipotence of the boundary monodromy is a step of its proof. "Induced" also reads as `Representation.ind` of §7.1, which is not meant.

**Witness:** LL24 lines 1643–1647: the statement of Lemma 8.3.3 concludes "is integral". LL24 lines 1657–1670: the quasi-unipotence argument, inside the proof. §7.2 (README line 2450) already writes "proof of Lemma 8.3.3".

**Repair:** Line 2472–2475 becomes: "a local system on `C°` as in §7.2 whose monodromy is the restriction to `π₁(C°)` of a representation of a finite-index subgroup of `PMod(g, n + 1)` has quasi-unipotent local monodromy along `C̄ ∖ C°`; … (Landesman–Litt, proof of Lemma 8.3.3, p. 40)".

## R03 (P3) — Layer 12 has no `### Examples` subsection

**Location:** `TauCetiRoadmap/MappingClassGroupsAndCanonicalRepresentations/README.md` lines 3253–3269: `### 12.9 Rigid local systems on punctured spheres` is followed directly by `### Dependencies`.

**Claim:** Every layer ends with `### Examples` and `### Dependencies`; Layers 0–11 do, Layer 12 does not.

**Witness:** `grep -n '^### Examples'` on the README gives twelve hits, the last at line 3076 (Layer 11); between line 3089 (`## Layer 12`) and line 3267 (`### Dependencies`) there is none.

**Repair:** Insert before line 3267:

    ### Examples

    - On `Σ_{1,1}` with `λ = 2`, the representation `a ↦ diag(2, 1/2)`, `b ↦ [[0, 1], [−1, 0]]` of
      §12.5 has `r² = 4 ≥ g + 1 = 2` and infinite image, while every MCG-finite character of the same
      group is torsion (§3.3).
    - For `F₂`, §12.1 gives the rank-three representation with generators `I₃ + E₁₃`, `I₃ + E₂₃`; with
      `N = 2 = 2g` the bound of §9.7 allows only `r = 1`, and `3² = 9 ≥ 2`.

## R04 (P3) — "Corrections to the sources" lists a remark that is not corrected

**Location:** `TauCetiRoadmap/MappingClassGroupsAndCanonicalRepresentations/README.md` lines 3424–3425, under "The following statements of the sources are corrected": "Landesman–Litt, Remark 10.2.2, p. 52: the argument shows finiteness of rank-two MCG-finite representations for every `g ≥ 2`, not only `g = 2, 3`".

**Claim:** The remark asserts nothing false. It says the bound `r < √(g + 1)` is not sharp at `g = 2, 3`, which is exactly where rank two lies outside the bound; its argument is stated for `π₁(Σ_{g,n})` without restricting `g` further.

**Witness:** LL24 lines 2192–2201: the remark concludes non-sharpness for `g = 2` and `g = 3` from BGMW17 Theorem A and CH19 Theorem B; no statement in it fails for `g ≥ 4`, where `4 < g + 1` holds only from `g = 4`.

**Repair:** Delete the bullet at lines 3424–3425; §12.6 already states the `g ≥ 2` form with its locators (BGMW17 line 53, CH19 line 268).

## Verified sound

| Statement | Instances tried | Values computed on each side | Result | Change |
|---|---|---|---|---|
| §1.2 lifting through `G_D → PGL_r` | `G = ℤ`, `N = 2ℤ`, `r = 1`, `ρ_N(2) = −1`; Klein four in `PGL₂` | `D = μ₄`: lift `1 ↦ i`, `tg = 0` in `μ₄/μ₂`. `D = μ₂`: `D/D² = μ₂`, class `−1 ≠ 0`, no lift. Klein four: lifts anticommute | holds | none |
| §1.4 representation schemes | `Γ = ℤ/2`, `r = 2`; `Γ = ℤ`, `[[1,1],[0,1]]` | `R₂`: `{I}`, `{−I}`, orbit of `diag(1,−1)` of dim 2; three components, `M₂` three points. Unipotent and `I`: same trace 2 | holds; Sik12 line 572 | none |
| §2.5 finite-index image | `z ↦ z²` on `ℂ^×`; point `→ ℂ^×` | index 2; index infinite (not dominant) | holds; LL24 lines 555–561 | none |
| §2.7 fibral MCG-finiteness | `V` pulled back from `M` | fibre restriction trivial, orbit of size 1; LL24 line 549 assumes dominant étale only | holds | none |
| §3.3 rank-one finiteness | `(g,n) = (1,0)`, `(1,2)`, `(0,3)` | `T_a^k`: `(λ, μ) ↦ (λ, λ^k μ)`; push: `χ(a) ↦ χ(a)χ(c₁)^k`; `(0,3)`: `PMod` trivial, `c₁ ↦ 2` infinite | holds for `g ≥ 1`; LL24 lines 644, 656 | none |
| §4.1 pointed killing | `𝔾_m`, `α ≠ 0` in `H¹(ℤ, ℤ/2)` | squaring pulls `α` back to `2α = 0`, base point `1 ↦ 1` | holds; LL24 line 666 unpointed, LL-P04 line 2683 pointed | none |
| §5.2 parabolic degree | `ℙ¹ ∖ {0,∞}`, monodromy `e^{−2πia}`; `O ⊕ O(1)` at `x` | residues `a`, `1 − a`, `deg = −1`, par-deg `0`. Second: par-deg `1 + a`, slope `(1+a)/2 < 1`, `O(1)` slope `1` | holds; LL22 lines 401, 414, 490, 496, 525, 529, 541, 742, 1863 | none |
| §5.3 equal-slope form | `O(p) ⊕ O(−p)`, `d`, type `(1,1)`; `L ⊕ O`, type `(1,2)` | residues `−1, +1`, par-deg `0`, `O(p)` slope `1 > 0`, rank `2 < 2√2`. Second: par-deg `−a`, `O` slope `0 > −a/2` | README form holds; LL22 line 1310 fails | none |
| §6.1 Prym definitions | `H = 1`; `ℤ² → ℤ/3` with `−I`; order-3 matrix | isotypic dim `2g + n − 1` or `2g`; `φ∘(−I) = −φ ≠ c_h∘φ`; `J⁻¹A^{−T} = AJ⁻¹ = [[−1,0],[−1,−1]]` | holds; LL24 lines 1440–1456 | none |
| §7.1 multitwists | `A₃ ⊂ S₃`, `ω`; `PMod(0,4) = F₂` | `Res Ind ω = ω ⊕ ω²`; character `↦ 2` not quasi-unipotent; cut of genus 3: a piece of genus `≥ 2` | holds; AS16 lines 436–441 | none |
| §7.3 boundary monodromy | locator | LL24 line 1643 states integrality; quasi-unipotence at lines 1657–1670 | locator wrong | R02 |
| §8.2 algebraic constancy | `A(t) = [[1,t],[0,1]]` | rank of `A(t) − I`: `1` for `t ≠ 0`, `0` at `0`; `H¹(ℤ, sl₂) = sl₂ ≠ 0` | hypotheses needed; LL24 line 1752 | none |
| §8.3 semisimple case | `g = 1, 2, 3, 8` | allowed ranks: `1`, `1`, `1`, `≤ 2`; genus-one dihedral: `4 ≥ 2` | holds; LL24 line 1786 | none |
| §9.1 socle transport | `U` on `H ⊕ ℂ`, `g ≥ 1` and `g = 0` | socle `H` of dim `2g`, quotient `ℂ`; `g = 0`: socle `ℂ`, length 1 | holds; LL24 lines 1849–1857 | none |
| §9.9 characteristic quotients | `ℤ²`; `ℤ` | `e₂ ↦ ke₁ + e₂`: `(λ, μ) ↦ (λ, λ^k μ)`; `1 ↦ 2`: orbit `{2, 1/2}`, `g = 0`, `1 < 1` false | holds; LL24 line 227 | none |
| §12.4 Morita's extension | `g = 2` | restriction factor `2 − 2g = −2 ≠ 0`; Mor89 line 886 (printed p. 804), lines 900–905 | holds | none |
| `mcgFinite_finite_image` | `g = 0`; `(1,0,r=1)`; `(1,1,r=2)` | `r = 0`, `GL₀` trivial; `GL₂(ℤ)`-finite characters torsion; `4 ≥ 2` excluded | holds; LL24 line 95; Lean hypothesis implies the source's | none |
| `freeGroup_finite_image` | `N = 0, 1, 2, 3` | `g = 0 ⇒ r = 0`; `N = 2, 3`: `g = 1`, `r = 1`, torsion; `U_{F_N}`: `(N+1)² ≥ g + 1` | holds; LL24 line 179 | none |
| `rankTwo_mcgFinite_finite_image` | `g = 1`; `g = 2, 3` | `g = 1`: dihedral example infinite; `g = 2, 3`: `4 ≥ g + 1`; CH19 case (2) needs `g = 1` | holds for `g ≥ 2`; BGMW17 line 53, CH19 line 268 | none |
| `higherPrym_rank_bound` | `H = 1`; `g = 2`, `ℤ/2`; `g ≤ 1` | fixed classes vanish, `W ⊇ H¹(Σ_g)`, `dim ≥ 2g`; parts `4`, `2 ≥ 2`; `2g ≤ 2d` trivially; `finrank` finite | holds; LL24 line 1473 | none |
| `putmanWieland_of_irreducible_dim_lt` | `ℤ/5`, `g = 2`; `S₃`; `g ≤ 1` | `d = 1 < 2`; needs `g ≥ 3`; trivial `d = 1 ≥ g`, hypothesis false; line: `1 ≥ 2g − 2d ≥ 2` impossible | holds; LL24 line 1481 | none |
| `putmanWieland_of_card_lt` | `H = 1`, `g = 2`; `g = 0, 1` | `1 < 4`; `d² ≤ #H < g² ⇒ d < g`; no `H` with `#H < g²` | holds; LL24 lines 154, 1490 | none |
| §0.3 twist convention | torus, `î(a,b) = 1` | README `T_a`: `[[1,1],[0,1]]`, `T_b`: `[[1,0],[−1,1]]`; MordellLawrenceVenkatesh §5.12: `[[1,−1],[0,1]]`, `[[1,0],[1,1]]` | inverses, as stated; GeometricTopology §1.7.2 agrees | none |
| §0.1 transport | `(g,n) = (1,1)` | `(ab)(b⁻¹a⁻¹ba)(ab)⁻¹ = bab⁻¹a⁻¹ = [a,b]⁻¹` | holds | none |
| §1.3 `d_n` | `n = 1, 2` | `a + bt ↦ a + bε`; `a + bt + ct² ↦ a + bt + ε(b + 2ct)`; kernels `0` | holds | none |
| §1.5 Jordan identity | `u^m`, `l^m` in `GL₂(𝔽_p)` | `u^m l^m = [[1+m², m],[m, 1]]`, `l^m u^m = [[1, m],[m, 1+m²]]`; equal iff `p ∣ m` | holds | none |
| §5.7 Artinian vanishing | `rk U = u`, `rk W = w`, `u < g` | `w ≥ 2g − 2u`, `uw ≥ 2u(g − u) ≥ 2(g − 1) ≥ g` for `g ≥ 2` | holds | none |
| §5.11 Salem check | `x⁴ − x³ − x² − x + 1` | `y² − y − 3`: `y ≈ 2.303, −1.303`; `λ ≈ 1.722`, `λ⁻¹ ≈ 0.581` | holds | none |
| §9.2 splitting | `a = b = 1`; general | `2g − 2 > 1` for `g ≥ 2`; `3ab < 3(g+1)/4 ≤ 2g` for `g ≥ 1` | holds | none |
| §12.3 augmentation | `(g,n) = (1,1)` | group algebra of `ℤ²` commutative, `[α − 1, x] = 0`, sequence splits | README range `2g − 3 + n > 0` right | none |
| Layer 12 shape | headings | `### Examples`: 12 hits, none after line 3089 | missing | R03 |

- Source locators checked against the text: 78 page locators of LL24 (25 statements read in full), 28 of LL22, and 14 others (AS16, Kor02, Mor89, HS53, Sik12, Sim90, BGMW17, CH19, KS16, LL-P04).
- Library declarations opened at the pins: 31, among them `FundamentalGroup.mul_def` (`Mathlib/AlgebraicTopology/FundamentalGroupoid/FundamentalGroup.lean:44`), `Representation.IsIrreducible.bijective_or_eq_zero` (`Mathlib/RepresentationTheory/Irreducible.lean:65`), `TauCeti.ContCohomology.transgression` (`TauCeti/RepresentationTheory/Homological/ContCohomology/Transgression.lean:702`, under `[CompactSpace G]` line 577 and `[TotallyDisconnectedSpace G]` line 696, as the README says), `TauCeti.FreeGroup.nielsenMul` (`TauCeti/GroupTheory/FreeGroup/Nielsen.lean:45`).
- Cross-roadmap citations resolved: every cited section of 25 suppliers, on main or at the open head; MixedHodgeModulesAndIrregularHodgeTheory §§3.1–3.3 and 5.6 only against its board package (no pull request).
- Gate: every check passes. Elaboration: `Suggested.lean` gives six `sorry` warnings and nothing else. `#check @name` on the theorems: no lost binder; each type equals its README statement.
- One-tactic probe (`rfl`, `simp_all`, `infer_instance`, `trivial`, `omega`) on a scratch copy: none of the six theorems closes; no padding.
- Dependency check: `depcheck: 221 roadmaps, 1962 edges, 0 problem(s)`; the roadmap is at position 293, after its last supplier TeichmullerGeometry (290).
- NonabelianLevelStructures (open) declares `gap:punctured-torus-nielsen` on this roadmap; this README states no such target (not a finding of this review).
- Overlap check: read MordellLawrenceVenkatesh, TeichmullerGeometry, InverseGaloisAndArithmeticFundamentalGroups (also GroupActionsOnRiemannSurfaces, SheafConvolutionOnAbelianVarieties, PainleveEquations); surfaces, twists and the Birman sequence: MordellLawrenceVenkatesh; closed Teichmüller theory and Dehn–Nielsen–Baer: TeichmullerGeometry; arithmetic representations and versal covers: InverseGaloisAndArithmeticFundamentalGroups; each cited, none owned twice.

Source independence: 11 passages compared with 5 sources (LL24, LL22, AS16, LL-P04, BGMW17), none shared beyond statements the mathematics forces (longest run 8 words, the pointed lemma of §4.1 against LL-P04 line 2683); largest share LL24, 94 of 194 locators; contents compared with LL24: independent (its §3 precedes its §2 here as Layer 1, its §§4–6 and 8.1–8.2 merge into Layer 5, its §8 splits over Layers 5, 7, 8, 9; the order of Layers 6–11 is forced by their *Needs:* lines).

## Not verifiable

- Debarre, Lemma 4.19 (§2.5): uncertified, text not read.
- Farb–Margalit locators (Proposition 6.3, Fact 4.7, Theorems 4.6 and 3.18, Proposition 3.19, §§8.2, 10.6.3): uncertified, text not read.
- Mehta–Seshadri, Theorem 4.1, and Deligne 1970, Remarques 5.5(i) (§5.2): uncertified; the statement was checked against Sim90 line 1692 and LL24 line 1264 instead.
- Morita 1993 (§12.2), Waterhouse (§1.5), Nielsen 1924 and Magnus–Karrass–Solitar (§9.6): uncertified, text not read.

## Source issues

- **Misprint** in LL24 at Lemma 2.0.1, p. 12: the source says both fundamental groups are isomorphic to the pure mapping class group with `n` punctures; it should be `n + 1` punctures for the second; affects nothing.
- **Misprint** in LL24 at Lemma 7.2.5, p. 36: the source says the boundary-replaced cover has genus `g`; it should be genus `g′`; affects nothing.
- **Gap** in LL24 at Lemma 2.3.3, p. 16: the source says the class dies on an étale neighbourhood of the generic point; it should be a pointed étale neighbourhood of the base point, which Proposition 2.3.4 needs; affects the proof.
- **Error** in LL24 at Lemma 2.2.2, pp. 14–15: the source says the projective extension is unique; it should be only that the extension built from actual intertwiners exists; affects a stated result.
- **Error** in LL24 at Example 10.1.6(2), p. 51: the source says the augmentation sequence is non-split for every `n > 0`; it should be for `2g − 3 + n > 0`, since it splits for `(g, n) = (1, 1)`; affects a stated result.
- **Error** in LL22 at Corollary 6.1.2, p. 35, and Corollary 1.3.6, p. 7: the source says every flat bundle of rank below `2√(g + 1)` deforms to a semistable one; it should be irreducible monodromy, or a flat filtration with graded pieces of equal parabolic slope; affects a stated result.
- **Error** in LL22 at Lemma 7.5.1, p. 53: the source says finite-image representations are not dense for every punctured surface and rank above one; it should be for nonabelian fundamental group; affects a stated result.
- **Error** in AS16 at the proof of Lemma 2.5, p. 11: the source says the induced representation restricts to a sum of copies of the original; it should be that the original is a direct summand of the restriction; affects the proof.

## For the human reviewers

- **Licence.** LL-P04 (README line 3311) is an author's web page; LL-P04 line 2635 says its review and audit are AI-generated and the erratum was spot-checked by one author. The README calls it "the authors' erratum" (14 places). It is not published.
