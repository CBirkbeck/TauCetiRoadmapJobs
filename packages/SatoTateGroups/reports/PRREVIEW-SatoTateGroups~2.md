# Review of SatoTateGroups (pull request #1725 at 1fa39b0)

**Verdict:** needs changes

## R01 (P1) — The defined Hodge condition admits omitted identity components

Location: `TauCetiRoadmap/SatoTateGroups/Suggested.lean:336`, `:656`, `:755`, `:796`; `TauCetiRoadmap/SatoTateGroups/README.md:1070`, `:1222`, `:2014`. Quote: “the Hodge circles generate a dense subgroup”.

Claim: this condition yields the six degree-four and fourteen Lefschetz degree-six identity components.

Witness: embedded U(2) contains both scalar and SU(2) Hodge circles; together their images generate U(2). It is connected, rational and self-dual. Its complex commutant has dimension 2, whereas the listed dimension-four group has commutant dimension 3.

Repair: distinguish the stated all-circles predicate from arithmetic realizability. Retain its generality and include U(2) and its normalizer in the degree-four analysis; likewise include U(2)×U(1) in the degree-six analysis. Recompute the completeness statements, rather than asserting 55/14/433 for this predicate. Keep the arithmetic 52/410 classifications with their actual arithmetic hypotheses. Alternatively, supply a precisely formulated stronger Hodge-datum condition, with a proof that arithmetic groups satisfy it, before claiming those finite lists. Merely adding ST4 does not repair this: these countermodels satisfy the double-commutant condition. The explicit circles and commutants are computed below. FKS18 Remark 2.3 does not justify the claimed exclusion.

## R02 (P1) — A least splitting field need not exist

Location: `TauCetiRoadmap/SatoTateGroups/README.md:1676`. Quote: “Prove existence and uniqueness of the minimum”.

Claim: every geometrically nonsimple surface has a unique minimum splitting field inside its endomorphism field.

Witness: twist a non-CM E² by the signed-permutation representation of Gal(Q(⁴√2,i)/Q)=D₄. Its endomorphism field is Q(√2,i). It splits over Q(√2) and Q(√−2), but not their intersection Q.

Repair: define the finite set of inclusion-minimal splitting fields, using the rational fixed endomorphism algebras, and state factor uniqueness only over a specified splitting field. Do not define a canonical single minimum. For the witness the minimal set has two members, not one; the fixed algebras and descent construction are given below. FKRS Theorem 4.3(c) classifies real fixed algebras and asserts no such minimum.

## R03 (P1) — Real Galois endomorphism type loses the rational lattice

Location: `TauCetiRoadmap/SatoTateGroups/README.md:1689`. Quote: “the isomorphism types of `End⁰(A_F)` … whether `A_F` is simple”.

Claim: all these entries are determined by the real Galois endomorphism type.

Witness: a square of a non-CM elliptic curve and a simple indefinite-QM surface, over fields defining all endomorphisms, both have type [1,M₂(R)]. Their rational algebras are M₂(Q) and a division quaternion algebra; simplicity is respectively false and true.

Repair: separate the real fixed-algebra lattice, determined by the real Galois type, from a rational lattice taking the rational algebra with its Galois action as input. Use rational fixed algebras to decide division/simplicity. Include the base-field imaginary-quadratic case in the codomain: the nine geometric surface shapes are not a codomain for every End⁰(A_F). The repaired two outputs distinguish the witness. FKRS12 line 1030 concerns R-algebras only; FKRS12 lines 973–976 explicitly give the two alternatives in this witness.

## R04 (P1) — Infinite order does not imply Hecke equidistribution

Location: `TauCetiRoadmap/SatoTateGroups/README.md:1771`. Quote: “is not a norm twist (infinite order)”.

Claim: every infinite-order Grossencharacter has Haar-equidistributed unitarized prime values.

Witness: take ψ(𝔞)=N𝔞. Its order is infinite, its unitary part is 1, and the average of the character z↦z is 1, whereas its Haar integral is 0. The trace law is δ₂, not arcsine.

Repair: require, for every nonzero integer a, that ψᵤᵃ is not a pure imaginary norm character. This is the precise exception in the consumed LFunctions contract. Treat finite-image and norm-character cases separately, and prove the CM infinity type excludes these exceptions. The corrected condition rejects this witness; “ψᵤ has infinite order” alone also fails for N^{it}. SUT19 Lemma 2.15 itself omits the restriction.

## R05 (P1) — The proposed joint density has unbounded false support

Location: `TauCetiRoadmap/SatoTateGroups/README.md:852`. Quote: “supported on `S = {a_2 ≥ 2a_1 − 2, a_2 ≥ −2a_1 − 2, a_2 ≤ a_1²/4 + 2}`”.

Claim: this S supports the USp(4) joint coefficient density.

Witness: (a₁,a₂)=(10,25) satisfies all three strict inequalities and has ρ=2632>0. Every USp(4) element instead has |a₁|≤4. Thus the proposed density is positive on an open set disjoint from the actual image.

Repair: intersect S with −4≤a₁≤4 and explicitly set the density to zero off that compact region. The witness then has density zero; the interior point (0,0) still has ρ=32. This omission is also in FKRS12 (5.1).

## R06 (P1) — Newton's inverse formulas are not integral polynomials

Location: `TauCetiRoadmap/SatoTateGroups/README.md:567`. Quote: “integer polynomials in `a_1, …, a_k` and conversely”.

Claim: coefficients are integer polynomials in the power sums.

Witness: diag(1,−1) and diag(i,−i) have (s₁,s₂)=(0,2),(0,−2), and a₂=−1,1. Any integer polynomial at those two inputs has difference divisible by 4; the desired difference is 2.

Repair: keep integral formulas for power sums; state the integral Newton recurrence for k·a_k, and the inverse polynomial formulas over Q. In particular 2a₂=s₁²−s₂, giving −2 and 2 on the witness. The pinned `MvPolynomial.mul_esymm_eq_sum` has exactly the required k factor.

## R07 (P1) — A torus does not meet the reflection component of O(2)

Location: `TauCetiRoadmap/SatoTateGroups/README.md:581`. Quote: “The same for `Od d` with the torus `SO(2)^{⌊d/2⌋} × {±1}^{d mod 2}`”.

Claim: every orthogonal element is conjugate into that set.

Witness: diag(1,−1)∈O(2) has determinant −1; every element of the proposed SO(2) torus has determinant +1. Determinant is unchanged by conjugation.

Repair: give the full orthogonal normal form: rotation blocks together with +I_p and −I_q, with 2r+p+q=d. State that characteristic polynomial determines O(d)-conjugacy; the ±1 multiplicities are already its root multiplicities. The reflection is the r=0,p=q=1 case. KS99 §5.0.7 separately treats the negative-determinant component.

## R08 (P1) — SO(3) and SU(3) fail ST2, not just ST4

Location: `TauCetiRoadmap/SatoTateGroups/README.md:1223`, `:2024`. Quote: “satisfy ST1–ST3 but fail ST4”.

Claim: the indicated six-dimensional embeddings satisfy the weight-one Hodge condition.

Witness: a weight-one Hodge circle sends −1 to −I₆. In diag(A,Ā), this requires A=−I₃, absent from both SO(3) and SU(3), since det(−I₃)=−1.

Repair: change both examples to failures of ST2, and stop using them as ST4-only controls. Reconcile them with `neg_one_mem_identityComponent`. Their connectedness still supplies ST3. FKS23 §3.6 contains the same erroneous ST2 assertion.

## R09 (P1) — Symplectic containment alone does not kill odd moments

Location: `TauCetiRoadmap/SatoTateGroups/README.md:718`. Quote: “For `G ≤ USp(2g)` … `coeffMoment G n = 0`”.

Claim: every such subgroup has vanishing odd weighted moments.

Witness: G={I₂}≤USp(2), n₁=1. Its coefficient a₁ is constantly −2, so the claimed equality reads −2=0.

