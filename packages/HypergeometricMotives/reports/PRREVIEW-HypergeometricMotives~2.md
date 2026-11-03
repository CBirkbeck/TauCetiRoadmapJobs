# Review of HypergeometricMotives (pull request #1716 at 08f6be1)

**Verdict:** needs changes

The gate passes, but the mathematical and ownership checks below block acceptance. This is a full review of both files at the stated head. No pull-request file was changed.

The preceding review's findings were checked first. Locations in this table are in `TauCetiRoadmap/HypergeometricMotives/`.

| Previous finding | Current passage and disposition |
|---|---|
| R01, repeated parameters | README:135: “at the c consecutive heights”; Suggested.lean:319–322 implements a block of consecutive heights. Repaired: Legendre gives [0,1], not [1,1]. |
| R02, zero in shift | Suggested.lean:669: “(ht : t ≠ 0)”. Repaired; the zero counterexample is excluded. |
| R03, Hasse–Davenport supplier | README:227: “7.29, the Hasse–Davenport product relation”. Repaired; that section exists on main and states the product relation, including its characteristic-two proof obligation. |
| R04, missing Ono headline | Suggested.lean:933: “theorem legendre_point_count”. Repaired; quantified over odd finite fields, not just the displayed primes. |
| R05, exponent zero | Suggested.lean:820: “(hf : 0 < f)”. Repaired. |
| R06, purity and integrality | Suggested.lean:854–856 carries “(ht : t ≠ 0)” and “(hp : D.IsGood t p)”. Repaired. |
| R07, duplicate discriminant | README:1548 uses “Polynomial.discr”; the second polynomial-discriminant definition is gone. Repaired. |
| R08, Qian attribution | README:859: “the field form is this roadmap's generalisation”. Substantively repaired; the module's shorter citation should also distinguish this generalization. |
| R09, signature convention | README:1529: “σ_RRV = (−1)^{w/2} σ”. Repaired; w=2, σ=2 gives (h⁺,h⁻)=(4,2). |
| R10, module warning | Suggested.lean:1: “module”. Repaired; fresh elaboration emits only sorry warnings and the recorded targeted-build gate passes. |
| R11, house shape | README:145: “## Exact supplier contracts”, and numbered layers now have individual Needs lines. Partly repaired: Layer 2 still has no ending Examples/Dependencies; definition APIs and Checks remain incomplete (R16). |
| R12, completed links | README:254,280 use “../../Completed/”. Repaired; both destinations resolve. |
| R13, API catalogue | Suggested.lean:12: “Every API fact, Check and worked value is in README.md only.” Partly repaired: the file is much smaller, but three admitted degree bridges remain direct library applications (R15). |
| R14, empty height extrema | Suggested.lean:340: “(hd : 0 < P.degree)”. Repaired in that theorem; other README statements still mishandle degree zero (R04). |
| R15, Greene sign | Suggested.lean:703: “(ω ^ (∑ j, b j)) (-1)”. Repaired; the factor is determined, not an existential sign. |

## R01 (P1) — The geometric inputs have no owner

**Location:** `TauCetiRoadmap/HypergeometricMotives/README.md:1790`, “pure of weight w after a Tate twist”, together with :1807, “Needs: none; this is a citation”, and the exclusions at :69–92.

**Claim:** The motive, its trace identification, purity, Hodge realization, signature and wild local invariants can be cited instead of developed or supplied, while the roadmap delivers the corresponding arithmetic library.

**Witness:** `TauCetiRoadmap/MotivesAndAlgebraicCycles/README.md:247,369` supplies Chow motives and realization functors, not this hypergeometric projector or trace theorem. At Legendre t=2, p=5, the required realization must give trace −2 and dimension 2; no owned target supplies that identification.

**Repair:** Make the hypergeometric construction and comparison a target here, consuming the existing general categories and cohomology theories by exact section. Supply the trace, Hodge, duality and local-invariant interfaces, or declare precise named supplier gaps in the permitted format. Keep nonstatable headlines in the Lean docstring until the carriers exist. A citation alone and conditional IsPure consequences do not close this dependency. Validate the construction against trace −2, polynomial 1+2T+5T², Hodge vector (1,1), and also its ramified local factors; do not restrict the library to good primes.

## R02 (P1) — Both displayed reciprocity inputs are false when A contains 1

**Location:** `TauCetiRoadmap/HypergeometricMotives/README.md:430`, “Polynomial.reverse Φ_A = Φ_A”, and :435, “Φ_A(1) = ∏_{a ∈ A, a ≥ 2} Φ_a(1)”.

**Claim:** Both identities hold for every cyclotomic datum.

**Witness:** A=[1], B=[2] is allowed. Φ_A=X−1 has reverse 1−X, and Φ_A(1)=0, whereas the displayed product is the empty product 1.

**Repair:** State reverse Φ_A=(−1)^m_A Φ_A. State evaluation as zero if 1∈A and as the displayed product otherwise. The repaired formulas give −(X−1)=1−X and 0 on this datum; A=[2] gives X+1 and 2. Keep both as negative-control Checks.

## R03 (P1) — The p-part is a projection, not a subset of the original classes

**Location:** `TauCetiRoadmap/HypergeometricMotives/README.md:468`, “consists of the p-power order classes of α ∪ β”.

**Claim:** Selecting the original classes of p-power order describes the defined p-part.

**Witness:** A=[6], B=[3], p=2: none of 1/6,5/6,1/3,2/3 has 2-power order. The stated construction instead gives A₂=[2,2], B₂=[1,1], hence two copies each of 1/2 and 0.

**Repair:** Apply the p-primary-component projection on the finite torsion group, then cancel, retaining multiplicities φ(v). The two sixth-order classes both project to 1/2 and the third-order classes to 0. Also correct §3.10's reading: reduction of cyclotomic polynomials uses the **uncancelled prime-to-p projections**, with multiplicities, not the p-part. For the same datum modulo 2, Φ₆ and Φ₃ both become X²+X+1. The LMFDB p-part definition supports the construction, not the asserted subset description (`lmfdb-hgm`, defining_parameter_ppart, line 92).

## R04 (P1) — Positive-degree and index bounds are missing from several prose statements

**Location:** `TauCetiRoadmap/HypergeometricMotives/README.md:512`, “its rotation number is 1”; :634, positivity of the Hodge entries; :670, Hodge symmetry; :819, the rank-one assertion.

**Claim:** These statements apply to the carrier's empty datum, and symmetry applies to every natural index.

**Witness:** The empty datum has γ=0, rotation number 0, primitive datum empty, h₀=0, and rank(h₁−1)=0. For Legendre, w=1 and p=2 give h₂=0 but h_(1−2)=h₀=1 using natural subtraction.

**Repair:** Retain the empty carrier, but put d>0 on primitive rotation=1, positivity on the supported Hodge interval, and rank-one/reflection assertions. Specify 0≤p≤w for symmetry, as Suggested.lean:347 already does, or use integer indices with zero extension. Give empty-case laws separately. These repairs produce rotation 0, rank 0 and h₀=0 for the empty datum, and h₀=h₁=1 for Legendre without asserting 0=1.

## R05 (P1) — Levelt's converse fails in dimension one

**Location:** `TauCetiRoadmap/HypergeometricMotives/README.md:869`, “stabilizes a nonzero proper subspace of K̄^d”.

**Claim:** A common root of p and q implies reducibility for d≥1.

**Witness:** Take d=1 and p=q=X−1. Both companions are (1); the only subspaces of K̄ are 0 and K̄. There is no nonzero proper invariant subspace.

**Repair:** State the common-root converse for d≥2 and retain the dimension-one case separately. The kernel of evaluation at a common root has dimension d−1 and is stable under both companions; it works for d≥2. Also fix the proof's matrix order at :878: Y=Xg₁ implies X−Y=X(1−g₁). For Legendre, X−Y=[[0,0],[0,−4]], whereas (1−g₁)X=[[-4,8],[0,0]]. The corrected product gives [[0,0],[0,−4]].

