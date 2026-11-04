# Review of ProfiniteProPGroups (pull request #618 at 9d07815)

**Verdict:** needs changes

The new findings below concern the two reviewable files. The worker's gate passes; direct elaboration also passes. Neither establishes the prose claims refuted below.

Previous findings were checked individually before the new review:

| Previous finding | Head passage/evidence | Disposition |
|---|---|---|
| R01, duplicate completed roadmap | README:3 still says “This roadmap develops”; main has `Completed/ProfiniteProPGroups/`. Of the 123 declaration names inspected here, 114 also occur under the same namespace in the completed file. | Not repaired, but settled for this package by `packages/ProfiniteProPGroups/reports/GATE-ProfiniteProPGroups~3.md`, H01: “Both moves fall outside the two files this repair may edit”. That reason is valid. I do not re-raise it. The destination/rebase versus Part II decision remains a human merge prerequisite. |
| R02, private copies of native objects | README:59–62 lists the native `demushkinQ`, relator class and normal-form words; Suggested.lean defines reducible aliases. | Repaired. The relator class now uses the continuous character and its actual `labuteE` carrier. |
| R03, admitted theorems already proved at the pin | README:66: “Every headline theorem stated in `Suggested.lean` is proved in Tau Ceti at the pin”. | Repaired as an admission problem: zero admitted declarations remain and the file elaborates. This does not settle missing headlines or padding. |
| R04, nonexistent finite-group input | README:481 names `Subgroup.isCoatom_iff_index_eq_prime`, with nilpotence from `IsPGroup.isNilpotent`. | Repaired: both declarations exist in pinned `Mathlib/GroupTheory/Nilpotent.lean`:1255,1282. |
| R05, redundant hypotheses | README:2432–2434 explains the removed rank and `q = 2` hypotheses; the elaborated marked signatures agree. | Repaired. Relators in the fixed free group already give equal generator rank. |
| R06, padding | H06 reports “All 90 `example`s are deleted”; this head has no examples and no `splitBase_dvd_iff`. Suggested.lean:1324,1330,1354 still contains elementary controls. | Partly repaired. R07 below concerns concrete surviving controls, not a demand to remove the classification merely because its proof is short. |
| R07, source manifest | The folder still has no `sources.toml`. | Not repaired, but settled for this package by H07: “This repair may edit only `README.md` and `Suggested.lean`”. No repeat finding. Source verification and its limitations are recorded below. |

## R01 (P2) — Exclude zero before subtracting valuations

**Location:** `TauCetiRoadmap/ProfiniteProPGroups/README.md`:1949. “if `ψ = (T - c) φ` then … `v_p(φ(0)) = v_p(ψ(0)) - v_p(c)`”.

**Claim:** The displayed quotient-valuation formula holds under the preceding hypothesis `v_p(c) ≥ 1`. The conventions explicitly allow `v_p(0) = ∞`.

**Witness:** At `p = 2, c = 0`, take respectively `(ψ,φ) = (T,1)` and `(2T,2)`. The left sides are 0 and 1; both right sides are `∞ − ∞`.

No choice of a total subtraction operation can make both instances true. This is not a defect in division by `T`, which remains valid.

**Repair:** Keep the division equivalence at `c = 0`, but require `c ≠ 0` for the subtractive valuation formula, using extended valuations. Alternatively state the multiplicative valuation identity without subtraction. Check `c = 0, φ = 2`: the latter reads `∞ = ∞ + 1`; check `c = −6, φ = 1`: the restricted subtractive formula reads `0 = 1 − 1`. The actual basis-correction applications have nonzero `c`, so this repair preserves them. Labute's division proof explicitly separates `c = 0` (`labute1967` line 660).

## R02 (P2) — Restrict the finite cyclic coordinate to a cyclic p-group

**Location:** `TauCetiRoadmap/ProfiniteProPGroups/README.md`:1888. “a finite procyclic `Γ`, where evaluation at `γ - 1` has kernel `((1 + T)^|Γ| - 1)`”.

**Claim:** This edge case is stated for the completed group algebra of an arbitrary profinite group, without a pro-`p` hypothesis on the finite cyclic group.

**Witness:** For `p = 3, Γ = C₂`, `(1+T)²−1 = T(2+T)`. Since `2+T` is a unit, the proposed quotient has ℤ₃-rank 1; `ℤ₃[C₂]` has rank 2.

Indeed `γ−1` is not topologically nilpotent in that group algebra, so evaluation of arbitrary formal power series there is unavailable.

**Repair:** Say “finite cyclic p-group” in this claim, with a chosen generator. Keep the ordinary finite-group-algebra description for other finite groups. At `p = 3, Γ = C₃`, the polynomial is `T³+3T²+3T`, a distinguished degree-three polynomial, and the quotient has the required rank 3. At `Γ = 1` the kernel is `(T)` and both algebras are ℤ₃. Add `C₂` at `p = 3` as the negative control.

## R03 (P2) — The native IsProP predicate does not supply profiniteness

**Location:** `TauCetiRoadmap/ProfiniteProPGroups/README.md`:1208–1210; `Suggested.lean`:566–568. “its `IsProP` field is what confines it to pro-`p`, hence profinite, groups”.

**Claim:** The native predicate on an arbitrary topological group forces compactness and total disconnectedness.

**Witness:** `TauCeti/Topology/Algebra/Group/Profinite/ProP/Basic.lean`:68 quantifies over open normal quotients only. An infinite discrete elementary abelian 2-group satisfies it, but is not compact.

The elaborated types of both aliases lack compactness and total-disconnectedness binders. In particular, those hypotheses cannot be recovered merely by unfolding the `IsProP` field. Even a connected group has no proper open subgroup, so this field alone would test only its trivial quotient.

**Repair:** Describe the native predicate faithfully and state the ambient profinite hypotheses separately in the conventions and every affected theorem. Do not claim that this field proves them. Retain the native alias. The discrete direct sum of countably many `C₂` is then excluded by compactness; the compact product of those groups is admitted. Existing Lean headline theorems generally already carry the required ambient instances; correct the explanatory claim rather than inventing a second predicate.

## R04 (P2) — The marked classification omits the image {±1}

**Location:** `TauCetiRoadmap/ProfiniteProPGroups/README.md`:2430–2431,2480–2483; `Suggested.lean`:949,988,1015. The README says the endpoint “is a separate statement”.

