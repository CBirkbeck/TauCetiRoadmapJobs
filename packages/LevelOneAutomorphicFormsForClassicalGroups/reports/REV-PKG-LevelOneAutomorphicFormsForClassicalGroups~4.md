<!-- from CBirkbeck, https://github.com/TauCetiProject/TauCetiRoadmapJobs/pull/13155#issuecomment-6785245749 -->
Review (codex) of baff1c5

Verdict: needs_changes

1. **F01** (P1) The genus-two example omits simple rank-five parameters

   **Location:** `packages/LevelOneAutomorphicFormsForClassicalGroups/README.md:1499–1501`: “the regular holomorphic parameters are” the two displayed decomposable families.

   **Claim:** These families exhaust the regular scalar holomorphic parameters of Sp₄ for every k ≥ 3.

   **Witness:** At k = 20, dim S₂₀(Sp₄(ℤ)) = 3, but the displayed families contribute 2 + 0. See open #1714, `TauCetiRoadmap/SiegelModularForms/README.md:1751` and `:2820`, and this package's §§3.2, 3.5.

   The convention at README:138–139 explicitly makes Δ_{w,v} a PGL₄ class, so this is not alternate notation for the missing rank-five constituent. The cusp ideal in the polynomial ring with generators of weights 4, 6, 10, 12 has three weight-20 monomials: χ₁₀², ψ₄ψ₆χ₁₀, ψ₄²χ₁₂. Saito–Kurokawa contributes dim S₃₈(SL₂(ℤ)) = dim M₂₆(SL₂(ℤ)) = 2: the latter basis has monomials E₄²E₆³ and E₄⁵E₆. For the proposed rank-four-plus-trivial family, its rank-four constituent has positive weights 19 and 18. Section 3.5 gives χ(s) = −1 because exactly one odd position occurs. Section 3.2 gives ε(s) = +1 because both constituents are orthogonal. Consequently this family contributes zero, not the missing form. The omitted possibility is a simple orthogonal cuspidal rank-five constituent with weights 19, 18, 0, −18, −19. Its global component group is trivial.

   **Exact repair:** Replace the purported exhaustive list by the three candidate shapes: the simple rank-five parameter π[1] with weights ±(k−1), ±(k−2), 0; Δ₂ₖ₋₃[2] ⊕ [1]; and the displayed rank-four-plus-trivial shape. Distinguish local packet membership from global occurrence. State that the second occurs for even k and the third fails the global character test. Alternatively, make the example explicitly only an illustration of the Saito–Kurokawa family, without an exhaustive claim. Cite the existing §§3.1–3.5 and the general enumeration of §7.2; do not introduce a dependency on the later SiegelModularForms roadmap. Add k = 20 as a negative-control Check: 3 = 1 simple + 2 Saito–Kurokawa, whereas the original list gives 2. This tests the repair on the refuting instance.

2. **F02** (P3) The strip-bound citation points to the predicate, not its automorphic instance

   **Location:** `packages/LevelOneAutomorphicFormsForClassicalGroups/README.md:250`, repeated at `:837` and `:1136`: “§AL.3.9.2: boundedness in vertical strips”.

   **Claim:** The cited target supplies the completed Rankin–Selberg strip bounds needed by §2.6.

   **Witness:** Open #924, `TauCetiRoadmap/AutomorphicLFunctionsAndLocalFactors/README.md:1864` defines boundedness and closure properties; `:1888` in AL.3.9.4 supplies the all-rank pair bounds, including the meromorphic case away from poles.

   **Exact repair:** Cite AL.3.9.4 for the actual Rankin–Selberg bounds in all three places. AL.3.9.2 can remain additionally as the definition of the predicate. Specify the bounds away from the finitely many polar points and passage to strip boundedness after subtracting principal parts. Test on π = π′ = 1: the completed zeta function has poles at 0 and 1, so it does not satisfy the entire boundedness predicate itself; AL.3.9.4 supplies the needed meromorphic bound, and removal of the principal parts fills the remaining compact neighborhoods. No new target or supplier gap is needed.

3. **F03** (P2) The general orbit-basis theorem is narrowed to finite groups

   **Location:** `packages/LevelOneAutomorphicFormsForClassicalGroups/README.md:2749`: “let a finite group H act on a finite set Ω”.

   **Claim:** Section 8.3 plans only the finite-group version of the exterior-invariant orbit basis.

   **Witness:** CT19a line 246, Fact 1.2, printed p. 6, allows an arbitrary group. For ℤ acting cyclically on three points, the invariant dimensions in degrees 0–4 are 1, 1, 1, 1, 0.

   **Exact repair:** Remove “finite” before “group H”; retain finiteness of Ω. Explain that H/H_S is finite, since it is the orbit of S in the finite set of g-subsets, and that the action factors through a finite permutation group. No averaging over H is required. Add the ℤ-action Check: in degree two, e₁∧e₂ + e₂∧e₃ + e₃∧e₁ is the orbit basis vector; in degree three, e₁∧e₂∧e₃ is fixed. Their dimensions are respectively 1 and 1, matching the finite image C₃. The existing S₃ controls still give dimensions 0 and 0. This is a generality defect under the required general-library contract, not a counterexample to the restricted theorem.

Three findings: one P1, one P2 and one P3. The five findings from round 3 are repaired. No package mathematical file was changed in this review.

## Verified sound