Repair: require −I∈G (or the stated odd-weight Hodge condition) for the vanishing assertion and the claim that the simplex loses no information. The Lean theorem already carries the Hodge hypothesis. The witness is excluded; for G={±I₂}, the first moment is (−2+2)/2=0.

## R10 (P1) — The surface quaternion exclusion is not supplied where cited

Location: `TauCetiRoadmap/SatoTateGroups/README.md:1354`. Quote: “type III with `g = 2` is excluded by … M0.2 and A6.17”.

Claim: those suppliers provide the geometric dimension restriction used by the six-type theorem.

Witness: PELModuli M0.2 admits definite quaternion algebras with positive involution; AbelianSchemesAndArithmeticModuli A6.17 supplies a reduced-trace comparison. Neither states the surface exclusion. For g=2,e=1,m=2 that comparison merely gives geometric trace 2·Trd.

Repair: own the missing characteristic-zero surface exclusion as an explicit target with its exact hypotheses and Hodge-theoretic inputs, or declare a precise gap with an earlier supplier. Do not cite classification of positive involutions as classification of geometric realizability. The algebraic quaternion model passes the existing supplier statements, so the missing geometric argument must exclude it.

## R11 (P1) — Two geometric construction inputs are stronger than their suppliers

Location: `TauCetiRoadmap/SatoTateGroups/README.md:1476`, `:1488`. Quotes: “consumed as the openness statement”; “maximal compact subgroups … exist, are conjugate”.

Claim: DeligneWeightsAndPurity §2.2 provides Bogomolov openness, and LieGroups Layer 9 provides existence/conjugacy of maximal compacts for the complex reductive groups used here.

Witness: DeligneWeightsAndPurity §2.2 assumes openness and concludes Zariski density. LieGroups Layer 9 starts with a maximal compact K and Cartan involution. Neither cited target constructs the input that this roadmap says it consumes.

Repair: retain Bogomolov openness as a target here also in the symplectic case, with its arithmetic hypotheses and proof inputs; consume §2.2 only after establishing openness. Give the existence/conjugacy theorem, including disconnected groups, an owner and precise target or declared supplier gap. A given-K decomposition cannot construct K; testing C× requires constructing U(1), not merely decomposing relative to an assumed U(1).

## R12 (P2) — Banaszak–Kedlaya's third hypothesis has been dropped

Location: `TauCetiRoadmap/SatoTateGroups/README.md:1520`. Quote: “under `MumfordTate A` and `Hg(A) = L(A)`”.

Claim: these two assumptions alone are the cited Theorem 6.1 yielding AST=TL.

Witness: BK15 line 468, Theorem 6.1, printed p.11, has three assumptions; line 471 requires the decomposable Lefschetz group over the endomorphism field to be connected. FKRS12 Theorem 2.16(a) omits it without a replacement argument.

Repair: add connectedness of that full centralizer/Lefschetz group, or provide a theorem deriving it under the proposed general hypotheses. Keep the dimension≤3 corollary, where the full hypotheses are discharged. Checking G⁰=L does not check G=L: O₂ has identity component SO₂ and two components. Do not identify a full centralizer with its identity component by definition.

## R13 (P2) — Integer event values cannot represent the promised general record

Location: `TauCetiRoadmap/SatoTateGroups/README.md:748`, `:767`, `:981`. Quote: “`counts : List (ℕ × List (ℤ × ℚ))`”.

Claim: counts records all nonzero coefficient events for every closed unitary subgroup, including μ(3).

Witness: μ(3) has three singleton components. Its a₁-values are −1,−ζ₃,−ζ₃², each of probability 1/3. Two values cannot inhabit the proposed integer field; §5.6 lists just the first.

Repair: make the complete event record use complex values, or define an explicitly named integer-event projection alongside a complete record. Distinguish raw z-counts from probabilities consistently. The complete μ(3) record has three entries; its integer projection has one. Do not restrict the primary subgroup carrier to rational examples.

## R14 (P1) — N_SU(2)(U(1)) is not conjugate to O(2)

Location: `TauCetiRoadmap/SatoTateGroups/README.md:961`. Quote: “`nu1Mu 1` is `U(2)`-conjugate to `Od 2`”.

Claim: the normalizer generated by U(1) and J becomes the real orthogonal group after unitary conjugation.

Witness: every element of nu1Mu 1 has determinant 1; O(2) contains determinant −1 reflections. Also J²=−I, whereas a reflection squares to I.

Repair: distinguish this Pin(2) subgroup from the O(2) copy generated by U(1) and J·diag(1,−1). The latter swaps the two coordinates and squares to I; it is the relevant even-weight index-two variant. The corrected groups have determinant images {1} and {±1} respectively.

## R15 (P1) — The coefficient-vector trace law is still false in degree zero

Location: `TauCetiRoadmap/SatoTateGroups/README.md:633`; also `:565` for reciprocal indices. Quote: “`traceLaw G` is the image … under `a ↦ −a_1`”.

Claim: the Fin(d+1)-coefficient vector gives this trace law for all d.

Witness: at d=0, the vector has only a₀=1; `(1 : Fin 1)=0`. Its proposed image is δ₋₁, while the empty-matrix trace law is δ₀. For i>d, natural subtraction also makes a_{d−i}=1 while a_i=0.

Repair: evaluate the polynomial's natural-number coefficient 1, extending the vector by zero, or require d>0 for the vector projection. Restrict reciprocal coefficient identities to i≤d. At d=0 these repairs give trace 0 and impose only a₀=a₀. The Nat-indexed `aMoment` repair in Lean is correct; the prose still needs this correction.

## R16 (P1) — The degree-one and normalizer formulas omit boundary hypotheses

Location: `TauCetiRoadmap/SatoTateGroups/README.md:962`, `:976`, `:2018`. Quotes: “`E[t^m] = ½ C(m, m/2)`”; “the `n`-th roots of unity: finite”.

Claim: these formulas include m=0 and n=0, and every odd-weight finite symplectic subgroup fails ST2.

Witness: for m=0, the normalizer formula gives 1/2 instead of ∫1=1. At n=0 every unit satisfies z⁰=1, so μ(0)=U(1), not finite. At g=0, the trivial group has a weight-one Hodge circle and satisfies ST2.

Repair: state the normalizer moment as 1 at m=0 and the displayed expression for m>0; require n≥1 for the finite μ(n) family; require g>0 in the finite-group negative Check. Keep the total-function values separately. The repaired values are respectively 1, an infinite circle at n=0, and ST2=true at g=0.

## R17 (P2) — The generic Mumford–Tate construction has an earlier owner

Location: `TauCetiRoadmap/SatoTateGroups/README.md:1512`. Quote: “defined here as the smallest `ℚ`-algebraic subgroup”.

Claim: this roadmap owns the generic construction of MT from a rational Hodge structure.

Witness: `TauCetiRoadmap/ShimuraData/README.md:185`, §1.2, constructs exactly this minimal rational algebraic subgroup, with Hopf-ideal minimality and independence of basis. ShimuraData is earlier in the merge order.

Repair: import ShimuraData §1.2 by name and section, and own only its specialization to H₁(A(C),Q) and the Galois comparison/conjecture. On the CM elliptic example both constructions give Res_{Q(i)/Q}G_m; a second construction adds no new object. No fully qualified Lean name collision was found.

## R18 (P2) — Hecke equidistribution is still an omitted statable headline

Location: `TauCetiRoadmap/SatoTateGroups/Suggested.lean:50`; `TauCetiRoadmap/SatoTateGroups/README.md:143`, `:1769`. Quote: “Hecke equidistribution … is an input to 10.5”.

Claim: describing a theorem as an input excuses omitting its signature.

Witness: the README explicitly owns and proves Hecke equidistribution. Pinned Tau Ceti has `HeckeCharacter`, `idealCharacter`, norm twists and prime ideals; the file already uses the required empirical-measure and prime-ordering carriers for Serre and CM.

