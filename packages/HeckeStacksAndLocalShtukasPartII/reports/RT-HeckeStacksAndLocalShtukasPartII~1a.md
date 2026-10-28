<!-- from CBirkbeck, https://github.com/TauCetiProject/TauCetiRoadmapJobs/pull/1138#issuecomment-6434402420 -->
Red team round 1 pass a (codex) of a96277d

Verdict: needs_changes

1. **F01** (P2) The substantive semi-module bound is statable but absent

   **Location:** `packages/HeckeStacksAndLocalShtukasPartII/README.md:725`–728; `packages/HeckeStacksAndLocalShtukasPartII/Suggested.lean:9`–17. Claim: “Every extended semi-module has |V| at most this value, and the cyclic type μ attains it.”

   **Claim:** The acceptance file treats all deep results as requiring geometric carriers and consequently states none.

   **Witness:** vie06 line 431 is the independent combinatorial bound; lines 382–383 give attainment. Its inputs are subsets of ℤ, integer functions, finite tuples and sequence decompositions, all native carriers. No lattice-moduli space occurs in either conclusion.

   **Exact repair text:** “The combinatorial bound and its cyclic attainment in §2.5 are acceptance theorems. For h,m≥1 coprime and increasing μ:Fin h→ℕ with sum m, define normalized and extended semi-modules with real predicates on `Set ℤ`, `Finset ℤ`, `Fin h → ℕ` and `ℤ → WithBot ℕ`, including the actual sequence-decomposition laws. Define V by §2.2. State its finiteness and `2 * |V| ≤ Σᵢ (2*i+1-h)*μᵢ - (h-1)` in ℤ, and existence of a cyclic extended semi-module of type μ attaining equality, each with `sorry`. Keep only the definitions these two results require. The geometric chart and ADLV theorems remain listed as unavailable.” Add the Lean names to the README.

   **Repair tested:** For `(h,m,μ)=(2,1,(0,1))`, both sides of equality are 0; for `(3,4,(0,0,4))`, both are 6. The noncyclic `(5,4,(0,0,0,2,2))` example has `|V|=4`, so the bound reads `8≤8`. These statements concern the actual semi-module construction, not an assumed geometric predicate.


2. **F02** (P2) Chart nonemptiness is weakened to already occurring types

   **Location:** `packages/HeckeStacksAndLocalShtukasPartII/README.md:698`–704, 724–726, 973–979. Claim: “For every occurring extended semi-module”.

   **Claim:** The chart theorem only quantifies over types already known to occur, while the later reduction needs nonempty top strata at new bounds.

   **Witness:** vie06 lines 264–269 quantifies over every extended semi-module for μ and constructs a nonempty chart. The README assumes occurrence here and assumes X_μ(b) nonempty in §2.5; neither conclusion supplies occurrence for a new μ.

   **Exact repair text:** “For every extended semi-module (A,φ) for μ, define S_(A,φ) by its lattice conditions, without assuming it nonempty. Construct a nonempty open U_(A,φ) in affine V-space (perfected in mixed characteristic) and the stated geometric chart map to S_(A,φ). In particular every extended type occurs. The cyclic semi-module of increasing type μ gives a nonempty top exact locus for every nonnegative increasing μ of sum m.” Retain the general mixed-characteristic chart construction and use this unconditional occurrence statement before the restriction-of-scalars step of §3.8.

   **Repair tested:** At h=3,m=4,μ=(0,0,4), the normalized cyclic basis is {−3,1,5}. Its chart has |V|=3 and U=A³, so its stratum is nonempty. Declaring this stratum empty passes the original “occurring” quantifier and the conditional §2.5, but fails the repaired theorem.

3. **F03** (P2) Adjoint transport assumes the nonemptiness it must establish

   **Location:** `packages/HeckeStacksAndLocalShtukasPartII/README.md:788`–791, 1464–1471, 1684–1692. Claim: “For a fixed original κ-component with nonempty source”.

   **Claim:** §3.2 is the original-group transfer used in the sufficiency direction of §8.1, but its component comparison is conditional on original-group nonemptiness.

   **Witness:** ham15 lines 246–256 explicitly assumes the source component nonempty; that result suffices for a dimension reduction. README §8.1 instead needs to deduce source nonemptiness from the auxiliary adjoint locus. No unconditional component lifting statement is supplied.

   **Exact repair text:** “Before using adjoint reduction for nonemptiness, prove a component lifting theorem. Write κ̃ for the inertia-coinvariant representative invariant. For a geometric component α with κ̃(w)=κ̃(b)+(σ−1)α, identify the ADLV in that component with its corresponding adjoint ADLV, by the appropriate reduced or perfect comparison, without assuming the source nonempty. Prove that such an α exists exactly when κ_G(w)=κ_G(b). State and prove the comparison for the general flag setting, including the excluded characteristics; then deduce original-group nonemptiness and dimension.” Retain Hamacher’s conditional comparison as a dimension-only intermediate result and order the unconditional lifting theorem before §§6.4, 7.6 and 8.1.

   **Repair tested:** For split SL₂, b=1 and w=s t^(α∨), κ̃(b)=κ̃(w)=α=0. Its adjoint target has dimension 2. The repaired lifting theorem transfers its nonemptiness without presupposing it. For G_m, b=ϖ and w=1, the adjoint target is a point but the equation 0=1+(σ−1)α=1 has no solution, so the original empty locus is correctly excluded.

4. **F04** (P1) The basic-seed supplier excludes Frobenius-permuted components

   **Location:** `packages/HeckeStacksAndLocalShtukasPartII/README.md:147`, 1571–1588, 1732; `packages/HeckeStacksAndLocalShtukasPartII/design/plan.json`, gap `finite-coxeter-basic-class`. Claim: “For an irreducible extended affine root datum”.

   **Claim:** §7.4 consumes this gap for the simple quasi-split flag datum, which includes F-simple groups whose geometric root system is reducible.

   **Witness:** The README’s own restriction-of-scalars example at line 1732 has geometric root system A₁×A₁, with σ exchanging factors. It is F-simple but not an irreducible affine datum. §3.6 supplies only a spherical norm comparison, not the needed flag/cocenter reduction.

   **Exact repair text:** Extend this named gap, in both README and the plan’s gaps list, to: “For a semisimple extended affine root datum whose irreducible components are permuted transitively by based σ, τ∈Ω, a σ-Coxeter element c₀∈W₀ and μ∈P∨ with κ(t^μ)=κ(τ), reduction of t^μc₀ reaches a minimal cτ of the same class, with J maximal proper Ad(τ)σ-stable, W_J finite and c an Ad(τ)σ-twisted Coxeter element of W_J; (J,c) may depend on (μ,c₀). Include the reduction from a transitive component orbit to one component.” Keep its existing supplier and make §7.4 consume the extended contract. This adds the missing component case rather than restricting the final theorem.

   **Repair tested:** For Res_(E/F)PGL₂ with [E:F]=2, use τ=1, μ=(α∨,0) and c₀=(s₁,1). Its σ-support is both finite nodes. Then t^μc₀=(s₀,1) is minimal of length 1. The subset J={s₀ in factor 1, s₀ in factor 2} is σ-stable with W_J≅C₂×C₂, and c=(s₀,1) is its σ-Coxeter element; the repaired contract includes this datum. The original irreducibility hypothesis excludes it.

