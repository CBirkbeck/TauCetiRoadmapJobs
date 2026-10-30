# Review of FourManifolds (pull request #936 at c9603ef)
**Verdict:** needs changes

## R01 (P1) — The named geometric-topology prerequisites are still absent on main

**Location:** `TauCetiRoadmap/FourManifolds/README.md:337`, also 345, 394–404, 538–619 and 622–666: “GT3d's single K/Whitehead spectra”.

**Claim:** GeometricTopology supplies the K/Whitehead spectra, negative K-groups, quadratic surgery groups, Laurent splitting, and the named GT3e/GT3g transversality and smoothing contracts.

**Witness:** `TauCetiRoadmap/GeometricTopology/README.md:357` on main starts diffeomorphism groups; its comparison at 930–951 has three broad smoothing items. It has no GT3d, GT3e or GT3g contract. The expanded open revision is not a permitted replacement for main.

**Repair:** Resolve each use against the permitted main edition. Cite an actual earlier owner, or declare precise supplier gaps with matching plan/README slugs for the additional generic contracts. Keep the generic theory with that owner. Recheck both coefficient rings: L₅(ℤ)=0, but L₅(ℤ[ℤ])≅ℤ; citing only simply connected surgery cannot supply the cyclic action. Also resolve the named `puncturedTorusImmersion`, `brownGeneralizedSchoenflies` and normal/transversality exports against that same edition. No declared gap presently licenses the absent contracts.

## R02 (P2) — Import the quartic and filling constructions from their earlier owner

**Location:** `TauCetiRoadmap/FourManifolds/README.md:1464`–1473 and 1475–1495; also F6.0/F6.0b: “It is a concrete oriented Spin K3 generator for TangentialBordism”.

**Claim:** FourManifolds constructs the Fermat K3, the rational elliptic surface and its marked Lie-Spin fibre complement, and supplies these to TangentialBordism.

**Witness:** `TauCetiRoadmap/TangentialBordism/README.md:494`–550 at the supplied head assigns these same objects, characteristic numbers, Spin lifts and boundary comparison to B1.7. Lines 40–47 explicitly make FourManifolds the consumer.

**Repair:** Cite TangentialBordism B1.7 as the single constructor and retain only genuinely additional FourManifolds comparisons (such as E(2), the other elliptic quartic and the exotic-space application). Reconcile the duplicated Fermat acceptance declarations with that ownership and remove the return-supply descriptions at 75, 145–146, 916–917 and 1467–1471. The import must preserve χ(K3)=24, σ(K3)=−16, complex index 2, quaternionic index 1, and the complement's signature −8 and marked Lie Spin boundary. B1.7 explicitly supplies the requisite geometric data. This is a duplication defect, not a surviving two-way cycle: the supplier has changed since the first review.

## R03 (P2) — State the exotic four-space existence headline on native manifolds

**Location:** `TauCetiRoadmap/FourManifolds/Suggested.lean:34`–35: “The exotic ℝ⁴ construction: its Casson-handle neighborhoods and their smooth comparison inside K3 and the hyperbolic model are missing.”

**Claim:** The exotic-four-space headline cannot be stated at the pins because its construction is missing.

**Witness:** A scratch existential using native `TopologicalSpace`, `ChartedSpace`, `IsManifold`, `Homeomorph` and `Diffeomorph` elaborates. A proved standard-atlas negative control rejects standard ℝ⁴. No Casson-handle carrier is needed in this statement.

**Repair:** Add the actual existence headline and keep the detailed Casson-handle construction in F8.3. Missing proof machinery is not a missing statement carrier. This is a native formulation, with no stand-in predicate or admitted data:

```lean
theorem exoticFourSpace_exists :
    ∃ (M : Type) (t : TopologicalSpace M) (c : @ChartedSpace
      (EuclideanSpace ℝ (Fin 4)) inferInstance M t),
      letI : TopologicalSpace M := t
      letI : ChartedSpace (EuclideanSpace ℝ (Fin 4)) M := c
      IsManifold 𝓘(ℝ, EuclideanSpace ℝ (Fin 4)) ∞ M ∧
      Nonempty (M ≃ₜ EuclideanSpace ℝ (Fin 4)) ∧
      IsEmpty (Diffeomorph 𝓘(ℝ, EuclideanSpace ℝ (Fin 4))
        𝓘(ℝ, EuclideanSpace ℝ (Fin 4)) M
        (EuclideanSpace ℝ (Fin 4)) ∞) := by
  sorry
```

The homeomorphism ensures Hausdorffness, second countability, nonemptiness and the intended underlying topology; the model is boundaryless and four-dimensional. On standard ℝ⁴, `Diffeomorph.refl _ _ ∞` contradicts the final conjunct. Thus changing only the manifold's name or choosing the standard atlas does not satisfy the statement. Name the remaining unstatable end results individually in the docstring, including presentation/nonrecognition and the disk/control results; the current list does not account for the full headline inventory below.

## R04 (P2) — Give the disk engine the source's good-group generality

**Location:** `TauCetiRoadmap/FourManifolds/README.md:290`–305: “the disk-boundary embedding theorem in smooth/PL ambient manifolds with π₁=1 orℤ”.

**Claim:** The general disk engine and framed version are restricted to the trivial and infinite cyclic groups; its counting/control development is likewise restricted there.

**Witness:** `powellrayteichner` line 87, Theorem A, printed p.2, assumes a good fundamental group. Lines 112–116 explicitly include finite groups. A C₂ ambient group is covered by the source but excluded by this target.

**Repair:** State the disk-boundary and framed-disk theorems with the source’s good-group hypothesis, define it and develop the required group/control inputs; keep 1 and ℤ as applications. Give the later TOP transfer the same generality. Preserve the dual-sphere and boundary-framing conclusions. For a concrete additional test, take (RP³×I)#(S²×S²), remove a small ball meeting one factor sphere, and use the resulting punctured sphere as a properly embedded disk and the other factor as its dual. Here π₁=C₂, λ(f,g)=1, λ(g,g)=0 and μ(g)=0. The repaired theorem includes this already-embedded configuration; the present group restriction excludes it. Do not claim a disk theorem for all groups: goodness remains an essential hypothesis. This is the library-generality rule, not a counterexample to the restricted theorem.

## R05 (P3) — The entire new source sample still lacks locators

**Location:** `TauCetiRoadmap/FourManifolds/README.md:1313`, 1334 and 1370, through 1410; bibliography at 1749–1763.

**Claim:** F6.0, F6.0a and F6.0b specify the blowup/discriminant, local node/fishtail, and cubic-pencil/E(1) constructions.

**Witness:** All three sampled targets have zero attached theorem/section-and-page locators. The folder still has no `sources.toml`. Naming Gompf–Stipsicz in the final bibliography does not identify the particular assertions or their hypotheses.

**Repair:** Attach exact legal-source locators to these assertions and the other uncited targets, and record each work once in the source manifest. Distinguish a cited theorem from an additional proof target, especially the coefficient discriminant comparison, marked boundary charts, and positive-factorization classification. Validate against the explicit tests χ(blowup CP²)=4, exceptional square −1, positive-node square −2+2=0, and E(1)'s (χ,σ,F²)=(12,−8,0). I attempted retrieval and inspected the publisher's catalogue/preview availability; no full readable Gompf–Stipsicz text was obtained. Unavailable source verification is recorded below, not inferred from those numerical checks.

## R06 (P3) — Complete the definition APIs, Checks and target dependencies

**Location:** `TauCetiRoadmap/FourManifolds/README.md:314`–326, 640–650 and 1047–1083, among other targets: “Define (δ,1)-connected M→E over X”.