Repair: after correcting R04, state Hecke equidistribution on these native carriers with the precise no-norm-power hypothesis. An arbitrary function with equidistribution assumed is not a substitute. The norm-character negative control must fail the hypothesis. Also treat the degree-six completeness theorem as a headline in the docstring: if its concrete list cannot be expressed by a few simple definitions, name that missing carrier instead of declaring the theorem “not headline”.

## R19 (P2) — Computational certificates substitute for the promised mathematics

Location: `TauCetiRoadmap/SatoTateGroups/README.md:23`, `:1173`, `:1235`, `:1246`. Quote: “a theorem whose proof is a checked certificate of that enumeration”.

Claim: checker records, stored presentations and generator certificates constitute the roadmap's classification proof.

Witness: §7.4 delegates its upper bound to a Magma enumeration and its certificate; §6.9 similarly delegates inclusions to a certificate. The brief explicitly excludes computational algorithms and certificates from roadmap scope.

Repair: state mathematical normalizer-subgroup classification and inclusion theorems, with hypotheses, finite group cases, completeness arguments and owned prerequisites. Keep small generator calculations as Checks. Specify the complete mathematical case list and why no further subgroup occurs; equality of a stored record is not that proof. For example, J(C₁)≤J(C₂) has index 2 by its quotient groups, without a database certificate. R01 must also be resolved before claiming the 433 bound for these axioms.

## R20 (P3) — A remaining admitted declaration closes by one simp

Location: `TauCetiRoadmap/SatoTateGroups/Suggested.lean:922`. Quote: “`theorem isProbabilityMeasure_nu1TraceLaw`”.

Witness: the scratch copy elaborates after replacing this sorry by `simp [isProbabilityMeasure_iff, nu1TraceLaw, isProbabilityMeasure_arcsineLaw.measure_univ, ENNReal.inv_two_add_inv_two]`. It computes 1/2+1/2=1 from the already admitted arcsine normalization.

Repair: delete it from `Suggested.lean`; retain normalization in the README and use the proof when bundling the simple probability-measure definition needed by the CM headline. The retained bridge examples that are direct library invocations likewise do not test new definitions and should be removed. Do not replace this padding with a separately proved catalogue theorem.

## R21 (P3) — Restore the required README shape, Checks and exact locators

Location: `TauCetiRoadmap/SatoTateGroups/README.md:1`, `:527`, `:794`, `:1661`, `:2064`.

Claim: definitions and dependency/source descriptions meet the standing roadmap checklist.

Witness: §§0.1–0.5 and 1.1–1.5 have no per-definition three-Check lists; layers lack concluding Examples/Dependencies. “I.6.2” in DM82 is a Tate-implies-Hodge corollary, not the asserted Galois inclusion; the Newton file path omits `Symmetric/`.

Repair: use the required Summary, Conventions, Exact supplier contracts and How to read the build sections; add API bullets and at least three discriminating Checks per definition, and layer endings. Supply theorem/section and printed page at each sourced target. For Deligne's inclusion give the absolute-Hodge-cycle theorem and finite-extension invariance argument (DM82 Theorem 2.11 and its Galois-invariance inputs), with an explicit owner; do not leave “consumed … where it states it, and otherwise” as ownership. Correct the invariant-character reference to `ContRepresentation.integral_character_eq_finrank_invariants` at the pin, with continuity and finite-dimensionality. Correct `Field.absoluteGaloisGroup` to automorphisms of the algebraic closure, not maps from the closure to k. Keep scope deferrals in Scope. These are concrete omissions despite the passing text scanner.

## Previous findings: repaired, partly repaired, or not repaired

All fourteen prior findings were reconsidered before the full pass; no “not actionable in this package” disposition was supplied.

| Previous | Current passage and check | Disposition |
|---|---|---|
| R01 supply cycle | §9.9 uses Faltings “absolute irreducibility … over every finite extension”; no AdelicImages supplier edge; depcheck has zero problems. | Repaired. |
| R02 product endomorphism field | §8.2: “with equality iff every element of Hom … is defined over that compositum”; E×E^(d) now gives K=Q(√d), not Q. | Repaired. |
| R03 failed build | `Suggested.lean:1` now begins `module`; targeted worker build and independent Lean elaboration pass. | Repaired. |
| R04 invented suppliers | §4.39 determinant kernel; CM §4.1's three titled targets; GL₂-type §1.5 `totallyRealOrCm`; §8.1 uses A6.2. These resolve at the supplied versions. | Repaired; R10–R11 are different supplier overclaims. |
| R05 Fin-index degree zero | `aMoment` now takes `(i m : ℕ)`; degree-zero first moments and product convolution give 0=0. §1.5 still projects a Fin-vector at 1. | Partly repaired: R15. |
| R06 two Table 6 errors | §6.7 explicitly gives “aG_{1,3}: (a_{1,SU(2)}, 2)” and “abG_{1,1} = (ac)²G_{1,1}: (0, 2)”. | Repaired; computations below. |
| R07 absent headlines | Generator table, degree-four classification/distinctness and Serre criterion now present. Docstring still calls Hecke equidistribution merely “an input”. | Partly repaired: R18; new signatures also expose R01. |
| R08 unread dependencies | `*Needs:*` lines replace `*Rests on:*`; ArtinRepresentations and HyperellipticCurves are scope deferrals/consumers. | Repaired. |
| R09 padding | Most catalogue theorems removed; explicit normalizer probability declaration still reduces to 1/2+1/2=1. | Partly repaired: R20. |
| R10 character orthogonality | §3.3 adds “moreover E[χ_i χ_j]=0”; equivalent restricted irreducibles have cross-inner-product 1, not 0. | Repaired, reading “moreover” under the preceding irreducibility hypothesis. |
| R11 μ(n) coefficient sign | §5.6 now uses −1 for the identity component's a₁. | Repaired as a sign issue; full event carrier still fails R13. |
| R12 MZ attribution/FKS18 reference | §9.10 limits MZ to Hodge-group calculations and cites BK for Mumford–Tate; FKS18 appears in References. | Repaired; the FKS18 argument itself has the error in R01. |
| R13 meromorphy/connectedness field | §10.2 adds “meromorphic … no zeros or poles except possibly at s=1”; §9.5 distinguishes L⊇K and L=K under AST=TL. | Repaired in those respects. |
| R14 unrestricted Lie algebra | The Lean carrier is removed; §1.3 treats closed subgroups and invokes the closed-subgroup theorem. | Repaired. |

## Verified sound

This section records successful checks and failed controls explicitly; it does not certify the false statements above. Reviewed the entire 2,138-line README and 954-line Lean file, all 39 admitted theorem bodies, the 115 actual named declarations, and the fifteen seeded source targets. The worker's nominal 116-name list contains one spurious parsed name; the fresh signature probe used the actual declarations. No PR file was edited. The outside-folder diff is empty. No sorry'd data, set_option, extra import family, copied source passage, supply cycle, or route-specific good-prime restriction was found. Good-reduction primes are the domain of Frobenius classes, not a restriction on the abelian varieties being classified.

Worker gate: every listed scanner, dependency check and targeted build passed. Independent `lake env lean` of `Suggested.lean` exited 0, with only the 39 sorry warnings. A scratch copy with `#check @name` for every named declaration also elaborated. `geomEnd` and `realGeomEnd` lose the unused CharZero binder, as expected for these definitions; `realGeomEnd_surface` retains `[CharZero k]`. The CM theorems retain NumberField and IsElliptic; the parity theorems retain their Hodge hypotheses. No lost necessary binder was found. The one-tactic probe tried simp/rfl/infer_instance at all 39 admits: none closed without unfolding/additional lemmas. The targeted normalization simp in R20 succeeds. Thus elaboration passes but does not validate R01's false classification signatures.

Dependency output, run against the specified order and content:

```text
depcheck: 204 roadmaps, 1629 edges, 0 problem(s)
```

The order audit read every Needs line and supplier paragraph. FiniteGroupInvariants is a new supplier placed before its consumer by the movable-order rule, not an upward finding. No declared gaps were supplied. R10–R11 concern missing contract content, which graph checking cannot detect.

