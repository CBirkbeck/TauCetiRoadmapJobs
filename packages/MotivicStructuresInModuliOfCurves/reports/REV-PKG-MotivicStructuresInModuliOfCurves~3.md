<!-- from CBirkbeck, https://github.com/TauCetiProject/TauCetiRoadmapJobs/pull/13039#issuecomment-6782814844 -->
Review (codex) of 1727236

Verdict: needs_changes

1. **F01** (P1) Boundary injectivity fails at eleven markings

   **Location.** `packages/MotivicStructuresInModuliOfCurves/README.md:627`, §4.7: “Prove that pullback `H¹¹(M̄_{1,n}) → ⊕_{|B|=10} H¹¹(D_B)` is injective”. The paragraph starts with `n ≥ 1` and puts no additional bound on this clause.

   **Claim.** The genus-one degree-eleven boundary restriction is injective throughout the stated range.

   **Witness.** At `n=11`, its source has dimension `2 binom(10,10)=2`. Every actual normalized boundary component has zero `H¹¹`. A proposed `|B|=10` component would have the nonexistent stable factor `M̄_{0,2}`.

   Thus the actual boundary restriction has rank zero and kernel dimension two. This also contradicts the package's correct negative control in §2.4. CLP-H11 Corollary 2.5, preprint p.7, clp-h11 line 317, omits the same necessary bound; matching that locator is not evidence of truth at the endpoint.

   **Exact repair.** Require `n ≥ 12` for the injectivity clause, keeping the classification and rank formula for all their existing values of `n`. State explicitly that the `n=11` restriction is zero and not injective. Only stable `D_B` are indexed. In §10.8, spell out the separating-stratum cases used in the source: when both sides have at least two markings, split the opposite factor so that the map on a cusp-bearing eleven-flag factor is the identity, rather than applying the newly restricted injection to that factor. The source does this at clp-h11 lines 564–577, pp.13–14.

   **Regression.** At `n=11`, the exceptional map is `ℚ² → 0`. At `n=12`, the source has rank 22, the `|B|=10` divisors have stable three-flag rational factors, and the Specht-module injection applies. For the separating type `(1,11)–(1,3)` inside `M̄_{2,12}`, splitting the three-flag factor preserves the rank-two cusp summand by the identity.

2. **F02** (P2) A functional on boundary symbols does not justify weakening the all-degree target

   Re-raised: R05

   **Location.** `packages/MotivicStructuresInModuliOfCurves/README.md:614`, `:622`, and `:1790`, §4.6 and the source corrections: “`T^k_n` is not reached by forgetful pullback alone.” The original three-family theorem is still restricted to `k ≤ 23`.

   **Claim.** The repair's formal-symbol obstruction justifies replacing CLP's all-degree generating family by one containing the additional space `T^k_n`.

   **Witness.** At `(n,k)=(23,24)`, the proposed functional has values `φ(pullback symbol)=0` and `φ(one symbol)=1`. No assertion establishes `ker(Gysin) ⊆ ker φ`, so those values do not define a functional on the cohomology image.

   Let `V` be the sum of the relevant boundary tensor spaces and `G:V→H²⁴(M̄_{2,23})` the sum of Gysin maps. A functional on `V` separates formal combinations only. To separate their images it must annihilate every relation in `ker G`; nonzero value on a symbol also does not prove its Gysin image is nonzero. The repair report expressly acknowledges the possibility of such relations. Consequently its reason for declining the original repair does not establish a counterexample to CLP Lemma 3.2, which has no degree restriction (clp lines 433–440, p.10). A gap in that source's proof is not permission to replace the general target by the version the present route reaches.

   **Exact repair.** Restore the original three-family statement for every odd `n≥1` and every `k≥2`. Make containment of the two-odd-factor boundary contributions in that STE an explicit intermediate target, with its source-proof gap stated honestly. Retain the verified `k≤23` argument and, if useful, the enlarged-family statement as separate subsidiary results. Qualify the functional calculation as a statement on formal boundary tensors until descent through `ker G` and nonzero cohomological image have been established. Do not present it as a cohomological noncontainment Check or as resolution of the missing general case.

   **Regression.** The original family must still be the family at `(23,24)`, where `11+11+2=24`; adjoining `T²⁴₂₃` does not prove that target. The re-association calculation at `(13,15)` remains valid: its source degree is 13 and its four landing pairs are `(1,15),(1,13),(2,12),(1,14)`. This review does not claim to have proved the missing all-degree containment.

3. **F03** (P3) The Arsie–Vistoli manifest entry has the wrong publication venue

   **Location.** `packages/MotivicStructuresInModuliOfCurves/sources.toml:329`, entry `arsie-vistoli`: “Multiple-Valued Logic / An International Journal, Vol. 8, No. 5-6, 591-604, 2002”.

   **Claim.** That venue identifies *Stacks of cyclic covers of projective spaces*.

   **Witness.** BFP's bibliography identifies the same authors and title in Compositio Mathematica 140(3) (2004), 647–666, DOI `10.1112/S0010437X03000253`: bfp lines 1643–1645. The package's README reference already agrees with this identification.

   **Exact repair.** Correct the original entry's venue to `Compositio Mathematica 140 (2004), no. 3, 647–666`, retaining its lifetime key, preprint identity, extraction provenance and locators. The reviewing worker has not rewritten this author-recorded entry. Regression: title, arXiv identifier, DOI and README bibliography then identify the same work; do not add a second key.

