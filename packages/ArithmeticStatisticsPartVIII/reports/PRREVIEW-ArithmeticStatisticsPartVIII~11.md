# Review of ArithmeticStatisticsPartVIII (pull request #1179 at 7a814c7)

**Verdict:** accepted

**Summary.** Accepted: this head repairs the previous review's finding (§5.16 no longer plans Hurwitz homological stability and the Betti bounds again; it imports §0.2 and §5.3 of InverseGaloisAndArithmeticFundamentalGroupsPartII), and I found no false or unsupported statement in a full reading: every formula, Check and worked value I recomputed holds, the source locators I opened support the statements, and the Lean file elaborates with `sorry` as its only warning. There are four small corrections and two format notes, none blocking. Three points are left to the human reviewers: passages of two roadmaps on main that still describe targets this part no longer has, the conditional §§5.13–5.14, and the Kolmogorov distance, which an open roadmap also defines.

## C01 — Two roadmaps on main cite §5.16 targets by titles this part no longer has

A reader who follows those citations finds no such target here. `TauCetiRoadmap/InverseGaloisAndArithmeticFundamentalGroupsPartII/README.md` on main says (line 440) “ArithmeticStatisticsPartVIII §5.16 (*Tor spectral sequences over graded algebras*) states the same spectral sequences for its own use” and (lines 1859–1860) that this part takes the Betti bound “from its own §5.16 (*Uniform Betti numbers of Hurwitz schemes*)”; its lines 111–122 list nine statements of §5.16. `TauCetiRoadmap/SpectralSequencesAndConvergencePartII/README.md` line 88 has an entry for the same *Tor spectral sequences* target. At this head §5.16 has two targets, *Top cohomology counts rational components* and *Uniform trace error estimate*.

The scope bullet on InverseGaloisAndArithmeticFundamentalGroupsPartII (line 1629) already says where the content lives, without the titles. Adding them there lets a citing roadmap follow: “the graded `Tor` spectral sequences (*Tor spectral sequences over graded algebras*) are DGAInfinity Layer 5, used in its Layer 1; the uniform Betti numbers of Hurwitz schemes (*Uniform Betti numbers of Hurwitz schemes*) are its §5.3”. The passages on main are outside this pull request and are listed for the human reviewers.

## C02 — The two roadmaps named as downstream applications do not use this part; the one that does is not named

*Downstream consumers* (line 1603) says “ModularityAndLanglandsExtensions and CrystallineLocalGlobalCompatibilityCM are downstream applications of the arithmetic-statistics comparisons”, and the description repeats it (“supplies the comparisons used downstream by …”). Neither README, at its open head, mentions ArithmeticStatisticsPartVIII or any arithmetic-statistics part. The open roadmap that does consume this part is CountingBundlesAndHallAlgebrasOfCurves, whose §4.10 (*density of curve Weil tuples*) needs “ArithmeticStatisticsPartVIII §5.17”, the `Sp_{2g}(ℤ_ℓ)` monodromy of the odd-degree hyperelliptic family. Name that consumer and the section it uses, and drop the other two or say which target of theirs uses which section here.

## C03 — “§5.22 uses only group theory and the Hurwitz counts of IG Layer IG.5” understates what §5.22 needs

In *How to read the build* (line 19). The `*Needs:*` line of *Liu wood zureick brown function field moments* (line 1553) also lists InverseGaloisAndArithmeticFundamentalGroups Layer IG.0 (the trace formula), DeligneWeightsAndPurity item 7.12, *Top cohomology counts rational components* of §5.16 and Mathlib's Dirichlet theorem; lines 1531 and 1535 use §§IG.4.5–IG.4.6, and the Cohen–Lenstra–Martinet corollary uses Part I's function-field reciprocity. An implementer planning from the guide would schedule §5.22 too early. Suggested: “§5.22 adds group theory to the marked-extension counts of IG Layer IG.4, the Hurwitz counts of Layer IG.5 and the trace and weight inputs of §5.16.”

## C04 — The description attributes the trace estimate to §5.19

