# Review of AdelicImagesAndModularCurves (pull request #1727 at 804f704)

**Verdict:** needs changes

## R01 (P1) — The GL₂ lifting statement needs determinant control

Location: `TauCetiRoadmap/AdelicImagesAndModularCurves/README.md:772–787`. “H is open”

The GL₂ conclusions do not follow from the residual hypothesis. The same missing condition propagates to the number-field criterion in §3.4, lines 1098–1101.

**Witness:** At ℓ=5, H=SL₂(ℤ₅) satisfies the residual premise and is not open. Also H=det⁻¹(μ₄(1+25ℤ₅)) is open of level 25 and surjects onto GL₂(𝔽₅).

**Repair:** Keep the general closed-subgroup theorem: H contains SL₂(ℤ₅), hence equals det⁻¹(det H). Openness requires open determinant image; equality with GL₂ requires full determinant. State the residual thresholds with the appropriate determinant hypothesis, and retain the general number-field determinant image. In the second witness the determinant index is 5, so the repaired formula gives index 5 and level 25, not level 5.

## R02 (P1) — Good reduction does not force maximal CM image over a number field

Location: `TauCetiRoadmap/AdelicImagesAndModularCurves/README.md:1413–1422`. “for every ℓ at which E/KF has good reduction”

The norm from the base field is replaced by the identity on local units without justification. Base extension can kill torsion while preserving good reduction. The unrestricted number-field assertions at lines 1111–1112 also drop the base-field hypotheses of Lozano-Robledo’s theorems.

**Witness:** Take E:y²=x³−x and K=ℚ(i,E[5]). E has good reduction above 5, but ρ̄₅(G_K)=1; its split CM Cartan has order (5−1)²=16.

**Repair:** Use the actual local norm image, including base ramification and the finite character. Keep openness and maximality at almost all primes; remove the bound by bad-reduction primes alone. Apply the explicit classification with its stated base field and exceptional-j hypotheses (lozano lines 96–120, 136–167). The witness then has 5 in the exceptional set despite good reduction.

## R03 (P1) — Agreeable closure is asserted outside its domain

Location: `TauCetiRoadmap/AdelicImagesAndModularCurves/README.md:877–883`. “S_χ are agreeable”

Both the example list and the unrestricted closure theorem are false. Zywina assumes full determinant for the input of Proposition 8.1.

**Witness:** S₃₇ has GL₂-level 74 and SL₂-level 2, with odd prime sets {37} and ∅. For H=Γ(3), intersecting the four agreeable Borel preimages leaves only scalar reductions, of determinant 1.

**Repair:** Require IsFullDet H in the closure theorem, as in zywina2022 lines 2029–2031, printed p.42. Restrict the Sχ examples to characters of conductor supported at 2. Γ(3) is then excluded, and S₃₇ has agreeable closure GL₂, as the source explains at lines 296–298.

## R04 (P1) — There are infinitely many quadratic refinements

Location: `TauCetiRoadmap/AdelicImagesAndModularCurves/README.md:899–904`. “There are finitely many”

An open subgroup of GL₂(Ẑ) need not have finitely many continuous quadratic characters. Its determinant already provides infinitely many.

**Witness:** For H=Γ₀(3)=±Γ₁(3), let ψ be its upper-left entry mod 3. Every quadratic character χq of conductor q≠3 gives ker(ψ·χq∘det), with −I excluded and ±kernel=H.

**Repair:** State finiteness only with a fixed level bound. Remove the finite-Frattini assertion. For distinct auxiliary primes q these kernels differ on the q-component; their levels grow, while each fixed finite quotient has only finitely many subgroups.

## R05 (P1) — Arithmetic covering degrees and twists lose determinant components

Location: `TauCetiRoadmap/AdelicImagesAndModularCurves/README.md:1463–1465`. “the covering degree of X_H → X_G”

The componentwise degree from §1.5 is used as the total arithmetic degree. The same omission makes the unrestricted cyclotomic isomorphism in §5.7 and finite obstruction set in §5.8 false.

**Witness:** Let G=GL₂(Ẑ), H=det⁻¹(1 mod 3). Both PSL indices are 1, but X_H=ℙ¹ over ℚ(ζ₃), total degree 2. At p=5 it has no ℚ₅-point although g=0 and 5∤3.

**Repair:** Use total degree [±G:±H]; retain the PSL ratio on individual components. For twists compare selected components, or assume full determinant for both groups. Apply Hasse–Weil to a geometrically connected reduction. The witness gives degree 2, two components after ℚ(ζ₃), and a genuine local obstruction at 5.

## R06 (P1) — Fine descent is unique over a level point, not over its j-invariant

Location: `TauCetiRoadmap/AdelicImagesAndModularCurves/README.md:1490–1495`. “unique quadratic twist class of E”

ImageLE is defined up to conjugacy and forgets the selected level point. Several twists can satisfy it; several level points can share one j-invariant.

**Witness:** In GL₂(𝔽₃), diag(1,−1) fixes e₁. Its determinant twist is diag(−1,1), fixing e₂. Both images are conjugate into Γ₁(3), although the twisting character is nontrivial.

**Repair:** Fix a coarse H-level point and its frame orbit before forming ψ_E; claim uniqueness over that point. To realize the witness, start with a non-CM curve with full mod-3 image and pass to the fixed field of ⟨diag(1,−1)⟩. The two twists then give different points over the same j. RSZB lines 68–70 also records a normalizer-index count of twists.

## R07 (P1) — Special-j twists cannot be discarded in the cyclic-isogeny dictionary

Location: `TauCetiRoadmap/AdelicImagesAndModularCurves/README.md:1523–1527`. “for −I ∈ H the twist is irrelevant”

Containing −I removes quadratic twists, not the extra cubic or quartic twists at j=0,1728. The fixed-curve equivalence with membership in j(X₀(N)(K)) at lines 1732–1734 has the same defect.

**Witness:** E:y²=x³+2 has no rational point of order 2; y²=x³−1 has (1,0). Both have j=0, hence j(E) lies in j(X₀(2)(ℚ)), but E has no rational cyclic 2-isogeny.

**Repair:** Keep the Aut(E)-twist condition at the exceptional j-values. For a fixed E, use a level pair whose underlying curve is E; the plain j-image equivalence requires j≠0,1728. RSZB Remark 2.3.2, printed p.8, lines 345–350 gives exactly this negative control.

## R08 (P1) — Counting kernels does not count isogenies modulo Aut(E)

Location: `TauCetiRoadmap/AdelicImagesAndModularCurves/README.md:1735–1736`. “up to Aut(E)”

The right side counts individual stable kernels, whereas the left side quotients by source automorphisms.

**Witness:** Over ℚ(i), E:y²=x³−x has three rational subgroups of order 2. The automorphism (x,y)↦(−x,iy) swaps the kernels at x=1 and x=−1, giving two Aut(E)-orbits.

**Repair:** Count isogenies up to target isomorphism with the source marked, or quotient the stable kernels by Aut_K(E) as well. These alternatives give 3 and 2 respectively on the witness.

## R09 (P1) — A norm map of Jacobians need not have connected kernel

Location: `TauCetiRoadmap/AdelicImagesAndModularCurves/README.md:1662–1664`. “surjective with connected kernel”

Connectedness is asserted for the whole kernel, rather than its identity component.

**Witness:** X₁(11)→X₀(11) is a degree-5 map between genus-one curves. The induced pushforward is a degree-5 isogeny: its geometric kernel has five points and identity component one point.