**Claim:** Definitions of controlled connectedness, normal maps and Kuranishi reductions have the required usable specification and target-local dependency lists.

**Witness:** There are five Needs lines and six Check blocks in 1,763 lines. Controlled connectedness, normal maps and Kuranishi reduction lack their three-item definition-specific Checks. Layer 1’s Dependencies paragraph describes F6/F7 outputs.

**Repair:** Finish the conversion to topic subsections, with an API, at least three discriminating Checks for each definition, and a dependency list for each target/route. For controlled connectedness, test a point control map with zero track diameter, a small nonzero track admitted only above its tolerance, and a relative loop that has no extension. For normal maps, distinguish degree-one identity, degree-two map and degree-one map missing the stable normal comparison. For the Kuranishi construction retain the trivial-flat S⁴ values (3,0,0), product-flat S²×S² values (3,0,3), and irreducible Q₈ values (0,6,12). Layer-level prose and the new aggregate examples do not replace these local contracts.

## Verified sound

:robot: Independent AI review. I read the full README and Lean file, rechecked all previous findings before the full pass, and made no change in the pull-request worktree. There is no outside-folder diff. The worker's gate passes every scanner, dependency check and targeted build. My direct `lake env lean` run succeeds with exactly four `sorry` warnings. A separate scratch file with all twelve `#check @...` commands succeeds; all twelve elaborated signatures match their README roles, including both Enriques hypotheses. No section binder was lost. All four admitted theorems resist the one-tactic `simp`, `rfl`, and `infer_instance` probes; object searches found no single pinned theorem that is these specialized polynomial/freeness results. No additional padding finding is made for them. R02 addresses changed ownership separately.

The required dependency command returned exactly:

```text
depcheck: 206 roadmaps, 1414 edges, 0 problem(s)
```

There is no UPWARD, CYCLE or moved line. TangentialBordism is entry 9 and FourManifolds entry 119. IndexTheory is not listed; absence from the order is not a finding under the stated placement rule. The mechanical result does not certify that a named supplier section exists in the permitted edition (R01), or eliminate duplicated ownership (R02). The citation resolver likewise found no names nowhere, but searches open revisions as well as main; I verified main as `9c6e95d` before assessing R01.

The previous findings resolve as follows; these are comparisons to the actual revised passages, not reliance on the earlier verdict. No repair report marking a finding “not actionable in this package” was supplied or found among this package's reports.

| Previous finding | Current passage and disposition |
|---|---|
| R01 supplier drift | **Not repaired.** “GT3d's single K/Whitehead spectra” remains at 337. The opening comparison3 paragraph does not supply the missing targets. Current R01. |
| R02 supply cycle | **Partly repaired across the two heads.** TangentialBordism B1.7 now owns the examples and says FourManifolds consumes them. Four still says “It is a concrete oriented Spin K3 generator for TangentialBordism” at 1467. The old cycle is not reasserted; current R02 is duplication/stale direction. |
| R03 Enriques freeness | **Repaired.** `enriquesZeroSet` and `enriquesProjectiveInvolution_no_fixed_point` occur at Lean 107–115 and README 1562–1570. The nonzero-zero and fixed-coordinate-point controls separate the domains. |
| R04 algorithms | **Repaired.** “Fix any such polynomial” at 1538 replaces ordered enumeration; F8.2 proves finiteness of isometries, not an executable decision procedure. The abstract nonrecognition theorem remains mathematics. |
| R05 locators | **Partly repaired.** G0 now cites Feehan–Leness §3.1; G2 cites Theorem 3/Corollaries 5–7; F7.0b cites Kirby–Melvin p.99 footnote 3. All three new sampled F6 targets still have no locators. Current R05. |
| R06 shape/Checks | **Partly repaired.** Required top-level headings and eight Examples/Dependencies pairs now occur, and Spinᶜ and polynomial Check lists have been added. Most definitions still lack their own lists and dependencies. Current R06. |
| R07 padding | **Repaired.** `fermatQuarticMap_fderiv` and the admitted involutivity theorem have been deleted. Their mathematical facts remain in README API prose. |
| R08 names/docstring | **Names repaired; headline accounting partly repaired.** All twelve own Lean names occur in the README. The docstring now names more unavailable constructions, but incorrectly classifies exotic-space existence as unstatable (current R03). |

The table below records instance computations throughout all eight layers, including every sampled target, all twelve Lean declarations, headline theorems and all finding targets. Passing instances do not prove general geometric constructions. “Open” or “not certified” identifies a proof/source limitation. Numerical agreement is not presented as a proof of diffeomorphism, gluing, or controlled topology.