**Claim:** The listed acceptance statements cover the promised marked classification, including infinite level.

**Witness:** For `G = ⟨x,y ∣ x²(x,y)⟩`, the invariants are `n = 2`, `q = 2`, and `Im χ = {±1}`. None of the four listed marked theorems applies.

The odd and general even statements use finite levels. The rank-two statement uses `padicValNat 2 a`; at `a = 0` this is 0, not ∞, and its required unit would have value `−1+2⁰ = 0`. The `twoPowENat` and p-adic word definitions do not themselves provide an endpoint theorem. The same omission occurs for odd ranks, for example `x₁²(x₂,x₃)` at rank 3.

**Repair:** Include the full odd- and even-rank `{±1}` marked statements in the acceptance interface if classification remains an owned headline. The native statements and words already exist in `TauCeti/Topology/Algebra/Group/Profinite/Demushkin/NormalForm/Marked.lean`:173,319 (`isDemushkin_marked_of_q_two_odd_top`, `isDemushkin_marked_of_q_two_even_top`); their signatures elaborate with the existing imports. The even theorem gives `χ(x)=1, χ(y)=−1` in the witness above, and the odd theorem gives `(-1,1,1)` at rank 3. These are whole orientation-image families, not just a rank-one Check. A scope decision to import the completed classification instead must remove the claim to build it here, consistently with the settled destination decision.

## R05 (P2) — Statable headline theorems are absent from the acceptance test

**Location:** `TauCetiRoadmap/ProfiniteProPGroups/README.md`:1708–1722,2596–2609; `Suggested.lean`:79–82,1854–1857.

**Claim:** Suggested.lean states the roadmap's headlines. Finite-quotient determinacy and Serre's arbitrary-rank equivalence are explicitly end theorems in the README.

**Witness:** The file only aliases `IsFiniteContinuousQuotient`; it has no determinacy theorem. Its arbitrary-rank Serre declarations are library `#check`s. Native full signatures exist at `Profinite/FiniteQuotients.lean`:189 and `Profinite/Free/Pointed/Serre.lean`:108.

Both signatures elaborated in the scratch probe. Neither needs an ad hoc carrier. The finite-rank `isFree_of_cd_p_le_one` and the closed-subgroup cohomological-dimension bound do not state the arbitrary-rank equivalence.

**Repair:** Make the acceptance interface cover these retained headlines at their README generality, using the native finite-quotient predicate and the native converging-presentation carrier. Do not add finite generation of `H` to determinacy or of `G` to the arbitrary-rank equivalence. Test the former on `C₂` versus `C₂` (quotients `{1,C₂}`, isomorphic), with `C₄` as negative control (it has a `C₄` quotient). Test the latter on the free pro-`p` group on a countably infinite converging basis: rank ℵ₀, `cd_p = 1`, and a native isomorphic presentation. As in R04, importing an existing headline entails removing its ownership claim, rather than leaving an incomplete acceptance claim.

## R06 (P2) — Import the already implemented bilinear normal forms

**Location:** `TauCetiRoadmap/ProfiniteProPGroups/README.md`:1764–1768,1794–1813. “two owned inputs … They are built here”.

**Claim:** The symplectic and characteristic-two nonalternating normal forms are new prerequisites to be developed in this roadmap.

**Witness:** Pinned `TauCeti/LinearAlgebra/BilinearForm/SymplecticBasis.lean`:301 supplies `LinearMap.BilinForm.IsAlt.exists_basis_toMatrix_eq_J`; `Diagonalization.lean`:243,264 supplies the identity normal form and the combined dichotomy.

The latter hypotheses include finite dimension, nondegeneracy, symmetry/alternation, and that every scalar is a square. That last hypothesis holds over `𝔽₂`; the symplectic theorem separately covers every characteristic. Thus the objects and statements are already supplied, not an unowned gap.

**Repair:** Move these exact native declarations to the supplier contracts and delete their repeated construction milestones. Keep only the application relating their basis convention to the relator coordinates, with an explicit sign witness. Test with `J = [[0,1],[1,0]]` and `I₂` over `𝔽₂`: both are nondegenerate, only `J` is alternating, and the two native branches distinguish them. The empty alternating form takes the symplectic branch with `m = 0`; `I₁` takes the nonalternating branch.

## R07 (P3) — Delete the surviving elementary controls

**Location:** `TauCetiRoadmap/ProfiniteProPGroups/Suggested.lean`:1324,1330,1354. “the standard orientation is continuous, being a continuous homomorphism”.

**Claim:** `isUnit_neg_three`, `negThreeUnit_coe`, and `standardD0Orientation_continuous` belong in the headline acceptance file.

**Witness:** On a scratch copy the three propositions close with, respectively, `exact TauCeti.isUnit_neg_three`, `exact TauCeti.negThreeUnit_coe`, and `exact TauCeti.standardD0Orientation.continuous`. The probe exits 0.

They are a small value, an alias's value, and a bundled field. H06's reason for retaining headline results does not apply to these controls. The same issue affects the generator-value and relator-value controls at lines 1341–1351,1377.

**Repair:** Delete them from `Suggested.lean`, along with now-unused aliases if any. The README keeps their mathematical statements as Checks, citing the native declarations rather than claiming local declarations. The normalization still computes `χ(A)=−1`, `χ(S)=1`, `χ(Y)=−1/3`, and the relator image `(-1)²·1⁴·1 = 1`.

## R08 (P3) — Restore the required roadmap structure and discriminating Checks

**Location:** `TauCetiRoadmap/ProfiniteProPGroups/README.md`:186–206,540,1199,1358,2610; throughout the layer headings.

**Claim:** Definitions have the documented API/Checks and conventions, and every layer has its examples and dependencies.

**Witness:** There are zero `**Checks.**` lists and no `## Conventions` section. The supernatural-number API gives two order examples but no computed tests of multiplication, lattice operations, or finite support; references to Layer 11 have no target layer.

**Repair:** Use the required headings, put supplier declarations in exact supplier contracts, and give each definition at least three discriminating Checks. Add the per-layer Examples and Dependencies subsections and remove dangling convention/layer references. For supernatural numbers, concrete tests are: the exponent vector of 12 is `(v₂,v₃)=(2,1)`; `gcd(12,18)=6` and `lcm(12,18)=36`; the function with exponent 1 at every prime has finite values but is not a natural number. These separate the intended operations and finiteness predicate from plausible wrong definitions. Correct the finite C₂ warning at line 1465: its proper subgroup is not Demushkin, although the numerical generator-rank equality happens to hold. Also specify, rather than leaving “up to one global sign”, the relator-to-cup convention at README:1823–1825 and check it on a two-generator example.

