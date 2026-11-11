<!-- from CBirkbeck, https://github.com/TauCetiProject/TauCetiRoadmapJobs/pull/13130#issuecomment-6783512812 -->
Review (codex) of bd15748

Verdict: needs_changes

1. **F01** (P2) Reuse the pinned block inclusion

   **Location:** README:41–43 and :475–476; Suggested.lean:184–193. The package claims ownership of “the block inclusion of braid groups” and constructs shiftHom again with BraidGroup.lift.

   **Claim:** The block inclusion on the last n strands and its generator formula are new constructions here.

   **Witness:** `TauCeti/GroupTheory/SpecificGroups/Braid/Basic.lean`:494 defines BraidGroup.natAdd; :499 proves natAdd_sigma. For m=1,n=2 both it and shiftHom send σ₀ to σ₁ in B₃.

   **Exact repair:** Cite `TauCeti.BraidGroup.natAdd` and `TauCeti.BraidGroup.natAdd_sigma` in Scope and ownership and From Tau Ceti. Keep shiftHom only as the simple all-n adapter needed by the headline signatures: the native input is B_(r+1), so the genuine addition is n=0. Say that explicitly rather than claiming the supplied positive-length construction. Replace the duplicate presentation construction with the adapter below; keep the Hurwitz equivariance and gluing results, which the native inclusion does not provide. Apply the same attribution to §2.3's shifted inclusion.

   ```lean
   def shiftHom (m : ℕ) : (n : ℕ) → BraidGroup n →* BraidGroup (m + n)
     | 0 => 1
     | n + 1 => by
         rw [Nat.add_succ]
         exact TauCeti.BraidGroup.natAdd m

   theorem shiftHom_sigma (m : ℕ) (i : Fin (n - 1)) :
       shiftHom m n (sigma i) = sigma ⟨m + i, by have := i.isLt; omega⟩ := by
     cases n with
     | zero => exact Fin.elim0 i
     | succ n => simp [shiftHom]; rfl
   ```

   **Repair test:** This replacement was elaborated in a scratch copy of the entire file, with all subsequent declarations unchanged: exit 0, exactly the two headline sorry warnings. At n=0 the map sends the sole braid to 1; at m=1,n=2 it sends σ₀ to σ₁. This distinguishes natAdd from strandIncl, which keeps index 0. The earlier review's observation about strandIncl did not account for natAdd, which is present at the actual pin.

2. **F02** (P3) The positive-move negative control computes the wrong tuple

   **Location:** README:1261–1262: “Using s_(q,i) instead of its inverse on tuples gives the conjugation g_i^((g_(i+1) ⋯ g_q)⁻¹)”.

   **Claim:** Replacing the inverse face braid by the positive braid merely reverses the conjugating suffix in the displayed deleted-entry formula.

   **Witness:** For q=1,i=0 and (g₀,g₁)=((12),(23)), σ₁ gives ((13),(12)), whereas σ₁⁻¹ gives ((23),(13)). Since (23) is involutive, reversing that suffix conjugation would leave ((23),(13)) unchanged.

   **Exact repair:** Replace this Check with those two explicit tuples, explaining that the positive move also changes which entry is retained. Keep the main row-identification statement, whose inverse braid is correct. The existing A₄ Check in §1.11 separately distinguishes the two suffix-conjugation conventions; it must not be conflated with replacing a whole braid action by its inverse.

   **Repair test:** Direct multiplication gives (12)(23)(12)=(13) and (23)(12)(23)=(13). Thus the proposed replacement obtains the unequal pairs above. The corrected inverse formula agrees with EVW16 line 1122 and with Suggested.lean:61–69.

3. **F03** (P3) Distinguish the cover from its permutation fibre

   **Location:** README:1369 and :1374: “X = Hur_n or CHur_n” followed by “H_p(B_n; k[X/G]) ≅ H_p(B_n; k[X])_G”.

   **Claim:** The second formula expresses the preceding topological quotient comparison in braid-group homology using the same X.

   **Witness:** For G=1,n=1, X=Conf₁(int D) has continuum many points and B₁=1. Then H₀(B₁;k[X])=k[X] has continuum rank, whereas H₀(X;k)=k has rank 1.

   **Exact repair:** Introduce F as the fibre of X over the chosen configuration, namely c^n or its generating subset. Write `H_p(B_n; k[F/G]) ≅ H_p(B_n; k[F])_G`, using F's Hurwitz action, and invoke §0.5 to identify these groups with the homology of the covers. Do not use the underlying set of the total space as the coefficient basis.

   **Repair test:** In the witness F is a singleton, giving rank 1 on both sides of the intended comparison. For S₃ transpositions,n=2, the corrected marked H₀ has rank 5 and its conjugation coinvariants and unmarked H₀ both have rank 2. The topological theorem itself and the actual Lean signatures already use the correct objects.

Three findings: one P2 and two P3. None of the five findings from round 2 remains open. The mathematical headlines survive the tests below. README, Suggested.lean, metadata.toml, sources.toml and design/plan.json were not changed. In this report, README and Suggested.lean refer to `packages/InverseGaloisAndArithmeticFundamentalGroupsPartII/`; library paths are relative to their respective pinned repositories.

## Previous findings, checked individually