### Previous findings, checked individually

All references in this table are to `packages/LevelOneAutomorphicFormsForClassicalGroups`.

| Previous finding | Repaired passage | Status and recomputation |
| --- | --- | --- |
| F01, finite-place temperedness inferred from archimedean purity | README §1.1: “the Jacquet–Shalika bound” and “p^(−1/2) < |α| < p^(1/2)” | Repaired. For p = 2 the unitary complementary-series roots 2^(1/4), 2^(−1/4) are 1.189207115 and 0.840896415, with product 1; both lie strictly between 0.707106781 and 1.414213562, although neither has modulus 1. Purity in §1.5 is archimedean. |
| F02, missing regularity in the image of the highest-weight dictionary | README §1.9: “Prove that w(λ) is regular” and the regular-vector image conditions | Repaired. Sp₂ at weight vector (0,0,0) would require λ = −1; SO₅ with repeated positive half-weights would require (−1,0); SO₄ with repeated positive integral weights would require (0,1). These violate dominance. The permitted central double zero remains included. |
| F03, zero multiplicity admitted in a division | README §2.8: “an integer m ≥ 1”; §2.18 retains this domain | Repaired. The diagonal coefficient is A/m, with the off-diagonal epsilon correction divided by 2m². At m = 1 it is A; at m = 2 it is A/2. The junk value m = 0 is excluded. The repair does not claim the earlier review's unverified sign of J(I₂₃²) at a particular length. |
| F04, missing even-orthogonal multiplicity | README §3.16: “m_ψ = 2” and “2 · (1/2) = 1” | Repaired. For SO₈ and λ = (9,7,4,2), an outer pair has EP values 1,0, outer average 1/2, and multiplicity 2: contribution 1. The multiplicity is retained in §3.15 and in κ. For SO₃ the simple coefficient remains −1. |
| F05, factor two in the theta coefficient's Fourier index | Suggested.lean:108: “The Fourier coefficient at T/2, indexed here by its integral Gram matrix T” | Repaired. A rank-one vector with Gram entry 2 contributes exp(πi·2τ) = exp(2πiτ), hence q¹, not q². The real definition still selects tuples with Gram matrix T. |

The changed statements and their downstream uses were reread. Searches covered finite-place purity/temperedness, regularity and image claims, multiplicity denominators, m_ψ/outer averaging and theta indices throughout the package. No recurrence of those five defects was found. None of the new findings re-raises a finding marked not actionable.

### Coverage and principles

Read all 110 numbered targets and their Checks, all layer dependencies and every supplier contract. The eight layers each end in Examples and Dependencies. There are 110 Checks blocks; definitions retain their prose API and discriminating examples. The report records the seeded targets, headline tests, changed formulas and finding witnesses below; it does not substitute a claim of full recomputation for the large external tables.

The package has a mathematical scope distinct from its generic suppliers: level-one counting and positivity, torsion-class masses, low-weight classification and the Leech harmonic realization. It does not re-plan a roadmap already on main. Generic Arthur theory, theta correspondence, integral lattices, field spinor norms, explicit-formula analysis and interval arithmetic are imported by owner. The finite-dimensional inequalities and mass-recovery identities are mathematical targets; the actual search and enclosure algorithms are assigned to ComputationalNumberTheory. No “good primes” restriction was found: in particular the spinor theorem retains every prime, including 2. R03 is the remaining unnecessary restriction of a general theorem.

The organization is forced by the stated mathematical dependencies: the Weil ring feeds positivity and parameter characters; these feed mass recovery and classification; theta first occurrence and the classification feed low-weight dimensions and the harmonic realization. It is not a sequence of source chapter headings. No source passage was copied, no route-specific computational implementation was inserted, and no process dates, job identifiers or machine paths were found in the roadmap text. “Packet” in the mathematical Arthur-packet terminology is legitimate mathematics.

Main-branch shape comparisons included Completed/IntegralLattices, Rank24LatticeConstructions and CFSGBasicProperties. The readable board packages were also considered; the one inaccessible head is listed below rather than treated as nonexistent.

### Seeded source verification

All 15 seeded targets were checked in the supplied legal text cache. Page numbers below are printed page numbers, not PDF offsets. CT20 is the accepted HAL manuscript recorded in the manifest; its §§5.3–5.5 numbering is used consistently, rather than silently mixing it with the published numbering. No additional source was fetched or manifest entry rewritten.