## R09 (P3) — Use the actual cohomology application syntax at the pin

**Location:** `TauCetiRoadmap/ProfiniteProPGroups/README.md`:708. “`(continuousCohomology (ZMod p) G n).obj (trivialFp p G)`”.

**Claim:** This is the Mathlib expression for the native coefficient cohomology.

**Witness:** `Mathlib/RepresentationTheory/Homological/ContCohomology/Basic.lean`:131 defines `continuousCohomology (n : ℕ) (A : TopRep k G)`. The supplier's old-looking functor notation is a private adapter at ProfiniteCohomology Suggested.lean:323.

**Repair:** Write `continuousCohomology n (trivialFp p G)`, as native `TauCeti.cohomFp` actually does at `TauCeti/RepresentationTheory/Homological/ContCohomology/TrivialFp.lean`:246. For the trivial group this gives dimension 1 in degree 0 and 0 in positive degrees. The underlying carrier claim in the seeded sample is correct; its displayed application syntax is stale.

## Verified sound

The 102 retained rows are adversarial computations, not proofs of universal statements. They cover the seeded targets, headline theorems and every finding, with selected definition and convention checks. Native aliases are tested through their underlying objects.

| Statement / object | Instances tried | Values computed on the two sides | Result | Change |
|---|---|---|---|---|
| Native aliases (“One implementation”) | `demushkinQ`, relator class, four finite-parameter words | Alias unfolds to the native term, with identical parameters and target; no additional quotient or action | Same object | None |
| Profinite type-class convention | finite `S₃`; ℝ additive | `S₃`: compact, totally disconnected, Hausdorff; ℝ: connected component ℝ, not compact | Ambient conditions discriminate | R03 |
| Quotient by a closed normal subgroup | `C₄/C₂`; `ℤ̂/ℤ` | First has 2 discrete points; second has dense zero coset and is not T1 | Closedness necessary | None |
| Tower lifting separation hypothesis | indiscrete ℤ mapping to indiscrete `ℤ/2ⁿ` | Every finite-level map onto; residue sequence above has no integer lift since all `2ⁿ` would divide `3a+1 ≠ 0` | Counterexample correctly excludes separatedness | None |
| Profinite completion universal map | `C₃`; ℤ mapping to `C₂` | Finite completion unit has 3 images/3 elements; map determined by image of 1, with 2 choices | Agrees | None |
| Supernatural multiplication | 12 and 18 | Exponents `(2,1)+(1,2)=(3,3)`, product 216 | Agrees | Add Check, R08 |
| Supernatural gcd/lcm | 12 and 18 | Pointwise min `(1,1)` gives 6; max `(2,2)` gives 36 | Agrees | Add Check, R08 |
| Supernatural natural-number predicate | all exponents 0; all exponents 1; one exponent ∞ | Natural number 1; infinite support so not natural; infinite value so not natural | Both required clauses matter | Add Check, R08 |
| Profinite order | `1,C₆,ℤ₂,ℤ̂` | `1,2·3,2^∞,∏ℓ^∞` respectively | Agrees | None |
| Lagrange | `C₃≤S₃`; `2ℤ₂≤ℤ₂` | `6=3·2`; `2^∞=2^∞·2` | Finite/nonabelian/infinite cases agree | None |
| Pro-p order support criterion | `C₄,C₆` at p2 | `(v₂,v₃)=(2,0)` versus `(1,1)`; pro-2 true versus false | Both directions | None |
| Profinite Sylow predicate | `C₃≤S₃` p3; `C₂≤S₃` p2; `1≤S₃` p2 | Indices 2,3,6; first two prime to p, last not | Correct nonabelian discrimination | None |
| Sylow existence | `S₃` at p2,p3,p5; trivial group | Sylow orders 2,3,1; trivial group Sylow order1 | Includes absent prime and trivial case | None |
| Sylow conjugacy | `S₃` at p2 | Three transposition subgroups, one conjugacy orbit | Agrees | None |
| Pro-p containment/maximality | `1≤C₂≤S₃` at p2 | `1` contained in a Sylow; order2 subgroup maximal pro-2 | Agrees | None |
| Normal Sylow uniqueness | `C₃≤S₃` | One subgroup of order3, normal; three order2 subgroups not normal | Hypothesis distinguishes cases | None |
| Sylow surjective image | `S₃→C₂` | 2-Sylow image C₂; 3-Sylow image1, the 3-Sylow of C₂ | Agrees | None |
| IsProP and topology | discrete `⊕ℕ C₂`; compact `∏ℕ C₂` | Both have only 2-group open quotients; only product compact | Refutes prose implication | R03 |
| Maximal pro-p quotient | `S₃` at p2,p3 | Kernels C₃,S₃; quotients C₂,1 | Distinguishes quotient from Sylow subgroup | None |
| Pro-p kernel has no p-quotient | `S₃` at p2 | Kernel C₃, its maximal pro-2 quotient1, second kernel all C₃ | Agrees | None |
| Topological generator rank | `1,ℤ_p,C_p²,∏ℕ C_p` | `0,1,2,ℵ₀`; discrete continuous dual dimensions same in pro-p cases | Agrees | None |
| Rank monotonicity needs profinite source | discrete ℚ→usual ℚ | Discrete converging generating sets absent, infimum0; usual ℚ has generating convergent `{1/n!}`, rankℵ₀ | Claimed unrestricted inequality would fail | None |
| Schreier bound and natural subtraction | trivial group; `C₂≤S₃`; discrete `ℤ²≤ℤ³` | `0≤1`; `1≤1+3(2−1)=4`; outside compact scope bound would read `2≤1+0·2=1` | Compactness and junk index tested | None |
| Hopf property | ℤ_p multiplication by unit; shift on `∏ℕ C₂` | Unit map bijective; shift onto with kernel C₂ | Finite generation necessary | None |
| Gaschütz lifting | `C₄→C₂`, n1; `C₂²→C₂`, n1 | Generator lifts to1 or3 in C₄; source C₂² needs2, so second case excluded | Agrees | None |
| Maximal p-subgroups/Frattini | `Q₈` at p2 | Three maximal C₄ subgroups, index2; intersection `{±1}`, quotient C₂² | Nonabelian computation agrees | None |
| Burnside iff | `{i,j}` and `{i}` in Q₈ | Quotient spans dimensions2 and1; generated groups Q₈ and C₄ | Both directions | None |
| Burnside infinite closure | standard coordinate generators in `∏ℕ C_p` | Algebraic span `⊕ℕ C_p` proper; closure full product | Closure requirement essential | None |
| Free profinite/pro-C/pro-p construction | empty set; singleton | Empty gives1; singleton gives ℤ̂ or ℤ_p, p-class/direct p-quotient agree | Agrees | None |
| Free universal property | two generators, target C₂ | Four maps of generators, four continuous homomorphisms | Uniqueness pins zero/identity possibilities | None |
| Presented quotient universal property | `⟨x∣x⁴⟩` to C₂; `⟨x∣x³⟩` to C₂ | First permits2 generator images; second only identity | Relator-killing condition matters | None |
| Infinite discrete free rank | countably infinite S | All functions `S→𝔽_p`: dimension `p^ℵ₀`; not ℵ₀ | Does not silently identify two free objects | None |
| Rank-one identification chain | generator1 | Maps to `1 mod pⁿ`; compatible limit1 in ℤ_p; no product decomposition required | Agrees | None |
| Abelian structure theorem/torsion | `ℤ₂×C₄`; `∏ℕ C₂` | r1, torsion C₄ closed nonopen; product has infinite torsion and is not finitely generated | Finiteness hypothesis matters | None |
| Mathlib cohomology carrier (seeded sample) | trivial group, coefficient 𝔽_p | H⁰=𝔽_p dimension1; H¹=H²=0; native application is `continuousCohomology n X` | Carrier right, displayed syntax wrong | R09 |
| Cup graded commutativity | `C₂` at p2; ℤ₃² | First `a∪a=1=−1`; second diagonal0 and off-diagonal values1,−1 after trace choice | Sign and characteristic distinguished | Fix global normalization witness, R08 |
| Presentations/minimal relation rank | `C_p`; `C_p²`; free rank2 | `(d,r)=(1,1),(2,3),(2,0)` | H¹/H² dimensions agree | None |
| Pushforward extension lift | identity coefficient map; zero coefficient map | Identity preserves class c; zero sends c to0 and lift to split extension has kernel map0 | Both directions of class/lift comparison | None |
| Surjectivity of extension morphism | onto quotient and onto kernel; zero kernel map | First reaches every fibre; C₄→C₂² given by quotient reaches only2 of4 elements | Both hypotheses necessary | None |
| Finite-p projectivity equivalence | ℤ_p; C_p | Every finite p-problem solvable for free source; nonsplit C_p² problem obstructs C_p | Agrees | None |
| Golod–Shafarevich | C_p, C_p², Q₈; trivial group | `1<4`, `4<12`, `4<8`; trivial would give `0<0` false | Nontriviality retained | None |
| Cohomological dimension | `1,ℤ_p,ℤ_p²,C_p` | `0,1,2,∞` | Distinguishes finite torsion and free cases | None |
| Elementary-coefficient test/dévissage | ℤ_p and C_p | H²(ℤ_p,𝔽_p)=0, cd≤1 true; H²(C_p,𝔽_p)=𝔽_p, cd≤1 false | Both directions | None |
| Serre finite-rank theorem | `1,ℤ_p,C_p` | cd0,1,∞; free ranks0,1,not free | Correct equivalence on finite-rank tests | None |
| cd of open subgroups | `pℤ_p≤ℤ_p`; `1≤C_p` | `1=1`; `0≠∞` outside finite-cd hypothesis | Finiteness necessary | None |
| Sylow restriction injectivity | S₃ at p2, degree1; degree0 | H¹(S₃,𝔽₂)→H¹(C₂,𝔽₂) is1→1 isomorphism; constants map identically | Agrees | None |
| Restriction-corestriction index | S₃, 2-Sylow C₂ | Index3 acts as1 mod2, hence injective restriction; Bézout `3−2=1` | Direction/scalar agree | None |
| Sylow cohomological dimension | S₃ at p2,p3,p5 | `∞=∞`, `∞=∞`, `0=0` with Sylows C₂,C₃,1 | Agrees | None |
| Open Nielsen–Schreier | free rank1 indexp; free rank2 index2; rank0 excluded | Ranks1,3; naive rank0 expression would give1 instead of0 | Nonzero rank binder matters | None |
| Demushkin predicate | C₂ at p2; C₃ at p3; ℤ_p²; ℤ_p | H¹/H² `(1,1)` cup square1; `(1,1)` cup square0; `(2,1)` perfect alternating form; `(1,0)` | Correct profinite examples/nonexamples | None |
| Demushkin q | C₂; ℤ_p²; standard D₀ | Torsion orders2,1,2; q values2,0,2 (torsion-free convention0) | q is not raw torsion cardinal at torsion-free case | None |
| Unique canonical character | Demushkin ℤ_p²; free ℤ_p | First χ=1 forced by all prescriptions; free source admits multiple characters | Demushkin hypothesis matters | None |
| Closed dyadic unit families | `1,U^(2),U^[2],V^(2),{±1}` | Square indices1,2,2,4,2; U^[2] cyclic closure of3, V^(2)=ℤ₂ˣ | Distinct family and trivial endpoint | None |
| Unit level uniqueness | U^(2) and U^(3) | 5 belongs to1+4ℤ₂ but not1+8ℤ₂; f2≠f3 | Negative equality control | None |
| D₀ orientation values and relator | `χ(A),χ(S),χ(Y)` | `−1,1,−1/3`; relator value `(-1)²·1⁴·1=1` | Correct, elementary controls | R07 |
| Finite-module Tate duality | ℤ_p², trivial 𝔽_p^m, m0,1,2 | H^j dimensions `(m,2m,m)`; dual target dimensions `(m,2m,m)` | Zero module and both extremes tested | None |
| Infinite Demushkin cd2 | ℤ_p²; C₂ | cd2 and H² dimension1; C₂ cd∞ despite H² dimension1 | Infinite hypothesis essential | None |
| Twisted p^i duality | ℤ_p² trivial χ, M=ℤ/p² | H⁰,H² each orderp²; H¹ orderp⁴; dual target orders identical | Full p-primary coefficients retained | None |
| Finite C₂ sign coefficients | i1,i2 | H⁰ and every positive H^j have order2; H² order2≠4 at i2 | Correctly excluded from infinite duality | None |
| Open Demushkin rank/character | ℤ_p², indexp | `2−2=p(2−2)=0`; restriction of χ=1 stays1 | Agrees | None |
| Finite open-subgroup warning | C₂, U=1 | Generator ranks satisfy `0−2=2(1−2)=−2`, but U has H²=0 and is not Demushkin | Warning's “rank formula fails” is imprecise: failure is Demushkin preservation/undefined n(U) | Correct as part of R08 Checks |
| Recognition by open normal groups | ℤ_p²; free rank2 | First cd2 and every H² dimension1; second cd1 and H²0 | Both predicate directions separated | None |
| Lower p-series/index shift | ℤ₂; C₄ | λk=`2^kℤ₂`; C₄ levels C₄,C₂,1; Labute F₃=λ₂ | Correct 0/1 shift | None |
| Graded square nonadditivity | Q₈, x=i,y=j, p2 | π(i+j)=class(−1); πi+πj=0; bracket=class(−1) | Formula needs bracket correction | None |
| Exact commutator convention | x=(12), y=(23) in S₃ | `[x,y]=(132)`; `[x²,y]=1`; `[x,y]^x[x,y]=(123)(132)=1` | Right-conjugation identities agree | None |
| δ1 needs quadratic cross term | p3, r=[x₁,x₂], w₁=x₁,w₂=x₂ | New commutator coefficient4=1 mod3; change0; linear terms2, cross term1, total0 | Linear-only formula false | None |
| δj p-power term | p2, r=x₁² | Change has `πw₁+[w₁,x₁]`; at odd p coefficient binom(p,2)=0 | Extra term retained | None |
| Two epimorphisms/determinacy | C₂ versus C₂; C₄ versus C₂ | Same quotient sets and identity maps; second pair differs by quotient C₄ | Headline true but absent | R05 |
| Levelwise comparison schema | G=H=ℤ_p, singleton comparison sets | Each level map identity on C_(p^k); inverse-limit map identity, onto | Compatibility/realization yield actual map | None |
| Basis convention B′=PᵀBP | J over 𝔽₃, P=diag(2,1) | B′=2J; entries `(0,2;1,0)`, determinant1 | Direction fixed by column basis convention | None |
| Symplectic normal form | n0 and n2, J | m0 gives empty matrix; m1 gives determinant1 and diagonal0 | Native theorem supplies it | R06 |
| F₂ nonalternating normal form | I₁,I₂ | Determinant1; diagonal evaluation at e₁=1; isotropic (1,1) in I₂ still not alternating | Native theorem distinguishes cases | R06 |
| Relator→cup matrix loses odd-p powers | p3, r=x₁³[x₁,x₂] versus [x₁,x₂] | c₁=1 versus0, but both cup diagonals0 and nonzero skew off-diagonal | No false recovery of all coordinates | None |
| Completed group algebra | Γ=1,C₂,S₃ | ℤ_p; free ℤ_p-modules ranks2,6; last noncommutative since distinct gh,hg | Native carrier retains group multiplication | None |
| Finite cyclic coordinate | p3, C₂ and C₃ | Proposed ranks1≠2 for C₂; corrected p-group ranks3=3 for C₃ | Missing p-group hypothesis | R02 |
| Infinite procyclic coordinate | Γ=ℤ_p, generator1 | T maps γ−1; `1+T` mapsγ | Domain/target and augmentation fixed | None |
| Division iff | ψ=T+2, c=−2; ψ=1; c0,ψ=T | Evaluations0,1,0; divisibility true,false,true | Both directions, zero allowed | None |
| Constant-term valuation after division | c0,φ1 and φ2 | Left valuations0,1; right ∞−∞ in both | False without c≠0 | R01 |
| Factoring is not a basis correction | vector(2,T) in ℤ₂[[T]]² | Coordinate ideal(2,T), residue vector(0,0); no unit coordinate combination | Nonunimodular despite no nonunit common divisor | None |
| Labute module E vs relation module | surface relation [x,y], χ1 | E=F^ab=ℤ_p²; relator class0; full relation class nonzero in R^ab | Correct object distinction | None |
| Right versus left conjugation | semidirect C₇⋊C₃, yxy⁻¹=x² | Native action exponent2; Labute action exponent4, because 2·4=1 mod7 | Inversion, not equality | None |
| Relator belongs to ker character | standard D₀ relation | χ(r)=1, so r∈X; source's printed χ(r)=0 is a misprint | Native convention agrees | Source issue below |
| Procyclic module coefficient | n4, α4, f2, g∞; D₁₆ quotient | Correct `(5+γ)x̄₁` maps4 mod8; `(1+γ)z` maps0; relator maps4 | Correct f-index, wrong g-index excluded | None |
| Procyclic quotient constant term | f2,α4,c−6 | ψ₁(0)=6, v=1; quotient constant1, v=0; ψ₂=0 at g∞ | Basis coordinate remains a unit | None |
| Split dyadic module coefficient | f2,α0,b0 | ψ=1+S; correction φ0; `(1+S)·1+(4+T)·0=1+S` | Branch specialization agrees | None |
| Detector/tail mechanism | procyclic normalized basis, Dᵢ(x_k)=2δik | `Dᵢ(x_k^(2^(j−1)))=2^jδik` on χ-trivial generators; D annihilates commutators in X | Nonzero tails detected | None |
| Split-branch extra commutator detector | f2, χ(x₂)=−1, χ(x₄)=−1/3, D₄(x₄)=2 | `D₄([x₂,x₄])=−12`, v₂=2; its `2^(j−2)` power has valuation j | Extra tail has unit graded detector | None |
| Iterated correction limit | corrections in λj, j→∞ | Mod λk, all corrections with j≥k become1; each finite coordinate stabilizes | Gives compatible limit, not a finite-stage equality | None |
| q≠2 marked normal form | n2, q0; p3,q3 | χ values(1,1); (1,−1/2); equation χ(x₂)(1−q)=1 in both | Includes q0 without dividing by q | None |
| q2 odd finite-level form | D₀, n3,f2 | word A²S⁴(S,Y); χ=(-1,1,−1/3); imageV^(2) | Existing statement covers it | None |
| q2 even finite-level form | n4,α0,f2 | word x₁²[x₁,x₂]x₃⁴[x₃,x₄]; χ=(1,−1,1,−1/3) | ImageV^(2), rank restriction respected | None |
| Rank-two marking/out-of-range index | n2,α4,f3 in general even attempted form | x₄=1 would force `1·(1−8)=1`, i.e. −7=1, false; rank-two theorem instead gives χ(x₂)=−1/5 | n≥4 essential in four-generator clause | None |
| q2 image {±1}, even and odd | n2 word x₁²[x₁,x₂]; n3 word x₁²[x₂,x₃] | Markings(1,−1),(-1,1,1); images both C₂, finite levels inapplicable | Missing whole families | R04 |
| Classification uniqueness / marked relator transport | same n and image; q3 versus q9 at p3 | Identical normalized word gives identity automorphism; images U^(1) vs U^(2) differ so hypotheses fail | No false equality across levels | None |
| Existence numerical criterion | p3,n2,A1; p2,n2,A=V^(2); p2,n4,same A | `9>1` true; `4>4` false; `16>4` true | Rank2 excludes nonprocyclic image correctly | None |
| Existence pro-p hypothesis | p3,n2,A=ℤ₃ˣ | `(A:A³)=3<9`, but A contains order2 | Explicit negative control necessary and present | None |
| Rank-zero existence | n0,A1 | `p⁰=1>1` false; H²(1)=0 | Trivial group excluded | None |
| Odd/rank-one existence | p2,n1,A={±1}; n3,V^(2) | C₂ realizes first; D₀ realizes second; H¹ dimensions1,3 | Rank-one exception separately included | None |
| Pointed free universal property | one-point space; finite pointed three-point space | Free ranks0,2; based maps to C₂ count1,4 | Basepoint killed, not a third generator | None |
| Infinite comparison noninjectivity | S=ℕ,p2; trivial class | Dual dimensions `2^ℵ₀` vs ℵ₀; trivial class dimensions0 vs0 and comparison injective | Class restriction necessary | None |
| Arbitrary-rank Serre/projectivity | free countable converging basis; C_p | cd1 and projective/free; cd∞ and nonprojective/nonfree | True but headline equivalence absent | R05 |
| Closed-subgroup freeness | `pℤ_p≤ℤ_p`; trivial subgroup; free infinite-rank subgroup | cd1,0,≤1 respectively; free ranks1,0,possibly infinite | Must retain arbitrary-rank conclusion | R05 |

