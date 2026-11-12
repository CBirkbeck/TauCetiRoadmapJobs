<!-- from CBirkbeck, https://github.com/TauCetiProject/TauCetiRoadmapJobs/pull/13155#issuecomment-6786890570 -->
Review (codex) of a5d055a

Verdict: needs_changes

1. **F01** (P1) The difference-of-gamma-derivatives API loses the minus sign

   **Location:** `packages/LevelOneAutomorphicFormsForClassicalGroups/README.md:764`: “`J_F(1 − e)` is the integral of the difference of the two logarithmic derivatives”.

   **Claim:** Integrating the displayed difference gives `J_F(1 − e)`.

   **Witness:** CT20 line 649, equation (2.3.4), printed p. 15, and README:758 require the opposite sign. For the compactly supported polynomial test below, the displayed integral is negative but the defined J is positive.

   Here is a directly reproducible computation. Take the admissible even C² function `F(x) = (1 − x²)³` on `|x| ≤ 1`, zero outside. Set `s = 1/2 + 2πit` and let `D` be the integral of `(Γ_ℝ′/Γ_ℝ(s) − Γ_ℝ′/Γ_ℝ(s + 1)) F̂(t)`. The digamma integral and Fourier inversion give

       D = −∫₀¹ (1 − x²)³ / (2 cosh(x/2)) dx,
       J_F(1 − e) = −D = ∫₀¹ (1 − x²)³ / (2 cosh(x/2)) dx.

   The integrand is positive on `(0,1)`, so this is an exact sign contradiction; numerical quadrature gives `D ≈ −0.2254836448` and `J_F(1 − e) ≈ +0.2254836448`. The numerical approximation is not needed for the contradiction.

   **Exact repair:** Write the full identity with the leading minus, evaluation at `1/2 + 2πit`, and weight `F̂(t)`, or remove this redundant API clause. Add the compactly supported test above as a signed Check. With the corrected minus, both sides are `+∫₀¹ (1 − x²)³/(2 cosh(x/2)) dx`. Keep the correct definition and tensor-product identities unchanged.

2. **F02** (P2) The type criterion unnecessarily excludes the nonregular cases it later uses

   **Location:** `packages/LevelOneAutomorphicFormsForClassicalGroups/README.md:621`, and :633: “a regular self-dual `π`” and “Regularity is needed”. Consumer: :2077–2079, §5.7.

   **Claim:** The type/parity criterion is planned only for regular representations, although §5.7 invokes it for representations with repeated top weight and a simple odd summand.

   **Witness:** CT20 lines 597–602, §2.2, printed p. 14, requires only self-duality and one simple weight. The nonregular test `I₁ + 2I₂₃` has simple weights `±1/2`, repeated weights `±23/2`, rank 6 and determinant 1.

   This is a generality/input defect, not a claim that a global representation with this test parameter exists. A nondegenerate symmetric invariant pairing cannot restrict to the lone symplectic irreducible `I₁`; it cannot pair that irreducible with the inequivalent `I₂₃` summands either. Consequently any self-dual global class with these local data must be symplectic. The source's criterion applies and the roadmap's §1.8 does not. The same issue occurs in the actual rank-16 candidate of §5.8, with its simple `I₁` and repeated `I₂₃`. The generic type dichotomy in ModularityAndLanglandsExtensions §3.4 does not supply this missing level-one parity statement by itself.

   **Exact repair:** State §1.8 for every self-dual `π ∈ Π_alg` having at least one weight of multiplicity one: symplectic iff `w(π)` is odd, orthogonal iff it is even. Retain regularity as a sufficient special case. Replace the regularity Check by the nonregular simple-weight control above, and distinguish it from parameters all of whose weights have multiplicity greater than one. Cite CT20 §2.2, lines 597–602. The strengthened statement supplies precisely the implication used at §5.7: the simple odd summand forces symplectic type. No new supplier or change to the pair-root-number contract is needed.

3. **F03** (P3) The denominator Check reverses the order of vanishing

   **Location:** `packages/LevelOneAutomorphicFormsForClassicalGroups/README.md:2444`: “its zeros at `ζ(−2), ζ(−4), …` raise the order of `R`.”

   **Claim:** Zeros of `ω_g` in the denominator increase the order of vanishing of the quotient.

   **Witness:** BoechererNote lines 79–82 and 114–119, pp. 2–3: for `(g,n,ν) = (16,24,1)`, `ω₁₆(12 + 2s)` has order 4 and its reciprocal has order −4. README §8.7 correctly uses −4.

   **Exact repair:** Say that these zeros **lower the order of vanishing of R by their multiplicity**, and give the genus-16 value. The five factors then have orders `(0, −4, −4, −1, 9)`, whose sum is 0 as §8.7 requires; replacing −4 by +4 would give 8. At genus 24 the corresponding reciprocal order is −12 and the total is again 0, whereas the reversed sign gives 24. Keep §8.7's correct table.

4. **F04** (P3) An unstatable headline is missing from the module docstring

   **Location:** `packages/LevelOneAutomorphicFormsForClassicalGroups/README.md:10`: “the triangular relation between Euler–Poincaré characteristics and self-dual cuspidal counts”; `Suggested.lean:30`–:47, the list of headlines not statable at the pins.

   **Claim:** The module docstring accounts for the headline results that cannot yet be stated. It names the mass results, classifications and Siegel/theta endpoints, but does not name the triangular relation of §3.16.

   **Witness:** README §3.16 states `EP(G; λ) = κ(G, λ) N⊥(w(λ)) + R(G, λ)`. None of the eight Lean declarations or four “Not statable” bullets names this result. Its automorphic spectrum, Arthur-parameter and spectral Euler–Poincaré carriers are absent at the pins.

   **Exact repair:** Add §3.16 and the triangular Euler–Poincaré/counting relation to the docstring's not-statable list, with those missing carriers. Do not insert a theorem on free scalar variables as a substitute. Recheck the headline inventory below: this adds the one missing explicit disposition and requires no new Lean declaration.