| Previous finding | Status | Repaired passage and verification |
| --- | --- | --- |
| R01, collar retraction | Repaired | README:1023–1030 now uses “weakly contractible by Smale's disc theorem in the boundary-pointwise form” and says the collar subgroup “is not a retract”. The new named gap occurs at README:324 and in design/plan.json. The flat-twist Check at :1057–1066 gives a nonclosed subgroup, not a retraction. SMA59 line 15 and line 124 support the separately identified collar-fixing theorem. |
| R02, identity inertia | Repaired | README:249 requires “c ⊆ G ∖ {1}”; :1498–1501 handles the trivial group separately, with “Hn^c_{1,n} is empty for n ≥ 1”. The parent at its supplied head has the exact-branch restriction at `TauCetiRoadmap/InverseGaloisAndArithmeticFundamentalGroups/README.md`:5742–5754. Dimensions for G=1,n=1 are now correctly 0 for the scheme and 1 for Conf₁. |
| R03, already pinned graded algebra | Repaired | README:346–349 says “graded Tor_i^R(N, −) is CategoryTheory.Functor.leftDerived” of the pinned tensor functor. The obsolete internally-graded-modules gap is absent from both files. GradedModuleCat, its shift and projectives, and balanced tensors were reopened at the pins. The remaining gap asks for the two-variable and spectral-sequence API. |
| R04, arrangement scope and plane/disc comparison | Repaired | README:265 says “finite reduced crystallographic root pairing”; :1439–1443 applies Homeomorph.unitBall coordinatewise. The gap also says crystallographic. ReductiveGroups 11A and 11B on main have precisely that scope; the full cell-count comparison remains an explicit gap. |
| R05, Lean header | Repaired | Suggested.lean:1–2 contains `import Mathlib` and the individual braid module. No module/public header, exposed public section or set_option remains. Original-file elaboration succeeds. |

Pattern searches covered every occurrence of collar/retract/Smale, identity inertia and complex comparison, graded modules/Tor, arrangements/11A/11B, and Lean header directives. The new graded contracts and radial comparison were checked afresh. For unchanged material, the round-2 table was used only for its explicit computed instances; all 46 numbered sections and their Checks were read again, and the seeded targets were checked directly this round.

The earlier F01 ownership dispute with ArithmeticStatisticsPartVIII remains settled as not actionable within this package, as the supplied review/repair record requires. Its scope still overlaps at open pull request #1179, `TauCetiRoadmap/ArithmeticStatisticsPartVIII/README.md`:29, 845–1046; §5.19:1422 still uses its own §5.16. README:95–103 accurately records that situation. This review does not re-raise that board-level decision or claim that the overlap has disappeared.

## Verified sound

### Coverage, principles and form

Read all 46 numbered targets in six layers, all API bullets, Checks, conventions, exact supplier contracts and references. Read main's ReductiveGroups, AlgebraicTopology and GeometricTopology for shape and ownership. The package is a Part II extension of the parent; it does not claim the parent's moduli or braid-orbit construction as new theory. Its Hurwitz-action implementation is an explicit acceptance-file realization of that imported object. R01 concerns a different object already usable directly at the pin.

The mathematical organization separates component algebra, graded K-complex estimates, arc topology, the spectral sequence, stability and Betti bounds. The two independent inputs, Layers 1 and 2, meet in Layer 3; Layer 4 consumes the resulting bounds and Layer 5 uses stability to make finite-cell bounds uniform. The headings name mathematics and the text does not prescribe a source's chapter sequence. Layer 2's reference to the radial map explained in §5.1 uses the already pinned homeomorphism, not the later finite-CW theorem; its disc braid comparison is independently supplied by §IG.5.1.

Every definition/construction section has its API and at least three Checks; some theorem-only sections have fewer, which is permitted. The six layers each end in Examples and Dependencies. No computational algorithm, copied source passage, process identifier, machine path, HTML anchor, sorry'd data, set_option, admitted example or lemma declaration was found in the package. Every own backticked declaration is present, including HurwitzFibre.smul_tuple at Suggested.lean:306; the resolver's missing-name lead is a false positive. metadata.toml contains the topic, and all six cited works have their existing unique manifest keys. No source entry was added or rewritten.

### Computed adversarial table

Conventions used below: P=k[t], |t|=1; unless stated otherwise U=t, A1=1,A2=2,A0=7. A zero homology module has support −∞. Computations over P concern valid trivial-group instances; the dual-numbers quotient also comes from G=C₂,U=t² with permitted characteristic different from 2. General right/left-module arguments were checked without imposing commutativity on R.

