# Review of InverseGaloisAndArithmeticFundamentalGroupsPartII (package, round 2)

**Verdict:** needs changes

Five new findings: two P1, two P2, one P3. The package files were not changed. The previously reported ownership decision is recorded below, not re-raised. Here “README” and “Suggested.lean” mean the files in `packages/InverseGaloisAndArithmeticFundamentalGroupsPartII/`. Library paths are relative to the indicated pinned library repository; roadmap paths are relative to the content repository.

## Previous findings, checked individually

- **F01 — partly repaired; board-level ownership portion remains settled as not actionable in this package.** README:91–99 now says “ArithmeticStatisticsPartVIII §5.16 states, for its own §5.19” the listed results and “imports nothing from this roadmap”. README:1470–1475 correctly says §5.19 uses §5.16's bound. README:304–306 identifies the common graded Tor request. These repair the inaccurate consumer description. Every MordellLawrenceVenkatesh citation has been removed; §2.1 now constructs the marked-disc comparison, and §2.5 uses the declared arc-isotopy contract. However, the sentence “The two statements have a single owner in the build order” does not identify that owner. At open pull request **#1179**, `TauCetiRoadmap/ArithmeticStatisticsPartVIII/README.md`:21, 29 and §5.16:845–1046 still own the component ring, K-complex bound, arc spectral sequence, stability and Betti bounds; §5.19:1422 uses its own bound. Thus the factual overlap remains. The repair report expressly leaves this scope/merge-order decision to the board; that reason is valid for the package's permitted edit boundary, and this review does not turn it into another repair-round finding. This is not an assertion that the two packages have resolved ownership.
- **F02 — repaired.** README:193 says “§IG.3.2, *The Hurwitz braid action*”; README:196 says “§IG.3.2, *The braid-orbit monoid*”. The nonexistent parenthesized declaration names are gone. Both titles exist at parent pull request **#850**, `TauCetiRoadmap/InverseGaloisAndArithmeticFundamentalGroups/README.md`:2753 and 2783. A whole-package pattern search found neither old identifier. The resolver's remaining `HurwitzFibre.smul_tuple` lead is false: the declaration exists at Suggested.lean:302 and its fully qualified type elaborates.

The repaired topology, new source entries, altered supplier descriptions and changed Lean header were reviewed afresh. Untouched material was not accepted from earlier prose summaries: the earlier computed rows were inspected, and all 46 numbered sections were read, with additional computations for the previously uncomputed algebraic and topological targets.

## R01 (P1) — The claimed collar retraction cannot exist

**Location:** `packages/InverseGaloisAndArithmeticFundamentalGroupsPartII/README.md`:958–959: “retracts `Diff(D, ∂D)` onto the subgroup of diffeomorphisms that are the identity near `∂D`”.

**Claim:** The boundary-pointwise diffeomorphism group continuously retracts onto the subgroup fixing some boundary neighbourhood, in the specified C∞ topology.

**Witness:** That subgroup is not closed: flat boundary twists admit C∞ approximations supported away from the boundary. A retract of a Hausdorff space is closed. The explicit sequence is computed in the table below.

**Exact repair:** Delete the retraction assertion. State and prove the needed parametric collar-straightening comparison, allowing the homotopies to move members of the collar-fixing subgroup; a homotopy equivalence is sufficient and does not imply a retraction. For the bundle argument it suffices to obtain π₀ Diff(D,∂D)=1 and π₁ Diff(D,∂D)=0. Import Smale's contraction by name from **GeometricTopology §3.4**, `TauCetiRoadmap/GeometricTopology/README.md`:1569–1578, and state the remaining boundary-pointwise/collar-fixed comparison as an explicit target or precise supplier gap. A collar alone supplies no retraction theorem. Add the nonclosed-subgroup example as a negative-control Check.

**Repair test:** For the flat twist f and its compactly supported approximants f_j below, a continuous retraction would force f to belong to the subgroup. A homotopy equivalence imposes no such equality; f is joined to the identity by scaling its twist angle. Smale's Theorem B and Theorem 4, SMA59 line 15 and line 124, concern the neighbourhood-fixed group and do not assert the false retraction.

## R02 (P1) — The arithmetic/topological identification fails for identity inertia

**Location:** `packages/InverseGaloisAndArithmeticFundamentalGroupsPartII/README.md`:212 and 1403: “for centreless `G` the complex points of `Hn^c_{G,n}` are `CHur^c_{G,n}/G`”.

**Claim:** The exact-branch arithmetic scheme agrees with the topological cover, without excluding the identity conjugacy class.

**Witness:** G=1, c={1}, n=1 satisfies the standing hypotheses. The exact-branch scheme is empty, but CHur₁/G=Conf₁≃point. Their H⁰ dimensions are 0 and 1. Parent #850, README:5741–5754, explicitly excludes identity inertia.

**Exact repair:** State the imported analytic comparison with `c ⊆ G ∖ {1}`, as the parent does. Keep §5.3's general theorem: handle G=1 separately, with a point at n=0 and an empty scheme at n>0, then apply the comparison for nontrivial G. A generating conjugacy class of a nontrivial group cannot contain 1. Add this identity-inertia case to the supplier contract/§5.3 Checks. Do not narrow the topological stability theorem or replace the parent's exact-branch scheme by a different moduli problem.