All 11 layers were read. Primality excludes `p = 0,1,4` from the classification statements. Natural subtraction, infinite index represented by 0, `padicValNat 2 0`, the empty basis, zero module, infinity in the exponent and out-of-range generators were checked explicitly. No zero ring is admitted as the coefficient field: the coefficients are the native `ZMod p` with primality or `PadicInt p`.

**Headlines and acceptance coverage.** This is the inventory of the README's major results, rather than a count of its API lemmas:

| README headline | Suggested.lean coverage |
|---|---|
| Profinite Sylow existence, containment, uniqueness and images | Present. Conjugacy is a native `#check`, rather than a local acceptance statement. |
| Pro-p kernel, Frattini/Burnside and generator-rank comparisons | Present. |
| Free profinite universal property and rank-one p-adic identification | Present. |
| Finitely generated abelian pro-p structure | Native theorem cited and `#check`ed, no local theorem. |
| Extension-class lifting and its converse/surjectivity | Present. |
| Finite embedding problems versus projectivity | Present. |
| H¹ generator rank and H² relation rank | README proof targets/native citations, not local acceptance theorems. |
| Golod–Shafarevich inequality | Present, with nontrivial finite p-group hypothesis. |
| Elementary coefficient test, free cd≤1, finite-rank Serre | Present. |
| Sylow restriction injectivity and equality of cd | Present. |
| Open Nielsen–Schreier and closed-subgroup cd bound | Present; latter alone does not state arbitrary-rank freeness. |
| Canonical Demushkin character and uniqueness | Present. |
| Finite-module Tate duality and cd2 | α₂ at 𝔽_p and cd2 present; the full α₀/α₁/α₂ and p-primary package is cited to native APIs. |
| Open Demushkin subgroup, rank and character formulas | Present. |
| Dyadic unit subgroup classification | Present; local level-uniqueness theorem states the principal-unit case only. |
| Central-tower comparison and finite-quotient determinacy | README-only; determinacy is statable (R05). |
| Completed-algebra coordinates and bilinear normal forms | Supplied native objects/results; R06 corrects the duplicated bilinear ownership claim. |
| Labute's two module branch results | Present on `labuteE`, with actual action and orientation-image hypotheses. |
| Marked Demushkin normal forms and relator automorphism | Finite-level cases and relator automorphism present; the `{±1}` families are missing (R04). |
| Classification by rank and orientation image, and realization of admissible pairs | README claims the full result; the local marked cases do not cover its full scope. |
| Infinite pointed free comparison | Noninjectivity present, with infinite discrete generating set and the p-group class. |
| Arbitrary-rank Serre and full closed Nielsen–Schreier | No acceptance theorem; native pointed carriers exist (R05). |