The description says the Betti bound of InverseGaloisAndArithmeticFundamentalGroupsPartII §5.3 is what “the trace estimate of §5.19 uses”. At the head the trace estimate is §5.16 (*Uniform trace error estimate*), which takes a Betti bound as a hypothesis; the target that applies §5.3 is the moment estimate of §5.19 (line 1043). Text that would be right: “… (its §5.3), which the moment estimate of §5.19 feeds into the trace estimate of §5.16”.

## N01 — Three `*Needs:*` lines in §5.17 omit what their proofs name

*Overlapping symplectic subgroups generate* (line 779) lists only `Matrix.symplecticGroup`, while its proof applies `TauCeti.GLSymplecticFin.eq_top_of_adjacent_of_long`; *Mod l hyperelliptic monodromy is symplectic* (line 795) and *Monodromy of the odd degree polynomial family* (line 863) list Layer IG.0 (and IG.1), while their proofs use §IG.5.7. Add the items.

## N02 — Link labels and unqualified names

Four links (lines 1531, 1535, 1569, 1571) are labelled “complements of a coprime abelian normal subgroup are conjugate” but point to the heading *Sections of a coprime abelian semidirect product*; use the heading's title. “similitudeGroup” (line 909) and “Mathlib symplecticGroup” (line 897) are bare names: write “the similitude group of ArithmeticGaloisRepresentations §7.3” and `Matrix.symplecticGroup`.

## Verified sound

Previous finding (review of `500bbc0`), R01, §5.16 re-planning Hurwitz stability and the Betti bounds — repaired. §5.16 now holds only *Top cohomology counts rational components* and *Uniform trace error estimate*; line 479 reads “InverseGaloisAndArithmeticFundamentalGroupsPartII §0.2 for `(v) (G_A, c_A)` being nonsplitting”; line 1043 “the uniform étale Betti bound of InverseGaloisAndArithmeticFundamentalGroupsPartII §5.3, applied to `X_n` with a coefficient prime `λ > max(|G_A|, q, n)`”; line 1629 “InverseGaloisAndArithmeticFundamentalGroupsPartII owns homological stability for Hurwitz spaces … This part imports §0.2 … and §5.3”; a `### From InverseGaloisAndArithmeticFundamentalGroupsPartII` contract is present; the module docstring no longer names stability as missing. Main's §5.3 (its README lines 1742–1752) has the same hypotheses: `G` centreless, `c` rational, generating, nonsplitting, `q` prime to `|G|`, `ℓ > max(|G|, q, n)`, bound `C^(i+1)`. Its small corrections: C01 (description) repaired (“homological stability for Hurwitz spaces is therefore imported, not restated”; InductionRestrictionPartII named); C02 gone with the removed target; C03 repaired (line 793 reworded; line 1531 cites §IG.4.6 for `N`); C04 repaired (line 1003 “these force `ℓ` odd”, and the Lean orbit theorem has no `2 < ℓ`); N01 repaired except the two bare names of N02.