**Repair test:** The exceptional arithmetic Betti dimensions are 1 only for (i,n)=(0,0), and 0 otherwise; C=1 works. For G=S₃ and c its transpositions, 1∉c and the existing comparison and bound apply unchanged. The cited file is `TauCetiRoadmap/InverseGaloisAndArithmeticFundamentalGroups/README.md` at **#850**; its *Marked moduli with arbitrary monodromy*, lines 5700–5715, explicitly distinguishes inactive punctures from exact branch points.

## R03 (P2) — The internally graded module gap requests existing pinned objects

**Location:** `packages/InverseGaloisAndArithmeticFundamentalGroupsPartII/README.md`:292–296 and the matching `dga-internally-graded-modules` entry in `design/plan.json`: “the abelian categories of graded left and right `R`-modules … the balanced tensor product … and the internal shift”.

**Claim:** These generic constructions are missing and must be supplied by DGAInfinity.

**Witness:** Pinned Tau Ceti already defines `GradedModuleCat` (Basic:62), its abelian instance (Abelian:290), shift (Basic:292), `BalancedTensorProduct` (Balanced/Basic:55), and its grading (Balanced/Grading/Basic:100), for noncommutative algebras without Koszul signs.

**Exact repair:** Replace the already supplied parts of the gap by exact Tau Ceti contracts. The full paths are `TauCeti/Algebra/Category/GradedModuleCat/Basic.lean`, `TauCeti/Algebra/Category/GradedModuleCat/Abelian.lean`, and `TauCeti/LinearAlgebra/TensorProduct/Balanced/Basic.lean`, `Grading/Basic.lean`, `Unit.lean`, `Finsupp.lean`. In the last directory, `BalancedTensorProduct.liftEquiv` (Basic:184) is the universal property, `balance` (Basic:134) is the unsigned balancing law, `lid` (Unit:48) and `finsuppScalarRight` (Finsupp:69) supply evaluation. Right modules use the opposite algebra. Restrict the ℤ-grading to the nonnegative-support subcategory. Retain in the same slug only a precisely identified adapter not already supplied, if one is needed, and synchronize README and plan gaps. The separate graded Tor spectral-sequence gap is not discharged by these declarations. Adjust the module-docstring explanation to distinguish the missing component algebra/K-complex from the available generic graded-module category.

**Repair test:** For R=k⟨x,y⟩ with length grading, the pinned category requires `[Ring R]`, not `[CommRing R]`. Its shift obeys `(M[1])₀=M₋₁=0` on nonnegative support and `(k[1])₁=k`. Its balancing relation is `(n·x)⊗m=n⊗(x·m)`, coefficient +1 even when both degrees are odd. These are precisely the requested conventions. The category imposes no finite-dimensionality hypothesis. Thus the generic construction cannot remain a missing-supplier request.

## R04 (P2) — The ReductiveGroups contract overstates its current scope and API

**Location:** `packages/InverseGaloisAndArithmeticFundamentalGroupsPartII/README.md`:223–225: “of a finite real reflection arrangement, its good open-star cover with contractible intersections”.

**Claim:** ReductiveGroups Layer 11B supplies that good cover for arbitrary finite real reflection arrangements.

**Witness:** `TauCetiRoadmap/ReductiveGroups/README.md`:4487–4497 restricts to finite reduced crystallographic root pairings; lines 4503–4510 use an explicit Salvetti comparison instead of a good-cover lemma. The claimed good-cover target is absent.

**Exact repair:** Describe the imported model as the finite crystallographic Weyl-arrangement model, delete the unconsumed good-open-star-cover promise, and retain the declared gap for the full equivariant homotopy equivalence and all-dimensional cell count. §5.1 uses type A only, so neither a general good-cover theorem nor a noncrystallographic supplier is needed. Keep the roadmap's general finite-G Hurwitz statements unchanged. Also correct line 221: Layer 11A explicitly supplies plane configurations, not the asserted plane/disc comparison. Obtain that elementary transport by applying the pinned `Homeomorph.unitBall` coordinatewise (`Mathlib/Analysis/Normed/Module/Ball/Homeomorph.lean`:98), descend through the permutation quotient, and transport the basepoint; retain 11A for the plane braid identification.

**Repair test:** For W=S₃ (type A₂), the supplier applies and the quotient has cell counts (1,2,1), as required by §5.1. I₂(5) is a finite real reflection group but is not crystallographic: its Cartan-product value is 4cos²(π/5)=(3+√5)/2, rather than 0,1,2,3. The narrowed supplier description accepts the needed type-A case without falsely claiming I₂(5). For the additional transport, h(z)=z/√(1+|z|²) sends 0 to 0 and 1 to 1/√2; its inverse sends 1/√2 to 1. It preserves distinct coordinates and commutes with permutations, including the empty tuple. This concerns the supplier on main, not a dependency on its open revision.

## R05 (P3) — The repaired import header violates the specified acceptance-test form

**Location:** `packages/InverseGaloisAndArithmeticFundamentalGroupsPartII/Suggested.lean`:1–4 and 39: `module`, `public import Mathlib`, `public import TauCeti.GroupTheory.SpecificGroups.Braid.Basic`, and `@[expose] public section`.

**Claim:** The repair adopted a different module/export header to address an earlier build warning.