| Statement | Instances tried | Values computed on both sides | Result; change |
|---|---|---|---|
| Intersection form on torsion quotient  | S⁴; Enriques | Free ranks 0 and 10; torsion class pairs to 0 in ℤ; quotient removes the ℤ/2 summand | Pass; retain torsion before quotient |
| Signed signature convention  | H; −I₁ | Inertia (1,0,1) gives 1−1=0; (0,0,1) gives 0−1=−1 | Pass; integer subtraction essential |
| F1.1 CP² generators/cup ring | Complex line; reversed orientation | h²[CP²]=1; h³=0 by degree; h²[−CP²]=−1 | Pass |
| F1.1 product form | Factor spheres a,b in S²×S² | a²=b²=0, a·b=b·a=1; det H=−1 | Pass |
| F1.1 rank-zero convention | S⁴, empty connected sum | H₂=0, det(empty)=1, σ=0, χ(S⁴)=2 | Pass; no natural-subtraction issue in Lean |
| F1.2 twisted sphere bundle | Section S and fibre F | Gram [[−1,1],[1,0]] becomes diag(1,−1) in (S+F,S) | Pass; explicit matrix multiplication |
| F1.3 connected sum | CP²#(−CP²); M#S⁴ | Rank 2, σ=1−1=0, χ=3+3−2=4; M#S⁴ has χ(M)+2−2=χ(M) | Pass |
| F1.4 framed-link intersection | Unknots with framings 0,+1; positive Hopf | Matrices [0],[1],[[0,1],[1,0]]; ranks 1,1,2 of H₂ | Pass |
| F1.4 wedge homotopy type | Empty link; one 0-framed unknot | D⁴ retracts to a point; S²×D² retracts to S² | Pass |
| F1.5 boundary kernel/cokernel | Matrices [0],[2],[1] | Cokernels ℤ,ℤ/2,0; kernels ℤ,0,0 | Pass; unimodular boundary need not be S³ |
| F1.6 matrix realization | Two handles, framings 1,2 and linking 1 | Q=[[1,1],[1,2]], det=1 | Pass |
| F1.6 E₈ plumbing | Arms 1,2,4; all diagonal 2 | Leading principal minors 2,3,4,5,4,3,2,1; det=1; positive rank 8 | Pass; signed basis can change edge signs |
| F2 punctured manifold/wedge | CP²; S⁴ | Punctures have H₂=ℤ and 0; wedge counts 1 and 0 | Pass |
| F2 π₃ decomposition | r=0,1,2 | Ranks 0,1,3 from r+r(r−1)/2; basis η₁,η₂,[ι₁,ι₂] for r=2 | Pass |
| F2 Hopf/Whitehead normalization | One sphere; product attachment | [ι,ι]=2η has Hopf invariant 2; off-diagonal coefficient for S²×S² is 1 | Pass |
| F2 dual-basis correction | Q=[[1,1],[1,2]] | C=[[2,−1],[−1,1]]; QC=I; attachment 2η₁+η₂−[ι₁,ι₂] | Pass; Q is not C |
| F2 colored-link coordinates | Framed unknot; positive two-color Hopf | Self-linking 1 gives η; mutual linking 1 gives Whitehead coordinate 1 | Pass; geometric comparison remains a proof target |
| F2 primitive isotropic class | H; diag(1,−1); diag(1,−2) | v=(1,0) in H and (1,1) in I₁,₁ have square 0; x²=2y² has only zero integral solution | Pass; unimodularity excludes third form |
| F2 companion/splitting | v²=0,v·w=1,w²=2 or 1 | (w−v)²=0 in first case; in second, (w−v)²=−1 and (w−v)·w=0 | Pass |
| F2 homotopy classification | Two homotopy-CP² KS choices | Same Q=[1], same top-cell η; KS 0 versus 1 does not alter the homotopy type | Pass on invariants; general construction open |
| F3.1a intersection identity | One positive or negative double point, e=0 | μ=±1 gives sym(μ)=±2 and λ(f,f)=±2 | Pass; identity coefficient retained |
| F3.1a whisker involution | Group ℤ, generator t | sym([t])=t+t⁻¹ is unchanged under sheet reversal | Pass |
| F3.1a disk boundary theorem | One disk/one dual; two disks | λ(fᵢ,gⱼ)=δᵢⱼ gives [1] or I₂; dual self/intersections 0 | Pass on algebra; good-group generality missing (R04) |
| F3.1a framed Whitney variant | Trivial π₁ and no double points | Off-diagonal λ=0, μ=0; original disjoint disks already satisfy conclusion | Pass boundary test; not a proof of general theorem |
| F3.1a Casson/shrinking construction | Ordinary open 2-handle model | D²×ℝ² is contractible; attaching region S¹×ℝ² has π₁=ℤ | Model consistent; shrinking estimates not independently certified |
| F3.1b controlled disks | Control space a point | All track diameters 0<ε; controlled intersection requirements reduce to algebraic ones | Pass boundary test; full quantitative contract open |
| F3.1b.2 local obstruction coefficients | Local groups 1 and ℤ | Wh=0, reduced K₀=0, negative K=0; the proposed obstruction group is 0 | Values consistent; supplier repair R01 |
| F3.1b.2 proper product | ℝ⁴×I | One end, stable end π₁=0; both inclusions have proper inverse projection and proper homotopies | Pass; FQ7.7.2 located |
| F3.1b.2 isotopy control | g=h and C empty/full | Displacement 0; constant isotopy has displacement 0 and prescribed support | Pass boundary tests; relative extension proof open |
| F3.1c unstable smoothing | V=ℝ⁴ | Tangent classifier constant, rank-4 bundle trivial, standard smooth structure supplies a lift | Pass; does not classify exotic atlases up to diffeomorphism |
| F3.1c opened cobordism | V=ℝ⁴, B an open ball | H₀(W)=ℤ; reduced ordinary homology 0; H_c⁴(W)=ℤ; boundary restriction maps each multiply by ±1 | Pass; jointly proper comparison uses AT8.5 |
| F3.1c compact exhaustion in W | D⊂B, 0≤a<1 | t=(a+1)/2 satisfies a<t<1; moving a point outside D vertically never enters D×I | Pass for stated escape construction |
| F3.1c contractible/end recognition | ℝ⁴ versus a contractible space without the end hypothesis | ℝ⁴ has one end and π₁ at infinity 0; contractibility alone only fixes ordinary π₁=0 | No overclaim found; general recognition proof open |
| F3.1c marked ball theorem | D⁴ with an S³ marking | H₂=0, σ=0; Alexander radial extension sends the prescribed boundary map to itself at radius 1 | Pass; not smooth Schoenflies |
| F3.1c hyperbolic hypersurface | k=0,1 | Forms 0 and H; ranks 0,2; σ=0 in both; outputs S⁴ and S²×S² | Pass boundary cases; geometric proof open |
| F3.1c stable smoothing | E₈ and 2E₈ examples | KS values 1 and 0; adding H preserves σ and KS | Pass obstruction test; no smoothing promised when KS=1 |
| F3.1c noncompact smoothing classes | ℝ⁴ | H³(ℝ⁴;ℤ/2)=0 gives one concordance class, not one diffeomorphism class | Pass distinction; FQ8.18 located |
| F3.1c pseudo-isotopy theorem | Identity pseudo-isotopy | Zero stabilizations suffice; π₄(TOP(4)/O(4)) conclusion is 0 | Source theorem/hypotheses located; general proof not reproduced |
| F3.1c stabilization connectivity | Relative homotopy in degrees ≤5 | Required groups vanish, hence relative lifting obstruction in each such degree is 0 | Source FQ8.17 located; not a new computation of its proof |
| F3.1c noncompact submanifold smoothing | ℝ⁴⊂ℝ⁴⁺ᵏ | Normal bundle ℝᵏ, obstruction cohomology in positive degree 0; identity isotopy works | Pass; source FQ8.19 has noncompact-components hypothesis |
| F3.1c normal neighborhoods | Point, line, surface, hypersurface in ℝ⁴ | Normal ranks 4,3,2,1; coordinate zero sections identify the corresponding neighborhoods | Pass local models; main supplier issue R01 |
| F3.1c map transversality | q=1,2,3,4,5 and constant map | Expected dimensions 3,2,1,0,−1; for q=5 a small perturbation can avoid target | Pass local models; q>4 is avoidance, not Nat subtraction |
| F3.1c stable-germ extension | Identity germ, one stabilization | Inverse image P×0 stays P×0 under constant homotopy; stabilized normal rank increases by 1 | Pass model; Marin locator unreadable |
| F3.2 normal-map correspondence | Identity of S⁴ | Normal invariant 0 and kernel 0; obstruction σ(kernel)/8=0 | Pass; generic algebraic suppliers R01 |
| F3.2 pinch correction | α on S²×S²; generator of CP² | w₂ pairing 0 gives coefficient 1; pairing 1 gives coefficient 1+1=0 in ℤ/2 | Pass distinction |
| F3.2 ordinary/cyclic L-groups | Groups 1 and ℤ | L₄(ℤ)=ℤ, L₅(ℤ)=0; Laurent splitting gives L₅(ℤ[ℤ])=ℤ | Values consistent; do not discard cyclic action; R01 |
| F3.2 knot normal filling | Unknot; trefoil | Arf=0 versus 1; zero-surgery unknot is S¹×S² with identity coefficient-chain map | Pass obstruction control; no filling claimed from Arf=1 |
| F3.2 Alexander-one branch | Unknot Δ=1 | Infinite cyclic cover comparison has vanishing reduced Alexander module | Pass; general Seifert-chain proof open |
| F3.2 compact TOP h-cobordism | S⁴×I | Boundary inclusions homotopy equivalences; torsion 0; product already supplied | Pass boundary test |
| F3.2 annulus | Concentric spheres of radii 1,2 in ℝ⁴ | (u,t)↦(1+t)u has endpoint radii 1,2 and inverse t=‖x‖−1 | Pass; one arbitrary boundary marking, not two independent ones |
| F3.2 ANR point/line flattening | W=ℝ⁴,p=0; W×ℝ | Local homology is ℤ in degrees 4 and 5 respectively; normal line codimension 4 | Pass standard model; cited normal-approximation text unreadable |
| F3.2 contractible caps | Σ=S³; Poincaré sphere | D⁴ has boundary S³ and H̃*=0; a homology sphere has H₁=H₂=0 without π₁=0 | Pass distinction; cap construction not independently certified |
| F3.2 E₈ insertion action | Insert once/twice | Δσ=8,16; Δ(σ/8)=1,2 | Pass |
| F3.3 realization/KS parity | 0,H,E₈,2E₈,[1] | Even forms give KS 0,0,1,0; odd [1] permits 0 or 1 | Pass algebraic constraints |
| F3.3 knotting characteristic component | Change Arf by 1 | Q unchanged; KS formula changes by 1 in ℤ/2 | Pass |
| F3.4 homeomorphism classification | Odd rank-one examples | Both Q=[1]; unequal KS blocks homeomorphism despite equal homotopy type | Pass negative control |
| F3.4 killing the normal invariant | a²[M]=0 | Wu gives w₂·PD(a)=0; pinch coefficient is 1 and adds a to a, giving 0 | Pass algebraic step |
| F3.5 nonsmooth examples | E₈; 2E₈ | Positive ranks 8,16 and even; ±I of those ranks is odd, so cannot be isometric | Pass Donaldson obstruction; KS=0 alone insufficient |
| F4 Spinᶜ quotient/character | Central pair (−1,−1); rank-zero geometric Spin convention | z²=(−1)²=1; quotient central circle still maps by square, not weight 1 | Pass |
| F4 existence/torsor | CP², S²×S² | w₂=h mod2 and 0; integral lifts h and 0 give β(w₂)=0 in both | Pass |
| F4 determinant twisting | Twist on CP² by a=h | c₁=h becomes h+2h=3h; reductions both h mod2 | Pass |
| F4 even versus Spin | S²×S²; Enriques | Even free forms in both; w₂=0 versus nonzero torsion reduction | Pass; H₁ 2-torsion exception retained |
| F4 characteristic-surface identity | CP²,line; TOP E₈,F empty | (σ−F²)/8=0,Arf=0 gives KS=0; E₈ gives 8/8=1 mod2 | Pass; opposite numerator convention agrees mod2 |
| F4 smooth/TOP Spin signatures | K3; E₈ | −16/16=−1 integral in smooth example; topological E₈ has KS=1 and σ=8 | Pass; quaternionic parity is necessary |
| F4 surgery-to-simply-connected comparison | S¹×S³ with bounding surgery framing | σ=KS=0 before and after; generator of π₁ is killed | Pass test; general TOP surgery construction open |
| F4 Pontryagin square lift | CP²,x=h mod2; zero class | P(x)=h² mod4 has value 1; P(0)=0 | Pass |
| F4 Pontryagin square sum | S²×S²,x=a mod2,y=b mod2 | P(x)=P(y)=0; P(x+y)[M]=2=0+0+2(a·b) mod4 | Pass; wrong additive-only definition excluded |
| F4 coefficient map j | 1∈ℤ/2 | j(1)=2, j(1+1)=0=2+2; j(1)²=0≠2=j(1·1) | Pass; not a unital ring map |
| F4 rank-three Postnikov action | Change lift by a=1 on S⁴ | Δp₁=−4; mod4 congruence remains 0=P(0) | Pass |
| F4 rank-four Postnikov action | (a,b)=(1,0),(0,1) | (Δp₁,Δe)=(−2,−1),(−2,1); Δ(p₁+2e)=−4,0 | Pass mod4 congruence |
| F4 half-spin normalization | TS⁴ with c₂S⁺=−u,c₂S⁻=u | p₁=−2(−u+u)=0; e=u−(−u)=2u | Pass; changing factor labels would flip e |
| F4 torsion-invisible bundle | RP²×RP², a,b order 2 | a²=b²=0, ab≠0 of order2; p₁=−4ab=0; λ=−2ab=0 | Pass distinction between unstable c₂ and stable λ |
| F4 spin-lift ambiguity in example | Flat line with c₁=a+b | (a+b)²=a²+2ab+b²=0; twisting cannot kill c₂=ab | Pass |
| F5 Sobolev action/slice | Trivial flat S⁴ connection | Stabilizer SU(2), Lie dimension 3; constants lie in ker(d*d), so full inverse impossible | Pass complement requirement |
| F5 determinant/stabilizers | Irreducible; line-reducible | Center μ₂ acts trivially; off-diagonal circle action z↦z² has kernel μ₂ | Pass; effective quotient necessary |
| F5 energy/BPST | k=1 ASD; k=0 ASD; k=−1 ASD candidate | E=8π²,0,−8π² respectively; nonnegative E excludes third and forces curvature 0 in second | Pass normalization |
| F5.G0 index — trivial S⁴ flat | b₁=b₂⁺=0,k=0 | −3=0−3−0 | Pass; not a negative-dimensional manifold claim |
| F5.G0 index/Hodge — product flat | Trivial connection on S²×S² | −6=0−3−3; full twisted H² dimension 6=3+3 | Pass; instance test |
| F5.G0 flat chain projection | Harmonic self-dual/anti-self-dual product generators | P⁺ acts as 1 on the first 3 dimensions and 0 on the other 3 | Pass; chain map not quasi-isomorphism |
| F5.G0 degree-one comparison | Flat T⁴, exact curvature variation | ∫⟨da∧da⟩=0, hence ‖(da)⁺‖²−‖(da)⁻‖²=0; d⁺a=0 implies da=0 | Pass |
| F5.G0 Kuranishi derivative | x=0 at any ASD connection | κ(0)=0 and Dκ(0)=0; leading term is quadratic, not an arbitrary linear map | Consistent; analytic IFT/overlap proof open |
| F5.G0 two obstruction targets | Trivial product flat | Ambient dimensions 6 and 3; both actual charge-zero solution sets consist of flat connections | Pass distinction; zero-set comparison not ambient identification |
| F5.G0 Q₈ regression | Σ₂×Σ₂, i,j holonomy on first factor | [i,j]²=(−1)²=1; b₁=8,b₂=18,b₂⁺=9; index=−3(1−8+9)=−6 | Pass; instance test |
| F5.G0 twisted Q₈ dimensions | Same representation | First factor adjoint H dimensions (0,6,0); product H¹=6,H²=24 with H²₊=12; 6−0−12=−6 | Pass; irreducible and obstructed for every metric |
| F5.G0 holonomy centralizers | Trivial, noncentral cyclic, Q₈ | Centralizers SU(2),U(1),{±1}; Lie dimensions 3,1,0 | Pass; nonabelian test included |
| F5.G1 metric derivative at flat point | F_A=0 | (D_gP⁺)[h]F_A=0 for every h, so metric variation adds rank 0 | Pass exclusion; instance test |
| F5.G1 pointwise rank argument | Orthogonal nonzero images in su(2) of dimension 3 | rank(F)+rank(ψ)≤3; rank(F)≥2 forces rank(ψ)=1 | Pass linear algebra; continuation theorem source not certified |
| F5.G1 reducing-line argument | ψ=ω⊗σ with ω self-dual nonzero | Wedge with ω:Λ¹→Λ³ has rank 4; parallel σ puts F in a line orthogonal to itself, giving F=0 | Pass local algebra; global continuation remains open |
| F5.G1 derivative budget | Index bound N=5,s=3 | Minimum integer q=6 and ℓ=10 satisfy q>5, ℓ≥q+s+1 | Pass arithmetic; not interchangeable with native quadratic threshold |
| F5.G1 smooth residual comparison | Flat excluded, charge-one irreducible | Virtual index 5 on negative-definite base; a generic regular irreducible has H²=0 and dim H¹=5 | Consistent; source locator absent |
| F5.G2 small-curvature scaling | Zero connection; dilation x↦rx in dimension 4 | Curvature L² scales r⁴·r⁻⁴=1; zero connection has all displayed norms 0 | Pass critical scaling; instance test |
| F5.G2 ideal strata | k<0, k=0, k=1 | Empty, flat-only, or charge-zero connection plus one charge-one bubble; total energy 8π²k | Pass boundary cases; general gluing proof not certified |
| F5.G2 projected inverse | Cokernel dimension r=3 at product flat | Unprojected image misses 3 dimensions; projection removes exactly those 3 | Pass obstruction requirement |
| F5.G2 reducible charge-one link | Negative definite simply connected base, c²=−1 | k=−c²=1; index 5, H⁰=1,H²=0 imply real H¹=6=complex dimension 3 | Pass; link S⁵/S¹=CP² with weight 2 effective action |
| F5 Donaldson bordism count | Q=−Iᵣ, r=0,1,2 | Number of unordered square −1 pairs 0,1,2; σ(M)+r=−r+r=0 | Pass headline sign/count |
| F5 unit-class orthogonality | Distinct classes u,v with squares −1 | Cauchy gives absolute pairing ≤1; equality implies u=±v; distinct pairs give pairing 0 | Pass; all unit classes form orthogonal basis when count is rank |
| F6 real blowup | Zero section; away from origin | Exceptional fibre RP¹=S¹; tautological line has monodromy −1; punctured projection has singleton fibres | Pass; real exceptional circle differs from complex sphere |
| F6.0 complex blowup | Blow up CP² once | χ=4,σ=0,c₁²=8; exceptional square −1; χ increases by 1 and c₁² decreases by 1 | Pass; seeded target: missing locator R05 |
| F6.0 discriminant | Fermat degree d≥2 over ℂ | ∂ᵢF=d zᵢ^(d−1); common derivative zero forces every zᵢ=0 | Pass; coefficient d≠0 uses characteristic 0 |
| F6.0 coefficient-field negative control | Degree 2 in characteristic 2 | Derivative of Σzᵢ² is 0, unlike characteristic-zero test | Outside stated ℂ scope; do not generalize without hypothesis |
| F6.0a node coordinates | u=z₁+iz₂, v=z₁−iz₂ | uv=z₁²+z₂²; change-of-coordinate determinant −2i≠0 | Pass; instance test |
| F6.0a nodal sphere | e(ν)=−2, double point sign ±1 | Self-intersections −2+2=0 and −2−2=−4 | Pass; positive sign is essential |
| F6.0a local fibres | t=0 versus t≠0 | Local central fibre two disks; nearby local fibre annulus; exterior neck gives Euler 1 versus closed torus Euler 0 | Pass; local annulus is not the whole torus |
| F6.0a monodromy | a·b=1; positive loop | A(1,0)=(1,0), A(0,1)=(1,1); reversed loop gives A⁻¹ with upper-right entry −1 | Pass convention |
| F6.0b cubic parameter count | Degree 3 homogeneous polynomials in 3 variables | Number of monomials C(5,2)=10; projective dimension 9 | Pass; coefficient space is not moduli |
| F6.0b base points | Two transverse cubics | Intersection number 3·3=9; a pencil has vector-space dimension 2, while nine independent point conditions would leave dimension 1 | Pass; forced ninth condition matters |
| F6.0b E(1) invariants | CP²#9(−CP²) | χ=3+9=12, σ=1−9=−8, F²=9−9=0, c₁=F | Pass; instance test |
| F6.0b fibre/section | Exceptional section Eᵢ | F·Eᵢ=1; all coefficients of F characteristic modulo2 on diag(1,−1⁹) | Pass |
| F6.0b nodal count | Smooth torus fibres; twelve simple nodes | Smooth fibre χ=0, each node contributes 1, giving χ(E1)=12 | Pass assuming the asserted generic pencil exists |
| F6 torus matrix conventions | A,B,S as displayed | SAS⁻¹=B; (AB)³=−I; (AB)⁶=I | Pass; exact integer multiplication |
| F6 factorization length | Empty word; alternating length 12 | Classes 0 and 12=0 in ℤ/12; nonempty positive length is at least 12 | Pass; excludes erroneous lower bound on empty word |
| F7.0 quartic Chern numbers | Degree-4 hypersurface in CP³ | (1+h)⁴/(1+4h)=1+6h² through degree2; ∫h²=4 gives c₂=24,p₁=−48 | Pass; instance test |
| F7.0 K3 signature/index | Complex orientation | σ=−48/3=−16; Â=48/24=2; quaternionic index 2/2=1 | Pass; signature/16=−1 |
| F7.0b fibre complement | Remove T²×D² from E1 | χ remains 12; σ remains −8; c₁ restricted from fibre class is 0; H⁴ of connected compact manifold with nonempty boundary is 0 | Pass numeric prerequisites; marked boundary Spin identification supported by kirbymelvin line 463 |
| F7.0b Spin versus framing | Lie T³ | Rokhlin residue −8 mod16=8; 12ν has order2 in ℤ/24, while ΩSpin₃=0 | Pass distinction; not a proof of the marked boundary identification |
| F7 E(n) numerical formulas | n=1,2,3 | (χ,σ,b₂)=(12,−8,10),(24,−16,22),(36,−24,34); c₁=F,0,−F | Pass |
| F7 E(n) forms/parity | n=1,2,3 | I₁,₉; 2(−E₈)⊕3H; I₅,₂₉ have ranks 10,22,34 and signatures −8,−16,−24 | Pass; Spin exactly even n |
| F7 seed polynomial and coordinate lines | L₀,L₁; e₀; (1,1,1,1) | F vanishes on each line; gradient at e₀=(0,0,1,0); F(1,1,1,1)=4 | Pass |
| F7 seed critical-point exclusion | All coordinates nonzero; any coordinate zero | Multiplying derivative equations gives 81Πzᵢ³=Πzᵢ³, hence 80Πzᵢ³=0; zero propagates to all coordinates | Pass; no nonzero critical point |
| F7 residual pencil | H²=4,H·L₀=1,L₀²=−2; L₀·L₁=0 | (H−L₀)²=4−2−2=0; (H−L₀)·L₁=1 | Pass fibre/section classes |
| F7 quartic nodal count | Smooth elliptic quartic | χ=24 and regular torus χ=0 imply 24 simple-node contributions | Pass if genericity proven; rational coefficient existence is now non-algorithmic |
| F7 quartic connectedness/E(2) comparison | Smooth parameter path; n=2 | Both endpoints have χ=24,σ=−16,Q=2(−E₈)⊕3H | Necessary invariant agreement; not proof of diffeomorphism; atlas/path theorem remains a target |
| F7 Enriques quadrics | Squares (−1,3,−3,1,0,0) | Moments −1+3−3+1=0; −1+6−9+4=0; −1+12−27+16=0 | Pass nonempty common zero set |
| F7 Enriques Jacobian | Three supported coordinates versus four | Vandermonde(1,2,3) determinant 2; support≤3 forces squares 0; every nonzero zero has ≥4 supported coordinates and derivative rank3 | Pass; uses ℂ and distinct tᵢ |
| F7 Enriques projective freeness | Eigenvalues ±1 | Fixed points must lie in one of the two 3-coordinate blocks; each block's Vandermonde kernel is 0 | Pass headline; native signature now present |
| F7 Enriques quotient invariants | Cover degree2 | χ=24/2=12,σ=−16/2=−8,b₂=10; H⊕−E₈ has rank10, signature−8 | Pass; H₁=ℤ/2 and torsion canonical class needed separately |
| Fermat polynomial/map definitions | 0,e₀,(1,1,1,1) | Values 0,1,4; evaluation agrees with Σvᵢ⁴ | Pass two native declarations |
| Fermat surjectivity headline | e₀ versus 0 | Derivative ranks 1 and 0; v≠0 excludes latter | Pass |
| Elliptic seed map/surjectivity headline | e₀ versus 0 | Derivative ranks 1 and 0; all-nonzero branch excluded by 81≠1 | Pass |
| Enriques quadric declaration | j=0,1,2 at e₀,e₅ | Values (1,1,1) and (1,6,36); neither point is on cover | Pass finite indexing; no out-of-range j |
| Enriques linear/projective map definitions | v=e₀+e₃ and v=e₀ | First maps to −e₀+e₃, a different projective point; second maps to −e₀, same projective point | Pass; ambient map is not free |
| Enriques Jacobian-surjectivity headline | Above four-coordinate zero; origin | Nonzero-zero derivative rank3; origin rank0 | Pass; both hv and hz actually in Lean signature |
| Presentation manifold realization | Empty presentation; ⟨a∣a,a⟩; ⟨a∣ ⟩ | π₁=1,1,ℤ; for second m−n=1 and b₂(boundary)=2 | Pass; mathematical existence retained |
| Nonrecognition reduction | Trivial branch k=9; nontrivial branch | Trivial branch b₂=18,σ=0,even form 9H; other branch π₁≠1 cannot be #9(S²×S²) | Pass logical separation; no sphere-recognition claim |
| Isometry bound | Q=Q′=[1]; empty matrix | v²≤1 gives candidates −1,0,1 but equation v²=1 retains ±1; rank0 has one empty isometry | Bound consistent; enumeration removed; finiteness retained |
| Kirby/KS formula | +1 unknot; +E₈ plumbing | For [1], x=1 gives (1−1)/8+0=0; E₈ has x=0 and KS=8/8=1 | Pass; division is integral before mod2 |
| Exotic ℝ⁴ construction | K3 form split as 3H⊕2(−E₈) | Removing 3H leaves rank16,signature−16,even definite 2(−E₈); −I₁₆ is odd | Obstruction consistent; common-neighborhood construction source unreadable |
| Enriques zero-set definition | [e₀], [i,√3,i√3,1,0,0] | Values (1,1,1) give false membership; moments (0,0,0) give true membership; scaling by λ multiplies all values by λ² | Pass; ordinary native definition, no free predicate |
| Enriques freeness headline | Same two points | [e₀] is fixed but excluded; second point has opposite signs in nonzero slots 0 and 3, requiring λ=−1 and λ=1 simultaneously | Pass; prior omission repaired |
| Enriques new Jacobian Check | v=(i,√3,i√3,1,0,0) | First minor is 8·(i√3·i√3)·2=−48≠0; full rank is 3 | Pass |
| Decomposition definition/relative shrinking | Singletons; collapsed interval; whole ℝ | Piece diameters 0,2,∞; compact-point inverse images compact,compact,noncompact | Pass new Checks; compact pieces/properness retained |
| Spinᶜ determinant new Checks | Complex CP² lift and twist; Enriques torsion twist | 3h+2h=5h; t+2t=t, with distinct lifts since t≠0 | Pass; determinant is not injective on lifts |
| Quartic rational parameter existence | Open ball of radius ε>0 in coefficient space | Density supplies a ℚ(i) point at distance <ε; radius 0 gives no open neighborhood | Pass stated open-locus implication; no enumeration required |
| Degree-one normal-map definition | Identity on S⁴; degree-two sphere map | Degree coefficients 1 and 2; only 1 meets definition, and identity normal datum is the zero class | Pass identity boundary; local Checks absent (R06) |
| Controlled connectedness definition | Control space a point; nonextendible loop | All tracks have diameter 0<δ; an essential loop has no disk extension despite zero control diameter | Definition must retain relative extension, not smallness alone; R06 |
| Disk theorem group scope | Punctured factor sphere/dual in (RP³×I)#(S²×S²) with a ball removed | π₁=C₂, λ(f,g)=1, λ(g,g)=μ(g)=0; C₂ is good but neither 1 nor ℤ | Generality defect R04; include this case |
| Exotic-space headline statability | Native existential; standard smooth ℝ⁴ | Scratch signature: 0 errors; standard identity diffeomorphism supplies an inhabitant, so IsEmpty is false there | Missing headline R03; no proof-carrier obstruction |
| Supplier test | Groups 1 and ℤ | Needed L₅ coefficients 0 and ℤ; matching GT3d contracts on permitted main: 0 | R01, unresolved supply |
| Ownership test | TangentialBordism B1.7 and Four F6/F7 | Same χ=24,σ=−16 K3 and σ=−8 complement; two constructor owners instead of one | R02; keep B1.7 as supplier |
| Locator and shape audit | All three sampled targets; whole README | Exact sample locators 0/3; Needs lines 5; Check blocks 6; Examples/Dependencies pairs 8 | R05/R06; partial formatting repair |

