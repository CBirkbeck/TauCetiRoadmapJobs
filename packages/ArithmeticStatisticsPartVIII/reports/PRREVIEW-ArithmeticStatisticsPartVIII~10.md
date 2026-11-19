# Review of ArithmeticStatisticsPartVIII (pull request #1179 at 500bbc0)

**Verdict:** needs changes

**Summary.** Changes are needed for one reason: §5.16 plans again the homological stability of Hurwitz spaces and the uniform Betti bounds that InverseGaloisAndArithmeticFundamentalGroupsPartII, now on main, owns with the same hypotheses and the same constant. Every other statement, Check and worked value I recomputed holds, the previous review's finding is repaired, and the Lean file elaborates with `sorry` as its only warning. There are four small corrections and one format note, none blocking; two points are left to the human reviewers (the coexistence that main's text describes, and the conditional §§5.13–5.14).

## R01 (P2) — §5.16 re-plans the Hurwitz stability theorem and the uniform Betti bounds that InverseGaloisAndArithmeticFundamentalGroupsPartII owns on main

Two roadmaps would each build the component ring, the K-complex, the arc spectral sequence, EVW Theorem 6.1 and Corollary 6.2, the cell models and both Betti bounds, and an implementer cannot tell which statement is the library's. A roadmap on main precedes every open one, so this part cites it; the scope bullet (line 1822) still reads “InverseGaloisAndArithmeticFundamentalGroupsPartII, later in the build, … nothing is imported from it here”, which was true while that roadmap was a design and is no longer.

How I know. `TauCetiRoadmap/InverseGaloisAndArithmeticFundamentalGroupsPartII/README.md` on main lists as owned (lines 37–59) the nonsplitting property and the involution class of a group of order `2s` (§§0.1–0.2), gluing and the component ring (§§0.4–0.6), the central sum and its stability (§§0.7–0.8), the K-complex and its bound (§§1.11–1.19), the arc resolution and spectral sequence (Layers 2–3), marked, full-monodromy and unmarked stability (§§4.2, 4.3, 4.5), cell models (§5.1), the field Betti bound (§5.2) and the étale bound (§5.3). Its lines 111–122 say that its statements contain those of §5.16 here. The match is exact where §5.19 consumes it: main's §5.3 (lines 1742–1752) has `G` centreless, `c` rational, generating and nonsplitting, `q` prime to `|G|`, `ℓ > max(|G|, q, n)`, bound `C^(i+1)` for `ℚ_ℓ` and `𝔽_ℓ`; this README's *Uniform Betti numbers of Hurwitz schemes* (line 835) has the same list. Main's §5.2 takes `C = (2|G|)^(A+B+a+1)` (line 1724); line 818 here takes `C₀ := (2|G|)^{A+B+a+1}`. Part (v) of *Generalized dihedral cover datum* (line 479) is main's §0.2 for `s = |A|`. Main's `Suggested.lean` states `hurwitz_homological_stability` and `uniform_betti_bound` (lines 475, 492) in braid-group-homology form, so the module docstring here, which says these “need the Hurwitz braid action on tuples, the topological Hurwitz spaces and their homology”, describes as missing what main states.

The smallest change that leaves one owner. In §5.16 keep *Top cohomology counts rational components* and *Uniform trace error estimate*, which main lacks, and replace the targets from *Nonsplitting pairs and the component ring* to *Uniform Betti numbers of Hurwitz schemes* by citations: §5.19's proof needs only main's §5.3, and §5.15 (v) needs §0.2. Then drop *Tor spectral sequences over graded algebras* with its supplier subsection (nothing else here uses them, and main takes the generic form from DGAInfinity Layer 5), rewrite the bullet at line 1822 and the fourth Summary paragraph (“The roadmap proves homological stability …”) as imports, add a `### From InverseGaloisAndArithmeticFundamentalGroupsPartII` contract naming §§0.2 and 5.3, and remove the docstring sentence. If a statement of §5.16 is meant to differ from main's (the single exponent `D` for all subgroups, say), keep that one and say in one clause how it differs. The source corrections recorded in §5.16 (the cut-off of `𝒜_q` at `q = n`, the coefficient in (6.1.6), the step `n + Dd`) are worth offering to main's roadmap.