**Witness:** This job requires the literal `import Mathlib` form. A scratch copy removing `module` and `@[expose] public section`, and changing both `public import` lines to `import`, elaborated successfully with only the two sorry warnings.

**Exact repair:** Apply exactly those header-only deletions/replacements. Keep the namespace and all mathematical declarations. Do not merely delete `public` from the imports while retaining the exposed public section: that variant fails because its dependencies are privately imported.

**Repair test:** The complete header-only repair passed `lake env lean`, with warnings only at the two headline theorems (scratch-copy lines 502 and 519). No imported Tau Ceti object needed building; its object file was present. The package itself was left unchanged.

## Verified sound

### Extent, principles, shape and headline coverage

Read all four package files, the previous review and repair, the board-package index, overlaps, citation leads, signature leads, library near-match leads, and all 46 numbered mathematical subsections. The six layers each have Examples and Dependencies; all Needs lines were inspected. Definition blocks have API bullets and at least three Checks: §0.1 (5), §0.3 (5), §0.4 (3), §0.6 (5), §0.7 (5), §1.1 (4), §1.2 (4), §1.11 (5), §1.13 (4), §2.1 (3 definition Checks plus 4 comparison Checks), §2.2 (5), §2.3 (4), §3.1 (4), §3.2 (3), §3.4 (4), §5.1 (4). Some Checks are only bookkeeping, but every definition block also has discriminating cases. No absent own Lean identifier was found: all 40 explicit declarations occur in the README; structure fields are generated by the declared structure. The resolver's one missing-name lead was independently discharged by #check.

No computational algorithm, route-specific restriction on finite groups, good-prime shortcut, copied source passage, sorried data, `set_option`, `lemma` declaration, admitted example, placeholder proposition, machine path, process note or pull-request number was found in the package's mathematical files. The conventions distinguish internal from homological grading, do not use natural subtraction below a shift, and retain non-generating tuples and all boundary products. The field restriction is the source's actual invertibility hypothesis. A zero ring is excluded by `[Field k]`; n=0, empty full fibres, characteristic 2 and characteristic 3 were treated where permitted. Source topology and universe restrictions are explicit. Mathematical layer names express the required objects; algebra and arcs feed the spectral sequence, then stability feeds the Betti bound. No claim that the roadmap follows a source was found. Main ClassifyingSpaces, GeometricTopology and AlgebraicTopology were read as house-style comparators.

The README summary names three end theorems:

| Headline | Acceptance-test disposition |
| --- | --- |
| Marked, full-monodromy and unmarked homological stability | `hurwitz_homological_stability`, Suggested.lean:505; actual braid-group homology and actual gluing sums, not an arbitrary map |
| Uniform field Betti bound | `uniform_betti_bound`, Suggested.lean:522; both fibre variants, both marked/unmarked, all i,n, uniform in the field |
| Uniform étale Betti bound | Explicitly not statable in module docstring: no Hurwitz scheme at the pins. R02 repairs the prose comparison, not a missing Lean headline |

The module docstring additionally names the low-K-homology stability theorem and arc connectivity as not statable. The K-complex/component algebra and marked-disc isotopy-class construction are not few simple native definitions. The existence of generic graded modules (R03) does not itself supply the K-complex. No forced stand-in or other statable missing headline was found.

### Elaboration, binder audit and all-theorem padding probe

Pinned commits read from `lake-manifest.json`: Mathlib `1b1ccf4b088b32fa3f23f2de1127433254a81e1e`; Tau Ceti `2fd255d997f47c0b5d834ee416c7015d55444ce5`.

The required `lake env lean` invocation on the actual package, from the content checkout, exited 0. Its only diagnostics were `declaration uses sorry` at Suggested.lean:505 and :522. A scratch copy appending `#check @` for **all 40 explicit declarations** also exited 0 with those two warnings. The supplied 41-entry signature lead accidentally counted a namespace fragment and included a scratch-only parsing error; the independent 40-declaration run had no such error.

The checked stability type retains `[Group G]`, `[Fintype G]`, the actual `IsNonsplitting c` hypothesis, positive m, `g^m=1`, and `∃ m, ∃ A B, ∀ k, ∀ full p n`. The Betti type retains `∃ C, ∀ k, ∀ full i n`. Thus the constants cannot depend on the coefficient field. `markedStabilizer`, `unmarkedGlueSum` and `unmarkedStabilizer` retain finiteness; the quotient, gluing and actions retain their group/class data. No section binder was lost; no type changed.

Every sorried theorem (2 of 2) was tried in separate copies with `simp`, `rfl`, `infer_instance` and `exact trivial` (8 attempts). All failed at the headline goals: unsolved existential stability/Betti goals, non-reflexive targets, non-typeclass goals or a type mismatch. The near-match searches give no single pinned lemma proving either headline. The remaining proved support declarations construct the actual actions and representation morphisms; their elementary proofs are used by those constructions. No padding finding is warranted. R05's repair was separately elaborated; no Lean processes were left running.

### Computed adversarial table

The following rows include every seeded target, every headline and every mathematical target touched by a finding, plus the earlier uncomputed targets. Calculations use right-to-left permutation composition. The finite enumeration and the 507 integral chain-homotopy identities were run independently in scratch; they are review witnesses, not proposed roadmap algorithms. The complete numbered-section ledger is retained in the review scratch directory.