### Explicit countermodel calculations

For R01, write Z(A)=diag(A,Ā). In Z(U(2)), the circles Z(uI₂) and Z(diag(u,ū)) both have characteristic polynomial `(X−u)²(X−ū)²`. The first supplies the center, and all conjugates of the second generate SU(2); U(1)·SU(2)=U(2). This is generation by the union actually used in Lean, not by the conjugates of one chosen circle. The commutant on C⁴ is C⊕C, one scalar on the standard representation and one on its dual. Its centralizer inside USp(4) is Z(U(2)), so ST4 does not exclude it. All other listed connected groups have dimensions 1,3,2,6,10 except U(1)×SU(2), whose commutant is C³, proving nonconjugacy. Appending an independent U(1) block gives a degree-six countermodel. Circles with scalar exponents (1,1),(1,−1), together with an SU(2)-torus circle and third exponent 1, generate it. Its dimension is 5 and its commutant is C⁴. The listed dimension-five U(1)²×SU(2) has commutant C⁵. Its double commutant is again the group itself.

For R02, take a non-CM E/Q and L=Q(⁴√2,i). Let r act by α↦iα and s by complex conjugation. Descend E² using r↦[[0,−1],[1,0]], s↦diag(1,−1); these are product-polarization-preserving automorphisms, and satisfy r⁴=s²=1 and srs=r⁻¹. Their conjugation kernel on M₂(Q) is {1,r²}, so K=L^{⟨r²⟩}=Q(√2,i). Solving XM=MX gives:

| Acting subgroup | Rational fixed algebra | Idempotents/division | Fixed field |
|---|---|---|---|
| ⟨r,s⟩ | {aI}=Q | division | Q |
| ⟨s⟩ | {diag(a,d)}=Q×Q | diag(1,0) is nontrivial idempotent | Q(√2) |
| ⟨rs⟩ | {[[a,b],[b,a]]}=Q×Q | (I+rs)/2 is nontrivial idempotent | Q(√−2) |
| ⟨r⟩ | {[[a,−b],[b,a]]}=Q(i) | division | Q(i) |
| {1} | M₂(Q) | nontrivial idempotents | K |

Consequently the first two quadratic splitting fields are minimal and incomparable. Matrix multiplication also gives r²=−I and s²=(rs)²=I. No least field can lie below both except Q, where the algebra is division.

### Adversarial table: carriers, definitions, conventions and README targets

Values are explicit finite calculations or exact integral evaluations; “pass” here means the stated test, not a proof of the general target. Each section was also read for its hypotheses and proof inputs. Source-dependent classifications not independently established are identified below.