**Repair:** State surjectivity and the dimension/isogeny decomposition for ker⁰; describe the finite component group separately. Here genus difference is 0, so ker⁰ has dimension 0 and is trivial, consistently with the five-element whole kernel.

## R10 (P1) — The CM Hom-rank assertion omits isogeny

Location: `TauCetiRoadmap/AdelicImagesAndModularCurves/README.md:1687–1693`. “rank 2 exactly when E has CM defined over K”

Whether E has CM does not determine Hom(E,E′) when E′ is arbitrary. The subsequent assertion of infinitely many degrees has the same missing hypothesis.

**Witness:** Over K=ℚ(i), take E:y²=x³−x and a non-CM E′, for example 37.a1. They are not geometrically isogenous, so Hom_K(E,E′)=0 although End_K(E) has rank 2.

**Repair:** Say rank 0 for non-isogenous pairs; among K-isogenous pairs, rank 2 iff the CM is defined over K, and rank 1 otherwise. Require K-isogeny also before asserting that the minimum is attained or infinitely many cyclic degrees occur. This gives rank 0, not 2, on the witness.

## R11 (P1) — A₄ and A₅ projective images cannot have full determinant

Location: `TauCetiRoadmap/AdelicImagesAndModularCurves/README.md:525–529`. “each taken with full determinant”

For odd ℓ, determinant modulo squares factors through PGL₂(𝔽ℓ)→C₂. Its restriction to A₄ or A₅ is trivial, since neither has a quotient C₂.

**Witness:** At ℓ=5 the inverse image of A₄⊂PSL₂(𝔽₅) has order 48, with determinant image of order 2, whereas |𝔽₅ˣ|=4.

**Repair:** Retain the exceptional subgroups with their actual determinant images and canonical fields; distinguish the S₄ cases as well. In the witness the arithmetic index is 10, the determinant index 2, and the component degree 5. Do not force full determinant.

## R12 (P1) — The proposed GSp₄ image types do not form a partition

Location: `TauCetiRoadmap/AdelicImagesAndModularCurves/README.md:1892–1912`. “mutually exclusive and exhaustive”

The displayed predicates overlap before any classification theorem is applied. A stable mod-ℓ plane also does not by itself supply an abelian-subvariety decomposition. The claim that every exceptional family occurs infinitely often contradicts the preceding restriction of A₇ to ℓ=7.

**Witness:** The trivial subgroup of Sp₄(𝔽₃) stabilizes every line and every plane, so both 1p3 and 2p2 hold. A nontrivial symplectic transvection satisfies both the stated 1p3 and nss conditions.

**Repair:** State the actual subgroup configurations, with intersections and exceptional-prime hypotheses. If a single label is needed, define a priority rule rather than claim disjointness. Separate residual invariant subspaces from characteristic-zero decompositions. Correct the locator: dieulefait lines 73–87 is the subgroup discussion; its Theorem 2.1, lines 102–108, concerns inertia. The trivial group must receive one label only after such a rule.

## R13 (P1) — Orbit signatures depend on the ambient torsion level

Location: `TauCetiRoadmap/AdelicImagesAndModularCurves/README.md:915–917`. “independent of the choice of N”

The definitions include all divisors of N, so changing N changes the objects being counted. The identical assertion at lines 1845–1852 fails for GSp₄ too.

**Witness:** For H=GL₂(Ẑ), N=1 yields only (1,1,1); N=2 also yields (2,1,1). In GSp₄ the N=1 module has no nonzero vectors, while N=2 has 15.

**Repair:** Include N as a parameter, or explicitly select the minimal level before defining a database signature. Prove compatibility only for a fixed torsion order under reduction. The extra entries then remain correctly attached to N=2.

## R14 (P1) — The Serre-group boundary cases contradict the earlier definitions

Location: `TauCetiRoadmap/AdelicImagesAndModularCurves/README.md:1149–1152`. “unless D ∈ {−4, 8, −8}”

The trivial discriminant character is omitted, and conductor 8 is treated as if its obstruction were visible modulo 4.

**Witness:** S₁ mod 2 is A₃ of order 3, not GL₂(𝔽₂) of order 6. S₈ and S₋₈ surject mod 4 (96 elements); their first obstruction is mod 8.

**Repair:** Include D=1 among the cases with non-maximal prime 2. Distinguish first failure at 2 for D=1, at 4 for D=−4, and at 8 for D=±8. Keep all local projections full when D has an odd prime factor. These values agree with §2.3 and §2.4.

## R15 (P1) — The ramified Cartan comparison has its inequality reversed

Location: `TauCetiRoadmap/AdelicImagesAndModularCurves/README.md:752–753`. “strictly smaller than any Cartan”

The unit count p(p−1) is correct, but the comparison with split Cartans is false.

**Witness:** At p=5 the dual-number unit group has order 20; the split Cartan has order 16 and the nonsplit Cartan order 24. At p=2 the corresponding values are 2,1,3.

**Repair:** State (p−1)² < p(p−1) < p²−1. Keep both p=2 and p=5 as discriminating Checks.

## R16 (P1) — A noncyclotomic discriminant character cannot be composed with determinant

Location: `TauCetiRoadmap/AdelicImagesAndModularCurves/README.md:1160–1163`. “trivial ... when K(√Δ) is not cyclotomic over K”

The proposed character on the cyclotomic image does not exist in that case. Declaring it trivial asserts a false relation between sign and determinant.

**Witness:** If K(√Δ) is not contained in K(μ∞), some σ fixes K(μ∞) but moves √Δ. Then det ρ(σ)=1 while ε(ρ̄₂(σ))=−1; a character evaluated at 1 gives +1.

**Repair:** State the sign relation using the discriminant character on G_K. Factor it through determinant only when K(√Δ)⊂K(μ∞). In the noncyclotomic case the computed pair (det,sign)=(1,−1) must be allowed; no Sχ obstruction follows.

## R17 (P1) — The torsion proof cites results about different curves

Location: `TauCetiRoadmap/AdelicImagesAndModularCurves/README.md:1762–1767`. “ED §3.20 and §§4.23–4.25”

The cited supplier does not supply the advertised modular-curve rational-point computations, and there is no declared gap. Covers to the six listed small-genus curves do not dispose of the other levels.

**Witness:** EffectiveDiophantineMethods §4.23 concerns the dynamical curve C₀(5), §4.24 C₁(3₂), and §4.25 dynamical X₀(6). None supplies X₁(16). The divisors of 25 are 1,5,25, none of the listed obstructing levels.

**Repair:** Add exact owned targets for the needed modular-curve rational-point sets and remaining composite torsion cases, or declare precise contracts with an earlier supplier. Keep prime torsion imported from EisensteinIdealAndRationalTorsion Layer 8. Test the resulting chain explicitly at N=16 and 25 rather than referring to these unrelated Chabauty sections.

## R18 (P1) — The abelian-surface open-image theorem has no supplier

Location: `TauCetiRoadmap/AdelicImagesAndModularCurves/README.md:1871–1874`. “AGR Layer 7’s big-image machinery”

ArithmeticGaloisRepresentations supplies representation carriers and finite residual-image criteria, not the inference from geometric End(A)=ℤ to almost-all-prime surjectivity. Lines 1956–1957 also exclude building this theorem here.

**Witness:** ArithmeticGaloisRepresentations §7.11, lines 4991–5030, assumes large finite images when deriving vastness/tidiness. Serre 1986 Theorem 3, printed p.97, serre1986 lines 61–68, asserts the missing almost-all-primes theorem.

**Repair:** Give this arithmetic theorem an owner: add its general number-field proof milestones here, or declare a precise earlier-supplier gap. Do not replace its proof with the finite-group criteria. The prerequisite must take End(A_K̄)=ℤ as input, not assume that the residual image is already GSp₄.