Four findings: one P1, one P2 and two P3; two blocking. The three findings of round 4 are repaired. The package inputs were not edited. Lean elaboration and the dependency check pass; those checks do not detect R01 or R02.

## Verified sound

### Earlier findings, checked before the new pass

All locations in this table are in `packages/LevelOneAutomorphicFormsForClassicalGroups/README.md`. The previous repair report marked all three findings applied; none was marked not actionable.

| Round-4 finding | Repaired passage | Status and independent verification |
| --- | --- | --- |
| F01, incomplete genus-two parameter list | Layer 3 Examples: “So packet membership leaves three shapes”; §7.2: “`1 + 2 + 0 = 3`” | **Repaired.** At weight 20, Igusa's ring has five monomials, the elliptic image has dimension 2, so the cusp dimension is 3. Saito–Kurokawa contributes `dim S₃₈ = 2`; the rank-four-plus-trivial family has character −1 versus epsilon +1 and contributes 0; the simple rank-five family supplies 1. |
| F02, strip-bound citation pointed only to a predicate | §2.6: “bounded outside fixed discs around its poles”; contract and Needs cite `AL.3.9.4` | **Repaired.** At `π = π′ = 1`, completed zeta has residues −1 at 0 and +1 at 1. Subtracting those principal parts gives `Λ₁(s) + 1/s − 1/(s−1)`, which is holomorphic there. The current supplier provides the all-rank bound away from poles. |
| F03, orbit-basis theorem restricted to finite groups | §8.3: “let a group `H`, not necessarily finite” | **Repaired.** The orbit `H/H_S` is finite because Ω is finite. For ℤ acting through a three-cycle the exterior-invariant dimensions in degrees 0–4 are `(1,1,1,1,0)`; for S₃ they are `(1,1,0,0,0)`. No average over the infinite group is used. |

Read every changed passage and downstream use, including the new weight-11 Check. At weight 11, the SK character is −1 and its epsilon is +1; the rank-four shape also fails; Igusa's ring gives `dim S₁₁(Γ₂) = 0`, hence the simple count is 0. At weight 10, the dimension is 1 and the SK contribution is 1. Searches for exhaustive genus-two lists, the AL.3.9.2/AL.3.9.4 distinction, and finite-group restrictions found no recurrence of these three defects. R02 is the separate occurrence of unnecessary narrowing in the type criterion.

### Coverage, principles and shape

Read the four package inputs, all 110 numbered targets and their APIs and Checks, all eight layer dependency sections, every Needs line, the supplier contracts, the board index and overlap report. The target counts by layer are `9, 21, 16, 18, 10, 12, 10, 14`. All eight layers have Examples and Dependencies; all 110 numbered targets have Checks blocks. Definitions have their prose APIs and at least three Checks. R01–R03 identify the specific mathematical defects found in this pass rather than treating a passing build as evidence of truth.

The package does not re-plan a main-branch roadmap. Its ownership is level-one counting and explicit packet characters, archimedean positivity, torsion masses, low-weight classification, and Leech harmonic realization. Generic automorphic, Arthur, theta, lattice and spinor-norm infrastructure is imported. The dependency sequence is mathematical: Weil parameters feed positivity and characters; characters and trace identities feed masses and classification; the classification and theta theory feed dimensions and realizations. No layer is named for a source chapter, and the stated dependencies force the main order. Describing the Chenevier–Taïbi theory is not a claim to copy their chapter order.

The roadmap retains every prime, including 2, in the spinor obstruction. It assigns executable searches and rational enclosure procedures to ComputationalNumberTheory; its own finite-dimensional inequalities and exact mass identities are mathematics. No copied source passage, process instruction, machine path, pull-request number, executable algorithm, sorry'd data, `set_option`, or forbidden supplier was found in the roadmap inputs. Mathematical Arthur “packets” are standard vocabulary. Main-branch shape comparisons were Completed/IntegralLattices, Rank24LatticeConstructions and CFSGBasicProperties.

### Seeded source verification

Every one of the 15 seeded targets was checked against the cached legal text. Numbers below refer to printed pages, and source-line references refer to the supplied line-numbered extractions. CT20's accepted-manuscript numbering is used consistently with its manifest version note. No new source was fetched, and no manifest entry was changed. All eight works in References are recorded. KT87's settled uncertified status is the only source-access exception.

