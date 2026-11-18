# Review of GrossZagierAndArithmeticHeights (pull request #1487 at 9489bba)

**Verdict:** needs changes

**Summary.** Changes are needed, both in the new section 6.20a on the modularity of Kudla's divisor series. The GSpin Shimura variety over a totally real field F₀ ≠ ℚ is taken from a supplier section on Hodge-type data, which it is not (R01), and the orthogonal Borcherds product over ℚ that 6.20a(e) owns is also owned by an open roadmap (R02). There are two small corrections and no format note. The fifteen sampled targets and the other headline formulas agree with their sources; the locators into the Yuan–Zhang–Zhang book could not be read and are left to the human reviewers.

## R01 (P2) — For F₀ ≠ ℚ the datum (Res_(F₀/ℚ) GSpin(U), D′) is not of Hodge type, so ShimuraVarieties §6.2 does not give the canonical model M′_K on which 6.20a is stated

Section 6.20a defines M′_K as "the canonical model over ι(F₀) of G′(ℚ)∖D′ × G′(𝔸_f)/K (ShimuraVarieties §§6.2 and 8.1)" (line 1983). Its `*Needs:*` line (2010) and its supplier row (5461, "canonical models of Hodge type, applied to GSpin data") repeat the citation. An implementer who follows it has no model in the totally real case, which is the case the section is written for and the one 6.20 uses at p = 2.

ShimuraVarieties defines Hodge type as a rational closed immersion into a Siegel datum (`TauCetiRoadmap/ShimuraVarieties/README.md` line 157), and §6.2 (line 1786) covers only such data. A Siegel datum has rational weight. Here h is trivial at the real places other than ι, so the weight is the cocharacter (1, 0, …, 0) of the centre Res_(F₀/ℚ) 𝔾_m, which is Galois-invariant only when [F₀ : ℚ] = 1. The case p = 1 is the familiar one: G′ = Res B^×, and quaternionic Shimura curves over F₀ ≠ ℚ are of abelian type and not of Hodge type. The same supplier has the section that applies, §6.7 "Canonical models of abelian type" (line 1897).

Smallest change: in the three places cite §6.2 for F₀ = ℚ and §6.7 for F₀ ≠ ℚ, and say in one clause that the datum is of abelian type (its derived group is Res Spin(U), with the Hodge-type witness §6.7 asks for).

## R02 (P2) — The orthogonal Borcherds product over ℚ has two owners: 6.20a(e) here and §4.2a of ComplexMultiplicationAndExplicitReciprocityPartII

The scope paragraph says "Section 6.20a owns the Chow-valued modularity of Kudla's divisor series … with the orthogonal Borcherds products over ℚ" (line 5396). Item (e) constructs, for a GSpin Shimura variety of signature (p, 2) over ℚ with p ≥ 3 and a weakly holomorphic f of weight 1 − p/2 with integral principal part, a rational section of L^(⊗c(0,0)) with divisor Σ_(m>0) Z′(m, c(−m)).

Pull request #1695 states the same object in `TauCetiRoadmap/ComplexMultiplicationAndExplicitReciprocityPartII/README.md`, §4.2a (line 525): for the same data with n ≥ 3 and f of weight 1 − n/2, "a rational Borcherds section Ψ(f) of ω^(c_f(0,0))" with divisor Z(f) up to a vertical discrepancy. Its ownership paragraph (line 1062) claims the Borcherds inputs as "the constructions of §§4.2–4.2a here". The two normalisations agree (weight c(0,0), divisor counting x and −x), so this is one construction planned twice. Neither text names the other.

This roadmap is the earlier of the two in the merge order, so it keeps the product on the generic fibre. Smallest change here: one sentence in "Scope and ownership" saying that 6.20a(e) owns the Borcherds product and its divisor on the generic fibre, and that its extension to integral models with the vertical support at bad primes is left to ComplexMultiplicationAndExplicitReciprocityPartII §4.2a, listed under "Downstream consumers". That roadmap then takes (e) by citation instead of constructing the product again.

## C01 — The erratum item that changes Σ(A, χ) to the base-change convention is not among the items 8.11 cites

Section 8.11 says "Root numbers in the base-change convention of the erratum: Σ(A, χ) = {v : ε(1/2, π_(A,v), χ_v) ≠ χ_v(−1)}" (line 4689), and its locator lists erratum items 1, 16, 28–31, 47, 57 and 62. The correction that removes η_v(−1) from the book's definition is item 2 (p. 8, line 10 of the book; yzz-erratum-pku lines 13–20). Item 16 only refers back to item 1. A reader checking the convention finds nothing at the items given. Add item 2 to the locator.