| Statement | Instances tried | Computed values on the two sides | Result / change |
| --- | --- | --- | --- |
| §0.1–0.2 nonsplitting and involutions | 1, S₃, S₄, C₆, A₄ | S₃ intersections are c, ∅, {t}, ∅; S₄ abelian ⟨(12),(34)⟩ has two distinct singleton classes; C₆ involution generates order 2≠6; A₄ 3-cycle class meets each C₃ in one element | Correct discrimination |
| §0.3 action and fibres | S₃ transpositions, n=2; n=0 | ((12),(23)) maps to ((13),(12)); both original and moved products=(123), swap product=(132). Nine tuples give orbit sizes 1,1,1,3,3; six generate; conjugation gives two fibre classes. Empty tuple generates 1 | Correct |
| §0.4 block inclusion | m=0; m=1,n=2 | Native generator index 0+i=i; 1+0=1, i.e. classical σ₂. Empty prefix is unchanged | Correct |
| **§0.5** homology identification | S₃,n=2; trivial G,n=2; X=B₂ regular | Marked H₀ rank=5=number of braid orbits; trivial fibre gives H₀=H₁=k on both circle/ℤ sides; regular coefficients give H₀=k,Hₚ=0 for p>0 | Correct |
| **§0.6** component ring | trivial G; S₃, n=0..5 | R=k[t] in the first case. S₃ ranks=1,3,5,6,6,6. Products r₍₁₂₎r₍₂₃₎ and reversed have (123)≠(132) | Correct; no commutative substitution |
| §0.7–0.8 central sum | C₂; S₃ with H=⟨(12)⟩; S₄ | C₂ U=t², degree 2. S₃ U has three degree-2 summands, diagonal coefficient on H=1. S₄ ranks for n=0..5 are 1,6,17,30,38,42; commuting pairs yield ≥3(n−1) for n≥2 | Correct; nonsplitting essential |
| §1.1 shifts | M=k, shift1, n=0,1; zero module | Pieces 0,k versus wrong ℕ-subtraction k,k. deg0=−∞; shifted zero remains zero | Correct |
| **§1.2** defects | R=k[t],U=t,M=k and R | For k: ker=k, quotient=k, A=0, Tor₀=k,Tor₁=k[1], δ=1. For R: kernel0, quotient k, A=δ=0 | Correct |
| §1.3 change of rings | R=k[t],R̄=k,M=k | E²₀,₀=k, E²₀,₁=k[1], all other entries0; abutment Tor₀=k,Tor₁=k[1],Tor≥₂=0 | Correct |
| §1.4 balanced bound | N=k[2],M=k[3] | Tensor=k[5], so deg=5=2+3; N=0 gives tensor0 and support−∞ | Correct without flatness |
| §1.5 quotient Tor | R=k[t],U=t²,R̄=k[t]/t²,V=k | Minimal differentials are t; tensor k makes them 0. Torᵢ=k[i], deg=i=i·degR̄+degk | Correct |
| **§1.6** central torsion | R=k[t],U=t,M=k | 0→k→k[1], second arrow has internal degree1 and is an isomorphism onto Tor₁. A=0≤δ+A1=2 | Correct; handedness/shift preserved |
| §1.7 higher quotient Tor | C₂,U=t²,M=k | Tor supports 0,2,−∞,…; δ=2,A1=2 gives bounds 2,4,6,…; P₁=R[2] makes multiplication degree0, P₁=R would give degree2 | Correct |
| §1.8 Nakayama | V=k[3] over k[t]/t²; k[t,t⁻¹] over k[t] | 3≤3+1=4; in the negative control coinvariants0 but module≠0, with support unbounded below | Correct distinction |
| **§1.9** low Tor bound | trivial G,M=k; C₂,U=t²,M=k | δ=1≤max(0,1)+4=5; respectively δ=2≤1+8=9 | Correct |
| **§1.10** general Tor bound | R=k[t],N=k[2],M=k[3],i=0,1,2 | Tor supports 5,6,−∞; max low augmentation degrees=4. RHS=2+4+i+4=10,11,12 | Correct |
| **§1.11** differential | S₃ two-term chain; A₄ g=(123),h=(134); M=k | d²=r_h r_(h⁻¹gh)−r_g r_h=0. Wrong suffix gives boundary (132) versus (234), unequal. On k all differentials0, H_q=k[c^q][q] | Correct sign and conjugation |
| §1.12 tensor comparison | (g)⊗1⊗m; right multiply h | Both evaluation/differential routes give r_g m; right-linearity gives (r_g s)h=r_g(sh). Homotopies are not asserted right-linear | Correct |
| **§1.13** generator homotopy | All S₃ transposition w,s of lengths0..2, g∈c | 507 cases: every coefficient of dS_g+S_gd−(right r_g) is 0 over ℤ. At empty w,s=r_h, prefix=hgh⁻¹ and r_(hgh⁻¹)r_h=r_hr_g | Correct, also in characteristics2,3 algebraically |
| §1.14 annihilation | R=k[t],q=0,2 | H₀=k,H₂=k[2]; t acts0 on both, though on chains t·1=t≠0 | Correct |
| **§1.15** regular support | R=k[t],q=0..5 | d₁=t,d₂=0,d₃=t,d₄=0; supports 0,−∞,2,−∞,4,−∞; even q≤A2+q=2+q | Correct |
| §1.16 universal coefficients | R=k[t],M=k,q=3 | H₃ support3≤max(0,1)+3+4+2=10; source constants A1=0,A2=1 give false 3≤2 | Package correction works |
| §1.17 low comparison | M=k,R=k[t] | H₀K=k=Tor₀; H₁K=k[1]=Tor₁; H₂K=k[2] but Tor₂=0 | Correct, no higher-degree identification |
| **§1.18** higher K bound; §1.19 | M=k and R over k[t] | h_q=q≤1+7q (q>1). For R, b=0 and t:R_n→R_(n+1) sends basis tⁿ to tⁿ⁺¹, rank1→1; theorem requires only n≥7 | Correct |
| Repaired §2.1 marked mapping classes | n=0,1,2; annulus | Disc groups 1,1,ℤ; pure subgroup at n=2 is 2ℤ, index2. Free boundary isotopies kill σ₁². Annular core twist maps to nonzero generator of π₀Diff(A,∂A) | Correct comparison target and negative controls |
| **R01**, §2.1 retraction | Polar flat twist f(r,θ)=(r,θ+φ(r)), φ=e^(−1/(1−r)²) near r=1, cut off near r=0; φ_j=χ(j(1−r))φ, χ=0 on [0,1], 1 on [2,∞) | Each f_j fixes a collar; f does not, since φ(1−1/j)=e^(−j²)>0 whereas φ_j there=0. For every derivative order m, ‖φ_j−φ‖Cᵐ→0. A retraction would give r(f)=lim r(f_j)=lim f_j=f outside its image | False; replace retraction |
| §2.2 arcs | n=0,1; two arcs sharing endpoint | Vertex counts 0,1; no edges at n=1. Shared endpoint count1<2 excludes an edge | Correct |
| **§2.3** truncated cosets | n=0,1,2; n=3,q=0 | A(0)=∅; A(1)₀=point,A(1)₁=∅; A(2)₀=A(2)₁=ℤ; L₃,₀=⟨σ₂⟩, not ⟨σ₁⟩ | Correct |
| §2.4–2.5 faces/stabilizers | n=2,q=1; n=3,q=2 | Edge b has endpoints b+1,b and stabilizer1. Two face composites give bσ₂σ₁L₀=bσ₁σ₂σ₁L₀, using braid relation and σ₂∈L₀ | Correct |
| **§2.6** connectivity | n=0,1,2 | Empty; point, conn≥−1; graph with verticesℤ and edges [b,b+1], realizationℝ, conn≥0 | Correct, including truncation |
| §3.1–3.2 module/resolution | n=0,1,2,trivial G | (M₀)₀=k,(Mₚ)₀=0 for p>0; X(0)=∅ versus Hur₀=point. At n=1 fibre point; n=2 fibreℝ and Hur₂≃S¹ | Correct range/exceptions |
| §3.3 rows and §3.4–3.5 edge | q=1; trivial G,n=1,p=0 | Inverse move gives (g₁,g₁⁻¹g₀g₁), yielding the two K terms. Coker(K₂→K₁)₁=k whereas (H₁K)₁=0; exact sequence 0→0→k→k→0→0 | Correct |
| **§4.1** induction; §4.2 | A1=1,A2=2,A0=7,P=1 | Threshold n>23 implies 1<n−2. Incoming j=2 bound23; competing diagonal j=1 bound16. A=21,B=11; n>21p+11 implies n≥(2+21p)+7 | Correct |
| **§4.3** full monodromy | S₃,c transpositions,H=⟨(12)⟩; n=0 | Exactly one of three U summands remains in H, coefficient1 versus erroneous3. Full fibre at n=0 has size0 for nontrivial G, size1 for G=1 | Correct |
| §4.4 and **§4.5** quotient stability | C₂; S₃,n=2; C₂ antipodal S² in F₂ | Trivial conjugation gives identity quotient; S₃ H₀ marked rank5, coinvariants rank2=unmarked rank2. Bad characteristic control H₁(RP²;F₂)=F₂ versus coinvariants of H₁(S²)=0 | Correct; centrelessness unnecessary topologically |
| Headline stability | G=1 or C₂; p=0,n≥1; all full choices | Constant fibre gives H₀=k and stabilization matrix[1]; empty full fibres give 0→0. For G=1,m=1, H₁(B₁)=0 versus H₁(B₂)=k: a threshold is genuinely needed | Nonvacuous; no padding |
| §5.1 and **R04** supplier | n=0,1,2,3; I₂(5) | Type-A cell counts 1,1,2,4; n=3 graded counts(1,2,1). I₂(5) Cartan product=(3+√5)/2∉{0,1,2,3} | Hurwitz cell argument sound; supplier wording overbroad |
| §5.2 and headline Betti | n=0; S₃,i=0; i≥0 | Ranks at n=0 are 1 or0; S₃ H₀≤6 in enumerated degrees. For m≤Ai+B+a, m≤(A+B+a+1)(i+1), giving (2|G|)^m≤C^(i+1) | Correct uniformity and small degrees |
| §5.3 and **R02** | G=1,c={1},n=1; nontrivial G,c generating | Exact-branch scheme H⁰=0, topological Conf₁ H⁰=k of dimension1. Repaired trivial-group bound has dimensions δ_i0δ_n0≤1 | False comparison; arithmetic bound survives |
| **R04** plane/disc transport | z=0,1; n=0,2 | h(0)=0,h(1)=1/√2; h⁻¹(1/√2)=1; distinct pair stays distinct and the empty tuple stays empty | Native homeomorphism supplies missing transport |
| **R03** graded gap | R=k⟨x,y⟩; k[1] | Native shift pieces at 0,1 are 0,k. Native balanced relation has +1 on both sides in odd internal degree; no sign −1 and no commutativity assumption | Existing API; narrow gap |