## R19 (P1) — The abstract commutator proof uses an unowned theorem

Location: `TauCetiRoadmap/AdelicImagesAndModularCurves/README.md:836–840`. “whose commutator subgroup is closed (Nikolov–Segal)”

The proof needs closedness of the abstract commutator subgroup, not merely its closure. No target or named supplier provides this step; a paper citation is not an ownership contract.

**Witness:** Completed/ProfiniteProPGroups/README.md:179 expressly excludes Nikolov–Segal. ProfiniteArithmetic §2.2 uses closures and says it does not use that theorem. The ownership search found no supplying target.

**Repair:** Assign the needed general theorem to an appropriate earlier supplier through a precise gap, or add a genuine general commutator-width target with its inputs. Distinguish the abstract derived subgroup from the closed derived subgroup throughout. Check GL₂(ℤ₂), where the odd-prime elementary-commutator argument does not apply because 2 is not a unit.

## R20 (P1) — The supplied build gate still fails on a non-sorry warning

Location: `TauCetiRoadmap/AdelicImagesAndModularCurves/Suggested.lean:1`. “import Mathlib”

The supplied gate records build=1 because this file imports module-system Mathlib from a non-module file. The targeted build reproduces that warning. This is the build-gate severity required by the review brief; it is not a Lean type error.

**Witness:** `lake build TauCetiRoadmap.AdelicImagesAndModularCurves.Suggested` exits 0 but emits the module-system warning as well as 28 sorry warnings. The supplied gate is FAIL.

**Repair:** Add the module header while retaining the permitted imports, then rerun the targeted build and gate. A scratch copy with `module` prepended elaborated with only sorry warnings. The independent NOT IN ORDER diagnostic belongs to board placement and is not an author defect under this brief.

## R21 (P2) — The CM isolated-point proof uses the wrong inequality

Location: `TauCetiRoadmap/AdelicImagesAndModularCurves/README.md:1551–1554`. “degree ... faster than 2·gonality”

This would not contradict the stated parametrization bound gonality≤2d. The cited paper attributes the CM argument to prior work rather than stating it as its main theorem.

**Witness:** If gonality=3 and d=1, then 3>2d excludes parametrization. If gonality=2 and d=3, then 2≤6 is compatible with parametrization. BELŌV lines 103–107 attributes CM sporadic points to Clark–Cook–Rice–Stankewicz.

**Repair:** Use the bound 2d<gonality and the primary CM degree/gonality results with exact locators and named inputs. Recompute the CM asymptotics in this direction; a degree larger than twice the gonality supplies no contradiction.

## R22 (P2) — The isolated-point level theorem is overstated

Location: `TauCetiRoadmap/AdelicImagesAndModularCurves/README.md:1557–1560`. “product of the prime powers ... image is not maximal”

This omits the non-CM hypothesis, the mandatory primes 2 and 3, and the level of the joint m-adic image. The latter can detect entanglement that individual prime images do not.

**Witness:** BELŌV Theorem 1.1, printed p.2, belov lines 51–55, uses m divisible by 2,3 and all non-maximal primes, and target level gcd(n,M(E,m)).

**Repair:** State that theorem with all of its quantifiers and hypotheses. For a group S₋₃ with full individual projections, the proposed local rule returns 1, whereas the joint 6-adic level is 6; at n=6 the corrected rule returns gcd(6,6)=6. A different sharper theorem needs its own proof.

## R23 (P2) — Kenku’s class-size conclusion needs the actual tree restrictions

Location: `TauCetiRoadmap/AdelicImagesAndModularCurves/README.md:1791–1795`. “products allowed by the cyclic-degree list”

The cyclic-degree list and the quoted vertex bounds alone do not force the six class sizes. The text needs the arithmetic restrictions on possible trees, rather than treating them as a consequence of the degree list.

**Witness:** A 2-tree with one central vertex and three arms of length 2 has 7 vertices, valence at most 3, diameter 4, and pairwise cyclic-degree labels in {1,2,4,8,16}, all allowed degrees.

**Repair:** Add/import the precise permissible ℓ-tree classification from Kenku with its arithmetic proof inputs, then derive the class sizes. The repaired theorem must rule out this seven-vertex tree for an arithmetic reason, not for a forbidden degree. The Kenku text remained uncertified, so its detailed table was not reconstructed from memory.

## R24 (P2) — General p-adic Lie theory is already owned

Location: `TauCetiRoadmap/AdelicImagesAndModularCurves/README.md:1229–1242`. “No roadmap ... owns ℓ-adic Lie theory”

The assertion of absence is false, and the proposed elementary rank-two replacement replans earlier general work.

**Witness:** AdelicAlgebraicGroups §AA.4.2, lines 4220–4229, builds closed subgroups of finite-dimensional ℚ_p-analytic Lie groups, their Lie subalgebras, local exponential charts, and the full-Lie-algebra openness criterion.

**Repair:** Import that exact section for the general analytic construction and criterion. Keep only the new gl₂ subalgebra classification and trace-zero measure application here. Its ℤ_p⊂ℚ_p Check already gives dimension 1=1 and openness; the same theorem specializes to dimensions 4=4 in GL₂.

## R25 (P2) — The similitude group construction duplicates its supplier

Location: `TauCetiRoadmap/AdelicImagesAndModularCurves/README.md:1832–1838`. “For a commutative ring R, GSp₄(R) :=”

ArithmeticGaloisRepresentations owns the group and multiplier in general positive even rank, not just the GSp4Rep shell. The duplicate appears again in Suggested.lean:423–493.

**Witness:** ArithmeticGaloisRepresentations §7.3, lines 4261–4281, defines SimilitudeGroup.GSp and multiplier, compares J conventions, and proves det(g)=ν(g)^m over commutative rings.

**Repair:** Consume §7.3 for the generic carrier, multiplier and laws. Keep genuinely additional adelic reductions, subgroup invariants and finite cardinalities. A minimal local specialization may support a statable acceptance theorem, but must not create a second planned owner. For diag(1,1,u,u), both conventions give ν=u and det=u².

## R26 (P2) — The classification layer plans a computational certificate system

Location: `TauCetiRoadmap/AdelicImagesAndModularCurves/README.md:1913–1919`. “decidable certificate checker checkMitchell”

This is an executable enumeration/certificate target, expressly outside the roadmap contract. It also substitutes a certificate against a stored list for a layered mathematical classification proof.

**Witness:** Lines 1913–1917 require enumerating maximal subgroups, accepting generators, identifying configurations, and checking maximality by orders.

**Repair:** Delete the checker and stored-certificate targets. State the general subgroup-classification theorem with exact hypotheses, proof ingredients and legal locators; retain small finite examples only as Checks. The overlapping trivial-group example in R12 must be resolved at the statement level, before any enumeration.

## R27 (P2) — The acceptance file weakens or omits statable headlines

Location: `TauCetiRoadmap/AdelicImagesAndModularCurves/Suggested.lean:403–405`. “mazur_torsion_card”

The cardinality list is a weaker stand-in for the promised fifteen torsion groups. The inverse-limit existence theorem (§0.1), Serre’s closed-SL₂ lifting theorem (§2.2), and the commutator/abelianization theorem (§2.4) are absent despite having native carriers and simple definable maps. The docstring names red_ext as the inverse-limit property although it only states uniqueness.

**Witness:** C₁₆ and C₂³ pass the cardinality test (16 and 8), but neither is in Mazur’s fifteen-group list. PadicInt, SpecialLinearGroup, ClosedSubgroup, Subgroup.commutator, and the finite permutation sign already exist at the pins.

