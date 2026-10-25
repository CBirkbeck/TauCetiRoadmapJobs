# Repair findings and validation

The two reviews reuse F01–F08. Each entry below identifies its review; all seventeen findings have separate verdicts. Shared mathematical repairs are described once and cross-referenced explicitly. Only the permitted package files and this report were edited. No commit or network write was made.

## F01 (P2) — applied

Review a. Missing Pham acceptance theorem → `phamStrongRetraction`, with native fibre, skeleton and continuous inclusion, a retraction identity, and a homotopy relative to the included skeleton. PHAM line 207 supplies the geometric retraction; Mathlib `Topology/Homotopy/Basic.lean:541` supplies the relative-homotopy carrier. The join identification remains separately unstatable. Review a F02 determines the theorem's generality.

## F02 (P2) — applied

Review a. Common exponent k≥2 → independently indexed k_i≥1 in §5.3, its acceptance theorem, coordinate symmetries, scaling, bouquet count and §5.4 connectivity. PHAM line 124 and PHAM line 219 support this generality. Checks now include K₂,₃, a singleton root factor and unequal scaling. Coordinate permutations preserve a fixed family only when they preserve its exponents.

## F03 (P1) — applied

Review a. Unsupported coefficient-colimit attribution → SchemeAndStackFoundations §2.5, `cohomology_filtered_colimits`, with an owned finite-cover specialization in §11.1. Its finite covers, intersections, cofinality and terminal object are explicit; the C₂ resolution gives the equivariant version and extension by zero gives the pair version. Updated §11.5, both Needs lists, Layer 11 dependencies and supplier contract. See BW line 981.

## F04 (P3) — applied

Review a. Lower support bound → upper bound a>2m in §3.5, with m=0 handled separately. At (n,m,j)=(4,2,0), a=6>4 excludes the contribution; at (4,1,1), a=2 retains it. Section 2.1 already states both bounds and the degree-zero exception. Neither its statement nor the product formula changes.

## F05 (P2) — applied

Review a. Quotient agreement in §3.1 → integral construction only there; numerator divisibility and identification with `eulerExponent` belong to §3.2. Removed the forward proof dependency. Section 3.3 and Layer 3 dependencies now require §3.2 before products use the quotient. BS line 2211 gives the factorization; BS line 2242 gives its subsequent Möbius identification.

## F06 (P3) — applied

Review a. Mapping-space citation in §5.4 → PHAM line 207, §§5.2–5.3 and native homotopy-loop shifts. BS line 2174 concerns the constrained mapping space and supplies no connectivity bound. Added S⁴ and singleton-factor positive tests alongside the S³ counterexample; connectivity uses the indexed exponents from review a F02.

## F07 (P2) — applied

Review a. Even n → positive even n in §15.5 and the Layer 15 example; §15.6 now says positive in its opening too. Added n=0: H¹(C₂,ℤ(1))=ℤ/2 but H²=0, so no degree-two 𝔽₂ identification exists. The existing periodic resolution in §7.3 gives these values directly.

## F08 (P3) — applied differently

Review a. Nonmathematical Check → fixed-sheet obstruction (1,1), exchanged-sheet lift, and n=1 zero-coefficient model in §15.3. The statement and proof remain unchanged (B19 line 1422). These are README Checks only; no boundary-case Lean declarations were added. The fixed-sheet example excludes the false unconditional lifting assertion, while the exchanged-sheet example demonstrates a nonzero lift.

## F01 (P2) — not actionable in this package: supplier must expose Proposition 1.22

Review b. Owned §12.2 extension → consumed statement and matching gap:steenrod-conjugated-real-pushforward in README and plan. BW line 1127 makes Theorem 1.21 depend on Proposition 1.22; MotivesAndAlgebraicCycles §7.6b owns that theorem. Updated ownership, §12.3 and Layer 12 dependencies and Lean docstring. Completing the supplier's statement requires its author; this package cannot certify it.

## F02 (P3) — applied differently

Review b. SchemeAndStackFoundations gap now uses ringed spaces; a matching new MotivesAndAlgebraicCycles gap supplies the semialgebraic-site extension consumed in §14.4. The proposed ordinary site-to-space transport is unavailable over arbitrary real closed fields: §7.6a provides that comparison only over ℝ. The finite-group bar resolution has finite rank degreewise; periodicity is asserted only for C₂. Updated both gaps and consumer dependencies.

## F03 (P3) — applied

Review b. Supplier-attributed action law → explicit local convention in Layer 1 and `configurationPermutation`; the configuration-carrier-generality gap now requests exposure of that convention. Removed the action-law bullet from the consumed API. InverseGaloisAndArithmeticFundamentalGroups §IG.5.1 states the quotient but no coordinate formula. The σ=(123), τ=(12) computation remains consistent in Conventions and §2.4.