4. **F04** (P3) The new two-cusp space has no API list

   **Location.** `packages/MotivicStructuresInModuliOfCurves/README.md:614`, §4.6: “let the two-cusp boundary space `T^k_n ⊂ H^k(M̄_{2,n})` be the span”.

   **Claim.** This newly introduced definition is complete in the required roadmap form.

   **Witness.** Between its definition at line 614 and §4.7 at line 625 there is a Needs line and four Checks, but no API list. The other eighteen explicit API blocks retain at least three Checks.

   **Exact repair.** Keep `T^k_n` as a useful intermediate object for R02 and add prose API bullets: it is the image of the sum of the specified bilinear Gysin maps; it is preserved by relabelling; swapping the two odd factors contributes the Koszul minus sign; it vanishes in odd degree and in degrees at most 23. State source, target and the codimension-one twist of those maps. Keep three or more discriminating Checks and repair the formal-symbol Check as in R02; no Lean declaration is needed.

   **Regression.** Two odd degrees are at least 11, so their Gysin images have even degree at least 24: `T²³_n=0`, while degree 24 permits `11+11+2`. Also `T²⁴_1=0`, since the two genus-one vertices together have only three flags, fewer than the 22 required. These tests do not assert that any permitted global Gysin image is nonzero.

5. **F05** (P2) The Brill–Noether bound has two planned owners

   **Location.** `packages/MotivicStructuresInModuliOfCurves/README.md:772`, §6.1: “every genus-seven curve has gonality at most five”; its route invokes the Brill–Noether bound. The Needs line at 774 cites SchemeAndStackFoundations §3.2.

   **Claim.** The genus-seven gonality bound is a theorem to be built here with the stated supplied inputs.

   **Witness.** PR #1726, `TauCetiRoadmap/CanonicalModelsAndGonality/README.md:1310` and `:1330`, §5.4, already plans Brill–Noether existence and `gon_{k̄} ≤ ⌊(g+3)/2⌋`. At `g=7` this is exactly the bound 5 promised here.

   This is an overlap of the geometric gonality bound, not a claim that the other roadmap owns the genus-seven Chow stratification. Its function-field formulation transports to smooth proper curves through the existing curve dictionary. SchemeAndStackFoundations §3.2, `TauCetiRoadmap/SchemeAndStackFoundations/README.md:4845`, supplies Riemann–Hurwitz and high-degree generation/embedding bounds; it does not supply Brill–Noether existence. Merely citing that section does not resolve the shared ownership. CanonicalModelsAndGonality is not an authorized earlier supplier in this brief, so adding it as a Needs edge is not the repair.

   **Exact repair.** Give the shared Brill–Noether existence theorem and its gonality consequence one earlier owner. Under the supplied order, move ownership of this needed general theorem to this roadmap as an explicit general target with its Picard/intersection-theoretic prerequisites resolved; make §6.1 use that target and retain only its additional family/stratification assertions. Record the move for the separate worker handling PR #1726, which must replace its duplicate theorem by consumption of that earlier owner. Do not add an upward citation or keep a genus-seven-only substitute for the general input. An earlier existing supplier may instead receive the same precise declared contract if ownership is coordinated there, but both roadmaps must name the same owner before acceptance.

   **Regression.** The shared theorem has `ρ(7,1,5)=7−2(7−5+1)=1≥0`, hence geometric gonality at most 5. The next degree gives `ρ(7,1,4)=−1`, so no universal degree-four conclusion follows. Hyperelliptic genus-seven curves still have gonality 2; the bound is not an equality claim.

Five findings: one P1, two P2 and two P3. The package is repairable. Lean elaboration passes without warnings; the dependency check reports zero problems. Those checks do not detect the false boundary injection, the unresolved all-degree reduction, or the shared ownership identified below. The four author files and the design were not changed.

## Verified sound

### Previous findings, checked before the new pass

The following comparisons use the current passages, not the repair report as authority. The changed mathematical passages and their consumers were reread. Unchanged targets were compared against the computed rows of the round-2 adversarial table; a bare earlier assurance was not used as evidence.

| Previous finding | Current passage and location | Disposition |
| --- | --- | --- |
| R01, decoration degree/twist | README:1535: `L^{e+c} S₁₂ → H^{11+2e+2c}`; line 1542 counts edges and Chow codimension. | Repaired. `(e,c)=(0,1)` gives degree 13, and `(2,0)` gives 15. The same correction appears in §4.11. |
| R02, duality | README:30: `Gr^W_k H_c^k(U) ≅ (W_{2d−k}H^{2d−k}(U))^∨(−d)`. | Repaired, including the reverse formula, §5.4 and §12.7. On the affine line the corrected pairs are `0=0` and `L=L`. |
| R03, tensor action | README:457 distinguishes the “plain permutation action” and `sgn(σ)·permute`; §4.2 uses the signed action. | Repaired. Rank-two symmetric square has swap traces `+3` and `−3`, respectively. |
| R04, degree-eleven route | README:1492 uses degrees `11,9,9` at `(2,11)`; line 1504 lists `(2,≤9),(3,≤7),(4,≤5),(5,≤3)`. | Partly repaired. The missing bases, lower odd vanishing and oriented second differential are now supplied in §§10.7–10.9. The new auxiliary injection still needs R01, including its use on an eleven-flag factor. Moving this route after Layer 9 is justified. |
| R05, original all-degree generation | README:614 adds “and `T^k_n`”; line 622 asserts non-reachability by pullback. | Not repaired: R02. The new formal functional does not establish the cohomological obstruction invoked to justify changing scope. |
| R06, supplier drift | README:68 cites `§2.248`, `§§3.1–3.3`, `§7.11`; line 126 cites `§2.3`; line 86 cites `§5.1` and `§4.5`. | Repaired. Current supplier passages were opened. The old `MC.*`, `H.*/…`, `C.0` references are gone. |
| R07, Adams convergence | README:122 requires `ψ_r(F^a) ⊂ F^{ra}` and a complete separated multiplicative filtration; the same slug and requirement occur in the plan. | Repaired. Identity Adams operations on `ℚ[[t]]` fail the new condition; power Adams operations satisfy it. |
| R08, two-cusp flags | README:1773: “at most `n + 4 − r ≤ 15` flags”; three genus-one vertices give at most 14. | Repaired. Both are below 22. The outside-range `(2,20)` example no longer asserts nonzero global pushforward. |