**Repair:** State Mazur’s group classification with additive equivalences to ZMod models, plus the promised realization assertion if retained. Add the statable deep group theorems with only their necessary definitions. For genuinely unavailable arithmetic/moduli headlines, name each missing carrier in the docstring; listing targets as README-only is insufficient. C₁₆ and C₂³ must fail the repaired classification.

## R28 (P3) — Delete API and boundary padding from Suggested.lean

Location: `TauCetiRoadmap/AdelicImagesAndModularCurves/Suggested.lean:139,155,228,247,325`. “genus_top”

These are imported API consequences or boundary/Check statements, rather than acceptance headlines. Definitions used by no kept headline also exceed the allowed form.

**Witness:** On a scratch copy, index_eq_index_map closes with index_map_eq, pm_eq_self_of_not_isFine with adjoinNegOne_eq_self_iff, and neg_one_mem_Gamma0Zhat with `simp [Gamma0Zhat]`. genus_top is the full-group boundary Check.

**Repair:** Delete these declarations from Suggested.lean; keep their mathematics in the README. Also delete pm_Gamma0Zhat (one application of the coarse identity), and remove unused support definitions such as Gamma1Zhat, splitCartanZhat, sl2Level, minIsogenyDegree and IsIsogenous unless a retained headline needs them. Do not prove the padding in place.

## R29 (P3) — Restore the required roadmap shape and verifiable locators

Location: `TauCetiRoadmap/AdelicImagesAndModularCurves/README.md:1–48,419–490,549–571,871–907`. “## Prerequisites”

The opening has no Summary paragraph, supplier material is spread over several headings rather than Exact supplier contracts, and the layers have no closing Examples and Dependencies sections. Several definitions, including level, agreeable closure and quadratic refinements, lack three discriminating Checks. Broad book/chapter references are not exact claim locators.

**Witness:** §§0.1,0.2,0.4,2.5,2.6 have no local three-Check lists. §4.1 cites Part II, Chapters IV–V without theorem/page. §4.4’s “lemma ... in the proof” is not there: serre1972 lines 1625–1629 refer to MG IV-19.

**Repair:** Use the required headings and add hypothesis-sensitive Checks, including the counterexamples above. Cite the actual product result in Serre’s Abelian ℓ-adic representations, IV-19, or state a separately owned proof; do not attribute it to an unwritten proof in the 1972 paper. Correct Subgroup.isOpen_of_finiteIndex to the pinned Subgroup.isOpen_of_isClosed_of_finiteIndex (ClosedSubgroup.lean:108) and consume it rather than planning it again.

## Verified sound

The review covered both complete files at the requested head, the 15 seeded targets, the worked examples, all 57 elaborated declaration signatures, and all 28 admitted theorem proofs with a one-tactic probe. Numerical checks below are counterexample searches, not proofs of the general theorems. A passing row does not certify unrelated claims in its section. No checkout file was changed; no edit outside the roadmap appears in the PR diff. No sorry-valued data, set_option, admitted example, or prohibited import was found. No copied source passage was established.

The direct `lake env lean` run passed with only 28 sorry warnings. The targeted module build exited 0 and reproduced the additional module-system warning recorded in R20. The supplied gate has all text scanners at zero, `depcheck=1`, `build=1`, and verdict FAIL. The independently rerun gate has all text scanners at zero and `depcheck=1`; its invocation did not repeat the build stage. The separate dependency command produced:

```text
NOT IN ORDER: AdelicImagesAndModularCurves (insert it after its last supplier)
depcheck: 204 roadmaps, 1617 edges, 1 problem(s)
```

There is no UPWARD or CYCLE line. Under the explicit review instructions, absence from the order is not a finding: placement is after the last supplier. The reciprocal mentions in FiniteGroupInvariants and CanonicalModelsAndGonality are descriptions of this roadmap as a consumer, not supply edges back to them. No declared supplier gaps were present.

**Source sample.** Source IDs below identify the legal cached extractions; all text is paraphrased. Preprint locators refer to the fetched version, not an assumed matching journal pagination.

| Seeded target | Text/locator actually opened | Result |
|---|---|---|
| 0.1 Group/reductions/inverse limit | Tau Ceti `ZHat/ZMod.lean`:160,195,238; `SpecialLinearGroup/Basic.lean`:449 | Native inverse-limit and strong-approximation inputs exist; matrix specialization is meaningful. README needs exact claim locators, and Lean omits existence of a compatible lift. |
| 0.2 Level/index/±H/determinant | Mathlib `Index.lean`:319,335; `ArithmeticSubgroups.lean`:172,193,198 | Index transfer and adjoining −1 are supplied. Computed checks below distinguish level, determinant index and effective index. |
| 0.4 Γ_H/SL₂-level/PSL₂-index/density | Tau Ceti `SpecialLinearGroup/Basic.lean`:449; `CongruenceSubgroups/Basic.lean`:640 | Correct distinction between arithmetic and PSL index here, including Γ(3):24 versus 12. It is lost later in §5.1. |
| 1.3 Cusps/action/fields | RSZB §2.3, printed pp.8–9, rszb lines 345–359; finite double-coset computations below | The ±T quotient and right diagonal action agree with the source. All seven displayed cusp-orbit examples were recomputed, including the non-full-determinant exclusion. LMFDB text was blocked by its browser challenge. |
| 1.5 Relative index/covering degree | Mathlib index/relative-index API; §0.4 reduction argument | Correct with the stated equal-determinant qualification; checked on Γ(3) and Γ₁(11)⊂Γ₀(11). The referenced geometry is supplied by MC2/FO, rather than proved by an index lemma. |
| 2.5 Agreeable closure | Zywina, arXiv:2206.14959v2, §1.4 p.3 and Prop.8.1 p.42; zywina2022 lines 129–135,296–298,2022–2031 | Definition matches; input full determinant is dropped and S₃₇ is a false example (R03). |
| 2.6 Twists/refinements | RSZB introduction, rszb lines 68–70; elementary determinant-character calculation | Geometric invariant equality is consistent; finiteness of all quadratic refinements and uniqueness over a j-invariant fail (R04,R06). No exact source supports the claimed finite Frattini quotient. |
| 4.1 p-adic Lie algebra | AdelicAlgebraicGroups AA.4.2, lines 4220–4229 | Earlier general owner found. The Serre book itself could not be read legally through the service, so its cited chapters remain unverified. |
| 4.4 Adelic openness | Serre 1972 §4.4, Théorème 3, printed p.299, serre1972 lines 1619–1632; Corollaries on p.300, lines 1634–1659 | Non-CM number-field theorem and bounded-index equivalent are supported. The cited product-lemma proof is not written there: the source refers to MG IV-19. |
| 5.3 CM points/discriminants | Lozano-Robledo arXiv:1809.02584v1, Thms.1.2/1.4 pp.2–4, lozano lines 96–167; RSZB Remark 2.3.2 p.8 | Thirteen discriminants agree with the class-number-one list; exceptional-j twists cannot be discarded. The alleged LMFDB duplicate −27 could not be inspected. |
| 5.6 Gassmann/Jacobians | Prasad–Rajan arXiv:math/0203295v1, Cor.4, p.3, prasad_rajan lines 119–123 | Supports isogeny of quotient Jacobians for a finite action on a projective curve over k and equal class intersections. The roadmap must retain the curve/quotient input supplied by MC2. |
| 6.2 Isogeny classes/graphs | FF R28.6.5–6.6, lines 2740–2800; native isogeny carrier | Finiteness and rank-one Hom input are supplied. Tree-distance degree calculations pass; the omission of isogeny in §6.1 does not. |
| 6.3 X₀/X₁ dictionary | MC2 §9.7, lines 2729 onward; RSZB Remark 2.3.2 p.8 | Source explicitly preserves the exceptional-j caveat. The fixed-curve and Aut-count statements fail (R07,R08). |
| 6.5 Mazur/Kenku/class corollaries | EM2 §§5.0a,5.0b,6.0b read; Mazur 1977 introduction, printed p.35, mazur1977 lines 103–117 | Imported degree lists resolved. Kenku’s published paper and Mazur 1978 were classified uncertified by the service; the detailed tree restrictions were not independently certified. |
| 7.2 Abelian-surface image | Serre Résumé 1985–86, §2.3, Thm.3 and corollary, p.97, serre1986 lines 61–68; Dieulefait Thm.1.1, p.3, dieulefait lines 41–42 | Serre supports the number-field theorem for geometric End=ℤ and dimension 2 (also odd dimensions/6). Dieulefait’s displayed version is over ℚ. Neither citation supplies the missing roadmap owner (R18). |