| Target | Text opened and locator | Outcome, hypotheses and normalization |
| --- | --- | --- |
| 1.1 Level-one algebraic cuspidal spectrum | CT20 lines 185–207, §1.2, p. 5; lines 531–571, §2.1, pp. 12–13 | PGL_m over ℚ, m ≥ 1, unramified at every finite prime, half-integral weights with integral differences. No finite-place Ramanujan assertion remains. |
| 1.4 Dimension, determinant, gamma and epsilon | CT20 lines 572–596, §§2.1–2.2, pp. 13–14 | Γ_R, Γ_C, ε(I_w) = i^(w+1) for w ≥ 0 and det I_w = ε^(w+1) agree. I₀ = 1 ⊕ ε handles zero weight. |
| 1.5 Purity, symmetric weights and duality | CT20 lines 554–571, p. 13; lines 740–741, p. 18 | Bounded archimedean parameter and symmetric weights retained; local Satake bounds are separate. Duality preserves the archimedean class; it does not force global self-duality. |
| 2.5 Explicit-formula bilinear forms | CT20 lines 603–670, §2.3, pp. 14–16 | The pair uses π × π′∨, the diagonal pole term and the factor 1/2 are retained. Epsilon correction is restricted to self-dual pairs. |
| 2.6 Rankin–Selberg explicit formula | CT20 line 667, (2.3.5), p. 16; AnalyticNumberTheoryPartI §1.8 | Factor 2Aδ and the placement of the zero and prime terms agree. The missing precise supplier locator for strip bounds is R02. |
| 2.15 Multiplicity compression | CT20 lines 830–847, Corollary 2.9, p. 20 | The roadmap correctly keeps equivalence of negativity and the 1/m lift, rather than copying equality of normalized minima. See the numerical counterexample below and Source issues. |
| 3.1 Level-one Arthur parameters | CT20 lines 1610–1643, §5.1, pp. 39–40; Tai17 §4.1.2 | Distinct pairs (π_i,d_i), positive d_i, type and determinant constraints, and total standard dimension are present; the same π can occur at different lengths. |
| 3.2 Component group and epsilon | CT20 lines 1651–1673, (5.1.2)–(5.1.3), pp. 40–41 | Determinant-one sign tuples, central quotient when required, min(d_i,d_j), and same-type root number 1 agree. The latter has its declared supplier contract. |
| 3.8 Scalar packet membership | CT20 lines 1761–1863, §5.2.2, pp. 43–45 | Cases (I), (H1), (H2), the deleted weight in H2 and local existence conditions were compared in both directions. Matching infinitesimal character alone is not substituted for membership. |
| 3.11 Even generators in case (H) | CT20 lines 1864–1902, (5.2.4)–(5.2.7), pp. 45–46 | The exceptional factors δ and (−1)^(k′−1), and the distinguished-block branch, agree. The omitted weight changes the positional parity in H2. |
| 3.16 Triangular self-dual counts | CT20 lines 345–374, Key fact 2, pp. 8–9; Tai17 lines 2377–2414, pp. 307–308, and 2560–2598, pp. 311–312 | Induction is on dual standard dimension. The repaired coefficient includes m_ψ and uses the same outer-averaged EP convention. The genus-two example following this target is R01. |
| 4.6 Zassenhaus formula | CT20 lines 1205–1243, Theorem 3.5 and Corollary 3.6, pp. 29–30 | Characteristic different from 2, generalized −1-space and the complementary determinant term are retained; the general formula belongs to SymplecticReidemeisterTorsionModSquares §4.1. |
| 4.14 Twenty-seven known classes | CT20 lines 1343–1373, §3.3 and footnote 13, p. 33 | 27 classes, but 26 archimedean parameter blocks because two rank-two classes share one block. The roadmap corrects the weight-23/24 slip in the footnote. |
| 6.1 Siegel operator and standard L-function | CT20 lines 2048–2050, §5.3.1, footnote 17, p. 49; AutomorphicBundles §§11.9, 11.16 | The two added zeta factors have shifts ±(g−k). The cusp-kernel and boundary comparison use the named supplier, not this footnote as a source for all Siegel theory. |
| 8.3 Orbit basis of exterior invariants | CT19a lines 227–248, Fact 1.2, p. 6 | Orientability and signs agree; the unnecessary finite-group hypothesis is R03. The source includes the empty-subset convention. |

The other directly cited works are CL14, Tai17, Mil02 and BoechererNote; all are present in the manifest and available in the cache. KT87 is already explicitly uncertified. No unsettled “unverified” source locator was found that should generate another source request.

### Adversarial computations

These are computations of the stated formulas, not inferences from a successful `sorry` build. Rows inherited from round 3 are used only where that report gave values; changed passages and the seeded targets were checked again. Large classification tables are checked for the indicated invariants, not claimed to have been regenerated from external computation archives.