### Seeded source verification

All fifteen requested samples were opened in the supplied legal extractions. The checked locators include the theorem numbers, pages, hypotheses and surrounding proof when the route uses it. No new source was fetched. The manifest has 25 works: 23 readable cached texts and the two settled uncertified texts below. All cited works have entries; R03 is a metadata error within an existing entry.

| Target | Text and locator read | Outcome and qualification |
| --- | --- | --- |
| 0.4 Pure-weight boundary exact sequences | clp lines 166–171, p.4; lines 974–978, equation (6.1), p.23 | Proper compactification, normalization, codimension-one shift and Tate twist agree. The homological and cohomological forms use their respective degrees. |
| 1.2 Weight-graded equivariant Euler characteristic | bfp lines 143–152, Remark 1.6, p.1326; lines 1198–1235, §9, p.1351 | Alternating compact-support class with weights and finite-group action. The package correctly uses compact supports for open moduli, correcting the source's ordinary-trace wording. |
| 2.2 Virtual-dimension vanishing | cfp lines 24–27, Theorem 1, p.1; mss lines 121–124, Theorem 1.4, p.3, and 1174–1199, Theorem 6.2 and proof, p.28 | Closed and once-marked assertions have the stated ranges. The marked genus-one endpoint is supported; the closed genus-one exception is not silently included. |
| 2.6 Keel | keel lines 20–29 and 180–183, Introduction items 1 and 4, pp.545,549; Theorem 1 beginning line 476, p.556 | Stable `n≥3`, rational Chow/cohomology comparison, boundary generators and relations agree. |
| 3.5 Stable range | clp lines 441–445, p.10; wahl lines 44–53, p.2; madsen-weiss lines 134–147, Theorem 1.1.1; looijenga-stable lines 182–192, Proposition 2.1, pp.4–5 | The primary inputs support the stable polynomial algebra and the pointed extension; the degree-six threshold is genus ten. |
| 4.9 Finite generation | clp lines 72–78, Theorem 1.3, p.2, and 441–445, proof, p.10 | Strict genus bound and weak marking/dimension bounds agree. The corrected §4.5 has enough same-degree hypotheses for this application. |
| 5.2 CKgP permanence | clp lines 465–474, Proposition 4.2, p.11 | Six operations and their representability/DM/rational-coefficient qualifications agree. Exterior products are tested against arbitrary allowed stacks. |
| 6.6 Open tetragonal stratum | clp lines 605–612, Lemma 5.2, pp.14–15; canning-larson lines 2019–2044, Lemmas 10.11–10.12, pp.38–39 | `f=4,g=7` gives `n≤3`; vector-bundle/open/projective-bundle factorization supports CKgP and Chow generation. |
| 7.7 Genus-seven CKgP | clp line 154, Theorem 1.10, p.4; lines 877–902, Lemma 5.13, pp.20–21; lines 948–952, Lemma 5.17, p.22 | The pentagonal construction allows four markings, but the combined gonality argument gives three. The unmarked transfer uses `κ₀=12`. Half-spin descent is separately treated by the package, not inferred from the source's SO notation. R05 concerns the shared Brill–Noether input. |
| 8.9 Cone sieve | bfp lines 773–806, Propositions 8.1–8.2, pp.1341–1343 | All 16 table entries compared coefficientwise, including the negative terms and exact zero entries. |
| 8.10 Non-split sieve | bfp lines 875–898, Propositions 8.4–8.5, pp.1343–1344 | All 16 entries compared coefficientwise; `p_m=1+q+⋯+q^m`, not `q^m`. These are exact terms. |
| 9.2 Hyperelliptic equivariant counts | bfp lines 1429–1434, §11.1, p.1357; bergstrom-hyperelliptic lines 1620–1643, Theorem 10.3, pp.24–25 | Both Schur expansions agree. The weight-at-most-five result equates odd/even-characteristic moment polynomials; no characteristic-two exclusion is introduced. |
| 9.7 Pure Tate cohomology | bfp Remark 1.6, pp.1326–1327; §3, p.1330, including lines 297–304; §9.3 and its comparison argument | Purity and polynomial recognition give the Tate conclusion. Actual all-ℤ splitting additionally uses the explicitly imported WeilConjectures §5.25; Remark 1.6 alone is not a global splitting theorem. |
| 10.1 Low-degree tautological cohomology | arbarello-cornalba lines 474–491, Theorems 2.1–2.2, preprint p.11 | Stable-pair hypotheses and degrees 1, 2, 3 agree; divisor generators give the degree-two statement. |
| 11.8 Relation-symbol representation | clp lines 1125–1129, proof of Lemma 7.3, p.27 | Corrected inducing subgroup `S₁₀×S₂` has index 66; the printed decomposition has dimensions 11 and 55. This concerns relation symbols, not an assertion that all restriction relations vanish globally. |

### Computed adversarial table

This table records the fresh sampled checks, every headline family and every mathematical target touched by a finding or repair. For unchanged nonsampled targets the numerical rows of round 2 were retained after comparison with the present statements, including its complete marked/twisted sieve tuples; those rows are evidence rather than a claim that a small numerical sample proves the theorems. In particular, the previous all-degree and degree-eleven rows are superseded below. Values at `q=1` mean polynomial evaluation only. `L` has weight 2; `S₁₂` has weight 11.