There are **150 instance rows** above. I recomputed the form inverse, twisted-bundle basis change, E₈ minors, torus matrix products, Chern-number expansions, flat/coefficient dimensions and polynomial/Jacobian controls. Exact integer arithmetic gives QC=I, SAS⁻¹=B, (AB)³=−I, (AB)⁶=I, E₈ leading minors (2,3,4,5,4,3,2,1), both three-column Vandermonde determinants 2 and the displayed Enriques Jacobian minor −48. The exotic-space signature and its standard-atlas negative control were additionally checked by Lean. No computation here proves a source's global shrinking or gluing argument.

The headline inventory is: F1–F2 intersection/handle comparisons and homotopy classification; F3 disk embedding, controlled/proper products, smoothing/transversality, caps, realization and Freedman classification; F4 Spinᶜ existence/torsors, characteristic-surface and TOP Spin formulas, Pontryagin square and rank-three/four bundle classification; F5 all-base deformation, compactification/gluing and Donaldson diagonalization; F6 blowups, E(1), node monodromy and positive genus-one factorization; F7 quartic/K3 regularity, Lie-Spin filling, E(n), E(2)≅K3 and the Enriques free cover/quotient; F8 presentation realization, nonrecognition, form-isometry finiteness and exotic ℝ⁴. Rokhlin itself is imported from SpinGeometry/IndexTheory. The four retained explicit polynomial/freeness statements are statable and present. The broad intersection-form, characteristic-class, elliptic-fibration and gauge statements lack their assembled native geometric carriers; these are not replaced by free predicates. Exotic-space existence is the concrete exception to the file's missing-carrier explanation (R03).