## F04 (P3) — applied

Review b. Uncited SULLIVAN entry → deleted from `sources.toml`. Section 4.6 continues to consume the rational H-space/Hopf contract, without acquiring a minimal-model target or another proof route. No Sullivan name or citation existed in README or Lean. A consumer requiring Sullivan minimal models cannot cite this package as their supplier.

## F05 (P3) — applied

Review b. StableHomotopyKTheory §4.6 attributed a double-loop application → its actual homotopy-associative/commutative H-space predicates, with the double-loop instance owned here. Added §4.6 to the supplier contract, §4.6 Needs and Layer 4 dependencies. The supplier's §4.6 is group completion, while its §3.37 and the existing Hopf gap supply the rational theorem.

## F06 (P3) — applied differently

Review b. Deleted both occurrences of d≥2 in §13.2, retaining it in §13.1. Added ℙ¹ and d=0 checks; BW line 1838 and BW line 1874 support the ordinary-cohomology hypothesis and proof without that lower bound. The boundary tests stay in README. No Lean stand-in was added for unavailable semialgebraic equivariant carriers.

## F07 (P3) — applied

Review b. Added SERRE line 2623–2700 and SERRE line 2852 to §4.4's existing printed locators. Read Proposition 3 and Corollary 2 at those cache lines: odd spheres have only their fundamental rational rank, and even spheres have the additional degree 2s−1 rank. Neither the theorem nor its acceptance consumers change.

## F08 (P3) — applied

Review b. Colloquial transfer step → quantified uniform affine-family triviality target in §11.1: bounded ambient dimension, number and degrees of equations, finite A-definable partition, fibre-preserving trivializations, dimension refinement, A-valued anchors and extension to every real closed R/A. Added interface laws, discriminating Checks and Needs. BCR Theorem 9.3.2 is recorded as uncertified; supplied field-extension invariance completes the cohomological transfer route.

## F09 (P3) — applied differently

Review b. Imperative supplier paragraphs → indicative descriptions explicitly attributed to MotivesAndAlgebraicCycles §§7.6a–7.6b. This covers loci, equivariant sections, pair cohomology, twists, orientations, exceptional image, duality and Steenrod operations. Retained interface-law lists and convention Checks because they specify what consumers need; none is a locally owned construction. Additional asks remain in named supplier gaps.

## Checks and elaborated signatures

The prescribed `lake env lean` elaboration of `packages/AlgebraicTopologyPartII/Suggested.lean`, run from the content checkout, exited 0. Its complete diagnostic outcome was five expected “declaration uses `sorry`” warnings, for `configurationTraceFormula`, `tameFibreBouquet`, `rationalBouquetRanks`, `doubleLoopBetti` and `phamStrongRetraction`, and no errors. All imported object files were present; no targeted module build was needed. One initial invocation from the board checkout exited 1 because that checkout has no default toolchain; it was immediately rerun from the prescribed content checkout, without modifying toolchains or configuration.

A scratch copy containing `#check @name` for every declaration elaborated with exit 0. All 19 elaborated types were compared with their README statements: no lost section binders and no binder repair needed. In particular `phamStrongRetraction` retains both n≥2 and ∀i,1≤k_i; `doubleLoopFactor` retains n≥4 and r>0; both bouquet numerical theorems retain actual homotopy equivalences and finite-dimensionality conclusions. The new fibre, skeleton and inclusion intentionally have total definitions for arbitrary natural exponents; their theorem has the positivity hypotheses. The scratch ledger contains all types, including the typed relative homotopy. There are five admitted headline theorems and fourteen supporting definitions/abbreviations, with no admitted data, padding examples or options.

The prescribed dependency check exited 0 with exactly:

```text
depcheck: 53 roadmaps, 595 edges, 0 problem(s)
```

There was no UPWARD, CYCLE or moved line. The supplied gate failure tex=11 was repaired by replacing all eleven TeX-style exponent/subscript groups in README §§5.3–5.4 with Unicode indices and parenthesized exponents. The five affected lines state the fibre/skeleton, root action, scaling, proof lift and connectivity input; their mathematics and Checks are unchanged. The notation count is now tex=0. Citation resolution reports no cross-roadmap citation or Lean name found nowhere. Its warning that it did not check external pinned Lean names was handled by reading the pinned files and by Lean elaboration, rather than treating resolution as that verification.