**Computed adversarial pass.** For subgroup rows, values come from independently enumerating finite matrix groups and their cosets, S/R fixed points, T-orbits and determinant actions. Other rows give explicit algebraic instances. “Retain” means this particular test passed; “repair” points to the finding, not an edit made to the PR.

| Statement | Instances tried | Values on the two sides / negative control | Result and required change |
|---|---|---|---|
| 0.1 finite GL₂ cardinality | N=1,2,3,5,9 | Enumerated 1,6,48,480,3888; formula gives 1,6,48,480,3888 | Retain; N=0 excluded by NeZero in Lean. |
| 0.1 determinant quotient | N=1,3,5 | GL orders 1,48,480 divided by φ(N)=1,2,4 give SL orders 1,24,120 | Retain. |
| 0.1 reductions/compatibility | T=[[1,1],[0,1]], 4→2→1 | Off-diagonal entries 1 mod4→1 mod2→0 mod1; diagonal units remain units | Retain. |
| 0.1 Γ intersection and compatible lifts | Γ(2),Γ(3); identity family | Intersection kernel mod6=Γ(6); identity at every level has one lift I | Retain; existence headline missing. |
| 0.2 level/finite index | top,Γ₀(2),Γ₀(3),Γ(3) | Levels 1,2,3,3; GL indices 1,3,4,48; image indices identical | Retain; padding index transfer. |
| 0.2 fine/coarse index | Γ₁(3) | |H mod3|=6, |±H mod3|=12; indices 8 and 4; 8/2=4 | Retain. |
| 0.2 determinant distinction | Γ(3), ±Γ(3) | det index 2 for both; GL indices 48,24; PSL indices 12,12 | Retain. |
| 0.3 standard Γ₀/Γ₁ | N=1,2,3 | Γ₀ sizes 1,2,12; Γ₁ sizes 1,2,6; −I∈Γ₁ iff N∣2 in these cases | Retain. |
| 0.3 exceptional projective groups | A₄ at ℓ=5 | GL preimage 48; determinant image 2≠4; arithmetic/component indices 10/5 | Repair R11. |
| 0.3 global versus local CM normalizers | conjugate at 2 only, identity at 3 | Local signs (−1,+1) lie in product normalizer; not in diagonal-sign extended Cartan | Retain distinction. |
| 0.4 SL versus GL level | S₃₇ | GL level 74, SL level 2; 2∣74, but 2≠74 | Retain. |
| 0.4 PSL formula | Γ₀(9),Γ(3) | 12=12·1 for Γ₀(9); 24=12·2 for ±Γ(3) | Retain. |
| 0.4 reduction density | SL₂ mod2,mod3 | Integral elementary generators cover respectively 6 and 24 elements | Consistent with pinned surjectivity. |
| 1.1 S/R fixed points | top,Γ₀(2),Γ₀(3),Γ₀(13) | (ν₂,ν₃)=(1,1),(1,0),(0,1),(2,2) | Retain; left/right inversion preserves fixed points. |
| 1.1 cusp widths | Γ₀(9),Γ₁(11),Cns⁺(13) | Width sums 1+1+1+9=12; 5·1+5·11=60; 6·13=78 | Equal corresponding PSL indices. |
| 1.2 genus | top,Γ₀(11),Γ₁(13) | 1+1/12−1/4−1/3−1/2=0; 1+12/12−2/2=1; 1+84/12−12/2=2 | Retain integrality and normalization. |
| 1.3 Γ₀ cusp action | N=9,11,16,20 | Orbit multisets {1,1,2},{1,1},{1,1,1,1,2},{1,1,1,1,1,1} | Retain; Γ₀(16) has two nonrational cusps. |
| 1.3 Γ₁ cusp action | N=11,13 | {1⁵,5} and {1⁶,6}; rational counts 5,6; cyclotomic-real degrees 5,6 | Retain. |
| 1.3 Cartan cusp action | split+/nonsplit+ at 13 | {1,6} versus {6}; rational counts 1 versus 0 | Retain. |
| 1.3 non-full determinant | Γ(5), arithmetic level-5 subgroup | Γ(5):12 geometric versus48 arithmetic cusps; arithmetic subgroup orbits {1,1,2,4,4}, sum12 | Retain exclusion in §1.3; propagate to §5. |
| 1.4 geometric genus comparison | Γ₀(11), Cs⁺(13), Cns⁺(13) | (μ,ν₂,ν₃,c)=(12,0,0,2),(91,7,1,7),(78,6,0,6); genera 1,3,3 | Consistent with the supplier comparison; no new proof of it claimed. |
| 1.5 relative degree | Γ₁(11)⊂Γ₀(11) | Raw index 10; effective index 5; PSL ratio 60/12=5 | Retain distinction; degree not raw index. |
| 1.5 unequal determinant | Γ(3)⊂top | Effective GL index24; PSL ratio12/1=12 | Retain explicit exception. |
| 2.1 Cartan orders | ℓ=2,5 | split 1,16; nonsplit 3,24; ramified 2,20 | Repair only the false comparison R15. |
| 2.1 split normalizer at 2 | mod2 | Split Cartan {I}; normalizer size6; extended Cartan size2 | Retain finite/integral distinction. |
| 2.2 lifting | det⁻¹(μ₄(1+25ℤ₅)) | Residual image480=|GL₂(𝔽₅)|; integral index5≠1; level25≠5 | Repair R01. |
| 2.3 products/entanglement | S₋₃, S₋₄ | S₋₃ local indices1,1, global2, entanglement2; S₋₄ local2, global2, entanglement1 | Retain. |
| 2.4 sign/commutator | GL₂(𝔽₂)≅S₃ | Sign kernel A₃ has3 elements versus6; commutator index2 | Retain finite convention; abstract closedness input missing R19. |
| 2.4 Sχ invariants | S₁,S₃₇ | Both (μ,ν₂,ν₃,widths,g)=(2,0,2,{2},0); levels2,74 | Retain. |
| 2.5 agreeable example | S₃₇ | odd(level)={37}, odd(SL-level)=∅, unequal | Repair R03. |
| 2.5 closure domain | Γ(3) | Four agreeable Borel preimages intersect into mod3 scalars; determinant size≤1<2 | Repair R03. |
| 2.6 twists | top,det⁻¹(1 mod3) | SL intersections both full; geometric invariants both (1,1,1,1,0); arithmetic component counts1,2 | Geometric equality passes; arithmetic isomorphism fails R05. |
| 2.6 quadratic refinements | ker(ψχq∘det) in Γ₀(3) | ψχq(det)(−I)=−1 for every q; each index2; distinct auxiliary q give infinitely many kernels | Repair R04. |
| 2.7 field degrees | Γ₀(5),Γ₁(5),top at5 | Minimal cyclic-isogeny/point degrees (1,4),(1,1),(6,24); full division degrees80,20,480 | Retain fixed-N field meanings. |
| 2.7 level independence | top, N=1 versus2 | {(1,1,1)} versus a set also containing (2,1,1) | Repair R13. |
| 2.8 Gassmann invariants | conjugate order-2 subgroups of S₃; C₃ versus C₂ | Class counts (1,1,0) agree for conjugates; (1,0,2)≠(1,1,0) for C₃/C₂; indices2≠3 | Retain nonabelian test and negative control. |
| 3.1 Tate module rank | elliptic curve in characteristic0; prime2 | Each ℓ-factor rank2; product of coordinate bases gives Ẑ²; asserted rank2=2 | Native carrier and theorem retain needed hypotheses. |
| 3.2 determinant/complex conjugation | diag(1,−1), [[1,1],[0,−1]] | Both square to I and have determinant−1; mod2 first is I, second a transposition | Retain two integral conjugacy types. |
| 3.3 image/conjugacy/base change | full mod3 image, pass to its division field | Image sizes48→1; kernels index48→1; conjugation leaves48 unchanged | Retain basis independence, distinguish restriction. |
| 3.4 CM base change | y²=x³−x over ℚ(i,E[5]) | Good5; mod5 image1 versus Cartan16 | Repair R02. |
| 3.5 Serre boundary | S₁,S₋₄,S₈,S₋₈ | First non-full reductions2,4,8,8; S₁ mod2 size3≠6; S±8 mod4 size96=96 | Repair R14. |
| 3.5 number-field sign relation | noncyclotomic discriminant extension | σ in cyclotomic kernel has (det,sign)=(1,−1); χ(1)=+1 | Repair R16. |
| 3.6 division fields | full GL₂(𝔽₂) image | Full splitting degree6, point degree3, line degree3; stabilizers sizes1,2,2 | Retain. |
| 4.1 openness/Lie algebra | GL₂(ℤ₅),SL₂(ℤ₅),{1} | Lie dimensions4,3,0; open in GL₂: yes,no,no | Correct criterion, import general owner R24. |
| 4.1 trace locus | matrices mod5ⁿ in M₂ | Trace-zero residues count5^(3n) of5^(4n); proportion5^(−n)→0 | Supports measure-zero route for open subgroups. |
| 4.2 non-CM ℓ-adic openness | proper open determinant example at5 | Lie dimension4 despite index5; open≠surjective | Retain openness endpoint, avoid R01’s stronger assertion. |
| 4.3 almost-all surjectivity | adelic S₃₇ versus S₁ | Non-maximal sets ∅ versus{2}; both finite; proper adelic index2 in both | Consistent; not a uniformity theorem. |
| 4.4 product simple factors | ℓ=5,7 | |PSL₂(𝔽₅)|=60, |PSL₂(𝔽₇)|=168, distinct; tail subdirect product cannot identify these simple quotients | Retain product argument’s finite-factor test; correct source locator. |
| 4.4 open-image example | S₃₇ | Γ(74) contained, index2; local indices all1, entanglement2 | Consistent with adelic openness. |
| 4.5 CM dimensions | split CM torus at5 | Lie dimension2 versus GL₂ dimension4; finite Cartan16 versus GL₂480 | Retain non-openness in GL₂; repair good-prime claim R02. |
| 5.1 component degree | det⁻¹(1 mod3) | Component genus0; PSL degree1; determinant index2; total degree2 | Repair R05. |
| 5.2 fine twists | diag(1,−1) and its determinant twist mod3 | Fixed lines ⟨e₁⟩ and ⟨e₂⟩; both conjugate into Γ₁(3); two nonisomorphic K-twists | Repair R06. |
| 5.3 CM discriminants | j=1728,j=0 | Orders have D=−4,−3 and class number1; 13 listed discriminants are distinct, including−28 | Retain list; website typo unverified. |
| 5.3 coarse CM twist | y²=x³+2 versus y²=x³−1 | Rational nonzero 2-torsion counts0 and1; same j=0 | Repair R07. |
| 5.4 isolated criterion | (gonality,d)=(3,1),(2,3) | 3>2 gives exclusion; 2≤6 does not | Repair R21. |
| 5.4 level reduction | joint image S₋₃, n=6 | Individual exceptional-prime set∅ gives proposed M=1; joint6-adic level6 gives gcd(6,6)=6 | Repair source overclaim R22. |
| 5.5 coprime levels | Γ₀(2),Γ₀(3) | IntersectionΓ₀(6), index3·4=12; levels2·3=6 | Finite-group assertion passes; compactified stack fibre-product identity not certified here. |
| 5.6 quotient Jacobians | identical/conjugate Borel at11 | Same permutation character, quotient genus1 on each side, Jacobian dimension1=1 and degree-one isomorphism | Positive control; primary corollary read for nontrivial almost-conjugate case. |
| 5.7 cyclotomic isomorphism | top versus det⁻¹(1 mod3) | After ℚ(ζ₃), one P¹ versus two disjoint P¹s | Repair R05. |
| 5.8 real/local obstructions | determinant1 mod3 subgroup, p=5 | det(complex conjugation)=−1≠1 mod3; no real point; p5 Frobenius≠1 mod3, no ℚ₅-point | Repair R05’s missing geometric-connectedness restriction. |
| 5.9 norm kernel | X₁(11)→X₀(11) | Degree5; kernel geometric cardinal5; ker⁰ cardinal1; genus difference0 | Repair R09. |
| 6.1 Hom rank | CM E and non-CM E′ overℚ(i); E=E′ CM | Hom ranks0 and2 respectively; End(E) rank2 in both | Repair R10. |
| 6.1 cyclic factorization | multiplication[2] | Kernel E[2] has4 points, not cyclic; m=2, φ₀=id, degree4=2²·1 | Retain factorization convention. |
| 6.2 matrix/tree degree | a path of two 5-isogenies overℚ without backtracking | Matrix rows (1,5,25),(5,1,5),(25,5,1); determinant of degree data not used; classDegree=lcm=max=25 | Retain distance formula. |
| 6.2 product of trees | one 2-edge times one 3-edge | Four vertices; opposite degree2·3=6; classDegree6 | Retain coprime decomposition. |
| 6.3 isogeny count | E:y²=x³−x overℚ(i),N=2 | Stable kernels3; Aut-orbits2 | Repair R08. |
| 6.4 torsion classification | C₁₆,C₂³ | Cardinalities16,8 pass Lean list; invariant factors(16),(2,2,2) fail Mazur list | Repair R27. |
| 6.4 exclusion route | N=25 | Divisor set{1,5,25}; intersection with{11,13,14,15,16,18}=∅ | Repair R17. |
| 6.5 class-size consequence | three-arm 2-tree, arm length2 | 7 vertices; diameter4; degrees1,2,4,8,16 all in Kenku list; 7 absent from asserted size set | Supply missing tree restrictions R23. |
| 6.6 level divisibility | Γ₀(9) fixes cyclic subgroup of order9 | Level9; 9∣9. A full GL₂ mod3 action has4 lines and fixes none | Consistent; j=0 kernel argument in its proof needs separate full-factor case, not “1+M₂” as a group. |
| 7.1 multiplier/cardinality | g=diag(1,1,2,2) over𝔽₅; ℓ=2,3 | ν=2,det=4=2²; orders720 and103680 from formula | Retain arithmetic specialization; consume generic group. |
| 7.1 zero ring | R=ZMod1 | GL₄ and units each singleton; ν unique; 0=1 causes no ambiguity | No missing Nontrivial hypothesis. |
| 7.1 orbit signatures | N=1,2 | Nonzero vectors0 versus15; maximal isotropic planes at2 number15 | Repair R13. |
| 7.2 two-torsion field | squarefree degree5/6 hyperelliptic equation, full polynomial Galois group | Orders120=S₅ and720=S₆; indices6 and1 in Sp₄(𝔽₂) | Retain after the genus-two/smoothness hypotheses; arithmetic OIT ownership missing R18. |
| 7.3 type partition | trivial group inSp₄(𝔽₃) | Stable lines40, all2-planes130, so 1p3=true and2p2=true | Repair R12. |
| 7.3 exceptional quantifier | A₇ clause | Allowed prime set{7} has cardinal1, not infinite | Repair R12; no classification table certified. |