## C01 — The description's sentence on stability describes the state before the general treatment reached main

The summary block says “stability is proved here since the general treatment comes later”. The general treatment is InverseGaloisAndArithmeticFundamentalGroupsPartII on main. After R01 the sentence would read: “The uniform Betti bound is imported from InverseGaloisAndArithmeticFundamentalGroupsPartII §5.3; this part adds the trace estimate, the monodromy and the orbit count.” The description also does not say that this head adds InductionRestrictionPartII (RS.4.2–RS.4.5, RS.4.18) as the supplier of the fixed-fibre counts and parity series of §5.21; one clause would do.

## C02 — “`h₁(R)` is finite” is false under the roadmap's own convention `deg 0 = −∞`

In (iv) of *The K-complex and its homology bound* (line 732) the text says “for `M = R`, `h₀(R) = 0` and `h₁(R)` is finite”. In the Check on `(C₂, {σ})` (line 742) the odd homology of `K(R)` vanishes, so `h₁(R) = deg 0 = −∞`. EVW's sentence is written for their convention; here write “`h₁(R) < +∞`”.

## C03 — Two passages stay close to their source's sentences

The proof of *Mod l hyperelliptic monodromy is symplectic* (line 984) opens with the reduction, the base cases and the common-quotient remark in the order and nearly the phrasing of Achter–Pries (ref-48 lines 524–534; longest shared run eight words). The definition of `N(H, Γ, D, Q)` in *Counting unramified h extensions via semidirect extensions* (line 1722) follows LWZB Lemma 9.3 clause by clause (ref-51 lines 1781–1784; shared runs of six words). Neither reproduces a sentence, and the order is the logic of the argument, so I do not count them as copying; a rewording removes the question. For the first: “It is enough to compute the image for the labelled family: `H̃_g ⊗ k` maps onto the closure of `H_g ⊗ k`, and passing to a dense open does not change a monodromy image (§IG.5.7). In genus 1 and 2 the hyperelliptic locus is all of `M_g`, where the image is `Sp_{2g}(𝔽_ℓ)` (Deligne–Mumford 5.15–5.16).” For the second, cite §IG.4.6, *The marked extension count over `𝔽_q(t)`*, which already defines `N`, and state only the case `Q = ℚ` that it lacks.

## C04 — The hypothesis `2 < ℓ` of `Similitude.unique_similitude_stable_orbit` follows from the others

For `ℓ = 2` every unit `q` of `ℤ₂` is odd, so `q − 1` is not a unit and `hq` cannot hold; the statement is then vacuous, and `hℓ` is implied by `q` and `hq`. The same holds for “`ℓ` odd” in *Primary decomposition for a multiplier q similitude* and *Unique similitude stable symplectic orbit* (lines 1122, 1194). Either drop it or say once that it is kept for readability.

## N01 — Names in code font that no file declares

`FormDensity.minorGCD` and `FormDensity.minorGCD_eq_index` (line 1962) are prose targets of ArithmeticStatisticsPartI §0.10, declared in neither `Suggested.lean`; the Checks also use `allowedPrimePowers` (line 1302), `cyclicGaps`, `eigenangles`, `upperOddDensity` and `classGroupPrimaryIso` as if declared. Say that they are proposed names, or write them in prose.

## Verified sound

Previous finding (review of `e4005e8`): R01, the double-complex spectral sequence restated instead of cited — repaired. Line 705 now reads “The spectral sequences of the first-quadrant double complex `C_• ⊗_R F_•` … (DerivedModuleAlgebra §S.1, homological form …)”, line 713 “The two sequences and their convergence are DerivedModuleAlgebra §S.1”, and lines 715, 1820, 1909 cite §S.1 (on main, `TauCetiRoadmap/DerivedModuleAlgebra/README.md:955`).