5. **F05** (P2) The Levi equality contract leaves “M-maximal” undefined

   **Location:** `packages/HeckeStacksAndLocalShtukasPartII/README.md:191`–192, 848; `packages/HeckeStacksAndLocalShtukasPartII/design/plan.json`, gap `levi-intersection-dimension`. Claim: “equality at M-maximal positions”.

   **Claim:** Neither the contract nor §3.4 defines the set and order in which maximality is taken. Maximality among occurring positions, in the G-dominance order, and in the M-dominance order are different conditions.

   **Witness:** ham15 lines 168–174 defines Σ(μ)={λ:dom_G(λ)≤_ℤμ}, then takes maximal elements of its M-dominant subset under ≤_M. Lines 186–188 assert equality precisely for this subset.

   **Exact repair text:** “For the unramified reductive O_F-model, a standard Levi M, dominant μ and μ_M∈S_M(μ), put Σ(μ)={λ∈Y:dom_G(λ)≤_ℤμ}. Define Σ(μ)^(M-max) to be the maximal elements of Σ(μ)∩Y^(M-dom) under integral M-coroot dominance. Then d(μ,μ_M)≤〈ρ,μ+μ_M〉−〈2ρ_M,μ_M〉, with equality when μ_M∈Σ(μ)^(M-max), on compatible classical and perfect models.” Use this same definition in §3.4 and the plan’s gap entry.

   **Repair tested:** For GL₂, M=T and μ=(1,−1), Σ(μ) consists of (1,−1),(0,0),(−1,1). Torus dominance is equality, so all three are M-maximal, whereas G-dominance makes only (1,−1) maximal. At μ_M=0 the repaired equality gives d=1, as the README itself computes. For M=G only μ is maximal and the intersection at μ is a point, with both sides 0.

6. **F06** (P3) The advantage definition has no discriminating Checks

   **Location:** `packages/HeckeStacksAndLocalShtukasPartII/README.md:571`–576. Claim: the four Checks following §1.4 validate the defined relation.

   **Claim:** All four repeat its definition or the immediately preceding reflexivity, transitivity and length criterion; none instantiates an affine datum or computes a nonempty/empty locus and its inequality.

   **Witness:** The Checks assert self-advantage, the empty-right convention, the stated η inequality and composition. None distinguishes this relation from a relation with the wrong nonemptiness implication on an actual example.

   **Exact repair text:** “Add these three computed Checks in split affine A₁, σ=id. (1) For w=s₀s₁s₀ and v=s₁, X_v is supported only at the basic class; dimensions there are 2 and 1 and the required difference is (3+1−1−1)/2=1, so w⇒v. (2) The reverse relation fails at the translation class [s₁s₀]: X_w has dimension 1 and X_v is empty. (3) For u=s₁s₀, w⇒u: at its sole supported class the dimensions are 1 and 0 and the required difference is (3+1−2−0)/2=1; u⇒w fails at b=1, where X_u is empty and dim X_w=2.” Keep the abstract laws as API statements.

   **Repair tested:** The class-polynomial reduction of §1.3 is T_w≡zT_(s₁s₀)+T_s₁. It gives precisely the four dimensions 2,1,1,0 used above; no subtraction of −∞ occurs.

7. **F07** (P3) The spherical convention Check cannot detect the Newton sign

   **Location:** `packages/HeckeStacksAndLocalShtukasPartII/README.md:74`. Claim: “Reversing the Newton sign or using absolute ranks fails this witness.”

   **Claim:** The GL₂ basic slope-(1/2,1/2) example distinguishes the defect convention and the sign of the Newton term.

   **Witness:** ρ=(1/2,−1/2) pairs to zero with both (1/2,1/2) and (−1/2,−1/2). Both sign conventions therefore give 1/2−1/2=0.

   **Exact repair text:** “This basic example distinguishes split-rank defect from absolute-rank defect. To test the Newton sign, also use GL₂, μ=ν=(1,0), b=diag(ϖ,1). Here def=0 and dim X_μ(b)=〈ρ,μ−ν〉=0; reversing ν gives 〈ρ,μ+ν〉=1.”

   **Repair tested:** The ordinary example gives 0 versus 1, while the original basic example remains 0 versus 0 under sign reversal. The actual formulas in §§0.2 and 3.8 use the correct sign.

8. **F08** (P3) The split-torus Check is false in rank zero

   **Location:** `packages/HeckeStacksAndLocalShtukasPartII/README.md:421`. Claim: “For a split torus with b=1, μ=0, the spherical locus is an infinite discrete set”.

   **Claim:** This assertion is made for every split torus, without positive-rank qualification.

   **Witness:** For the trivial split torus, X_0(1)=G(L)/G(O_L) is a singleton, not infinite. For G_m it is ℤ. Both have dimension 0.

   **Exact repair text:** “For a split torus of rank r, b=1 and μ=0, the spherical locus is the discrete coweight lattice ℤ^r and has dimension 0. It is infinite when r>0 and a singleton when r=0; no global finite-component axiom is allowed in positive rank.”

   **Repair tested:** At r=0 its cardinality is 1; at r=1 it is countably infinite. The dimension remains 0 in each case.

9. **F09** (P2) The scope excludes component comparisons used by the proof

   **Location:** `packages/HeckeStacksAndLocalShtukasPartII/README.md:25`–33, 785–807, 1464–1471. Claim: “None is a dimension-theorem input here.”

   **Claim:** The scope excludes connected components and component reductions, whereas §3.2 constructs componentwise geometric comparisons and §§6.4/8.1 explicitly consume them.

   **Witness:** README line 791 calls these component maps inputs to dimension reduction; line 1467 requires §3.2 for conclusions about the original lattice. The scope’s blanket exclusion contradicts these named prerequisites.

   **Exact repair text:** “The comparisons of κ-labelled parts of the ambient flags/Grassmannians in §3.2, and the P-alcove image comparisons of §7.5, are dimension and nonemptiness inputs owned here. Classification of connected or irreducible components, centralizer orbits on component sets, and comparison of those classifications with integral specialization remain outside this roadmap.” Retain the separate exclusions of integral deformation models, generic/special-fibre specialization and local-shtuka cohomological applications; remove the assertion that every listed component construction is unused.

   **Repair tested:** GL₂→PGL₂ sends components 0 and 2 to the same adjoint component. The repaired scope permits the two separate componentwise comparisons required by §3.2, while making no claim to classify ADLV components or their framing-group orbits.

## Verified sound

Read all 1,811 README lines and all 53 Suggested.lean lines. The inventory has **47 numbered targets**, **156 Check bullets in 49 blocks**, **13 declared gap contracts**, and **0 Lean declarations**. The target table below records computed instances for every numbered target; the convention and gap tables record additional controls. The 156 Checks were examined against these computations and their stated hypotheses; abstract restatements are not counted as successful numerical controls. R06–R08 identify failures in that Check audit. No theorem statement in Suggested.lean is available to test or probe for padding.

The two repository rule files were read. The package diff at the reviewed head contains nine files, all under `packages/HeckeStacksAndLocalShtukasPartII/`. README and Suggested contain no pull-request numbers, computational algorithms, `set_option`, `lemma` declarations, sorry'd data or placeholder propositions. All numbered targets have source locators. No source passage has been copied into this report.

### Acceptance-test inventory and headline coverage

| File / section | Declaration | Variables and instances | Computed comparison / result |
|---|---|---|---|
| Suggested.lean:1–53 | None: one import, module docstring and namespace only | No section variables, definitions, instances or theorem signatures | Declaration count=0; `#check @name` inventory=∅; padding count=0. No elaboration was run under the read-only/no-build instruction. |

The README headline inventory is: minimal-class nonemptiness/dimension (§1.1); geometric reduction (§1.2); dimension versus class-polynomial degree (§1.3); extended-semi-module charts and the combinatorial bound with attainment (§§2.4–2.5); superbasic dimension (§2.5); unipotent Lang comparison (§3.1); adjoint and Levi comparisons (§§3.2–3.4); iterated/restriction-of-scalars comparisons (§§3.5–3.7); spherical/iterated dimension (§3.8); virtual upper bound (§3.9); spherical nonemptiness (§4.1); greatest Newton class and Newton-cell dimension (§§4.2–4.3); cordial saturation, dimensions and translation families (§§4.6–4.7); double-flat factorization and geometric advantage (§§5.1–6.4); P-alcove obstruction, unrestricted basic seed and Levi image comparison (§§7.2–7.6); and the shrunken criterion/dimension with basic and large-translation specializations (§§8.1–8.4).