### Seeded sources, read at the actual locators

All 15 seeded targets were read in the supplied legal extracted texts, including hypotheses and proof steps used by the roadmap. The table records arXiv/manuscript printed pages, as the README specifies, not Annals pagination. No new source was needed and no manifest entry was rewritten.

| Target | Text and locator checked | Outcome |
| --- | --- | --- |
| 0.5 | EVW16 §2.2, pp.9–10, line 399–428 | Finite-group fibres and Borel description match. The general B_n-set statement additionally uses the named ClassifyingSpaces/AlgebraicTopology contracts |
| 0.6 | EVW16 §3.3, p.13, line 561–569 | Concatenation monoid, length, boundary product and noncommutative presentation match |
| 1.2 | EVW16 (4.5.1)–(4.5.3), p.18, line 815–827 | Defects match; the roadmap deliberately enlarges A1 |
| 1.6 | EVW16 Lemma4.6, pp.18–19, line 828–864 | Exact middle, tensor handedness and map degree a checked; package inequality sound |
| 1.9 | EVW16 Lemma4.9, p.20, line 909–927 | Low-degree spectral-sequence segment and factor4 match |
| 1.10 | EVW16 Proposition4.10, p.20, line 928–945 | Right/left modules, low augmentation degrees and linear slope match |
| 1.11 | EVW16 §4.1/(4.1.1), p.16, line 724–740 | Nonnegative internal grading, suffix conjugation and alternating signs match |
| 1.13 | EVW16 proof of Lemma4.11, p.21, line 953–958 | Inverse total boundary in the exponent matches; integral computation independently confirms |
| 1.15 | EVW16 Proposition4.12, p.21, line 959–978 | A2+q and generation/annihilation argument match |
| 1.18 | EVW16 Theorem4.2, p.16, line 741–748; §4.14, p.22, line 991–1035 | q>1, both low degrees, and source-degree stability range match with enlarged constants |
| 2.3 | EVW16 §5.2, p.23, line 1062–1069 | Subgroups and right-multiplication faces match; explicit truncation correctly repairs the source |
| 2.6 | EVW16 Proposition5.6, pp.25–27, line 1160–1251; HW10 Lemma7.1/Proposition7.2, pp.34–35, line 1631–1667 | Distinct endpoints, nonempty boundary marking and (n−2)-connectivity match |
| 4.1 | EVW16 proof of Theorem6.1, pp.27–29, line 1267–1309 | Both families of vanishing entries and induction constants match |
| 4.3 | EVW16 Theorem6.1/(6.1.2),(6.1.6), pp.27–29, line 1262–1337 | Subgroup induction and common shift checked; corrected diagonal coefficient is right |
| 4.5 | EVW16 Corollary6.2 and proof, p.29, line 1341–1360 | Source states centreless case; locally constant finite stabilizers and exact coinvariants justify the stated general-G extension |