| Statement | Instances | Values computed on the two sides or competing models | Result / change |
| --- | --- | --- | --- |
| Stability and dimension | `(0,2),(0,3),(1,0),(1,1)` | `2g−2+n=0,1,0,1`; stable dimensions are 0 and 1 | Unstable targets excluded; no natural-subtraction extension is used. |
| Conventions; 5.4; 12.7 duality | `𝔸¹`, k=0,2; `(1,10)`, k=11 | Correct pairs `0=0`, `L=L`; old same-degree pair has dimensions `1≠0`; complementary degree at `(1,10)` is `20−11=9`, giving zero | Previous R02 repaired. |
| Tate sign | `ℙ¹/𝔽₂` | Traces `1+2=3=#ℙ¹(𝔽₂)`; inverse convention gives `1+1/2`, not 3; `H₀=H²(1)=ℚ` | Convention agrees across count and homology layers. |
| 0.4 boundary sequence | `(0,4)`, degree 2 and homology 0 | `ℚ³(−1)→L` has rank1, kernel2, cokernel0=`W₂H²(M₀,₄)`; `ℚ³→ℚ→0` is exact | Correct shifts; three boundary points, not one. |
| 0.5 cusp realization | weights12,14,16,24 | Cusp dimensions `1,0,1,2`; realization ranks `2,0,2,4` | Rank-two notation is not extended to weight24. |
| 1.2 equivariant Euler class | `𝔸¹`, `𝔾_m`; standard S₃ | `E_c=L,L−1`; character values `(2,0,−1)` at identity, transposition, three-cycle | Compact supports and virtual subtraction retained; nonabelian test included. |
| 1.3–1.4 graph/Adams operations | `p₁²,p₂`; identity versus power Adams on `ℚ[[t]]` | `Δ(p₁²)=h=Δ(p₂)`; identity partial sums mod t² are `t,3t/2,11t/6`; power action gives `Exp(t)=1/(1−t)`, `Log= t` | Half-factor and Adams convergence distinguish wrong models. |
| 2.2 vcd vanishing | genus1 marked, genus2 closed/marked | vcd values `1,3,5`; rational top groups are `0,0,0` | Correct exceptional ranges; no claim about arbitrary twists. |
| 2.6 genus zero | n=3,4,5 | n3: rank1 in degree0; n4: ranks `(1,0,1)`; n5: `b₂=5`, equal to rational Chow rank5 | Keel generators span the correct object. |
| 3.1 signed harmonic tensors | rank2, two slots; rank4 exterior square | Sym² rank3: unsigned trace `+3`, signed `−3`; primitive exterior rank `6−1=5` | Previous R03 repaired. |
| 3.5 stability | `(g,k)=(4,2),(10,6),(9,6)` | Bound `(2g−2)/3` is `2,6,16/3`; degree6 is included at g10 and excluded at g9 | Stable-range endpoint retained. |
| 4.5 filling criterion | `S=RH`, `(1,12,11)` and `(1,11,11)` | Quotient at first triple is 0 but full H¹¹ rank22; second quotient rank2 | Same-degree prerequisite excludes the source's counterexample. |
| 4.6 one odd vertex | `(n,k)=(13,15)` | `11+2+2=15`; after expansion source degree13 and pairs `(1,15),(1,13),(2,12),(1,14)` | Verified route; does not assume the degree11 factor itself is a generator. |
| 4.6 two odd vertices | k=23,24; n=1,23 | `11+11+2=24`; degree23 space zero; n1 has `n+2=3<22` flags; n23 permits flags `(11,14),(12,13)` | Vanishing checks sound; original all-degree target still missing, R02/R04. |
| 4.6 proposed obstruction | n23,k24 | Formal pullback: `φ= (−1)^a(−1+1)=0`; one formal symbol: `φ=1`; values on the corresponding cohomology quotient are not established | Formal calculation does not prove noncontainment: R02. |
| 4.7 boundary injection | n11 versus n12 | n11 source rank2, restriction rank0, kernel2; n12 source rank22 and stable boundary factors | False endpoint: R01. |
| 4.7 restriction rule | n12, `Bᶜ={x,y}` | `|A∩B|=9` gives0; `|A∩B|=10` gives nonzero pullback of S₁₂; n13 rank `2 binom(12,10)=132` | Rule and rank formula sound on stable divisors. |
| 4.8 closure | forget `(1,12)→(1,11)` | H¹¹ pushforward lands in H⁹=0 | No lower-degree cusp is created. |
| 4.9, 4.11 finite generation headline | k′=0,4,11 | k0 seed set empty but generated STE has unitℚ; k4 permits g≤6,n≤4; `(g′,n′,k′)=(1,11,11)` satisfies `1<17.5`, `11≤11`, `11≥11` | Strict/weak bounds and empty-family unit correct. |
| 5.1–5.3 CKgP | point, ℙ¹, elliptic curve; BC₂ | Point exterior product identity; `A*(ℙ¹×Y)=A*(Y)⊕h A*(Y)`; elliptic diagonal has nonzero H¹⊗H¹ component; `A¹(BC₂)_ℚ=0`, integral CH¹=ℤ/2 | Universal test-stack quantifier and rational coefficients matter. |
| 6.1 shared gonality input | g7,d5 versus d4,r1 | `ρ=1` versus `−1`; `⌊(7+3)/2⌋=5`; hyperelliptic gonality2 also satisfies bound | Mathematical values agree with PR #1726; ownership repair R05. |
| 6.6 marked tetragonal evaluation | f4,g7,n0,3 | Allowed bound `4f−2g+1=3`; target ranks `2n=0,6` | Small-marking and rank conventions agree with source. |
| 7.3–7.7 genus-seven headline | split rank10; n0,4 | Half-spin rank `2⁴=16`; central −1 acts by −1; n4 quotient rank12 and selected rank3; unmarked `κ₀=12`, push-pull `12α/12=α` | Rational transfer, effective quotient and n0 denominator are distinguished; combined theorem n≤3. |
| 8.9 cone sieve, all n≤3 | q2, tuples `(S₀,S₁,S₂,S₃)` | n0 `(32768,−24576,4096,0)`; n1 `(98304,−86016,18432,0)`; n2 `(245760,−245760,64512,−1536)`; n3 `(491520,−552960,172032,−8448)` | Both README and source polynomials give these values. |
| 8.9 cone denominator | q2,3, n0 | q2 sum12288/Aut48=256=2⁸; q3 sum8503056/Aut1296=6561=3⁸ | Stabilizer factors nonzero, including characteristic2. |
| 8.10 non-split sieve, all n≤3 | q2 | n0 `(65535,−40955,0,2540)`; n1 `(163835,−122855,10240,7580)`; n2 `(327660,−286620,46080,13680)`; n3 `(491460,−491220,115200,14160)` | Both polynomial tables agree; `p₁₅(2)=65535`, not32768. |
| 8.9–8.10 odd-characteristic check | q3, n3 | Cone `(701502120,−450661968,80779032,−2624400)`; non-split `(573955920,−340118640,51963120,492480)` | Matches direct evaluation after coefficientwise source comparison. |
| 9.2 hyperelliptic equivariance | q2,n2,3 | S₂ coefficients `(767,256)`, dimension1023=`(q+2)q⁸−1`; S₃ `(1278,510,0)`, dimension2298=`(q²+3q−1)q⁸−3q` | Identity specialization and characteristic2 agree. |
| 9.5–9.7 count/Tate headline | q2,n0…3 | Compact counts `(7965,47517,388191,3955127)`; open `(832,2364,6120,14451)`; differences `(7133,45153,382071,3940676)` equal boundary values | Count decomposition and all-prime-power scope retained. |
| 9.7 middle cohomology | `(4,3)`, d12 | Coefficient of L⁶ is `3414+2·3304+583=10605`; cohomological degree `2·6=12` | Tate exponent and S₃ dimensions agree. |
| 9.8 universal odd headline | k7,k9; first cusp | Base counts `7+6+4=17`, `9+8+6+4=27`; first excluded odd degree11 has rank2 at `(1,11)` | Universal bound nine is discriminating. |
| 10.1 low-degree cohomology | `(0,4),(1,1)` | H¹=H³=0, H² rank1 in each; on M̄₁,₁, `ψ=δ_irr/12`, integral `1/24` | Divisor generators and stack multiplicity consistent. |
| 10.2–10.4 tautological headline | degree4,6, homology14 | k4 seeds g≤6,n≤4; k6 stable threshold g10; homology14 seeds g≤7, genus7 n≤2; complementary Tate exponent `d−7` | Finite reductions lie in supplied ranges. |
| 10.7 oriented complex | `(0,3),(0,4)`, k0 | Point: kerα=ℚ; ℙ¹ boundary: `ℚ→ℚ³` diagonal, ker0, cokerℚ²; two-edge contraction signs sum `1−1=0` | Kernel and next cohomology agree with compact supports. |
| 10.7 orientation character | two rational vertices in `(1,2)` | Constant H⁰ action +1 times determinant action−1 gives invariant dimension0; unsigned model gives1 | New complex retains essential orientation. |
| 10.8 genus-two induction | n9,11,12 | n9 threshold `2g−2+n=11`, CKgP gives zero; n11 generator degrees `(11,9,9)` all zero; edge exchange yields `ξ*−(−ξ*)=2ξ*` | Bases and signs repaired; R01 limits the genus-one injection used in the route. |
| 10.9 higher-genus induction | g2…6; `(3,12)` | Boundary of base region n≤`9,7,5,3`, none for g6 since12>11; `(3,12)` separating H¹¹ rank22, other contraction `(2,14)` rank0 | Correct bases and two-edge detection; first restriction alone is insufficient. |
| 11.2 decorated graphs | `(e,c)=(0,1),(1,0),(2,0)` | Degree/twist `(13,L),(13,L),(15,L²)` | Previous R01 repaired, including positive-codimension decorations. |
| 11.8 relation symbols | S₁₂ induced representation | Index `12!/(10!2!)=66=11+55`; induction from S₁₀ alone gives132; restriction rank825 plus11 gives836, remaining relations `891−836=55` | Correct subgroup and distinction between restriction/global relations. |
| 12.1–12.2 cusp-homology headlines | degrees13,15 | Degree13 exceptional pairs `(1,11…13),(2,11)`; degree15 `(1,11…15),(2,11…13)`; complement degrees `2d−13`, `2d−15` | Two distinct cusp seeds remain necessary. |
| 12.7 small-marking induction | `(8,0),(8,1)` | `2g=16>15`, while `2g−2+n=14,15` | Correct additional vanishing condition is retained. |
| 12.9 realization headline | weights13,14,15; `(1,15)` | `2+11=13`, `2·7=14`, `4+11=15`; exceptional S₁₆ has types `(15,0),(0,15)` | Genus≥2 in degree15 is essential; semisimplification does not split extensions. |
| 12.10 genus-three headline | g3,n11; outside case `(2,20)` | d17; two cusp vertices have ≤15 or≤14 flags, need22; outside graph has22 flags and decoration/Gysin degree24 | Corrected Check separates allowed tensor monomials from actual occurrence. |