After the notation repair, the prescribed Lean elaboration again exited 0 with the same five expected `sorry` warnings, and the prescribed dependency check again exited 0 with the exact output above. `Suggested.lean` was unchanged, so the nineteen-signature comparison remains applicable. An auxiliary full gate on a package-layout scratch view reported every content count as 0, including tex, latex and depcheck; it exited 1 solely for git=1 because that scratch view is not a Git repository. A direct auxiliary invocation on the board layout reported missing-files=2 because it expects the content repository layout. Neither auxiliary invocation changed package files.

A JSON comparison against HEAD confirms that only the top-level `gaps` value changed in `design/plan.json`. All fourteen gap sentences match the corresponding README contracts exactly. Every one of the nineteen Lean names appears in README. `metadata.toml` is unchanged. `git diff --check` passes.

## Ownership and sources

Read AlgebraicTopology and RealAlgebraicGeometry on main for shape. Re-resolved the README's suppliers using `roadmaps show` and `roadmaps resolve`; SchemeAndStackFoundations §2.5 and §2.23, MotivesAndAlgebraicCycles §§7.6a–7.6b, StableHomotopyKTheory §§3.37 and 4.6, and InverseGaloisAndArithmeticFundamentalGroups §IG.5.1 were opened at the relevant main/head copies. The generic filtered-colimit theorem is in the former's §2.5, not in MotivesAndAlgebraicCycles. The ringed-space equivariant carrier is in §2.23, not a generic semialgebraic site.

Ownership searches used `roadmaps grep` across main and indexed open heads, together with board/package and pinned-library searches by object. No other owner of the indexed Pham retraction or this universal affine-family specialization was found. The latter specializes semialgebraic triviality precisely to discharge §11.1's existing arbitrary-real-closed affine target; it does not claim the generic triangulation, cohomology or rational H-space foundations. Generic internal Ext remains with SchemeAndStackFoundations and its semialgebraic extension with MotivesAndAlgebraicCycles. No new Lean declaration uses a supplier's namespace. The brief's listed open sibling heads were included in these object searches; revisions of existing roadmaps were read as main dependencies rather than treated as new suppliers.

New mathematical source: BCR, *Real Algebraic Geometry* (1998), Theorem 9.3.2, fetched through the sources service and settled there as an uncertified publisher locator; no inaccessible text was read or quoted. No missing-source request is pending. Existing uncertified and waived works retain their settled status. PHAM line 118–125 and PHAM line 204–221 were read for indexed exponents and the retraction; SERRE line 2700 and SERRE line 2852 for sphere ranks; BW line 1127–1148 and BW line 1838–1886 for the two disputed interfaces; B19 line 1376–1440 for lifting. The table below records mathematical instance calculations, not a claim that elaboration proves admitted theorems.

## Adversarial mathematics pass

Each row identifies a statement or a coherent target/API block. Values are computed in the stated models; negative tests retain their failed hypothesis. “Retained” means these instances agree, not that a finite test proves the theorem. The declaration rows also check the actual acceptance definitions, including their total-function boundary values.