The geometric headlines are named in the module docstring with missing carriers. Pinned schemes, cosets, root pairings and isocrystals do not constitute the missing affine moduli or cocenter. The independent integer-set bound and attainment are the exception in R01. The affine factorization of §§5–6 additionally requires the absent extended-affine datum; replacing it by arbitrary scalar length functions would be a stand-in.

### Computed target ledger

All rows refer to `packages/HeckeStacksAndLocalShtukasPartII/README.md`. F means the general local-field flag setting, with its connected σ-stable Iwahori; Q means its simple quasi-split specialization; S means the unramified reductive O_F-model spherical setting. Equal-characteristic scheme statements and mixed-characteristic perfect statements retain their distinct test categories. Dimensions use −∞ only for empty geometric loci. Rows asserting a source comparison validate its stated scope, not a completed future proof.

| Target; context | Instances and computed values on both sides | Result / change |
|---|---|---|
| 0.1; arbitrary group H, σ∈Aut(H), σI=I | H=1: quotient and locus have 1 point. I=H: 1 coset for every b,w. Abelian H, σ=id: r_b(g)=b, hence all cosets iff b∈IwI. S₃, I=1,b=(12),g=(123): r=(13)≠(12). I=⟨(12)⟩: r(gi)=i⁻¹r(g)σ(i), so the same double coset despite I not normal. | Both membership directions hold; no normality hypothesis is needed. |
| 0.2; Q, rational virtual dimension | A₁,w=s,b=1: (1+1)/2=1. GL₂,t^(1,0),ordinary b: 1/2−1/2=0. GL₂,s t^(1,0),basic b: (2+1−1)/2=1. A₂,σ swaps nodes,x=s₁,y=s₂: η=1, length 0; untwisted yx has length 2 and changes d by 1. | Correct formula and σ⁻¹ placement. R07 concerns the separate convention Check. |
| 0.3; Q, open critical strips | A₁: (−1,0) rejected; (0,1),(−2,−1) accepted; values −1,0 survive removal of the open strip. A₂,λ=6ω₁=4α₁∨+2α₂∨: λ−2ρ∨=2α₁∨≥0 but α₂(λ)=0 and the translated alcove remains in that critical strip. | Numerical largeness does not imply shrunkenness. |
| 0.4; F flag and S exact/bounded loci | G_m,b=ϖ,μ=0: κ=1≠0, both empty, numerical expression 0. GL₂,b=1,μ=(1,−1): identity in the bounded zero stratum, absent from exact μ. Dual numbers: r(1+εt⁻¹E₁₂)=1−εt⁻¹E₁₂, nonintegral although every geometric fibre is 1. Spec(0): sheaf value singleton, no geometric field points. Finite reflection over a stable GL₂ lattice: fibre P¹\P¹(F_q), dimension 1; identity fibre q+1 points, dimension 0. | Reduced graph construction distinguishes nilpotents correctly; zero algebra and forgetful map handled. |
| 0.5; bounded finite-type/perfect models | dim(A¹)^perf=1=dim A¹; dim(Y×Aⁿ)=dim Y+n; empty mismatch −∞. Split torus rank r: component set ℤ^r, dimension 0. At r=0 cardinality 1; r=1 infinite. | Geometric dimension conventions agree; R08 corrects the rank-zero Check. General transfer proof is not certified here. |
| 0.6; F, framing b′=h bσ(h)⁻¹ | (hg)⁻¹b′σ(hg)=g⁻¹bσ(g). S₃,b=(12),h=(123): b′=(23), whereas h⁻¹ gives the wrong conjugation. GL₂ torus valuations (1,0),(0,1): distinct torus κ, both group κ=1. | Direction and need for integral Levi labels correct. |
| 1.1; F, minimal element of its σ-class | A₁,s,b=1: 1−0=1. GL₂,t^(1,0),ordinary b: 1−1=0. Same w and κ(b)=0: empty, dimension −∞. | Minimal-class criterion and subtraction sign agree. |
| 1.2; F, simple twisted conjugation | A₁,w=s₀s₁s₀,b=1: branch dimensions −∞ and 1; 1+max(−∞,1)=2. At a class of different κ both branches are empty and 1+max(−∞,−∞)=−∞. Equal-length case changes neither dimension nor nonemptiness. | Correct recurrence, including empty branches. |
| 1.3; F, normalized basis and z-degree | A₁,T_w≡zT_(s₁s₀)+T_s₁. Basic term: (3+1+0)/2−0=2. Translation term: (3+2+1)/2−2=1. Minimal term f=1 gives degree 0; f=0 gives −∞. Substituting unnormalized v-degree produces 3 instead of 2. | Normalization and maximum over matching invariants correct. |
| 1.4; Q, every supported b | A₁,w=s₀s₁s₀,v=s₁: basic dimensions 2,1, required difference 1; w⇒v. At translation b, dimensions 1,−∞ show v⇏w. For u=s₁s₀, supported dimensions 1,0 give required difference 1; u⇏w at b=1. | Definition is sound; R06 replaces restatements with these controls. |
| 2.1; h,m≥1 coprime, nonempty A⊂ℤ | h=1: normalized A=ℕ. h=2,m=1,A=ℕ: B={0,1}, sum=1, type=(0,1). A=1+ℕ: B={1,2}, sum=3; translation −1 normalizes it. Even nonnegative integers fail +1 stability; ∅ has 0 residue classes instead of h. | Positivity, nonemptiness and normalization exclude the degenerate wrong models. |
| 2.2; normalized A, actual sequence decomposition | h=2,m=1: φ(a)=⌊(a+1)/2⌋ on ℕ, V=∅. Constant 0 violates 0≥1; finite φ(−1) violates support. h=5,m=4,B={−2,−1,2,5,6}: sum=10; noncyclic φ(−1)=0<1; sequence starts −2,2,5,4,−1 have values 0,0,2,2,0. V={(4,6),(4,7),(5,6),(5,7)}, cardinality 4. | Noncyclic type is retained and the jump law has the correct direction. |
| 2.3; S, superbasic GL_h, determinant component | h=2,m=1,standard lattice: A=ℕ and φ=⌊(a+1)/2⌋. Index shift +1: ΣB rises by h=2, component rises by 1. Replacing b by ϖb: φ rises by 1. h=2,m=2: gcd=2, not an admissible superbasic instance. | Correct arithmetic Frobenius, volume and central-shift conventions. |
| 2.4; lattice-chart construction | h=2,m=1,μ=(0,1): V=∅, A^V=point, dimension 0. h=3,m=4,μ=(0,0,4),B={−3,1,5}: V={(5,6),(5,7),(5,10)}, cardinality 3, cyclic chart A³. A¹-perfection has dimension 1=1. | R02 removes the occurrence premise needed to deduce nonemptiness. |
| 2.5; superbasic GL_h and increasing μ | (h,m,μ)=(2,1,(0,1)): 0. μ=(−1,2) after central shift: value 1. (3,4,(0,0,4)): ρ·μ−(h−1)/2=4−1=3, 2\|V\|=6. Noncyclic (5,4,(0,0,0,2,2)): 6−2=4, 2\|V\|=8. | Numerical formula correct; R01 adds the statable bound/attainment and R02 supplies unconditional top occurrence. |
| 3.1; S, P=MN, admissible subsets | GL₂ upper root slopes +2,−2: corrections min(2,0)=0 and min(−2,0)=−2, equal to ρ·(ν_M−ν_G). N=1: correction 0. Over F₂, u²−u has roots 0,1 and derivative 1. GL₃ height quotients have dimensions 2 and 1; [1+E₁₂,1+E₂₃]=1+E₁₃ also in characteristic 2. | Filtration avoids a false additive-group identification of nonabelian N. |
| 3.2; conditional component comparison | GL₂→PGL₂ sends 0 and 2 to the same residue 0 mod 2. Adjoint group: identity map. G_m,b=ϖ,w=1: adjoint locus point, original empty. Component equation 0=1 has no solution. | Conditional dimension claim is sound; R03 adds the nonemptiness lift actually used later. |
| 3.3; S, F-simple adjoint superbasic factor | GL₂ slope 1/2: ranks 2,1, defect 1, adjoint κ odd. m=2 is not superbasic. GL₁ has defect 0 but PGL₁ has rank 0 and is not F-simple. Ordinary GL₂ gives rank(J_b/Z(G))=1; simple basic block gives 0. | Center and split-rank qualifications correct. |
| 3.4; S, standard Levi, b basic in M | M=G,μ_M=μ: d=0, both corrections 0. GL₂,M=T,b=1,μ=(1,−1),μ_M=0: d=1, total 0+1=1. b=diag(1,t),μ=(1,0),μ_M=(0,1): d=0, corrections −1 and −(−1), total 0. μ_M=(2,−1): intersection empty, d=−∞. | Correct signs and empty-stratum handling; R05 specifies the equality locus. |
| 3.5; S, d≥1 torsor chain | d=1 gives the original graph equation. Torus: endpoint Σμ and fibre point. GL₂,two μ=(1,0): endpoint (2,0) fibre 0-dimensional; endpoint (1,1) fibre P¹, dimension 1. U=[[1,1],[0,1]],V=[[1,0],[1,1]]: UV≠VU. Dual-number one-step test still fails. | Ordered composition and exact versus bounded distinction agree. |
| 3.6; S, finite unramified E/F | d=1: norm b. d=2 and Frobenius-fixed U,V: UV=[[2,1],[1,1]], VU=[[1,1],[1,2]]. d=3,b=(1,U,V): inverse embedding cycle gives UV, opposite cycle VU; still different modulo 2. Restricted basic GL₂ defect=2−1=1, not d. | Frobenius indexing, norm order and rank normalization agree. |
| 3.7; S, exact convolution endpoint | Two GL₂ bounds (1,0): Σμ=(2,0). At λ=(2,0), ρ·(Σμ−λ)=0, fibre point. At λ=(1,1), bound=1, fibre P¹ of dimension 1. | Stratification is indispensable; no top bound is applied to the closed union. |
| 3.8; S, nonempty exact/bounded/iterated loci | GL₂,μ=(1,0),basic: 1/2−1/2=0. μ=(1,−1),b=1: 1. μ=(1,0),b=1: κ mismatch, empty despite numerical 1/2. G_m mismatch: empty despite numerical 0. | Nonemptiness premise prevents a false finite dimension for ∅; proof still needs R02. |
| 3.9; Q, nonempty flag locus | Ordinary GL₂ translation: actual 0≤(1+0−0)/2−1/2=0; changing minus to plus gives 1. Finite A₁ reflection: actual 1≤(1+1)/2=1. | Upper bound and sign agree. |
| 4.1; quasi-split special maximal parahoric | G_m,λ=0,b=ϖ: κ 0≠1, empty. GL₂,λ=(1,0),ν=(1/2,1/2): equal κ=1, ν≤λ, nonempty. ν=(2,−1): equal κ but ν≰λ, empty. | Both conditions are necessary; top exact nonemptiness is retained. |
| 4.2; F, generic class; geometry only equal characteristic | Length-zero τ has only [τ]. GL₂,t^(1,0): greatest ν=(1,0),κ=1. κ=0 classes cannot enter even if their Newton vector is 0. A poset with two incomparable lower points and one greatest point shows greatestness alone does not assert interval saturation. | Numerical general-field and geometric equal-characteristic statements are distinguished. |
| 4.3; equal-characteristic bounded Newton cells | GL₂,w=s t^(1,0),ℓ=2: basic X-dimension 1 plus Newton pairing 0 gives dim_I N=1,c=1; ordinary X-dimension 1 plus pairing 1 gives 2,c=0. For n=1,2, subtract 4n from quotient dimensions 5,9 and 6,10 to recover 1 and 2. G_m matched identity: dimensions/codimension all 0; mismatch empty, no finite c. | Normalized dimension, codimension and empty conventions agree. |
| 4.4; Q, cordiality at greatest class | Identity: 0=0. GL₂,t^(1,0): ℓ−ℓη=1−0=1=〈2ρ,ν〉−def. A₁,s: 1−1=0=0−0. | Equivalence agrees with generic dimension formula; no inference from a chosen nongeneric class. |
| 4.5; Q, mutual advantage | Nonempty numerical values D_w=3,D_v=2,d_w=4,d_v=3: both D−d=−1; one inequality alone allows −1<0 instead. Empty comparison: both normalized values −∞ without subtracting them. | Support equality and normalized equality follow in the stated two-way situation. |
| 4.6; cordial w, fixed integral κ | GL₂,s t^(1,0): basic and ordinary X-dimensions both 1. Chain length=(1+1−0)/2=1. Equal-characteristic Newton codimensions are 1 and 0; basic closure itself, ordinary closure contains both. Torus: singleton interval and dimension 0. | Saturation and closure assertions match their separate scopes. |
| 4.7; Q, dominant λ, w=x t^λ | GL₂,x=s,λ=(1,0): greatest class ordinary, ℓ−ℓη=2−1=1, Newton/defect side=1. A₁,λ=0,x=s: I∩IsI=∅ but I⊂closure(IsI); 1−1=0. | Uses Bruhat closure, not literal inclusion of cells. |
| 5.1; full P∨, integral dominance, based σ | A₁,y=1: λ^♭♭=λ; y=s,λ=2ω∨: 0; λ=ω∨: ω∨, not 0. In simply connected A₁, ω∨∉Y. Unitary A₂,J={s₁}: dom(−σ⁻¹ω₁)=ω₁, not ω₂. λ=ρ∨ gives λ^♭♭=ω₁, difference ω₂∉Q∨, lower-bound difference α₁∨; σ-coinvariants of ℤ/3 are 0. λ=ω₁ gives ω₂ and difference (α₁∨−α₂∨)/3, not positive. | Integral coset, σ, descent side and conditional upper bound all matter. |
| 5.2; Q in P∨, canonical parabolic factors | y=1: ρ_J=0,β=γ=λ. A₁,x=y=s,λ=2ω∨: x′=z=y′=1,γ=2ω∨; lengths w₁,w₂=2,0, product t^(−2ω∨). Unitary A₂,x=y=s₁,λ=ρ∨: x′=s₂,z=s₁,y′=1,γ=ω₁; w₁=t^ω₂,w₂=t^(−ω₁+ω₂), lengths 2+2=4; a=s₂*s₂=s₂ versus s₂s₂=1. | Factor order, Demazure support and original κ warning agree. |
| 6.1; F, bounded graph-incidence pullback | u=1 gives h=g and endpoint v. u=v=s: ordinary endpoint 1 fibre A¹ and Demazure endpoint s fibre G_m, both dimension 1. A₂,u=s₁,v=s₂: s₁s₂≠s₂s₁; with σ swapping nodes, vσ(u)=1 whereas vu has length 2. | Frobenius rotation and product distinctions agree. |
| 6.2; Q, five specified chain spaces | A₁ factors above: A=1,B=t^ω∨s, Bσ(w₁)=t^(2ω∨), N₁=N₂=0. Unitary A₂ factors: A=s₁, B=t^ω₁s₁; Bσ(w₁)=σ(s₂t^ω₁); A*σ(s₂)=s₁=σ(a). Here N₁=(1+2−3)/2=0, N₂=1+1−1=1. | Terminal σ labels and restricted X₂ route pass these tests. |
| 6.3; Q, bounded fibre lower bounds | A₁ chain gives dim lower bound dim target+0+0 and virtual difference 0. Unitary A₂ gives target+0+1 and virtual difference 1. For u=v=s: ordinary half-bound=(1+1−0)/2=1, Demazure bound=1+1−1=1; an extra half would give 1/2. | Corrections and factors of two agree. |
| 6.4; Q, shrunken original datum via auxiliary P∨ | A₁,x=y=s,λ=2ω∨ gives a=1,γ=2ω∨,empty σ-support on both sides and correction 0. The construction does not itself produce a full-support seed in this case. | Auxiliary theorem consistent; original-group nonemptiness transfer needs R03. |
| 7.1; Q, σ-stable J, conjugator x | J=S: N=1 and containment equality. Split A₂,x=s₁,y=s₂,λ=2α₁∨+2α₂∨: x-conjugation gives t^λs₂s₁, translation (2,2); wrong y-conjugation gives t^(−2α₂∨)s₂s₁, translation (0,−2). In unitary A₂, σ(x)=s₂≠s₁. | Corrects the source’s conjugator and retains σ on the right. |
| 7.2; Q, every matching Levi class | GL₂ diagonal torus: [diag(ϖ,1)] and [diag(1,ϖ)] have κ_M=(1,0),(0,1), same group class and κ_G=1. J=S leaves only the group κ test. | Correct all-classes obstruction; basic-only uniqueness is not extended to ordinary b. |
| 7.3; Q, shrunken and strictly positive λ^♦−ν | A₁,t^(nα∨),b=1,n≥1: η=1, support ∅, positive gap, locus empty. Same w,b=t^(nα∨): gap=0 and dimension=2n−2n=0. | Strictness cannot be dropped. |
| 7.4; Q, full σ-support and basic b | A₁,γ=0,a=s: P¹\P¹(F_q), dimension 1 even q=2. A₂,γ=0,a=s₁s₂: a classical DL surface of dimension 2, with one root still in (−1,0), hence not shrunken. A₁,γ=α∨: basic coefficient 1, dimension (3+1)/2=2. Unitary A₂ twisted commutator T_s₁−T_s₂≠0 in H, image 0 in the cocenter; −T₁∉H⁺. a=1 positive translation has no basic point. | Nonshrunken seed is needed; component-permuting case needs R04. |
| 7.5; Q, P-alcove twisted product | G_m,q=2,ζ³=1: (1,1) and (ζ,ζ) both map to 1 since ζ²/ζ²=1. Wrong untwisted pair (ζ,1) maps to ζ/ζ²=ζ²≠1. J=S gives identity. GL₂ torus κ_M=(1,0) selects one of the two group-conjugate Levi classes. | Quotient action and indexing of images are correct. |
| 7.6; Q, cordial family with basic seed | GL₂,a=s,γ=(1,0): basic and ordinary κ=1 classes give dimension 1 and 1; κ=0 is excluded. | Interval logic correct conditional on seed and original-group transfer. |
| 8.1; Q, shrink, strict λ-gap, double-flat lower bound | PGL₂,b=1,w=s t^(nα∨),n≥1: matching κ, support {s}, alcove (2n,2n+1), nonempty. w=t^(nα∨): same λ and κ, support ∅, empty. | Both directions pass; general proof needs R03–R04. |
| 8.2; same hypotheses plus equivalent nonemptiness | A₁,n=1,2: (2n+1+1)/2=2,3. Unitary A₂ example: λ^♦=ρ∨, (λ^♭♭)^♦=ρ∨/2,ν=0,ℓw=4,ℓη=2,def=0, dimension 3. | Numerical theorem and the auxiliary-lattice example agree. |
| 8.3; Q, basic, no strict-gap assumption | A₂,w=w₀,λ=ν=0: strict gap fails but dimension=(3+3)/2=3 and all positive-root alcove values lie in (0,1). Res quadratic PGL₂,λ=(α∨,0): average=(α∨/2,α∨/2), coefficients both 1/2. | Basic specialization retains the λ=0 case; the restriction example witnesses R04’s scope issue. |
| 8.4; Q, shrink plus λ^♦≥ν+2ρ∨ | A₂,λ=6ω₁,ν=0: difference from 2ρ∨ is 2α₁∨ but α₂-value 0, so shrink fails. A₁,λ=α∨=2ρ∨,w=s t^λ: condition holds, dimension 2. | Numerical range does not replace the separate alcove hypothesis. |