| Statement | Instances | Values computed on each side | Result |
|---|---|---|---|
| 5.12 first moment; `local_density_first_moment` | `(d,n,p,r)` = (1,1,2,1), (2,0,3,2), (2,1,2,2), (2,2,3,1), (3,2,2,1), (2,2,2,2) | brute-force mean = formula: 1/2, 0, 9/14, 121/126, 3577/4092, 31/36 | exact in all 11 cases run; `n = 0` gives 0 on both sides |
| 5.12 second moment; `local_density_second_moment` | (2,2,2,1), (2,2,3,1), (2,2,2,2), (3,2,2,1), (1,2,2,2) | `Σσ²` = 52.94, 771.65, 3584, 892.94, 31.5 against bounds 113, 1162, 7232, 1808, 113 | holds |
| 5.12 variance; `local_density_variance` | same five | 0.118, 0.139, 0.167, 0.125, 0.0625 against `4p^{1−n}` = 2, 1.33, 2, 2, 2; algebra: numerator `x²+2w+2y−2xy−z ≤ 3.03w`, `·8/7 < 4w` | holds |
| 5.12 two-point count and Veronese valuation | all pairs for (2,1,2,2), (2,1,3,1), (3,1,2,2), (2,2,2,1), (1,2,2,2), (2,1,2,3) | 144, 64, 144, 49, 3136, 2304 pairs; `#L = p^{r(N−2)+v} − p^{(r−1)(N−2)+min(v,r−1)}` and `v(ν(b₁),ν(b₂)) = v(b₁,b₂)`: 0 mismatches | holds |
| 5.12 strata, Hensel step, lower bound | strata counts for the cases above; `F = t²`, `δ=1`, `m=2` | e.g. (2,2,2,2): `#R^{(1)}` = 1190 ≤ 4096, `#R^{(2)}` = 1036 ≤ 2048; `σ ≥ p^{−(e+1)n}` never violated; counter-case: `p − 1` solutions at level 2, 0 at level 3 | holds; `m ≥ 2δ+1` needed |
| 5.13 concentration | Case A `0.4901`, Case B `0.25005`; `𝔽₅` curves; density of primes | `(1/2)(0.9802)`; `(1/2)(0.5+10⁻⁴)`; `#E = 8`, `#E′ = 4`, traces −2, 2, `t²−4p = −16` both; `1 − 2⁻⁹` | holds; exponent `0.495 − 0.5 = −0.005` |
| 5.14 spacing and model obstruction | `{1,1,1,1}`, `{0,0,π,π}`; `p = 2, 3`; positivity | `(3/4)δ₀+(1/4)δ₄`; mass 1/2 = `2(h−1)/N`; `#E(𝔽₂) = 2`, `#E(𝔽₄) = 8`; `p=3,t=±3`: 1 and 7; `2∏(1−3⁻ʲ) − 1 ≈ 0.12` | holds; `p` odd needed |
| 5.15 dictionary | `A = ℤ/2`; `𝔽₃`, `y² = t³+t²+2`; `𝔽₇`, `y² = t³+2` | Klein group, two non-conjugate elements; 3 points, `Cl ≅ C₃`, moments 2 and 0; 9 points, `π − 1 = 3·unit`, `Cl ≅ C₃²`, moment 8 | holds; `|S_n| = 2(qⁿ − qⁿ⁻¹)` agrees with Part I §0.11 |
| 5.16 component ring, K-complex | `(S₃, transpositions)`; homotopy `S_g` | `dim R_n` = 1, 3, 5, 6, 6, 6; `N₀ = 3`; cokernel of `U₁`: 4, 3, 1, 0; identity holds in 351/351 instances, product variant undefined in 144, fails in 132 of 207; `d² = 0` for lengths ≤ 3 | holds (R01 is about ownership, not truth) |
| 5.16 trace estimate | `C=1, q=16`; `n=1, q=9` | `C²/(√q − C) = 1/3`; `|1 − 3|/9 = 2/9 ≤ 1/2` | holds |
| 5.17 monodromy; `Similitude.integral_lift` | subgroup of `SL₂(ℤ/9)` generated by the two matrices | order 24, all determinants 1, image mod 3 of order 24, index 27; `U₀³ ≡ I` mod 3, `≢ I` mod 9; adjoint of `SL₂(𝔽₃)` irreducible, so the extra hypothesis gives level 9 | holds; (1,3) hypothesis needed |
| 5.18 orbit; `unique_similitude_stable_orbit` | `g = 0`; `q = 1`, `g = 2`; `ℤ₅`, `diag(6, 1/3)`, `diag(3, 2/3)` | `O = {0}`; kernels Lagrangian versus nondegenerate mod `ℓ`, two orbits; multipliers 2, `V₁ ⊕ V_q` versus `W = V` | holds; `q − 1` unit needed |
| 5.19 moment estimate and large-`q` theorem | constants | average `= (q/(q−1))·y`; `(4/3)(2C²) + 1 ≤ 3C² + 1`; `c₃ ≈ 0.560` | holds |
| 5.20 good moments | slice sizes | `q^{2n−1} − q^{2n−2}` and `q^{2n} − q^{2n−1}` as Part I §0.20; table entry `C₃²`: `H₂ = C₃` (ref-50 line 1468) | holds |
| 5.21 profiles | `A = C₂`, `C₄`; series | survives iff `q ≡ 1 (4)`, `q ≡ 1 (8)`; `X²/(1−X²)`, `X/(1−X²)`; error `B_n(K_d q^{−1/2} + q^{−1})/(1 − q^{−1})` rederived | holds |
| 5.22 semidirect moments | `ℤ/2` on `ℤ/3`; `ℤ/3` on `𝔽₂²`; cubic | 3 sections; `T³ = 1`, no allowed `q`; residue 5 mod 6; discriminant `256 − 27 = 229` | holds |
| GN-a, GN-d | `(1,0),(1,3)` at `Q = 3, 2`; `(2,0),(0,2)` at `Q = 2` | index 3 = 9/3, 4 = 4/1; index 1 against formula 2; `Mass_D(1) = |ζ(−1)|/4` from ref-52 Proposition 9.3 with `d = 2` | holds; primitivity needed |

