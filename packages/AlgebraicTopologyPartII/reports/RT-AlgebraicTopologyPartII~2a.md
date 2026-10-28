<!-- from CBirkbeck, https://github.com/TauCetiProject/TauCetiRoadmapJobs/pull/1073#issuecomment-6425349530 -->
Red team round 2 pass a (codex) of 108b271

Verdict: needs_changes

1. **F01** (P3) The dimension-zero example assumes one connected component

   **Location:** `packages/AlgebraicTopologyPartII/README.md:1130`: “A real-empty affine zero-dimensional variety has degree-zero equivariant cohomology ℤ”.

   **Claim:** Every such variety has that degree-zero group.

   **Witness:** U=Spec(C) ⊔ Spec(C) over R is affine, real-empty and zero-dimensional. Its complex locus has two free G-orbits. H_G⁰(U(C),ℤ)=ℤ², not ℤ; restriction is ℤ²→0.

   **Exact repair:** “For U=Spec C over R with constant integral coefficients, degree-zero equivariant cohomology is ℤ and real restriction is zero; every positive-degree group vanishes. More generally, r connected components give ℤʳ in degree zero.”

   **Retest:** One orbit gives ℤ; two give ℤ²; the empty union gives 0. The strict i>d cutoff remains necessary in each nonempty example.

2. **F02** (P2) The Fermat double-loop endpoint is statable but absent

   **Location:** `packages/AlgebraicTopologyPartII/README.md:731`: “Fermat double-loop simple connectivity”; `packages/AlgebraicTopologyPartII/Suggested.lean:194` ends the final theorem without this endpoint.

   **Claim:** Section 5.4 promises simple connectivity of the actual generalized double-loop space at every Fermat-fibre basepoint, for n≥5 and positive indexed exponents.

   **Witness:** The file already defines `fermatFiber`. Mathlib's `Topology/Homotopy/HomotopyGroup.lean:97` defines `GenLoop`; `AlgebraicTopology/FundamentalGroupoid/SimplyConnected.lean:40` defines `SimplyConnectedSpace`. No new carrier is required. None of the five acceptance theorems states this conclusion.

   **Exact repair:** Add the following theorem after `phamStrongRetraction`, and mention its name alongside §5.4 in the README:

   ```lean
   /-- Every based generalized double-loop space of a positive-exponent Fermat fibre
   in at least five variables is simply connected (Pham I §2 and the homotopy-loop shifts). -/
   theorem fermatDoubleLoopSimplyConnected (n : ℕ) (hn : 5 ≤ n)
       (k : Fin n → ℕ) (hk : ∀ i, 1 ≤ k i) (y : fermatFiber k) :
       SimplyConnectedSpace (Ω^ (Fin 2) (fermatFiber k) y) := by
     sorry
   ```

   **Retest:** At n=5 and k_i=2 the fibre is S⁴ up to homotopy, giving π₀(Ω²X)=* and π₁(Ω²X)=0. A singleton root factor gives the same values. At n=4,k_i=2, π₁(Ω²X)=ℤ, excluded by the bound. This requires the Fermat connectivity theorem; it does not follow by unfolding the defined carrier or a single pinned lemma. The proposed signature was inspected against the native types; no Lean execution was authorized.

3. **F03** (P3) The defined support retraction has no discriminating Checks

   **Location:** `packages/AlgebraicTopologyPartII/README.md:918`: “The section of the complement quotient is the kernel of this retraction”.

   **Claim:** Section 9.3 defines a canonical support retraction by restriction, multiplication by γ⁻¹ and truncation. Its only Check describes the splitting associated with any retraction; it does not test that formula. There are fewer than three discriminating Checks for this definition.

   **Witness:** On X=ℙ², i=3, write a for the RP² generator. For the supported class with coordinate ω, restriction has total coordinates γ=1+a+a². Omitting γ⁻¹ returns 1+a after truncation, instead of 1.

   **Exact repair:** Replace the single Check with these three:

   - For X=Spec R and i=d=0, the support map and its retraction are identity maps of 𝔽₂; the complement is zero.
   - For X=Spec C over R and i=d=0, the support group is zero, ambient cohomology is 𝔽₂, the retraction is zero and the complement map is the identity.
   - For X=ℙ², d=2, i=3, the supported coordinate ω has restricted total coordinates γ=1+a+a² on RP². Multiplication by γ⁻¹=1+a gives 1 modulo a³, and truncation to p≤1 recovers ω. Truncation without that multiplication would give ω+a and fails the retraction identity.

   **Retest:** The first two maps give respectively 1↦1 and 1↦0. In the third, (1+a+a²)(1+a)=1 in 𝔽₂[a]/(a³); the wrong map produces the distinct supported class ω+a.

4. **F04** (P3) Admissibility has fewer than three discriminating Checks

   **Location:** `packages/AlgebraicTopologyPartII/README.md:1193`: “let A … consist of classes whose mod-two real coordinates α_p vanish”.

   **Claim:** The new subgroup is determined by a dimension-dependent parity window. The first Check only cautions about coefficient reduction; the second lists the windows for d=2,3 without testing an excluded class.

   **Witness:** For X=ℙ³, the nonzero supported class comes from H_G¹(RP³,ℤ(1))=𝔽₂. Its ambient image has α₀=1 and is excluded from A; the zero class has α₀=0 and belongs to A.

   **Exact repair:** Replace the two Checks with:

   - For X=ℙ², d=2, the low odd window is empty, the integral support summand is zero and A is the entire ambient group.
   - For X=ℙ³, d=3, the integral support summand is H_G¹(RP³,ℤ(1))=𝔽₂. Its nonzero class has α₀=1 and is not in A; zero is in A.
   - For X=(ℙ¹)⁴, d=4, the real locus is the four-torus and the low odd window is p=1. The support summand H_G²((S¹)⁴,ℤ(1)) is H¹((S¹)⁴,𝔽₂)=𝔽₂⁴. The supported class of the first circle generator has α₁≠0 and is excluded. Testing only α₀ would incorrectly admit it.

   **Retest:** The support ranks are 0,1,4; the tested low-coordinate values are respectively no coordinates, 1, and the nonzero first basis vector of 𝔽₂⁴. These distinguish the empty window, the first even window and the first odd window.