The 18 explicit API blocks have respectively 3 or 4 Checks. The new additional definition in §4.6 is the exception R04. The 109 numbered targets each have a Needs line, and all 13 layers have Examples and Dependencies. The order is driven by the dependencies: low odd vanishing precedes the genus-four cutoff; the resulting all-genus degree-nine theorem precedes the repaired degree-eleven complex argument. No claim that the plan follows a source's chapter order, chapter-named layer, copied source paragraph, computational algorithm, or forbidden process instruction was found. The sieve tables are mathematical identities; their small evaluations are Checks.

### Lean, pins and headline coverage

Ran the prescribed `lake env lean` command on `packages/MotivicStructuresInModuliOfCurves/Suggested.lean` from the pinned content checkout, using its absolute input path as required. Exit 0, no output and **no warnings**. No TauCeti module import exists, so no object build was needed.

The file has one `import Mathlib`, the module docstring and the required namespace, with **zero declarations, zero definitions and zero sorries**. Accordingly the exhaustive one-tactic padding probe and exhaustive `#check @name` binder audit each have zero subjects. The automated lead `and : Bool → Bool → Bool` comes from English in the docstring, not a declaration. There is no sorry'd data, stand-in, `set_option`, free-predicate headline or missing own Lean name.

| Headline family | README | Docstring and statability assessment |
| --- | --- | --- |
| Odd vanishing through nine | 9.8 | Named; actual compact pointed-curve stacks and geometric cohomology unavailable. |
| Genus-four polynomial counts and pure Tate cohomology | 9.5, 9.7 | Named; stack point groupoids and geometric cohomology unavailable. Bare polynomial identities would be stand-ins. |
| Finite STE generation and finitely many simple realizations | 4.9, 4.11 | Named; STE on actual curve cohomology with clutching/forgetting unavailable. |
| Tautological H⁴, stable H⁶, even homology through14 | 10.2–10.4 | Named; stack Chow groups, cycle maps and tautological subspaces unavailable. |
| Cusp generation of homology13 and15 | 12.1–12.2 | Named; same missing geometric STE carriers. |
| Genus-seven CKgP and tautological Chow | 7.7 | Named; stack Chow and universal exterior products unavailable. |
| Realization classification in degrees13–15 | 12.9 | Named; abstract Hodge carriers exist, but the geometric cohomology does not. |
| Genus-three cohomology, n≤11 | 12.10 | Named; the same missing curve-moduli and geometric cohomology carriers. |