**Lean signatures and padding.** A scratch copy with `#check @name` for every named declaration was elaborated once. The one flagged binder loss concerns `adelicTateModule`: its carrier is defined without CharZero or IsSepClosed, which is legitimate; `finrank_adelicTateModule` explicitly retains both. No hypothesis-loss finding is raised. Positive levels, NeZero N in `card_GL2_zmod`, ellipticity in the torsion/class-size statements, full determinant in `pslIndex_eq_index_pm`, and CommRing R in the similitude definitions all survived elaboration. The topological instances on GL₂ use the actual units topology, not an arbitrary parameter topology.

The 28 admitted proofs were probed with `simp`, `rfl`, `infer_instance`, or a direct named-lemma application on copies. Failure of a probe is not evidence of depth or truth. Three especially direct successful replacements were:

```lean
-- index_eq_index_map
by exact (H.1.index_map_eq (red_surjective N) hN).symm
-- pm_eq_self_of_not_isFine
by exact OpenSubgroup.toSubgroup_injective
  (Subgroup.adjoinNegOne_eq_self_iff.mpr (not_not.mp h))
-- neg_one_mem_Gamma0Zhat
by simp [Gamma0Zhat]
```

The scratch copy containing those replacements and `pm_Gamma0Zhat` derived from the coarse identity passed. The other probes did not close; `genus_top` remains padding because it is expressly a boundary Check, irrespective of tactic success. None of these proofs was installed in the PR.