## Verified sound

### Earlier findings: verification at this head

The IDs below refer separately to the two round-one reviews. Quotations are from this head. “Repaired” includes an explicit supplier gap where the brief accepts that contract; it does not claim the supplier has implemented the missing theorem.

| Earlier ID | Status | Repaired passage and witness |
|---|---|---|
| a F01 | Repaired | `packages/AlgebraicTopologyPartII/Suggested.lean:186–193`: “∃ r : C(fermatFiber k, phamSkeleton k)” and “ContinuousMap.HomotopyRel”. The endpoint is inclusion composed with r, and the fixed subset is the inclusion's range. At k=(2,2), (1,0) stays fixed; (√2,i) must move. |
| a F02 | Repaired | `packages/AlgebraicTopologyPartII/README.md:708`: “a family of positive integers k_i≥1”; `packages/AlgebraicTopologyPartII/Suggested.lean:185`: “∀ i, 1 ≤ k i”. PHAM line 124 uses indexed positive exponents. k=(2,3) gives 6−5+1=2 circles; k=(1,3) gives 0. |
| a F03 | Repaired | `packages/AlgebraicTopologyPartII/README.md:1058`: “take B to be all semialgebraic opens of V and Cov all finite admissible open covers”. `TauCetiRoadmap/SchemeAndStackFoundations/README.md:3402` supplies precisely the finite-cover/intersection comparison. For ℚ₂/ℤ₂ the odd/even positive C₂ groups are 𝔽₂/0 on both sides. |
| a F04 | Repaired | `packages/AlgebraicTopologyPartII/README.md:514`: “the upper support bound … excludes m(n−3)>j”. At (n,m,j)=(4,2,0), 6>4 gives zero; at (4,1,1), 2=2 retains the term. |
| a F05 | Repaired | `packages/AlgebraicTopologyPartII/README.md:450`: “its divisibility and identification with the constructed sequence belong to §3.2”. Section 3.3 now needs §3.2. For even n,N=2, recursion gives −2,−1, and subsequent division gives −2/1,−2/2. No forward equality obligation remains. |
| a F06 | Repaired | `packages/AlgebraicTopologyPartII/README.md:733`: “PHAM … deformation-retraction lemma”. PHAM line 207 supplies the retraction, not a mapping-space comparison. S⁴ has π₂=π₃=0; S³ has π₃=ℤ. |
| a F07 | Repaired | `packages/AlgebraicTopologyPartII/README.md:1402`: “For a positive even integer n”. Line 1408 explicitly excludes n=0, where H¹=𝔽₂ and H²=0. At n=2,4,6 the H² reduction values are 1,0,1. |
| a F08 | Repaired | `packages/AlgebraicTopologyPartII/README.md:1381`: “pulled-back Bockstein (1,1)”; line 1382: “upstairs H³=0”. The two fixed-sheet obstruction is nonzero, the exchanged-sheet obstruction is zero, and n=1 has zero coefficients. |
| b F01 | Repaired; settled supplier obligation retained | `packages/AlgebraicTopologyPartII/README.md:1142`: “Consume the all-degree formula … through gap:steenrod-conjugated-real-pushforward”. The identical slug and sentence occur in the plan. BW line 1127 confirms the supplier's theorem uses Proposition 1.22. This review does not re-raise the settled implementation obligation. |
| b F02 | Repaired by different route | `packages/AlgebraicTopologyPartII/README.md:76`: “ringed space X”; line 164 explicitly assigns the “finite-cover semialgebraic site” extension to MotivesAndAlgebraicCycles. Line 1308 restricts ordinary comparison to ℝ. Regular ℤ[C₂] stalks have positive cohomology zero on each intended carrier. |
| b F03 | Repaired | `packages/AlgebraicTopologyPartII/README.md:371`: “This roadmap fixes the left action”; line 124 adds its formula to the generality gap. σ=(123),τ=(12) gives (c,b,a) on both sides of the left-action law. |
| b F04 | Repaired | The SULLIVAN entry is absent from `packages/AlgebraicTopologyPartII/sources.toml`; `packages/AlgebraicTopologyPartII/README.md:647` says “Apply StableHomotopyKTheory §3.37”. No claim to supply minimal models was introduced. |
| b F05 | Repaired | `packages/AlgebraicTopologyPartII/README.md:12`: “§4.6 supplies the homotopy-associative and homotopy-commutative H-space predicates”. Line 657 names that input. The supplier's §4.6 is group completion, and its actual predicates are the ones consumed. |
| b F06 | Repaired | `packages/AlgebraicTopologyPartII/README.md:1206`: “with d≥0”; lines 1212–1213 give d=0,1. For Spec R all four groups are zero; for ℙ¹ the nonnegative groups in the displayed chain are ℤ,𝔽₂,𝔽₂,𝔽₂. |
| b F07 | Repaired | `packages/AlgebraicTopologyPartII/README.md:605`: “SERRE lines 2623–2700, 2852”. Proposition 3 gives the odd-sphere range; Corollary 2 gives the extra rational rank of S² in degree 3. |
| b F08 | Repaired | `packages/AlgebraicTopologyPartII/README.md:1052`: “For every ambient dimension a, number b of defining equations and degree bound D”. It specifies finite A-definable pieces, fibre-preserving homeomorphisms, A-points and every real closed extension. z²=t has fibre ranks 2,1,2 at −1,0,1, so pieces cannot cross 0. BCR remains uncertified. |
| b F09 | Repaired | `packages/AlgebraicTopologyPartII/README.md:290`: “MotivesAndAlgebraicCycles §7.6b supplies”; line 328: “The §7.6b supported-Steenrod contract supplies”. The remaining laws specify consumed interfaces, not a second local construction. At a closed point in ℝ, exceptional pullback is ℤ[−1]; Sq¹(a)=a² on RP². |