| Statement | Instances tried | Values computed on the two sides | Result / change |
| --- | --- | --- | --- |
| 0.1 nonsplitting | G=1; C₆ involution; S₃; S₄; A₄ 3-cycle class | G=1: closure=1 and one conjugacy orbit. C₆: closure has order 2≠6. S₃ intersections have sizes 3,0,1,0 and one orbit when nonempty. In S₄, H=⟨(12),(34)⟩ has two singleton conjugacy orbits. A₄ class meets each C₃ in one element. | Generation and subgroup conditions both matter; correct. |
| 0.2 involutions | S₃,C₆,S₄ | Sylow-2 order 2 for orders 6=2·3, hence one involution class; C₆ generated subgroup order 2. S₄ has transposition and double-transposition classes, 24≠2·odd. | Correct. |
| 0.3 action and fibre | S₃ transpositions,n=0,2; all S₃ triples | Positive pair ((12),(23)) becomes ((13),(12)); both products (123). All 216 triples satisfy the braid relation. At n=2: 9 marked points, 6 generating points, braid-orbit sizes 1,1,1,3,3; conjugation-orbit sizes 3,6. At n=0 full fibre sizes 0 for S₃,1 for G=1. | Correct, no product-one restriction. |
| 0.4 block and gluing | m=1,n=2; n=0; empty prefix | Native natAdd and shiftHom send index 0→1; strandIncl sends 0→0. Empty braid maps 1→1; empty prefix sends s→s. Product of concatenation is ∂t·∂s. | R01: cite native positive-length object; tested adapter. |
| 0.5 group homology | S₃,n=2; X=B_n; G=1 | H₀ rank 5=number of braid orbits; regular coefficients give H_p=0 for p>0, as universal cover is contractible; singleton fibre gives H_p(B_n;k). | Correct. |
| 0.6 component ring | S₃ transpositions; G=1 | r_(12)r_(23) has product (123), reversed product (132), so unequal; dim R₂=5. G=1 gives R_n=k·t^n and R₀=k. | Noncommutative carrier and augmentation correct. |
| 0.7 stabilization | S₃,D=1; C₂; G=1 | S₃ sum has three terms of degree 2, not degree 6; C₂ gives t^(2D), trivial group t^D. At D=1, square contains six mixed ordered terms absent from U₂. | Sum and degree normalization correct. |
| 0.8 component stability | S₃,n=0..6; fields F₃,F₅ | Orbit counts 1,3,5,6,6,6,6. U₁ matrices n=0..4 have shapes 5×1,6×3,6×5,6×6,6×6. Ranks over F₅:1,3,5,6,6; over F₃:1,3,3,3,3. On exact C₂ image, diagonal coefficient 1; full image coefficient 3. | Field restriction has a concrete obstruction; no universal small-n isomorphism. |
| 1.1 degree/shift | 0,k,k[1],P | deg0=−∞; (k[1])₀=0,(k[1])₁=k, whereas truncated subtraction wrongly gives k at 0; degP=+∞. | Matches pinned integer shift. |
| 1.2 defects | M=P,k,0 | A(P)=0; A(k)=0, Tor₁^P(k,k)=k[1], δ(k)=1; for 0 all groups vanish. | Kernel source degree and cokernel target degree separated. |
| 1.3 change of rings | R=P,Rbar=k,M=P or k | M=P: inner higher Tor=0 and abutment k in degree0 only. M=k: Tor₀=k,Tor₁=k[1], no higher Tor. | Correct first-quadrant and low-degree segment. |
| 1.4 balanced estimate | N=k[2],M=k[3]; N=0 | N⊗_P M=k[5], so 5≤2+3=5. N=0 gives zero tensor/support −∞. Balancing identifies (na)⊗m with n⊗am, sign +1. | Correct; no flatness or commutativity required. |
| 1.5 quotient Tor | Rbar=k; Rbar=k[t]/t²,V=k | Over k, positive Tor=0. Over dual numbers, resolution differentials are t and Tor_i(k,k)=k[i], hence i≤i·degRbar+0=i. | Correct, including i=0. |
| 1.6 central torsion | M=k over P | R[U]=0; M[U]=k degree0 maps to Tor₁=k[1] by degree+1; A(M)=0≤δ+A1=2. | Correct handedness/shift. |
| 1.7 higher quotient Tor | P,U=t²,M=k | Tor₀=k,Tor₁=k[2],Tor_i=0 for i≥2; δ=2,A1=2. Bounds at i=0,1 are 0≤2 and 2≤4. P₁=P[2] makes t² degree zero. | Repaired source shift valid. |
| 1.8 Nakayama | V=Rbar,k[3]; Laurent module over P | Bounds degRbar≤0+degRbar and 3≤3+degRbar. k[t,t⁻¹]/t·k[t,t⁻¹]=0 although the module is nonzero. | Lower support needed over P; finite-degree Rbar has nilpotent positive ideal. |
| 1.9 low augmentation Tor | P with M=k or P | M=k: δ=1≤max(0,1)+4=5. M=P: δ=0≤max(0,−∞)+4=4. | Correct. |
| 1.10 general Tor | N=k[2],M=k[3] over P | Tor₁=k[6], degH₀aug(M)=3,degH₁aug(M)=4; 6≤2+4+1+4=11. Higher Tor is zero. | Correct. |
| 1.11 K differential | G=1,M=k; A₄,g=(123),h=(134) | For k, all differentials 0 and support H_q=q. For A₄, correct h⁻¹gh=(142), opposite hgh⁻¹=(243). Wrong d² terms have products (132) and (234), unequal; correct terms both gh=(234). | Correct distinguishing Check; involutions alone would not distinguish suffix inverses. |
| 1.12 right linearity | coefficient s, right multiplier a | d((g)⊗sa)=r_g(sa)=(r_gs)a; evaluated tensor sends (g)⊗(1⊗m) to (g)⊗m on both sides. | Correct; no right-linearity of S_g asserted. |
| 1.13 homotopy | q=0,s=r_h; G=1,q=0,1 | Prefix hgh⁻¹ gives r_(hgh⁻¹)r_h=r_hr_g. For P, d₁=t,d₂=0, so dS+Sd=t in both degrees. | Correct; unchanged nonabelian integral cases also have computed round-2 rows. |
| 1.14 annihilation | P,q=0,2 | H₀=k,H₂=k[2]; right multiplication by t is 0 on both, but sends chain basis 1 to nonzero t. | Correct on homology. |
| 1.15 regular support | P,q=0..5 | Supports 0,−∞,2,−∞,4,−∞; finite ones satisfy q≤2+q. | Correct, complex not bounded. |
| 1.16 universal coefficients | M=P; M=k,q=3 | M=P higher Tor=0. For k, H₃=k[3] gives 3≤1+3+4+2=10. Original source constants A1=0,A2=1 would give 3≤2, false. | Package's enlarged constants work. |
| 1.17 low comparison | P,M=k | H₀K=k=Tor₀; H₁K=k[1]=Tor₁; H₂K=k[2] versus Tor₂=0. | No higher-degree equality claimed. |
| 1.18 higher support | P,M=k,q=2,3; M=0 | 2≤1+7·2=15 and 3≤22; zero module has every K group zero. | Correct low-degree qualification. |
| 1.19 stabilization | P,M=P,b=0; M=k,b=1 | For P, t^n→t^(n+1) has matrix [1] already at n=0; stated n≥7 is sufficient. For k, at n≥8 both source/target zero. | Correct source-degree range. |
| 2.1 mapping classes and repaired Smale route | n=0,1,2; annulus; flat twist | Groups 1,1,Z; pure B₂=2Z of index2. Annulus core twist maps to nonzero component of Diff(A,∂A). Flat twist has angle e^(−j²)>0 at r=1−1/j, cutoff angle 0, while every C^m difference tends to 0. | Comparison uses π₀=π₁=0; nonclosed subgroup cannot be a retract. |
| 2.2 arcs | n=0,1; same endpoint | Vertex counts 0,1; same-endpoint pair has one endpoint rather than required two. | Correct carrier and boundary cases. |
| 2.3 cosets | n=0,1,2; n=3,q=0 | A(0)=empty; A(1)₀=point,A(1)₁=empty; A(2)₀=A(2)₁=Z; L_(3,0)=⟨σ₂⟩. | Correct truncation; native inclusion attribution is R01. |
| 2.4 faces | q=1; q=2,i=0,j=1 | Edge b has faces bσ₁,b. Face composites at q=2 are bσ₂σ₁L₀ and bσ₁σ₂σ₁L₀=bσ₂σ₁σ₂L₀=bσ₂σ₁L₀. | Braid relation and σ₂∈L₀ give equality. |
| 2.5 stabilizers | n=2,q=1; n=3,q=0 | Edge stabilizer 1; vertex stabilizer B₂=⟨σ₂⟩. Edge b joins integer vertices b+1 and b. | Matches left action/right faces. |
| 2.6 connectivity | n=0,1,2; join S⁰*S⁰ | Empty; point with conn≥−1; graph with vertices Z and edges [b,b+1], realization R with conn≥0. Join is S¹, conn=0=−1−1+2. | Correct and gap's join boundary normalization consistent. |
| 3.1 module | G=1 or S₃,n=0 | (M₀)₀=k; (M_p)₀=0 for p>0. Full S₃ module at n=0 is 0 rather than k. | Correct regular module uses all tuples. |
| 3.2 resolution | n=0,1,2 | X(0)=empty→point not equivalence; n=1 fibre point; n=2 fibre R. q≥n has zero chains. | Correct exclusions and sufficient range. |
| 3.3 rows | q=1,S₃ pair | Inverse face gives ((23);(13)), second gives ((12);(23)); positive move instead gives ((13);(12)). | Main theorem correct; R02 replaces false Check. |
| 3.4 page | G=1,n=1,p=0 | E²_(0,0)=coker(0→k)=k; H₁K(P) at internal1 is 0. Columns q≥1 vanish at n=1. | Cokernel correctly retained. |
| 3.5 edge | G=1,p=0,n=1 and n=0 | n=1: 0→0→k→k→0→0; n=0: 0→0→0→k→k→0. | Exact even outside abutment comparison range. |
| 4.1 induction | A1=1,A2=2,A0=7,P=1 | Threshold n>23; incoming j=2 bound23, competing diagonal j=1 bound16; at n=24, P=1<n−2=22. | Correct inequalities. |
| 4.2 marked headline | G=1,p=0,1; A=21,B=11 | H₀(B_n;k)=k, map [1] for n≥1. H₁(B₁)=0 versus H₁(B₂)=k shows a threshold is necessary. n>21p+11 implies n≥2+21p+7. | Nontrivial theorem, correct sufficient constants. |
| 4.3 full monodromy | S₃,H=C₂; n=0 | One of three U terms stays in H, coefficient1 rather than3. Full fibre at n=0 has size0 for S₃ and1 for G=1. | Correct filtration and common shift. |
| 4.4 quotient | S₃,n=2; C₂; G=1,n=1 | Marked H₀ rank5; conjugation coinvariants rank2=unmarked rank2. C₂ stabilizer order2. For G=1,n=1, total-space point basis has continuum rank versus fibre rank1. | Topological comparison correct; R03 corrects permutation coefficient carrier. |
| 4.4 bad-characteristic control | C₂ antipodal S²,k=F₂ | H₁(RP²;F₂) has dimension1; H₁(S²;F₂)_C₂ has dimension0. | Averaging cannot be used without invertible order. |
| 4.5 unmarked headline | C₂; S₃,n=2 | C₂ conjugation quotient is identity; S₃ orbit coinvariants give ranks5→2. In characteristic prime to card(G), averaging divides by nonzero card(G). | General-G extension valid; no centreless hypothesis needed topologically. |
| 5.1 cells and repaired transport | n=0,1,2,3; z=0,1,2 | Cell totals1,1,2,4; n=3 dimensions (1,2,1). Full S₃,n=0 has0 cells. h(z)=z/√(1+norm(z)²) sends 0,1,2 to 0,1/√2,2/√5; inverse at1/√2 is1. Radial derivative (1+r²)^(−3/2)>0. | Correct finite-cell and orientation comparison. |
| 5.1 crystallographic scope | A₂ versus I₂(5) | A₂ has three simple-subset cell degrees 0,1,2 with counts1,2,1; I₂(5) Cartan product=(3+√5)/2≈2.618, nonintegral. | Repaired supplier scope exact. |
| 5.2 Betti headline | S₃,i=0; arbitrary i and reduced m | S₃ sampled component ranks≤6. If m≤Ai+B+a, then (A+B+a+1)(i+1)−(Ai+B+a)=(B+a+1)i+A+1>0. | Uniform exponential bound follows; quantifiers independent of field,n,i. |
| 5.3 étale headline | G=1,n=0,1; S₃,q=5,n=2,ℓ=7 | Trivial scheme dimensions δ_i0δ_n0≤1. For S₃,7>max(6,5,2)=6; complex full/unmarked H₀ rank1 agrees with the compared étale dimension. F₂ versus Q on RP² gives degree-one ranks1 versus0. | Identity case repaired; coefficient-rank inequality can be strict. |