| Statement | Instances | Values computed on each side | Result |
|---|---|---|---|
| 5.12 first moment; `local_density_first_moment` | `(d,n,p,r)` = (1,1,2,1), (2,0,3,2), (2,1,2,2), (2,2,2,1), (3,1,3,1), (2,2,3,1), (3,2,2,1), (2,1,5,1) | brute-force mean = formula: 1/2, 0, 9/14, 31/36, 13/15, 121/126, 3577/4092, 144/155 | exact in all 10 cases run; `n = 0`: `N = 1`, both sides 0 |
| 5.12 second moment; `local_density_second_moment` | (2,2,2,1), (1,2,2,2), (2,2,3,1), (3,2,2,1), (1,2,3,1) | `Σσ²` = 52.94, 31.5, 771.65, 892.94, 20.54 against 113, 113, 1162, 1808, 43.04 | holds |
| 5.12 variance; `local_density_variance` | same five; `d = 1` | 0.118, 0.0625, 0.139, 0.125, 0.0123 against `4p^{1−n}` = 2, 2, 1.33, 2, 1.33; `d = 1`: `p^{−2n}` = 1/16, 1/81 | holds |
| 5.12 two-point count, Hensel step, stratum bound | `v = r` in the formula; `F = t²`, `δ = 1`, `m = 2`; exponent count | `p^{r(N−1)} − p^{(r−1)(N−1)}` = one-point count; `p − 1` solutions at level 2, 0 at level 3; `2p^{−e}·p^{e(n+1)}·p^{r(N−n−1)+(r−e)(n+1)} = 2p^{rN−e}` | holds; `m ≥ 2δ+1` needed |
| 5.13 concentration | Case A, Case B; exponent; `𝔽₅` twists | `(1/2)(0.99² + 0.01²)` = 0.4901; `0.25 + 0.5·10⁻⁴` = 0.25005; `0.495 − 0.5 = −0.005`; `B₀^m`: `2m² log m ≤ (1/2)(2m)² log 2m` | holds |
| 5.14 spacing, model obstruction | `{1,1,1,1}`, `{0,π}`, `{0,0,π,π}`; `p = 2`, `p = 3`; positivity | `(3/4)δ₀ + (1/4)δ₄`; `δ₁`; mass 1/2 = `2(h−1)/N`; `#E(𝔽₂) = 2`, `#E(𝔽₄) = 2·4 = 8`; `p = 3`, `t = 3`: 1 and 7; `S = {2,5,7,11,13}`; `2(0.560) − 1 ≈ 0.12` | holds; `p` odd needed |
| 5.15 dictionary | `A = ℤ/2`; `y² = t³+t²+2` over `𝔽₃`; `y² = t³+2` over `𝔽₇` | Klein group, two classes; 2 affine + 1 = 3 points, moments 2 and 0; 8 affine points, all with `x = 0` or `x³ = 6`, so 3-torsion, `C₃²`, moment 8 | holds |
| 5.16 trace estimate | `C = 1, q = 16`; `n = 1, q = 9` | `Σ_{i≥1} C^{i+1}q^{−i/2} = C²/(√q − C)` = 1/3; `(1 − 3)/9`, modulus 2/9 ≤ 1/2 | holds |
| 5.17 lifting; `Similitude.integral_lift` | subgroup of `SL₂(ℤ/9)` generated by `[[0,1],[8,0]]`, `[[1,7],[6,7]]`; quotients of `S₄` and `SL₂(𝔽₃)` | order 24, determinants all 1, 24 images mod 3, kernel `{I}`; `{S₄, S₃, C₂}` against `{SL₂(𝔽₃), A₄, C₃}`: none common; `|SL₂(ℤ/9)| = 648` | holds; (1,3) hypothesis needed |
| 5.17 Legendre inertia | node of `y² = x(x−1)(x−t)` | `(z−y′)(z+y′) = t²/4`, thickness 2; `U₀³ = [[1,6],[0,1]]`, `≡ I` mod 3, `≢ I` mod 9 | holds |
| 5.18 orbit; `unique_similitude_stable_orbit` | `g = 0`; `q = 1`, `g = 2`; `ℤ₅`, `diag(6,1/3)`, `diag(3,2/3)`; `diag(I, qI)` | `O = {0}`; kernels mod `ℓ` Lagrangian against nondegenerate; determinants 2, 2; entries of `h−1`, `h−2`: `(5, −2/3)`, `(4, −5/3)` and four units; `hJhᵀ = qJ` | holds; `q − 1` unit needed |
| 5.19 moment estimate, large-`q` theorem | constants | average `= (q/(q−1))y`; `(4/3)(2C²) + 1 ≤ 3C² + 1`; `3C² + 1 ≥ 2C`; `Q > B²` gives `√q > B` | holds |
| 5.20 good moments | slice sizes; `C₃²` | `q^{2n−1} − q^{2n−2}`, `q^{2n} − q^{2n−1}` as Part I §0.20; `|C₃[q−1]|` = 3 or 1 (ref-50 line 1468) | holds |
| 5.21 profiles | `A = C₂`, `C₄`; series; counts | `b^r ∈ A^{q−1}` iff `q ≡ 1 (4)`, iff `q ≡ 1 (8)`; `X²/(1−X²)`, `X/(1−X²)`; `C(3,1) = 3`; error `B_n(K_d q^{−1/2} + q^{−1})/(1 − q^{−1})` rederived | holds |
| 5.22 semidirect moments | `ℤ/2` on `ℤ/3`; `ℤ/3` on `𝔽₂²`; cubic; `S₃` | 3 sections against 1 for the trivial action; `T³ = 1`, no allowed `q`; residue 5 mod 6, `5^{odd} − 1 ≡ 1 (3)`; `256 − 27 = 229`; 6 surjections per class | holds |
| GN-a, GN-d | `(1,0),(1,3)` at `Q = 3, 2`; `(2,0),(0,2)` at `Q = 2`; mass | index 3 = 9/3, 4 = 4/1; index 1 against 2; `2^{−2m}∏|ζ(1−2r)|` from ref-52 (9.1), Proposition 9.3 with `d = 2` | holds; primitivity needed |
| C01–C04 | citations on main; consumers at their heads | four passages on main name removed targets; 0 mentions in the two named consumers, 4 in CountingBundlesAndHallAlgebrasOfCurves | small corrections |