Read all 1,537 README lines, all 196 Lean lines and all 19 supplied elaborated signatures. The acceptance file has 14 definitions/abbreviations and five theorems. There are no ambient `variable` blocks; the necessary binders are explicit in the signatures. No dropped instance was found. The signatures were compared with the supplied elaboration record, not re-elaborated: the read-only prohibition on Lean execution governs this pass.

Read 74 target/interface headings: 16 bold supplier interfaces and 58 numbered local targets. The review also covered the two auxiliary §11.1 targets and the conventions; sampled computations appear below. Read all 77 Checks blocks (242 bullets); numerical tests are recorded below, while S01, S03 and S04 identify incorrect or insufficient Checks. A bullet containing several examples is not counted as several bullets. Source verification covers 11 accessible source locator groups, listed below; six further works have settled access limitations. Cross-roadmap verification covers 17 named owners and all 14 declared supplier contracts. There is no new P1 finding and no padding theorem among the five current Lean theorems.

The mathematical tests below are direct computations and source comparisons, not claims that the `sorry` proofs have been completed. “Retain” means the tested statement survives these instances. Every table row specifies the values or maps that were compared.

### Sampled adversarial computations

The following rows retain representative computations from the declaration and target review. Declaration names have namespace `TauCetiRoadmap.AlgebraicTopologyPartII`; their lines refer to `packages/AlgebraicTopologyPartII/Suggested.lean`. Arbitrary spaces carry the displayed topology, and bouquet statements require an actual homotopy equivalence.

| Declaration; line; README section | Variables and instances actually retained | Instances and computed sides | Result/change |
|---|---|---|---|
| configurationTraceFormula; 63; §2.4 | F:Type, Field F, Fintype F, m:ℕ, χ:Multiset ℕ→ℚ | χ=1, m=0,1,2,3: both sides 1,q,q²−q,q³−q². At q=2 these are 1,2,2,4. At q=3,m=3, indicators of partitions 111,21,3 give respectively 1,9,8, matching (27−27+6)/6,(27−9)/2,(27−3)/3. | Retain. Field excludes zero ring and q=1; m!=1 at m=0. FD conclusion prevents finrank masking infinity. |
| eulerExponent; 84; §§3.1–3.2 | n,N,r:ℕ; value in ℤ | N=2, even n, r=1,2,3 gives −2,−1,−2; odd n gives 2,−3,2. N=0 gives 0. At r=0, empty divisor sum and total division give 0/0=0. | Retain; positive denominator required only when using exponent identity. |
| IsTame; 100; §4.1 | implicit n:ℕ, f:MvPolynomial(Fin n)ℂ | f=z₁: gradient norm 1. Constant f, n≥2: gradient 0 at all points, so no positive exterior bound. f=x²y−x on (t,1/(2t)): gradient (0,t²), norm→0 while points escape. | Retain; critical-locus condition alone would admit the last wrong model. |
| fiberMilnorNumber; 116; §4.2 | implicit n, f, a:ℂ | For x³+y³−1, μ^(−1)=4 and μ⁰=0. For x³−3x+y², μ^(−2)=μ²=1. Multiplication by t² on ℂ[t]/(t³) has maximal generalized zero-eigenspace dimension 3; kernel and quotient dimensions are 2. | Retain; ordinary eigenspace/Tjurina replacements fail. |
| tameFibreBouquet; 127; §4.2 | n≥2, f, IsTame f, a, x:S^(n−1) | Linear f: μ−μᵃ=0−0=0, fibre≃point. Cubic x³−3x+y²: regular level 0 gives 2−0=2 circles; critical levels ±2 give 2−1=1. Fermat cubic in two variables: level −1 gives 4−4=0. | Retain; natural subtraction agrees with μᵃ≤μ. |
| rationalBouquetRanks; 136; §4.5 | s,N,k:ℕ, x:S^(s+2), Y, TopologicalSpace Y,y,hY | Two S²: ranks of π₂,π₃,π₄ tensored with ℚ are 2,3,2, matching signed e(3,2,r). One S³: rank 1 at π₃ and 0 at π₂,π₄. N=0 gives all 0. | Retain; divisibility branch and toNat produce the expected nonnegative ranks. |
| doubleLoopBetti; 159; §5.1 | s,N,j:ℕ, x:S^(s+3), Y, TopologicalSpace Y,y,hY | j=0: empty product coefficient 1=rank H⁰. N=0: ranks 1,0,0,… . Ω²S³: 1,1,0,… . Ω²S⁴ degrees 0…6: 1,0,1,0,1,1,1 from (1+t⁵)/(1−t²). | Retain. r>j has minimum degree 2r−1>j, so omitted factors cannot change coefficient j. |
| phamStrongRetraction; 184; §5.3 | n≥2, indexed positive k | k=(2,2): H_t(1,0)=(1,0) for every t; H₀(√2,i)=(√2,i), H₁ lands in skeleton. k=(2,3) gives K₂,₃ with first Betti 6−5+1=2. k=(1,3) is contractible. | Retain. Root multiplication supplies w, so equivariance is not vacuous. S02 adds the separate missing endpoint. |

Target lines refer to `packages/AlgebraicTopologyPartII/README.md`. In real-locus rows, G=C₂; negative-degree groups and empty coordinate sums are zero.