Pinned libraries: Mathlib `6b7abb3c7686292736be2955bd3eb9ebf63b456a`; Tau Ceti `a91d3aafa8cd3e6bc33dfde0d7677ed0f1625039`. I opened these declarations and their surrounding hypotheses:

| Pinned file and line | Contract actually checked |
|---|---|
| `Mathlib/Geometry/Manifold/ChartedSpace.lean:141` | `ChartedSpace` contains an atlas, preferred charts and coverage/membership laws. It contains no Hausdorffness, second countability, compactness or nonemptiness axiom. |
| `Mathlib/Geometry/Manifold/IsManifold/Basic.lean:777` | `IsManifold I n M` supplies compatibility with `contDiffGroupoid n I`; the Euclidean model in R03 excludes boundary. |
| `Mathlib/Geometry/Manifold/Diffeomorph.lean:82` | `Diffeomorph` is an actual equivalence with smooth forward and inverse maps. Its identity gives R03's negative control. |
| `Mathlib/LinearAlgebra/Projectivization/Basic.lean:43`, 48, 60 | The projective carrier is the unit-scalar quotient of nonzero vectors; `mk` requires nonzero input. |
| `Mathlib/LinearAlgebra/Projectivization/Basic.lean:103`, 111 | `submodule` is the represented line; equality of representatives is equivalence by a unit scalar. This justifies the two-eigenspace freeness argument. |
| `Mathlib/LinearAlgebra/Projectivization/Basic.lean:193`, 201 | `map` requires an injective semilinear map and sends a represented vector to its image. It does not imply a free action. |
| `Mathlib/Algebra/MvPolynomial/Eval.lean:256` | Evaluation is a ring homomorphism on the native multivariate-polynomial carrier. |
| `TauCeti/LinearAlgebra/IntegralLattice/Rationalization.lean:114`, 118, 153, 177 | `ofIntegralForm` takes a symmetric form on a finite free additive ℤ-module; `carrierEquiv` and `integralForm_carrierEquiv` compare the original module and pairing with its rationalized lattice. |
| `TauCeti/LinearAlgebra/IntegralLattice/Signature.lean:72`, 78, 81 | Positive/negative indices are natural numbers; `signature` is the inertia triple. The roadmap correctly takes integer subtraction for the manifold's signed signature. |
| `TauCeti/AlgebraicTopology/Cohomology/Cup.lean:203` | `TopCat.singularCup` uses explicit coefficient pairing and Alexander–Whitney data in the indicated abelian monoidal category. It is not a manifold fundamental-class construction. |
| `TauCeti/Analysis/Fredholm/SardSmale.lean:468` | Critical values are meagre under completeness, second countability, Fredholmness and regularity at least (kernel dimension)²+1. This is not the sharp index-dependent finite-regularity theorem. |