### Conventions and declared-gap ledger

The 13 top-level plan slugs equal the 13 README contract slugs, and each names a supplier. Their absence from a supplier today is not reported as a defect. R04 concerns insufficient hypotheses for the consuming theorem; R05 concerns an undefined condition. The previous repair’s maintainer-only ownership disposition for the affine RootSystemsPartII extensions is not re-raised.

| Statement / contract | Instances and values | Result / change |
|---|---|---|
| Arithmetic σ versus geometric trace | For q=2, H²_c(A¹)=Q_ℓ(−1): geometric eigenvalue 2, arithmetic inverse eigenvalue 1/2; H¹_c=0. Over F₃ the corresponding pair is 3,1/3. | Compatible with TraceFormula; no ℓ≠2 requirement when p≠2. |
| Translation and volume adapters | diag(ϖ,1) has κ=+1 and ν=(1,0), but RG2.4 label (−1,0). Its inverse has κ=−1,ν=(0,−1). diag(ϖ²,1) gives +2 versus −2. Leading bases {0,1} and {1,2} have sums 1,3 and determinant components 0,1. | Actual representatives agree across suppliers; inverse labels are not inverse matrices. |
| Coefficient and boundary domains | q=p^f,f≥1 implies q≥2; q=1 is not a residue field. In the formal Hecke algebra v=1 gives z=0 and T_s²=1. For a field rather than a nontrivial DVR no chosen local-field uniformizer exists. d=0 is excluded from the norm/iterated datum; h=0 excluded from the semi-module datum. | These are excluded inputs, not counterexamples to the scoped theorems. |
| gap:unipotent-linearization | GL₃ upper unipotents: quotient dimensions 2,1 and commutator coefficient 1, including p=2,3. For N=1 the filtration has no nonzero quotient. | Exact additive successive quotients, not a logarithm of N; no native duplicate located. |
| gap:demazure-product | A₁:s*s=s, lengths 1=1+0; s·s=1. With length-zero τ swapping s₁,s₂, τ*s₁=s₂τ: transported support {s₂}, not {s₁}. | Extension and support transport are precise. |
| gap:twisted-redmin | A₁ word s₀s₁s₀ reduces to s₁ of length 1; an already minimal simple reflection stays at length 1. Strong conjugacy is allowed to use extended-group conjugators; simple reduction and strong conjugacy are distinct. | No false requirement that all minima be joined only by simple cyclic shifts. |
| gap:straight-finite-parabolic | A₁ minimal s: J={s},u=s,x=1, length 1 and Newton 0. Translation t^α∨: J=∅,u=1,x=t^α∨, length 2=〈2ρ,α∨〉. | Finite factor versus straight part distinguished. BunG §1.10 uses this reduction but does not specify all the requested double-minimality/support conditions. |
| gap:finite-coxeter-basic-class | Affine A₁,τ=1: μ=0,w=s₁ yields minimal s₁; μ=α∨ gives t^μs₁=s₀. Length-nonincreasing simple conjugations cannot change either length-one word to the other. A₁×A₁ with σ swapping factors is outside the current irreducibility hypothesis. | Dependence of (J,c) on input is correct; R04 adds the missing transitive-component scope. |
| gap:parabolic-root-length | A₂,w=w₀,y=s₁s₂: inversion set of y⁻¹={α₁,α₁+α₂}; product length 1=3−2. A₁,w=y=s: 0=1−1. w=1,y=s: hypothesis false and proposed equality 1=−1 false. Rank zero: 0=0−0. | Integer subtraction and sign direction correct; pinned subadditivity is weaker. |
| gap:dominant-subtraction | A₁ full P∨=ℤω∨,Q∨=2ℤω∨: 0−_domω∨=ω∨, not 0. Iterating (2ω∨−_domω∨)−_domω∨=0=(2ω∨−_dom2ω∨). | Tracks the unsaturated integral coset and the ordinary-difference case. |
| gap:superbasic-classification | GL₂ slope 1/2: rank(J_b/Z(G))=0,def=1. Ordinary slopes (1,0): rank(J_b/Z(G))=1 despite rank(J_b/Z(J_b))=0. | Criterion excludes the plausible wrong center; restriction-of-scalars lift is genuinely extra data. |
| gap:newton-poset-length | GL₂,κ=1,b basic and b′ ordinary: 〈2ρ,ν′−ν〉=1, defects 1,0; chain length=(1+1−0)/2=1. Equal endpoints give (0+def−def)/2=0. | Correct defect sign, fibre restriction and half-factor. |
| gap:newton-cell-strong-purity | In the equal-characteristic GL₂ cell s t^(1,0), basic stratum codimension 1 below ordinary; intersection with the lower closed locus has codimension 1. For a singleton torus κ-fibre there is no strictly smaller maximal class. | The contract asks topological strong purity, not affineness; coefficient scope explicit. |
| gap:newton-cell-greatest | GL₂ cell s t^(1,0): greatest class ν=(1,0),basic ν=(1/2,1/2) below; closure has the same greatest class. A₁,I∩IsI=∅ while I⊂closure(IsI). | Closure and literal-cell assertions kept distinct; no automatic saturation. |
| gap:levi-intersection-dimension | GL₂,M=T,μ=(1,−1): M-order is equality on its three Σ(μ) elements, while G-order is not. μ_M=0 gives d=1=〈ρ,μ+μ_M〉. | R05 defines the missing maximality condition. |
| gap:twisted-affine-cocenter | T_s²=zT_s+1; at v=1 gives 1. A₁ length-three word has basic coefficient 1 (degree 0), translation coefficient z (degree 1). σ(s₁)=s₂ gives twisted commutator T_s₁−T_s₂ versus ordinary 0. | Integral parameter, positivity, degree and σ-twist are specified; generic SR.1.5 presentation alone is insufficient. |