| Target | Source locator opened | Result |
| --- | --- | --- |
| 1.4 Dimension, determinant, gamma and epsilon | CT20 lines 572–596, §§2.1–2.2, pp. 13–14 | Dimension 2, determinant `e^(w+1)`, epsilon `i^(w+1)`, and `I₀ = 1 + e` agree, including w = 0. |
| 1.5 Purity, symmetric weights and duality | CT20 lines 554–571, §2.1, p. 13, and lines 740–741, p. 18 | Unitary archimedean parameter and symmetric weights retained. Archimedean self-duality does not assert global self-duality or finite-place Ramanujan. |
| 1.6 Symmetric weight vectors and regularity | CT20 lines 185–207, §1.2, p. 5; lines 584–596, §2.2, p. 14 | Integral differences, symmetry, permitted central double zero and determinant-one condition agree. |
| 2.3 Archimedean functional | CT20 lines 647–658, equation (2.3.4), pp. 15–16 | Definition has the correct minus; the API loses it: R01. |
| 2.12 Two-coordinate criterion | CT20 lines 800–805, Example 2.7, p. 19 | Nonnegative cone and cross-term condition retained; positive diagonal entries alone are insufficient. |
| 2.14 Forced-self-duality monotonicity | CT20 lines 848–851, Remark 2.10, p. 20 | Increasing forced-self-duality flags decreases the form on nonnegative vectors; no signed-vector assertion is made. |
| 2.20 Elliptic dimensions from the bound | CT20 §1.4, lines 455–467, p. 11; §2.4.5, lines 938–963, p. 23 | Conditional exclusion argument and existing normalized-eigenform dictionary support equality. The classical dimension formula is imported at the pin; this does not claim an unconditional new dimension proof. |
| 3.3 Multiplicity test | CT20 lines 1651–1694, equations (5.1.2)–(5.1.4), pp. 40–41 | Component quotient, equality of characters, and global multiplicity retained. |
| 3.8 Scalar packet membership | CT20 lines 1761–1863, §5.2.2, pp. 43–45 | Cases I, H1 and H2, scalar lowest-weight hypotheses and special block retained. Overlap at k = g is allowed. |
| 3.10 Compact remainder in H | CT20 lines 1847–1863, §5.2.2, p. 45 | Remainder has dimension `2k′`, determinant `e^k′`, and the deleted H2 pair is `±(g−k+1)`. |
| 3.13 Independence of choices | CT20 lines 1834–1836 and 1888–1932, §5.2.2, pp. 44–47 | Changing the auxiliary choices preserves the character on the determinant-one component group; equality of individual artificial extensions is not claimed. |
| 4.12 SO₃ calibration | CT20 lines 455–500, §1.4, pp. 11–12 | The displayed matrix and signed masses agree. The source's trigonometric denominator slip is not used in the roadmap. |
| 5.8 Conditional restriction under GRH | CT20 lines 267–270, Theorem 4, p. 7; lines 1577–1594, §4.3, pp. 38–39 | Explicit GRH hypothesis, rank 16 and uniqueness conditional on existence. Roadmap correctly uses repeated weight 23/2 and the legal flags `(δ,m) = (0,2)` for the dual-pair exclusion. |
| 7.3 Dimensions in genus at most eight | CT20 lines 114–118, Theorem 1, p. 3, with Theorems 6–7 and §5.2 | `g ≤ 8`, dominant regular `k_g > g`, and the finite mass/parameter route match; this is not an assertion for genus 9. |
| 8.14 Stable theta isomorphism | CT20 lines 2289–2338, Corollary 5.15(2), pp. 56–57 | Rank `2k` even unimodular lattice class space, scalar weight k, and `g ≥ 2k` retained; rank-zero boundary agrees. |

The repaired genus-two calculation was also checked against vdG08 lines 852–891, Theorem 9.1 and its proof, pp. 19–20. The repaired arbitrary-group orbit theorem was checked against CT19a lines 227–248, Fact 1.2, p. 6. The four Lean headlines were checked against CT20 Proposition 3.7, lines 1245–1265, pp. 30–31, and CT19a formula (1), Proposition 1.4, Theorem 2 and Proposition 4.1. No unsettled author-flagged unverified locator remains beyond KT87.

### Computed adversarial pass

The table covers the seeded targets, all Lean headlines and definitions, the repaired passages and every mathematical finding. Other untouched targets were reread; earlier-round evidence was reused only where it contained explicit computed values. Large external mass and exclusion archives are not claimed to have been independently regenerated.