## C02 — Two names are attributed to ShimuraVarieties that it does not use

Section 0a.4 (line 192) and the supplier row for ShimuraVarieties §§4.1–4.4 (line 5445) give `CanonicalModel.special_rational` and `CanonicalModel.special_action` as that roadmap's names. Its §4.4 defines `TauCeti.Shimura.CanonicalModel` with the rationality and reciprocity of special points as conditions in prose, and neither name occurs in its README. The section citation resolves; the names do not. Write them in prose ("the rationality and the reciprocity action of special points in the canonical-model condition of §4.4"), or use the supplier's own name.

## Verified sound

| Statement | Instances tried | Values computed on each side | Result |
| --- | --- | --- | --- |
| 0.5 Artin convention | Conrad's indexing ([b], 𝔫) | conrad lines 94–115: uniformizer ↦ arithmetic Frobenius; [a] sends ([b], 𝔫) to ([b][a]⁻¹, 𝔫); README the same | agrees, p. 69 |
| 0.10 rescaling | measure ×3; pairing ×2, rank 2 | period product ×9; regulator ×2² = 4 | consistent |
| 0.12 CM actions | K = ℚ(√−23), N = 2, class g of order 3 | w₂(1, 𝔫) = (g², 𝔫̄); twice: g²·[𝔫̄]⁻¹ = g²·g = 1; gross84 line 138 has [𝔞𝔫⁻¹] | agrees; gz86 p. 236 prints 𝒜[𝔫] (source issue) |
| 2.8 Arakelov Green function | g_Ar + c | mean becomes c ≠ 0; yuan-bigness-pku lines 3479–3490: symmetric, admissible, mean zero, ‖1‖ = exp(−g) | agrees, p. 103 |
| 2.12 Faltings–Hriljac | sign; real places | gz86 lines 151–167: ⟨a,b⟩ = Σ_v ⟨a,b⟩_v, height of 2Θ; log\|f\|² at complex v, half at real v | agrees, p. 228 |
| 2.15 archimedean sum | h = 1 | one complex place, one symbol; gz86 lines 896–904 give the same two displays | agrees, p. 248 |
| 5.3 Waldspurger | probability against volume 2L(1,η) | CST (2.1): constant ζ_F(2)L(1/2)/(2L(1,ad)); divide by (2L(1,η))²: 1/(8L(1,η)²) | agrees, cst line 789 |
| 5.4 nonvanishing | local Hom zero at one place | α_v = 0 forces the product 0 with L(1/2) ≠ 0 | consistent with 5.3 |
| 6.5 pseudo-theta | V₁ = V = ℚ², V₀ = {0}, value exp(p^(4n)) on shell n | term exp(p^(4n) − 2πp^(2n)) → ∞; the logarithmic bound excludes it | agrees with yuan-zhang lines 1906–1950; source's convergence claim is a gap |
| 7.16 archimedean kernel | λ = −1; A(s) | k_(v,0) = ½log((1−λ)/(−λ)) = ½log 2; A(0) = 1, A′(0) = ψ(2) − log 4π = 1 − γ − log 4π | agrees with yuan-modular line 2836 |
| 7.76 modified pairing | u_x = 1, k = 6, r_x = 0, ord C = 0, ord θ = 6 | correction (0 − 6)/(0 + 6) = −1; conrad (9–9), (9–12) lines 2625, 2689 | agrees, pp. 126–127 |
| 7.90 ramified formula | gz86 (8.5)(2) | Σ ord_p(D·N(b₋)) + u·r_𝒜(m)·ord_p(m), lines 1550–1554 | agrees, p. 264 |
| 7.93 rational-prime sum | u = 3, v ∣ 𝔫̄, ord_v(N) = 1 | 6·ord_v(𝔫̄)/(6/u) = 3; inert p: h places, q_v = p² | agrees with conrad (9–18) and Lemma 10.1 |
| 8.11 YZZ formula | CST (2.4) conversion; finite against completed L | 8L(1,η)²⟨·,·⟩_F = 2ζ_F(2)L′/L(1,ad)·α, so 1/(4L(1,η)²); archimedean ratio 2π² per place | agrees with cst lines 1152–1155 |
| 8.14 CST formula | F = ℚ, (c, N) = 1 | Σ_D = primes of (N, D), so 2^(−μ(N,D)); u₁²√(\|D_K\|‖c₁²‖) = u²√(\|D\|c²) | equals 8.15; cst lines 336–356, 370–380 |
| 8.6 and 8.15 (headlines) | c = 1, (N, D) = 1 | GZ (6.3) with ĥ_H = h·ĥ_K gives 8π²(f,f)/(u²√\|D\|)·ĥ_K; u = 2, 3 for ℚ(i), ℚ(√−3) | consistent |
| 9.17 BDP formula (headline) | χ = 1; p = 5, a_p = 1, −4 | (1 − a_p/p + 1/p)² = ((p+1−a_p)/p)²: 1 and 4 | consistent with 9.7 |
| 6.20a(b) | 𝔰𝔬(p,2), p = 2, 3, 4 | nonzero noncompact roots: p = 3: 4, p = 4: ≥ 4, so dim(𝔲∩𝔭) ≥ 2; p = 2, x₀ = x₁: 2, so 1 | sound; VZ84 Theorem 8.1, p. 88 |
| 6.20a(d) weights | (p, e) = (1, 2), (2, 1) | (p/2 + 1) + e/2 = 5/2 in both; KM90 weight m/2 = p/2 + 1 | consistent |
| 6.20a(e) relation | one ray against ±x; central parity | k − σ/2 = 0 at k = 1 − p/2, σ = 2 − p; Ψ² has weight c(0,0); Σ_(m>0) Z′ = c(0,0)c₁(L); with Z′(0) = −c(0,0)c₁(L) the sum is 0 | sound; Bor98 Theorem 13.3, p. 48 |
| 6.20a(f) | k = 1 + p/2, σ = p − 2 | k − σ/2 = 2, parity factor 1; dual weight 2 − k = 1 − p/2 | sound; Bor99 Theorem 3.1, p. 5 |
| 6.20a Checks | x² − 3y² − 3z²; x² + y² − 3z² − 3w²; (1,1,1,1,0) | descent mod 3 in both; 1 + 1 + 1 − 3 = 0 | true |
| 6.20a carrier (R01) | F₀ real quadratic, p = 1 | weight cocharacter (1, 0), not Galois-invariant; G′ = Res B^× | not Hodge type: R01 |
| 6.20 Check | F = ℚ | erratum item 31: factor 1/2 in place of 2, ratio 4 | agrees |
| `canonicalHeightRat_exists_unique` | torsion P; (1/n) ⊗ P | 1 ⊗ P = 0 and h_x(P) = 0; value forced to h_x(P)/n² | true; not closed by one tactic |