| Statement | Instances tried and values on each side | Result and change |
|---|---|---|
| Configuration action convention | σ=(123), τ=(12): inverse-coordinate action gives (c,b,a)=(στ)·(a,b,c); direct-coordinate action gives (a,c,b) | Retained left action; ownership corrected |
| Euler parity convention | n=0,1,2: s_n=−1,+1,−1 and ε_n=1,0,1; n+2 repeats both | No truncated n−1 |
| Frobenius convention | 𝔾_m: compact trace q−1; q=2 gives 1 point, q=3 gives 2; arithmetic eigenvalue q⁻¹ would fail | Retained geometric convention |
| Pair versus support convention | Fixed point: pair=0; supported untwisted H⁰=ℤ, H²=ℤ/2 | Distinction retained |
| Orientation/shift convention | Conjugation on ℂ has determinant −1, on ℂ² +1; pt→ℙ¹ shifts real degree 1 and complex degree 2 | Twists and shifts agree |
| Cyclic comparison convention | u₀,u₁,u₂,u₃=1,−1,−1,1; u₁(σ−1)=1−σ and u₂(1+σ)=−(1+σ)=(1+σ)u₁ | Both differential types agree |
| Configuration carriers and embedding API | Empty index gives one tuple even for X=∅; singleton X,m=2 gives 0 tuples; (0,2)∈ℤ² has difference nonunit 2; zero-ring coefficient presentation has 1 point | Supplied generality gap retained, action exposed |
| Configuration torsor | m=0,1: group order 1; T²+T over 𝔽₂ has roots 0,1 and 2 ordered sheets although 2!=0 | No prime exclusion |
| Plane/disc comparison | z=1 maps to 1/2 and back to 1; z=0 maps to 0; boundary ‖w‖=1 has inverse denominator 0 | Open disc retained |
| Semialgebraic locus/gluing API | A¹(C)=R², fixed locus y=0; x²+1 has 2 complex and 0 real points; ε²=0 has ε=0 on field-valued points | No ordinary non-Archimedean comparison introduced |
| Equivariant sections API | Fixed point sign H¹=𝔽₂; free orbit H⁰=ℤ, H¹=H²=0; empty support all 0 | Derived invariants retained |
| Real-pair API | Spec R has pair 0; Spec C/R has empty fixed locus and pair H⁰=ℤ, positive groups 0 | Localization distinction retained |
| Free descent and dimension | Free two-point orbit descends to point: H⁰=ℤ,Hⁱ=0 for i>0; fixed point instead has H²=𝔽₂ | Freeness essential |
| Ordinary comparison over ℝ | Point ranks (1,0); circle (1,1); open interval (1,0) in degrees 0,1 in both theories | Noncompact test retained |
| Twists and regular coefficients | σ on ℤ(1),ℤ(2) is −1,+1; on 𝔽₂ both +1; H²(C₂,ℤ[G])=0 versus H²(C₂,ℤ²_triv)=𝔽₂² | Diagonal regular action retained |
| Fixed mod-two coordinates | Point: dimension 1 in each nonnegative degree; S¹: 1 at degree 0 and 2 thereafter; empty space: 0 | Finite coordinate windows agree |
| Orientation-sheaf API | RP² transition sign −1 reduces to +1 mod 2; Hom(or,or) is trivial; complex determinants −1,+1 match ℤ(1),ℤ(2) | Indicative supplier wording only |
| Exceptional inverse image API | id: F↦F, counit id; open inclusion: restriction; closed pt→ℝ: ℤ[−1] versus ordinary pullback ℤ | Shift excludes wrong pullback |
| Orientation formula and perfect duality | ℝ→pt gives ℤ[1] and H_c¹=ℤ; pt, A=ℤ/4: (1,1)↦1/4, both kernels 0; infinite ⊕𝔽₂ dual is ∏𝔽₂, not a finite bidual | Finite stalk hypothesis retained |
| Real Gysin API | pt→S¹ sends 1 to top generator; S¹→pt sends oriented H¹ generator to 1; identity sends x to x | Opposite shifts tested |
| Complex equivariant Gysin | pt→ℙ¹: source twist −1, shift 2; real shift 1 | Supplier orientation convention agrees |
| Steenrod API | On RP²: Sq⁰a=a, Sq¹a=a², Sq²a=0; on S¹: Sq¹a=a²=0; Sq⁰1=1 and positive squares of 1 vanish | Indicative supplier wording only |
| Finite-group Ext supplier gaps | Γ=1 gives Ext stalks M,0,0; C₂ trivial ℤ gives ℤ,0,𝔽₂; regular ℤ[C₂] gives ℤ,0,0 | Ringed-space/site gap separated; no periodic claim for arbitrary finite Γ |
| §2.1 arrangement purity | Empty arrangement in A²: ordinary H⁰ rank 1, compact H⁴ rank 1; PConf₂: ordinary ranks 1,1 at 0,1, compact ranks 1,1 at 4,3 | Both support bounds agree |
| §2.3 tensor character | N=2,m=2: id trace 4, swap 2s_n; m=3: 3-cycle trace 2, identity 8; m=N=0: 0⁰=1 | Finite tensor basis gives same values |
| §2.4 configuration trace | χ=1: m=0,1,2 at q=2 give counts 1,2,2 and cohomology sums 1,2,4−2; at q=3 give 1,3,9−3=6 | Ordinary/compact reindexing agrees |
| §3.1 integral recursion | Even n,N=2: first factor (1−T)²=1−2T+T²; e₂=−1 adds (1−T²), cancelling T²; N=0 all coefficients 0 | Recursion produces −2,−1 before division |
| §3.2 Möbius identity | N=2: even numerators −2,−2,−6 divide by 1,2,3 to −2,−1,−2; odd numerators 2,−6,6 give 2,−3,2 | Agreement now proved in this section |
| §3.3 weighted Euler product | c=1: (1−qU²)/(1−qU)=1+qU+(q²−q)U²+…; c=−1:1−qU; c=0:1 | Products now depend on §3.2 |
| §3.4 multiplicities | m=1 compact H² rank N: sign s_n times coefficient s_nN gives N; m=0,i=0 gives 1 and i≠0 gives 0; m=2,N=1,even n: anti-invariants 0 | Signs and empty index agree |
| §3.5 stable diagonal | (4,2,0): a=6>4 so 0; (4,1,1),N=1:a=2 gives 1; j=d=0 gives 1=[t⁰]product | Repaired upper-bound argument |
| §4.1 tameness | f=z₁: gradient norm 1; constants in n≥2: critical locus ℂⁿ cannot lie in compact interior; x²y−x at (t,1/(2t)): gradient (0,t²)→0 while point escapes | Negative models excluded |
| §4.2 Jacobian and total μ | x³+y³−1: basis 1,x,y,xy, μ=4; z₁: ideal contains 1, quotient=0, μ=0; x³−3x+y²: quotient ℂ[x]/(x²−1), μ=2 | Nilpotents and zero algebra retained |
| §4.2 fibre μ | First polynomial: f acts by −1, μ⁻¹=4,μ⁰=0; second cubic: eigenvalues ±2 each multiplicity 1; on ℂ[t]/t³, t² has generalized zero space 3 versus kernel and quotient 2 | Generalized eigenspace is essential |
| §4.2 fibre bouquet | x³−3x+y²: regular fibre has 2−0=2 circles, critical fibres 2−1=1; z₁ gives 0 spheres and contractible ℂⁿ⁻¹ | Natural subtraction nonnegative |
| §4.3 Hilton/basic words | N=0 gives point, N=1 only weight 1; N=2 counts 2,1,2 at weights 1,2,3; for S² weight 2 sphere dimension 3 versus smash dimension 4 | Wedge and smash distinguished |
| §4.4 rational spheres | S² ranks 1 at 2,3 and 0 at 4; S³ rank 1 at 3 and 0 at 2,4,5 | Corrected source locator |
| §4.5 rational bouquet ranks | Two S²: ranks 2,3,2 at 2,3,4 equal signed exponents 2,−(−3),2; one S³ rank 1 only at 3; N=0 gives 0 | General based carrier retained |
| §4.6 double-loop algebra | X=pt:ℚ in degree 0; S³:Λ(x₁), series 1+t; S⁴:ℚ[y₂]⊗Λ(z₅), series (1+t⁵)/(1−t²); S² has π₀Ω²=ℤ | Connected hypothesis excludes last model |
| §5.1 Betti product | n=4,N=1:1+t; n=5,N=1: coefficients through degree 6 are 1,0,1,0,1,1,1; later factor r>j starts at ≥2j+1>j | Finite truncation exact |
| §5.2 joins | K₂,₂:4−4+1=1 circle; K₂,₃:6−5+1=2 circles; singleton factor: product count 0, contractible; three two-point sets give S² | Positive cardinalities essential |
| §5.3 indexed fibre/skeleton | (1,0),k=(2,2):sum=1 and both weights nonnegative; (√2,i):sum=2−1=1 but second weight −1; (0,0):sum=0 | Three distinct membership outcomes |
| §5.3 strong retraction | For skeleton z=(1,0), H(t,z)=z at every t and rι(z)=z; identity on X cannot have endpoint in S at (√2,i); root action −1 sends fixed (1,0) to fixed (−1,0) | Added actual relative homotopy and equivariance |
| §5.3 scaling | k=(2,3),t=8: (0,2)↦(0,1), cube 8·8⁻¹=1; common square-root scaling gives cube 1/(2√2)≠1 | Correct indexed powers |
| §5.3 count and boundaries | k=(2,3):N=2; k=(1,3):N=0 and X≅ℂ; common k=3,n=2:N=4; n=0 sum=0; k=(0,0),n=2 sum=2 | Positivity excludes junk exponent cases |
| §5.4 connectivity | All k_i=2: n=5 gives S⁴ with π₂=π₃=0; n=4 gives S³ with π₃=ℤ; a k_i=1 gives contractible X | Corrected source and generalized family |
| §7.2 sign class | Fixed point: H¹(ℤ(1))=𝔽₂,2ω=0; untwisted H¹=0; free orbit:ω=0; mod-two fixed-point powers each nonzero | No universal nonvanishing asserted |
| §7.3 periodic cochains | Trivial ℤ differentials 0,2,0,2 give H¹=0,H²=𝔽₂; sign gives −2,0,−2,0 and H¹=𝔽₂,H²=0 | Native signs retained |
| §7.5 twisted integral coordinates | Point,i=j=0:H⁰=ℤ, not 𝔽₂; odd j gives H¹=𝔽₂,H²=0; sign monodromy L on S¹ has ordinary H⁰=0,H¹=𝔽₂ | Integral degree-zero term retained |
| §7.6 Bockstein | Point: reduced integral β(ω)=ω²; k=0 gives β(1)=0; S¹ trivial L gives β_L1=0, sign L gives nonzero generator | Component coefficient k−i agrees |
| §8.5 Borel approximation | pt,s=1:RP¹=S¹ has H¹=ℤ while H¹(C₂,ℤ)=0; degree 0 both ℤ | Strict i<s essential |
| §9.1 real coordinate maps | Fixed point: forget H⁰=id, norm=2=0 mod 2, cup sends 1↦ω; pt→RP¹ sends p=0 coordinate 1 to p=1 generator | Real dimension shift retained |
| §9.2 γ and inverse | Point:1·1=1; RP²:(1+a+a²)(1+a)=1 mod a³; empty locus:unique class 0=1 in zero ring | Inverse total degree convention consistent |
| §9.3 mod-two splitting | X=Spec R: support→ambient is id, complement 0; X=Spec C/R:support 0, ambient→complement id; empty X all 0 | Both extreme splittings agree |
| §9.4 integral parity splitting | X=A¹,i=j=1: support ℤ→ambient 𝔽₂ cannot inject; j=0 allowed parity d−1=0 gives support odd twist detected by reduction | Wrong parity excluded |
| §9.5 low-coordinate surjectivity | i≤d:empty window=0; d=2,i=4,j=1:only p=1 survives; p=2 has wrong parity and is endpoint | Strict cutoff retained |
| §10.1 finite duality | X=Spec C/R,d=0:quotient pt and pairing ℤ/4×ℤ/4→ℚ/ℤ,(1,1)↦1/4; X=Spec R:both relative/complement groups 0 | Contragradient and empty complement consistent |
| §10.2 profinite duality | Same free point with M=ℤ:completion Ẑ, torsion dual system ℚ/ℤ, Hom_cont(Ẑ,ℚ/ℤ)=ℚ/ℤ | Completion not ℤ or algebraic bidual |
| §10.3 localization windows | d=1:left H^(i−1),right H^i; d=2,i=2:left H⁰⊕H¹,right H¹⊕H²; empty real locus:both 0, v=id | Different windows retained |
| §10.4 boundary trace | RP¹:γ=1, degree-one a gives trace 1,unit gives 0; RP²:z=a gives degree(a(1+a))=1 versus degree(a)=0 | γ⁻¹ is necessary |
| §10.5 self-duality pairing | RP²,d=i=2:x=1,y=a gives deg(xyγ)=1,uncorrected deg(xy)=0; γγ⁻¹=1 | Corrected adjoint convention retained |
| §11.1 ordinary affine bound | ℂ*:H¹=ℤ at d=1; xy=0 contracts,H⁰=M,H¹=H²=0; square-zero thickening has same locus as A¹ | Strict cutoff and singular generality retained |
| §11.1 real restriction | Spec C/R,d=0:degree 0 is ℤ→0,positive groups 0→0; A¹ equivariantly contracts to a real point, restriction is id in all degrees | Boundary degree excluded |
| §11.1 uniform affine-family target | z²=t:complex fibre cardinalities 2,1,2 at anchors −1,0,1, hence H⁰ ranks 2,1,2; xy=0 constant family:dimension 1,H¹=0; empty fibres:all groups 0 | Partition cannot cross changing type; non-Archimedean formula extension allowed |
| §11.1 finite-cover colimits | C₂ trivial M=ℚ₂/ℤ₂:odd positive M[2]=𝔽₂,even M/2M=0; finite two-point sections M² commute with colimit; infinite-discrete sequence (e_j) has unbounded coordinate index and is absent from colim_r(ℤ^r)^ℕ | Local specialization added with finite covers |
| §11.2 real-empty Lefschetz | Real-empty conic quotient RP²:groups above 2 are 0; a conjugate point-pair divisor has equivariant H⁰=ℤ mapping onto top orientation group ℤ | Isomorphism range strict above boundary |
| §11.3 image criterion | pt→RP¹:mod-two Gysin 1↦a is onto; empty real divisor:0→𝔽₂ not onto; fixed-point test detects remaining degree-zero coordinate | Hypothesis distinguishes image obstruction |
| §11.4 injectivity criterion | With all positive real groups zero, both parity maps 0→0 are injective/onto; for X=ℙ¹,Y=real point,i=3,j=0 the complex source H¹_G(pt,ℤ(−1))=𝔽₂ and target H³_G(ℙ¹(C),ℤ)=𝔽₂ are identified by Gysin | No extension to surjectivity boundary |
| §11.5 relative torsion | A¹ pair equivariantly contracts,all groups 0; 𝔾_m,𝔽₂:degree-one restriction matrix [[1,0],[1,1]],det=1,cokernel=0,relative H²=0 | Pair-colimit input explicit |
| §12.2 consumed Wu pushforward | Identity:Sq id Sq⁻¹=id; pt→ℙ¹:real generator a satisfies Sq(a)=a+a²=a since a²=0,complex target degree 2 retains ordinary coordinate degree 1 | Ownership moved to supplier gap |
| §12.3 γ and surface parity | RP²:matrix(1),w₁²=1=χ mod2; torus:alternating matrix,w₁=0,χ=0; Klein bottle:diag(1,1),w₁=(1,1),square 0=χ mod2; disk has w₁=0 but χ=1 | Closed-surface hypothesis necessary |
| §12.4 embedded representatives | Zero class:empty union; two components each with a nonzero H₁ class require at least two circles; a perturbed torus meridian meets longitude once | No single-circle claim |
| §13.1 admissibility | d=2:low odd set empty,support H_G⁰(sign orientation)=0; d=3:low even set {0},so α₀=0 | Source condition agrees with parity window |
| §13.2 near-top ω | d=0:0→0→0→0; ℙ¹:first map ℤ→𝔽₂ has kernel 2ℤ,next maps 𝔽₂→𝔽₂ are id; ℙ²:H³ ordinary=0,degree-one fixed coordinate retained | Removed d≥2 only here |
| §13.3 quartic rank | Even traces 1−1+1−1=0; primitive b₃=(3⁵−3)/4=60; a+b=60,a−b=0 give a=b=30 | No torsion conclusion |
| §14.1 double-cover local system | Split ordinary cover:monodromy +1; connected circle cover:−1; [(0,1)]=−[(1,0)]; exchanged fixed-point sheets give sign stabilizer | Ordinary monodromy and stabilizer separated |
| §14.2 extension/Bockstein | Split circle:e=0,β_L1=0; connected circle:e=generator,β_L1=e; sign fixed-point extension has order 2 | Formula β_L=β+e cup agrees |
| §14.3 ramified triangle | z↦z² at branch:Tr=2,cone has ℤ/2 in expected shifted degree; punctured disc sign H⁰=0,H¹=ℤ/2; no branch:Tr(a,b)=a+b | Chosen κ retained, not canonicalized |
| §14.4 circle Ext stalks | Trivial ℤ:H¹=0,H²=𝔽₂; sign ℤ:H¹=𝔽₂,H²=0; ℤ[C₂]^k:positive cohomology 0 | Site extension explicitly gapped |
| §15.1 quotient and mixed sequence | n=1:Q=0; n=2:Q=ℤ,swap=−1; a→a+b·diag changes sum by nb so φ unchanged; (1,−φ)(Tr a,πa)=0 | Exact-sequence sign retained |
| §15.2 ψ | n=2,3,4 on first basis vector gives (−1,1),(−2,1,1),(−3,1,1,1); traces 0; reductions all diagonal 1; adding b·diag changes ψ by nb−nb=0 | Opposite sign fails mod 3 |
| §15.3 lifting | Fixed sheets:n=2,H²(ℤ(1)⊕Q(1))=0,nonzero a has β upstairs(1,1); exchanged sheets:Q(1)=ℤ,H²=𝔽₂→a=1,upstairs H³=0; n=1:a=η=ζ=0 | Three new discriminating Checks |
| §15.4 integral lift | n=4,η=0,ζ=[e₁]:a=3; −ψζ=(3,−1,−1,−1) reduces to diag3; +ψζ reduces to diag1; both trace 0 | Minus sign retained |
| §15.5 adjacent reductions | n=2,4,6:H¹ maps 1,1,1; H² maps 1,0,1; n=0:H¹=𝔽₂,H²=0 | Positivity added throughout pattern |
| §15.6 circle extension | n=2:(𝔽₂⊕ℤ)/⟨(1,2)⟩=ℤ/4; n=4 stalk=𝔽₂²; constant ℤ/4 quotient unit lifts to 1 so δ=0,though no group-homomorphic section | Section lift distinguished from splitting |
| §16.1 equivariant transport | Product action(b,z)↦(−b,τz):product transport preserves z and commutes with action; fixed b=0:τ retained | No automatic divisor transport |
| §16.2 stratified pair | xy=t singular-point stratum maps to t=0 with derivative 0≠rank1; constant stratified pair has identity transport | Submersivity excludes changing crossing |
| §16.3 lattice image | pt:target0,index1; trivial S²,j=0:imageℤ,index1; 2ℤ⊂ℤ:tensorℚ is iso but index2 | No integral-surjectivity claim |
| §16.4 chase | ℤ[G]⊗ℤ[G] diagonal:4 basis pairs in2 free orbits,H²=0; trivial rank4:H²=𝔽₂⁴; zero γ,δ,ζ permits η₀=0,both sides0; degrees2+1+1=4 | Regular action and common-lift degrees agree |
| `orderedConfiguration` | m=0:one empty injection;m=1:ℂ;m=2:(0,1) in,(0,0) out | Definition retained |
| `configurationPermutation` | σ=(123),τ=(12):both composites(c,b,a);m=0:identity;swap²=id | Definition retained |
| `configurationTraceFormula` | q=2,m=0,1,2:1,2,2 on both sides;q=3,m=3:27−9=18 squarefree cubics and trace sum18 | Field and finiteness binders retained |
| `eulerExponent` | r=0:empty numerator and integer0/0 yield0;N=0:0;N=2,even n:r=1,2,3→−2,−1,−2 | Total definition retained; agreement moved |
| `unitSphere` | s=0:{−1,1};s=1:(1,0) norm1 in,0 norm0 out | Native ambient dimension s+1 |
| `sphereBouquet` | N=0:singleton;N=1:Sˢ;N=2,s=2:H² rank2 versus smash S⁴ rank0 | Native wedge, not smash |
| `IsTame` | z₁:ε=1,K=∅;constant,n≥2:no compact critical neighborhood;n=0:singleton ambient permits compact K | Headline explicitly excludes n<2 |
| `jacobianAlgebra` | x³+y³−1:ℂ[x,y]/(x²,y²),dimension4;z₁:zero quotient | Native ideal quotient retains nilpotents |
| `milnorNumber` | Same cases4,0;x³−3x+y²:2;constant positive-dimensional f:infinite algebra but finrank0 | Headline finite-dimensionality excludes false use of finrank |
| `fiberMilnorNumber` | Fermat f acts by−1:μ⁻¹=μ,μ⁰=0;t² onℂ[t]/t³:generalized space3 | Full generalized eigenspace retained |
| `polynomialFiber` | z₁ at a:ℂⁿ⁻¹;constant c at a=c:whole ambient,at a≠c:empty | Evaluation equation exact |
| `tameFibreBouquet` | x³−3x+y²:a=0→2 circles,a=±2→1;linear z₁→0 spheres | n≥2,tameness,all fibres and finite dimension retained |
| `rationalBouquetRanks` | s=0,N=2,k=0,1,2:ranks2,3,2;s=1,N=1:rank1 at k=1,0 at k=0;N=0:0 | Actual homotopy-equivalence input retained |
| `doubleLoopFactor` | n=4,N=1:r=1→1+t,r>1→1;n=5:r=1→(1−t²)⁻¹,r=2→1+t⁵ | Explicit positivity binders retained |
| `doubleLoopBetti` | N=0:coefficients1,0,0;S³:1,1,0;S⁴:1,0,1,0,1,1,1 | j=0 empty product gives1 |
| `fermatFiber` | k=(2,2):(1,0) in,(0,0) out;n=0:sum0,empty | New native subtype |
| `phamSkeleton` | (1,0) powers1,0 gives member;(√2,i) powers2,−1 gives nonmember;k=(1,3):graph skeleton is cone on3 vertices | New real-body subtype |
| `phamInclusion` | Included(1,0) has same coordinates;zero coordinate stays0;(√2,i) is outside its source | Continuous subtype map, no invented topology |
| `phamStrongRetraction` | k=(2,2):H(t,(±1,0))=(±1,0),rι=id;k=(2,3):K₂,₃ rank2;k=(1,3):contractible;for root u and fibre z,∑(u_i z_i)^k_i=∑z_i^k_i=1 gives an actual w in the quantified equivariance test | Nonvacuous equivariant strong retraction on indexed positive family |

## Maintainer consequences

All existing acceptance names remain unchanged. New names are `fermatFiber`, `phamSkeleton`, `phamInclusion` and `phamStrongRetraction`, in `TauCetiRoadmap.AlgebraicTopologyPartII`. The finite-join homeomorphism still needs its missing carrier. No numerical corollary replaces the strong retraction.

The all-degree Wu pushforward is now explicitly a MotivesAndAlgebraicCycles §7.6b supplier obligation, avoiding a reverse proof dependency. The semialgebraic Ext specialization also requires that supplier's §7.6a extension; the ordinary comparison over ℝ cannot discharge it over every real closed field. Both are recorded supplier gaps, not claims that another roadmap has already implemented them. The supplier authors must settle those contracts. Section 11.1 now visibly owns the transfer specialization and the finite-cover application of the earlier generic colimit theorem. There is no change to the merge-order file, other roadmaps, tooling, or plan nodes outside `gaps`.