All displayed operators have genuine domains and targets, except the notation corrected in R03. The arbitrary-module bounds use the standing nonnegative internal grading. Empty full fibres are allowed and give zero homology, rather than forced base points. Finiteness of G ensures finite conjugacy classes, finite subgroup filtration and finite sums. Zero rings are outside Field; ℓ=2 or 3 is permitted only when it is prime to |G| and, for the arithmetic comparison, satisfies the larger displayed bound. No general DVR assertion is being substituted by a p-adic special case. The common block length is chosen before k,full,p,n, so no claimed uniformity is hidden in a binder.

### Seeded source verification

All 15 seeded locators were opened in the supplied legal cached texts. Page numbers below are the arXiv/manuscript pagination expressly used in the README. Source hypotheses and the steps imported from proofs were inspected, not just theorem labels.

| Target | Source text opened | Assessment |
| --- | --- | --- |
| 0.1 | EVW16 Definition 3.1, p.12, line 537 | Generation plus empty-or-one subgroup intersection; exact. |
| 0.8 | EVW16 Proposition 3.4, p.13, line 574; Lemma 3.5, pp.14–15, line 623 through line 685 | Uniform finite-set permutations and triangular coefficient card(c∩H) justify D,N independent of k. Positive multiples and simultaneous subgroup choice follow from the same finite family. |
| 1.1 | EVW16 §1.11, p.8, line 342 | Nonnegative grading and positive shift match. Package explicitly corrects the zero-module degree convention. |
| 1.4 | EVW16 Lemma 4.4, p.17, line 785 | Bounded right-module filtration and augmentation coinvariants give the stated estimate. |
| 1.5 | EVW16 Lemma 4.5, pp.17–18, line 800 through line 813 | Resolution generators have degree at most i·degRbar; tensoring with V gives the estimate. |
| 1.10 | EVW16 Proposition 4.10, p.20, line 928 through line 945 | Handedness, low augmentation Tor and slope agree; package enlarges constants safely. |
| 1.14 | EVW16 Lemma 4.11, p.21, line 953 through line 958 | Right generator multiplication null-homotopic, hence positive ideal kills homology. |
| 1.16 | EVW16 Proposition 4.13, p.21, line 979 through line 988 | Universal coefficients and diagonal estimate match with the package's necessary A1≥1. |
| 2.5 | EVW16 Proposition 5.6 and (5.6.1), pp.25–27, line 1160 through line 1251 | Transitivity, arc-fixing isotopy, tail stabilizer and face compatibility supported; relative extension is an explicit supplier contract. |
| 3.3 | EVW16 §§5.3–5.4, Lemma 5.4, pp.24–25, line 1105 through line 1134 | Inverse face braid and suffix conjugation support the theorem. R02 is an error in the roadmap's extra Check, not in this source formula. |
| 3.5 | EVW16 Theorem 6.1 proof, p.28, line 1279 through line 1306 | Edge map is coker(K₂→K₁)→K₀; its kernel and cokernel give the exact sequence for all p,n. |
| 4.2 | EVW16 Theorem 6.1, p.27, line 1256 through line 1266 | Finite nonsplitting pair, permitted field, linear source-degree range; package constants are sufficient. |
| 4.4 | EVW16 Corollary 6.2 proof, p.29, line 1347 through line 1360 | Locally constant centralizers make the Borel comparison fibre acyclic. R03 concerns notation in the additional group-homology reformulation. |
| 4.5 | EVW16 Corollary 6.2, p.29, line 1341 | Source states centreless case. Exact coinvariants and finite centralizers prove the package's explicitly identified general-G extension. |
| 5.1 | EVW16 Proposition 2.5, p.11, line 501; CD95 Theorem 1.4.1, p.5, line 181; Corollary 2.2.3, p.9, line 334 | Homotopy comparison, one cell per finite-type subset and covering sheet factor support the four variants. |