### Pinned APIs and ownership

Pins read from `lake-manifest.json`: Mathlib `6b7abb3c7686292736be2955bd3eb9ebf63b456a`; Tau Ceti `a91d3aafa8cd3e6bc33dfde0d7677ed0f1625039`. **Fourteen named pinned declarations/carriers** were reopened with their variable contexts:

| Native file and lines | Names and actual scope | Witness |
|---|---|---|
| `Mathlib/GroupTheory/DoubleCoset.lean:37`, :44, :51 | `DoubleCoset.doubleCoset`, `mem_doubleCoset`, `doubleCoset_eq_of_mem`; set product first, subgroup equality later | Arbitrary sets may omit 1; subgroup H=K=1 gives {a}; nonnormal S₃ subgroup still permits changing subgroup factors. |
| `Mathlib/GroupTheory/Coset/Defs.lean:66`, :71 | `QuotientGroup.leftRel`, `leftRel_apply`; subgroup relation x⁻¹y∈I, no normality | I=⟨(12)⟩⊂S₃ gives 3 left cosets even though it has no quotient-group structure. |
| `Mathlib/Data/Finset/Defs.lean:75` | `Finset` is a multiset with no duplicates | {0,1} has cardinality 2; repeated 1 is not counted twice. |
| `TauCeti/GroupTheory/DoubleCoset/Basic.lean:100` | `DoubleCoset.mul_mem_doubleCoset_iff`, with b∈H explicit | H=1 allows only b=1; dropping membership permits b∉{a} while a∈{a}. |
| `TauCeti/GroupTheory/Coxeter/Parabolic.lean:101`, :233, :280, :330 | `CoxeterSystem.parabolic`, `IsMinimalCosetRep`, `length_mul_of_isMinimalCosetRep`, `existsUnique_isMinimalCosetRep_mul`; arbitrary index set and subgroup, no finiteness | A₁,J=∅: w=w·1; J={s}: w=1·w. Lengths respectively ℓw+0 and 0+ℓw. |
| `TauCeti/LinearAlgebra/RootSystem/Inversions/Basic.lean:50`; `TauCeti/LinearAlgebra/RootSystem/Inversions/Length.lean:148`, :172 | `TauCeti.inversions`, `isLeast_ncard_inversions`, `ncard_inversions_mul_le`; finite root indices, reduced/crystallographic, characteristic-zero domain for the length results | A₁: inversion counts 0 and 1; s²=1 gives 0≤1+1. This does not itself assert the general cancellation equality. |