The duplication search used `roadmaps grep`, direct object searches in both pins, main, board packages, and the supplied sibling heads. It covered projective zero loci and derivative maps, Spin/Spinᶜ and characteristic classes, Kuranishi/ASD data, shrinking/Whitehead spectra, blowups, nodes, cubic/quartic models and torus monodromy. No second declaration with one of FourManifolds' twelve fully qualified Lean names was found. The TangentialBordism duplication is mathematical ownership despite different names. Scheme-theoretic blowups and arithmetic surface families are not the smooth incidence-gluing construction. Main AffineMorseLefschetz A0 already owns the general projective zero locus; the concrete Enriques subset is an allowed simple specialization for a headline. K3Surfaces' open K1 consumes the concrete four-manifold comparison; EnriquesSurfaces explicitly leaves this topological example to FourManifolds (`TauCetiRoadmap/EnriquesSurfaces/README.md:28`). Those general algebraic-surface roadmaps do not license rebuilding their generic carriers here.

For upstream shape and ownership I read main ComplexTori, AffineMorseLefschetz and the relevant IntegralLattices sections. The resolved supplier cuts are below. Each path is `TauCetiRoadmap/<name>/README.md`; “main” is the allowed main edition, and “open” is the supplied new-roadmap head. These checks distinguish finding a heading from proving all its targets.