- Source locators checked against the text: 47, in 15 sources (conrad, gross84, gz86, yuan-bigness-pku, cst, waldspurger, yuan-zhang, yuan-modular, zhang-survey, yzz-erratum-pku, and YZZ09, KM90, VZ84, Bor98, Bor99 fetched for this review); every target of the seeded sample was read at its locator.
- Library declarations opened at the pin: `WeierstrassCurve.Affine.canonicalHeightQuadratic` (`TauCeti/AlgebraicGeometry/EllipticCurve/CanonicalHeight/Basic.lean` line 341), `canonicalHeightQuadratic_eq_iff` (`…/CanonicalHeight/Limit.lean` line 82), `QuadraticForm.baseChange` (`Mathlib/LinearAlgebra/QuadraticForm/TensorProduct.lean` line 128); none states the rational extension.
- Cross-roadmap citations resolved: the nine new suppliers of 6.20a (ShimuraVarieties §§0.5, 2.3, 2.7, 2.8, 6.2, 8.1; QSeriesPartitionsAndMockModularForms §8.5; ArithmeticLocallySymmetricSpaces ALS.5b.1, 5b.4; AutomorphicSpectralTheory §§5.10, 5.12, 5.14; AutomorphicFormsOnReductiveGroups §5.4; ComplexKahlerGeometry §§4.5, 6.3; ComplexComparisonPartII §C1.9; SchemeAndStackFoundations §§5.1, 5.3 on main; MetaplecticAutomorphicForms §§4.5, 5.1 at its open head); all exist, §6.2 does not cover F₀ ≠ ℚ (R01).
- Internal references: every `*Needs:*` id is a heading of this head; none of the 24 sections removed since the previous head is cited here, and no other roadmap, open or on main, cites one of them.
- Previous review: it had no findings; its two earlier repairs stand (PadicHodgeRegulators §1.9 at line 5167; `AL.4.2.4` at lines 4697, 4747, 4849; `AL.3.3` absent).
- Automatic checks: all passed on this head. Dependency check: `depcheck: 203 roadmaps, 2212 edges, 0 problem(s)`; no UPWARD or CYCLE line. No change outside the folder.
- Elaboration of `Suggested.lean`: one warning, `declaration uses sorry` at line 43; the elaborated signature (K, Field, AdmissibleAbsValues, DecidableEq, W, IsElliptic) equals README §0.2. One-tactic probe on a copy: `simp`, `rfl`, `infer_instance`, `aesop` and `exact?` all fail. The headlines not stated are each named in the module docstring with the missing carrier.
- Pull request text: title and description agree with the head (a new roadmap; the GSpin theorem and its consumers are described); nothing to correct.