| Statement | Instances tried | Computed values on the two sides | Result / change |
| --- | --- | --- | --- |
| 1.1 and 1.5, finite roots versus purity | Unit determinant complementary series at p = 2 | Roots 1.189207115, 0.840896415; product 1; bounds 0.707106781 < each < 1.414213562; modulus-one predicate false | Repaired statement permits this local negative control. |
| 1.2–1.4, tensor and determinant conventions | I₁ ⊗ I₁; I₀ | I₂ ⊕ 1 ⊕ ε has dimension 2+1+1 = 4 = 2·2; determinants ε·ε = 1; I₀ dimension 2 and determinant ε | Correct. |
| 1.4, gamma and epsilon | s = 1; I₁₁, I₁₇ | Γ_R(1)Γ_R(2) = 1/π = Γ_C(1); ε(I₁₁) = i¹² = 1, ε(I₁₇) = i¹⁸ = −1 | Correct factors and sign. |
| 1.5, weights and duality | Δ₁₁ and Sym²Δ₁₁ | Weights ±11/2 sum to 0; symmetric square weights 11,0,−11; motivic weights 11 and 22 | Correct; no global self-duality inferred merely from weights. |
| 1.9, image iff regular | Sp₂, SO₅, SO₄ negative controls | Inverse candidate weights −1; (−1,0); (0,1), respectively, fail dominance; allowed SO₄ central double zero has λ = (0,0) | Repair excludes precisely the tested extra images. |
| 2.1–2.4, transform normalization | F(x) = max(0,1−|x|/4) | Integral and transform at zero both 4; transform at 1/2 equals 0 | Correct scale and Fourier sign. |
| 2.5, epsilon indicator | I₁₁ ⊗ I₁₅ = I₂₆ ⊕ I₄; I₁₇ | Pair epsilon i²⁷·i⁵ = i³² = 1 gives indicator 0; I₁₇ epsilon −1 gives indicator 1 | Correct two-valued correction. |
| 2.6, explicit-formula coefficients | Diagonal pair, and F = 0 | Diagonal pole side 2A; after division by 2, A. For F = 0, pole, zero, prime and archimedean terms all 0 | Correct factor 2; R02 fixes the analytic input citation. |
| 2.7–2.8, multiplicity inequality | m distinct classes, m = 1,2 | Averaged diagonal is mA/m² = A/m, hence A and A/2; correction denominator 2m² is 2 and 8 | Correct with m ≥ 1; m = 0 excluded. |
| 2.10–2.15, cone and compression | A = 1, common kernel entry 1, two repeated coordinates | Expanded matrix [[0,−1],[−1,0]], unit-cone minimum −1; compressed matrix [−1/2], minimum −1/2; lift t ↦ (t/2,t/2) gives −t²/2 on both sides | Negativity equivalent, normalized minima unequal; roadmap correct. |
| 2.16–2.18, two-variable exclusion | Matrix [[a,b],[b,c]], a = c = 1, b = −2 | Determinant −3; value at (1,1) is −2; at the axes it is 1 | The mixed term is essential; nonnegative coordinate search is not diagonal testing. |
| 2.19 and 2.21, vanishing scope | Known Δ₁₁; rank-four repeated weight test | Δ₁₁ has weights ±5.5 and motivic weight 11, outside weight < 11; I₁₁ ⊕ I₁₁ has weights 5.5,5.5,−5.5,−5.5 and rank 4 | The known rank-two form does not refute either exclusion. |
| 3.1, repeated constituent at different lengths | Δ₁₇[2] ⊕ Δ₁₇[4] ⊕ [1] | Standard dimension 2·2 + 2·4 + 1 = 13 = 2·6+1; pairs are distinct, while only one underlying cuspidal class is chosen | Correct counting convention. |
| 3.2–3.3, component and character test | Three odd blocks; Sp₄ Saito–Kurokawa | Determinant-one sign tuples number 4 = 2^(3−1); SK at k = 10 has χ = −1 = ε, at k = 11 has χ = −1 ≠ +1 = ε | Both directions of the global test distinguished. |
| 3.4, lowest-weight existence | (g,k) = (1,0), (2,(1,1)), (3,(1,0,0)) | Bounds are 0 ≥ 0, 1 ≥ 0, and 0 ≥ 1/2, respectively: true,true,false | Dominance is not substituted for unitarity. |
| 3.8, scalar cases | g = k = 12; local g = 2, k = 1 | At 12 the case-I odd block has length 1 and H1 length 2(g−k)+1 = 1; at (2,1), I fails k>g, H1 requires length 3, H2 length 5 | Small singular character data alone do not imply membership. |
| 3.11, H2 positional parity | g = 16, k = 13, Δ₁₇[8] | Deleted weight 4; 12,…,1 minus 4 has length 11; even-block sign (−1)^(2·8/4) = +1 | Correct omission and exponent. |
| 3.15–3.16, outer average | SO₈, λ = (9,7,4,2); SO₃ | SO₈: 2·(1+0)/2 = 1; omitting m_ψ gives 1/2. SO₃: κ = −1, R = δ_(k,0) | Repair verified. |
| Layer 3 Examples | Sp₄ scalar k = 20 | Cusp dimension 3; listed contributions 2 + 0 = 2; with simple rank-five contribution, 1+2+0 = 3 | R01. |
| 4.6, Zassenhaus square class | Rational 90-degree rotation A = [[0,−1],[1,0]] | det((1+A)/2) = 1/2; characteristic Q = X²+1 gives Q(−1) = 2; quotient (1/2)/2 = 1/4 is a square | Correct square class, no equality of chosen representatives asserted. |
| 4.7 and Lean regular-form definition | n = 0; q = x²; q = 2x² | Polar determinants 1,2,4; regular predicates true,true,false | Odd half-discriminant is essential, including at 2. |
| 4.7 spinor headline | Identity in ranks 0 and 1; nonmonic Q = 2 | Q = 1 gives |Q(±1)| = 1 = 1²; local characteristic-polynomial leading coefficient is 1, so Q = 2 fails the local premise | No vacuity through an arbitrary Q. |
| specialOrthogonalPoints definition | Identity; reflection on q = x²; zero coefficient ring | Identity preserves q and has det 1; reflection preserves q but det −1 over ℚ; over the zero ring 0 = 1 and the unique matrix satisfies the predicate | Definition is intentionally general; the headline only uses ℤ_p. |
| 4.10–4.13, smallest mass recovery | SO₃ test matrix | Determinant 288; masses (−1/12,1/4,1/3,0,0); matrix product (1/2,−1/2,−1/2,−1/2,−1/2) | Signed EP masses, not positive lattice masses. |
| 4.14, known classes | Rank-by-rank list | 11 + 13 + 3 = 27 classes; merging the double rank-two infinity type gives 26 blocks; dim S₂₄(SL₂(ℤ)) = 2, dim S₂₃ = 0 | Corrected source bookkeeping retained. |
| 4.16–4.18, size checks | Sp₂ through Sp₁₆ index sets | 3,12,32,92,219,530,1158,2521 | Agrees with recorded mathematical index sets; not a regeneration of all mass matrices. |
| 5.3, low-weight known forms | Δ₁₁; Sym²Δ₁₁ | Standard dimensions 2 and 3; motivic weights 11 and 22 | These occur within, rather than contradict, the advertised low-weight classification. |
| 5.5–5.7, top-simple weight 23 | Displayed exceptional parameter and block count | Exceptional rank 14; 181 + 1 = 182 possible infinity types, at most 183 classes owing to the one double block | Correct distinction of types and classes. |
| 5.8–5.10, conditional and weight-24 scopes | GRH candidate; known regular self-dual list | Conditional surviving rank 16; regular known total 27; neither computation turns an upper bound into existence | GRH and regular/self-dual hypotheses retained. |
| 6.1, two zeta factors | g = k; g = 1, k = 4 | Shifts are 0,0 in the first case (ζ(s)²); −3,+3 in the second | Both factors retained, including coincident factors. |
| 6.4–6.8, genus zero and neighbor balance | θ₀ of two lattice classes; Leech/Niemeier neighbor pair | θ₀([L]−[L′]) = 1−1 = 0; 12870·405 = 18225·286 = 5212350 | Correct mass weighting and first-occurrence boundary. |
| 6.9–6.10, actual genus in Rallis relation | E₈, n = 8, g₀ = 0, g = 8 | Added block length 2g+1−n = 9; total 8+9 = 17 = 2g+1. Using g₀ would give −7 | Roadmap uses actual g; source slip not copied. |
| 7.8–7.10, low-weight endpoints | Listed nonscalar/scalar tables and four k = 13 forms | 29 nonscalar rows and 32 scalar rows; genera 8,12,16,24 give standard dimensions 17,25,33,49 | Row counts and parameter dimensions agree. |
| 8.1–8.2, Eichler/stable low weights | Rank 8 and 16 class spaces | Class dimensions 1 and 2; stable scalar spaces at (k,g) = (4,8),(8,16) have dimensions 1 and 2 | Correct theta endpoint dimensions. |
| 8.3, orbit basis | S₃, C₃ and ℤ acting through C₃ on three points; g = 0,…,4 | S₃ dimensions (1,1,0,0,0); C₃ and ℤ dimensions (1,1,1,1,0), obtained by averaging exterior traces of the finite image | R03; g = 0 and g > |Ω| also checked. |
| 8.4–8.5, invariant degrees | Rootless rank 24, g = 0,1,8,24,25 | Coefficients of t²⁴+t¹⁶+t¹²+t⁸+1 give 1,0,1,1,0, respectively | Matches Lean's if-then-else exactly. |
| Root-spanned vanishing headline | A₁; zero rational space; g > 0 | Root reflection sends a value a to −a, so invariance gives 2a = 0 and a = 0 over ℚ; positive-degree alternating forms on 0 also vanish | No positivity or unimodularity hypothesis is secretly needed. |
| thetaCoefficient real definition | Gram T = [2]; nonsymmetric T; ω = 0 | First case is Fourier index [1]; a nonsymmetric T has no Gram tuples and sum 0; zero ω gives coefficient 0 for every T | Correct target index and honest nonzero-ω premise. |
| 8.6, harmonic coefficient/nonvanishing headline | g = 8,12,16,24 | Absolute coefficients 4157776806543360000; 49893321678520320000; 41577768065433600000; 8315553613086720000, each nonzero | Exact normalized values require the extra Mathieu data; invariant-line nonvanishing is statable and stated. |
| 8.7, Böcherer criterion | Five products in companion note | Each sum of zero/pole orders is 0; the residual leading constants are nonzero | Finite nonzero value, not a numerical substitution at a pole. |
| 8.10–8.14, stable endpoints | k = 0; rank 8 at g = 8; rank 16 at g = 16 | Rank-zero class space and constants have dimension 1; the other dimensions are 1 and 2; theta and Φ preserve these dimensions in the stated stable ranges | Boundary k = 0 is separated; no division by a nonexistent block length. |