Object searches covered main, Completed, board packages, the supplied open sibling checkouts, and the roadmap service’s indexed heads. They searched affine Deligne–Lusztig loci, affine flags/Grassmannians, semi-modules, cordiality, Newton cells, twisted cocenters, convolution and Frobenius endpoint constructions. The apparent other semi-module hits concern modules over semirings; finite Deligne–Lusztig representation/stratum projects do not own these affine local-field dimension theorems. Generic moduli/flag/convolution objects are already assigned to GS0/GS2; this package owns their specific relative-Frobenius pullbacks and the ADLV dimension/nonemptiness applications. The contextual base roadmap owns characteristic-zero Hecke actions and local-shtuka towers, with its own source/target modification convention; no direct identification with its oppositely bounded tower is asserted here. There are no local Lean names to collide with siblings.

**Cross-roadmap audit: nine named roadmap records checked**, including the contextual base and the accepted RootSystemsPartII design. Sections and anchors were resolved at the current indexed open heads, at main for existing main roadmaps, or at the supplied board design where explicitly recorded below.

| Roadmap / exact current section | Evidence and scope comparison |
|---|---|
| ReductiveGroupsPartII RG2.0.4; RG2.1; RG2.3; RG2.4 | `TauCetiRoadmap/ReductiveGroupsPartII/README.md:852` supplies completed unramified field/Frobenius; :1852 apartment; :4289 parahoric; :4532 associated parahorics; :5203 and :5222 Lang inputs; :5535 Iwahori–Weyl; :5656 length/Bruhat; :5713 Tits system; :5748 Kottwitz quotient; :5817 simple-cell product; :5994 cocharacters; :6127 dominant normal form. The inverse translation label is explicitly transported by this package. |
| RootSystems Layers 3,4,6 | `TauCetiRoadmap/RepresentationTheory/RootSystems/README.md:274`, :296, :356 contains Coxeter combinatorics, chambers/longest element and integral data. Integral real-root pairing scope and native parabolic API are kept separate. |
| RootSystemsPartII RS2.1, integral-order | `packages/RootSystemsPartII/design/README.md:30`, :38–47 retains the integral lattice and coroot flip. The citation tool’s “not on main or in an open pull request” lead does not erase this supplied accepted design. The six additional contracts remain gaps; the settled ownership issue is not re-raised. |
| BunGAndNewtonStrata §§0.5–0.6,1.7–1.8,1.10–1.11,1.13–1.15,1.21,1.27,1.30,1.43,1.45 | `TauCetiRoadmap/BunGAndNewtonStrata/README.md:538` gives integral invariant descent; :628 straight comparison; :648 classification; :680 centralizer; :731 defect; :854 Newton order; :1003 ordinary translation; :1047 norm; :1274 p-adic z-extension lifting; :1312 general Levi comparison. The p-adic restriction of §1.43 is acknowledged, and representative inertia coinvariants are not confused with final σ-coinvariants. R03 concerns the missing geometric lift here, not an imagined generalization of §1.43. |
| GeometricSatakeAndFusion GS0/GS1/GS2 | `TauCetiRoadmap/GeometricSatakeAndFusion/README.md:772`, :784, :824 supply perfect comparison, equal-characteristic models, flags/components; :970 and :994 supply the GS0 incidence/fibre targets retain bounded pfp/connected-parahoric hypotheses. :1076 supplies split semi-infinite intersections; :1419 convolution; :1456 exact-stratum semismallness. General-Levi equality is separately declared as a gap. |
| SchemeAndStackFoundations §§0.7,0.9,0.23–0.26 and Layer 1 | `TauCetiRoadmap/SchemeAndStackFoundations/README.md:755`, :785, :848, :1475, :1508, :1565, :1604, :1640 and :2044 contain the named dimension, approximation, universal-homeomorphism, étale-invariance, perfection, pfp and algebraic-space/torsor material. Finite-type/qcqs hypotheses are applied on bounded models rather than imposed on the whole infinite-component locus. |
| TraceFormula Layer 11 | `TauCetiRoadmap/CohomologicalPointCounting/TraceFormula/README.md:380` states the separated finite-type compact-support trace formula with finite coefficient ring of order prime to p and bounded constructible finite-Tor complex. The family’s EllAdicRealization comparison supplies the stated rational version. Arithmetic σ on points is not substituted for geometric cohomological Frobenius. |
| SmoothRepresentationsOfLocalGroups SR.1.5 | `TauCetiRoadmap/SmoothRepresentationsOfLocalGroups/README.md:1501`, :1503, :1552 contain the split presentation and the generic integral basis/base-change obligation. Rescaling U_s by v⁻¹ gives exactly zT_s+1. The twisted general-datum cocenter is not already this target. |
| HeckeStacksAndLocalShtukas HS0–HS4 | `TauCetiRoadmap/HeckeStacksAndLocalShtukas/README.md:3`–45 distinguishes the base tower/action direction and imports generic loop/Satake geometry. This package’s introduction stops at that boundary and adds the affine special-fibre dimension direction. |

