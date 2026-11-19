# Review of MappingClassGroupsAndCanonicalRepresentations (pull request #2266 at b09679c)

**Verdict:** accepted

**Summary.** Accepted: a full review of the whole folder found no false or unsupported statement, and the six Lean headlines agree with the README and with the sources at their locators. There are two small corrections (an attribution in §11.6 that the authors' erratum does not support as worded, and a consumer named in the scope section but missing from the consumer list and from the description) and one question on a Farb–Margalit sign that could not be read; none blocks. Two points are left to the human reviewers: the status of the authors' erratum page, and the fact that the roadmap corrects two statements of a published paper.

## C01 — The erratum deletes Remark 9.2.5 outright, so "in the form left by the authors' erratum" attributes §11.6's statement to a source that no longer makes it

A reader who opens the erratum to find the statement `R[1/p] = 0` finds nothing: in §11.6 (README line 2645) the non-flatness statement is cited as "Landesman–Litt, Remarks 9.2.5–9.2.6, p. 49, in the form left by the authors' erratum", and the corrections list (line 3535) says the erratum "deletes the inference". The erratum entry (LL-P04 lines 2889–2891) deletes Remark 9.2.5 entirely and the last sentence of Remark 9.2.6; what remains asserts neither non-flatness nor `R[1/p] = 0`. The statement itself is sound and is this roadmap's own precise form of the original remark (LL24 lines 2071–2076): a point of a nonzero `R[1/p]` over a finite extension `E` of `W(F)[1/p]` gives a lift to `GL_r(O_E)` of `ρ̄_Π`, whose restriction to the geometric group extends to `Π`, hence is fixed by `Γ_{K′}` and arithmetic, against §11.3.

The smallest change: in §11.6 write "(the non-flatness asserted in Landesman–Litt, Remark 9.2.5, p. 49, made precise here; the authors' erratum withdraws that remark together with its complete-intersection inference)", and in the corrections list "the authors' erratum deletes Remark 9.2.5 and the last sentence of Remark 9.2.6".

## C02 — SurfaceGroupCharacterVarieties is named as a consumer in the scope section but not in the consumer list or the description

The scope section (README lines 3034–3040) says of SurfaceGroupCharacterVarieties "That roadmap consumes this one and proves the comparisons", and its head does cite §§0.1–0.3, 1.4 and 2.1 here (SurfaceGroupCharacterVarieties README lines 99–130, 716–719, 833). The section "Downstream consumers" (lines 2867–2878) does not list it, and the description's sentence "StableReductionPartII, NonabelianLevelStructures and MotivicStructuresInModuliOfCurves are consumers" omits it too, so a reader of either list misses the roadmap that depends most directly on §§0.2, 1.4 and 2.1.

Add to "Downstream consumers": "SurfaceGroupCharacterVarieties uses the presented surface group and the pure mapping class groups of §§0.1–0.3, compares its representation schemes and affine quotients with §1.4's, and its mapping class orbits with §2.1's MCG-finiteness." In the description, add it to the sentence listing the consumers.

## Questions for the author

- In §0.3 (README lines 267–268) the homology formula is cited as "Farb–Margalit, Proposition 6.3, stated for the left twist, with the opposite sign". The README's own formula is right: on `ℝ²/ℤ²` oriented by `dθ ∧ dt`, the twist `(θ, t) ↦ (θ + f(t), t)` about `a = {t = 0}` sends `[b]` to `[b] + [a]` and `î(a, b) = +1`, so `T_a(x) = x + î(a, x)[a]`. Does the printed Proposition 6.3 read `T_a^k([b]) = [b] + k·î(b, a)[a]`, as "the opposite sign" requires, or `[b] + k·î(a, b)[a]`? In the second case the remark should say that the printed formula agrees in form and that the difference lies in the orientation convention. What stopped me: the book is cited by locator only and its text was not read.

## Verified sound

Previous review (of `e7141d3`): no findings, so nothing to check as repaired. The passages the last repair commit touched (§0.2's punctured Dehn–Nielsen–Baer target, the comparison bullets of §2.1, the SurfaceGroupCharacterVarieties paragraph of the scope section, the Lean docstrings) were reviewed with the rest.

| Statement | Instances tried | Values computed on each side | Result | Change |
|---|---|---|---|---|
| §0.2 image of `PMod(g, n+1)` in `pureMappingClassAut g n` | `(0,0),(0,1),(0,2),(0,3),(1,0),(1,1)` | trivial; trivial; `Aut` fixing `c₁` in `ℤ` trivial; `IA(F₂) = Inn`; `SL₂(ℤ) ⊂ GL₂(ℤ)` index 2; preimage of `SL₂(ℤ)` in `Aut(F₂)` | index 1,1,1,1,2,1: agrees | none |
| §0.2 gluing proof for `n ≥ 1` | orientation-reversing realizer; `(1,1)` where both sides are one-holed tori | reversal sends `cⱼ` to a conjugate of `cⱼ⁻¹`, excluded by cyclic centralizers; vertex groups not conjugate, so sides not swapped | sound; TeichmullerGeometry §5.4 has genus `≥ 1` | none |
| §0.3 twist and push signs | torus `î(a,b)=1`; collar `dθ∧dt` | `T_a[b]=[b]+[a]`, `T_b[a]=[a]−[b]`; matrices `[[1,1],[0,1]]`, `[[1,0],[−1,1]]`; push `ψ` rises on `t<0`, falls on `t>0`: `T_a⁻¹T_b` | agrees with MordellLawrenceVenkatesh §§5.12, 5.20 inverted | none |
| §0.4 capping | `(0,1,2),(0,2,1),(0,3,0),(1,1,0)`, disc | `P₂=ℤ → 1`; `ℤ²`; `ℤ³`; `B₃ → SL₂(ℤ)` kernel `ℤ`; disc `Mod = 1` | kernel free of rank `b` in hyperbolic range | none |
| §0.5 abelianization | `g=1,r=1`; `g=2`; source | `B₃^ab = ℤ`; `ℤ/10`; Kor02 lines 14–20 (punctures fixed), 357–359 | agrees | none |
| §1.4 representation schemes | `Γ=ℤ/2, r=2`; `Γ=ℤ` unipotent | involutions: `±I` and orbit of `diag(1,−1)`, dimension 2, three components, three points in quotient; unipotent and `I` in one fibre | bijection on components holds; Sik12 line 572 | none |
| §4.1 pointed killing | `𝔾_m`, `i=1`, `μ=ℤ/2` | squaring map kills the class and keeps `1`; LL24 line 666 unpointed, LL-P04 line 2683 pointed | agrees with erratum form | none |
| §4.4 normal restriction | `G = N × ℤ`, `2^k σ(n)`; `N = G` | kernel of conjugation on `ρ(N)` scalar, of order dividing `r·#D`; `c(g)^r = \|det\|² = 1` | both parts hold; counterexample without finite determinant; LL24 lines 771–775 | none |
| §5.5 rank lemma | rank one, `E=O_C`, `D=0`; degree-0 nontrivial `E`; `g=0` | `ρ = g`: `1 ≥ 0`; `ρ = g−1−deg E+h⁰(E) = g−1`: `1 ≥ 1`; empty | agrees with LL24 lines 1195–1204, 1274–1279 | none |
| §5.6 rank bound | `g=3`, `V` trivial; `n ≥ 2` | bound 4; `W₁` rank 6 irreducible, no fixed class off `W₁` since pushes act by `x ± î(α,x)[cⱼ]` | holds; LL24 lines 239–242, 1345–1350 | none |
| §5.7 arithmetic step | `u = rk U`, `w ≥ 2g−2u` | `u ≥ g`: `uw ≥ g`; `1 ≤ u ≤ g−1`: `uw ≥ 2u(g−u) ≥ 2(g−1) ≥ g` | `rk U·rk W ≥ g` for `g ≥ 2`; LL24 line 1398 | none |
| §5.3 correction of Corollary 6.1.2 | `O(p)⊕O(−p)` with `d`, genus 1, one point; `L ⊕ O` coarsened | residues `−1, +1`, weights 0, `par-deg 0`, `O(p)` slope 1, rank `2 < 2√2`; `par-deg −a`, `O` slope `0 > −a/2` | LL22 lines 1310–1316 false as stated; README's equal-slope form holds | none |
| §5.11 unitarity and finiteness criterion | Deligne extension; Salem `x⁴−x³−x²−x+1` | flat subbundles have `par-deg = deg + Σ Re tr Res = 0`; `y²−y−3`, roots `1.722, 0.581`, two on the circle | Theorem 1.2.12 stands; LL22 lines 167–175, 1896–1911 | none |
| §6.1 Prym actions | torus `→ ℤ/3` and `−I`; genus-2 double cover; order-3 elliptic | `−I` not in stabilizer; genus 3, parts of dimension `4, 2`; `J⁻¹A^{−T} = AJ⁻¹ = [[−1,0],[−1,−1]]` | agrees; LL24 lines 1440–1455 | none |
| `higherPrym_rank_bound` (§6.5) | `H=1`; `g ≤ 1`; `g=2`, `H=ℤ/2` | stable subspaces of dimension `2g` or all; `2 ≤ dim W + 2`; parts `4, 2 ≥ 2` | Lean hypothesis weaker than source's: finite relative index in a group containing `Γ` with index `≤ 2` | none |
| `putmanWieland_of_irreducible_dim_lt`, `putmanWieland_of_card_lt` (§§6.6, 6.7) | `H=1`, `g=2`; `g ≤ 1`; `H=ℤ/5`, `g=2` | no fixed class of `H¹(Σ₂)`; hypothesis fails (`d=1 ≥ g`), `#H < g²` unsolvable; `d=1<2` while `5 ≥ 4` | LL24 lines 154, 1481, 1490 | none |
| §7.4 integrality | `r=1`; order of steps | `PGL₁` trivial; strong rigidity, then quasi-unipotence, then rigidity | LL24 lines 1643–1650; LL-P04 lines 2836–2848; KP20 lines 62–72 | none |
| `mcgFinite_finite_image` (§9.3) | `g=0`; `g=1,r=1`; `g=3`; `2g+1` unipotent | `r=0`; characters of `ℤ²`, `F₂` torsion; `r=1` only; `(2g+1)² ≥ g+1` | LL24 lines 95–99; orbit under index-`≤2` overgroup equivalent | none |
| §9.2 splitting inequality | `a=b=1`; general | `2g−2 > 1` for `g ≥ 2`; `3ab < 3(g+1)/4 ≤ 2g` for `g ≥ 1` | holds; LL24 lines 1816–1848 | none |
| §9.5 isomonodromy | hypotheses | CH19 lines 174–180: `2g−2+n>0`, mild, semisimple if `r>2`; LL24 lines 120–126 | README hypotheses equal the sources' | none |
| `freeGroup_finite_image` and §9.6 | `N=0,1,2`; `GL₃` pair | `r=0`; `[[0,1],[1,0]]`, `diag(−1,1)`, `[[1,0],[1,1]]` generate `GL₂(ℤ)`; `P=I+E₂₁` conjugates `(I+E₁₃+E₂₃, I+E₂₃)` back | LL24 lines 179–184, 205–222 | none |
| §9.9 characteristic quotients | `ℤ²`, `ℤ` | `(λ,μ) ↦ (λ,λ^kμ)` forces torsion; `N=1`: `g=0`, `r=1` out of range | LL24 lines 227–233 | none |
| §11.6 non-flatness | `ℤ_p[[x]]/(p)`; point of `R[1/p]` | complete intersection, not flat; lift restricts to an arithmetic lift of a surjection onto `GL_r(𝔽_p)` | true; attribution corrected in C01 | C01 |
| `rankTwo_mcgFinite_finite_image` (§12.6) | `g=1`; `g=2,3`; `g ≥ 4` | fails (`diag(2,1/2)`, traces `(5/2,0,0)`); CH19 line 268 (`g>0`) and BGMW17 line 53 (`g ≥ 2`, `n ≥ 0`); `4 < g+1` | LL24 lines 2192–2201 | none |
| gap:local-system-direct-images, freeness | `A=ℂ[x,y]/(x,y)²`, monodromy `1+x` | `H⁰(V)=𝔪_A`, dimension 2; `H⁰(V)⊗A/𝔪` dimension 2; `H⁰(V⊗W)` dimension 1 | freeness needed, as stated | none |

- Source locators checked against the text: about 95 (LL24 about 60, LL22 16, LL-P04 7, CH19 3, Sch19 2, AS16 2, and one each in KP20, Sik12, BGMW17, Kor02, Mor89, KS16); all agree in number, page and hypotheses.
- Library declarations opened at the pins: 19 (for example `FundamentalGroup.mul_def`, Mathlib `AlgebraicTopology/FundamentalGroupoid/FundamentalGroup.lean` line 44; `Representation.ind`, `RepresentationTheory/Induced.lean` line 77; `isotypicComponent`, `RingTheory/SimpleModule/Isotypic.lean` line 182; `IsFreeGroup.commute_iff_exists_common_zpow`, Tau Ceti `GroupTheory/FreeGroup/Commuting.lean` line 58; `TauCeti.sum_characterDegree_sq_eq_card`, `RepresentationTheory/CharacterTable/Table.lean` line 294; `TauCeti.ContCohomology.fiveTerm_exact_H1N`, `Transgression.lean` line 779). No surface group, mapping class group or Dehn twist exists at either pin.
- Cross-roadmap citations resolved: about 100 sections or names in 21 roadmaps (eight more checked for existence only), on main or at the open heads of MordellLawrenceVenkatesh, TeichmullerGeometry, MixedHodgeModulesAndIrregularHodgeTheory, SurfaceGroupCharacterVarieties and StableReductionPartII; none missing. `StableCurves.Mbar` is SchemeAndStackFoundations §4.15's name (its README line 7056).
- Dependency check: `depcheck: 199 roadmaps, 2189 edges, 0 problem(s)`; no UPWARD or CYCLE line. The three declared gaps are stated under their suppliers with the same slugs.
- Elaboration of `Suggested.lean`: six `declaration uses sorry` warnings (lines 202, 219, 234, 250, 259, 272), nothing else; single `import Mathlib`, no `set_option`, no sorried data. The elaborated types of the fifteen declarations were compared with the README statements: no binder lost, same generality.
- One-tactic probe on a copy: `first | rfl | simp | infer_instance | simp_all | aesop` closes none of the six theorems. Headlines not statable at the pins are named in the module docstring with the missing carrier.
- Pull request text: title and description read against the head; no sentence contradicted (twelve suppliers "on main" are on main, six theorems in the Lean file); the omitted consumer is C02. No file changed outside the folder.
- Automatic checks: all passed on this head.

Overlap check: read SurfaceGroupCharacterVarieties, MordellLawrenceVenkatesh (Layer LV.5), TeichmullerGeometry, MixedHodgeModulesAndIrregularHodgeTheory, PainleveEquations, InverseGaloisAndArithmeticFundamentalGroups and LefschetzPencilsAndVanishingCycles at the cited sections; MordellLawrenceVenkateshPartII not read. Representation schemes and affine quotients for `GL_r` over `ℂ` and MCG-finiteness: owner this roadmap, SurfaceGroupCharacterVarieties owns the general group scheme and states the comparison. Dehn–Nielsen–Baer: closed case TeichmullerGeometry, punctured case this roadmap. Surfaces, twists, Birman sequence: MordellLawrenceVenkatesh, pure forms here. Rational mixed variations: MixedHodgeModulesAndIrregularHodgeTheory, real ones and the limit theorem without quasi-unipotence here. Nothing has two owners.

Source independence: about 95 locators and 9 further passages (the proof plans of §§3.2, 3.4, 4.2, 4.4, 5.7, 7.1, 8.2, 9.2 and the docstring of `mcgFinite_finite_image`) compared with 12 sources, none shared beyond formulas and statements of a dozen words; largest share LL24, about 95 of about 200 locators; contents compared with LL24: independent (its §2 is split over Layers 2–4, §§4–6 merged into Layer 5 with material from six other sources, §8 split over Layers 7–9, the corollaries of §1 moved to Layer 9, Layers 0 and 1 have no counterpart; the order is forced by the Needs lines of §§4.5, 5.7, 6.5, 7.7, 8.3, 9.3).

Research link: the headline targets are the main theorems of Landesman–Litt, *Canonical representations of surface groups* (Annals 2024): finiteness for `r² < g + 1`, the Putman–Wieland results and arithmetic finite monodromy; inputs are Landesman–Litt 2022, Klevdal–Patrikis 2020, Esnault–Groechenig 2018 and Mochizuki 2006. Rests on the README's references and on LL24, LL22 and KP20 as read.

## Not verifiable

- Farb–Margalit (§§0.2, 0.3, 0.4, 2.3, 12.8: §8.2, Theorems 3.18 and 4.6, Propositions 3.19 and 6.3, Fact 4.7, §10.6.3): cited by locator only, text not read.
- Nielsen 1924 and Magnus–Karrass–Solitar, Theorem 3.2, p. 131 (§9.6): text not read; LL24 line 205 cites the same locator.
- Morita 1993, Timmerscheidt, Steenbrink–Zucker, Peters–Steenbrink, Deligne 1970, Mehta–Seshadri, Waterhouse, Curtis–Reiner, Katz: cited by locator only.
- Sabbah–Schnell (§5.4), Drinfeld 2018 and 2012 (§5.9a), Esnault–Groechenig (§5.10), Hochschild–Serre (§1.1), Mochizuki (§5.8), Li–Litt–Salter–Srinivasan (§7.2): outside the sample, locators not opened.
- The Tau Ceti names of the supplier contracts were checked by reading the pinned sources, not by elaboration (their object files are not built here).
- The description's count of earlier review rounds: not checkable from the repository.

## Source issues

- **Misprint** in LL24 at Lemma 2.0.1, p. 12: the source says the fundamental group of the moduli stack with one more point is the pure group with `n` points; it should be the one with `n + 1` points; affects nothing.
- **Misprint** in LL24 at Lemma 7.2.5, p. 36: the source says the cover with boundary replaced by punctures has genus `g`; it should be genus `g′`, the genus of the cover; affects nothing.
- **Error** in LL24 at Lemma 2.2.2, pp. 14–15: the source says the projective extension is unique; it should be unique only among extensions by classes of actual intertwiners; affects a stated result; corrected in print at LL-P04 line 2677.
- **Gap** in LL24 at Lemma 2.3.3 and Proposition 2.3.4, pp. 16–18: the source says a neighbourhood of the generic point suffices; it should be a pointed neighbourhood of the base point, which need not lie in the first; affects the proof; corrected in print at LL-P04 line 2681.
- **Gap** in LL24 at Lemma 2.4.2, pp. 19–20: the source says nothing on the genus; it should assume genus at least one, since the proof uses Corollary 2.3.5; affects a stated result; corrected in print at LL-P04 line 2750.
- **Gap** in LL24 at Theorem 4.1.1, proof, pp. 24–25: the source says admissibility follows from mixed Hodge modules; it should treat local monodromy that is not quasi-unipotent, which that theory excludes (Sch19 line 520); affects the proof.
- **Gap** in LL24 at Lemma 8.6.1, proof, p. 44: the source says the subgroup stabilizes the constituents of the Hom representation; it should stabilize the class of the representation and the cover, for the extension map to be equivariant; affects the proof.
- **Error** in LL24 at Example 9.2.3, pp. 48–49: the source says the surjections have no arithmetic lift for every prime; it should be for primes large relative to the rank; affects a stated result; corrected in print at LL-P04 line 2879.
- **Error** in LL24 at Remarks 9.2.5–9.2.6, p. 49: the source says non-flat deformation rings are not complete intersections; it should not draw that inference, flatness being independent; affects a stated result; corrected in print at LL-P04 line 2889.
- **Error** in LL22 at Corollary 6.1.2, p. 35, and Corollary 1.3.6, p. 7: the source says every low-rank flat bundle deforms to a semistable one; it should require irreducible monodromy or equal-slope graded pieces (a sum of line bundles of degrees 1 and −1 fails); affects a stated result.
- **Error** in LL22 at Lemma 7.5.1, p. 53: the source says finite-image representations are not dense for every surface and rank above one; it should exclude abelian fundamental groups, where torsion points are dense; affects a stated result.
- **Error** in AS16 at Lemma 2.5, proof, p. 11: the source says the induced representation restricts to copies of the original; it should say it contains the original as a direct summand; affects the proof.

## For the human reviewers

- **Licence.** LL-P04 is an author's web page, not a publication; LL-P04 line 2635 says its review and audit are AI-generated and that one author spot-checked and edited the erratum. The README relies on it for seven corrections (README lines 3505–3542).
- **Scope.** The README states that two results of a published paper are false as printed (LL22 Corollary 6.1.2 and Lemma 7.5.1; README lines 3545–3555) and restates them with added hypotheses. The counterexamples were recomputed here; no published correction was found.