| Statement/object | Instances tried | Computed values on the two sides | Result / change |
|---|---|---|---|
| 0.1 U(d), closed subgroups, Haar | d=0; {±1}; nonclosed roots-of-unity subgroup of Circle | U(0)={1}, μ(1)=1; singleton mass 1/2; closure of all roots=Circle | Pass; closedness is essential. |
| 0.2 Ω, USp, compactness | d=0,2; diag(i,−i); diag(1,i) | Ω₀ empty; Ω₂²=−I; first conjugated form=Ω₂, second=iΩ₂ | Pass. |
| 0.2 USp₂≃SU₂, Haar bridge | I, J | det=1 in both models; J²=−I; total masses 1=1 | Pass. |
| 0.3 O(d), ambient parity | d=1; i; reflection diag(1,−1) | O₁={±1}, i excluded; determinant reflection=−1 | Pass. |
| 0.4 coeff/trace/coeffVec | I₂, J, empty matrix | polynomials 1−2T+T², 1+T², 1; a₁=−2,0,0; traces=2,0,0 | Pass sign and natural indexing. |
| 0.4 reciprocal coefficients | d=2,i=0,1,2,3 at I₂ | coefficients 1,−2,1,0; i=3 gives a_{2−3}=1≠0 | R15: i≤d. |
| 0.4 Newton converse | diag(1,−1),diag(i,−i) | s=(0,2),(0,−2); a₂=−1,1; 2a₂=s₁²−s₂ | R06. |
| 0.5 symplectic torus/classes | diag(i,−i), its swapped diagonal; g=0 | both charpolyRev=1+T², conjugator J; empty polynomial=1 | Pass. |
| 0.5 orthogonal torus | O₂ reflection | det−1 versus torus det+1 | R07. |
| 1.1 identityComponent, quotient | Circle, μ₃, SU₂ | components respectively 1,3,1; μ₃ identity component={1} | Pass. |
| 1.2 open identity/finite components | N(U₁); trivial group | 2 open cosets, each mass1/2; one component of mass1 | Pass. |
| 1.3 Lie algebra/dimension | Circle; finite μ₃; USp₄ | dimensions1,0,10; finite group's tangent={0} | Pass; no extra Lean carrier. |
| 1.4 componentCoset/Measure | N(U₁), each coset | restricted Haar mass1/2 times c=2 gives1; averaging returns1/2 | Pass denominator c≥1. |
| 1.5 coefficientLaw | μ₃, G={I₂} | pushforwards each have mass1; first has three atoms1/3; second a=(1,−2,1) | Pass. |
| 1.5 traceLaw vector projection | d=0 | δ₀ versus δ₋₁ | R15. |
| 1.5 conjLaw | finite S₃ | class masses 1/6,3/6,2/6; total1 | Pass; not uniform on classes. |
| 2.1 HodgeNumbers/weightOne | g=0,1; w=2,d=1 at middle | sums0,2,1; odd-weight dimensions0,2 are even | Pass; symmetry condition matches literal definition. |
| 2.2 HodgeCircle | torus of SU₂, u=i and −1 | eigenvalues(i,−i), (−1,−1); polynomial at−1=(X+1)² | Pass exponent is integer. |
| 2.2 finite exclusion | μ₃ in weight0; finite USp₂ in weight1; g=0 | ST2 true, false, true respectively | Lean correct; R16 prose. |
| 2.2 dense generation | U₂, the two circle types above | generated identity component=U₂, not proper | R01. |
| 2.3 rationality/character equivalence | μ₃ component ζ₃; connected U₁ | component a₁=−ζ₃∉Z; U₁ moments0,2,0,6 | Pass polynomial-character equivalence; whole-group integrality differs from component integrality. |
| 2.4 self-duality | μ₃, μ₂ in weight0 | ζ₃ not real; ±1 real | False,true respectively. |
| 2.4 Lefschetz double commutant | U₂ on C⁴; doubled SO₃ on C⁶ | U₂ commutant C² and double centralizer U₂; SO₃ excludes−I₆ | R01/R08; ST4 does not repair ST2. |
| 2.5 central parity | odd weight at−1; even weight at−1 | u^{2p−w}=−1,+1 respectively | Pass. |
| 2.5 integrality | finite C₃, S₃ standard representation | C₃ trace moments1,0,0,1; S₃ χ=(2,0,−1), average0, square average1 | Pass including nonabelian case. |
| 2.5 finite-index inheritance | U₁⊂N(U₁) | same identity component, indices1 and2, integral component moments | Pass. |
| 3.1 coeffMoment/aMoment | d=0; i>d; m=0,1 | a₀ moments1; out-of-range moments1,0; trace first moment0 | Pass repaired Nat indices. |
| 3.2 traceMoment parity | μ₁; odd-weight U₁ | μ₁ trace1, a₁=−1; U₁ odd moments0=0, second2=2 | Pass with actual Hodge hypothesis. |
| 3.3 moment simplex | G={I₂}, G={±I₂} | first moment−2 versus0 | R09. |
| 3.3 character matrix/diagonal | S₃ trivial and standard; SO₃ std and determinant twist | inner products0,1; SO₃ cross=1 despite two distinct ambient labels | Pass repaired irreducibility clause. |
| 3.4 coeffProb/traceZeroDensity | U₁; N(U₁) | trace-zero probability0 and1/2 | Pass. |
| 3.5 componentProb | J·U₁, identity U₁ | at a₁=0, probabilities1 and0; at a₂=1 both1 | Pass. |
| 3.5 zCount | N(U₁), a₁=0; μ₃, a₁=−ζ₃ | z/c=1/2 and1/3 | Pass. |
| 3.5 analytic null-set route | f(x)=x on R; f≡0; dimension0 point | zero-set masses0, full,1; f≡1 on point has empty zero set | Pass with nonzero/connected hypotheses; proof target remains owned here. |
| 3.6 STRecord/counts | μ₁,μ₃ | trace row μ₁ all1; μ₃ full events−1,−ζ₃,−ζ₃² each1/3 | R13. |
| 4.1 torus/Weyl group | g=0,1,2 | orders 2⁰0!=1,2,8; for g=2 signed permutations=4·2 | Pass. |
| 4.2 Weyl normalization | g=0,1,2, f=1 | 1; (2/π)(π/2)=1; (8/π²)(π²/8)=1 | Pass constants. |
| 4.2 pair of roots | θ₁=0,θ₂=π/2 | 16sin²(π/4)sin²(−π/4)=4=4(cos0−cos(π/2))² | Pass factor4. |
| 4.3 blockProd/interlace | two I₂ blocks; J and I₂; empty factor | Ω₄ preserved; a₁=−4 or−2; a₂=6 or2; empty factor leaves coefficients unchanged | Pass ordering. |
| 4.3 convolution | SU₂×SU₂, powers2,4; rank0 | 1+1=2; 2+6+2=10; degree-zero first moment0=0 | Pass. |
| 4.3 diagonal copies | g=2, t=2 and0 | a₁=−4,0; a₂=t²+2=6,2 | Pass; different from independent factors. |
| 4.4 arcsine | powers0,2,4,6 | 1,2,6,20 = central binomial coefficients | Pass. |
| 4.4 semicircle | powers0,2,4,6 | 1,1,2,5 = Catalan numbers | Pass. |
| 4.4 bSeq/cSeq | n=0,1,2,4 | b=1,0,2,6; c=1,0,1,2; divisors1,1,2,3 | Pass no zero denominator. |
| 4.5 joint support/density | (10,25),(0,0); θ=(0,π) | ρ=2632,32; angle gives(a₁,a₂)=(0,−2),ρ=0 | R05; boundary density0. |
| 4.5 a₁ moment formula | n=0,2,4,6,8,10 | c_n c_{n+4}−c_{n+2}²=1,1,3,14,84,594 | Pass. |
| 4.5 a₂ moment formula | n=0,1,2,3,4,5 | binomial sum=1,1,2,4,10,27 | Pass. |
| 4.6 six explicit groups | first nonzero trace moments; diagonal vs product | U₁₂:8,96; SU₂₂:4,32; U₁²:4,36; U₁×SU₂:3,20; SU₂²:2,10; USp₄:1,3 | Listed groups valid; exhaustiveness fails R01. |
| 4.7 fourteen explicit groups | SU₂×U₁₂ and U₁×SU₂₂ | dimensions4,4; second trace moments1+8=9,2+4=6 | Pass nonconjugacy; completeness fails R01. |
| 5.1 u1/nu1/su2/J | u=i; J | J²=−I, detJ=1; Jdiag(u,ū)J⁻¹=diag(ū,u) | Pass. |
| 5.2 degree-two axioms | three listed groups | ST1,ST2,ST3 true; nonidentity normalizer coset a₁=0,a₂=1 | Pass. |
| 5.3 degree-two classification | proper connected case and disconnected extension | connected dimensions1 or3; torus normalizer quotient order2 | No counterexample; source supports. |
| 5.4 invariants | U₁,N(U₁),SU₂ | (dim,c,z)=(1,1,0),(1,2,1),(3,1,0); second moments2,1,1 | Pass. |
| 5.5 SU₂[C_n] | n=1,2,3, m=2,4 | n=1 moments1,2; n=2 moments0,2; n=3 moments0,0 | Pass 2n divisibility, rational iff n≤2. |
| 5.5 nu1Mu n quotient | n=1,2,3 | C₂,C₂²,C₆; [J,D]=1 modulo U₁; components2,4,6 | Pass abelian quotient; no live-code claim certified. |
| 5.5 nu1Mu n trace | n=1,m=0,2,4 | actual1,1,3; displayed formula1/2,1,3 | R16. |
| 5.5 even-weight conjugacy | nu1Mu1 versus O₂ | determinant images{1},{±1}; J²=−I versus reflection²=I | R14. |
| 5.6 μ(n) | n=0,1,2,3 | μ₀=Circle; positive n have n components; μ₃ third trace moment1 | R16 n≥1; R13 counts. |
| 6.1 Z,N,Jfour/quaternions | scalarZ1; Jfour; quatOmega | scalarZ1=−I; Jfour²=I; ω³=−I; ωiω⁻¹=j | Pass coordinate conventions. |
| 6.2 binary rotation groups | C₂,D₂,Q₈,2T,2O | binary orders4,8,8,24,48; modulo center orders2,4,4,12,24 | Pass small nonabelian controls; primary textbook unavailable. |
| 6.3 generator list | family counts; E₁; F_c indices | 32+10+8+2+2+1=55; scalar−I already in SU₂; excluded indices44,48,49 | Pass table transcription checks. |
| 6.4 connected exhaustion | embedded U₂ | dimension4, commutant dimension2; listed dimension4 case has3 | R01. |
| 6.5 rationality bound | n=3,4,5,6 | 2(2cos(π/n))²=2,4,3+√5,6 | n=5 excluded correctly. |
| 6.6 classification | U₂ as G | ST1–ST3=true; no member with same dimension and commutant | R01. |
| 6.7 component engine | aG₁₃; (ac)²F; (SU₂₂,1,r=2) | a₁² averages1,0; last a₂=t²+2 gives mean3 | Repaired source rows. |
| 6.8 distinctness invariants | U₁² and SU₂₂ | both second trace moment4; fourth moments36 versus32 | Pass this separation; no claim of a full 55-pair proof. |
| 6.9 inclusion relation | C₁⊂USp₄; J(C₁),C₂⊂J(C₂) | infinite index in first; indices2,2 in latter | Pass finite-index definition; R19 certificate route. |
| 6.10 real-place condition | U₁ alone; N(U₁) | abelian conjugation fixes u, cannot invert every u; J²=−I and J inverts | Pass distinction. |
| 7.1 Jordan input | Q₈⊂GL₂(C) | cyclic subgroup order4 normal index2 | Supplier resolved. |
| 7.2 finiteness | d=0; d=1,w=0; C₅ family | one group; rational self-dual finite possibilities μ₁,μ₂; C₅ nonintegral3+√5 | No counterexample to finiteness; cited proof does not fix R01. |
| 7.3 connected classification | U₂×U₁; SO₃; SU₃ | first ST1–ST4 true with dim5/commutant4; latter cannot contain−I₆ | R01/R08. |
| 7.4 arithmetic totals | table rows vs headline | extensions433; realizable410; difference23; maxima192=64·3,432=16·27,336=16·3·7 | Source totals agree; R19 and R01 prevent certificate acceptance. |
| 8.1 geomEnd/realGeomEnd/action | non-CM E; CM E with Q(i) | End⁰=Q orQ(i); realification R orC; conjugation i↦−i | Pass source/target of action; heavy construction absent from pins acknowledged. |
| 8.2 endField | CM E/Q; E×E^(d) | K=Q(i) for first; factor fieldsQ,Q but productQ(√d) | Repaired product law; finite action kernel gives finite Galois K. |
| 8.2 base change | F=K; F=k | FK=K; Gal(FK/F)=1 orGal(K/k) | Pass. |
| 8.3 simple/geometric/simple factors | E, E², E₁×E₂ nonisogenous | division Q; matrix M₂(Q); product Q×Q; E² multiplicity2 | Pass distinctions. |
| 8.4 six real types | E² non-CM; CM square; QM surface | M₂(R),M₂(C),M₂(R); dimensions4,8,4 | Lists agree with source; R10 prerequisite. |
| 8.5 rational types | E²; product distinct CM curves; QM | M₂(Q); F₁×F₂; division quaternion B | Pass shape list; realification loses division as R03. |
| 8.6 GL₂-type definitions | E² non-CM | Q(√2) embeds in M₂(Q), so Ribet predicate true; listed LMFDB simple-surface predicate false | Pass explicit distinction. |
| 8.7 GaloisEndType | same CM square overQ and CM field | C₂ acts by conjugation on M₂(C); after base change action trivial | Pass real invariant; cannot recover R03 data. |
| 8.8 intrinsic label prefix | μ₃; N(U₁) | (weight,degree,dimension,components)=(0,1,0,3),(1,2,1,2) | Pass intrinsic numbers; database labels not independently certified. |
| 9.1 Tate/similitude convention | elliptic good prime q=5,t=0 | polynomial X²+5; determinant5; normalized det1 | Pass arithmetic Frobenius normalization. |
| 9.2 closures | CM elliptic, endomorphisms defined or not | torus or normalizer; component counts1,2 | Correct examples; R11 missing openness supplier. |
| 9.3 maximal compact | C× and its compact circle | |z|=1 gives U₁; noncompact element2 excluded | R11 construction ownership. |
| 9.4 MT/AST/TL | CM elliptic; abstract O₂ centralizer | MT rank2, Hg rank1; O₂⁰=SO₂ but π₀ order2 | R12 connectedness; R17 ownership. |
| 9.5 component field | CM E/Q and E over CM field | Gal(K/k)=C₂ then1; normalizer/torus component counts2 then1 | Pass under AST=TL; general L⊇K retained. |
| 9.6 Frobenius class | 11.a,p=2; CM inert p=5 | a₂=−2, normalized trace−√2, coeff₁√2, angle3π/4; inert trace0, polynomial1+T² | Pass sign, p=2 not excluded. |
| 9.7 real dictionary | E² non-CM; E₁×E₂ nonisogenous | SU₂ diagonal↔M₂(R); SU₂²↔R² | Pass arithmetic examples; R03 rational claim not supported. |
| 9.8 realizability counts | 55 abstract named groups; exclusions; real/Q counts | 55−3=52; 52−14−3=35; 35−1=34 | Arithmetic source counts agree; this is not proof of all assignments. |
| 9.9 elliptic trichotomy | non-CM, CM over base, CM not over base | SU₂,U₁,N(U₁); component counts1,1,2 | Pass; no open-image supplier cycle. |
| 9.9 newform determinant | n=1 non-CM; n=2 determinant kernel; CM even-weight variant | det images{1},{±1}; reflection squareI in even variant | Carrier statistics pass; R14 prevents confusing variant with nu1. |
| 9.10 dimension≤3 | non-CM E; CM E; E² | Hg=SL₂, norm-one torus, diagonal SL₂ respectively | Source supports low-dimensional theorem; exact Deligne input locator fails R21. |
| 9.11 splitting field | D₄ twist described above | two minimal quadratic fields, intersectionQ nonsplit | R02. |
| 9.12 endLattice | real type[1,M₂(R)] | rational M₂(Q) vs B; simple=false vs true | R03. |
| 10.1 pushforward | uniform C₄ toC₂ | two fibers of size2, pushed masses1/2 | Pass; generic weak-convergence API imported. |
| 10.1 Weyl criterion | constant identity; uniform finite group sequence | nontrivial χ average dimχ≠0 for constant; finite uniform nontrivial averages0 | Pass negative control. |
| 10.1 SU₂ Chebyshev test | θ=0 constant; semicircle | U₁(cos0)=2; semicircle integral U₁=0 and U₂=0 | Pass criterion is nonvacuous. |
| 10.2 Serre criterion | trivial group; constant identity sequence inC₂ | trivial group has no nontrivial tests, empirical=δ₁; C₂ sign product=ζ_k with pole at1 | Pass; bad sequence fails holomorphy. |
| 10.3 Sato–Tate moments/events | N(U₁) a₁=0; U₁ a₁=0 | constant coset mass1/2; nonconstant coset level null; boundary mass0 in group | Pass continuity-set inference; arithmetic conjecture remains a predicate. |
| 10.4 Hecke | ψ=N; ψᵤ=N^{it} | first average1 vs Haar0; nonzero t gives shifted zeta pole | R04. |
| 10.5 CM over CM field | CM infinity type(1,0) | unitary weights(1/2,−1/2), nonzero powers unequal; trace second/fourth2,6 | Pass corrected no-norm-power hypothesis. |
| 10.6 CM without CM field | inert/split quadratic cases | masses1/2,1/2; moments0,1,0,3; trace-zero density1/2 | Pass. |
| 10.7 non-CM imported theorem | non-CM elliptic overQ | second/fourth moments1,2, distinct from CM1,3 | Supplier theorem resolved; no new proof claimed. |
| 10.8 products | same CM curve squared; different CM fields | diagonal second moment8; independent product second4 | Pass dependence control; mixed joint analytic theorem not independently certified. |