Overlap check: read GrossZagierAndArithmeticHeightsPartII, HeegnerPointEulerSystems, MetaplecticAutomorphicForms, RankOneConverse, AutomorphicCongruences (open) and HilbertModularVarietiesAndShimuraCurves, GL2AutomorphicRepresentationsAndTransfer, AutomorphicLFunctionsAndLocalFactors (main); nothing shared with these (each takes this roadmap's sections by citation, PartII takes §6.20a and §7.2). Outside the lists, the orthogonal Borcherds product is shared with ComplexMultiplicationAndExplicitReciprocityPartII §4.2a: owner this roadmap, as the earlier one (R02).

Source independence: 20 passages compared with 15 sources, none shared beyond formulas and runs of at most seven words in definitions; largest share gz86, 157 of 426 linked locators; contents compared with gz86: independent (its Chapters II–III on local heights are Layer 7, after its Chapter IV on Rankin kernels in Layer 6, and both layers also hold the quaternionic material). The Yuan–Zhang–Zhang book could not be read.

Research link: Layers 6–8 prove the formulas of Gross–Zagier (1986), Yuan–Zhang–Zhang (2013) and Cai–Shu–Tian (2014); §6.20a is Yuan–Zhang–Zhang (2009) with Borcherds (1998, 1999); Layer 9 is Bertolini–Darmon–Prasanna (2013) and Brooks (2015), as used by Skinner (2020) and Jetchev–Skinner–Wan (2017). Rests on the README's sources and the texts read.

## Not verifiable

- `yzz-book` (waived): the locators of 6.20 into its §§4.2–4.3 (Lemma 4.1, §§4.2.4–4.2.6, Proposition 4.2), Theorem 1.2 (8.11), Theorem 7.4 (2.12) and Theorems 3.17, 3.22, 5.7, 7.8 were not read.
- `yzz-draft` (waived), `argos` and `blr` (uncertified): not read.
- McGraw03 (Math. Ann. 326): paywalled; the rationality statement of 6.20a(f)(ii) was not compared with it.
- The description's sentence on review and red-team rounds: not checkable from the files.

## Source issues

- **Misprint** in gz86 at Chapter II §1, statement (i), p. 236: the source says w_N sends the Heegner point (𝒜, 𝔫) to (𝒜[𝔫], 𝔫̄); it should be (𝒜[𝔫]⁻¹, 𝔫̄) for its own indexing of p. 235, as in Gross (5.2); affects nothing.
- **Gap** in yuan-zhang at §6.2, p. 579: the source says bounded support of the local components makes the pseudo-theta series converge; it should also bound their growth near V₀, since a locally constant function there can be unbounded; affects the proof.
- **Misprint** in YZZ09 at §4.1, proof of Theorem 1.3, p. 1158: the source says H¹(M_K, O) vanishes for n > 3 and then treats n ≤ 2; it should be n ≥ 3, which the Vogan–Zuckerman bound gives; affects nothing.

## For the human reviewers

- Not tested: `yzz-book` is waived, so its 30 locators (for example `TauCetiRoadmap/GrossZagierAndArithmeticHeights/README.md` lines 1960 and 4695) were never compared with its text; the second-largest proof source of Layers 6–8.
- Licence: six works cited by the new §6.20a (YZZ09, KM90, VZ84, Bor98, Bor99, McGraw03; README lines 5509–5514) are not in the roadmap's source manifest; the YZZ09 copy is on archive.ymsc.tsinghua.edu.cn, which I read as an institutional repository.