Also reopened HW10 Lemma 7.1 and Proposition 7.2, pp.34–35, line 1631 through line 1667; SMA59 Theorem B and Theorem 4, printed pp.621,624, line 15 and line 124; EVW16 Proposition 7.8, pp.34–35, line 1578 through line 1608, and the error passages listed below. PAL60 and ALEX23 remain settled uncertified; neither was requested again. No additional cited work was missing from the manifest.

### Pinned library and ownership audit

Pins read from lake-manifest.json: Mathlib `1b1ccf4b088b32fa3f23f2de1127433254a81e1e`, Tau Ceti `2fd255d997f47c0b5d834ee416c7015d55444ce5`. Object searches covered nonsplitting classes, tuple braid actions, block inclusions, graded modules/tensors, K-complexes, arc complexes, Hurwitz homology and Betti bounds. The supplied near-match leads were assessed by their objects. Function.Fiber.mk is a fibre-partition map, not UnmarkedFibre.mk; Hurwitz zeta functions and braid Markov operations are not Hurwitz-cover stability.

Native declarations opened, with relevant actual contracts:

- `Mathlib/Algebra/Group/Conj.lean`:32 IsConj, :133 ConjClasses, :151 mk_eq_mk_iff_isConj, :278 carrier, :286 mem_carrier_iff_mk_eq; `Algebra/Group/Subgroup/Lattice.lean`:329 closure and `Map.lean`:262 map_top_of_surjective, :582 MonoidHom.map_closure. These carry actual conjugacy/closure, not the nonsplitting predicate.
- `Mathlib/GroupTheory/Sylow.lean`:200 IsPGroup.exists_le_sylow, :347 Sylow.isPretransitive_of_finite, :842 card_eq_multiplicity. The applications supply primality and finite G.
- `Mathlib/Algebra/MonoidAlgebra/Defs.lean`:222 single; `Module.lean`:78 mapDomainLinearMap, :250 lhom_ext'; `Basic.lean`:737 toAdditiveAlgEquiv; `Grading.lean`:49 gradeBy. Permutation coefficients are finitely supported functions on a type; a monoid on the fibre is not silently required.
- `Mathlib/RepresentationTheory/Rep/Basic.lean`:92 ofHom and :333 ofMulAction; `Rep/Res.lean`:43 res; `RepresentationTheory/Homological/GroupHomology/Basic.lean`:222–227 groupHomology, and `Functoriality.lean`:154–159 map. The restriction direction is A→Res(f)B; all three carriers of groupHomology share the universe. That restriction is stated in the package.
- `Mathlib/CategoryTheory/GradedObject.lean`:43 is a family; `Algebra/Homology/SpectralSequence/Basic.lean`:36 gives pages and next-page isomorphisms, without convergence; `CategoryTheory/Abelian/LeftDerived.lean`:106 defines leftDerived and :110 computes it with a projective resolution. They do not by themselves discharge the two spectral-sequence contracts.
- `Mathlib/Topology/Covering/Basic.lean`:287 IsCoveringMap does not require nonempty fibres or surjectivity. `LinearAlgebra/Dimension/Basic.lean`:68 Module.rank is cardinal dimension, avoiding the infinite-dimensional finrank=0 pitfall. `AlgebraicGeometry/Sites/ElladicCohomology.lean`:76 uses the pro-étale integral sheaf, and provides no Hurwitz moduli construction.
- `Mathlib/Analysis/Normed/Module/Ball/Homeomorph.lean`:46 and :98 give the actual radial formula and inverse used in the repaired plane/disc comparison; positivity of 1+norm² and of 1−norm² on the target justify both square-root inverses.
- `TauCeti/GroupTheory/SpecificGroups/Braid/Basic.lean`:99 BraidGroup, :106 sigma, :120 commutation, :125 braid relation, :168 sigma_induction_on, :181 lift, :206 lift_sigma, :217 eq_one_of_le_one, :222 strand, :225 strandSucc, :358 permHom, :380 strandIncl, :494 natAdd, :499 natAdd_sigma, :504 pureSubgroup. R01 is the missed native object. `Topology/Homotopy/SerreFibration/Basic.lean`:107 supplies the disk-lifting predicate, not a separate homotopy exact sequence.
- `TauCeti/Geometry/Diffeomorphism/Disc.lean`:63 DiscDiff fixes the boundary pointwise. `FixingSubgroup/Basic.lean`:149 RelativeDiff and `FixingSubgroup/Topology.lean`:41 isClosed_fixingSubgroup use the actual fixing subgroup and weak Whitney topology. No pinned weak contractibility of DiscDiff 2 was found.
- `TauCeti/Algebra/Category/GradedModuleCat/Basic.lean`:63 gives graded A-modules with scalar compatibility, :292 shiftFunctor; `Abelian.lean`:290 is its Abelian instance; `Free.lean`:225 gives enough projectives, with the max-universe condition satisfied by the small carriers here. `Algebra/Module/GradedModule/Internal.lean`:118 ofDecomposition, `Opposite.lean`:65 opposite, and `Trivial.lean`:45 trivialGrading provide the grading inputs.
- `TauCeti/LinearAlgebra/TensorProduct/Balanced/Basic.lean`:43 relations, :55 BalancedTensorProduct, :134 balance, :184 liftEquiv; `Grading/Basic.lean`:100 grading; `Unit.lean`:48 lid,:122 rid; `Finsupp.lean`:69 finsuppScalarRight; `Algebra/Category/GradedModuleCat/BimoduleTensor/Basic.lean`:382 bimoduleModuleTensor. Its source is the graded enveloping algebra A⊗Bᵐᵒᵖ, target graded A-modules; the specialized k,R case agrees with §1.1. The relation is unsigned and neither R nor the right/left actions are replaced by a commutative tensor product.