| Target/interface; line | Instances and computed sides | Result/change |
|---|---|---|
| 2.1 Arrangement purity; 387 | Empty arrangement in A²: H⁰-rank 1, compact H⁴-rank 1. PConf₂≅A¹×G_m: ordinary degrees 0,1 and compact degrees 4,3 have rank 1. | Retain affine dimension m, not m−1. |
| 2.3 Signed tensor-permutation character; 400 | N=2,m=2: identity trace 4; transposition 2s_n. m=3: a 3-cycle has trace 2, identity 8. m=0 tensor unit has trace 1, including N=0. | Retain Koszul/sign parity, including 0⁰=1. |
| 3.5 Stable diagonal; 510 | n=4,N=1 stable series 1+t; n=5,N=1 series (1+t⁵)/(1−t²). At n=4,m=2,j=0 the proposed compact degree 6 exceeds 2m=4 and vanishes. | Retain corrected upper support bound. |
| 5.4 Double-loop simple connectivity; 731 | n=5 quadrics: π₂S⁴=π₃S⁴=0, hence π₀Ω²=* and π₁Ω²=0. n=4 quadrics: π₁Ω²S³=ℤ. | True; S02 adds the statable headline. |
| 7.6 Bockstein coordinates; 814 | Point: β(ω)=ω² and β(1)=0. Circle: trivial local-system β(1)=0, nontrivial sign-system β(1)=a. Thus coefficient twist term cannot be dropped. | Retain β(a_{i−1})+(k−i)a_i. |
| 8.5 Finite Borel purity; 849 | For point, s=1, approximation RP¹ has H⁰=ℤ=H_G⁰; H¹(RP¹,ℤ)=ℤ while H_G¹(pt,ℤ)=0. | Retain strict i<s, not i≤s. |
| 9.3 Mod-two support splitting; 910 | Spec R: retraction id; Spec C: retraction 0 and complement map id. RP², i=3: γ⁻¹γ=1; uncorrected truncation gives 1+a. | True formula; S03 supplies discriminating Checks. |
| 9.4 Integral support splitting; 922 | At X=A¹, i=j=1 (wrong parity), support H⁰(ℝ,ℤ)=ℤ maps to ambient H_G¹(ℂ,ℤ(1))=𝔽₂ by reduction, so it is not injective. Allowed parity avoids this. | Retain i−j even. |
| 10.5 Self-duality; 1019 | RP², d=i=2, x=1,y=a: top coefficient of xyγ is 1, while top coefficient of xy alone is 0. Point pairing sends 1·1 to 1. | Retain γ in the pairing. |
| 11.1 Affine high-degree restriction; 1044 | A¹(ℂ) retracts equivariantly onto ℝ. G_m has nonzero ordinary H¹ at boundary d=1. Spec C has H_G⁰=ℤ→0, but positive groups 0→0. Square-zero thickening leaves these loci unchanged. | Retain strict i>d; S01 corrects the disconnected example. |
| 13.1 Admissible subgroup; 1191 | d=2: no low odd coordinate, support rank 0. ℙ³: nonzero support class has α₀=1. (ℙ¹)⁴: support rank 4, first basis class has α₁≠0. | True subgroup; S04 supplies discriminating Checks. |
| 13.3 Real-empty quartic; 1219 | Smooth quartic threefold: b₃=(3⁵−3)/4=60. Even-degree conjugation traces 1,−1,1,−1 sum 0; no fixed points gives odd trace 0; invariant rank (60+0)/2=30. | Retain full ordinary Betti input and alternating trace. |
| 14.3 Ramified triangle; 1280 | Local z²=t: trace at branch stalk is multiplication 2. On punctured disc the sign system has H⁰=0,H¹=ℤ/2. Empty branch gives the ordinary covering sequences. | Retain derived direct image; ordinary extension by zero loses the local H¹. |
| 15.3 Lift criterion; 1373 | Two fixed sheets: H²(ℤ(1)²)=0, H²(ℤ/2)=𝔽₂, obstruction 1↦(1,1)≠0. Two exchanged sheets: upstairs H³=0 and nonzero quotient class lifts. n=1 all quotient groups 0. | Retain iff and the repaired opposing witnesses. |
| 15.4 Integral lift sign; 1387 | n=4, η=0,ζ=[e₁], a=η−φζ=3 mod 4. Correct −ψζ=(3,−1,−1,−1) reduces to diagonal 3; +ψζ reduces to diagonal 1. | Retain minus sign. |
| 15.5 Cyclic adjunction comparison; 1400 | n=2,4,6: H¹ reduction is 1,1,1; H² reduction is 1,0,1. n=0 instead gives integral-sign H¹=𝔽₂,H²=0 and is excluded. | Retain positive even n and n/2 mod 2. |
| 15.6 Circle obstruction; 1413 | n=2: (𝔽₂⊕ℤ)/⟨(1,2)⟩≅ℤ/4, nonsplit. n=4 gives 𝔽₂², split. Constant ℤ/4 coefficient extension has connecting class δ(1)=0 although 0→𝔽₂→ℤ/4→𝔽₂→0 does not split as groups. | Retain sheaf-extension versus cohomological-boundary distinction. |
| 16.2 Stratified transport; 1462 | xy=t has node stratum only over t=0; derivative rank 0<1, so submersion fails. Constant pair has product transport, preserving both strata. | Retain explicit invariant control data. |

### Conventions and declared-contract tests