| Statement | Instances tried | Values computed on both sides | Result / change |
| --- | --- | --- | --- |
| 1.1 and 1.5, unitary versus tempered | Local complementary-series pair at p = 2 | Roots `2^(1/4) ≈ 1.189207115`, `2^(−1/4) ≈ 0.840896415`, product 1; strict bounds `0.707106781 < each < 1.414213562`, modulus-one predicate false | Correctly permitted by the finite-place bound. |
| 1.2–1.4, tensor and determinant | `I₁²`, `I₀` | `I₂ + 1 + e` has dimension 4 = 2·2 and determinant `e·e = 1`; `I₀` has dimension 2 and determinant e | Correct. |
| 1.4, gamma and epsilon | s = 1; `I₁₁`, `I₁₇` | `Γ_ℝ(1)Γ_ℝ(2) = 1/π = Γ_ℂ(1)`; `i¹² = 1`, `i¹⁸ = −1` | Correct normalization. |
| 1.5, purity and duality | `Δ₁₁`, `Sym²Δ₁₁` | Weights `±11/2` sum to 0; symmetric-square weights `(11,0,−11)` sum to 0; motivic weights 11 and 22 | Correct; no inference of global self-duality just from symmetry. |
| 1.6, regularity and determinant | `(1,0,0,−1)` versus three zeros | First gives `I₂ + 1 + e`, determinant 1; three zeros admit both `3·1` and `1+2e`, each dimension 3 and determinant 1, but unequal classes | Correct uniqueness restricted to regular vectors. |
| 1.8, type criterion | `U = I₁ + 2I₂₃` | Dimension `2+4 = 6`, determinant 1, scalar −1; multiplicities `(1,2)` imply nonregular, but the lone `I₁` is symplectic | R02: simple-weight criterion covers it. |
| 1.9, weight dictionary | Bad inverse candidates for Sp₂, SO₅, SO₄ | Inverse weights `−1`, `(−1,0)`, `(0,1)` fail dominance; valid central-double-zero SO₄ case gives `(0,0)` | Earlier regularity repair remains correct. |
| 2.3, archimedean sign | Compactly supported `F(x) = (1−x²)³` | Integral of derivative difference `≈ −0.2254836448`; defined J `≈ +0.2254836448` | R01; corrected minus makes both positive. |
| 2.6, strip-bound repair | Completed zeta at 0 and 1 | Residues `2·(−1/2) = −1` and `1·1 = +1`; adding `1/s − 1/(s−1)` leaves residue 0 at both points | Repaired. |
| 2.7–2.8, multiplicities | m = 1,2; excluded m = 0 | Diagonal average `mA/m² = A/m`, hence A and A/2; correction denominators 2 and 8 | Correct positive-m domain. |
| 2.12, cone criterion | a = c = 1, b = −2,+2,−1; a = 0,c = 1,b = −1 | For b = −2, determinant −3 and q(1,1) = −2, unit-cone minimum −1. For b = +2 minimum 1; b = −1 minimum 0. Degenerate last case q(1,1) = −1 | Both directions and zero-boundary behavior agree. |
| 2.14, monotonicity | Epsilon −1 pair `(I₁₇,1)`; turn both flags on | Off-diagonal change −1; at `(1,1)` quadratic change −2; at `(1,−1)` change +2. Epsilon +1 gives change 0 | Correct on the nonnegative cone only. |
| 2.15, multiplicity compression | A = 1, common kernel 1, multiplicity 2 | Expanded unit-cone minimum −1, compressed minimum −1/2; lift `t ↦ (t/2,t/2)` gives value `−t²/2` on both sides | Correct equivalence of negativity; no false equality of normalized minima. |
| 2.19, Miller range | n = 0,12 | Family ranks 2,26 and 1,25; trivial rank-one class exists and is excluded from the nontrivial assertion | Correct endpoint treatment. |
| 2.20 and 2.21, elliptic dimensions | Classical weights 12,24,23,54 | Cusp dimensions 1,2,0,4; for weight 54, `dim M₄₂ = 4` | Correct shifts; repeated-weight source's “one form otherwise” is false. |
| 3.3, multiplicity iff | Genus-two SK at k = 10,11; simple shape | χ = −1 in both cases; epsilon −1,+1 respectively; simple component group order 1 | Pass/fail distinguished. |
| 3.8, scalar membership | g = k = 12, `Δ₁₁[12] + [1]` | Dimension 25, weights 0 and `±(12−i)` for i = 1,…,12; zero multiplicity 3; special block length 1 in both I and H1 | Correct overlapping local cases. |
| 3.10, compact remainder | g = 16,k = 13; remove [9] | k′ = 12; remainder `Δ₁₇[8]+[7]+[1]` has dimension `16+7+1 = 24 = 33−9`, determinant `e¹² = 1`; pair ±4 removed | Correct. |
| 3.13, choices | Same H2 parameter; odd blocks [9],[1],[7] | With i₀ = [9], χ on `[1]·[7]` is `(-1)^(±2) = 1` for either sign choice; χ on `[9]·[7]` is −1; epsilon pairs are 1 and −1 | Character is unchanged on the actual component group. |
| Layer 3 Examples and 7.2 | k = 20,10,11 | At 20: five Igusa monomials − image dimension 2 = cusp dimension 3 = 1+2+0. At 10: 1 = 0+1+0. At 11: 0 = 0+0+0 | Round-4 repair verified. |
| 3.16, outer averaging | SO₈, λ = (9,7,4,2); SO₃ | `2·(1+0)/2 = 1`; dropping multiplicity gives 1/2. SO₃ simple coefficient −1 | Formula keeps multiplicity; R04 is documentation only. |
| 4.6, spinor normalization | 90-degree rational rotation | `det((1+γ)/2) = 1/2`, `Q(−1) = 2`, ratio 1/4 a square | Equality is of square classes. |
| IsRegularIntegralForm, 4.7 | n = 0; q = x²; q = 2x²; q = xy | Polar determinants 1,2,4,−1; predicates true,true,false,true | Half-discriminant and dyadic distinction retained. |
| specialOrthogonalPoints | Identity; rank-one reflection; zero ring | Identity det 1 and preserves q; reflection det −1 over ℚ and is excluded; zero-ring unique matrix has 0 = 1 and satisfies the predicate | Definition intentionally allows all commutative rings; headline uses genuine ℤ_p. |
| spinor_charpoly_obstruction | Identity n = 0,1; nonmonic Q; cyclotomic exclusions | Identity Q = 1 gives `abs Q(±1) = 1 = 1²`. Q = 2 cannot be a local characteristic polynomial. For `Φ₁Φ₆`, `Φ₁Φ₃`, `Φ₁Φ₄`, residual Q(−1) is 3,1,2 respectively | All-prime premise rules out the nonsquares; no unlinked Q. |
| 4.9, finite index sets | Exact cyclotomic degree enumeration, modulo central sign | Sp degrees 2,4,…,16: 3,12,32,92,219,530,1158,2521. Orthogonal spinor-filtered degrees 3,5,…,17: 3,12,34,99,244,598,1339,2948; even degrees 4,8,12,16: 6,40,211,992 | All listed cardinalities agree; Sp₁₄ source typo corrected. |
| 4.12, SO₃ calibration | Displayed 5×5 matrix and mass vector | Determinant 288; multiplication by `(−1/12,1/4,1/3,0,0)` gives `(1/2,−1/2,−1/2,−1/2,−1/2)` | Correct signed EP masses. |
| 4.14 and 5.3, known classes | Rank-by-rank low-weight list | `11+13+3 = 27` classes; one shared infinity type gives 26 blocks; `Δ₁₁` rank 2, motivic weight 11; `Sym²Δ₁₁` rank 3, weight 22 | Class/block counts and examples agree. |
| 5.7, repeated top | V and exceptional fibre | `181+1 = 182` infinity types, at most `181+2 = 183` classes; exceptional rank 14 | No existence asserted; type input needs R02. |
| 5.8, GRH survivor | `I₁+I₇+I₁₁+I₁₅+I₁₉+I₂₁+2I₂₃` | Rank `2·(6+2) = 16`; repeated top weight 23/2; differs from exceptional rank-14 parameter | Correct conditional restriction, not existence. |
| 6.1, Siegel L-factor shifts | g = k; g = 1,k = 4 | Shifts 0,0 and −3,+3, respectively | Coincident factors both retained. |
| 6.3, mass-weighted neighbors | Leech/Niemeier pair | `12870·405 = 18225·286 = 5212350` | Correct weighting direction. |
| 6.9–6.10, Rallis genus | E₈, n = 8,g₀ = 0,g = 8 | Added length `2g+1−n = 9`, total `8+9 = 17`; substituting g₀ gives −7 | Roadmap uses actual genus. |
| 6.12 and 8.7 | Five Böcherer cases in listed order | Order vectors `(0,0,0,−1,1)`, `(0,0,0,0,0)`, `(0,0,0,−1,1)`, `(0,−4,−4,−1,9)`, `(0,−12,−12,−1,25)` all sum to 0 | R03 corrects the contradictory denominator Check. |
| 7.3, genus bound | g = 8 versus 9 | Dual dimensions 17 and 19; available mass endpoint Sp₁₆/SO₁₇ versus unavailable next case | Correct bound and regular-weight premise. |
| 7.8–7.10, eigenparameter tables | All 29 nonscalar and 32 scalar rows | In each of 61 rows, expanded block dimension equals `2g+1` and the weight multiset equals `{0} ∪ {±(k_i−i)}`. Weight-13 endpoints give dimensions 17,25,33,49 | All 61 comparisons pass; not a proof that no further forms exist. |
| 8.3, arbitrary-group orbit basis | ℤ→C₃, C₃, S₃ on three points, degrees 0–4 | ℤ and C₃ `(1,1,1,1,0)`; S₃ `(1,1,0,0,0)`; empty-subset form 1 | Repaired generality and orientation signs agree. |
| invariantAlternatingForms and 8.5 | Rootless rank 24 at g = 0,1,8,24,25; trivial group control | Dimensions 1,0,1,1,0 from the average polynomial; trivial group's degree-one dimension is 24 instead of 0 | Real invariance predicate excludes the plausible wrong trivial action. |
| invariantAlternatingForms_eq_bot_of_roots_span | A₁; zero space; degenerate Gram matrix `[[2,2],[2,2]]` | Root reflections give `a = −a`, hence a = 0 over ℚ. Positive-degree forms on zero space vanish. In the degenerate example both basis vectors are roots and the same argument kills invariant forms | General root-spanning statement needs neither positivity nor unimodularity. |
| 8.5, rooted Golay control | Construction A versus rootless Leech, degree 8 | Construction-A vectors `2e_i` have norm 2 and span, giving invariant dimension 0; Leech dimension 1 | Rootlessness is not confused with the Golay code's minimum distance. |
| thetaCoefficient | T = [2]; nonsymmetric T; zero ω | Gram [2] gives Fourier index [1] and exponent `2πiτ`; nonsymmetric T has no tuples, sum 0; zero ω gives coefficient 0 | Correct factor two, support and nonzero premise. |
| exists_thetaCoefficient_ne_zero_of_rootless | g = 8,12,16,24 with standard normalization | Absolute coefficients `4157776806543360000`, `49893321678520320000`, `41577768065433600000`, `8315553613086720000`; all nonzero | Nonzero rational rescaling preserves nonvanishing, so theorem applies to every nonzero invariant form. |
| 8.14, stable theta | k = 0; (k,g) = (4,8),(8,16) | Source and target dimensions 1=1, 1=1, 2=2; rank-zero theta is 1; E₈ full-basis coefficient is `696729600 ≠ 0` | Correct boundary and stable endpoints. |