### Lean acceptance test and padding

Ran `lake env lean` on the unchanged package file from the pinned content checkout. It succeeded; the only warnings were the four expected `sorry` warnings at lines 80, 124, 137 and 149. No Tau Ceti object needed building. No bare build, update or cache command was used.

Elaborated a scratch copy with `#check @name` for all eight declarations: four real definitions and four headline theorems. Compared each elaborated signature with the README and the worker's signature extraction. No binder was lost. In particular positivity/evenness/unimodularity/rank/rootlessness remain explicit in both rootless theorems; the root-spanned theorem has its actual spanning hypothesis and g > 0; the spinor theorem explicitly carries regularity and its all-prime local realizability premise. The definitions themselves do not silently acquire positivity or nondegeneracy hypotheses.

A scratch copy tried `simp`, `rfl` and `infer_instance`, with each tactic required to close the goal, separately on every admitted theorem. All four resisted every probe. Candidate one-lemma matches were also compared at the pin: generic finrank identities, spinGroup membership, bilinear invariant forms, modular-form nonvanishing and AddCircle Fourier coefficients do not prove any of these statements. No boundary-case theorem, API restatement, admitted example or mirrored Check is present in Suggested.lean.

| Headline family in README | Acceptance-test disposition |
| --- | --- |
| Spinor characteristic-polynomial obstruction, §4.7 | `spinor_charpoly_obstruction`, line 80, stated on integer matrices and genuine p-adic points. |
| Leech invariant alternating forms, §8.5 | `finrank_invariantAlternatingForms_of_rootless`, line 124. |
| Root-spanned lattice vanishing, §8.5 | `invariantAlternatingForms_eq_bot_of_roots_span`, line 137. |
| Harmonic Leech theta nonvanishing, §8.6 | `exists_thetaCoefficient_ne_zero_of_rootless`, line 149, on the actual Fourier-coefficient sum. |
| Miller/repeated-weight vanishing, Stark–Odlyzko and cuspidal classifications | Named in the module docstring: missing adelic GL_m cuspidal representations and their pair L-functions. |
| Exact masses and trace-formula recovery | Named in the docstring: missing elliptic Arthur trace formula and orbital-integral carriers. |
| Genus ≤ 8 dimensions, 29/32 low-weight rows, four weight-13 forms | Named in the docstring: missing genus ≥ 2 Siegel modular/cusp forms. |
| Eichler basis, harmonic realization, alternating theta isomorphism, stable dimensions/operator/isomorphism | Named in the docstring: missing Siegel forms, Siegel operator and genus-g theta map. |
| Exact normalized ±n_g e_g coefficients | Named in the docstring: missing Conway coordinates, Mathieu normalization and Q_g sublattices. The weaker but genuine nonvanishing endpoint is independently stated above. |