R05 gives two direct omissions. Reconcile the other native-only rows with scope: import them by name or state retained headlines fully. The docstring names no missing carrier. There are no substitute predicates or sorry'd constructions.

**Elaboration and form.** The head is the requested `9d07815cc64dafe8e3461d5691f5a72f6c24a1aa`. The worktree was clean before and after review. The outside-folder diff against `origin/main` is empty. The worker's targeted build passed. Independently, `lake env lean` on `TauCetiRoadmap/ProfiniteProPGroups/Suggested.lean` exited 0, without errors or warnings. Its 20 `#check` outputs are informational. All imports resolved; no dependency build or manifest update was needed.

A scratch copy with `#check @name` for **all 123 declarations** exited 0. Types were compared with the README for coefficient universe, primality, compactness, disconnectedness, finite generation, infinitude and image hypotheses: R03 resulted; nothing was edited. Coefficients use the group's universe u; the finite-generator free groups here live in `Type`. The repaired `hq`, `hn`, `hrank` removals persisted. The open-cd theorem has valid broader scope. The worker's failed signature probe was not a target build failure.

The separate scratch probe checked the four missing native headline signatures and ran the three one-tactic controls in R07, as well as the two constant-coefficient calculations for R01; exit 0. There are **zero sorried theorem bodies**, so the requested probe over sorried declarations has an empty domain. There are no admitted examples, sorry'd data, `set_option`, or imports of another roadmap. The surviving control declarations violate the acceptance-test rule despite being proved. A completed proof of a headline is not itself a truth defect; inherited completion status is handled by H01 rather than asking the author to replace sound proofs with admissions.