| Supplier | Resolved section / concrete contract |
|---|---|
| AlgebraicTopology, main | Stages 2–4/6/8; 1703–1756 supplies the exact end predicates, stable-image groups, proper Whitehead theorem and proper deformation-retraction rectification. Both ordinary homology and supported cohomology are retained in Four's use. |
| CharacteristicClasses, main | C1.2a S0–S5 at 331–408 contains the support diagram, proper pullback and collared-pair sequence; C2 at 550 and C3 at 720 own ordinary classes and Thom theory. No support-cochain theory is reassigned here. |
| AffineMorseLefschetz, main | A0 at 72–132 supplies the actual homogeneous-projective subtype, incidence and Jacobian comparisons; A4.0 supplies noncompact boundary/BM/support duality; A5/A6 supply weak hyperplane and Veronese comparisons. |
| GroebnerGeometry, main | G1 at 63–99 includes elimination, saturation and localization comparison. Four's projective/discriminant geometric comparison is additional work on that engine. |
| IntegralLattices, main | 0F at 562 supplies unimodular orthogonal splitting, not splitting of any nondegenerate integral submodule; 6A at 1643 supplies indefinite unimodular classification. H splits in the even branch; (1,1) is isotropic in the odd (1,1) form. |
| ComplexKahlerGeometry, main | K5 at 568 and K7.1 at 1407: common analytic estimates and native projective charts, topology and orientation. The atlas does not itself construct a hypersurface's fundamental class. |
| TopologicalKTheory, main | T1/T6 use the common Grassmannian/projective carriers and tautological bundles; T6.6 at 1091 has the smooth bundle comparison. The normalized KO complexification at 1263 is c(a)=2u², consistent with K3's complex index 2. |
| GeneralizedCohomology, main | G4.0b at 1082 constructs the smooth comparison on the same finite carriers; it does not introduce another complex projective quotient. |
| SpinGeometry, main | G4 at 395 supplies frame lifts; G6.7 supplies the untwisted quaternionic-kernel comparison. Its signed rank-zero convention is retained. |
| IndexTheory, open | I4 and I7.2/I7.5: signature is p₁/3; I7.5 at 851–874 supplies complex index = −σ/8 and σ=−16α, independently of FourManifolds or the bordism table. |
| StringOrientation, open | S1 at 80–99 supplies λ mod2=w₄, λ(ad V)=−2c₂(V), and the eight-connected λ map, including torsion bases. The RP²×RP² example uses λ, not just p₁=2λ. |
| SmoothBundlesConnections, open | B1.5 proper-submersion/Ehresmann theory, B1–B4 principal/connection and L² carriers, and B8.1–B8.3 Yang–Mills calculus resolve. The stated energy has no 1/2; specializing B to −tr matches Four's 8π² charge-one energy. |
| PseudodifferentialOperators, open | P5–P7 (Layer 5 at 843 onward) supply Sobolev mapping, parametrices, elliptic regularity and functional-calculus comparisons. Four retains its nonlinear gauge slices. |
| HomotopySpheres, open | §3C.1–2 at 477–483 supplies Hopf/Whitehead operations and signs; §4B at 648, §6C at 1115 and Stage 9 at 1246 supply the designated stable-space and low-stem theory. Four owns the particular finite-wedge coordinate comparison. |
| TangentialBordism, open | B1.7 at 494–550 supplies the duplicated examples (R02); B4.1 at 694–742 has exactly the signed cup-one equation Four uses; B3.2/B3.3/B3.4 supply Arf, Spin fillings and KO comparison. The current supplier has no return dependence on Four. |
| GeometricTopology, main | Handles, links and broad smoothing comparison exist. GT3d/e/g and the named refined contracts do not; the expanded open revision cannot substitute. R01. |
| HeegaardFloer, main | F0 at 161–169 names Fredholm splitting, Sard–Smale and the generic Fredholm-section package. Its detailed open revision is not treated as supply. Main has no explicit quantitative finite-q statement; that detail remains to be made precise within F0's named general target, not inferred from the pinned quadratic-threshold theorem. |
| SeibergWittenTheory, main | SW1 consumes Spinᶜ geometry; it is a downstream consumer, not the supplier of Four's construction. |

The five explicit Needs lines were checked individually: the decomposition/tower line uses local F3.1a and GT handles but does not repair GT's absent global contracts; the Spinᶜ line resolves to Spin G4, CC C2–C3 and AT8; the Fermat, elliptic seed and Enriques lines resolve their native polynomial/projective inputs and distinguish example-only later F4/F7 comparisons. Other dependencies occur in prose and the supplier table; R06 concerns missing target-local contracts, not a claim that there are no dependencies at all. No new upward edge was found among the resolved suppliers.