The eight own backticked identifiers resolve to these four theorems and four definitions. The header uses the module-system `public import Mathlib` once and the five individual TauCeti lattice modules it uses. There is no root TauCeti import, other-roadmap import, `set_option`, `lemma`, sorry-defined data, empty Prop stand-in, or arbitrary-function replacement for a missing automorphic carrier.

### Pinned declarations and duplication by object

The following files were opened at the pins, not at a newer library head. Paths in this table are library-repository relative. These declarations provide the stated objects, not the new classification or nonvanishing theorems.

| Pinned file and line | What it supplies, and what was checked |
| --- | --- |
| `Mathlib/LinearAlgebra/QuadraticForm/Basic.lean:1154` | `Matrix.toQuadraticForm'`: the quadratic map x ↦ xᵀMx; it does not assert regularity. |
| `Mathlib/LinearAlgebra/Matrix/Charpoly/Basic.lean:140` | `Matrix.charpoly`, including the rank-zero polynomial 1. |
| `Mathlib/LinearAlgebra/Matrix/Rank.lean:134` | `Matrix.rank`, an existing native matrix-rank operation. |
| `Mathlib/LinearAlgebra/Alternating/Basic.lean:67` | `AlternatingMap`, genuine multilinearity and alternation. |
| `Mathlib/LinearAlgebra/Dimension/Finrank.lean:61` | `Module.finrank`; a total natural-valued operation, not by itself finite dimensionality. |
| `Mathlib/Algebra/BigOperators/Finprod.lean:102` | The finite-support product and additive `finsum` construction. The theta definition has a real sum body; finite support follows in the positive-definite applications. |
| `Mathlib/NumberTheory/Padics/PadicIntegers.lean:71` and `:145`; `Mathlib/NumberTheory/Padics/PadicNumbers.lean:545` | ℤ_p, its actual ring homomorphism into ℚ_p, and ℚ_p; the prime instance remains in scope. |
| `Mathlib/NumberTheory/ModularForms/LevelOne/DimensionFormula.lean:65` and `:262` | Cusp-weight shift by 12 and the even-weight dimension formula. These supply elliptic dimension comparisons; they do not supply genus-two or higher forms. |
| `Mathlib/Analysis/InnerProductSpace/Rayleigh.lean:266` | The Rayleigh local-extremum/eigenvector result. It does not already state the roadmap's least-eigenvalue cone refinement. |
| `Mathlib/Analysis/SpecialFunctions/Gamma/Basic.lean:287`; `Mathlib/Analysis/Fourier/FourierTransform.lean:81`; `Mathlib/NumberTheory/LSeries/RiemannZeta.lean:121` | Complex gamma, Fourier integral and zeta. None is an automorphic pair L-function carrier. |
| `TauCeti/LinearAlgebra/IntegralLattice/Basic.lean:63` | The lattice bundles its rational bilinear form, full finitely generated lattice, symmetry and integrality. It does not bundle positivity or even unimodularity. |
| `TauCeti/LinearAlgebra/IntegralLattice/Even.lean:67`; `Unimodular.lean:61`; `Signature.lean:171` | The actual even, unimodular and positive-definite predicates. They are reused, not redefined. |
| `TauCeti/LinearAlgebra/IntegralLattice/Norm.lean:78` and `:221` | Norm and `vectorsOfNorm`; a root here has norm 2, not norm 1. |
| `TauCeti/LinearAlgebra/IntegralLattice/Isometry/Basic.lean:77` | Lattice isometries preserve the ambient form and lattice carrier. They are not arbitrary linear maps. |
| `TauCeti/LinearAlgebra/CliffordAlgebra/Spin/SpinorNorm/Basic.lean:98` | `CliffordAlgebra.orthogonalSpinorNorm` on its field/nondegeneracy hypotheses, not integral unit-valuedness at 2. |
| `TauCeti/Algebra/AlgebraicGroup/Symplectic/Basic.lean:120` and `:213`; `Smooth.lean:93` | Symplectic group scheme, points comparison and smoothness; these are imported. |
| `TauCeti/InformationTheory/Coding/Binary/Golay/Basic.lean:66`, `:136`, `:563`, `:606`, `:662` | Actual Golay code, dimension 12, Type II, enumerator and minimum weight 8. The enumerator coefficients sum to 1+759+2576+759+1 = 4096 = 2¹². |
| `TauCeti/LinearAlgebra/IntegralLattice/ConstructionA/Golay/Basic.lean:33` | Construction-A Golay lattice; it is not silently equated with the rootless Leech lattice. |