### Lean, signatures, padding and headline inventory

Ran `lake env lean` on the unchanged package's absolute Suggested.lean path from the pinned content checkout. It succeeded; the only warnings were four `declaration uses 'sorry'` warnings, at lines 80, 124, 137 and 149. No Tau Ceti object needed building. No broad build, update or cache command was run, and no process was left running.

Elaborated a scratch copy with `#check @name` for all eight declarations and compared every result with the README and the supplied signature extraction. No binder was lost. The two rootless theorems retain evenness, unimodularity, positive definiteness, rank 24 and rootlessness; the root-spanning theorem retains its actual spanning premise and `0 < g`; the spinor theorem retains regularity and realizability at every prime. The four definitions have real bodies and use native carriers. Positivity is not silently built into IntegralLattice or thetaCoefficient.

For **each of the four sorried theorems**, a scratch copy tried `simp` with closure required, `rfl`, and `infer_instance`. All four resisted all three. The supplied near-match candidates were compared at the pins; neither a generic finrank identity, spin-group membership, a bilinear invariant form, a scalar modular-form nonvanishing theorem nor a circle Fourier coefficient proves these headlines with one `exact`. No theorem is a definition restatement, small-value computation, boundary theorem or mirrored README Check. No deletion for padding is required.

The file uses the pin's `module`/`public import` syntax, one Mathlib import and five used individual Tau Ceti integral-lattice modules. It has the required namespace, docstrings and layer order, with four real definitions and four admitted headline theorems. All eight own identifiers occur in the README; the resolver found no advertised own Lean name missing from the file.