### Headline-to-signature and pin audit

The README's end results are symplectic torus conjugacy; component finiteness; integral/component statistics; Weyl integration and USp(4) moments; degree-two and degree-four classification/distinctness; finiteness at fixed Hodge numbers; connected degree-six and full degree-six classification; six real surface endomorphism types; the arithmetic ST construction, component/endomorphism dictionary, realizability and low-dimensional independence; the Weyl and Serre criteria, Hecke equidistribution, and CM equidistribution. The file states the statable group/moment results and Serre/CM results. The arithmetic construction/dictionary is explicitly listed as unavailable because the algebraic-monodromy and transport carriers are missing. This is an appropriate boundary, not permission to use free predicates. Hecke is statable and omitted (R18). The full degree-six result is a headline even though its list is not present. No “empty Prop” stand-in was found.

Opened declarations at Mathlib pin `f6090c7095e1e56b3464c1daba5f24631f1290d2` and Tau Ceti pin `358314d4ab97483df4fc4cb8adcc02e74a8d9f5a` include:

| Pinned file and line | Declaration/content checked | Consequence |
|---|---|---|
| `Mathlib/LinearAlgebra/Matrix/Charpoly/Coeff.lean:290`, `:334` | `Matrix.charpolyRev`, `coeff_charpolyRev_eq_neg_trace` | det(1−TM), a₁=−trace including empty matrices. |
| `Mathlib/RingTheory/MvPolynomial/Symmetric/NewtonIdentities.lean:221`, `:245` | `mul_esymm_eq_sum`, `psum_eq_mul_esymm_sub_sum` | Integral recurrence includes k; inverse requires division. |
| `Mathlib/FieldTheory/AbsoluteGaloisGroup.lean:42` | `Field.absoluteGaloisGroup` | Automorphisms of AlgebraicClosure K over K. |
| `Mathlib/AlgebraicGeometry/EllipticCurve/LFunction.lean:43` | `WeierstrassCurve.localPolynomial` | Minimal-model local polynomial; good reduction gives 1−aT+qT². |
| `Mathlib/MeasureTheory/Measure/Typeclasses/Probability.lean:64`, `:71` | probability class, `isProbabilityMeasure_iff` | Normalization is precisely μ(univ)=1. |
| `Mathlib/Basic/ENNReal/Inv.lean:531` | `ENNReal.inv_two_add_inv_two` | R20 one-simp probe. |
| `TauCeti/RepresentationTheory/Compact/Haar.lean:93`, `:135` | `haarProb`, uniqueness theorem | Existing normalized Haar, no new owner. |
| `TauCeti/RepresentationTheory/Compact/Invariants.lean:273` | `integral_character_eq_finrank_invariants` | Full-group character integrals are invariant dimensions; no assertion of component integrality. |
| `TauCeti/Topology/Algebra/OrthogonalGroup.lean:44` | `Matrix.isClosed_orthogonalGroup` | Closed orthogonal matrix carrier over T₁ topological commutative rings; not an O₂ torus-conjugacy theorem. |
| `TauCeti/RepresentationTheory/SU2/Weyl/Integration.lean:146` | `weyl_integration_formula` | Haar eigenangle constant2/π. |
| `TauCeti/RepresentationTheory/SU2/Completeness.lean:170` | `character_symPower_eq_chebyshevU_eval` | Actual SU₂ character test functions. |
| `TauCeti/Probability/Process/EmpiricalMeasure.lean:134` | `empiricalMeasure` | Averages n+1 terms; replacing by N terms changes the indexing, not the limit. |
| `TauCeti/NumberTheory/NumberField/Global/HeckeCharacter/Ideal.lean:120` | `idealCharacter` | Native ideal-value carrier for R18. |
| `TauCeti/NumberTheory/NumberField/Global/HeckeCharacter/Algebraic.lean:141`, `:217` | `normCharacter`, non-finite-order norm twists | Infinite order is not the analytic nonexceptionality hypothesis. |