Also opened: EVW16 §1.11 (grading); Proposition2.5 and §2.6; Definition3.1, Lemma3.2, Proposition3.4/Lemma3.5; Lemmas4.4–4.8, Proposition4.13 and low-degree comparison; §5.3–5.6; Proposition7.8. CD95 Theorem1.4.1, p.5, line181, and Corollary2.2.3, p.9, line334, support the homotopy model and one-cell-per-subset assertion. SMA59 Theorem B, p.621, line15–17, and Theorem4, p.624, line124–129 support the neighbourhood-fixed contraction, not R01's retraction. PAL60 and ALEX23 remain settled uncertified sources; their text was not requested again.

### Library and supplier audit

**Pinned native declarations opened.** The following names and their hypotheses were read, rather than inferred from current online documentation:

- `Mathlib/Algebra/Group/Conj.lean`: `IsConj` :32 (conjugation by a unit; group specialization valid), `ConjClasses.mk_eq_mk_iff_isConj` :151, `ConjClasses.mem_carrier_iff_mk_eq` :286; `Mathlib/Algebra/Group/Subgroup/Lattice.lean`: `Subgroup.closure` :329; `Mathlib/Algebra/Group/Subgroup/Map.lean`: `Subgroup.map_top_of_surjective` :262, **`MonoidHom.map_closure`** :582 (the namespace in this README is correct).
- `Mathlib/GroupTheory/Sylow.lean`: `IsPGroup.exists_le_sylow` :200, `Sylow.isPretransitive_of_finite` :347, `Sylow.card_eq_multiplicity` :842. Finiteness and primality are supplied in §0.2.
- `Mathlib/Algebra/MonoidAlgebra/Defs.lean`: `MonoidAlgebra.single` :222; `Module.lean`: `mapDomainLinearMap` :78, `lhom_ext'` :250. The carrier is finitely supported coefficients on a type; a multiplicative structure on that type is used only when multiplication is needed for R.
- `Mathlib/RepresentationTheory/Rep/Basic.lean`: `Rep.ofHom` :92, `Rep.ofMulAction` :333; `Mathlib/RepresentationTheory/Rep/Res.lean`: `Rep.res` :43 restricts along H→G to a representation of H; `Mathlib/RepresentationTheory/Basic.lean`: `Representation.ofMulAction` :395 and `ofMulAction_single` :414. `Mathlib/RepresentationTheory/Homological/GroupHomology/Basic.lean`: `groupHomology` :226, and `Functoriality.lean`: `groupHomology.map` :157. The latter takes the group homomorphism and the representation morphism with the correct restriction direction.
- `Mathlib/CategoryTheory/GradedObject.lean`:43 is a family `β → C`, not a module action; `Mathlib/Algebra/Homology/SpectralSequence/Basic.lean`:36 has page complexes and next-page isomorphisms, no convergence field; `Mathlib/CategoryTheory/Abelian/LeftDerived.lean`:106 has additive-functor left derived functors. These do not discharge the graded spectral-sequence gap.
- `Mathlib/Topology/Covering/Basic.lean`:287, `IsCoveringMap`, does not require surjectivity or nonempty fibres; `Mathlib/GroupTheory/FreeGroup/Basic.lean`:459 is the native free group. Empty full covers therefore remain legitimate. `Mathlib/AlgebraicGeometry/Sites/ElladicCohomology.lean`:76 defines `Scheme.EllAdicCohomology` using the pro-étale ℤ_ℓ sheaf, not a Hurwitz moduli construction.
- `TauCeti/GroupTheory/SpecificGroups/Braid/Basic.lean`: `BraidGroup` :99, `sigma` :106, far commutativity :120, braid relation :125, `sigma_induction_on` :168, `lift` :181, `lift_sigma` :206, `eq_one_of_le_one` :217, `strand` :222, `strandSucc` :225, `permHom` :358, `strandIncl` :380 and `pureSubgroup` :504. The native rightmost strand inclusion is distinct from this package's left-prefix block inclusion. `TauCeti/Topology/Homotopy/SerreFibration/Basic.lean`:107 defines `TauCeti.TopCat.serreFibrations` by disk lifting; it is not itself a long exact sequence theorem.
- `Mathlib/LinearAlgebra/Dimension/Basic.lean`:68 defines `Module.rank` as the cardinal supremum of linearly independent subsets; over a field it is dimension, without an implicit finite-dimensionality assumption. `Mathlib/Analysis/Normed/Module/Ball/Homeomorph.lean`:46–98 gives the actual radial homeomorphism and its inverse used in R04's repair.
- R03's pinned graded-module and balanced-tensor declarations were opened with their ambient hypotheses. `GradedModuleCat` allows a noncommutative ring and an arbitrary internal ℤ-grading; it does not silently impose finite dimension or nonnegative support. `BalancedTensorProduct.grading` requires compatible graded actions, and its balancing relation has no Koszul sign. The README must supply the support restriction when specializing it.