| Headline family from the README | Suggested.lean disposition |
| --- | --- |
| Cone inequality, Miller and repeated-weight PGL₄ vanishing (§§2.7,2.19,2.21) | Docstring names all three; missing cuspidal automorphic representation and pair-L-function carriers. |
| Triangular EP/count relation (§3.16) | Not statable, but not explicitly named in the docstring: R04. |
| Torsion masses and exact recovery (§§4.13–4.18) | Docstring names these; missing spectral trace-formula and orbital-integral carriers. |
| Spinor characteristic-polynomial obstruction (§4.7) | `spinor_charpoly_obstruction`, line 80. |
| Low-weight PGL classifications and GRH restriction (§§5.3–5.10) | Docstring names weight 22,23,24 and conditional classifications; missing automorphic carrier. |
| Regular genus-at-most-eight dimensions, nonscalar/scalar tables, four weight-13 forms (§§7.3,7.8–7.10) | All named with the missing genus-g Siegel-form carrier. |
| Eichler basis, harmonic realizations and alternating theta isomorphism (§§8.1,8.8,8.10) | Named with the missing Siegel/theta carriers. |
| Leech invariant forms and root-spanned vanishing (§8.5) | `finrank_invariantAlternatingForms_of_rootless`, line 124; `invariantAlternatingForms_eq_bot_of_roots_span`, line 137. |
| Leech theta nonvanishing and exact normalized coefficient (§8.6) | Nonvanishing is stated by `exists_thetaCoefficient_ne_zero_of_rootless`, line 149; the exact Mathieu-normalized value is explicitly unstatable without Conway coordinates, normalization and Q_g. |
| Stable dimensions, Siegel operator and theta isomorphism (§§8.12–8.14) | All named with the missing Siegel/theta carriers. |

No statable headline was found missing, and no headline was forced through free predicates or arbitrary scalar data.

### Pinned declarations and duplication audit

The following are actual opened declarations at the pins, not search-result names. Native integral-lattice data were checked particularly carefully because the root-spanned theorem is more general than the positive-definite Leech applications.

| Pinned file and line | Declaration or content compared |
| --- | --- |
| `Mathlib/NumberTheory/ModularForms/LevelOne/DimensionFormula.lean:65`, :262 | `CuspForm.discriminantEquiv` shifts integer weight by 12; `ModularForm.dimension_level_one` has natural weight and an evenness hypothesis. The package cites these rather than declaring them. |
| `Mathlib/Analysis/InnerProductSpace/Rayleigh.lean:266` | `IsSelfAdjoint.hasEigenvector_of_isLocalExtrOn` gives an eigenvector at a nonzero extremum; it does not supply the roadmap's least-eigenvalue/cone refinement. |
| `Mathlib/LinearAlgebra/QuadraticForm/Basic.lean:1154` | `Matrix.toQuadraticForm'` is the quadratic map of the matrix's bilinear form; it is not the roadmap's integral regularity predicate. |
| `Mathlib/LinearAlgebra/Matrix/Charpoly/Basic.lean:140` | `Matrix.charpoly` uses `det(tI−M)`, the required direction. |
| `Mathlib/NumberTheory/Padics/PadicIntegers.lean:62`, :71 | `PadicInt.subring` is the norm-at-most-one subring; the surrounding prime fact is explicit. The theorem's local coefficients are actual p-adic integers. |
| `Mathlib/LinearAlgebra/Alternating/Basic.lean:67` | `AlternatingMap` is multilinear with repeated-input vanishing; it contains no lattice-isometry invariance. |
| `Mathlib/LinearAlgebra/Dimension/Finrank.lean:61` | `Module.finrank` is natural-valued rank; finite-dimensionality in the lattice statements is furnished by the full-lattice structure, not assumed for an arbitrary bare V. |
| `TauCeti/LinearAlgebra/IntegralLattice/Basic.lean:63`, :121 | `IntegralLattice` has `carrier`, rational bilinear `form`, a full finitely generated lattice, symmetry and integrality. It does **not** include positivity or nondegeneracy; finite-dimensionality follows. |
| `TauCeti/LinearAlgebra/IntegralLattice/Even.lean:67`; `Unimodular.lean:61`, :72; `Signature.lean:171`, :198 | Separate even, unimodular and positive-definite predicates; unimodularity supplies nondegeneracy, positivity is not a hidden field. |
| `TauCeti/LinearAlgebra/IntegralLattice/Norm.lean:78`, :221; `Isometry/Basic.lean:77` | Norm is the form's quadratic map; vectorsOfNorm and form-preserving carrier isometries match the real definitions. |
| `TauCeti/LinearAlgebra/CliffordAlgebra/Spin/SpinorNorm/Basic.lean:98` | Field spinor norm into units modulo squares; neither the all-prime integrality statement nor the characteristic-polynomial obstruction is already here. |
| `TauCeti/Algebra/AlgebraicGroup/Symplectic/Basic.lean:213`; `Smooth.lean:93` | Matrix-points equivalence and smoothness of the integral symplectic group scheme, consumed rather than redeclared. |
| `TauCeti/InformationTheory/Coding/Binary/Golay/Basic.lean:66`, :136, :563, :606, :662 | Code, rank 12, Type II, weight enumerator and minimum distance 8. |
| `TauCeti/LinearAlgebra/IntegralLattice/ConstructionA/Golay/Basic.lean:33` | Construction-A lattice with halved dot-product normalization; norm-2 vectors `2e_i` are the correct rooted negative control. |

Object searches covered the pinned libraries, current main roadmaps, the indexed board packages and the supplied open-head tools: quadratic/spinor norms, characteristic-polynomial obstruction, invariant alternating forms, Gram-indexed theta coefficients, Leech realization, torsion masses, cone inequalities, Miller vanishing, first occurrence and stable Siegel forms. No duplicate ownership of the package's four headlines or identical fully qualified declarations was found. The MetaplecticAutomorphicForms occurrence of a thetaCoefficient name concerns a Jacobi Fourier reindexing, not this Gram-tuple sum.

The closest open roadmaps were read at their supplied heads:

- **#1714 SiegelModularForms**, `TauCetiRoadmap/SiegelModularForms/README.md:126`: its scope leaves the even-unimodular all-genus theta map, harmonic map and level-one Siegel identities to this roadmap's §§6.1,6.4,6.7,7.9. Its wider general-lattice theory is an extension, not a second owner of these endpoints. No upward supplier citation was added here.
- **#1222 OrthogonalTamagawaAndLatticeMass**, `TauCetiRoadmap/OrthogonalTamagawaAndLatticeMass/README.md:534`: owns rank-24 classification and uniqueness, with Conway order imported from CFSGBasicProperties. This package owns the alternating-form and harmonic-theta conclusions, not the classification.
- **#1756 AutomorphicLFunctionsAndLocalFactorsPartII**: its generic analytic/local-factor scope was compared with the level-one positivity specialization; no second owner of the latter was found.
- **#1180 ModularityAndLanglandsExtensions**, §3.4 and §§3.8,3.15,3.17,3.20–3.22: owns generic type, Arthur and packet theory; the package's level-one character calculations are specializations. R02 concerns the package's own insufficient specialization.
- **#925 AutomorphicSpectralTheory**, `TauCetiRoadmap/AutomorphicSpectralTheory/README.md:3159`, :3218: trace inputs and L²-Lefschetz formula are generic suppliers, not competing ownership of the finite torsion-mass conclusions.

The overlap report has no conflicting head changing this roadmap, no dropped cited id and no id defined only by an open revision. The readable indexed board heads of AnalyticNumberTheory and LogicAndDefinabilityInNumberTheory introduce no competing object; the inaccessible head is recorded below. This is not a claim that an unreadable package exists nowhere.

### Supplier resolution and order

Re-resolved cross-roadmap citations against main and the supplied open heads, not remembered numbering. `roadmaps resolve` found no unresolved cross-roadmap citation and no missing own Lean identifier. Its external-library-name check was unavailable on that host; pinned source inspection and Lean elaboration supplied that verification locally.

| Supplier | Sections resolved and content checked |
| --- | --- |
| AutomorphicFormsOnReductiveGroups | §§2.2,2.4,2.5;3.2,3.4,3.5;4.2;5.1,5.5;6.7,6.8;7.2,7.2a,7.4,7.5: actual Weil/automorphic carriers, purity, real holomorphic modules, GL₂ adelization and compact-infinity modular forms. |
| AutomorphicLFunctionsAndLocalFactors | Conventions; AL.1.4.2–1.4.3;3.2.3;3.3.8;3.6.1–3.6.3;3.7;3.9.2;3.9.4. In particular `TauCetiRoadmap/AutomorphicLFunctionsAndLocalFactors/README.md:1882`, #924, is the all-rank meromorphic strip-bound target, not just the predicate at :1862. |
| AnalyticNumberTheoryPartI | §§1.3,1.8: admissibility and explicit formula with removed principal parts. Bound parameter c = 1 covers pair roots below p. |
| SmallRamificationAndAbelianVarietyBaseCases | §§1.5–1.7: convolution kernel, divided-cosh transform positivity, Poitou test functions; scale b = ℓ agrees. |
| AutomorphicSpectralTheory | §§4.4,4.5,4.10;6.9,6.17,6.19,6.20: discrete/residual spectra, finite multiplicity, tempered cuspidality, orbital integrals and Lefschetz trace formula. Gross rationality is a declared extension. |
| ModularityAndLanglandsExtensions | Exact supplier contracts and §§3.4,3.8,3.15,3.17,3.20–3.22: standing trace premises and Arthur/Mœglin–Renard data. Same-type root number remains an explicit contract. |
| AutomorphicBundles | §§11.1,11.2,11.9,11.16;12.10,12.11,12.13,12.15: actual forms, comparison, coefficients, boundary, Hecke and Fourier–Jacobi structures. |
| MetaplecticAutomorphicForms | §§0.15,2.4c,3.1,3.4,3.5,3.7,3.10,3.21,5.1,5.6,6.14: oscillator, dual pairs, theta modules, first occurrence, Rallis and global theta. Böcherer's exact quotient is declared, not falsely claimed supplied. |
| SymplecticReidemeisterTorsionModSquares | §4.1, `TauCetiRoadmap/SymplecticReidemeisterTorsionModSquares/README.md:751`, #1645: Zassenhaus primary formula over fields with 2 invertible, with the associated bilinear form normalized by B(x,x)=q(x). |
| GeometryOfNumbersAndQuadraticArithmetic | §2.4 and §2.4.2, `TauCetiRoadmap/GeometryOfNumbersAndQuadraticArithmetic/README.md:579`, #851: nondyadic proper stabilizer spinor units; rank-one SO is trivial. This does not settle the dyadic contract. |
| OrthogonalTamagawaAndLatticeMass | §§3.1,4.1,4.2: mass, ranks 16 and 24, rootless uniqueness. |
| ComputationalNumberTheory | §§4.1–4.7,4.17,4.17a,4.18,4.26,4.29–4.34,5.1: arithmetic enclosures and witness interpretation. `TauCetiRoadmap/ComputationalNumberTheory/README.md:2151`, #1408, has the eight scalar formulas; their identification with the intrinsic integrals belongs here. |
| IntegralLattices, Rank24LatticeConstructions | Completed/IntegralLattices Layer 1 and §4G; Rank24LatticeConstructions Layer 6: full lattice carrier, neighbor relation and Leech construction, not harmonic-theta nonvanishing. |
| ThetaSeries, AlgebraicCodingTheory, SporadicOrders, CFSGBasicProperties | ThetaSeries Layers 1,5,8; AlgebraicCodingTheory Layer 5; SporadicOrders Layer 1; CFSGBasicProperties P2-L: genus-one theta, Golay and Mathieu/Conway data. Average characteristic polynomial is separately declared. |
| OrthogonalSpinGroups, LieHighestWeight, ClassicalGroups, ReductiveGroups, ModularForms | OrthogonalSpinGroups Layer 1; RepresentationTheory/LieHighestWeight Layer 6; RepresentationTheory/ClassicalGroups Layers 3–5; ReductiveGroups Layer 9; ModularForms Layers 3–4. Field norms, highest weights, Chevalley groups and elliptic eigenbases have the stated owners. |