The source sample was **F6.0, F6.0a and F6.0b**. There are no extra locators explicitly flagged unverified in the README. All three lack an exact locator, so **0/3 can be certified at a supplied locator**. Retrieval reached the legal [AMS preview](https://www.ams.org/bookstore/pspdf/gsm-20-prev.pdf), but it ends at printed p.36 (`gompfstipsicz` line 1578). Its contents list blowups at §2.2 p.41 and E(1) at §3.1 p.67 (`gompfstipsicz` lines 15, 19); a table of contents is not those proofs. The preview does permit supplementary checks of homotopy classification at Theorem 1.2.25, pp.14–15 (line 728), realization at Theorem 1.2.27, p.15 (line 771), and the smooth simply connected definite-form restriction at Theorem 1.2.30, p.16 (line 801). It does not replace reading Donaldson's primary analytic proof.

The other readable source checks were:

- `powellrayteichner` line 87: Theorem A, p.2, in arXiv v3, has good-group, algebraic-dual and framing hypotheses. Lines 112–116 supply the finite-group test behind R04. The conclusion includes geometric duals; this is not merely an unframed existence statement. [Read version](https://arxiv.org/abs/2006.05209v3).
- `freedmanquinn` line 3995: Lemma 7.7.1; line 4008: Corollary 7.7.2, pp.116–117 of the 2013 reformat, retains finite stable ends and actual proper h-cobordism data. The trivial-group application is within its hypotheses. Lines 4640, 4647, 4652 locate Theorems 8.17–8.19, pp.134–135, including the no-compact-components restriction for submanifold smoothing. These are reformat locators, not asserted original-edition numbers.
- `gabaietal` lines 45 and 71: Theorems 1.1 and 1.3, pp.1–2 in arXiv v2, distinguish stable smooth pseudo-isotopy from the subsequent π₄(TOP(4)/O(4)) vanishing. Lines 47–63 explain the repaired route; merely citing the older replacement criterion would not suffice.
- `farrelltaylorwagoner` line 752: Corollary 4.9, printed p.21, has both ordinary homology and compact-support cohomology isomorphisms, finite-dimensional locally finite CW complexes, and simple connectivity at infinity. The F3 opened-product application retains these. [Primary text](https://www.numdam.org/item/CM_1973__27_1_1_0.pdf).
- `quinn1988` line 23: unnumbered theorem, printed p.145, has a specified normal microbundle and relative isotopy support. This supports the distinction from purely local transversality; it is not a theorem about an arbitrary wild subset. [Institutional copy](https://webhomes.maths.ed.ac.uk/~v1ranick/papers/quinn1.pdf).
- `feehanleness` lines 666–709: §3.1, pp.16–17 in v1, gives the stabilizer-equivariant local Kuranishi model. Lines 275, 326, 347 and 360 locate Theorem 3 and Corollaries 5–7, pp.7–9: the base is closed connected oriented smooth; successive corollaries remove the base obstruction, stabilizer and local conformal-flatness restrictions. Four correctly labels the bubble-tree iteration, scale comparisons and overlaps as additional targets. The source does not certify that whole global programme. A fixed-point-formula issue is recorded below; the roadmap’s explicit projected equation avoids it. For F(v)=v+c and G=1, the source map gives v=v+c (impossible for c≠0); v−GF(v)=−c gives the correct root. [Read version](https://arxiv.org/abs/1910.14580v1).
- `kirbymelvin` lines 458–467: §2(c), printed p.99, footnote 3, identifies the rational elliptic regular-fibre complement in the Lie-framed T³ discussion and gives σ=−8, χ=12. The relative framing defect is −2·12−3·(−8)=0; this is not a nullbordism of the Lie stable framing. The roadmap leaves the actual boundary-frame comparison as a proof target, but its ownership must be corrected by R02.
- `tancer` lines 73, 76 and 131: Theorems 1–2 and Proposition 5, pp.2–3 in v2, provide fixed deficiency k, a smooth five-dimensional neighborhood and boundary rank 2k in the trivial-group branch. k=9 gives rank18 and form9H; no S⁴ recognition result follows. [Read version](https://arxiv.org/abs/2310.07421v2).
- `bastletal` line 427: Theorem 5.3, p.9 in v2, has characteristic square minus signature; Four's opposite sign gives the same value mod2 because the quotient is integral. Lines 598–645, pp.12–13, establish finiteness by a norm bound in the unimodular setting. Four's explicit trace bound is a separate valid spectral argument for any positive definite matrix; it is not quoted as that paper's literal formula. On Q=[2], Q′=[8], an isometry column v=2 gives 4=8·(1/2), testing the additional nonunimodular generality.

## Not verifiable

This is a completed review of this head, not a request to suspend the job. Source limitations do not erase the witnessed findings. No source manifest or pull-request file was edited, and no source text was copied into a deliverable. Missing texts were consolidated under stable work keys in the scratch missing-reference record.

- **The three seeded F6 targets:** neither an exact target locator nor the relevant chapters of Gompf–Stipsicz was available. The legal preview covers front matter and Chapter 1 only. I cannot certify the blowup/discriminant, fishtail/plumbing or cubic-pencil construction at a locator that the README does not give.
- **`donaldson1983` and `freedman1982`:** the sources service tried their DOIs and Project Euclid landing pages; it obtained no readable primary article. The textbook statements and readable FQ material do not certify the original proof steps, including Freedman's Corollary 1.2/§10 route.
- **`gompf1983`:** the exact cited Project Euclid PDF endpoint returned an Incapsula error page (`gompf1983` line 5), not the paper. Theorem 1.2 and the common six-handle neighborhood on pp.319–320 remain uncertified. The algebraic Donaldson contradiction was checked separately.
- **`kirbysiebenmann` and `leeslashof`:** the service did not resolve readable legal text; the latter citation does not identify specific papers or locators. The unstable immersion/compression and chart-integration route is not source-certified here.
- **`quinnends` and `marin`:** retrieval reached JSTOR landing pages without readable text. The precise line-normal-neighborhood theorem and stable-germ Definition 1.6 are not certified by the separately read Quinn transversality announcement.
- **`freedmankirby` and `rabin`:** no readable primary text was obtained through the service. Bastl's characteristic-number formula and Tancer's reduction were read independently, not silently substituted for those primary proofs.
- **`browder`:** the prior review recorded the publisher-only text as uncertified; that settled status is retained, and it is not requested again in the missing-reference record. Chapter V §2/V.2.6 remains locator-only.
- The general local-stabilizer continuation, global compatibility of finite-dimensional ASD reductions, all-bubble obstruction gluing, controlled shrinking and common smooth neighborhood construction are not proved by the instance table. Several still lack individual source allocations (R05). No assertion of full proof verification is made for them.

## Source issues

- **Misprint** in tancer at §1, printed p.2, line 52: the source indexes relator-word letters by the number of relations; it should index them by the number of generators; affects nothing.
- **Misprint** in tancer at Proposition 5(iii), printed p.3, line 135: the source describes H₂ as a free product of copies of ℤ; it should say free abelian group, or direct sum; affects a stated result.
- **Misprint** in feehanleness at Theorem 3, printed p.7, line 295: the source takes the bubble-connection norm over X; it should take that norm over S⁴; affects nothing.
- **Error** in feehanleness at §3.1, printed p.16, lines 690–694: the source proposes v↦G_A F⁺(A+τ+d_A^{+,*}v) as the fixed-point map for the projected equation; it should use v minus that expression; affects the proof.
- **Misprint** in bastletal at the proofs of Theorem 5.3 and Lemma 6.5, printed pp.9 and 12–13, lines 441, 602, 639: the source labels these results as propositions in the proof references; it should call them Theorem 5.3 and Lemma 6.5; affects nothing.