- Source locators read at the text: 62 (ref-37 24, ref-45 12, ref-46 9, ref-47 1, ref-48 5, ref-49 1, ref-50 6, ref-51 4, ref-52 2, Hatcher–Wahl 3, Charney–Davis 2, Raynaud 2); none wrong.
- Library declarations opened at the pins: 10, among them `TauCeti/LinearAlgebra/Matrix/GeneralLinearGroup/Symplectic/TorusGeneration.lean:165`, `TauCeti/AlgebraicGeometry/EllipticCurve/HasseBound.lean:57`, `Mathlib/NumberTheory/LSeries/PrimesInAP.lean:463`, `Mathlib/Probability/CDF.lean:81` and `:115`, `Mathlib/LinearAlgebra/SymplecticGroup.lean:102`; the pinned Mathlib and Tau Ceti have no Kolmogorov distance.
- Cross-roadmap citations resolved: Part I §§0.10, 0.11, 0.13, 0.16, 0.19–0.21; Part IV §§3.3–3.5; Part V §3.27; Part VII §5.3 (four targets, at its open head); 16 named items of InverseGaloisAndArithmeticFundamentalGroups; InductionRestrictionPartII RS.4.2–RS.4.5, RS.4.18; DerivedModuleAlgebra §S.1; ArithmeticGaloisRepresentations §7.3.
- Dependency check: `depcheck: 200 roadmaps, 2203 edges, 0 problem(s)`; no UPWARD, CYCLE or `moved:` line. Nothing changes outside the folder; the folder holds `README.md`, `Suggested.lean`, `metadata.toml`.
- Automatic checks: all passed. Elaboration: five `declaration uses 'sorry'` warnings (lines 65, 75, 86, 97, 125), no error. The nine elaborated types were compared with the README statements: no binder lost, same generality.
- Padding probe on a scratch copy (`rfl`, `simp`, `infer_instance`): all five theorems fail every attempt; none is padding. Headlines: local-density moments, lifting criterion and orbit lemma stated; the large-`q` theorem, Wood's and LWZB's moments named in the docstring with their missing carriers; stability, see R01.
- Pull request text: title and each sentence of the summary block and prose read against the head; C01 is the only discrepancy.
- Overlap check: read InverseGaloisAndArithmeticFundamentalGroupsPartII, InverseGaloisAndArithmeticFundamentalGroups, ArithmeticStatisticsPartI (main), ArithmeticStatisticsPartVII and ArithmeticStatistics (open); Hurwitz stability, K-complex, arc spectral sequence, cell models and Betti bounds: owner InverseGaloisAndArithmeticFundamentalGroupsPartII (R01); Hurwitz spaces and schemes: owner InverseGaloisAndArithmeticFundamentalGroups; families and slices: owner Part I; the Kolmogorov distance is also defined in the open MathematicalStatisticsHigherOrderAndResampling §1.1, which the merge order does not list, so this part is the earlier owner.