No statable headline was found omitted. The new intermediate H¹¹ theorem has the same missing geometric carrier, not an available native replacement. Pins read from `lake-manifest.json`: Mathlib `1b1ccf4b088b32fa3f23f2de1127433254a81e1e`, Tau Ceti `2fd255d997f47c0b5d834ee416c7015d55444ce5`.

These declarations were opened at those pins. Paths are relative to their library repositories.

| File and line | Actual supplied object / relevant limit |
| --- | --- |
| `Mathlib/NumberTheory/ModularForms/Basic.lean:78`, `:86` | `ModularForm`, `CuspForm`: analytic modular/cusp forms, not geometric realizations. |
| `Mathlib/NumberTheory/ModularForms/LevelOne/DimensionFormula.lean:167`, `:172`, `:262` | The two cited cusp-rank theorems and `ModularForm.dimension_level_one`; even-weight assumption and residue-2 exception retained. |
| `Mathlib/Algebra/IsPrimePow.lean:28` | Prime base and positive exponent: 0 and1 excluded, 4 included. |
| `Mathlib/NumberTheory/LegendreSymbol/QuadraticChar/Basic.lean:120`, `:239` | `quadraticChar`; zero-sum theorem requires characteristic≠2. The roadmap supplies a separate even-characteristic count argument. |
| `Mathlib/Algebra/Polynomial/Basic.lean:69` | Native finite-support polynomial carrier; no stack counting function. |
| `Mathlib/GroupTheory/Perm/Cycle/Type.lean:50` | `Equiv.Perm.cycleType` counts nontrivial cycles; it does not include fixed points automatically. The README makes no contrary conversion claim. |
| `Mathlib/Combinatorics/Enumerative/Partition/Basic.lean:52` | `Nat.Partition`, positive parts with prescribed sum. |
| `Mathlib/RepresentationTheory/Basic.lean:48`; `Mathlib/RepresentationTheory/FDRep.lean:63` | `Representation` and `FDRep R G = Action (FGModuleCat R) G`; no geometric local system included. |
| `Mathlib/LinearAlgebra/QuadraticForm/Basic.lean:160` | `QuadraticForm = QuadraticMap R M R`; this does not classify finite-field quadric surfaces or their stabilizers. |
| `TauCeti/RepresentationTheory/Spin/HalfSpin/Basic.lean:119`, `:260`, `:324` | `spinPlus`, `spinPlusAction`, `spinPlusSubrep`; action/subrepresentation assume `P.line=⊥`. No descent through SO is supplied. |
| `TauCeti/RepresentationTheory/Spin/Dimension.lean:73` | `finrank_spinPlus` requires nonzero polarization summand; rank-five specialization gives16. |
| `TauCeti/RepresentationTheory/RepresentationRing/Basic.lean:106`, `:127` | `repRing = SplitK0 (FDRep k G)`; character is a ring map to `G→k`. Finite-group characteristic-zero semisimplicity is needed to identify split and exact relations. |
| `TauCeti/NumberTheory/ModularForms/LevelOne/PeriodPolynomial/Finrank.lean:213` | Period-polynomial/modular/cusp dimension comparison; not a stack Eichler–Shimura construction. |
| `TauCeti/Geometry/Hodge/Structure.lean:62`; `TauCeti/Geometry/Hodge/Tate/Basic.lean:93`; `TauCeti/Geometry/Hodge/Tate/Twist.lean:63` | Abstract Hodge structures and Tate objects/twists with weight shift `−2m`; no geometric Betti functor on stacks. |
| `TauCeti/AlgebraicGeometry/Curves/PointedPrestable/Basic.lean:68` | `PointedPrestableFamily`: prestable morphism, disjoint ordered smooth sections; no stability, fixed genus or algebraic moduli stack. |