Searched by objects as well as names across the pinned libraries, main roadmaps, board packages and indexed open heads, using the roadmap search tools. The near-match report has no same-name hit; its generic matrix blocks, scalar finrank facts and rank-one modular-form lemmas are not duplicates of the four headlines. The `thetaCoefficient` in MetaplecticAutomorphicForms §8.16 concerns Jacobi-coordinate reindexing, with a different namespace and construction; it is not this lattice Gram sum. No duplicate fully qualified declaration was found.

### Supplier and overlap audit

The cross-roadmap resolver was rerun against main d5ac3ce and the 439 indexed open heads. It reported no unresolved cross-roadmap citation or own Lean name. Its external-library check was unavailable on the resolver host; the local pinned-file checks above supply that part of the audit. Resolution alone would not detect R02: its cited section exists but supplies the predicate rather than the claimed automorphic theorem.

The following current suppliers were read. Locations refer to `TauCetiRoadmap/<name>/README.md`, except where the completed/nested path is specified. Section ranges denote the sections actually named in the package, not a dependency on every intervening target.

| Supplier/head | Resolved contracts and representative current file lines |
| --- | --- |
| AutomorphicFormsOnReductiveGroups, #1037 | §§2.2, 2.4–2.5, 3.2, 3.4–3.5, 4.2, 5.1, 5.5, 6.7–6.8, 7.2, 7.2a, 7.4–7.5; §2.5 at 446, §6.8 at 1104, §7.2a at 1174. |
| AutomorphicLFunctionsAndLocalFactors, #924 | AL.1.4, AL.3.2.3 at 1531, AL.3.3.8 at 1620, AL.3.6 at 1741, AL.3.7 at 1782; AL.3.9.2 at 1862 and AL.3.9.4 at 1882, with R02. |
| AnalyticNumberTheoryPartI, main | §1.3 at 983 and §1.8 at 1106: normalization and general explicit formula, retaining its meromorphic-strip hypotheses. |
| SmallRamificationAndAbelianVarietyBaseCases, #970 | §§1.5–1.7 at 443, 474, 518: kernel, scaled test function and strip positivity. |
| AutomorphicSpectralTheory, #925 | §§4.4–4.5 at 2307/2328, §4.10 at 2385, §6.9 at 3020, §6.17 at 3159, §§6.19–6.20 at 3196/3218. |
| ModularityAndLanglandsExtensions, #1180 | §§3.4, 3.8, 3.15, 3.17, 3.20–3.22 at 1762, 1850, 2015, 2047, 2112, 2139, 2161; standing premises retained. |
| AutomorphicBundles, #1069 | §§11.1–11.2, 11.9, 11.16, 12.10–12.11, 12.13, 12.15; §11.9 at 4056, §12.15 at 5074. |
| MetaplecticAutomorphicForms, #1063 | §§0.15, 2.4c, 3.1, 3.4–3.5, 3.7, 3.10, 3.21, 5.1, 5.6, 6.14; §3.21 at 896 and §6.14 at 1722. |
| SymplecticReidemeisterTorsionModSquares, #1645 | §4.1 at 751, the general Zassenhaus formula over fields of characteristic different from 2. |
| GeometryOfNumbersAndQuadraticArithmetic, #851 | §2.4 at 579; its odd-prime integral spinor statement does not settle the declared dyadic gap. |
| OrthogonalTamagawaAndLatticeMass, #1222 | §§3.1, 4.1–4.2 at 457, 508, 534; lattice classes, uniqueness and ordinary masses. These differ from this roadmap's signed torsion EP masses. |
| ComputationalNumberTheory, #1408 | §§4.1–4.7, 4.17, 4.17a, 4.18, 4.26, 4.29–4.34 and 5.1; §4.17 at 2151, §4.26 at 2506, §4.34 at 2627. |
| Main lattice/coding/finite-group owners | Completed/IntegralLattices Layer 1, active IntegralLattices §4G, Rank24LatticeConstructions Layer 6, ThetaSeries Layers 5/8, AlgebraicCodingTheory Layer 5, SporadicOrders Layer 1, CFSGBasicProperties P2-L. The active and completed IntegralLattices files are distinct; searching only the completed one would falsely report §4G missing. |
| Main group and modular owners | OrthogonalSpinGroups Layer 1; RepresentationTheory/LieHighestWeight Layer 6; RepresentationTheory/ClassicalGroups Layers 3–5; ReductiveGroups Layer 9; ModularForms' level-one dimension and ring material. These own the general objects used here. |