No pinned theorem found proves either admitted headline. The supporting proved Lean declarations are used to construct the actual fibre actions and stabilization morphisms; neither admitted theorem is an API lemma, boundary example or definition restatement.

### Suppliers, gaps and open heads

Every supplier citation and Needs line was resolved against main or the permitted new-roadmap head. The board-package index was read first. Required roadmaps grep/show searches were run, including the objects above, and the supplied overlap report was read. There is no reported conflicting head for this package, dropped cited id or dependency on numbering defined only by an open revision.

| Supplier | Resolved file and locations |
| --- | --- |
| Parent, open #850 | `TauCetiRoadmap/InverseGaloisAndArithmeticFundamentalGroups/README.md`:2753 action,2783 orbit monoid,2874 extraction,5426 configurations,5462 asphericity,5532 marked covers,5568 marking quotient,5656 schemes,5741 complex comparison,6020 fixed-n comparison,6065 coefficient towers. These headings and their actual hypotheses were read at the head. |
| ReductiveGroups, main | `TauCetiRoadmap/ReductiveGroups/README.md`:4396–4482 Layer11A,4484–4521 Layer11B. Positive half twist at t=1/2 is (1/2−i/2,1/2+i/2). Full Salvetti/cell-count data is the named gap, not silently imported from an open revision. |
| ClassifyingSpaces, main | `TauCetiRoadmap/ClassifyingSpaces/README.md`:224–245, Stage4 items16–17, gives the lifted free resolution and local-coefficient group homology comparison, with deck/opposite convention retained. |
| AlgebraicTopology, main | `TauCetiRoadmap/AlgebraicTopology/README.md`:850–884 explicitly maps Stage/item numbering to Layer/section numbering; :1743 realization, :1888 Künneth, :1945 covers and transfer, :2027 Serre applications, :3219 relative homotopy. The former simplicialRealizationCW name maps to §4.7 at :4645. No citation drift. |
| GeometricTopology, main | `TauCetiRoadmap/GeometricTopology/README.md`:788 collars,984 tubes,1439 topological Diff,1504 restriction/isotopy extension,1551–1578 Smale. Boundary-relative marked-arc and pointwise-disc refinements are declared gaps, not purported native consequences of collars. |
| DGAInfinity, main | `TauCetiRoadmap/DGAInfinity/README.md`:431–460 Layer5, derived modules/tensor and semi-free resolutions. Internal unsigned grading is supplied by Tau Ceti; the homological-algebra refinement is separately contracted. |