Source independence: 9 passages compared with 8 sources, none reproduced, two close (C03); largest share ref-37, 45 of about 125 locators; contents compared with ref-37: sections independent (§5.15 is its §8.6–8.7, §5.17 is not from it, §§5.18–5.19 its §8.8–8.9), and the run of targets inside §5.16 follows its §§3–7 in the order their `*Needs:*` lines force.

Research link: §§5.15–5.19 prove Ellenberg–Venkatesh–Westerland (2016), Theorems 1.2 and 8.8; §§5.20–5.21 Wood (2019); §5.22 Liu–Wood–Zureick-Brown (2024); §5.12 is Browning–Le Boudec–Sawin (2023), §5; §§5.13–5.14 Lipnowski–Tsimerman (2018), §5. Rests on the README's sources, read here.

## Not verifiable

- Weibel §§5.6–5.7 and Theorem 5.6.6: the text is recorded as uncertified and was not read.
- The Duke page numbers given beside the arXiv locators of ref-50, and the published numbering of ref-45, ref-46 and ref-51: only the arXiv versions were read.
- Katz–Lang (2.4), Deligne–Mumford 5.15–5.16 and Kleidman–Liebeck, cited inside proofs: not opened.
- The remark in *The K-complex and its homology bound* that the printed argument “allows `A₁ = 0` and omits the shifts”: the intermediate estimates of ref-37 §4 were not recomputed.
- Ownership against open pull requests whose files were not supplied was checked only through the search tool.

## Source issues

- **Error** in ref-45 at §5.4.5, (54)–(55), p.31: the source says the logarithm of the orbit count is at most `Σ [K_i:ℚ] n_i² log n_i + O(g²)`; it should be `(1/2) Σ [K_i:ℚ] n_i² log n_i + O(g²)`, as the unitary mass formula gives `Σ_{j≤n} log (j−1)!`; affects a stated result.
- **Error** in ref-45 at Lemma 5.19, p.36: the source says `E(𝔽_p)` and `E(𝔽_{p²})` are never both `p`-groups; it should assume `p` odd, since `y² + xy = x³ + x² + 1` over `𝔽₂` has 2 and 8 points; affects a stated result.
- **Gap** in ref-45 at Corollary 5.13, pp.33–34: the source applies Conjecture 5.2 to every bad abelian variety; it should treat separately those with the simple factor of Frobenius polynomial `(x² − p)²`, whose endomorphism algebra is not a CM field; affects a stated result.
- **Misprint** in ref-45 at Lemma 5.9, proof, p.32: the source says the polytope `[0, ε]^k` has `k(k+1)` extreme points; it should be `[0, εg]^k` with `k(k−1)`; affects nothing.
- **Misprint** in ref-46 at Lemma 5.6, p.55: the source says the stratum itself is at most `2p^{rN−e}`; it should be its cardinality; affects nothing.
- **Misprint** in ref-37 at (6.1.6), p.763: the source says `U` restricts to `(|c|/|c∩Q|)·U_Q` on the `Q`-stratum; it should be `U_Q`, since `U = Σ_{g∈c} r_g^{D|g|}`; affects nothing.
- **Misprint** in ref-37 at (7.8.3), p.770: the source says the comparison is between `n` and `n + D`; it should be `n + deg U = n + D|g|`; affects nothing.
- **Misprint** in ref-37 at the deduction after Theorem 8.8, p.777: the source says `ν_n(A)` is the fraction with `Cl(O_L) ≃ A`; it should be the `ℓ`-part of the class group; affects nothing.

## For the human reviewers

- **Scope.** `TauCetiRoadmap/InverseGaloisAndArithmeticFundamentalGroupsPartII/README.md` on main, lines 111–122, describes §5.16 of this part as a parallel statement that imports nothing; R01 applies the one-owner rule against that description.
- **Scope.** §§5.13–5.14 are conditional on Lipnowski–Tsimerman's Conjecture 5.2 and on an analogue (H2, line 339) that the README formulates itself; ref-45 states only the CM case, with thresholds the README halves.
- **Licence.** ref-48, ref-52 and Charney–Davis are read from author-hosted PDFs; Weibel is cited by locator only.