The supplied overlap computation has no conflicting head, dropped cited id, unmapped deletion or revision-only cited id. Inspected the five closest open scopes: #1714 SiegelModularForms, #1222 OrthogonalTamagawaAndLatticeMass, #1756 AutomorphicLFunctionsAndLocalFactorsPartII, #1180 ModularityAndLanglandsExtensions and #925 AutomorphicSpectralTheory. SiegelModularForms explicitly consumes this roadmap's §§6.1, 6.4, 6.7 and 7.9; it is not used here as a supplier. Its independent genus-two dimension is evidence for R01. The other scopes leave the level-one classification and Leech endpoints here and own the generic structures imported above. No second owner or mutual handoff was identified.

The board index was read before searching. AnalyticNumberTheory at board #123/head 310e834 is a navigation index, assigning explicit formulas to Part I rather than claiming a second owner. LogicAndDefinabilityInNumberTheory at #164/head 8d875d1 owns logical/definable and integration interfaces, not these automorphic constructions. The LawrenceVenkateshMethod head was inaccessible, as recorded below.

The requested dependency command completed successfully. Its output was:

```text
depcheck: 236 roadmaps, 2150 edges, 0 problem(s)
```

There was no UPWARD, CYCLE or moved line. Reading the individual Needs lines found no later-roadmap supplier or forbidden supplier. The genus-two repair should preserve that direction.

### Declared gaps

All eight slugs occur both in the plan's gaps and under the appropriate README supplier. Each names a supplier and a precise missing extension; none has supplier `none`. They are contracts, not findings merely because the extension is not implemented. The related carrier/criterion/comparison clauses specify the same object and its usable interface rather than unrelated projects.

| Gap | Minimality and hypotheses checked |
| --- | --- |
| sp2g-lowest-weight-modules | General dominant k, exact EHW inequality, infinitesimal character and discrete-series comparison; not supplied by the already existing regular-range discussion alone. |
| siegel-adelic-lift | Square-integrable vector-valued genus-g Siegel forms, actual lowest-weight module, Hecke compatibility and cuspidality; the supplied GL₂ lift is insufficient. |
| gross-volume-rationality | Finite-order semisimple centralizer, specified infinite/finite measures and non-positive critical integers; not a restatement of an unspecified Haar-volume finiteness claim. |
| same-type-pair-root-number | Unitary self-dual cuspidal pair of the same type, global epsilon at 1/2 equal to 1; not inferred from generic existence of pair epsilon factors. |
| boecherer-theta-image | Exact n, g, ν, k relation and finite nonzero germ of the specified quotient; not a theorem obtained by substituting into factors with poles. |
| integral-spinor-norm-units | p = 2 and regular forms, including odd unit half-discriminant; the odd-prime supplier and field spinor norm do not already provide it. |
| split-orthogonal-regular-form | Integral B/D group-scheme comparison compatible with ℤ₂ points; complex group descriptions and the existing symplectic model are insufficient. |
| conway-group-average-charpoly | Actual O(Leech) rational representation and its average polynomial; Conway-group existence/order alone does not imply these invariant degrees. |

## Not verifiable

- KT87 remains the already settled uncertified source, cited at pp. 466–511. Its paywalled determinantal formulas were not read, and no new request or renamed manifest entry was made.
- The board head of LawrenceVenkateshMethod (#345, 9ee7ac3) returned HTTP 404 for its indexed README. Ownership against that particular head could not be checked. This is not evidence that the roadmap exists nowhere.
- The large mass-recovery matrices and finite exclusion/enclosure archives referenced by CT20 were not independently regenerated. The review checked the theorem statements, displayed small instances, dimensions, signs, counting invariants and declared computational supplier contracts. It does not certify unseen external computation output.

## Source issues

- **Error** in CT20 at Corollary 2.9 and its preceding embedding, printed p. 20: the source says negative minima on the two Euclidean unit cones agree; it should be equivalence of negativity, with the 1/m lift preserving the quadratic value; affects a stated result.
- **Misprint** in CT20 at §3.3, footnote 13, printed p. 33: the source says the set has 26 classes and the elliptic weight is 23; it should be 27 classes, 26 archimedean blocks, and elliptic weight 24; affects nothing.
- **Misprint** in CT20 at §3.3, printed p. 33: the source says the symplectic rank-seven polynomial index set has 1157 elements; it should be 1158, including the omitted equivalence class; affects nothing.
- **Misprint** in CT20 at §5.3.2, displayed Rallis relation, printed p. 50: the source says the added standard block uses first-occurrence genus g₀ for every theta lift; it should be the actual genus g of that lift; affects a stated result.
- **Error** in Tai17 at §4.1.2, simple-parameter contribution, printed p. 311: the source says the contribution is the packet EP sum without its global multiplicity; it should be m_ψ times that sum with the same outer-averaged convention; affects a stated result.
- **Misprint** in CT20 at Remark 5.3, printed p. 45: the source says k is at least two while its argument excludes two; it should be k at least three in case H2; affects nothing.

<!-- tauceti-roadmap-review {"agent": "codex", "head": "baff1c5d3e6649ff0d018bf7f265b3406a3fe748", "job": "REV-PKG-LevelOneAutomorphicFormsForClassicalGroups~4", "model": "gpt-6-astra", "worker": "chris-33"} -->