| Convention/contract | Computed witness; comparison | Result |
|---|---|---|
| Small universes and actual equivalences | Empty index Fin 0 yields one function but an empty Fermat fibre (0≠1). The arbitrary Y in the acceptance file is tied to an actual bouquet equivalence, so a disconnected two-point Y cannot satisfy its connected-bouquet hypothesis. | No vacuous arbitrary carrier. |
| Sign ε_n and s_n | n=0,1,2 gives ε=1,0,1 and s=−1,+1,−1. Natural subtraction n−1 would instead give the wrong sign at n=0. | Correct n+1 convention. |
| Frobenius | G_m ordinary eigenvalues 1,q; compact degrees 1,2 eigenvalues 1,q; alternating compact trace q−1. Arithmetic Frobenius would give q⁻¹ and fail the point count. | Geometric convention retained. |
| Twists and Gysin | Conjugation on ℂ and ℂ² has determinants −1,+1; complex codimension 1 shifts 2 and real codimension 1 shifts 1. Double sign twist gives +1. | Compatible across suppliers and Layers 7–16. |
| Empty and zero objects | Empty cohomology is 0; its total ring has 0=1. Empty wedge has one basepoint and H⁰=ℚ. Zero coefficient module gives every group 0. | Distinct empty-space/point cases retained. |
| Coefficients and denominators | q=1 is excluded by Field/Fintype; q=2,3 computations above work. m!=1 at m=0; r>0 for Möbius identities. The zero ring is allowed only for formal coefficient-tuple configuration schemes, with one tuple. | No hidden “good primes” restriction. |
| Nonabelian action | S₃ left-action test gives (c,b,a) on both sides. A discrete S₃ H-space is associative but not homotopy commutative: (12)(23)≠(23)(12). | No use of commutative rational H-space theorem on arbitrary groups. |
| finite-group-borel-approximation | Point, s=1: H⁰ agrees as ℤ; degree 1 gives ℤ versus 0. | Contract's i<s is necessary and precise. |
| finite-group-ext-stalk | Trivial group gives Ext⁰=F_x, higher groups 0; C₂ regular lattice gives higher groups 0; sign lattice gives H¹=𝔽₂. | Finite rank in each bar degree is sufficient; arbitrary group claim is not made. |
| real-closed-semialgebraic-geometry | Closed interval has two vertices and one edge; open interval is only the open edge, not a compact finite realization. Both have H⁰=ℤ. | Contract addresses arbitrary real closed fields and marked families. |
| configuration-cover-comparison | A¹ compact trace q; point trace 1; m=2 squarefree count q²−q also at q=2. | One comparison diagram is the missing compatibility, not a new trace formula. |
| configuration-carrier-generality | Empty X,m=0 gives one configuration; singleton X,m=2 gives none. Zero ring formal coefficient tuples give one scheme point, not injective tuples. | Minimal extension of the existing Hausdorff/field formulation. |
| semialgebraic-free-quotient-geometry | Two-point free action has quotient point; a fixed point is not free. Antipodal circle quotient is circle. | Restricts to finite free actions and retains separated/local-completeness assumptions. |
| semialgebraic-equivariant-sites | Regular coefficient H²=0 versus trivial rank-two H²=𝔽₂²; empty open extension is zero. | Free descent and induction compatibility are concrete missing maps. |
| semialgebraic-support-dimension | Point dimension 0 has ordinary supported H^{>0}=0; local support of a point in ℝ has H¹=ℤ, so the bound is d, not d−1. | Ordinary supported theory; no false bound on fixed-point equivariant cohomology. |
| semialgebraic-fixed-point-trace | Antipodal S²: traces on H⁰,H² are 1,−1, sum 0. Identity S² has total trace 2 and fixed points. | Boundary case separates fixed-point-free and identity maps. |
| semialgebraic-duality-coefficients | Point ℤ/4 pairing gives 1/4; ℝ has compact H¹=ℤ and orientation shift 1. Infinite direct sum fails finite perfect biduality. | Arbitrary noetherian coefficient rings distinguished from finite-stalk perfect duality. |
| supported-steenrod-comparison | Sq¹(a)=a² on RP², but 0 on S¹; positive squares of degree-zero unit vanish. | Additional instability/Adem/Bockstein/compatibility content is not already the supplier's bare Cartan/Thom package. |
| rational-commutative-hspace-hopf | Ω²S³ gives Λ(x₁), Ω²S⁴ gives ℚ[y₂]⊗Λ(z₅). Without commutativity, discrete S₃ fails its product law. | Extends the supplied primitive Hurewicz result by the stated Hopf comparison. |
| semialgebraic-ext-stalk | Trivial/sign/regular stalks give (H¹,H²)=(0,𝔽₂),(𝔽₂,0),(0,0). | Distinct site extension of the ringed-space contract. |
| steenrod-conjugated-real-pushforward | Identity gives Sq Sq⁻¹=id; point→real ℙ¹ gives a unchanged by total Sq. Negative coordinate windows are empty. | Precise all-degree supplier obligation; settled finding not re-raised. |

All fourteen slugs occur in both `packages/AlgebraicTopologyPartII/design/plan.json` and the named supplier subsection of `packages/AlgebraicTopologyPartII/README.md`; all fourteen `needs` sentences match verbatim between those two files. None has supplier `none`. No contract was found to demand an already supplied complete result: the extra coefficient ranges, arbitrary-real-closed geometry or comparison maps are explicit. Multiple compatibility laws on a single construction were treated as one precise contract, not as unrelated compound requests. Acceptance is conditional on these declared contracts, as the brief allows.

Characteristic-p or inseparable scheme pathologies are not silently admitted into the real-locus statements: real closed fields have characteristic zero. Finite-field configuration statements were tested in characteristics 2 and 3. DVR ramification and non-quasi-separated schemes are not parameters of the native acceptance theorems; the scheme-locus convention explicitly imposes separated finite type. The tests above retain finite dimension, compactness/properness, finite covers and finite-stalk hypotheses where they are used.

### Ownership, suppliers and order

Object searches covered the pinned libraries, active and completed main roadmaps, board packages and the 55 supplied open-head checkout folders. The prescribed `roadmaps grep` searches were also run, using configuration spaces, Milnor fibres, Whitehead products, Pham/Hilton, semialgebraic cohomology/purity, trace quotients, regular coefficients and fixed-locus operations, not just local declaration names. No competing definition with the namespace `TauCetiRoadmap.AlgebraicTopologyPartII` was found in those inputs.

The supplied configuration, generic sheaf, semialgebraic foundation and rational H-space objects remain with their cited owners. The new signed Euler transform is not QWittVectors' factorization in factors 1−a_rTʳ: it uses integer powers of 1−Tʳ. The new trace-quotient operator is a permutation-sheaf operator, not the unrelated algebraic trace quotients found by the search. No second ownership claim was identified for the local Pham retraction, bouquet computations, support-coordinate refinements or cover-lifting formulas in the supplied comparison files.