## R06 (P1) — A symplectic bilinear form is confused with a Hermitian form

**Location:** `TauCetiRoadmap/HypergeometricMotives/README.md:897`, “entries in ℚ(ζ_N), and real symmetric when the type is orthogonal, alternating when symplectic”.

**Claim:** The nondegenerate Hermitian matrix can have those properties over the stated field.

**Witness:** Legendre has N=2, hence ℚ(ζ_N)=ℚ. Invariance of a symmetric matrix [[a,b],[b,c]] under C((X+1)²) and C((X−1)²) forces c=a and b=−a=a, hence the zero matrix.

**Repair:** Separate the rational invariant **bilinear** form B from the complex Hermitian form. In the symplectic case B can be alternating, while iB is Hermitian; the latter may require adjoining i. Here B=[[0,1],[-1,0]], det B=1, and iB has eigenvalues ±1 and determinant −1. Both companions preserve B, and the Hermitian signature is (1,1). Do not claim that the same real matrix is both nonzero alternating and Hermitian. Beukers–Heckman's construction explicitly makes this distinction (`beukersheckman1989` lines 323–350, Theorem 4.3, pp.333–334).

## R07 (P1) — The Lean Katz comparison permits a non-generating character

**Location:** `TauCetiRoadmap/HypergeometricMotives/Suggested.lean:650`, “theorem katzExpSum_eq (ω : MulChar F ℂ)”.

**Claim:** The character expansion equals the torus sum for an arbitrary ω.

**Witness:** Over F₃ take ω trivial, ψ(x)=exp(2πix/3), a=[0], b=[1], t=2. The torus sum is ψ(2)+ψ(1)=−1; the displayed right side is 1.

**Repair:** Add `(hω : orderOf ω = qm F)` to this declaration and state the same hypothesis locally in §4.2–4.3. This is required by character orthogonality. On the same field with the quadratic generator, both sides become i√3. This is an absent hypothesis, not one of the worker's nine dropped-binder warnings.

## R08 (P1) — The Landau integrality target includes t=0

**Location:** `TauCetiRoadmap/HypergeometricMotives/README.md:1238`, “q^{λ} H_q(α, β | t) is an algebraic integer”.

**Claim:** The bound holds on the domain of H_q introduced in §4.3, which includes zero.

**Witness:** Legendre at q=5 has λ=0. At t=0 the m=0 term gives H₅=1/(1−5)=−1/4, which is not an algebraic integer.

**Repair:** Require t∈F_qˣ, as the source's torus setting does, while retaining the total sum and its exceptional zero value. At t=2 the same datum gives −2∈ℤ. Correct the endpoint Check at :1247 as well: for A2.2_B4 the values at x=1/4 and 3/4 are 0 and −1, not 1 and 0. The open-interval values remain 0,1,−1,0 and the minimum remains −1.

## R09 (P1) — The bad-prime containment is false at t=1

**Location:** `TauCetiRoadmap/HypergeometricMotives/README.md:1428`, “contains … the primes dividing the numerator or denominator of t or t − 1”.

**Claim:** This containment and finiteness hold for every nonzero t.

**Witness:** At Legendre t=1, the conventions make every odd prime good. But numerator(t−1)=0, and every prime, including 5, divides 0. The claimed finite set would contain all primes.

**Repair:** Put t≠1 on the divisor characterization, and give the special-point classification separately. At t=1 the defined bad set is {2}; at t=2 it is {2}; at t=−3 it is {2,3}. Do not silently discard the special fibre from the carrier.

## R10 (P1) — The proposed real-valued Newton polygon need not exist on [0,d]

**Location:** `TauCetiRoadmap/HypergeometricMotives/README.md:1442`, “NP_p(D, t) : ℕ → ℝ … evaluated … 0 ≤ k ≤ d”.

**Claim:** The coefficient polygon has finite real height throughout that interval before purity or full degree is assumed.

**Witness:** D=([1],[2]), t=1, p=5 has d=1 but H_(5^e)(t)=0 and F=1. The only coefficient point is (0,0); supporting affine functions take unbounded values at k=1.

**Repair:** Consume `TauCetiRoadmap/NewtonPolygons/README.md:512`, §2.1, and its extended-height/domain conventions; consume §0.6 for the slope polygon in §2.9. Specialize those objects instead of rebuilding them. Compare finite heights on [0,d] only after a full-degree hypothesis, or explicitly use extended heights outside the actual coefficient domain. The example then has height 0 at 0 and no finite height at 1; Legendre t=2 still has heights 0,0,1.

## R11 (P1) — Semisimple Frobenius need not be a unit modulo ℓ

**Location:** `TauCetiRoadmap/HypergeometricMotives/README.md:1626`, “the order of X in the unit group”.

**Claim:** F(0)=1 suffices to put X in the unit group of the reduced reciprocal-polynomial quotient for every prime ℓ.

**Witness:** F=1+2T+5T², ℓ=5 gives reverse F=X(X+2). Its reduced algebra is F₅×F₅, and X corresponds to (0,3), a non-unit.

**Repair:** Define the semisimple action for every ℓ and distinguish its zero-eigenvalue part. Define a unit-group order for the whole action only when ℓ does not divide F's leading coefficient, or explicitly define the order of its invertible part and record the zero part separately. For this example the invertible part has order 4 and the zero part dimension 1; at ℓ=2,3 the original unit orders remain 1,8. This retains the bad-characteristic case rather than claiming invertibility there.

## R12 (P1) — The toric point-count target changes the source variety

**Location:** `TauCetiRoadmap/HypergeometricMotives/README.md:1778`, “V_t : ∑ x_i = ∑ y_j, t ∏ x_i = ∏ y_j”.

**Claim:** This is Beukers–Cohen–Mellit (1.1) restricted to the torus, with its stated correction term.

**Witness:** For γ=[3,−1,−1,−1], q=5, t=1, the written affine equations have 18 torus points. The source's weighted equation x³=y₁y₂y₃ has 24 affine lifts, hence 6 projective torus points; its smooth completion has 9 points.

**Repair:** Use the weighted homogeneous equation t∏x_i^{p_i}=∏y_j^{q_j} in the projective torus, and give the exact formula and hypotheses of Proposition 4.3, including gcd(p_i,q_j)=1. Supply the nonprimitive case through the Kummer decomposition. Do not transfer the smooth-completion term P_rs to the open torus. On this example Proposition 4.3 must return 6; Theorem 1.5 returns 9. The corrected finite-tuple/projective-orbit count is statable at the pins and should have its own acceptance signature. Source: `bcm2015` lines 147–170 and 610–632, (1.1), Theorem 1.5 and Proposition 4.3, pp.3–4,13–14.

## R13 (P1) — The L-function card lacks bad Euler factors and wrongly forces no poles

**Location:** `TauCetiRoadmap/HypergeometricMotives/README.md:1666`, “(frobeniusPolynomial D t p)_{p good}”, and :1671, “a root number ε ∈ {±1} as a parameter, and no poles”.

**Claim:** These inputs determine the full LMFDB coefficient sequence and its pole data.

**Witness:** The roadmap's Legendre t=−3 example has F₃=1−T, so a₃=1; a product over good primes gives a₃=0. For D=([1],[2]), t=9/8, the rank-one quadratic character is trivial since t(t−1)=9/64.

**Repair:** Supply tame and wild Euler factors, not only their degrees/conductor exponents, through the owned realization and exact local contracts. Then use the existing Euler-product carrier on **all** prime powers. Retain the polar divisor and determine it from Tate/trivial constituents instead of forcing it empty. The first example must recover a₃=1. The second gives ζ(s), whose completed card has simple poles at 0 and 1, exactly as `TauCetiRoadmap/LFunctions/README.md:405` records. An arbitrary parameter for a root number does not fill either missing datum.