**Headlines.** The README promises: the GL₂ inverse-limit/level theory; the genus comparison; lifting and commutator/abelianization; agreeable closure and Gassmann invariance; the adelic representation and determinant; local, almost-all and adelic open image for non-CM curves; the CM counterpart; the point/image dictionary; isolated-point level reduction; Gassmann quotient-Jacobian isogeny; modular-Jacobian decomposition; Mazur’s fifteen torsion groups and realization; Kenku class-size/graph consequences; GSp₄ reduction/cardinality and the surface open-image/classification theorems. Suggested.lean does state the genus integrality, Gassmann invariance, Tate-module rank, Kenku size and finite cardinality targets. R27 lists statable omissions/weakening. The missing geometric curve/Jacobian carriers explain why several Layer 5 results cannot yet be written literally; they do not explain omitting the elementary-to-state deep group theorems. A complete missing-carrier account is required in the module docstring.

**Pinned-library audit.** The following 20 declaration groups were opened at the pins, not at a newer library. These are supplied facts, not new work to plan:

| File at pin and line | Declaration/object and what was checked |
|---|---|
| Mathlib/GroupTheory/Index.lean:110 | `index_dvd_of_le`: subgroup inclusion and index divisibility. |
| Mathlib/GroupTheory/Index.lean:319 | `index_map`: image-index formula; not a surjectivity theorem for this roadmap’s reduction. |
| Mathlib/GroupTheory/Index.lean:335 | `index_map_eq`: surjective homomorphism plus kernel containment, used by the successful probe. |
| Mathlib/NumberTheory/ModularForms/ArithmeticSubgroups.lean:172 | `Subgroup.adjoinNegOne`: generated extension by the central sign. |
| Mathlib/NumberTheory/ModularForms/ArithmeticSubgroups.lean:193 | `adjoinNegOne_eq_self_iff`: coarse identity. |
| Mathlib/NumberTheory/ModularForms/ArithmeticSubgroups.lean:198 | `relIndex_eq_two`: the fine/coarse relative index. |
| Mathlib/Topology/Algebra/OpenSubgroup.lean:70 | `OpenSubgroup.toSubgroup_injective`: no second subgroup carrier needed. |
| Mathlib/Topology/Algebra/Group/ClosedSubgroup.lean:108 | `Subgroup.isOpen_of_isClosed_of_finiteIndex`: closedness is explicit; no unsupported arbitrary finite-index openness claim. |
| Mathlib/LinearAlgebra/SymplecticGroup.lean:58 | `Matrix.J`: the actual alternating matrix and sign convention. |
| Mathlib/LinearAlgebra/SymplecticGroup.lean:101 | `symplecticGroup`: a matrix submonoid; comparison to a subgroup of GL uses the unit coercion. |
| TauCeti/Topology/Algebra/Group/Profinite/ZHat/ZMod.lean:160 | `exists_monoidHom_mk_eq_toZMod`: finite quotient factorization. |
| TauCeti/Topology/Algebra/Group/Profinite/ZHat/ZMod.lean:195 | `ext_of_toZMod`: equality of all positive reductions implies equality. |
| TauCeti/Topology/Algebra/Group/Profinite/ZHat/ZMod.lean:238 | `existsUnique_forall_toZMod_eq`: compatible residues have a unique lift, on Additive zHat. |
| TauCeti/Topology/Algebra/Group/Profinite/ZHat/Units.lean:79 | `unitsEquivPiPadicInt`: topological multiplicative equivalence of units. |
| TauCeti/LinearAlgebra/Matrix/SpecialLinearGroup/Basic.lean:449 | `map_intCast_zmod_surjective`: native SL₂ reduction, not GL₂ determinant lifting. |
| TauCeti/NumberTheory/ModularForms/CongruenceSubgroups/Basic.lean:640 | `Gamma0_prime_power_index`: prime p, k≥1, result p^(k−1)(p+1). |
| TauCeti/AlgebraicGeometry/EllipticCurve/TateModule/Basic.lean:73 | `nonempty_linearEquiv`, followed by freeness and finrank at94; separable closure and nonzero prime retained. |
| TauCeti/AlgebraicGeometry/EllipticCurve/TateModule/Galois.lean:71 | `tateModuleGaloisRepresentation`: genuine action, not an arbitrary scalar-valued stand-in. |
| TauCeti/AlgebraicGeometry/EllipticCurve/TateModule/Determinant.lean:52 | `det_tateModuleGaloisRepresentation`: nonzero ℓ and the cyclotomic determinant. |
| TauCeti/AlgebraicGeometry/EllipticCurve/Isogeny/Basic.lean:139; Isogeny/Degree.lean:94 | Native `Isogeny` and `degree` for the acceptance statements. |

Object searches used the supplied roadmap service over main and open heads, and the board’s package READMEs, in addition to both pinned libraries. No same fully qualified declaration in another roadmap was found. The new ownership justified here is the adelic subgroup specialization, its geometric invariant comparisons, and arithmetic applications; generic p-adic Lie and similitude-group constructions have earlier owners.