Object searches in both pins found no nonsplitting-class Hurwitz stability or uniform Hurwitz Betti theorem. Name matches for Hurwitz zeta, Diophantine approximation, permutation swaps and generic conjugacy are different objects, not duplicates of these headlines. Searches by graded module/tensor objects produced R03. The only two admitted declarations are deep, non-native headlines.

**Resolved roadmap contracts, now.**

| Supplier | Location opened and resolution |
| --- | --- |
| InverseGaloisAndArithmeticFundamentalGroups, #850 | `TauCetiRoadmap/InverseGaloisAndArithmeticFundamentalGroups/README.md`:2753 action, 2783 orbit monoid, 2874 extraction, 5426 configurations, 5462 asphericity/braids, 5532 marked spaces, 5568 forgetting marking, 5656 arithmetic schemes, 5741 analytic comparison, 6020 fixed-degree comparison, 6065 towers. All titles exist; identity-inertia hypothesis is R02 |
| ReductiveGroups, main | `TauCetiRoadmap/ReductiveGroups/README.md`:4396–4482 (11A), 4484–4521 (11B). Based positive half twist agrees: at n=2,t=1/2 the points are (1/2−i/2,1/2+i/2). Explicit comparison and crystallographic scope require R04 |
| ClassifyingSpaces, main | `TauCetiRoadmap/ClassifyingSpaces/README.md`:224–245, Stage4 items16–17: free resolution from lifted CW chains and group homology with local coefficients; deck/opposite convention is explicitly part of the supplier |
| AlgebraicTopology, main | `TauCetiRoadmap/AlgebraicTopology/README.md`:850–884 explicitly maps old Stage k/item m to §k.m; :1000 Layer2, :1264 Layer4, :1743 §4.7 realization, :1888 §5.1 Künneth, :1945 §5.3 covers/transfer, :2027 §5.5 Serre, :3219 §8.1 relative homotopy, :3334/3367 Hurewicz, :3413 Whitehead. The old names therefore do not drift. The finite-cover contract is not a theorem about arbitrary nonfree quotients; §4.4 gives its own locally constant-stabilizer argument |
| GeometricTopology, main | `TauCetiRoadmap/GeometricTopology/README.md`:788 §1.1 collars, :984 tubes, :1210 §1.7.2 smooth mapping classes, :1439 §3.1 topological diffeomorphism group, :1504 §3.3 restriction bundle, :1551 §3.4 Smale. Marked-disc and relative arc refinements remain separate declared contracts. The collars do not imply R01 |
| DGAInfinity, main | `TauCetiRoadmap/DGAInfinity/README.md`:263 Layer0, :293 Layer1, :431 Layer5. DG/Koszul conventions differ from unsigned internal grading; the explicit adapter gap is the appropriate place for any missing compatibility, but already native objects must be removed from it (R03) |