The worker gate output at this head is:

```text
gate ProfiniteProPGroups: set_option=0 blob=0 latex=0 tex=0 prnum=0 sorry-data=0 sorry-examples=0 residue=0 private-paths=0 imports=0 mathlib-subimports=0 no-import-mathlib=0 lean-lines=0 forbidden=0 dropped=0 readme-ids-missing=0 empty-sections=0 round-labels=0 long-fences=0 layer-ids=0 target-ids=0 depcheck=0 metadata=0 stray-files=0 dirty=0 outside-folder=0 source-material=0 build=0 OK
```

**Pinned declarations and supplier resolution.** The manifest and actual package checkouts agree: Mathlib `6b7abb3c7686292736be2955bd3eb9ebf63b456a`; Tau Ceti `a91d3aafa8cd3e6bc33dfde0d7677ed0f1625039`. The following are decisive source locations opened in the audit (paths within the respective library):

| File and line at the pin | Declaration/content inspected |
|---|---|
| `Mathlib/RepresentationTheory/Homological/ContCohomology/Basic.lean`:131 | `continuousCohomology n A`, homology of homogeneous cochains, object-valued rather than a functor application. |
| `Mathlib/GroupTheory/Nilpotent.lean`:1255,1282 | `Subgroup.isCoatom_iff_index_eq_prime`; `IsPGroup.isNilpotent`. |
| `TauCeti/Topology/Algebra/Group/Profinite/ProP/Basic.lean`:68,85 | `IsProP`, `IsPGroup.isProP`; no compactness or separation in the definition. |
| `TauCeti/Topology/Algebra/Group/Profinite/Demushkin/Basic.lean`:81 | The actual fields of `IsDemushkin`; the section-variable prose is not a substitute for the elaborated type. |
| `TauCeti/RepresentationTheory/Homological/ContCohomology/TrivialFp.lean`:73,81,246 | `trivialFp`, `trivialFpEquiv`, `cohomFp`; ULift and native Mathlib carrier. |
| `TauCeti/Topology/Algebra/Group/LowerCentralSeries/Graded/Basic.lean`:797 | `gradedPow_smul_zero`; the resolver warning is false. |
| `TauCeti/Topology/Algebra/Group/Profinite/FiniteQuotients.lean`:189 | `nonempty_continuousMulEquiv_of_forall_isFiniteContinuousQuotient_iff`; finite generation of G only. |
| `TauCeti/Topology/Algebra/Group/Profinite/Free/Pointed/Serre.lean`:70,89,98,108 | Projective presentation, projectivity/freeness iff, arbitrary-rank Serre implication and equivalence. |
| `TauCeti/Topology/Algebra/Group/Profinite/Demushkin/NormalForm/Marked.lean`:173,319 | Odd/even `{±1}` marked classifications, including their generator bounds and actual native words. |
| `TauCeti/LinearAlgebra/BilinearForm/SymplecticBasis.lean`:301,309 | Symplectic basis and even dimension, without excluding characteristic two. |
| `TauCeti/LinearAlgebra/BilinearForm/Diagonalization.lean`:243,252,264 | Identity matrix form, equivalence by dimension, and the dichotomy; square-scalar hypothesis retained. |
| `TauCeti/NumberTheory/Padics/PowerSeries.lean`:48,59,69 | `X_sub_C_mul_divXSubC_add_C_aeval`, division at a root, and the divisibility iff; c=0 is allowed. |
| `TauCeti/Topology/Algebra/Group/Profinite/Demushkin/Orientation.lean`:54,65,77,89,94,99 | Unit, its coercion, relator value and three generator values underlying R07. |