The service’s output line includes one metadata header before the file; repository line numbers above refer to the file itself. The supplier checks establish the cited contracts, not correctness of every theorem elsewhere in those much larger roadmaps.

Mechanical dependency check, run without changing README or merge order:

```text
depcheck: 56 roadmaps, 646 edges, 0 problem(s)
```

No UPWARD or CYCLE line was emitted. The mathematical prerequisite omissions in R02–R04 are not detected by that roadmap-level graph check. No ownership move to a later supplier is proposed.

### Source-locator audit

**Fifteen source-locator records verified**, one per manifest work, are below. Within each row the numbered locators were read in the supplied legal extraction; this count counts records, not repeated citations of the same theorem. All 15 manifest keys are unique and certified. No additional source was needed or requested. Version-dependent pages below refer to the version the README identifies. The qualifications and source errors listed later are part of this audit, not an assertion that every source statement is correct.

| Source | Locators read and reproducible text anchors | Application checked |
|---|---|---|
| he21 | §2.2 and Theorem 2.1, pp.4–5 (he21 line 186, line 210); Theorems 3.1–3.2, Proposition 3.3 and §3.3, p.6 (he21 line 229, line 236, line 243); Theorems 4.1,4.2,4.4 and §4.3, p.7 (he21 line 267, line 273, line 283, line 286); Proposition 5.1, Corollaries 5.3–5.4, Theorem 5.5, Proposition 5.6 and §5.4, pp.8–12 (he21 line 307, line 333, line 352, line 369, line 376); Theorem 6.1 and §§6.1–6.5, pp.13–14 (he21 line 480, line 493, line 499, line 509, line 526, line 538) | Scope, η, dimension signs, double-flat inequalities, factorization, chain maps and final shrunken theorem. |
| he14 | §1.1, p.371 (he14 line 171); §2.1 and Theorem 2.1, p.374 (he14 line 290, line 304); §2.3 and Theorem 2.3, p.376 (he14 line 369); Theorem 4.8, pp.382–383 (he14 line 610); Theorem 6.1, pp.386–387 (he14 line 777); Theorem 7.1, p.389 (he14 line 877); Theorem 10.3, pp.395–396 (he14 line 1128); Propositions 11.6–11.7, pp.399–401 (he14 line 1244, line 1289); Theorem 12.1, p.401 (he14 line 1311) | Initial characteristic restrictions, minimal classes, degree formula, upper bound, positive basic seed. The general transfer is an extra target, not a consequence of ignoring the initial restrictions. |
| he15 | Theorem 2.23, PDF p.34 (he15 line 1373); Theorem 2.27, PDF p.37 (he15 line 1482); Theorems 2.30–2.31, PDF pp.38–39 (he15 line 1531, line 1552) | General-field numerical transfer, basic criterion with shrunkenness, upper bound/basic dimension. Primary he14/ghn15 inputs remain cited. |
| gh10 | Lemma 2.5.1 and Proposition 2.5.2, PDF pp.6–8 (gh10 line 219, line 224); Corollary 2.5.3, PDF pp.8–10 (gh10 line 300); Lemma 2.6.1, PDF p.10 (gh10 line 414) | Demazure product and the distinct ordinary/Demazure fibre factors; root-sign cancellation. |
| ghn15 | §3.3, PDF p.10 (ghn15 line 390); Theorem 3.3.1, PDF p.11 (ghn15 line 409); original Proposition 3.5.1 (ghn15 line 505) | Twisted P-alcove product, strict injectivity, all matching Levi classes; source must be read with erratum. |
| ghnerr | Propositions 0.0.1 and 0.0.2, pp.1–2 (ghnerr line 16, line 58) | Componentwise adjoint isomorphism, characteristic qualification, basic-only Levi uniqueness. |
| ghkr06 | §5.3 and equation (5.3.4), PDF pp.19–21 (ghkr06 line 835, line 910); Lemma 5.4.3, PDF pp.27–28 (ghkr06 line 1223); Proposition 5.6.1 and Theorem 5.8.1, PDF pp.29–32 (ghkr06 line 1360, line 1446) | Linearization by root-height quotients, trace/coefficient dimension route, Levi correction terms. |
| vie06 | Definition 3.1 and extended-type definitions, PDF pp.3–4 (vie06 line 106); lattice decomposition/Lemma 4.2 and Theorem 4.3, PDF pp.5–6 (vie06 line 249, line 266); Proposition 5.2 and Theorem 5.3, PDF pp.8–9 (vie06 line 382, line 431) | Nonempty normalized semi-modules, all extended charts, independent combinatorial bound/attainment. |
| ckv15 | Lemma 3.1.1, PDF pp.20–21 (ckv15 line 931) | Superbasic J_b/Z(G) anisotropy and unramified restrictions of PGL_h; positive semisimple rank retained. |
| hn14 | Proposition 2.7, Theorem 2.9 and Corollary 2.10, PDF pp.10–11 (hn14 line 398, line 434, line 470); Theorem 5.3 and Theorem 6.7, PDF pp.25–26,29 (hn14 line 1068, line 1242) | Finite-parabolic/straight reduction, Red-Min versus strong conjugacy, positive integral class polynomials and cocenter basis. |
| zhu17 | Theorem 0.5, p.410 (zhu17 line 297); Proposition 2.3, pp.431–432 (zhu17 line 1168); §3.1.1, Theorem 3.1 and §3.1.2, pp.455–457 (zhu17 line 2105, line 2137); Proposition 3.3, §3.1.3 and Lemma 3.7, pp.457–460 (zhu17 line 2191, line 2224, line 2262, line 2279); Appendix A model/dimension discussion and trace comparison (zhu17 line 2721, line 3094) | Perfect loci, exact endpoint stratification, ordered norm, dimension and trace comparison; source omissions below are not copied into the targets. |
| mv20 | Definition 3.1 and §3.1, Definitions 3.3,3.7 and Corollary 3.6, PDF pp.5–7 (mv20 line 247, line 281, line 316, line 323); Theorem 3.10, Corollary 3.12 and Definition 3.14, PDF pp.7–8 (mv20 line 358, line 378, line 404); Theorem 3.16 and Corollary 3.17, PDF pp.9–10 (mv20 line 418, line 434, line 458) | Equal-characteristic Newton geometry, generic greatest class, normalized codimension, purity/chain-length proof of cordial saturation. |
| vie14 | Proposition 5.5 and Corollary 5.6, pp.1026–1028 (vie14 line 705, line 713, line 768) | Generic class on Bruhat closure; function-field restriction and reductive integral-model setting retained. |
| ham15 | Lemma 2.4, Definitions 2.5/2.7, Lemma 2.8 and Proposition 2.9, arXiv v2 pp.4–6 (ham15 line 154, line 162, line 178, line 186, line 193); adjoint reduction after Proposition 2.10, pp.6–7 (ham15 line 246) | General-Levi dimension terms and conditional adjoint reduction; the equality locus needs the explicit definition in R05. |
| ham17 | Definition 2.1(3), arXiv v3 PDF p.4 (ham17 line 176, line 182) | Meaning of topological strong purity only. It does not itself prove equal-characteristic Iwahori-cell purity; that input comes from the mv20 proof and its declared supplier contract. |