## R14 (P2) — The cubic polynomial root-count headline is statable but absent

**Location:** `TauCetiRoadmap/HypergeometricMotives/README.md:1755`, “Prove also Corollary 1.6, the zero count”.

**Claim:** The finished library proves N_f(t)=1+H_q(1/3,2/3;1,1/2 | t).

**Witness:** Suggested.lean:950 states the elliptic cubic count (Corollary 1.7), not the root count. A finite-field subtype {x : F // x³+3x²−4t=0}, cardinality and the existing frobeniusSum require no missing carrier.

**Repair:** Add the general Corollary 1.6 signature for card F coprime to 6 and t≠0,1, using the datum ([3],[1,2]); leave its proof sorry. A scratch copy adding precisely this simple datum and general signature elaborates with only sorry warnings. At F₁₁,t=6 the root count is 3 and H=2, so 3=1+2; at F₅,t=2 they are 0 and −1. These also prevent confusing this datum with ([3],[1,1]).

## R15 (P3) — Degree bridges and the rank-one Check are acceptance-test padding

**Location:** `TauCetiRoadmap/HypergeometricMotives/Suggested.lean:152,468,470,959`: “natDegree_PhiB”, “natDegree_qInf”, “natDegree_qZero”, “hypergeometricSum_degree_one”.

**Claim:** These belong among the roadmap’s deep acceptance theorems. The first three are elementary degree bridges; the fourth is exactly the rank-one Check in README:1130–1132.

**Witness:** On a scratch copy, all three close with one outer simpa using the pinned product-degree lemmas; the copy elaborates with 44 remaining sorry warnings instead of 47.

**Repair:** Delete all four from Suggested.lean. Keep the rank-one identity as the README Check, and keep the degree facts in the README and inline the needed library degree proofs in the few definitions that use them. The identities remain 2=2 for Legendre and 0=0 for empty products. The relevant declarations are `Mathlib/Algebra/Polynomial/BigOperators.lean:204,329`, `natDegree_multiset_prod_of_monic` and `natDegree_multiset_prod_X_sub_C_eq_card`, with `natDegree_cyclotomic` and the datum's equal-degree field.

## R16 (P3) — Definition APIs and discriminating Checks are still incomplete

**Location:** `TauCetiRoadmap/HypergeometricMotives/README.md:753`, “Define the Hodge polygon”, followed at :771 by “Needs”; the next heading is Layer 3. Also §4.1 at :1065 and §6.3 at :1775.

**Claim:** Each definition/layer has the required API, at least three discriminating Checks and closing examples/dependencies.

**Witness:** Layer 2 has no final Examples or Dependencies. §6.3 has no Checks; several definitions give API claims only inside an undifferentiated paragraph. Some mathematical targets have only a knowl or broad section citation without a local theorem/page locator.

**Repair:** Complete the required structure without adding Lean padding: explicit API bullets, three genuinely separating Checks for every definition, and ending Examples/Dependencies for Layer 2. For the corrected torus, the counts 6 versus 9 versus 18 above distinguish projective torus, completion and the wrong equation; add small-characteristic and nonprimitive instances as well. Attach exact locators to each theorem and identify original deductions as such. In §4.6 spell out the H_q normalizing quotient as K_old/K_shifted; the source prints its inverse.

## Verified sound

“Pass” below means that the stated instance agrees, not that a finite test proves the theorem. All 61 numbered README sections were read, together with all 138 elaborated declarations. The mathematical table covers each numbered target, the sampled sources and the Lean headline families; separate rows below record each of the 47 admitted declarations. Counterexamples remain in the table rather than being counted as sound.

**Gate and signatures.** The worker's gate on this exact head reports every scanner and the targeted build successful:

`gate HypergeometricMotives: set_option=0 blob=0 latex=0 tex=0 prnum=0 sorry-data=0 sorry-examples=0 residue=0 private-paths=0 imports=0 mathlib-subimports=0 no-import-mathlib=0 lean-lines=0 forbidden=0 dropped=0 readme-ids-missing=0 empty-sections=0 round-labels=0 long-fences=0 layer-ids=0 target-ids=0 depcheck=0 metadata=0 stray-files=0 dirty=0 outside-folder=0 source-material=0 build=0 OK`

The independently rerun dependency check returned:

`depcheck: 204 roadmaps, 1615 edges, 0 problem(s)`

There is no UPWARD, CYCLE or moved line. The outside-folder diff is empty, the worktree was clean, and its HEAD matches the requested hash. A fresh `lake env lean` elaboration of the target succeeds with exactly 47 sorry warnings. A separate scratch copy with `#check @name` for all 138 declarations also elaborates. The nine reported binder leads are in noncomputable definitions whose types do not need those particular Field/Fintype/DecidableEq arguments; none loses a mathematical hypothesis needed by its operation. The missing generator hypothesis in R07 is independently visible in the full elaborated signature.

The one-tactic pass tried `simp` on every admitted theorem, with a sorry fallback preserving later elaboration: none closed automatically. A second copy verified the three specific library applications in R15, reducing the remaining sorry warnings to 44 with no errors. Definitions with epsilon have real predicate bodies, not sorry data; their existence/specification targets were examined. No theorem contains an arbitrary Prop stand-in, no set_option occurs, and the sole import is Mathlib.

**Computed instances.** The combinatorial script enumerated 876 ordered, nonempty disjoint cyclotomic pairs with entries at most 10, at most three entries per side and degree at most 6. All eight checked laws passed: block heights, height range/weight, sum of Hodge entries, palindromy, swap, first parity, second parity and twist parity. This is a fresh bounded test, not a certification of the README's larger claimed enumerations.

Prime-field point counts are exact enumerations. Gauss sums were independently evaluated using roots of unity, and extension fields were built from explicitly tested irreducible polynomials. Their complex floating-point evaluations are numerical evidence, not exact proofs. Dwork traces through p⁴ gave nearest integers with error below 10⁻⁸; the degree-eight example's scaled traces had error below 2×10⁻⁸. The coefficient recurrence was then evaluated in exact rational arithmetic. Polynomial, matrix, fractional-part and multiset checks below are exact.

Abbreviations in the table: L=([2,2],[1,1]); D4=([2,2,2,2],[1,1,1,1]); T=([2,2],[4]); I=([4],[2,1]); E8=([6,4,4,3],[12,2,2,2,1]). “No change” applies only to the displayed instance.

| Statement | Instances tried | Computed values on the two sides / wrong-model control | Result and change |
|---|---|---|---|
| 1.1 parameter pair, representatives, denominator, actions | ({1/2},{0}); shared or unequal multisets; I | d=1, rep(0)=1, rep0(0)=0; shared/unequal pairs fail; I has orders 4,4,2,1 and N=4; shifting twice by 1/2 returns I | Pass; wrong representative interval changes the zero position |
| 1.2 cyclotomic datum, Φ, degrees, multiplicity | L; empty; ([2],[1,1]) | Φ_A=(X+1)², Φ_B=(X−1)², degrees 2=2, m_A=0,m_B=2; empty gives 1,1 and 0=0; unequal totient sums 1≠2 reject the third | Pass |
| 1.3 dictionary and Galois stability | I; α={1/4},β={0} | I maps to {1/4,3/4}/{1/2,1}; multiplication by 3 permutes it; singleton 1/4 maps to 3/4≠1/4 | Pass; rationality needs stability |
| 1.4 γ, M, uniqueness and Pochhammer | L, n=0,1,2; T | γ_L(1)=−4,γ_L(2)=2; Q=((X²−1)²)/(X−1)⁴; M=16; Pochhammer ratios 1,1/4,9/64 equal (2n)!²/(16ⁿ n!⁴); M_T=1/4 | Pass |
| 1.5 reciprocity/evaluation | ([1],[2]); ([2],[1]) | 1−X versus X−1; 0 versus 1; second datum reverse X+1=X+1, eval=2 | Fail R02 |
| 1.6 wild primes | L; E8; empty | primes {2}, {2,3}, ∅; prime divisors of N and nonzero γ indices give the same sets | Pass |
| 1.7 p-parts and prime-to-p parts | ([18,12],[8,3,2,1,1,1]), p=2,3; ([6],[3]), p=2 | p=2: A₂=[4,4,2⁵], B₂=[8,1⁵], C₂=[2]; p=3: A₃=[9,3], B₃=[1⁸], C₃=[3]; filtering original classes in last example gives ∅ but construction gives {1/2,1/2}/{0,0} | Construction passes; interpretation fails R03 |
| 1.8 rotation | I; L; empty | stabilizer {0,1/2} has size 2=gcd(2,4); L size1=gcd(1,2); empty stabilizer infinite, Nat.card=0=gcd(empty) | Pass; empty is not primitive |
| 1.9 primitive datum | I; ([9],[3,3,1,1]); empty | γ divided by 2 gives ([2],[1]), degree1=2/2; division by3 gives ([3],[1,1]), degree2=6/3; empty rotation0≠1 | Fail only universal rotation claim, R04 |
| 1.10 interlacing | I; L; empty | Z_I takes {0,1}; Z_L takes {0,2}; empty Z={0}; interlacing true,false,true | Pass |
| 1.11 t and cusp convention | L at t=−3,1/3,4,1 with p=3 | valuations (1,0),(−1,−1),(0,1),(0,0) for (t,t−1); cusps zero,inf,one,none | Pass; t=1 must remain separate |
| 1.12 data swap | L and T | M_L M_swap=16·1/16=1; γ_swap=−γ; T has δ=1 on both sides; applying swap twice returns original multisets | Pass |
| 2.1 Z and repeated heights | L; D4; E8 | heights [0,1], [0,1,2,3], [−2,−1,−1,0,0,1,1,2]; collapsed-height alternatives give [1,1], [3,3,3,3] | Pass; previous R01 repaired |
| 2.2 weight, Hodge vector, support | L,T,E8,empty | (w,h)=(1,[1,1]),(1,[1,1]),(4,[1,2,2,2,1]),(0,[0]); sums2,2,8,0 equal degrees; last entry0 is not positive | R04 for empty positivity |
| 2.3 sorted-height agreement | repeated L and D4 | block formula Z(a)−1−j gives [1,0] and [3,2,1,0], sorting gives the walk heights above | Pass |
| 2.4 symmetry | L at p=0,1,2; E8 | L:1=1,1=1, but 0≠1 at p=2 with natural subtraction; E8:[1,2,2,2,1] equals its reverse | R04 for domain |
| 2.5 first parity and twist | L,T,([1],[2]),empty | 2δ+m_A+m_B=w+1 gives 2=2,2=2,1=1; empty gives0≠1 and is excluded by Lean's hd; T has δ=1=−minHeight | Pass with positive-degree hypothesis |
| 2.6 second parity and type | L; degree9 ([10,6,3,2],[14,1,1,1]); ([1],[2]) | (w,d)=(1,2),(4,9),(0,1); odd w implies even d; types symplectic,orthogonal,orthogonal | Pass |
| 2.7 swap/scaling | α={1/10,1/5,1/2}, β={3/10,3/5,7/10}; E8 | h=[1,2], swapped=[2,1]; E8 h=[1,2,2,2,1] on both sides | Pass |
| 2.8 interlace iff w=0 | I; L; A30_B5.3.2.1 | (true,0),(false,1),(true,0); last h=[8] | Pass; positive-degree condition retained |
| 2.9 Hodge polygon and special vector | D4; h=[1,2,3,2,1]; h=[8] | endpoints(4,6)=(d,wd/2),(9,18),(8,0); special vectors[1,0,0,1],[1,2,2,2,1],[7], sums2=4−2,8=9−1,7=8−1 | Values pass; reuse NewtonPolygons, R10 |
| 3.1 companion and rank formula | f=(X−1)², k=1,2 in ℚ; k=0; F₂,k=2 | ranks1,1=2−1; k=0 gives0≠1; in F₂ C(f)²=1 so0≠1 | Pass with CharZero and k>0 |
| 3.2 Levelt triple | L; empty | X=[[0,−1],[1,−2]], Y=[[0,−1],[1,2]], h₁=X⁻¹Y=[[1,4],[0,1]], Xh₁Y⁻¹=1; ranks1 versus empty0 | R04 for unconditional rank1 |
| 3.3 determinants | L; ([2],[1]); empty | det(h∞,h₁,h₀)=(1,1,1),(−1,−1,1),(1,1,1); products1; empty cannot be a rank-one reflection | Parities pass, R04 |
| 3.4 rigidity/irreducibility/converse | L; rank1 p=q=X−1; F₂ p=X,q=X+1 | L conjugator identity and common stable subspace only0/all; rank1 common-root pair still has no proper subspace; distinct rank1 polynomials give irreducible action | Converse fails R05; finite-field generality of forward algebra not contradicted |
| 3.5 invariant form | L; rank1 ±1; empty | for L, B=J has det1 and iJ has eigenvalues±1; rational symmetric invariant forms have det0; rank1 F=[1] works; empty determinant1 | Complex existence passes; field/bilinear claim fails R06 |
| 3.6 signature count | L,D4,A30_B5.3.2.1 | alternating sign sums0,0,±8; signatures(1,1),(2,2),(8,0) up to interchange; absolute defects0,0,8 | Pass, including repeated α |
| 3.7 finiteness | ([2],[1]); I; A3_B2.1; L | groups C₂ (order2), dihedral group of order8, S₃ (order6 for A3_B2.1), and group containing [[1,4],[0,1]] of infinite order; interlace-all-conjugates true,true,true,false | Pass; cyclic and nonabelian witnesses |
| 3.8 Bézout and module | f=X+1,g=X−1; L; degree10 displayed example | matrix[−2], det−2, order2; L matrix diag(4,−4), det−16, order16; degree10 det−191102976=−2¹⁸3⁶ and 2²·16²·432²=191102976 | Pass; symmetric quotient formula fixes sign |
| 3.9 imprimitivity | I; rank1; fake decomposition(all,0) | I has two independent lines interchanged by both companions; rank1 cannot have two nonzero summands; fake second summand dimension0 | Pass |
| 3.10 reduction | L modulo2,3; A6_B3 modulo2 | modulo2 common companion has square1 and order2; determinants modulo3 both1; Φ₆ mod2=Φ₃=X²+X+1 | Matrix claims pass; prime-to-p wording R03 |
| 4.1 admissible/integer parameters | I at q=5 and3; F₂ | N=4 divides4, giving a=[1,3],b=[2,4]≡[2,0]; 4∤2 rejects q3; q2 has q−1=1 and admits only zero classes | Pass; nonempty disjoint equal-degree pair cannot exist in last case |
| 4.2 torus sum | F₃,a=[0],b=[1],t2, trivial and generating ω | −1 versus1 for trivial ω; i√3=i√3 for generator | R07 |
| 4.3 S,H and denominators | L,F₅,t2; rank1 a0,b2; t0 | H=−2 and S=10 with normalizing product5; rank1 H(t1..4)=[0,−1,1,−1]; t0 gives−1/4; g0=−1, quadratic g²=5 | Pass as total definitions; exclude zero where required |
| 4.4 character/Galois change | q5, α=1/4,β=0,t3; conjugation | H=i, conjugate=−i=H for scaled α=3/4; changing additive ψ preserves H | Pass; rationality not asserted for this datum |
| 4.5 rationality | L; nonstable singleton above | L H(t2,t3)=[−2,2]∈ℚ; singleton H(t3)=i∉ℚ | Pass; stability is essential |
| 4.6 shift/swap | q5,a0,b2,μ1,t2; L,t2↔3 | signed shift: −√5=−√5; omitted sign gives +√5; at0 product0≠−√5/4; swapped data at3 gives−2=original at2 | Pass with ht; source misprint below |
| 4.7 gamma form | T,q3,t2; E8,q7,t2; cubic q2,q4,t1 | H=−2/3, −6/49, −1, +1 respectively; these remain defined without N dividing q−1; admissible q5 direct/gamma agree | Pass in tested cases, including characteristic2 |
| 4.8 Landau | L at q5,t0; T at x=0,1/4,1/2,3/4,1 | L q⁰H=−1/4∉ℤ; T values0,0,−1,−1,0 and min−1, δ1 | R08 |
| 4.9 integral normalization | T at q3; E8 at q5,7,11 | 3(−2/3)=−2; 25(−2/5)=−10;49(−6/49)=−6;121(−82/121)=−82 | Pass; unnormalized sums need not be integral |
| 4.10 trace swap | L,F₅,t2 and swapped at3 | H=−2 on both; δ=0 both; reciprocal t and swapped parameters are both required | Pass |
| 4.11 Kummer sum | I,F₇,t4; I,F₅,t2 | roots±2 in F₇ give −1−1=−2=H_I(4); nonsquare2 in F₅ has no roots, sum0=H_I(2) | Pass |
| 4.12 Greene comparison | q5,a0=2 (rank1),t3 | Greene value−1; S=−√5, g(2)=√5, S/g(2)=−1; BCM printed H-prefactor would give1/5 | Pass for repaired normalization; source issue below |
| 5.1 trace and f>0 | T,p3,f1; E8,p7,f1; empty/nonzero t≠1 | a=−2,−6,0 equal q^δH; f0 excluded, so no use of GaloisField p 0 as F₁ | Pass |
| 5.2 exp series and truncation | L,p5,t2; empty | a₅=−2,a₂₅=−6 yield c₁=2,c₂=(4+6)/2=5, F=1+2T+5T²; empty truncation F=1 | Pass |
| 5.3 bad-prime partition | L,t2,−3,1 | sets{2},{2,3},{2}; at t1 every prime divides numerator0, contradicting containment | R09 |
| 5.4 Newton/ordinary | L,t2,p5; D4,t−1,p3; rank1 t1 | heights[0,0,1]; D4 slopes[1/2,1/2,5/2,5/2]≠[0,1,2,3]; rank1 F1 has no finite height at1 | R10 |
| 5.5 purity, integrality, coefficients, duality | L,p5; Λ={√5,−√5}; Λ={(3±4i)/5} | L |λ|=√5, power sums−2,−6, det5, ε1; fixed self-dual roots give F=1−5T², ε−1; last pair has norm1 but sum6/5 nonintegral | Conditional statements survive these controls |
| 5.6 acceptance factors | D4,p3,5,7 and E8,p7 | D4 traces [0,−12,0,−2844], [−4,276,−3124,−12124], [0,−476,0,−357308] give exactly the three printed coefficient lists; E8 traces[−6,666,307224,−4833646] give[1,6,−315,−104370,643468] | Numerical Gauss-sum agreement plus exact coefficient recurrence |
| 5.7 archimedean shifts | h11,σ0; h12321,σ1 and−3; h262,σ2 | degrees2=0+2,9=1+8,9=3+6; last μ=[0,0],ν=[1,1,0,0], degree10=2+8, RRV σ=−2 gives h⁺4,h⁻2 | Pass; opposite signature convention rejected |
| 5.8 determinant character | I,t−8,p5; rank1 t9/8; Φ₃ | Disc=−288, squarefree−2, χ₅=−1=ε; rank1 Disc=9/64, character1; discr Φ₃=−3 versus resultant3 | Recipe checks pass; geometric constants/realization remain R01 |
| 5.9 tame ranks/degrees | L,t−3,p3; L,t1/3,p3; I near cusp1 with valuation2 | zero cusp: rank1=2−1, degree1; infinity cusp: rank2=2−0, degree0; orthogonal even valuation gives c0 | Pass; conductor degree does not give factor coefficients |
| 5.10 wild invariants | L,p2; same generic good factors with differing factor at2 | p2 divides N2; changing a local linear factor from1−T to1+T changes a₂ from1 to−1 while the good-prime list is identical | Unowned local input, R01/R13 |
| 5.11 semisimple order | F=1+2T+5T²,ℓ2,3,5; F1 | orders1 and8; at5 X=(0,3) has no unit order; degree0 unit group has order1 | R11 |
| 5.12 Galois group/field discriminant | same F;1−T²;1 | polynomial discriminants−16,4,1; field/algebra discriminants−4,1,1; Galois group orders2,1,1 | Mathematical values pass; reducible LMFDB attribution not certified below |
| 5.13 full L-function card | L,t−3 at3; rank1 t9/8 | full a₃=1 versus good-only a₃=0; rank1 good traces at5,7,11,13 are all1, matching trivial character and ζ poles0,1 | R13 |
| 5.14 collected duality | T,t2 and swap,t1/2; L,t−3 | δ=1 both; swapped q3 normalized traces both−2; t valuation sign flips, so zero/inf conductor sides exchange | Pass on tested cases |
| 6.1 Ono | p3,5,7,11,13,17, every λ≠0,1 | q5,λ2:8=6−(−2); q7,λ3:4=8+(−4); q13,λ7:20=14−(−6); λ1 singular | Pass, including sign and singular exclusion |
| 6.2 elliptic cubic and polynomial zero count | q5,7,11,13, all admissible values | q5 λ1,2,4 counts9,3,6 equal6−H(27λ); q11,t6 polynomial roots3=1+H=1+2; q5,t2 roots0=1−1 | Values pass; missing headline R14 |
| 6.3 toric count | γ=[3,−1,−1,−1],q5,t1 | unweighted affine18; weighted affine24; weighted projective6; smooth completion9 | R12 |
| 6.4 motivic comparison | L,t2,p5 | count8, normalized trace−2, candidate Frobenius roots−1±2i, Hodge11; the demanded geometric bridge has zero owned targets | Numerical compatibility only; ownership fails R01 |

For the normalized H-shift, the same q=5, a=0, b=2, μ=1, t=2 example gives −1/5+2i/5 on both correctly normalized sides; the printed inverted quotient gives −1−2i. This checks the additional source error below.

The following expands the headline audit to one row for each admitted declaration. Names are relative to `TauCetiRoadmap.HypergeometricMotives`; the corresponding objects and hypotheses were checked in the elaborated signatures, including section variables.

| Admitted declaration | Instance and values | Result/change |
|---|---|---|
| CyclotomicData.natDegree_PhiB | L: natDegree((X−1)²)=2=degree; empty:0=0 | Library probe closes; R15 |
| CyclotomicData.exists_unique_of_isGaloisStable | I: α orders4,4 and β orders2,1 recover A=[4],B=[2,1]; singleton1/4 fails stability under3 | Pass |
| CyclotomicData.gamma_defining_identity | L at X=2: Φ_A/Φ_B=9; (2²−1)²/(2−1)⁴=9 | Pass |
| CyclotomicData.gamma_unique | L has γ=(−4,2); adding1 at index1 changes the value at X=3 from4 to8 | Wrong γ excluded |
| CyclotomicData.pochhammer_identity | L, n=0,1,2: ratios1,1/4,9/64 on both sides | Pass |
| CyclotomicData.rotationNumber_eq_gcd | I:2=gcd(2,4); empty:0=gcd(∅) | Pass |
| HypergeometricParameters.weight_eq_sSup_sub_sInf | L:1=2−0−1; D4:3=4−0−1; empty excluded | Pass; prior repair retained |
| HypergeometricParameters.hodgeNumber_symm | L,p0:1=1; E8,p1:2=2; p>w excluded | Pass in Lean; R04 prose |
| HypergeometricParameters.weight_eq_zero_iff_interlace | I:0=0 iff true; L:1≠0 iff false | Pass |
| CyclotomicData.even_weight_iff | L:w1 odd and m-total2 even; rank1:w0 even and m-total1 odd | Pass |
| CyclotomicData.two_mul_hodgeTwist | T:2·1+0=1+1; L:2·0+2=1+1 | Pass |
| CyclotomicData.hodgeTwist_eq_neg_minHeight | T:1=−(−1); E8:2=−(−2); empty:0=−0 | Pass |
| CyclotomicData.even_degree_of_odd_weight | L:w1,d2; D4:w3,d4 | Pass |
| rank_companion_pow_sub_one | (X−1)² over ℚ,k2:rank1=2−1; over F₂:rank0, CharZero absent | Pass with hypotheses |
| levelt_rigidity_field | L, identity conjugator: X=C((X+1)²), g₀=C((X−1)²)⁻¹; g₁−1 rank1 | Pass; converse is separate R05 |
| levelt_irreducible_field | L: the X eigenline slope−1 and Y eigenline slope1 are distinct; common invariant proper lines0 | Pass |
| HypergeometricParameters.natDegree_qInf | L:(X+1)² degree2=card α2; empty0=0 | Library probe closes; R15 |
| HypergeometricParameters.natDegree_qZero | L:(X−1)² degree2=card β2=card α2 | Library probe closes; R15 |
| HypergeometricParameters.exists_invariantForm | L:S=iJ, det−1, XᴴSX=S, YᴴSY=S; rank1S1 | Complex statement passes; README R06 |
| HypergeometricParameters.signature_invariantForm | L:eigenvalues−1,1 yield absolute difference0=sign sum0; rank1:1=1 | Pass |
| HypergeometricParameters.finite_hypergeometricGroup_iff | I:D₈ order8 and all conjugates interlace; L unipotent powers have upper-right4n and do not interlace | Pass |
| HypergeometricParameters.isImprimitive_of_rotationNumber | I:rotation2, two coordinate lines dimension1 each, sum dimension2, both companions exchange lines | Pass |
| CyclotomicData.finite_hypergeometricGroup_iff_weight_eq_zero | I:8<∞ and w0; L:unipotent infinite and w1 | Pass |
| det_bezout | d1 f=X+1,g=X−1:−2=(−1)⁰(−2); L:−16=(−1)¹16; f=g=0,d0:det(empty)=1=resultant(0,0); zero ring:0=0 | Pass |
| CyclotomicData.card_bezoutModule | L:ℤ/4⊕ℤ/4 has order16=abs(−16); empty module order1=abs(det empty1) | Pass |
| katzExpSum_eq | F₃,trivial ω,a0,b1,t2:−1≠1; generator:i√3=i√3 | Fail R07 |
| hypergeometricSum_galois | F₅,a1,b0,t3:conjugate(i)=−i, scaled a3 gives−i | Pass |
| katzSum_shift | F₅,a0,b2,μ1,t2:signed shifted value−√5=original−√5 | Pass |
| hypergeometricSum_swap | L,F₅,t2:−2=swapped-negated value at3 | Pass |
| greeneF_eq_katzSum | F₅,rank1 a2,t3:−1=S/g2=(−√5)/√5; t0 excluded | Pass |
| CyclotomicData.hypergeometricSumRat_spec | L,F₅,t2:rational witness−2 maps to complex−2; nonstable i example cannot enter CyclotomicData | Pass |
| CyclotomicData.gammaVectorSum_eq_hypergeometricSum | L,F₅,t2:gamma−2=direct−2; N2 divides4 | Pass |
| CyclotomicData.frobeniusSum_spec | T,F₃,t2:chosen rational−2/3=gamma value; cubic F₄,t1:1=1 | Pass numerically |
| CyclotomicData.frobeniusSum_integral | T:3·(−2/3)=−2; E8:49·(−6/49)=−6 | Pass |
| CyclotomicData.frobeniusSum_swap | L,F₅,t2 vs swapped,t3:−2=−2 | Pass |
| CyclotomicData.frobeniusSum_primitiveData | I,F₇,t4:−2=(−1)+(−1); F₅,t2:0=empty sum0 | Pass |
| CyclotomicData.frobeniusTrace_integral | T,p3,f1:−2∈ℤ; E8,p7,f1:−6∈ℤ; f0 excluded | Pass |
| CyclotomicData.frobeniusPolynomial_of_isPure | L at5:product(1−(−1±2i)T)=1+2T+5T², degree2=card Λ | Pass |
| CyclotomicData.frobeniusPolynomial_int_of_isPure | L:coefficients1,2,5∈ℤ; nonintegral norm1 control has sum6/5 and fails integral trace input | Pass with repaired hp,ht |
| CyclotomicData.abs_coeff_frobeniusPolynomial_le | L at5,k0,1,2,3:1≤1,2≤2√5,5≤5,0≤0 | Pass |
| CyclotomicData.local_functional_equation | L at5,k0,1,2:5=5,10=10,25=25 | Pass |
| CyclotomicData.local_sign_eq_one_of_odd_weight | L:product5=5¹, no λ²=5; Λ={√5,−√5} gives−5≠5 and fails hfix | Pass |
| CyclotomicData.tameConductorExponent_inf | L,t1/3,p3:rank2=2−0 | Pass |
| CyclotomicData.tameConductorExponent_zero | L,t−3,p3:rank1=2−1 | Pass |
| legendre_point_count | F₇,λ3:4=8−(−1)(−4); F₅,λ2:8=6−(−2) | Pass |
| cubic_point_count | F₅,λ1,2,4:counts9,3,6 equal6−(−3),6−3,6−0 | Pass |
| hypergeometricSum_degree_one | F₅,t1,2,3,4:0,−1,1,−1 equal quadraticChar(t(t−1)) | True Check, padding R15 |

The README's headline list is: the cyclotomic dictionary and gamma identities; Hodge/parity/interlacing theorems; Levelt rigidity and irreducibility; invariant form, signature and finiteness; Bézout determinant/module order and imprimitivity; Katz/Greene comparisons, rationality, gamma formula, integrality, shift/swap/Kummer identities; Frobenius polynomial/purity/functional-equation consequences and tame ranks; Ono, both cubic counts and the toric count. The 47-row table locates the statable families actually present. R14 and R12 identify missing statable point-count headlines. Explicit small Euler-factor computations in §5.6 appropriately stay in the README. The module docstring names the nonstatable geometric identification, geometric Hodge comparison, determinant sign, L-function card and smooth completion; naming their absent carriers is correct Lean form but does not resolve the README ownership problem in R01.

**Seeded source audit.** The 15 requested targets were checked as follows. No additional README locator was explicitly marked “unverified.” The source versions here are the versions actually read: BCM arXiv:1505.02900v2; RRV arXiv:2109.00027v1; Fedorov arXiv:1505.01704v2; Qian arXiv:2104.09761v1; Negami arXiv:2609.11793v1. RRV's preprint has different pagination from the published article; its equation (12.2) is on printed page 11, followed by the definition of h± on page 12. Sources were obtained through the sources service; no source file or extraction was put in the repository or report.

| Sampled target | Text and locator opened | What the text supports |
|---|---|---|
| 1.1 Parameter pairs | `lmfdb-hgm`, defining_parameters, lines90–102; `bcm2015` lines65–86, Definition1.1,p.2 | Equal-length disjoint parameters, the cyclotomic dictionary and the (0,1] display; finite-field sums require admissible denominators. Native AddCircle interval maps checked separately. |
| 1.5 Reciprocity | Mathlib cyclotomic evaluation declarations at the pin; Φ₁ computed directly | Source inputs apply with their prime-power hypotheses, not the two false universal formulas; R02. |
| 1.7 p-parts | `lmfdb-hgm`, defining_parameter_ppart, lines90–92 | Exact multiplicity φ(v), common multiset cancellation. Does not say to select the original p-power-order classes; R03. |
| 2.6 Second parity/type | `lmfdb-hgm`, type,line90; symmetry argument and 876-datum test | Even/odd weight defines type. Odd-weight/even-rank is the roadmap's deduction from symmetric Hodge numbers, not a new theorem attributed to the knowl. |
| 2.9 Hodge polygon/special vector | `lmfdb-hgm`, hodge_vector,lines90–95; `rrv2022` §9; `fedorov2018` lines150–174,Theorem1/Corollary2.9,p.4 | The drop of one central entry or two middle entries agrees. Fedorov gives the hypergeometric Hodge numbers up to shift; that alone does not construct the special motive here. |
| 3.4 Levelt | `beukersheckman1989` lines246–285,Proposition3.3/Theorem3.5,pp.331–332; `qian2021` lines628–665,Lemma3.4 | BH is over ℂ; Qian is a particular integral-cyclotomic representation. The arbitrary-field route is a proposed generalization; its converse and product order need R05. |
| 3.6 Signature | `beukersheckman1989` lines367–416,Theorem4.5/Corollary4.7,pp.334–336; `negami2026` lines862–869,Theorem7.2,p.22 | Position indices include repetitions. The formula gives the absolute signature difference, not the signed LMFDB real-Hodge signature. |
| 3.7 Finiteness | `beukersheckman1989` lines417–437,Theorem4.8,pp.336–337; `negami2026` lines870–872,Theorem7.3,p.22 | Roots of unity and all coprime Galois powers are required. Rational Q/Z parameters supply roots of unity. |
| 4.1 Admissibility | `bcm2015` lines65–86,Definition1.1,p.2 | Denominators divide q−1; ω is a generator and ψ nontrivial. The Lean comparison does not inherit an unstated generator hypothesis; R07. |
| 5.6 Euler factors | `lmfdb-hgm`, test_hgm.py,lines36–44; independent extension-field trace evaluations | The degree-eight displayed polynomial is in the test fixture; all three degree-four factors and the degree-eight first half agree numerically with the actual formulas. This is not a theorem from a primary paper. |
| 5.7 Archimedean shifts | `rrv2022` lines1171–1177,(12.2),pp.11–12 | Gamma factors, parity sign in h± and duplication identity support the corrected convention. |
| 5.11 Semisimple order | README formula; direct reductions at ℓ2,3,5 | No exact theorem/page is supplied for the universal claim; it fails at ℓ5, R11. A database display is not evidence of universal invertibility. |
| 5.12 Local discriminant | `lmfdb-hgm`, local_discriminant,line90; native discriminant and Galois carriers | The knowl describes the number-field discriminant. It does not specify the reducible or repeated-factor extension claimed in the README. The displayed quadratic and split examples are mathematically correct. |
| 5.13 L-function card | `TauCetiRoadmap/LFunctions/README.md`,Layer0; `rrv2022` lines1182–1198,§12,p.12 | The existing card has full coefficients and a polar divisor. RRV explicitly excepts Tate motives from expected entireness. R13 contradicts both requirements. |
| 6.3 Toric count | `bcm2015` lines344–350,Lemma2.7,p.7; lines610–632,Proposition4.3,pp.13–14; lines147–170,(1.1)/Theorem1.5,pp.3–4 | Weighted projective variety, primitive exponent vector in Proposition4.3, and a distinct smooth-completion statement. R12 changes both the equation and the count. |

For the nonsampled inputs used to validate these conclusions, `greene1987` Definition2.4,p.80 and Definition3.10/Theorem3.13,p.83 were read (lines121–129,208–225); `ono1998` Theorem1,p.1210 (lines341–351) is a prime-field formula, while BCM Theorem1.2,p.3 gives the odd-prime-power restatement used here. `fedorov2018` Theorem1,p.4 and Corollaries2.8–2.9 support the Hodge/signature/interlacing link. The fetched Corti–Golyshev preprint was located; the substantive proof used for this review is Fedorov, not the conjectural predecessor. Sage's sign recipe was inspected as text only (`sage-hgm` lines1602–1644), including its swap branch and the references to Watkins; no downloaded code was executed.

**Pinned objects and ownership.** The libraries searched were Mathlib `f6090c7095e1e56b3464c1daba5f24631f1290d2` and Tau Ceti `358314d4ab97483df4fc4cb8adcc02e74a8d9f5a`. In addition to object searches across both libraries, the following native definitions/signatures were opened; paths are within their respective pinned repositories.

| Pinned file and line | Declaration and relevant contract |
|---|---|
| Mathlib/Topology/Instances/AddCircle/Defs.lean:305,310 | equivIco/equivIoc use the indicated half-open intervals and a positive period; the local Fact supplies period1>0. |
| Mathlib/NumberTheory/MulChar/Lemmas.lean:173 | exists_mulChar_orderOf_eq_card_units needs a primitive root in the target. ℂ supplies it; the lemma does not make an arbitrary character a generator. |
| Mathlib/NumberTheory/LegendreSymbol/AddCharacter.lean:211 | FiniteField.primitiveChar requires finite source fields and unequal source/target characteristics. |
| Mathlib/NumberTheory/GaussSum.lean:126,188 | gaussSum_one_left needs nontrivial ψ; gaussSum_mul_gaussSum_eq_card needs nontrivial χ and primitive ψ. Trivial χ is handled separately, with value−1. |
| Mathlib/RingTheory/Polynomial/Cyclotomic/Eval.lean:41,136 | eval_one_cyclotomic_prime_pow uses exponent k+1; eval_one_cyclotomic_not_prime_pow excludes every prime power, including exponent0. Neither says Φ₁(1)=1. |
| Mathlib/Algebra/Polynomial/BigOperators.lean:204,329 | Monic-product degree and product-of-linear-factors degree; these close the R15 probes. |
| Mathlib/RingTheory/Polynomial/Resultant/Basic.lean:935,939,943,957 | Polynomial.discr; constant and linear discriminants1; quadratic discriminant b²−4ac. This fixes the sign and empty-product conventions. |
| Mathlib/RingTheory/PowerSeries/Substitution.lean:157 | subst takes the substituted series first, then the outer power series. The Frobenius series was checked in that order. |
| Mathlib/LinearAlgebra/Matrix/Charpoly/Minpoly.lean:73 | charpoly_leftMulMatrix is on a power basis; it is not a hypergeometric rigidity theorem. |
| TauCeti/Geometry/Hodge/Dimension.lean:73,88 | hodgeNumber is a finrank and hodgeNumber_symm is on integer indices of an actual Hodge structure. It does not identify a zigzag with a geometric Hodge realization. |
| TauCeti/AlgebraicGeometry/EllipticCurve/PointCount.lean:71,86 | pointCount counts all affine solutions plus infinity; agreement with Mathlib's nonsingular Point type needs a finite solution type and IsElliptic. λ≠0,1 and the cubic discriminant exclusions supply ellipticity in the two kept counts. |
| TauCeti/NumberTheory/ArithmeticDirichletSeries/EulerProduct/Data.lean:56 | EulerProductData contains an ideal arithmetic function and coprime multiplicativity. It does not recover omitted bad-prime coefficients from conductors. |

These are 21 specifically inspected declarations/definitions, with their local hypotheses; no claim of an exhaustive proof of every library absence is inferred from a name search. Object searches found the specialized quadratic companion matrix in Tau Ceti, but no general hypergeometric data/finite-sum/Levelt/Bézout implementation. The probability distribution and analytic hypergeometric functions are different objects. The new hypergeometric-specific constructions therefore belong here. Generic coefficient/slope polygons already belong to NewtonPolygons (R10).

Cross-roadmap citations were resolved afresh, using main for existing roadmaps and the available open-head material for new roadmaps. The resolve tool returned no unresolved roadmap citations; its library-name check was not available through that tool configuration, so the pinned reads above were done directly. The relevant resolved contracts are:

- `TauCetiRoadmap/ClassicalArithmeticCompletion/README.md:4036,4474`, §§2.46,2.60: companion carrier, multiplication-by-root interpretation and characteristic polynomial. §§1.19 (:945),1.36 (:1410),1.46 (:1632),1.53 (:1865) give cubic/quartic Gauss/Jacobi inputs. In particular §1.19 itself is already over a finite field, broader than the README's description as an F_p instance.
- The same roadmap :14605, §7.12, gives Stickelberger with valuation normalization s(a)/(p−1) when v(p)=1, equivalently s(a) at a uniformizer above ζ_p−1. Its p3 quadratic example has value1/2 in the first normalization. Section7.29 (:15058) is the exact Hasse–Davenport supplier; characteristic two is explicitly in its scope.
- `TauCetiRoadmap/EllipticLegendreCharacterInterfaces/README.md:65,592`, §§0.1,5.1: native Legendre coefficients and odd-finite-field character count, including singular equations in the latter. `TauCetiRoadmap/ModularCurves/README.md:1100`, §4C, supplies the universal Legendre equation over the stated base.
- `Completed/Chebotarev/README.md:205`, Layer4: arithmetic Frobenius raises ζ_m to the norm power. It also explicitly distinguishes ramified values from an away-from-ramification specification.
- `TauCetiRoadmap/LFunctions/README.md:346`, Layer0: analytic/arithmetic cards and the weight translation; :405–418 supplies the ζ pole control. This does not supply the missing hypergeometric bad factors.
- `TauCetiRoadmap/ThetaSeries/README.md:562`, §2H: Kronecker character with its discriminant hypotheses; `TauCetiRoadmap/DeligneWeightsAndPurity/README.md:560,600`, §§0.1–0.2: general Weil-number language and operations. Neither constructs the hypergeometric determinant or its realization.
- `Completed/PolynomialGaloisGroups/README.md:248,333` and `Completed/NumberFieldArithmetic/README.md:227,250`: the native polynomial-Galois and signed number-field discriminant objects, so §5.12 correctly avoids rebuilding those theories.
- `Completed/HodgeStructures/README.md` and `TauCetiRoadmap/MotivesAndAlgebraicCycles/README.md:247,352,369`, §§1.1,2.2–2.3: Hodge/pure-motive carriers and realization machinery. They do not state the missing hypergeometric comparison; R01 is about that precise missing target.
- The exclusion citations to `CharacterSumsOverFiniteFields` §§6.4–6.5 and `FiniteGroupInvariants` were checked against their supplied open heads. They concern Gross–Koblitz/p-adic evaluation and abstract finite-group invariants; they are not a hidden dependency for the full Hasse–Davenport relation or for hypergeometric monodromy construction.
- `TauCetiRoadmap/NewtonPolygons/README.md:320,512`, §§0.6,2.1, is an additional existing owner found by object search. Reusing it introduces an earlier/main supplier, not an upward edge.

Ownership searches used the roadmap grep/show tools as requested, the board packages, the main repository and the provided sibling checkouts. Related designs for Kloosterman/Bessel sheaves and Dwork potential automorphy were examined as ownership leads; they do not supply the exact geometric identification excluded in §6.4. A namespace search across the roadmap index returned only this roadmap; no colliding fully qualified Lean declaration was found in the readable sibling roadmaps. Existing roadmap work was not replanned wholesale, no forbidden upward supplier or cycle was found, and no edit outside the folder is in the PR. The review's ownership defect is the unassigned hypergeometric-specific geometric step, alongside the duplicated polygon construction—not a demand to rebuild its generic suppliers.

## Not verifiable

- **Katz 1990**, Chapter8, especially §§8.2.1,8.2.7 and §5.6: the sources service's bibliographic lookup for *Exponential sums and differential equations* did not return readable legal text. The BCM formulas were checked directly, but the book's exact sheaf and Kummer locators were not certified.
- **Katz 1996**, *Rigid local systems*: the sources service's author/title/year lookup did not return readable legal text. The broad rigidity citation cannot substitute for a checked exact target or supplier contract.
- **Levelt 1961**, *Hypergeometric functions*: the sources service's thesis lookup did not return readable legal text. The complex companion theorem was independently read in Beukers–Heckman; this does not certify a locator in the thesis.
- **Watkins 2015**, *Hypergeometric motives package*: the sources service's bibliographic lookup did not return the cited text. The determinant recipe was read in Sage's public source and tested on the explicit examples, but its original proof and exact note numbering were not certified.
- **Jouve–Rodriguez Villegas 2014**: the publisher route was classified as paywalled/uncertified by the sources service. No text was bypassed. It is a contextual citation here; the Bézout formula was tested directly and is not being attributed to an unread theorem. This settled uncertified source is not included in the missing-text request.
- **LMFDB extension claims**: the local-discriminant knowl states the number-field case only; it does not certify the reducible/repeated-factor product interpretation. The current type knowl says even versus odd weight, without the additional degree clause quoted as its rule. The parity theorem makes that extra clause redundant, but the attribution should be made exact.
- **Large acceptance counts and software history**: the 1,593/5,192-data claims, 131 orthogonal pairs, 612 sign comparisons and “every number” checked against Sage were not reproduced exhaustively. The report gives the independently computed sample sizes and values instead. Public source was read, never executed. No immutable database/software revision was supplied for those larger assertions.
- **Geometric arithmetic theorems**: numerical agreement of traces is not a verification of Katz's motive, wild invariants or Fedorov's geometric comparison. R01 is an ownership defect even if all cited geometric theorems are true.

The four unavailable texts are retained together under their existing keys in the scratch missing-reference list, with where the service was asked to look. Sources successfully obtained by corrected public URLs (Greene, Ono and the LMFDB knowls) are no longer listed as missing. No source manifest or PR file was edited. The review is complete with these certification limits; it is not awaiting text before issuing its verdict.

## Source issues

- **Error** in bcm2015 at Theorem3.4, printed p.11, lines470–478: the source says the shift multiplier is ω(t)^(μ(q−1)); it should be ω((−1)^d t)^(μ(q−1)); affects a stated result.
- **Error** in bcm2015 at the Greene comparison after Definition1.1, printed p.2, lines89–95: the source says Greene's H_q multiplier contains q^(−d) with positive sign; it should be −q^(1−d) with the same character and Gauss-product factors; affects a stated result.
- **Error** in bcm2015 at Theorem4.2, printed p.12, lines573–578: the source says its fractional-part minimum on [0,1] is at least one; it should be zero at x=0, with positive interior bounds requiring an additional primitive-exponent condition; affects a stated result.
- **Gap** in bcm2015 at the proof of Theorem4.2, printed p.13, lines607–608: the source says the product Gauss-sum valuation bound directly bounds H_q; it should retain the gamma formula's q^(s(m)−s(0)) normalization when estimating each coefficient; affects the proof.
- **Misprint** in rrv2022 at §10, printed preprint p.10, lines973–976: the source says numerator(t), denominator(t), numerator(t−1) correspond respectively to 0,1,∞; it should be 0,∞,1; affects nothing.
- **Error** in bcm2015 at Theorem3.4, the H_q identity, printed p.11, lines474–478: the source says the factor is K_shifted/K_old; it should be K_old/K_shifted; affects a stated result.
- **Misprint** in bcm2015 at Theorem3.4, the H_q identity, printed p.11, line477: the source says the Gauss exponents are shifted by μ; it should shift them by μ(q−1), since μ is a rational parameter; affects a stated result.