The retained definitions use native matrix, subgroup, algebraic-closure, tensor-product, elliptic-Hom and measure carriers. There is no new elliptic Frobenius Prop parameter. The normalized-trace definition uses the local polynomial rather than an arbitrary function assumed to be a trace. General USp embedding/conjugacy and component statistics have distinct scope from the existing SU₂ engine; they are appropriate extensions. Generic Haar, characters, weak convergence, Mumford–Tate construction and determinant kernels have earlier owners and must stay there.

### Resolved ownership and supplier citations

Object searches used the roadmap service across main/open work and the supplied board packages, plus pinned source searches. Existing roadmaps were read on main, including the main versions of LieGroups, ClassicalGroups, RootSystems and ReductiveGroups; new suppliers were read at their open heads. Main EllipticCurves and ReductiveGroups were also read for README shape. The nine citation-resolver leads were checked: the eight LMFDB keys are database names, not claimed Lean declarations, and `PositiveInvolution.center_classification` is a PEL target, not a missing pinned declaration. No duplicate fully qualified SatoTateGroups declaration was found in the searched pins or roadmaps. Later AdelicImagesAndModularCurves, ArtinRepresentations, HyperellipticCurves and AbelianSurfacesModularity consume these group/arithmetic invariants; they do not supply them.

| Supplier file (repository-relative) | Sections/lines read | Resolution |
|---|---|---|
| `TauCetiRoadmap/RepresentationTheory/LieGroups/README.md` | Layer2 at278; Layer6 at384; Layer9 at451 | Closed subgroups, tori/Weyl resolved; maximal-compact existence overclaimed, R11. |
| `TauCetiRoadmap/RepresentationTheory/ClassicalGroups/README.md` | Layers2–4 | Highest-weight/Schur-character objects belong here. |
| `TauCetiRoadmap/RepresentationTheory/RootSystems/README.md`, `LieHighestWeight/README.md` | root classification and highest-weight dimensions | Supply Lie-theoretic inputs, not the false ST2 eliminations. |
| `TauCetiRoadmap/AbelianSchemesAndArithmeticModuli/README.md` | A3.2, A3.5–7, A4.1, A5; A6.2 at2843, A6.4 at2876, A6.7 at2939, A6.14–17 | Hom/Tate/trace/Rosati contracts resolve; no type-III surface exclusion. |
| `TauCetiRoadmap/PELModuli/README.md` | M0.1 at459, M0.2 at496–526 | Positive involutions/Albert algebra types, including definite quaternion case. |
| `TauCetiRoadmap/EllipticCurveModularityPartIIGL2TypeAbelianVarieties/README.md` | §§1.2,1.4,1.5,5.1 | End0, primitive dichotomy, GL₂-type endomorphism field, totallyRealOrCm, Q-curves resolved. |
| `TauCetiRoadmap/ModularityAndLanglandsExtensions/README.md` | §§4.28 at2874,4.34 at2940,4.39 at3033,4.42 at3135 | Conditional/general and Q/CM-field results distinguished; determinant-kernel ownership retained. |
| `TauCetiRoadmap/ComplexMultiplicationAndExplicitReciprocity/README.md` | §4.1 | Three actual titled Hecke/Tate/Frobenius targets, not the old invented names. |
| `TauCetiRoadmap/LFunctions/README.md` | Layers6–7, unitaryWeight and norm exception | Analytic exception directly contradicts R04's inference. |
| `TauCetiRoadmap/FaltingsFinitenessAndIsogenyTheorems/README.md` | R28.4.5 at1871 and R28.4.6 at1899 | Tate semisimplicity and End/Hom comparison resolve, including finite base extensions. |
| `TauCetiRoadmap/DeligneWeightsAndPurity/README.md` | §2.2 at1093, §8.14 at2582 | Open⇒dense and reductivity input; no openness theorem. |
| `TauCetiRoadmap/FiniteGroupInvariants/README.md` | §10.5 at1022–1062 | Characteristic-zero Jordan bound, finite modulo scalars; genuine new supplier. |
| `TauCetiRoadmap/ProbabilisticAndMetricNumberTheory/README.md` | §2.1 at2205–2320 | Exact weak-convergence, Borel/outer-approximation and continuity-set hypotheses resolved. |
| `TauCetiRoadmap/Chebotarev/README.md`, `ArithmeticDirichletSeries/README.md` | Layers12,14; Wiener–Ikehara/PNT | Tauberian and quadratic splitting-density supply resolved. |
| `TauCetiRoadmap/NeronModelsAndSemistableAbelianVarieties/README.md` | Layer5 | Néron–Ogg–Shafarevich input resolved. |
| `TauCetiRoadmap/ReductiveGroups/README.md` | Layer3 at235–249 | Geometric components and subgroup-scheme dictionary; the specific monodromy closure needs its construction spelled out. |
| `TauCetiRoadmap/ShimuraData/README.md` | §1.2 at185–224 | Earlier owner of MT; R17. |
| `TauCetiRoadmap/MotivesAndAlgebraicCycles/README.md` | object search for absolute Hodge/Mumford–Tate inclusion | No exact target matching the conditional deferral in §9.10 was located; ownership must be made definite. |
| `TauCetiRoadmap/JacobianChallenge/README.md`, `EllipticCurves/README.md`, `ModularForms/README.md`; `Completed/NumberFieldArithmetic/README.md` | named abelian-variety, elliptic CM/Tate, newform and prime carriers | Carrier scope resolved; newform/monodromy heavy constructions are not smuggled into Lean. |

### Seeded source audit

Source ids refer to service extractions. Versions read: FKRS12 arXiv1110.6638v2; FKS23 arXiv2106.13759v5; SUT19 arXiv1604.01256v6; BK15 arXiv1109.4449v2; MZ99 arXivmath/9901113v2; FKS18 arXiv1212.0256v4 (the published 2016 paper); SerreNX the cached legal Collège de France copy; KS99 the author's scanned book; Ribet85 the author's scan; DM82 Milne's author-hosted re-typesetting. Legal retries used [Katz’s book copy](https://web.math.princeton.edu/~nmk/RMFEM.pdf), [Ribet’s scan](https://math.berkeley.edu/~ribet/Articles/rankin.pdf), and [Milne’s Deligne text](https://www.jmilne.org/math/Documents/Deligne82.pdf). LMFDB denotes the particular knowl identified in each row. No README locator was explicitly labelled unverified; all fifteen seeded targets were followed.