All eight gap slugs have named suppliers and matching entries in README and `design/plan.json`. None has supplier `none`. Seven contracts remain precise mathematical interfaces not discharged by the inspected native APIs: full Salvetti comparison/cell counts; semisimplicial realization; Borel functoriality/induced-space comparison; join connectivity; relative arc extension/cutting; marked-disc component comparison; graded Tor spectral sequences. Compound clauses there describe the API of one construction and are used by named targets. R03 concerns the eighth gap's minimality. Generic smooth isotopy extension for boundaryless manifolds, or contractibility of one Milnor join, does not already supply the boundary-relative arc theorem or the general join-connectivity theorem.

**Open work and overlap audit.** Read `scratch/overlaps.md` and used the required `roadmaps grep` and `roadmaps show` tools, alongside searches of the board's packages and main. The board-package index was read before any absence conclusion. No competing head edits this roadmap and no dropped/renumbered cited id was reported. The closest open scopes were opened: #1179 ArithmeticStatisticsPartVIII (carried-forward F01); #850 parent (foundations explicitly imported); #1169 TeichmullerGeometry (`TauCetiRoadmap/TeichmullerGeometry/README.md`:8–17, closed-surface mapping classes/Teichmüller structures, not Hurwitz stability); #1231 MordellLawrenceVenkatesh (`TauCetiRoadmap/MordellLawrenceVenkatesh/README.md`:1698, LV.5 surface/point-pushing theory, and LV.8 Kodaira–Parshin families); #1154 InductionRestrictionPartII (`TauCetiRoadmap/InductionRestrictionPartII/README.md`:24–35, low-degree central-extension and reduced-cover homology, not this graded Hurwitz K-complex). No identical fully qualified headline declaration was found in these. The package does not consume the later TeichmullerGeometry or MordellLawrenceVenkatesh roadmap. Ownership outside the brief's supplied open-work universe was not assessed.

**Dependency check, run exactly with the requested name, order, movable and content arguments:**

```text
depcheck: 236 roadmaps, 2135 edges, 0 problem(s)
```

No UPWARD, CYCLE or moved line. No merge-order file was changed. This mechanical result does not resolve the separately recorded ownership conflict.

## Not verifiable

- **PAL60**, Theorem A and §3, pp.305–312: manifest status `uncertified`; no readable legal text supplied. The local-cross-section construction was checked mathematically, but the exact wording/numbering of this citation cannot be certified. Settled status respected; no new request.
- **ALEX23**, pp.406–407: manifest status `uncertified`; no readable legal text supplied. The coning formula and its n=0,1 use were checked directly; the source locator cannot be certified from text. No new request.
- **Published-version agreement:** EVW16 was checked in the cached arXiv v4; the assertion that all published theorem/equation numbers agree was not independently certified against the published PDF. The actual README locators expressly use the read version's pages and line numbers, and all sampled locators were checked there.
- The prior **F01 board decision** is not present in the package or the supplied records. Its unresolved status is recorded, not inferred away by the clean dependency check.

## Source issues

- **Misprint** in EVW16 at §1.11, printed p.8: the source assigns infinite support degree whenever a largest nonzero degree does not exist; it should distinguish the zero module's degree −∞ from unbounded support's +∞; affects a stated result.
- **Misprint** in EVW16 at Definition2.2, printed p.9: the source reverses the two generating-tuple fibres and places unrestricted surjections in the class-constrained homomorphisms; it should pair each fibre with its matching class condition; affects nothing.
- **Misprint** in EVW16 at proof of Lemma4.6, printed p.18: the source places the left module first in its balanced tensor product; it should put the right module R[U] first, as in (4.6.3); affects nothing.
- **Gap** in EVW16 at proof of Lemma4.6, printed p.19: the last degree estimate drops the shifted Tor contribution when R[U] vanishes; it should bound torsion by max(δ−degU, δ+degR[U]) before using a nonnegative enlarged constant; affects the proof.
- **Gap** in EVW16 at proof of Lemma4.7, printed p.19: the spliced resolution omits the internal shift of multiplication by U; it should use P₁=R[degU], shifted later terms, and a slope at least degU; affects the proof.
- **Error** in EVW16 at Proposition4.13, printed p.21: the displayed bound permits slope A1=0 for R=k[t], U=t, M=k; it should require A1≥1, since H₃K(k)=k[3] exceeds the displayed bound2; affects a stated result.
- **Misprint** in EVW16 at §5.2, printed p.23: the coset formula supplies simplices even above the number of punctures; it should define empty degrees q≥n and use cosets only for q<n; affects nothing.
- **Error** in EVW16 at (6.1.6), printed p.29: the diagonal stabilization on exact image Q contains an extra class-size ratio; it should be U_Q, each surviving summand occurring once; affects nothing.
- **Misprint** in EVW16 at (7.8.3), printed p.35: the stabilization changes n by D; it should change n by Dd=degU, with the comparison prime exceeding the enlarged endpoint; affects nothing.