Object searches across both pinned trees found no native stable pointed moduli stack or its Chow/cohomology carrier. The nearby prestable family and abstract Hodge structures were inspected rather than dismissed by name. No native theorem duplicates an acceptance declaration, because there are none. The README's imported identifiers resolve; mathematical symbols in backticks are not presented as new Lean declarations.

### Current suppliers, gaps and open ownership

Read main-roadmap forms SchemeAndStackFoundations, StableReduction and RepresentationTheory/SchurWeyl, and used `roadmaps show`/`roadmaps grep` for the relevant open heads. Read the board package index before resolving the MappingClassGroups lead. Every distinct supplier citation was resolved again and compared with its repeated Needs lines. The mechanical result does not excuse R05's semantic ownership problem.

| Supplier | Current evidence read |
| --- | --- |
| Main SchemeAndStackFoundations | `TauCetiRoadmap/SchemeAndStackFoundations/README.md:2849` onward, §§1.18–1.23; `:4845` §3.2; `:6037` §4.15; `:6389` §4.17; `:6902`–`:7440` §§5.1–5.8. Stack carriers, stable pointed stacks, normal crossings and scheme Chow operations exist. §3.2 does not contain Brill–Noether. |
| Main StableReduction | `TauCetiRoadmap/StableReduction/README.md:372`, Layer1; dual graphs and the arithmetic-genus formula near line395. Loop flags count twice. |
| PR #1841 StableReductionPartII | `TauCetiRoadmap/StableReductionPartII/README.md:337` §0.4; `:5614` §2.248; §§3.1–3.3 at 5780,5808,5836; §3.5 at5896; §3.7 at5938; §§3.10–3.11 at5980,5994; §§4.1,4.14 at6081,6313; §§5.1,5.10,5.11 at6347,6501,6513; §7.11 at7297. Geometry is exported; tautological/cohomological operations are assigned to this package. |
| PR #1208 WeilConjectures | `TauCetiRoadmap/WeilConjectures/README.md:447`–`:661`, §§1.7–1.15; `:1191`–`:1308`, §§5.22–5.27; `:1598`, §6.8. Mass, trace, twists, configurations, cutoff, all-ℤ Tate recognition, equivariance and purity agree. |
| PR #929 DeligneWeightsAndPurity | `TauCetiRoadmap/DeligneWeightsAndPurity/README.md:2863`, §8.24 supplies oriented boundary spectral sequence, DM descent/coarse comparison and purity; `:3044`, §9.6 has scheme hard Lefschetz. Stack hard Lefschetz remains a declared extension. |
| MixedHodgeModulesAndIrregularHodgeTheory | `packages/MixedHodgeModulesAndIrregularHodgeTheory/README.md:431`, §4.5; `:480`, §5.1. Projective direct images and operations on varieties/supported categories, not the undeclared replacement of schemes by DM stacks. |
| PR #1313 MotivesAndAlgebraicCycles | `TauCetiRoadmap/MotivesAndAlgebraicCycles/README.md:181`, §0.6; §§2.4,2.6,2.7 at387,417,435: diagonal support, cycle maps and scheme realizations/comparison. |
| PR #1007 AutomorphicGaloisRepresentations | `TauCetiRoadmap/AutomorphicGaloisRepresentations/README.md:1711`, §1.2: parabolic realizations of rank twice cusp dimension, including level-one weights12,16. |
| PR #853 AlgebraicModuliForArithmeticGeometry | `TauCetiRoadmap/AlgebraicModuliForArithmeticGeometry/README.md:609`, §1.3; `:8413`, §5.1. Quotient Grassmannians and rigidification by flat finitely presented normal inertia subgroups. Characteristic-zero μ₄ applications meet those hypotheses. |
| PR #856 ArithmeticGaloisRepresentations | `TauCetiRoadmap/ArithmeticGaloisRepresentations/README.md:3461`, §5.1; `:3513`, §5.3. Frobenius density and recognition of continuous representations after common coefficient extension; conclusions retain semisimplification when needed. |
| Main RepresentationTheory/SchurWeyl | `TauCetiRoadmap/RepresentationTheory/SchurWeyl/README.md:824`, §7.5; `:875`, §7.6; §§9.4,9.6,9.7 at1304,1381,1429. Stable symmetric functions, Frobenius characteristic and harmonic tensors; signed and unsigned conventions agree with repaired §3.1. |
| PR #1229 SchemeKTheoryOperations | `TauCetiRoadmap/SchemeKTheoryOperations/README.md:2136`, §6.2.1; `:2150`, §6.2.2. Special λ-structures and Adams operations, including binomial examples; continuity alone is not summability. |
| PR #1427 HabiroNahmSeries | `TauCetiRoadmap/HabiroNahmSeries/README.md:1081`, §5.1. Augmentation logarithm/exponential; the more general filtered Adams theorem is explicitly contracted. |
| MappingClassGroupsAndCanonicalRepresentations | `packages/MappingClassGroupsAndCanonicalRepresentations/README.md:864`, §2.3. Pure mapping-class uniformization, contractible Teichmüller space, finite stabilizers. The resolver's “nowhere” lead is false: this earlier board package supplies the cited section. |

The eight existing gaps have matching slugs in `design/plan.json` and the README. Each names a supplier, describes a coherent missing interface, and separates supplied scheme/proper/fixed-degree statements from the requested extension. No gap has supplier `none`, and no already-supplied identical interface was found.