| Target | Locator/text read | Outcome |
|---|---|---|
| 0.4 coefficient map | Pinned charpoly and Newton files above | Sign/forward identities supported; inverse integrality false, R06. |
| 2.3 rationality | FKRS12 Definition3.1, p.13, line563; FKS23 Definition3.12, p.12, line538 | Component integrality/characters supported. Symmetric-polynomial bridge has its named supplier. |
| 4.1 torus/Weyl | KS99 §5.0.4, pp.107–108, line4747; pinned SU₂ Weyl engine | Conjugacy-angle and normalized measure text read; signed-permutation count independently computed. README needs a direct locator at §4.1. |
| 5.1 three groups | SUT19 §3, Theorem3.2, p.26, line1122; pinned SU₂ normalizer | Matrices, two normalizer components and elliptic trichotomy agree. |
| 6.9 inclusion lattice | LMFDB `st_group.subgroups`, line90 | Source explicitly uses proper finite-index subgroups. Tested indices2,2; full stored relation/certificate not verified. |
| 7.2 finiteness | FKRS12 Remark3.3, p.14, lines610–629 | Actual argument uses Tannaka–Krein, exponent/Jordan bound and finite-subgroup conjugacy theorem, not merely root classification. No false finite-list inference accepted. |
| 7.4 degree6 | FKS23 Theorem1.1, pp.2–3, lines89–100; Table9 p.83, lines3998–4018 | 410 realizable,33 maximal;433 extensions/23 excluded; maximal orders agree. R01 prevents transferring the completeness claim to the literal axioms without repair. |
| 8.2 endomorphism field | FKRS12 Proposition4.1, p.20, lines935–946; Silverberg92 attempted | Minimal endomorphism field/finite faithful action supported. Silverberg's original Theorem2.4 not read; not certified from its title. |
| 8.5 rational types | LMFDB `g2c.geom_end_alg` lines90–112; `g2c.end_alg` lines90–104; FKRS12 §4.1 pp.21–22 | Nine geometric shapes and five Q-base shapes supported. No rational-isomorphism reconstruction from real type follows. Shimura75 proof not obtained. |
| 9.4 named hypotheses | BK15 Theorem6.1 p.11 lines468–477; FKRS12 Theorem2.16 p.11 lines497–501 | Primary theorem has additional connectedness assumption, R12. |
| 9.5 axioms/components | FKRS12 Proposition3.2 pp.13–14 lines579–609; Proposition2.17 p.12 line507; FKS23 Lemma3.7 p.11 lines486–490; SUT19 Theorem3.12 p.31 line1346 | Low-dimensional component/field statements supported. Source Hodge-generation issue is R01, not a successful classification check. |
| 9.9 elliptic/newforms | SUT19 Theorem3.2 p.26 line1122; Ribet85 Theorem3.1 p.191 lines255–271 | Ribet gives maximal image after restriction to its H for almost all coefficient primes, not the entire asserted CM dictionary. Non-CM route resolved to Faltings/MLE; live CM labels not certified. |
| 10.1 pushforward/Weyl | SUT19 Proposition2.9/Corollary2.10 p.15 lines661–686; pinned characters | Nontrivial irreducible-character averages vanish; trivial character has integral1. |
| 10.3 conjecture | FKRS12 Conjecture1.1 p.3 line124; SerreNX §8.4 lines4460–4474 | Norm ordering and conjugacy-class formulation agree. Density inference uses component-null boundaries, not merely arbitrary singleton continuity. |
| 10.4 Hecke | SUT19 Lemma2.15 p.18 lines782–804 | Located and read; false as stated without nonexceptionality, R04. CM-specific Proposition2.16 lines813–824 has the relevant infinity type. |

## Not verifiable

The review is complete with the limitations below; no acceptance or pause is inferred from inaccessible texts. All cited works were submitted to the source service, and failed retrievals were recorded together in `needs-references.toml`. Successful author-page retries were used for KS99, Ribet85 and DM82. These limitations are not claims that the corresponding mathematical results are false.

- Silverberg92, Theorems2.4/4.1: arXiv lookup returned HTTP503; DOI resolves to a paywalled publisher. FKRS Proposition4.1 was read, but does not certify the original numbered torsion theorem.
- Serre68, Appendix I.A.2 Theorem2: service search returned HTTP429. SUT19's explicit criterion was read, including its converse hypotheses.
- Mumford74 §21; Shimura75; Ribet04 §§1–3; Artin11 §6.12; Bump13 Chapters17–18/23; BTD85 ChaptersII/IV: title/DOI searches returned rate limits or paywalled/unclassified publisher pages. No original-text certification.
- FS14, Johansson17, Taylor20, BLGHT11, BCGNT25 and KS09: service arXiv searches returned rate limits and/or publisher landing pages without a certified legal full text. Their detailed joint-equidistribution, non-CM and moment locators remain uncertified. They were not treated as proofs merely because named in the bibliography.
- The three LMFDB knowls listed above were read. The live source code, all degree-four/degree-six database rows, all inclusion multiplicities, exceptional curve assignments, and claimed live `1.6.L.*` dimension/moment errors were not independently certified. The available FKS23 Table9 gives dimension2 for type L; that alone says nothing about present live database rows.
- No exhaustive enumeration of all 433 candidate presentations, all 410 realizations, or all 55×55 inclusions/distinctness comparisons was performed. The finite examples and source tables were checked as recorded, and completeness is already refuted for the literal Hodge predicate. No fabricated exhaustive-check claim is made.
- Source numbering in the report is explicitly the version read: BK15's arXiv Theorem6.10 is cited as 6.11 by the later FKS23 text; DM82's author-hosted version has Corollary6.2, not a Galois-inclusion Proposition6.2. Published numbering must be reconciled in the roadmap's locators.

## Source issues

- **Error** in FKRS12 at Definition 3.1/Lemma 3.7/Theorem 3.4, printed pp.13,16,15: the source admits embedded U(2) under its axioms but excludes it from the connected list; it should impose an adequate stronger condition or enlarge the abstract list; affects a stated result.
- **Error** in FKS18 at Remark 2.3, printed pp.6–7: the source infers failure of collective generation from failure of each individual circle's conjugates; it should account for scalar and SU(2) circles generating U(2) together; affects the proof.
- **Error** in FKS18 at §2.3, printed p.6: the source gives the centralizer of embedded U(2) as {±I}; it should be its scalar U(1) center, embedded as diag(uI₂,ūI₂); affects nothing.
- **Error** in FKS23 at Definition 3.12/§3.6, printed pp.12,14–15: the source excludes U(2) factors using the all-Hodge-circles axiom; it should account for U(2)×U(1), which satisfies all four stated axioms; affects a stated result.
- **Error** in FKS23 at §3.6, printed p.15: the source says embedded SO(3) and SU(3) satisfy ST2; it should say both fail ST2 because neither contains −I₆; affects a stated result.
- **Error** in FKRS12 at (5.1) and its support region, printed p.40: the source gives the joint density on a region with unbounded extra components; it should impose |a₁|≤4 and vanish outside the resulting compact region; affects a stated result.
- **Error** in SUT19 at Lemma 2.15, printed p.18: the source asserts Haar equidistribution for every unitarized Hecke character; it should exclude every nonzero power that is a pure imaginary norm character; affects a stated result.
- **Gap** in FKRS12 at Theorem 2.16(a), printed p.11: the source invokes BK Theorem6.1 with two assumptions; it should also establish or assume the third connectedness condition; affects the proof.
- **Error** in FKRS12 at Table 6, printed p.42: the source assigns the U(1) trace law to aG_{1,3}; it should assign the SU(2) trace law, with second moment1; affects a stated result.
- **Error** in FKRS12 at Table 6, printed p.42: the source assigns a nonconstant first coefficient to (ac)²G_{1,1}; it should give (a₁,a₂)=(0,2), since (ac)²=−ab; affects a stated result.
- **Misprint** in FKRS12 at Table 6, printed p.42: the source omits the square on the SU(2) trace in the (G₃,1,r) row; it should give t²+r²−2; affects a stated result.
- **Misprint** in FKS23 at Table 9, printed p.83: the source gives dimension3 for SU(2)×U(1)₂; it should give 3+1=4; affects nothing.
- **Misprint** in FKRS12 at §3.4, printed p.17: the source gives the squared-trace component average as (2cos(π/n))²; it should be 2(2cos(π/n))², since the circle trace has second moment2; affects nothing.