**Resolved supplier contracts.** These 16 groups of cross-roadmap references were inspected; broad shared foundations were not treated as substitutes for the specific arithmetic theorem needed.

| Supplier | Resolved sections and result |
|---|---|
| ProfiniteArithmetic | Completed roadmap Layer0 (ring/reductions/components/units), §2.3 closed-subgroup conjugacy classes; supplied. |
| ProfiniteProPGroups | Completed roadmap Layer1 finite-index/pro-p material; Nikolov–Segal expressly excluded. |
| ModularCurvesPartII | §§3.8–3.12,5.8–5.12,5.15–5.17,6.1,6.3,8.3,9.7, Layers13/16; level/moduli/quotient inputs exist, but §9.7 retains exceptional-j restrictions. |
| ModularCurves | Convention5 and Layers2,8D,9–10; frame action, pairing and prime-level moduli ownership resolved. |
| ModularForms | Layers4,7,8G,10A–10B; analytic counts/genus and modular forms ownership resolved. |
| EllipticCurves | Layers1–2,4–7; isogeny/torsion/twist/CM base vocabulary, not the new arithmetic conclusions. |
| ArithmeticGaloisRepresentations | §§2.3,4.4–4.5,6.1–6.4,7.3,7.5,7.11; Dickson/Serre finite subgroup results exist, GSp is already owned, surface OIT is not supplied. `serre_prop15_prop16` is not a declared pinned name: cite the actual §4.5 target. |
| FaltingsFinitenessAndIsogenyTheorems | R28.4.5,4.7,6.2–6.6; semisimplicity, Tate Hom and finite isogeny classes; the Hom conclusion requires isogeny. |
| EisensteinIdealAndRationalTorsion | Layer8 prime torsion; does not alone give composite torsion exclusion. |
| EllipticCurveModularityPartII | §§5.0a–5.0b,6.0b,6.0f; prime/cyclic degree lists, selected j-images, quantitative isogeny bound resolved. |
| EffectiveDiophantineMethods | §3.20 and §§4.23–4.25; exact torsion framework exists, but the latter three targets concern dynamical curves (R17). |
| ShimuraVarieties | §5.10, line1536 onward; reflex-norm CM reciprocity with quasi-isogeny and Artin normalization. Does not identify a ramified local norm with identity. |
| FiniteGroupInvariants | §§7.1,7.3; finite and finite-index almost-conjugacy ownership. The unfolded Lean hypothesis is appropriate at this pin, where the advertised later Tau Ceti names are absent. |
| CanonicalModelsAndGonality | Layer7, including isolated/parametrized predicates and Frey criterion; supplies general curve results, names this roadmap as their modular consumer. |
| AdelicAlgebraicGroups | AA.4.2; supplies the general closed-subgroup/Lie criterion (R24). |
| ImaginaryQuadraticClassNumber | Class-number-one order list/class-number input; thirteen distinct discriminants, including−28. |

Broad references to ClassFieldTheory, Chebotarev, NumberFieldArithmetic, JacobianChallenge, AlgebraicCurves, FuchsianOrbifolds, SchemeAndStackFoundations, HyperellipticCurves and SatoTateGroups were included in citation/dependency and object searches; this does not certify every attributed proof step.

## Not verifiable

Sources were retrieved through the service; failures are recorded in the scratch reference request. No sources.toml or checkout file was edited.

- **Serre, Lie algebras and Lie groups (`serre_lie`)**, cited for §4.1: the bibliographic service search found no legal readable copy. The broad Part II/Chapters IV–V locator could not be verified against the book.
- **Serre, Abelian ℓ-adic representations (`serre_abelian`)**, cited for lifting and indirectly for adelic openness: DOI resolved to Taylor & Francis without an available legal text. IV-23 Lemma3 and the 1972 paper’s pointer to IV-19 remain book locators, not checked book passages.
- **Kenku 1982 (`kenku`), Mazur 1978 (`mazur1978`), Diamond–Shurman (`diamond_shurman`), Baran (`baran`), Lang–Trotter (`lang_trotter`), Deligne–Rapoport (`deligne_rapoport`), Khare–Wintenberger (`khare_wintenberger`)**: service classified their citations as paywalled/uncertified. They were not reopened as missing-reference requests. In particular, the Kenku graph table and textbook genus/cusp locators were not independently certified from these texts.
- **Zywina 2010 (`zywina2010`)**: Wiley DOI retrieval returned HTTP403; its maximal-image statements and individual curve labels were not certified from that paper. Other Zywina preprints were readable and are separately identified above.
- **Chen (`chen`)**: Wiley DOI retrieval returned HTTP403. **de Smit–Edixhoven (`desmit_edixhoven`)**: DOI reached International Press but yielded no approved readable text. The Chen-isogeny check remains unverified from these primary papers.
- **Jones (`jones`)**, **González-Jiménez–Najman (`gonzalez_najman`)**, and **Mitchell (`mitchell`)**: DOI searches reached AMS landing pages but did not return approved readable text. **torsion22**: Taylor & Francis HTTP403. The torsion-growth data and complete maximal-subgroup classification were not certified from these papers.
- **Katz–Mazur (`katz_mazur`)**, **Faltings (`faltings`)**, **Dickson (`dickson`)**: bibliographic searches found no legal readable copy. **Shimura (`shimura`)**: DOI led to JSTOR without readable text. **Bray–Holt–Roney-Dougal (`bray_holt_rd`)**: Cambridge book landing page only. Supplier contracts were checked where available; this is not certification of the underlying books.
- **Serre 1987 (`serre1987`)**: Project Euclid landing page exposed no PDF through the service. Its weight/conductor conventions were not certified from the primary text.
- **LMFDB knowls**: `ec.complex_multiplication`, `gl2.genus`, and `columns.gps_gl2zhat.isogeny_orbits` returned browser-challenge pages, not mathematical text. Thus the asserted typo in the CM discriminant list, exact database column semantics, and other knowl-specific attributions are unverified. The mathematical counterexamples do not rely on those pages.
- **Proof coverage limits**: the table records concrete tests, not a completed proof of every general claim. The compactified-stack fibre product, all Hecke/newform multiplicities, individual LMFDB curve-image labels, and all exceptional finite-group families remain uncertified. This verdict does not present those unverified claims as sound.

## Source issues

- **Misprint** in lozano at §7.3, proof of Theorem1.4(1), printed p.38 (lines 2384–2387): the source says the full rational image is a split or nonsplit Cartan; it should be the corresponding Cartan normalizer; affects the proof.
- **Misprint** in zywina2022 at proof of Lemma7.13, printed p.41 (lines 2016–2017): the source says no normal subgroup of SL₂(ℤ/9) surjects modulo3; it should be no proper normal subgroup, since the whole group surjects; affects the proof.
- **Error** in rszb at proof of Proposition12.2.1, printed p.42 (lines 1934–1937): the source says the order-m subgroup of the cyclic automorphism group complements H; it should be a separately justified complement or a different cocycle construction, since such a complement need not exist; affects the proof.

For the last source issue, take the Gaussian CM order and H the kernel of reduction `(ℤ[i]⊗Ẑ)ˣ→(ℤ[i]/2)ˣ≅C₂`, extended to its conjugation normalizer. Then index(H)=2 and adjoining i generates the normalizer, but the proposed A=⟨−1⟩ already lies in H: |A∩H|=2, not1. This invalidates that splitting step; it does not by itself disprove the proposition’s conclusion. For the Lozano-Robledo misprint, at p=19 the split Cartan has order324 and its normalizer648; the preceding displayed formula and Theorem1.4 use648.