- Source locators read at the text: 66 (ref-46 12, ref-47 1, ref-45 12, ref-37 11, ref-48 7, ref-49 1, ref-50 9, ref-51 8, ref-52 3, Raynaud 2); none wrong.
- Library declarations opened at the pins: `TauCeti/LinearAlgebra/Matrix/GeneralLinearGroup/Symplectic/TorusGeneration.lean:165`, `.../Symplectic/Basic.lean:96` and `:423` (defined through `Matrix.symplecticGroup`), `TauCeti/AlgebraicGeometry/EllipticCurve/HasseBound.lean:44` and `:57`, `Mathlib/LinearAlgebra/SymplecticGroup.lean:59` and `:102`, `Mathlib/NumberTheory/LSeries/PrimesInAP.lean:463`, `Mathlib/Data/Nat/ModEq.lean:473`, and eleven more by `#check`; the pinned libraries have no Kolmogorov distance and no hypersurface local density.
- Cross-roadmap citations resolved on main: InverseGaloisAndArithmeticFundamentalGroupsPartII §§0.2, 5.3; InductionRestrictionPartII RS.4.2–RS.4.5, RS.4.18; 16 named items and 13 sections of InverseGaloisAndArithmeticFundamentalGroups; Part I §§0.1, 0.10, 0.11, 0.13, 0.16, 0.19–0.21; Part IV §§3.3–3.5; Part V §3.27; and the sections cited of seven further suppliers. Part VII §5.3 (four targets) at its open head.
- Dependency check: `depcheck: 200 roadmaps, 2205 edges, 0 problem(s)`; no UPWARD, CYCLE or `moved:` line. Nothing changes outside the folder, which holds `README.md`, `Suggested.lean`, `metadata.toml`.
- Automatic checks: all passed. Elaboration: five `declaration uses 'sorry'` warnings (lines 63, 73, 84, 95, 123), no error. `#check @name` for the nine declarations: every binder present, generality equal to the README's.
- Padding probe on a copy (`rfl`, `simp`, `infer_instance`, `trivial`, `norm_num`, `tauto`): all five theorems remain open; none is padding. Headlines: local-density moments, lifting criterion and orbit lemma stated; the large-`q` theorem, the conditional §§5.13–5.14, Wood's and Liu–Wood–Zureick-Brown's moments named in the docstring with their missing carriers.
- Pull request text: title, summary block and prose read against the head; C02 and C04 are the discrepancies.
- Overlap check: read ArithmeticStatisticsPartVII, ArithmeticStatistics, ArithmeticStatisticsPartVI (open), ArithmeticStatisticsPartI, ArithmeticStatisticsPartV (its §3.27 and embedded-type targets only), InductionRestrictionPartII, InverseGaloisAndArithmeticFundamentalGroupsPartII (main); Hurwitz stability and Betti bounds: owner InverseGaloisAndArithmeticFundamentalGroupsPartII; fixed-fibre counts and parity series: owner InductionRestrictionPartII; families and slices: owner Part I; joint-cokernel laws: owner Part VII; the Kolmogorov distance is also defined in the open MathematicalStatisticsHigherOrderAndResampling §1.1, which the merge order does not list, so this part is the earlier owner.