All eight gap slugs match between README and design/plan.json: reductive-salvetti-homotopy-type; algtop-semisimplicial-realization; algtop-borel-construction; algtop-join-connectivity; geomtop-arc-isotopy-extension; geomtop-marked-disc-diffeomorphisms; geomtop-boundary-pointwise-disc-smale; dga-graded-tor-spectral-sequences. All have named earlier suppliers. The related clauses specify APIs of the requested constructions, with grading/convergence and boundary conventions; none is unowned. The graded-module gap removed by the repair remains absent. The Borel induced-space comparison is read with Y a Γ-space and its restricted Λ-action, as in its actual use with c^n.

Open-scope comparisons: #1179 ArithmeticStatisticsPartVIII retains the settled overlap described above. #850 is the imported foundation. #1169 TeichmullerGeometry, `TauCetiRoadmap/TeichmullerGeometry/README.md`:8–17, owns surface-category and closed-surface Teichmüller extensions, not the Hurwitz K-complex/stability package. #1694 AlgebraicTopologyPartII, `TauCetiRoadmap/AlgebraicTopologyPartII/README.md`:6–33, owns configuration cohomology and real-locus refinements and imports the generic topology; it does not take ownership of these Hurwitz stability results. #1797 GeometricTopology preserves §3.4 and the smooth supplier direction; the supplier used here remains main. The main generic owners are cited rather than replaced by these open revisions. No same fully qualified headline declaration was found elsewhere in the supplied search universe.