## Not verifiable

- No Lean elaboration was run: the brief prohibits builds, and the signature inventory is empty. This review does not certify that the new signatures requested by R01 elaborate; they must be supplied and checked by the repair worker.
- The general ramified/mixed-characteristic replacement arguments in §0.5, the mixed-characteristic chart construction and the strengthened adjoint lifting of R03 are future proof obligations. The cited texts and example calculations do not certify those new proofs. Their generic moduli prerequisites were checked against GS0 and SF; unsupported nonemptiness uses are reported separately.
- The 13 declared gaps are contracts, not completed library theorems. Their scope, declared locations and controls were checked, conditional on supply; no finding is based merely on their current absence.
- The he21 extraction uses OCR, and some other PDF extractions lose overbars or inequality glyphs. Apparent glyph-only errors were not promoted to source errata. In particular, no alleged missing Bruhat-closure bar is reported solely from plain extracted text.
- No complete formal proof of the numerical dimension theorems was reconstructed. The table records boundary computations, source comparisons and dependency checks; it is not a proof of all stated generalities. No new source access was blocked, and no missing-reference request remains.

## Source issues

- **Error** in ghn15 at Proposition 2.2.1, PDF p.6 (ghn15 line 209; ghnerr line 14): the source says adjoint projection always gives a flag immersion and injective component map; it should be componentwise isomorphism under the characteristic hypothesis, with immersion requiring component injectivity; affects a stated result.
- **Error** in ghn15 at Proposition 3.5.1, PDF p.13 (ghn15 line 505; ghnerr line 56): the source says a group σ-class meets a standard Levi in at most one Levi σ-class; it should be restricted to basic group classes; affects a stated result.
- **Misprint** in he21 at §§6.2 and 6.5, pp.13–14 (he21 line 503, line 542): the source says the P-alcove conjugator is σ⁻¹(y) for w=x t^λ y; it should be x, giving x⁻¹wσ(x)=t^λσ(η_σ(w)); affects the proof.
- **Gap** in he21 at §6.3, p.14 (he21 line 518): the source says the basic seed follows from he15 Theorem 2.27; it should be justified without assuming the auxiliary a t^γ is shrunken, or that missing hypothesis proved; affects the proof.
- **Error** in he14 at Proposition 11.7, pp.400–401 (he14 line 1289): the source says one pair (J,c) works for every μ and finite twisted Coxeter element; it should be chosen after the input, since affine A₁ gives the distinct stationary minima s₁ and s₀; affects a stated result.
- **Misprint** in he14 at Proposition 11.6, p.399 (he14 line 1245): the source says supp_δ(v)=J although v is unbound; it should be supp_δ(x)=J; affects a stated result.
- **Misprint** in he14 at proof of Proposition 11.6, p.399 (he14 line 1260): the source says ordinary support of x′ equals J after proving equality of δ-supports; it should be δ-support of x′ equals J; affects the proof.
- **Misprint** in he14 at proof of Proposition 11.6, p.399 (he14 line 1263): the source says a nonidentity minimal left-parabolic representative has a left descent inside that parabolic; it should be a descent outside that parabolic; affects the proof.
- **Misprint** in he14 at proof of Proposition 11.6, p.400 (he14 line 1281): the source says the right reflection in the twisted-conjugation term is s_i; it should be s_δ(i), consistently with the preceding term; affects the proof.
- **Error** in vie06 at Definition 3.1, PDF p.3 (vie06 line 106): the source says bounded-below additive stability defines a semi-module without requiring nonemptiness; it should be a nonempty subset, excluding ∅ and its nonexistent minimum/residue basis; affects a stated result.
- **Misprint** in ham15 at proof of Proposition 2.9, arXiv v2 p.6 (ham15 line 222): the source says the Lang inverse-image correction is −〈ρ,ν−ν_dom〉; it should be +〈ρ,ν−ν_dom〉, as in Lemma 2.4 and the final fibre formula; affects the proof.
- **Misprint** in ham15 at proof of Proposition 2.9, arXiv v2 p.6 (ham15 line 233): the source says the group-locus dimension is the supremum of Levi-locus dimensions; it should be the supremum of their retraction preimage dimensions, retaining the fibre contributions; affects the proof.
- **Error** in zhu17 at Theorem 0.5 and Theorem 3.1, pp.410,456 (zhu17 line 297, line 2137): the source says the finite numerical dimension formula holds for arbitrary b and μ; it should be conditional on nonemptiness, since the mismatched G_m locus is empty while the expression is 0; affects a stated result.
- **Misprint** in zhu17 at §3.1.3, p.458 (zhu17 line 2226): the source says τ_i=σ^iτ₀ before using the forward ordered norm; it should be τ_i=σ^(−i)τ₀ for that tensor-factor identification and norm order; affects the proof.
- **Gap** in zhu17 at proof of Proposition 3.3, pp.459–460 (zhu17 line 2287): the source says the fibre estimate at λ bounds the preimage of the closed ≤λ locus directly; it should be applied on each exact endpoint stratum before taking dimensions of the union; affects the proof.
- **Misprint** in zhu17 at §3.1.2, pp.456–457 (zhu17 line 2169): the source says the cited GHKR coefficient statement is Proposition 5.4.3; it should be Lemma 5.4.3; affects nothing.
- **Misprint** in he14 at the definition preceding Theorem 10.3, p.395 (he14 line 1127): the source says η_δ(x)=δ⁻¹(y)x for a normal form of w; it should be η_δ(w)=δ⁻¹(y)x; affects a stated result.
- **Misprint** in he14 at proof of Theorem 10.3, p.395 (he14 line 1132): the source says the chosen reduced word spells δ⁻¹(y), then uses its prefixes as prefixes of y; it should be a reduced word of y, with the displayed δ⁻¹ applied in the twisted conjugations; affects the proof.
- **Misprint** in he14 at Theorem 11.4, p.398 (he14 line 1213): the source says n counts δ-orbits on affine simple reflections; it should be the finite-simple orbit count, giving n=1 rather than 2 in split A₁; affects a stated result.
- **Misprint** in he15 at proof of Theorem 2.30, PDF p.38 (he15 line 1542): the source says the η-term after the inner-twist transport is η_σH(w); it should be η_σH(wγ), as in the preceding transport identity; affects the proof.
- **Misprint** in ham15 at Theorem 1.1, arXiv v2 p.2 (ham15 line 51): the source says ρ is half the sum of all absolute roots; it should be half the sum of positive absolute roots; affects a stated result.
- **Misprint** in gh10 at Lemma 2.5.1, PDF p.6 (gh10 line 222): the source says support of a Demazure product is the plain union for arbitrary extended-affine factors; it should be stated for Coxeter factors, transporting the second support by the first length-zero factor in the extension; affects a stated result.

<!-- tauceti-roadmap-review {"agent": "codex", "head": "a96277dfe30db2f950f7adf6a6475fbb0f4eb2b9", "job": "RT-HeckeStacksAndLocalShtukasPartII~1a", "model": "gpt-6-astra", "worker": "chris-4"} -->
