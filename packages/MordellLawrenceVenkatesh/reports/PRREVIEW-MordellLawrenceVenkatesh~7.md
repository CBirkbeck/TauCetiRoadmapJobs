# Review of MordellLawrenceVenkatesh (pull request #1231 at 3e917e8)

**Verdict:** accepted

**Summary.** Accepted: the full re-review found no false or unsupported statement, no upward or cyclic supply, and the Lean file elaborates with `sorry` as its only warning. There are four small corrections (the pull request text still describes the head that proved Mordell's conjecture; two targets carry a Lawrence–Venkatesh locator for statements that paper does not contain; §0.14 does not cite the pinned matrix transvection; a few pointers and symbols are left over from earlier text) and three format notes, none blocking. Two points are left for the human reviewers.

## C01 — The pull request's title and three of its sentences describe an earlier head

A reader of the description expects a proof of Mordell's conjecture and three `sorry` declarations, and finds neither. The title is "Mordell finiteness by the Lawrence–Venkatesh method", and the prose says "It culminates in the short-Frobenius-orbit estimate and Faltings’s theorem" and "its only warnings are the three `declaration uses sorry`". At this head the README says "Mordell's conjecture itself is not proved here" (lines 38–39), has no layer for the short-orbit estimate or the deduction, and `Suggested.lean` has one theorem, so elaboration gives one `sorry` warning (line 59).

Text that would be right: a title such as "The Lawrence–Venkatesh method for families over curves and the Kodaira–Parshin family"; "It culminates in the finiteness theorem for abelian-by-finite families (§7.9) and full monodromy of the Kodaira–Parshin family (§10.10)"; "its only warning is one `declaration uses sorry`". The summary block and the sentence on `Suggested.lean` (§§0.3–0.4) already agree with the head.

## C02 — §§3.4 and 3.5 cite LV20 Lemma 6.4 for statements that are not in it

An implementer who opens the locator to see the source's argument finds a different lemma. §3.4 (symmetric graph charts, line 1057) and §3.5 (every Lagrangian is transverse to some coordinate Lagrangian `Λ_I`, line 1069) both end with "(LV20, §6, Lemma 6.4, p. 33.)". Lemma 6.4 (LV20 line 1544, p. 33) is the general-position statement for `r`-tuples of Lagrangians, which is §7.4 here; its proof on p. 34 (LV20 lines 1560–1598) uses four explicit Lagrangians and then says only that a dimension condition cuts out a proper closed subset. Neither the graph description nor the chart cover is stated or used there. Both statements are true and the sketches given prove them (for §3.5: with `L = span(f₁, e₂)` one gets `K = span(e₂)`, `I = {1}`, and `L ∩ span(e₁, f₂) = 0`).

The smallest change is the wording §3.1 already uses: "Own linear-algebra derivation; used for the charts of 3.6", or a locator into a text that states the chart cover.

## C03 — §0.14 defines the symplectic transvection without citing the pinned matrix form of the same object

A reader cannot tell that the conventions of §0.14 are already fixed in the library, and an implementer may prove the API twice. Tau Ceti at the pin has `TauCeti.GLSymplecticFin.symplecticTransvection v c`, documented as `x ↦ x + c ω(v, x) v` for the standard form (`TauCeti/LinearAlgebra/Matrix/GeneralLinearGroup/Symplectic/Transvection.lean`, line 98), with `symplecticTransvection_add` (159), `symplecticTransvection_inv` (170), `symplecticTransvection_smul` (177) and the conjugation law `mul_symplecticTransvection_mul_inv` (211). These are the second, third, fourth and fifth API bullets of §0.14 in coordinates, with the same sign: `T_v^r(x) = x + r·ω(v, x)·v`. The scope section cites `eq_top_of_root_subgroups` from the same directory but not this file.

One clause in §0.14 and one line under "From Tau Ceti" would do: §0.14 is the coordinate-free form on `(V, ω)` over a field, valued in `TauCeti.BilinForm.isometryGroup ω`, and a symplectic basis identifies it with the pinned `symplecticTransvection`.

## C04 — Four pointers and symbols refer to text that is not there

Each sends the reader to the wrong place. (a) The second Check of §8.6 (line 1989) speaks of "the fibre map (5.5) of this layer"; Layer LV.8 has no (5.5): it is LV20's (5.5), the map of §8.14. (b) The sketch of §8.7 (line 1995) uses "the Nagata finiteness supplied in Layer 0", and the Mathlib contract for `Scheme.Hom.normalization` says "8.7 and Layer 0"; this roadmap's Layer LV.0 has no such result, the supplier is SchemeAndStackFoundations Layer 0. (c) The sketch of §10.5 (line 2408) takes a base point "`p ∈ ∂D ≅ ∂D'`", and its second Check (line 2413) a bound "independently of `w₃`"; `D`, `D'` and `w₃` are defined nowhere in the README (in §9.11 the pieces are `S°_{g−1}` and `T°`, and the sketch names only `w₁, w₂`). (d) In the supplier contracts (line 2742), "Its proof below retains the direct image-algebra argument" points at §1.1, which is above.

Repairs: "the map `ψ` of 8.14 (LV20 (5.5))"; "SchemeAndStackFoundations Layer 0" in both places; "`p ∈ ∂T° = ∂S°_{g−1}`" and "independently of the third curve `w₃` chosen by 10.4"; "above".

## N01 — The heading of Layer LV.7, and the title of §7.9, are word for word the title of LV20 §6

"Rational points on the base of an abelian-by-finite family" (lines 1759 and 1869) is the heading of LV20's Section 6 (LV20 line 25). The layer's scope is its own (it also holds the size function of LV20 §5), so this is wording only; a title such as "Finiteness of rational points with few short Frobenius orbits" would name the mathematics.

## N02 — Five targets have no `*Needs:*` line

§§0.22, 0.23, 9.10, 10.3 and 10.4 end at the locator. §0.22's "general kernel/quotient Goursat construction" exists as Mathlib `Submodule.goursat` (`Mathlib/LinearAlgebra/Goursat.lean`, line 102); §§9.10 and 10.4 use integer gcd, Bézout and extension of a primitive vector to a basis. A line each would say so.

## N03 — A Check could record why the genus hypothesis of LV20 Proposition 5.3 is not needed in setting Q

LV20 states Proposition 5.3 for a curve of genus at least 2 (LV20 line 1178); setting Q and §7.9 have no genus hypothesis. Nothing is lost: for genus 0 the geometric fundamental group is trivial and for genus 1 it is abelian, so the monodromy closure is abelian and cannot contain `Sp_{2d}` with `d ≥ 1`, `n ≥ 1`; full monodromy fails and §7.9 is vacuous. A Check in §7.9 saying this would save a reader the comparison.

## Verified sound

Previous review (of `4bf88fa`): it had no finding. Its three repaired points still hold at this head: `Suggested.lean` line 53 uses `one_apply_eq_self`; the pins named in both files are Mathlib `1b1ccf4` and Tau Ceti `2fd255d`; §5.2 composes the pinned Schoenflies theorem with `Homeomorph.sphereCone`.

| Statement | Instances tried | Values computed on each side | Result | Change |
|---|---|---|---|---|
| §0.4 and `finrank_semilinearCentralizer_le` (headline in Lean) | `e = 1`, `σ = id`, `F = E`; `V = 0`; `E = ℚ_{p²}`, `φ = σ ⊕ σ` | `Z(φ) ⊆ End_E V`, `d² ≤ d²`; `0 ≤ 0`; `Z = M₂(ℚ_p)`, `4 = dim_E Z(φ²) = 4`. Lean keeps `hσ`, `hfix`, `hord`, `FiniteDimensional E V` | Holds; README states the equality, Lean the bound it names | none |
| §0.14 transvections (sample) | `ω(e,f)=1`; `v = 0`; `cv` | `T_e^r = [[1,r],[0,1]]`, `T_f^r = [[1,0],[−r,1]]`; `T_0^r = 1`; `T_{cv}^r = T_v^{c²r}`. LV20 (2.4), p. 15: same formula | Holds; pinned matrix form has the same sign | C03 |
| §2.3 good models (sample) | `X = E × Y`; affine base; two models | Spreading out over `colim 𝒪_S`; degree of polarization inverted; isomorphism over `K` descends to some `𝒪_{S'}`. LV20 §3.1, p. 15: enlarging `S` | Holds | none |
| §3.5 chart cover (sample) | `L = span(f₁,e₂)` in `k⁴`; plane; `d = 0` | `K = span(e₂)`, `I = {1}`, `L ∩ span(e₁,f₂) = 0`; two charts omit `e`, `f` lines; one empty chart | True; not in LV20 Lemma 6.4 | C02 |
| §4.4 residue-disk criterion (sample) | `d = 1`, `r = 8`; `d = 0`; `K = ℚ(i)`, `v | 3`, `λ₀ = 2` | `c ≤ 4d² = 4 < 8·d(d+1)/2 = 8`; `0 < 0` false, so `d ≥ 1` needed; `x³−x` supersingular, `φ² = −3`, `c = 4 > 1` | Holds; LV20 pp. 20, 31 give `4d²` and `≥ 8` | none |
| §4.5 (headline) | `K_v = ℚ_p`, `2d` distinct eigenvalues; Legendre | `c = 2d < d(d+1)/2` iff `d ≥ 4`; Legendre `2 > 1`, criterion silent | Holds; LV20 Proposition 3.4, pp. 19–20 | none |
| §5.4 classification (sample) | torus; type `(g,b,n)` | `χ = 2 − 2g − b`; `H₁(T²) = ℤ²`; FM12 Theorem 1.1 at printed p. 18 (PDF p. 28) | Holds | none |
| §5.16 centralizers (sample) | torus; once-punctured torus; genus 2 | centre `ℤ²` at `χ = 0`; free of rank `1 − χ = 2`; FM12 Theorem 1.2 p. 21, centralizers p. 23 (PDF 31, 33) | Holds; `χ < 0` needed | none |
| §5.21 capping (sample) | disk; annulus; torus with one boundary circle | `1 → 1 → 1 → 1`; `ℤ → ℤ → 1`; `Mod(T°) → SL₂(ℤ)` onto. FM12 Proposition 3.19, p. 89 (PDF 99), with `k = 0` | Holds | none |
| §7.6 bad points (sample) | `size_v = 0`; `π = id`; counting step | `a < 1/2` gives `a ≤ 1/2 − 1/(2d)`; then `#large ≤ d·#small`, `size_v ≥ 1/(d+1)`. LV20 Sublemma, pp. 31–32, (6.8)–(6.11) | Holds | none |
| §7.9 (headline, sample) | `π = id`; empty cover; genus 0, 1 | `size_v = 1`, set empty; excluded by `n ≥ 1`; monodromy abelian, hypothesis fails. LV20 Proposition 5.3, p. 26, has genus `≥ 2` | Holds | N03 |
| §8.7 Hurwitz space (sample) | `G = Aff(3)`, `g = 2`, `n = 3`; `G = 1` | degree `810/6 = 135`; fibre genus `1 + 6 + (6−2)/2 = 9`, quotient genus 5; `S = ∅`. LV20 Proposition 7.1, pp. 34–35 | Holds | C04(b) |
| §8.9 connected kernel (sample) | `ε = 0`; `ε = [n]`; `(0, n)` on `E × E` | kernel `A`; finite, component 0; `ε² = (0,n²) = [n]ε`, component `E × 0`. Mil-AV I.10.1 proof, printed p. 42; LV20 p. 36 | Holds | none |
| §8.10 reduced Prym (sample) | trivial action; `q = 3`, `g = 2` | `e = 0`, `e'' = 6`, component 0; `(e'')² = n²(1−e) = [n]e''`; dimension `(2g−1)(q−1)/2 = 3`. LV20 §7.2, pp. 35–36 | Holds | none |
| §9.1 `Aff(q)`-covers (sample) | `q = 3`, `g = 2`; `C₃` cover | `g(Z) = qg − (q−1)/2 = 5` from `2g(Z) − 2 = 6 + 2`; `N = 135`; image `C₃ ≠ Aff(3)`. LV20 §8.2, p. 39 | Holds | none |
| §10.4 primitive vectors (sample) | `r = 1`; `r = 2`; a zero form | `r = 1`: only `±1`, fails for large `B`; `w = v + m·u`, `|ℓᵢ(v) + mℓᵢ(u)| → ∞`; zero form gives 0. LV20 p. 51 uses it | Holds | none |
| §10.9 point-pushing density (sample) | `q = 3`, `g = 2`; `{±1}^N` | 135 factors `Sp₆`; closure normal in `∏ Sp`, non-central by 10.1 (`qI − J` of rank 2). LV20 Theorem 8.1, p. 41 | Holds | none |
| §10.10 (headline) | `q = 3`, `g = 2` | `H₁` of reduced Prym `= H₁^Pr`, dimension `10 − 4 = 6`; form scaled by `q − 1 = 2`, same `Sp` | Holds | none |
| §10.5 (touched by C04) | sign and coefficient | `±(δ_{jk} − 1/q) ≠ 0` for prime `q ≥ 3`; LV20 p. 51 chooses a third curve `w₃` | Holds; notation undefined | C04(c) |
| §1.11 against LV20 Lemma 2.8 | `η = χ_cyc^{−1}` over `ℚ`, `w = 2` | `η²(Art(p)) = 1`, `Norm(p)^w = p²`, ratio of infinite order; on units both sides agree near 1 | README's unit form right | none |
| §§5.11–5.12, 5.21a, 5.22 twist signs | torus, `î(a,b) = 1` | `Ψ(T_b) = [[1,0],[1,1]]`, `Ψ(T_a) = [[1,−1],[0,1]]`; 5.21a: `[[1,1],[0,1]]`, `[[1,0],[−1,1]]`, mutual inverses | Consistent | none |
| §9.8 liftable transvection | `x ∈ H₁^Pr` | `(q−1)⟨x,e⁺⟩e⁺ + ⟨x,e⁻⟩e⁻ = ⟨x,e⁺⟩(qe⁺ − π^*e) = q⟨x,ẽ⟩ẽ`; `Ã·B̃ = A⁺·B⁺ − q⁻¹A·B` | Holds; equals `T_ẽ^{−q}` of §0.14 | none |

- Source locators checked against the text: 27 (LV20: 19, all pages agree with arXiv v3; FM12: 7, printed page = PDF page − 10; Mil-AV: 1).
- Library declarations opened at the pins: 9 by statement (among them `FundamentalGroup.mul_def`, `p * q = q.trans p`; `LinearMap.transvection`; `Module.Grassmannian`, quotient of rank `k`; `symplecticTransvection`; `eq_top_of_root_subgroups`, `TorusGeneration.lean` line 145); the 85 names of the two library contracts searched were all found at the pins.
- Cross-roadmap citations resolved: 36 roadmaps, every cited section or layer found (33 on main, FaltingsFinitenessAndIsogenyTheorems, MetaplecticAutomorphicForms and HeightsRationalPointsAndObstructions at their open heads); ModularCurves "Layer 4C" and AlgebraicTopology "Stage k" are former numberings that main maps.
- Dependency check: `depcheck: 213 roadmaps, 2304 edges, 0 problem(s)`; no UPWARD or CYCLE line. Automatic checks: all passed.
- Elaboration of `TauCetiRoadmap/MordellLawrenceVenkatesh/Suggested.lean`: one `declaration uses sorry` (59:8), nothing else. Two declarations; elaborated types compared with §§0.3–0.4, no binder lost. One-tactic probe (`simp`, `rfl`, `infer_instance`, `exact Submodule.finrank_le _`, `exact?`) does not close the theorem: no padding.
- Headline theorems: §§4.5, 7.9, 10.10 (Summary) are not statable at the pins (no abelian schemes, mapping class groups or period maps there) and the module docstring names each with what it lacks; §0.4 is stated.
- Changes outside the folder: none. Five supplier names the tools could not find (`RestrictedRamification.finite_unramifiedOutside_of_finrank_le`, `Sheaf.derivedPushforward`, three `VanishingCycles.*`) are names the supplier READMEs on main define (ArithmeticGaloisDuality line 1957, SchemeAndStackFoundations line 157, EtaleCohomologyFoundations lines 315, 902).

Overlap check: read GaloisSectionsPadicPeriodMaps, MappingClassGroupsAndCanonicalRepresentations, MordellLawrenceVenkateshPartII, GeometricTopology, DiophantineApproximationAndTranscendence, HeightsRationalPointsAndObstructions; nothing shared: the first three cite this roadmap's sections (all present at this head), mapping class groups of compact smooth surfaces are GeometricTopology Layer 1.7.2's, the unit equation is DiophantineApproximationAndTranscendence §2.4's and Mordell's conjecture HeightsRationalPointsAndObstructions §6.4's.

Source independence: the whole README compared mechanically with 3 sources (LV20, FM12, Mil-AV) and 27 passages read at their locators; longest shared run 15 words (the list of exceptional surfaces in Hamstrom's theorem), 13 with LV20 (statement of Proposition 7.1 (i)); none copied. Largest share LV20, 190 of about 243 locators; contents compared with LV20: independent (LV20 §2 is split over LV.0–LV.1, §3 over LV.2–LV.4, §§4–5 are absent, LV.5 has no counterpart, §8 is split over LV.9–LV.10; only LV.7 ↔ §6 and LV.8 ↔ §7 pair off, in an order the `*Needs:*` lines of 7.7 and 8.13 force). GX13 could not be read beyond its preface.

Research link: Layers LV.2–LV.4 and LV.7 are the period-map method and Proposition 5.3 of Lawrence–Venkatesh (2020); LV.8–LV.10 their Theorem 8.1. GaloisSectionsPadicPeriodMaps and MordellLawrenceVenkateshPartII (Lawrence–Sawin's hypersurface results) cite these sections. Rests on the README and LV20 §§1, 5.

## Not verifiable

- GX13 (§§5.2–5.4, 5.7): the author's page gives a 28-page excerpt only; Lemma 6.1, Theorem 6.1, Appendix E and their pages were not read.
- BO78, Corollary 7.4 (§2.11) and Fal83, §6 (§1.1): no legal readable text; cited by locator alone, as in the earlier reviews.
- Locators outside the sample into Hat02, SGA1, Del85, BC09, Mil-iAG, Mil-LAG, Mil-CM, Mil-CFT and the Stacks project were not reopened this round.

## Source issues

- **Error** in LV20 at Lemma 2.8, p. 12: the source says the square of a pure character restricted to the whole local multiplicative group is a finite-order character times the `w`-th power of the norm; it should be asserted on an open subgroup of the units only, since at a uniformizer the inverse cyclotomic character over `ℚ` gives 1 against `p²`; affects a stated result.

## For the human reviewers

- Licence: the text of FM12 used for the page numbers is a 509-page copy in the sources cache whose recorded origin is a university page of a third party, not the authors' or the publisher's; an author-page copy (402 pages, other pagination) is also cached.
- Not tested: GX13 is cited for the classification and triangulation of surfaces (§§5.2–5.4, 5.7); only its preface could be read, so wording and locators were not compared with it.