Source independence: 12 passages compared with 8 sources, none shared (longest common runs are formulas and hypothesis lists); largest share ref-37, 33 of 110 locators; contents compared with ref-37: independent (§5.15 draws on its §§8.6–8.7, §§5.18–5.19 on 8.8–8.9, §5.17 on other sources; no layer maps onto its §§1–8).

Research link: §§5.15–5.19 prove Ellenberg–Venkatesh–Westerland (2016), Theorems 1.2 and 8.8; §§5.20–5.21 Wood (2019), Theorems 1.2 and 4.8; §5.22 Liu–Wood–Zureick-Brown (2024), Theorem 1.4; §5.12 Browning–Le Boudec–Sawin (2023), §5; §§5.13–5.14 Lipnowski–Tsimerman (2018), §5. Rests on the README's sources, read here.

## Not verifiable

- The published numbering of ref-45, ref-46 and ref-51, and the Duke page numbers given beside the arXiv locators of ref-50: only the arXiv versions were read.
- Katz–Lang (2.4), Deligne–Mumford 5.15–5.16 and Kleidman–Liebeck, cited inside proofs: not opened.
- ref-45 §§2–3, cited for the quantitative unpolarized count: only Theorem 0.1 was read.
- The sentence of *Downstream consumers* that LocalGaloisDeformationRings consumes ArithmeticGaloisRepresentations §7.3: a search of that README for the section number found nothing; other spellings were not tried.
- Ownership against open pull requests was checked through the search of their heads, not by reading each roadmap.

## Source issues

- **Error** in ref-45 at §5.4.5, (55), p.31: the source says the logarithm of the orbit count is at most `Σ [K_i:ℚ] n_i² log n_i + O(g²)`; it should be `(1/2) Σ [K_i:ℚ] n_i² log n_i + O(g²)`, as the unitary mass gives `Σ_{j≤n} log (j−1)!`; affects a stated result.
- **Error** in ref-45 at Lemma 5.19, p.36: the source says `E(𝔽_p)` and `E(𝔽_{p²})` are never both `p`-groups; it should assume `p` odd, since `y² + xy = x³ + x² + 1` over `𝔽₂` has 2 and 8 points; affects a stated result.
- **Gap** in ref-45 at Corollary 5.13, pp.33–34: the source applies Conjecture 5.2 to every bad abelian variety; it should treat separately those with the simple factor of Frobenius polynomial `(x² − p)²`, whose endomorphism algebra is not a CM field; affects a stated result.
- **Misprint** in ref-45 at Lemma 5.9, proof, p.32: the source says the polytope `[0, ε]^k` has `k(k+1)` extreme points; it should be `[0, εg]^k` with `k(k−1)`; affects nothing.
- **Misprint** in ref-46 at Lemma 5.6, p.55: the source says the stratum itself is at most `2p^{rN−e}`; it should be its cardinality; affects nothing.
- **Misprint** in ref-37 at the deduction after Theorem 8.8, p.777: the source says `ν_n(A)` is the fraction with `Cl(O_L) ≃ A`; it should be the `ℓ`-part of the class group; affects nothing.

## For the human reviewers

- **Scope.** `TauCetiRoadmap/InverseGaloisAndArithmeticFundamentalGroupsPartII/README.md` on main (lines 111–122, 440–442, 1859–1861) and `TauCetiRoadmap/SpectralSequencesAndConvergencePartII/README.md` (line 88) describe §5.16 targets this head removed; they need a follow-up edit outside this pull request.
- **Scope.** §§5.13–5.14 are conditional on Lipnowski–Tsimerman's Conjecture 5.2 and on an analogue (H2, line 339) that the README formulates itself; ref-45 states only the CM case, with thresholds the README halves.
- **Scope.** The Kolmogorov distance of §5.14 is also defined in §1.1 of the open MathematicalStatisticsHigherOrderAndResampling (pull request #2504), which the merge order does not list; one of the two should cite the other.
- **Licence.** ref-48 and ref-52 are read from author-hosted PDFs.