The mechanical dependency check was run with the required name, content checkout, order file and movable option:

```text
depcheck: 236 roadmaps, 2135 edges, 0 problem(s)
```

No UPWARD, CYCLE or moved line. This is a direction check, not a resolution of the settled ArithmeticStatisticsPartVIII ownership decision.

### Lean, signatures, headlines and padding

The original-file `lake env lean` run from the content checkout returned exit 0 with exactly two warnings: declaration uses sorry at Suggested.lean:503 and :520. The imported braid object file was present, so no module build was needed. No job remains running.

A scratch copy appended `#check @name` for all **40 actual declarations** and elaborated with exit 0 and the same two warnings. The supplied automated list's 41st entry is a parser artefact from “class c” in a docstring, not a declaration; its reported line-547 error is not an error in Suggested.lean. Comparison of all elaborated types with the README found no lost binder. In particular Field k and Fintype G are retained by the stabilizers; the nonsplitting assumption occurs in both theorem signatures, and m,A,B,C precede the universal coefficient-field and degree quantifiers. The module contains no free Prop field standing in for missing geometry.

| Headline | Acceptance coverage |
| --- | --- |
| Marked stability, full-monodromy stability and general-G unmarked stability (§§4.2–4.5) | hurwitz_homological_stability at :503 states all four variants on actual braid groups and permutation fibres. |
| Uniform field Betti bound (§5.2) | uniform_betti_bound at :520 uses Module.rank and covers both full flags and both marking choices. |
| Uniform étale bound (§5.3) | Named in the module docstring; Hurwitz moduli schemes are absent at the pins. No stand-in is used. |
| Stabilization from low K-homology (§1.19) | Named in the module docstring; component algebra with its grading and K differential are missing constructions. |
| Arc connectivity (§2.6) | Named in the module docstring; isotopy classes of marked-disc arcs are missing. |

The one-tactic probe was run on **both** admitted theorems in a scratch copy, trying simp, rfl and infer_instance; neither closes. Candidate library homology-invariance lemmas require a supplied homotopy equivalence and do not construct U or bound the ranks, so they do not close either theorem by one exact application. No admitted padding was found. The native adapter test for R01 passed the entire file without adding any admitted declaration. The two trivial rfl computation lemmas on fibre actions are used by the data constructions; they are not admitted stand-ins for the headlines.

## Not verifiable

- PAL60, Theorem A and §3, printed pp.305–312: manifest status uncertified, no readable text supplied. The local-cross-section argument was checked mathematically; the exact source wording/locator was not certified. No new request.
- ALEX23, printed pp.406–407: settled uncertified. The radial coning calculation is valid, but the source text itself was not available. No new request.
- EVW16 published-version agreement: checked the cached arXiv v4, not the published PDF. All sampled locators are valid in the explicitly cited version; the manifest's broader assertion that numbering agrees everywhere was not independently verified.
- No board decision resolving the older ArithmeticStatisticsPartVIII ownership dispute is present in the supplied records. Its settled status is respected; it is not inferred resolved from depcheck.

## Source issues

- **Misprint** in EVW16 at §1.11, printed p.8: the source says absence of a largest nonzero degree gives infinite degree; it should be −∞ for zero and +∞ for unbounded support; affects a stated result.
- **Misprint** in EVW16 at Definition 2.2, printed p.9: the source says the generating fibres in reversed class order and puts unrestricted surjections inside the class locus; it should pair each fibre with its matching class condition; affects nothing.
- **Misprint** in EVW16 at proof of Lemma 4.6, printed p.18: the source says the left module precedes right central torsion in the balanced tensor; it should put R[U] first as in (4.6.3); affects nothing.
- **Gap** in EVW16 at proof of Lemma 4.6, printed p.19: the source says torsion degree is bounded solely by δ plus regular torsion degree; it should retain max(δ−degU,δ+degR[U]) before enlarging constants; affects the proof.
- **Gap** in EVW16 at proof of Lemma 4.7, printed p.19: the source says the spliced complex has two unshifted regular terms; it should use P₁=R[degU], shift subsequent terms, and allow slope at least degU; affects the proof.
- **Error** in EVW16 at Proposition 4.13, printed p.21: the source says the bound permits slope A1=0; it should require A1≥1, since R=k[t],U=t,M=k gives support H₃=3 above its claimed bound 2; affects a stated result.
- **Misprint** in EVW16 at §5.2, printed p.23: the source says the coset formula applies in every simplicial degree; it should set degrees q≥n empty and use the formula for q<n; affects nothing.
- **Error** in EVW16 at (6.1.6), printed p.29: the source says the exact-image diagonal contains an extra class-size ratio; it should be U_Q with each surviving summand once; affects nothing.
- **Misprint** in EVW16 at (7.8.3), printed p.35: the source says stabilization changes n by D; it should change n by Dd=degU and require the comparison prime above the enlarged endpoint; affects nothing.

<!-- tauceti-roadmap-review {"agent": "codex", "head": "bd1574832b62759b2c38d6df185532679aedcfc9", "job": "REV-PKG-InverseGaloisAndArithmeticFundamentalGroupsPartII~3", "model": "gpt-6-astra", "worker": "chris-6"} -->