The required dependency command returned:

```text
depcheck: 236 roadmaps, 2150 edges, 0 problem(s)
```

There was no UPWARD, CYCLE or moved line. Reading the individual Needs lines found no forbidden or later-roadmap supplier. R02 is a missing general case in an internal prerequisite, not a new supplier-order defect.

### Declared supplier contracts

All eight gap slugs match the plan's top-level gaps and the README's named supplier subsections. Each names an owner; none has supplier `none`. Their related clauses specify the interface of one result rather than unrelated projects. The available nearby statements do not already provide the requested extensions.

| Gap slug | Precision and minimality check |
| --- | --- |
| sp2g-lowest-weight-modules | Exact dominant weight, EHW inequality, infinitesimal character and discrete-series range; regular scalar modules alone do not cover it. |
| siegel-adelic-lift | Square-integrable vector-valued Siegel forms, ρ_k, Hecke compatibility and cuspidality; the GL₂ lift is insufficient. |
| gross-volume-rationality | Finite-order semisimple centralizer and specified measures; volume finiteness alone does not prove rationality. |
| same-type-pair-root-number | Unitary self-dual cuspidal pair, same type, global root number at 1/2 equal to 1. |
| boecherer-theta-image | Explicit relation k = n/2 + ν and finite nonzero germ of the specified quotient; general theta nonvanishing does not provide it. |
| integral-spinor-norm-units | p = 2, regular forms including odd unit half-discriminant; the nondyadic result is not duplicated. |
| split-orthogonal-regular-form | Integral orthogonal/Chevalley comparison compatible with ℤ₂ points; the existing symplectic model does not supply it. |
| conway-group-average-charpoly | Specified O(Leech) action and average polynomial; group order alone is insufficient. |

These contracts are not findings merely because they are still to be supplied. The present verdict is needs changes for R01–R04, so no accepted-only conditional_gaps field is attached to review.json.

## Not verifiable

- **KT87**, pp. 466–511: the determinantal character formulas remain behind the settled uncertified citation. No text was guessed, no renamed key added and no repeated reference request made.
- **LawrenceVenkateshMethod**, indexed board head #345 at 9ee7ac3: its indexed README request returned HTTP 404. Ownership against that particular head could not be checked; the index was read before recording this limitation.
- **Large external numerical archives:** the mass-recovery matrices and finite positivity/enclosure archives used by CT20 were not independently regenerated. The review verifies the source statements, small signed instances, all 61 parameter-row weight/dimension comparisons, the displayed finite index counts and the ownership of the computational prerequisites. It does not certify unseen archive output.

## Source issues

- **Error** in CT20 at Corollary 2.9 and its preceding embedding, printed p. 20: the source says negative minima on the two Euclidean unit cones agree; it should be equivalence of negativity, with the 1/m lift preserving the quadratic value; affects a stated result.
- **Misprint** in CT20 at §1.4, SO₃ character display, printed p. 11: the source says the sine quotient has denominator sin(2π/i); it should be sin(π/i), giving character 1 in highest weight zero; affects a stated result.
- **Error** in CT20 at §2.4.7, printed p. 25: the source says the elliptic eigenform set has one element except for its listed zero cases; it should be dimension S_(w+1), which is 2 at w=23 and 4 at w=53; affects the proof.
- **Misprint** in CT20 at §3.3, footnote 13, printed p. 33: the source says the elliptic cusp space of weight 23 has dimension 2; it should be weight 24, whose dimension is 2, whereas odd weight 23 gives 0; affects nothing.
- **Misprint** in CT20 at §3.3, printed p. 33: the source says the symplectic rank-seven polynomial index set has 1157 elements; it should be 1158; affects nothing.
- **Misprint** in CT20 at Theorem 4, printed p. 7: the source says the repeated weight is 23 at motivic weight 23; it should be the weight 23/2; affects a stated result.
- **Misprint** in CT20 at §4.3, proof of Theorem 4, printed pp. 38–39: the source says δ=m=2 for the exceptional dual pair; it should be δ=0 and m=2, since the self-duality flag is binary; affects the proof.
- **Error** in CT20 at §5.2, infinitesimal-character discussion, printed p. 42: the source says distinctness of all 0, ±(k_i−i) is equivalent to k_g>g; it should exclude zero k_i−i and opposite pairs; g=1,k=0 has distinct 0,±1; affects a stated result.
- **Misprint** in CT20 at Remark 5.3, printed p. 45: the source says k is at least two while its argument excludes two; it should be k at least three in case H2; affects nothing.
- **Misprint** in CT20 at §5.3.2, displayed Rallis relation, printed p. 50: the source says the added standard block uses first-occurrence genus g₀ for every theta lift; it should be the actual genus g of that lift; affects a stated result.
- **Error** in Tai17 at §4.1.2, simple-parameter contribution, printed p. 311: the source says the contribution is the packet EP sum without its global multiplicity; it should be m_ψ times that sum with the same outer-averaged convention; affects a stated result.

<!-- tauceti-roadmap-review {"agent": "codex", "head": "a5d055adce8827d348705462012c687da8540a5e", "job": "REV-PKG-LevelOneAutomorphicFormsForClassicalGroups~5", "model": "gpt-6-astra", "worker": "chris-9"} -->