| Owner checked | Resolved section and witness |
|---|---|
| AlgebraicTopology | `TauCetiRoadmap/AlgebraicTopology/README.md:326,499,849,910,946,1573,1602`: Stages 2–8; Stage 5 item 5 explicitly imports the actual Serre sequences, monodromy and cohomological pairings. The ordinary cochain foundations precede their use. |
| SchemeAndStackFoundations | `TauCetiRoadmap/SchemeAndStackFoundations/README.md:3402,4558`: finite-cover coefficient colimits and §2.23 equivariant carriers, invariant sections, injectivity and Ext; §§0.1–0.2,0.7,2.7,2.19 were also resolved. The semialgebraic Ext extension is declared separately. |
| RealAlgebraicGeometry | `TauCetiRoadmap/RealAlgebraicGeometry/README.md:298,437`: Layers 3 and 6 supply descriptions and projection; their topological ℝ specialization is not mistaken for an arbitrary-real-closed cohomology theory. |
| AffineMorseLefschetz | `TauCetiRoadmap/AffineMorseLefschetz/README.md:152,186,208`: A2–A3 give smooth affine CW/cohomological bounds; A4.1 gives the ℝ triangulation input. Singular attachment estimates and arbitrary-real-closed extension are separately owned or declared here. |
| RealAnalyticGeometry | `TauCetiRoadmap/RealAnalyticGeometry/README.md:429`: R2.1 explicitly uses analytic maps on open simplices, bounded finite families and the original ambient space. |
| ComplexComparisonPartII | `TauCetiRoadmap/ComplexComparisonPartII/README.md:700`: C−1.1 constructs analytic local models and scheme analytification; no boundary-disc algebraization is consumed. |
| EtaleDualityAndPerverseSheaves | `TauCetiRoadmap/EtaleDualityAndPerverseSheaves/README.md:3320,3406,3542,3627,4659,7123`: §§3.5–3.8,4.7,6.5 exist. The compact Frobenius formula and quartic Betti input are present. Section 3.8 is the nonarchimedean comparison; complex comparison is supplied by 3.5–3.7. The joint configuration compatibility remains the declared gap. |
| DifferentialGeometry | `TauCetiRoadmap/DifferentialGeometry/README.md:341,371,884`: orientation cover, maximal flows and stated Sard theorem. The roadmap does not infer full relative transversality from equidimensional Sard. |
| GeometricTopology | `TauCetiRoadmap/GeometricTopology/README.md:177`: Layer 1 manifold/tangent bridge. Actual domain and boundary hypotheses are retained in §16.1. |
| SmoothBundlesConnections | `TauCetiRoadmap/SmoothBundlesConnections/README.md:173`: B1 item 5 gives horizontal complements, maximal lifts, proper surjective Ehresmann and componentwise local trivializations. |
| InverseGaloisAndArithmeticFundamentalGroups | `TauCetiRoadmap/InverseGaloisAndArithmeticFundamentalGroups/README.md:5221`: IG.5.1 supplies configurations, torsors and complex comparison; the action formula and carrier extension are declared additions. |
| MotivesAndAlgebraicCycles | `TauCetiRoadmap/MotivesAndAlgebraicCycles/README.md:1382,1395`: §§7.6a–b own the site and equivariant foundations, supported purity, orientation/trace, coordinates and operations. Their current statements and each added gap were distinguished. |
| StableHomotopyKTheory | `TauCetiRoadmap/StableHomotopyKTheory/README.md:1353,1366,1484`: §§3.36–3.37 and4.6; the H-space predicates are in4.6. The rational commutative Hopf comparison is an explicit extension. |
| MorseNovikov | `TauCetiRoadmap/MorseNovikov/README.md:499`: N6's ordinary smooth closed-manifold Lefschetz theorem; arbitrary-real-closed fixed-point trace is not attributed to this statement. |
| CharacteristicClasses | `TauCetiRoadmap/CharacteristicClasses/README.md:657,826`: C2.3 Euler evaluation and C3.2 orientation-cover/w₁, top w versus Euler and Whitney laws. |
| TangentialBordism | `TauCetiRoadmap/TangentialBordism/README.md:584`: B4 item 3 Wu classes and w=Sq(v). |
| QWittVectors | `TauCetiRoadmap/QWittVectors/README.md:203`: §1.4a has the actual coordinate-to-power-series comparison over every commutative ring, including torsion. This is distinct from the local signed exponent transform. |

Existing-roadmap revisions found by search were not substituted for main. New-roadmap suppliers were read through the supplied/open-head tooling. Broad search hits from other, unprovided open pull-request folders are not treated as certified ownership comparisons; in particular the HomotopySpheres and FourManifolds search hits were not promoted into new supplier claims.

The prescribed read-only dependency command returned:

```text
depcheck: 56 roadmaps, 646 edges, 0 problem(s)
```

There is no UPWARD, CYCLE or moved line. Local proof order is also consistent in the inspected plans: Euler construction precedes inversion; rational sphere/Hilton inputs precede double-loop ranks; finite Borel purity precedes γ and the splittings; the splitting precedes corrected localization and its self-duality; the finite-cover colimit specialization precedes the torsion bound; ψ precedes the signed lift. The all-degree Wu pushforward remains an earlier supplier obligation rather than a local prerequisite proved from its own consumer.

### Pinned-library checks and headline coverage

The manifest pins checked were Mathlib `6b7abb3c7686292736be2955bd3eb9ebf63b456a` and Tau Ceti `a91d3aafa8cd3e6bc33dfde0d7677ed0f1625039`. The following are source locations at those pins, not newer library documentation.