| Gap | README line | Specific additional contract |
| --- | --- | --- |
| `stack-rational-chow` | 60 | Rational stack Chow operations, including nonrepresentable proper pushforward and universal products. |
| `pointed-coarse-projectivity` | 70 | All stable pointed pairs over ℤ and an ample tautological pullback. |
| `open-dm-stack-duality` | 76 | Nonproper smooth DM duality with complementary degrees and actions. |
| `dm-stack-hard-lefschetz` | 82 | Smooth proper DM stacks with projective coarse space and pulled-back ample class. |
| `dm-stack-mixed-hodge` | 88 | Geometric DM mixed Hodge realization, oriented weights, duality and projective-coarse hard Lefschetz. |
| `dm-stack-cycle-class` | 94 | Stack cycle classes, operations and Betti–étale compatibility. |
| `completed-symmetric-functions` | 112 | Completion, Adams operations, stable Frobenius characteristic and the defined graph operator's exponential. |
| `complete-adams-series` | 122 | Complete separated multiplicative filtration and filtration-increasing Adams operations, explicit inverse Exp/Log. |

The overlaps file reports no conflicting change to this roadmap, no dropped cited ID and no revision-only cited ID. The closest heads were also read: PR #1547, `TauCetiRoadmap/CountingBundlesAndHallAlgebrasOfCurves/README.md:6`, concerns Hall/Higgs objects on a fixed curve, not this curve-moduli STE; PR #1998, `TauCetiRoadmap/GromovWittenTheory/README.md:342`, requires a separate Chow–Künneth hypothesis rather than claiming to prove the present CKgP theorem. The explicitly selected algebraic #1998 head was used. The WeilConjectures and StableReductionPartII divisions of ownership are as above. PR #1726 contributes the actual overlap R05; its distinct family-free carrier is not a reason to overlook the common gonality theorem. No fully qualified Lean declaration collides with an open roadmap, since this package declares none.

The prescribed dependency command, with `--movable`, completed with exactly:

```text
depcheck: 236 roadmaps, 2147 edges, 0 problem(s)
```

There was no UPWARD, CYCLE or moved line. Neither the merge order nor any tooling was edited. The missing shared-owner decision in R05 requires a semantic correction even though the present graph is mechanically acyclic.

## Not verifiable

- `harer-vcd`: the primary text remains settled as uncertified. Its stated main-theorem locator was retained; it was not requested again. CFP/MSS were read for the sampled top-degree vanishing, which is a different assertion.
- `mukai`: the primary text remains settled as uncertified. Its genus-seven theorem is used at the recorded locator through CLP's discussion; the primary proof was not certified or requested again. The CLP incidence and Chow arguments were read.
- The all-degree containment in R02 is not established by the source proof inspected or by the proposed formal-symbol functional. This is an unresolved proof obligation, not evidence that the source theorem is false.
- The full geometric 891-column restriction map was not reconstructed or formally proved. The unchanged round-2 numeric block/rank ledger and the source proof were used for that nonsampled target; the present sample §11.8 was checked independently by the inducing index and dimensions. Lean's empty acceptance namespace cannot certify those geometric assertions.

## Source issues

The following are errors or gaps encountered in the passages read for this round, including rechecked corrections used by the sampled or repaired targets. They are separate from package findings; a correctly corrected source error needs no package repair.

- **Error** in clp-h11 at Corollary 2.5, preprint p.7: the source says genus-one degree-eleven boundary restriction is injective without the endpoint qualification; it should be restricted to n≥12, since n=11 has nonzero cusp cohomology and zero boundary restriction; affects a stated result.
- **Misprint** in clp-h11 at Corollary 2.4, preprint p.7: the source says the holomorphic pullback forms form a basis of full H¹¹; it should be a basis of H¹¹,⁰, with conjugates supplying H⁰,¹¹; affects a stated result.
- **Misprint** in clp-h11 at proof of Lemma 2.1, preprint p.5: the source says the rank specialization sets p₁=x and p_n=0 for n>0; it should set p_n=0 only for n>1; affects the proof.
- **Error** in clp at Lemma 2.1, hypothesis (2.2), pp.4–5: the source says smaller triples only need degrees at most k−2; it should also require the same-degree forgetful triples used to lift the marking subspace; affects a stated result.
- **Gap** in clp at proof of Lemma 3.2, p.10: the source says boundary classes belong to the extension generated by its three families; it should justify the two-odd-factor boundary containment, beyond the verified one-odd-factor re-association; affects the proof.
- **Error** in clp at §5.3, equations (5.10)–(5.13), pp.20–22: the source says the half-spin bundle is an SO₁₀ representation and identifies the SO quotient with the moduli stack; it should use the Spin lift and effective central quotient with the required descent or rational transfer; affects the proof.
- **Misprint** in clp at proof of Lemma 7.3, p.27: the source says the relation-symbol representation is induced from S₁₀; it should be induced from S₁₀×S₂, giving dimension66 instead of132; affects the proof.
- **Gap** in clp at proof of Lemma 8.2, p.28: the source says the bound 2g−2+n>15 suffices for the reduction; it should additionally use 2g>15 when n≤1, covering (8,0) and (8,1); affects the proof.
- **Misprint** in bfp at Corollary 3.2, p.1330: the source says the local conclusion concerns arbitrary genus; it should concern genus four, with other genera handled by the subsequent induction; affects a stated result.
- **Misprint** in bfp at proof of Proposition 3.1, p.1330: the source says the comparison error has exponent d/2; it should have exponent s/2 from the hypothesis; affects the proof.
- **Error** in bfp at §9.1, p.1351: the source says an open variety's twisted count is the ordinary cohomology trace; it should use compact supports, giving q rather than1 for the affine line; affects a stated result.
- **Misprint** in bfp at opening of §9, p.1351: the source says the Getzler–Kapranov formula is Theorem 8.3; it should cite Theorem 8.13; affects nothing.

<!-- tauceti-roadmap-review {"agent": "codex", "head": "1727236ddd72173c89f7b9eb09301a7d93820d5f", "job": "REV-PKG-MotivicStructuresInModuliOfCurves~3", "model": "gpt-6-astra", "worker": "chris-8"} -->