The “One implementation” table was compared with the alias bodies, including the ten repaired q/relator/word definitions. Object searches covered free/presented groups, Sylow/Frattini/rank, quotient determinacy, relation modules, completed algebras, forms and cohomology in both pins, main including Completed, board packages and indexed open-roadmap matches. No owner was inferred from an unprovided checkout.

The existing owner is `Completed/ProfiniteProPGroups/README.md`, with the same foundational/classification layers and Suggested.lean namespace. This confirms the settled H01 premise. `TauCetiRoadmap/PadicMeasuresIwasawaAlgebras/README.md`:23,97–99,291 imports this completed-algebra foundation and builds measures/comparisons on it. It is not an alternative owner of a new basic algebra here. Board package matches likewise consume the native completed algebra rather than replacing it. The provided ProfiniteArithmetic head was read: its scope assigns ℤ̂ as a ring, profinite powers and continuous Aut/Out there; its lower-central ℤ_p-Lie construction is distinguished from the lower p-series used here. The supplied LocalFieldsRamification and BelyiMaps references are downstream uses, not prerequisites. No upward edge was introduced by treating those consumers as suppliers.

For continuous cohomology I resolved the **main-branch** ProfiniteCohomology contract, not its open revision. Its named layers cover coefficient objects and restriction (1), explicit low-degree cohomology (2–3), long exact/five-term sequences (5), closed-subgroup coinduction/Shapiro (7), corestriction/descent (10), dimensions (11), and cup products (12). The eight resolver leads all resolve:

| Flagged name | Resolved location |
|---|---|
| `ProfiniteCohomology.ofDiscreteModuleRes` | `TauCetiRoadmap/ProfiniteCohomology/Suggested.lean`:752; README:209. |
| `ProfiniteCohomology.corestriction_comp_res` | Same Suggested.lean:2350; README:221,1647. |
| `ProfiniteCohomology.exists_openSubgroup_res_eq_zero_of_res_eq_zero` | Same Suggested.lean:2378; README:222,1659. |
| `ProfiniteCohomology.cd_p_le_iff_finite_pPrimary` | Same Suggested.lean:3094; README:1847. |
| `ProfiniteCohomology.cd_p_le_iff_boundedExponent` | Same Suggested.lean:3108; README:1844. |
| `ProfiniteCohomology.cd_p_le_of_isClosed` | Same Suggested.lean:3123; README:1861. |
| `ProfiniteCohomology.cd_p_eq_of_index_not_dvd` | Same Suggested.lean:3130; README:1864. |
| `TauCeti.gradedPow_smul_zero` | Pinned `TauCeti/Topology/Algebra/Group/LowerCentralSeries/Graded/Basic.lean`:797. |