| Pinned input | Inspected definition/hypothesis and discriminating value |
|---|---|
| `GenLoop`, relative homotopy | `Mathlib/Topology/Homotopy/HomotopyGroup.lean:97` requires continuous cube maps sending the boundary to x; no separation or CW condition. `Mathlib/Topology/Homotopy/Basic.lean:541` fixes the specified subset for all times. The constant loop exists; the Pham skeleton must be fixed pointwise. |
| Wedge | `TauCeti/Topology/WedgeSum.lean:72,86` uses the normalization quotient with an added point. The empty index leaves that point. |
| Cohomology | `TauCeti/AlgebraicTopology/Cohomology/Basic.lean:94,100` supplies native cohomology and contravariant maps; its coefficient-category parameters are retained. `TauCeti/AlgebraicTopology/Cohomology/Relative.lean` supplies the pair maps. |
| Loop shifts | `TauCeti/Topology/Homotopy/HomotopyGroup/LoopSpace.lean:210,321` supplies the zeroth comparison and π_(m+1)(ΩⁿX)≃π_(m+1+n)X at the constant loop. Taking m=0,n=2 gives π₁Ω²≃π₃. |
| Cycle partition | `TauCeti/GroupTheory/Perm/Partition.lean:96` adds one part per fixed point to Mathlib's nontrivial-cycle multiset. Identity on three letters has partition (1,1,1), not empty. |
| Frobenius roots | `TauCeti/FieldTheory/GaloisGroups/FrobeniusOrbits.lean:106` requires squarefree f, splitting/algebraicity data and the specified q-power permutation. T² over 𝔽₂ is excluded; T²+T yields (1,1). |
| Characters | `Mathlib/RepresentationTheory/Character.lean:68,113` gives tensor character and averaging invariants. The latter has finite group and invertible group-order hypotheses; ℚ satisfies them. It is not used as modular averaging in characteristic dividing m!. |
| Generalized eigenspaces | `Mathlib/LinearAlgebra/Eigenspace/Basic.lean:556` is the union of kernels of powers, not only the first kernel. ℂ[t]/(t³), multiplication by t², gives dimension 3 rather than2. |
| Artinian decomposition | `Mathlib/RingTheory/Artinian/Module.lean:616` and `Mathlib/RingTheory/Artinian/Ring.lean:63` give the nilradical-power quotient decomposition and nilpotence. The finite-dimensional Jacobian algebra is Artinian; a constant polynomial is not passed through this argument. |
| Möbius and power series | `Mathlib/NumberTheory/ArithmeticFunction/Moebius.lean` supplies `sum_eq_iff_sum_smul_moebius_eq`; `Mathlib/RingTheory/PowerSeries/Binomial.lean` supplies `binomialSeries`; the native substitution applies because the substituted monomial has positive degree. First-degree examples above fix the sign. |
| Cyclic resolution | `Mathlib/RepresentationTheory/Homological/GroupCohomology/FiniteCyclic.lean:58,80,113` requires a commutative ring, finite commutative group and specified generator. The even formula explicitly requires nonzero degree. It supplies the algebraic C₂ calculation, not supported semialgebraic cohomology. |
| Semialgebraic predicate | `TauCeti/Geometry/RealAlgebraic/Semialgebraic/Basic.lean:63,68` has only `[CommRing R] [LinearOrder R]` and generates Boolean combinations of zero/positive polynomial sets. It does not contain topology, ordered-ring compatibility, real closedness or a sheaf site. |

The headline inventory is configuration purity/trace and stable multiplicities; tame fibres and rational bouquet homotopy; the rational double-loop algebra and full Betti product; finite joins, Pham retraction and Fermat double-loop connectivity; support splittings/low coordinates, complement duality and corrected-localization self-duality; affine and Lefschetz applications; γ/characteristic classes, near-top cup-ω and quartic rank; ramified-cover triangle, trace-quotient lifting and circle obstruction; equivariant/stratified transport, finite-index invariant image and common-lift chase.

The five present acceptance theorems cover the ordinary configuration trace, tame bouquet theorem, rational bouquet ranks, full double-loop Betti product and actual Pham strong retraction. Their bodies are `sorry` propositions, not sorry-valued data. S02 identifies the additional statable endpoint. The module docstring names the remaining headline groups and their absent carriers: compact/étale configuration representations, topological finite joins/Whitehead products, free graded-commutative rational H-space comparison, arbitrary-real-closed equivariant sites/supports/purity, characteristic/embedded-cycle interfaces and equivariant sheaf trace maps. The simplicial-complex join at `TauCeti/AlgebraicTopology/SimplicialComplex/Join.lean` does not itself provide the stated topological join carrier.

The one-tactic probe found no current theorem to delete: none follows just by unfolding the 14 simple definitions or applying a single pinned result. The helper definitions are used by the five retained headlines. No catalogue, boundary theorem, small-value theorem, free Prop stand-in or hypothesis containing its conclusion occurs. All 19 names occur in the README. There is one `import Mathlib` and three existing Tau Ceti module imports, each used. The namespace, layer comments and declaration docstrings conform; no `lemma`, `set_option`, `#eval`, `#synth`, `#print axioms` or admitted data occurs in the target file.

The head-to-main diff contains nine changed files, all under `packages/AlgebraicTopologyPartII/`. No process narrative or pull-request number was found in the README or Lean docstrings. No computational algorithm is introduced by the roadmap; formal series formulas and finite coefficient identities remain mathematical statements. This pass changed only its report and scratch notes.

### Accessible source locator groups

These eleven rows count source-level locator groups, not the number of repeated inline citations. Only legal cached extractions supplied with this job were used; no source passage was copied into the report. Original printed/internal pagination was distinguished from PDF-page markers.

| Source | Locators resolved against the supplied text |
|---|---|
| BS | Configuration definition, §1 p.894 (BS line 55); Lemma2.8 p.907 (BS line 665); torsor use in Lemma3.9 p.919 (BS line 1197); Definition7.3, Lemma7.4, Corollary7.5 and Lemma7.6, pp.941–945 (BS lines 2211,2262,2319,2322,2354,2393). The incorrect printed steps are listed below. |
| CEF | Proposition3.3 and Theorem3.7, internal pp.19–22 (CEF lines 860–1010): ordinary arrangement purity, inverse-action character conventions, finite-dimensional rational representations and weighted squarefree trace. |
| BROUGHTON | Theorem1.2 p.219, equation(2.1) p.220, Definition3.1 p.225, Proposition3.2(b) proof p.226 and §4 pp.228–232 (BROUGHTON lines 115,152–169,354,397–403,501–654): gradient tameness, isolated critical contributions and singular/regular bouquet counts. |
| PHAM | PartI §2, Theorem1 and deformation-retraction lemma, pp.337–338 (PHAM lines 118–225, especially124,204–221): indexed positive exponents, root actions and the positive-power skeleton. |
| SERRE | ChapterV §3 Proposition3 pp.492–494 and §6 Lemma7/Corollary2 pp.497–498 (SERRE lines 2623–2700,2818–2858): odd-sphere finiteness and the extra even-sphere rational group. |
| BW | v3 §§1.1–1.2 (BW lines 290–645); normal bundle, splittings and duality in §§1.3–1.4 (BW lines 646–977); Lemma1.16/Remark1.17 (BW lines 978–1022); Proposition1.22 (BW lines 1130–1166); admissibility Lemma3.5 (BW lines 1659–1692); near-top and quartic applications (BW lines 1825–1890,2465–2490). The source's §1.5 theorem depends on Proposition1.22 as BW line 1127 expressly records. |
| B19 | §2.1–2.3 coefficients, covering extensions and Bockstein (B19 lines 350–450); normal-crossing/ramified coefficient triangle (B19 lines 552–620); §4.2 double diagram chase (B19 lines 765–870); Proposition6.6 proof (B19 lines 1248–1295); §7.1–7.4 trace quotient, lifts and cyclic comparison (B19 lines 1354–1565); embedded transverse loops (B19 lines 1640–1643). |
| EP | §4.1 Theorem4.1, Propositions4.3–4.6 and Theorem4.7, internal pp.47–50 (EP lines 2127–2240): the right adjoint, locally closed/open cases and derived duality. The broader coefficient/manifold specialization is a declared supplier contract. |
| MATHER | Control data §7, integration §10 and Proposition11.1, original p.62, PDF p.34 left page (MATHER lines 474–485,792–810,969–979): properness and stratumwise submersion in the nonequivariant theorem. Equivariant averaging is a local target with invariant data explicitly assumed. |
| MILNOR-STASHEFF | Corollary11.12 p.130 and Theorem11.14 pp.132–133 (MILNOR-STASHEFF lines 3155–3159,3204–3225): Euler parity and the Wu formula. |
| GM | PartII introduction p.148, §1.1* special cases p.152 and Chapter4 p.177 (GM lines 5428–5457,5587–5597,6483–6488): singular affine homotopy dimension and the tangential/normal attachment estimates. |

## Not verifiable

- HILTON, Theorem A pp.154–155 and Corollary4.10 p.162: settled uncertified publisher locator. BS's secondary use is visible, but does not certify the original numbering or proof.
- DIMCA, Lemma4 pp.369–374: settled uncertified locator. The package's explicit proper-submersion statement was tested independently; its exact agreement with the inaccessible lemma was not certified.
- BRUMFIEL, pp.163–169: settled uncertified locator. The finite-semialgebraic fixed-point trace remains a named supplier contract.
- SCHEIDERER, Corollary18.11: settled uncertified locator; no inference that it proves more than the stated comparison was made.
- BCR, Theorem9.3.2: settled uncertified locator. The repaired uniform-family quantifiers were tested on z²=t; source-page verification remains unavailable.
- KRASNOV, Theorem2.1: waived access. The legal-source request was not reopened under another key.
- No Lean build or new elaboration was run. The 19 supplied elaborated signatures were compared directly; S02's proposed addition still needs the repair worker's permitted elaboration.
- Missing heavy carriers were audited by object/name searches at the two pins, not by implementing speculative encodings. Absence claims concern the concrete interfaces required by the docstring; a long bespoke encoding is not treated as an acceptable replacement.
- Ownership against open pull requests without supplied checkout folders was not checked beyond search leads. The report does not claim their full contents were reviewed, and does not make a new dependency on them.
- OCR in BROUGHTON, SERRE, MATHER and MILNOR-STASHEFF damages some formulas. The cited theorem statements, surrounding hypotheses and relevant narrative were readable; this pass does not certify every proof line in those books/papers.

No new reference request is needed: every cited work has a manifest key, and the inaccessible works already have settled status. No `sources.toml` edit was made.

## Source issues

- **Error** in BS at Lemma2.8, printed p.907 (BS line 665): the source says the ordered configuration space has dimension m−1; it should be dimension m, with m−1 belonging to its translation quotient; affects the proof.
- **Error** in BS at Lemma7.4 proof, printed p.942 (BS lines 2266–2268): the source says the initial weighted trace uses compact cohomology with ordinary-cohomology exponents; it should be ordinary cohomology there, followed by Poincaré duality to compact degree m+i; affects the proof.
- **Misprint** in BS at Lemma7.4 proof conclusion, printed p.943 (BS line 2319): the source says the product has unpowered factors 1−qUᵏ; it should be factors raised to −e_k(N), as in the preceding line; affects the proof.
- **Error** in BS at equation(7.3), printed p.943 (BS lines 2333–2339): the source says the entire bivariate series equals one fixed diagonal expansion; it should be that diagonal's coefficient extraction, retaining all other bidegrees in the full series; affects the proof.
- **Error** in BS at Lemma7.6, printed p.944 (BS line 2354): the source says n>2 suffices for the whole double-loop Betti product; it should be n≥4 for this locally finite connected-space formula; Ω²S² has infinitely many components; affects a stated result.
- **Error** in BW at equation(1.16), internal p.12 (BW lines 450–455): the source says finite-exponent local systems have perfect two-sided algebraic Poincaré duality; it should be finite-stalk local systems for that perfectness, or explicitly topologized duality for infinite coefficients; affects a stated result.
- **Misprint** in BW at §1.2.6 following equation(1.35), internal p.17 (BW line 645): the source says real pushforward starts on X(R); it should be Y(R), with target X(R) and the indicated degree shift; affects nothing.
- **Misprint** in B19 at equation(2.1), printed p.72 (B19 line 356): the source says Gysin's source twist is M(−k), depending on target cohomological degree; it should be M(d′−d), depending on relative complex dimension; affects a stated result.
- **Error** in B19 at Lemma7.3, printed p.98 (B19 lines 1444–1445): the source says the integral lift is p*η+ψζ; it should be p*η−ψζ with the stated (1,−φ) quotient convention; affects a stated result.
- **Gap** in B19 at diagram(7.4) proof, printed p.99 (B19 line 1465): the source says source monicity extends equality from the open locus; it should be target restriction monicity for p*(ℤ/n), justified by local non-disconnection upstairs; affects the proof.
- **Error** in B19 at diagrams(7.8)–(7.9), printed p.100 (B19 lines 1503–1520): the source says the degree-two reduction is identity for every even n; it should be multiplication by n/2 modulo2, while degree-one reduction remains identity; affects the proof.

<!-- tauceti-roadmap-review {"agent": "codex", "head": "108b271a3cce9a702c5cbf41d78100674d03a05a", "job": "RT-AlgebraicTopologyPartII~2a", "model": "gpt-6-astra", "worker": "chris-4"} -->