The main supplier's `cd_p` at Suggested.lean:3015 aliases `TauCeti.cohomologicalDimensionAt.{u}`. Its private adapter at line 323 explains R09. Main is an allowed supplier; its later open revision is not consumed. Every `Needs` line was read. No undeclared supplier gap was found; the nonexistent local Layer 11 is R08. The mandated dependency command was run twice without edits; its final output is:

```text
depcheck: 162 roadmaps, 1169 edges, 0 problem(s)
```

There was no UPWARD, CYCLE or `moved:` line. The earlier native foundations and main cohomology contract suffice for the cited routes; arithmetic consumers are excluded. The algebraic proofs of completed-algebra coordinates, basis modification and successive approximation are mathematical constructions, not a computational-algorithm deliverable. No copied source passage or suspicious instruction was found in the reviewable files.

**Seeded source checks.** There are no README locators explicitly labelled “unverified”. The prose samples were checked against the native definitions and main supplier. The “Theorem” sample was checked against the following primary-source locators:

| Locator checked | Source witness and assessment |
|---|---|
| Labute definition/conventions, p.106 | `labute1967` lines 7–37: profinite pro-p context, finite H¹, one-dimensional H², nondegenerate cup, closed commutators and q convention. R03 concerns the Lean predicate's wider domain, not Labute's definition. |
| Labute Theorem 1 and Remark 2, p.107 | `labute1967` lines 56–76: even dyadic families, bounds on N and f, and admissible closed pro-p unit images. The numerical tests above reproduce the rank-two exclusion and rank-one exception. |
| Labute Theorem 2, p.107 | `labute1967` lines 80–82: both relators in Fᵖ(F,F), Demushkin quotients and equal character image give a free-group automorphism carrying one relator to the other. |
| Labute Propositions 1–3, pp.112–113; Proposition 5, p.116 | `labute1967` lines 273–317,432 onward: filtered power/bracket calculus, relator/cup coefficients and the span argument. The dyadic degree-zero and δ₁ corrections are retained; no claim that the odd-p cup matrix determines p-power coordinates is made. |
| Labute Theorem 3, p.117 | `labute1967` line 478 onward: preliminary normal forms with p-adic exponent and infinite-level convention, preceding the orientation-image refinements. |
| Labute Proposition 6, p.119; Theorem 4, p.120 | `labute1967` lines 527–538,557–568: prescription/lifting equivalences in the stated pro-p context, then the unique Demushkin character. Free groups have prescription properties but do not get character uniqueness from this theorem. |
| Labute §4 definition and division, pp.121–122 | `labute1967` lines 622–668: E is the abelianization of kerχ, with right conjugation; evaluation/division uses a topologically nilpotent parameter. The source explicitly separates c=0. |
| Labute Theorem 5 and proof, pp.123–126 | `labute1967` lines 673–817: procyclic branch, quotient constant terms, correction map, detector and successive basis corrections. The f-indexed coefficient, not the third-generator exponent, is essential. |
| Labute Theorem 6 and proof, pp.128–130, with preparation pp.126–128 | `labute1967` lines 818–950: split image, group-ring coefficient S, division correction and the extra commutator tail. The generator-value misprint below must not be copied. |
| Serre §§9.1–9.3, pp.154–155 | `serre1963bourbaki` lines 282–326: infinite Demushkin hypothesis, all finite modules killed by p, co-effacement before cd2, open subgroups, Euler rank, and finite-primary duality. This supports the expanded proof route, not a shortcut from only the trivial module. |

Labute was obtained through the sources service from the [publisher's article](https://doi.org/10.4153/CJM-1967-007-8); Serre from the [Numdam archive](https://www.numdam.org/item/SB_1962-1964__8__145_0/). Both extractions were read with page markers. The suspected Labute typos were additionally checked against rendered printed pages 120,123,128, so the errata below are not OCR guesses. No source text was copied into the worktree or report.

## Not verifiable

- **NSW, second edition (`nsw2e`).** Title resolution and the author-hosted NSW2.3 PDF address did not yield a readable book: the latter returned an HTML index. Thus the exact theorem/page matches for the README's I/III locators, especially (3.9.13), the sharpened recognition criteria in (3.9.15), and the assertion about the second even form on p.417 remain uncertified. They were not guessed from the title or from Labute. This unresolved text is recorded in the scratch missing-reference list. Labute independently verifies the classification portions identified above.
- **Ribes–Zalesskii (`ribes_zalesskii`), Serre's Galois Cohomology (`serre_galois`), Koch (`koch`), Washington (`washington`), Fried–Jarden (`fried_jarden`), and Dixon–Formanek–Poland–Ribes (`dixon_formanek_poland_ribes`).** Each was requested through the sources service; each returned `uncertified` rather than legal readable full text. Their stated locators are retained as uncertified, not declared incorrect. The pinned results and explicit counterexamples were checked independently. No renewed access request is made for those settled paywalled outcomes.
- **Archive destination and source manifest.** These are the settled H01/H07 matters described above, not additional findings and not actions this read-only review can perform. No review conclusion should be read as permission to merge duplicate namespaces.
- Ownership against open work was checked through the provided/indexed texts and inspected matches, not by searching for additional unprovided pull-request checkouts. No correctness claim is made about those unavailable heads.

## Source issues

- **Misprint** in labute1967 at Theorem 4 proof, printed page 120 (`labute1967` line 569): the source says the multiplicative character sends the relator to zero; it should be one, the identity of the unit group; affects the proof.
- **Misprint** in labute1967 at §4.1 evaluation of ψ₂, printed page 123 (`labute1967` line 677): the source says the exponential base after substituting T is −2−2^f; it should be −1−2^f, since the base before substitution is 1+T; affects the proof.
- **Misprint** in labute1967 at Theorem 6 proof, printed page 128 (`labute1967` line 880): the source says χ(x₃)=(1−2^f)⁻¹ and χ(x₄)=1; it should be χ(x₃)=1 and χ(x₄)=(1−2^f)⁻¹, as in the preceding basis normalization; affects the proof.
