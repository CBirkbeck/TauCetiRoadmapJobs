# Review of FourManifolds (pull request #936 at 0d8995f)
**Verdict:** needs changes

## R01 (P1) — The geometric-topology prerequisites are not supplied on main

**Location:** `TauCetiRoadmap/FourManifolds/README.md:263`, also 325, 461, 542. Claim: “GT3d's single K/Whitehead spectra” and the GT3e/GT3g normal, transversality and smoothing packages are inputs.

**Witness:** On main, `TauCetiRoadmap/GeometricTopology/README.md:357` starts diffeomorphism groups; lines 938–951 contain only three broad smoothing-comparison items. There is no GT3d surgery-spectrum package or GT3e/GT3g contract there.

This is material: the controlled obstruction uses negative K-groups, and F3.2 uses the quadratic L-groups and their Laurent splitting as supplied objects. The inspectable open GeometricTopology revision has additional material, but this brief expressly forbids taking a revision of an existing roadmap as a dependency. A citation resolver finding a name somewhere does not establish supply from the permitted edition. No matching declared gap is supplied.

**Repair:** Cite the precise contracts actually on main. For the additional K/Whitehead/L-group, normal-bundle and transversality contracts, identify their earliest permitted owners and declare precise supplier gaps, or place genuinely new targets with appropriate owners. Do not re-plan the generic theory under FourManifolds. Test the repaired contracts on both groups 1 and ℤ: in particular the cyclic application needs L₅(ℤ[ℤ])≅ℤ, whereas L₅(ℤ)=0. A contract mentioning only the latter cannot discharge the former.

## R02 (P1) — TangentialBordism and FourManifolds supply each other

**Location:** `TauCetiRoadmap/FourManifolds/README.md:796`–800 and 1256–1277. Claim: early FourManifolds examples supply TangentialBordism B3, and B3/B4 then supply FourManifolds F4.

**Witness:** `TauCetiRoadmap/TangentialBordism/README.md:40` and 503–509 at the supplied open head consume F7.0/F7.0b. FourManifolds lines 775 and 796 consume its B4 and B3.3 respectively.

These are two genuine supply directions, even though the proposed individual mathematical stages can be sequenced. TangentialBordism is entry 9 of the merge order and FourManifolds entry 119. Calling F7 “early” does not remove the roadmap-level cycle required to be absent by this review's contract. The mechanical checker missed it; its exact output is recorded below.

**Repair:** Move the independently constructed quartic K3 and Lie-spin E(1) complement to a single earlier supplier, and have both roadmaps consume that supplier. Preserve the examples and their proofs. Remove the return supply from FourManifolds to TangentialBordism. Check the resulting graph, and preserve the calibrations σ(K3)=−16, complex index 2, quaternionic index 1 and σ(E(1) minus a fibre)=−8. Moving the entire FourManifolds roadmap before TangentialBordism merely reverses which edge is upward.

## R03 (P2) — Enriques freeness is statable at the pins but omitted

**Location:** `TauCetiRoadmap/FourManifolds/Suggested.lean:25`–28; `TauCetiRoadmap/FourManifolds/README.md:1315`–1322. Claim: the projective subtype and descended free involution cannot be stated because the A0 carrier is missing.

**Witness:** A scratch copy elaborated a predicate `∀ v ∈ p.submodule, ∀ j, eval v (enriquesQuadric j) = 0` on native `Projectivization`, and the theorem that `enriquesProjectiveInvolution p ≠ p` on that predicate.

This is the actual projective zero set, using A0's stated carrier convention, not a free predicate or a substitute cone theorem. It needs no smooth atlas. Involutivity on all of CP⁵ does not test freeness on the cover: coordinate points are fixed by the former map and are outside the cover.

**Repair:** Keep a simple specialization of the projective zero-set predicate and state the headline fixed-point-free property on it, retaining preservation in the README API; correct the docstring's missing-carrier claim. The atlas, simply connected K3 identification and quotient geometry can remain explicitly unstatable. Test the distinction using [e₀], which is fixed but has quadric values (1,1,1), and a point with coordinate squares (−1,3,−3,1,0,0), whose quadric values are (0,0,0) and whose projective image is different. The proposed signature was elaborated at the specified pins.

## R04 (P3) — Remove the executable searches from the mathematical specification

**Location:** `TauCetiRoadmap/FourManifolds/README.md:1295`–1298 and 1359–1379. Claim: choose the first passing coefficient tuple by enumeration, and enumerate bounded integer matrices to decide isometry and homeomorphism.

**Witness:** Lines 1295–1298 require a height-ordered enumeration and termination; lines 1363–1367 require enumerating columns, testing matrices, and proving termination, soundness and completeness. These are computational algorithms, not background mathematics.

**Repair:** Retain the nonempty open coefficient locus and existence of a rational-coefficient model, the geometric classification, and the mathematical boundedness/isometry results. Remove executable enumeration and decision-procedure deliverables, including the effective triangulation/construction requirements in lines 1326–1346. The abstract nonrecognition theorem can remain a mathematical target with its precise hypotheses. On Q=Q′=[1], the retained bound is v²≤1 and the isometries are v=±1; on the quartic locus the retained conclusion is existence of a rational point, without selecting a first enumerated tuple. This is a mandatory principles repair despite its policy severity P3.

## R05 (P3) — Supply locators for the entire seeded sample

**Location:** `TauCetiRoadmap/FourManifolds/README.md:904`, 1005, 1066, 1145, 1168, 1205, 1248, 1264; bibliography at 1426–1436.

**Claim:** G0/G1/G2, the early blowup/node/cubic constructions, the K3 construction and the Lie-spin filling have source support through the final bibliography.

**Witness:** None of these eight targets supplies a theorem/section-and-page locator. The bibliography names Donaldson and Gompf–Stipsicz without mapping their statements to these targets. The folder contains no `sources.toml`.

**Repair:** Attach exact locators to the individual assertions, distinguishing source statements from new application arguments, and record every cited work under one key in the source manifest. In particular provide sources for all-base obstructed gluing and the boundary Lie Spin identification; a source for Donaldson's simply connected charge-one argument alone would not certify those larger claims. Check locators against the regressions H²_ASD=3 versus full H²=6 on S²×S², the obstructed charge-zero Q₈ example, and the distinction between Lie Spin structure and Lie stable framing. Unreadable texts are listed below, not guessed.

## R06 (P3) — Restore per-definition Checks and per-target dependencies

**Location:** `TauCetiRoadmap/FourManifolds/README.md:1`, 183–214, 757–775 and 1418–1424.

**Claim:** Dense construction paragraphs and the final general instruction to check examples are the roadmap's usable specification.

**Witness:** The README has zero `*Needs:*` lines, zero `### Examples`/`### Dependencies` subsections, and no per-definition three-item `**Checks.**` lists. The decomposition-space and Spinᶜ definitions illustrate the omission.

**Repair:** Use the required Summary, Scope and ownership, Conventions, Exact supplier contracts, How to read the build, ordered Layer, Examples, Dependencies, Downstream consumers and References structure. Preserve the mathematical content, but give each definition its API and at least three discriminating computations and each target its own dependencies. For Spinᶜ, distinguish CP² (w₂≠0 but W₃=0), S²×S² (w₂=0), and the Enriques torsion determinant (nonzero integral torsion although the free form is even). The existing final request to check examples supplies none of these values. Remove the process-only final sentence about separately tracked source allocations.

## R07 (P3) — Delete the derivative API and involution Check from Suggested.lean

**Location:** `TauCetiRoadmap/FourManifolds/Suggested.lean:46` and 103.

**Claim:** The explicit derivative formula and squaring the coordinate sign change belong among the headline acceptance theorems.

**Witness:** The former is the derivative API of the displayed polynomial; the latter checks that the chosen diagonal signs square to 1. Neither asserts smoothness of a model, freeness on the cover, or a classification theorem.

**Repair:** Delete `fermatQuarticMap_fderiv` and `enriquesProjectiveInvolution_involutive` from `Suggested.lean`; retain the derivative identity and involution computation in the README's API/Checks. Do not replace their `sorry` with proofs in that file. Keep the three nonzero-cone Jacobian-surjectivity targets and add R03's actual free-action headline. All five admitted statements were tried with one-tactic simplification/reflexivity/instance probes; none closed. This finding is based on their API/Check role, not a claimed successful one-tactic proof. At e₀ the first derivative is 4·proj₀; applying the sign change twice gives e₀, including at fixed projective points outside the cover.

## R08 (P3) — Reconcile the README names with the Lean acceptance file

**Location:** `TauCetiRoadmap/FourManifolds/Suggested.lean:38`–103 and `TauCetiRoadmap/FourManifolds/README.md:1248`–1322.

**Claim:** The two files identify the same named acceptance statements.

**Witness:** Of 12 declarations, only `ellipticQuarticSeedPolynomial` and `enriquesQuadric` occur by name in the README. Conversely `quarticKThree`, `ellipticEOne`, and `asdKuranishiReduction` are backticked own names absent from the Lean file.

**Repair:** Name the retained Lean definitions and headlines in the README. Express other construction targets as mathematical prose rather than backticked claims of declarations in `Suggested.lean`. Account in the module docstring for other unstatable headline results, notably the exotic ℝ⁴ construction, all-base gauge compactification/gluing, the Spinᶜ/bundle classification and elliptic-surface classification. After R07's deletions, mechanically check both name directions again. No lost section binder was found in the 12 elaborated signatures; renaming alone must not change their hypotheses.

## Verified sound

:robot: Independent AI review. I read the 1,436-line README and 109-line Lean file, compared all 12 elaborated signatures with their prose roles, and independently ran `lake env lean` on the specified module. It exited successfully with exactly five admitted-theorem warnings. The worker's gate reports every scanner, dependency check and targeted build passing. There are only three changed files, all in this folder: README, Suggested.lean and metadata. No worktree file was changed.

The required dependency command returned exactly:

```text
depcheck: 200 roadmaps, 1322 edges, 0 problem(s)
```

There was no UPWARD, CYCLE or moved line. R02 is a manually witnessed cycle omitted by that output, not a claimed tool failure. No source passage was copied into the deliverables. No sorry-defined data, `set_option`, forbidden imports, admitted examples or auxiliary files occur in the roadmap folder. FourManifolds is not an existing main-branch folder being re-planned; the defects identified here are repairable.

The following are adversarial instance checks, not proofs of every general theorem or certification of unreadable sources. Each row records an actual value, map or logical boundary. “Pass” means that instance is consistent. “Open” explicitly identifies a proof/locator that these computations cannot certify. In particular, no acceptance is inferred for the controlled-topology, continuation or gluing arguments from their numerical tests.

| Statement | Instances tried | Values computed on both sides | Result; change |
|---|---|---|---|
| Intersection form on torsion quotient (17–28) | S⁴; Enriques | Free ranks 0 and 10; torsion class pairs to 0 in ℤ; quotient removes the ℤ/2 summand | Pass; retain torsion before quotient |
| Signed signature convention (26–28) | H; −I₁ | Inertia (1,0,1) gives 1−1=0; (0,0,1) gives 0−1=−1 | Pass; integer subtraction essential |
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
| F3.1a disk boundary theorem | One disk/one dual; two disks | λ(fᵢ,gⱼ)=δᵢⱼ gives [1] or I₂; dual self/intersections 0 | Pass on algebra; embedding proof not certified |
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
| F5.G0 index/Hodge — product flat | Trivial connection on S²×S² | −6=0−3−3; full twisted H² dimension 6=3+3 | Pass; sampled target |
| F5.G0 flat chain projection | Harmonic self-dual/anti-self-dual product generators | P⁺ acts as 1 on the first 3 dimensions and 0 on the other 3 | Pass; chain map not quasi-isomorphism |
| F5.G0 degree-one comparison | Flat T⁴, exact curvature variation | ∫⟨da∧da⟩=0, hence ‖(da)⁺‖²−‖(da)⁻‖²=0; d⁺a=0 implies da=0 | Pass |
| F5.G0 Kuranishi derivative | x=0 at any ASD connection | κ(0)=0 and Dκ(0)=0; leading term is quadratic, not an arbitrary linear map | Consistent; analytic IFT/overlap proof open |
| F5.G0 two obstruction targets | Trivial product flat | Ambient dimensions 6 and 3; both actual charge-zero solution sets consist of flat connections | Pass distinction; zero-set comparison not ambient identification |
| F5.G0 Q₈ regression | Σ₂×Σ₂, i,j holonomy on first factor | [i,j]²=(−1)²=1; b₁=8,b₂=18,b₂⁺=9; index=−3(1−8+9)=−6 | Pass; sampled target |
| F5.G0 twisted Q₈ dimensions | Same representation | First factor adjoint H dimensions (0,6,0); product H¹=6,H²=24 with H²₊=12; 6−0−12=−6 | Pass; irreducible and obstructed for every metric |
| F5.G0 holonomy centralizers | Trivial, noncentral cyclic, Q₈ | Centralizers SU(2),U(1),{±1}; Lie dimensions 3,1,0 | Pass; nonabelian test included |
| F5.G1 metric derivative at flat point | F_A=0 | (D_gP⁺)[h]F_A=0 for every h, so metric variation adds rank 0 | Pass exclusion; sampled target |
| F5.G1 pointwise rank argument | Orthogonal nonzero images in su(2) of dimension 3 | rank(F)+rank(ψ)≤3; rank(F)≥2 forces rank(ψ)=1 | Pass linear algebra; continuation theorem source not certified |
| F5.G1 reducing-line argument | ψ=ω⊗σ with ω self-dual nonzero | Wedge with ω:Λ¹→Λ³ has rank 4; parallel σ puts F in a line orthogonal to itself, giving F=0 | Pass local algebra; global continuation remains open |
| F5.G1 derivative budget | Index bound N=5,s=3 | Minimum integer q=6 and ℓ=10 satisfy q>5, ℓ≥q+s+1 | Pass arithmetic; not interchangeable with native quadratic threshold |
| F5.G1 smooth residual comparison | Flat excluded, charge-one irreducible | Virtual index 5 on negative-definite base; a generic regular irreducible has H²=0 and dim H¹=5 | Consistent; source locator absent |
| F5.G2 small-curvature scaling | Zero connection; dilation x↦rx in dimension 4 | Curvature L² scales r⁴·r⁻⁴=1; zero connection has all displayed norms 0 | Pass critical scaling; sampled target |
| F5.G2 ideal strata | k<0, k=0, k=1 | Empty, flat-only, or charge-zero connection plus one charge-one bubble; total energy 8π²k | Pass boundary cases; general gluing proof not certified |
| F5.G2 projected inverse | Cokernel dimension r=3 at product flat | Unprojected image misses 3 dimensions; projection removes exactly those 3 | Pass obstruction requirement |
| F5.G2 reducible charge-one link | Negative definite simply connected base, c²=−1 | k=−c²=1; index 5, H⁰=1,H²=0 imply real H¹=6=complex dimension 3 | Pass; link S⁵/S¹=CP² with weight 2 effective action |
| F5 Donaldson bordism count | Q=−Iᵣ, r=0,1,2 | Number of unordered square −1 pairs 0,1,2; σ(M)+r=−r+r=0 | Pass headline sign/count |
| F5 unit-class orthogonality | Distinct classes u,v with squares −1 | Cauchy gives absolute pairing ≤1; equality implies u=±v; distinct pairs give pairing 0 | Pass; all unit classes form orthogonal basis when count is rank |
| F6 real blowup | Zero section; away from origin | Exceptional fibre RP¹=S¹; tautological line has monodromy −1; punctured projection has singleton fibres | Pass; real exceptional circle differs from complex sphere |
| F6.0 complex blowup | Blow up CP² once | χ=4,σ=0,c₁²=8; exceptional square −1; χ increases by 1 and c₁² decreases by 1 | Pass; sampled target lacks locator |
| F6.0 discriminant | Fermat degree d≥2 over ℂ | ∂ᵢF=d zᵢ^(d−1); common derivative zero forces every zᵢ=0 | Pass; coefficient d≠0 uses characteristic 0 |
| F6.0 coefficient-field negative control | Degree 2 in characteristic 2 | Derivative of Σzᵢ² is 0, unlike characteristic-zero test | Outside stated ℂ scope; do not generalize without hypothesis |
| F6.0a node coordinates | u=z₁+iz₂, v=z₁−iz₂ | uv=z₁²+z₂²; change-of-coordinate determinant −2i≠0 | Pass; sampled target |
| F6.0a nodal sphere | e(ν)=−2, double point sign ±1 | Self-intersections −2+2=0 and −2−2=−4 | Pass; positive sign is essential |
| F6.0a local fibres | t=0 versus t≠0 | Local central fibre two disks; nearby local fibre annulus; exterior neck gives Euler 1 versus closed torus Euler 0 | Pass; local annulus is not the whole torus |
| F6.0a monodromy | a·b=1; positive loop | A(1,0)=(1,0), A(0,1)=(1,1); reversed loop gives A⁻¹ with upper-right entry −1 | Pass convention |
| F6.0b cubic parameter count | Degree 3 homogeneous polynomials in 3 variables | Number of monomials C(5,2)=10; projective dimension 9 | Pass; coefficient space is not moduli |
| F6.0b base points | Two transverse cubics | Intersection number 3·3=9; a pencil has vector-space dimension 2, while nine independent point conditions would leave dimension 1 | Pass; forced ninth condition matters |
| F6.0b E(1) invariants | CP²#9(−CP²) | χ=3+9=12, σ=1−9=−8, F²=9−9=0, c₁=F | Pass; sampled target |
| F6.0b fibre/section | Exceptional section Eᵢ | F·Eᵢ=1; all coefficients of F characteristic modulo2 on diag(1,−1⁹) | Pass |
| F6.0b nodal count | Smooth torus fibres; twelve simple nodes | Smooth fibre χ=0, each node contributes 1, giving χ(E1)=12 | Pass assuming the asserted generic pencil exists |
| F6 torus matrix conventions | A,B,S as displayed | SAS⁻¹=B; (AB)³=−I; (AB)⁶=I | Pass; exact integer multiplication |
| F6 factorization length | Empty word; alternating length 12 | Classes 0 and 12=0 in ℤ/12; nonempty positive length is at least 12 | Pass; excludes erroneous lower bound on empty word |
| F7.0 quartic Chern numbers | Degree-4 hypersurface in CP³ | (1+h)⁴/(1+4h)=1+6h² through degree2; ∫h²=4 gives c₂=24,p₁=−48 | Pass; sampled target |
| F7.0 K3 signature/index | Complex orientation | σ=−48/3=−16; Â=48/24=2; quaternionic index 2/2=1 | Pass; signature/16=−1 |
| F7.0b fibre complement | Remove T²×D² from E1 | χ remains 12; σ remains −8; c₁ restricted from fibre class is 0; H⁴ of connected compact manifold with nonempty boundary is 0 | Pass numeric prerequisites; boundary Spin identification needs source |
| F7.0b Spin versus framing | Lie T³ | Rokhlin residue −8 mod16=8; 12ν has order2 in ℤ/24, while ΩSpin₃=0 | Pass distinction; not a proof of the marked boundary identification |
| F7 E(n) numerical formulas | n=1,2,3 | (χ,σ,b₂)=(12,−8,10),(24,−16,22),(36,−24,34); c₁=F,0,−F | Pass |
| F7 E(n) forms/parity | n=1,2,3 | I₁,₉; 2(−E₈)⊕3H; I₅,₂₉ have ranks 10,22,34 and signatures −8,−16,−24 | Pass; Spin exactly even n |
| F7 seed polynomial and coordinate lines | L₀,L₁; e₀; (1,1,1,1) | F vanishes on each line; gradient at e₀=(0,0,1,0); F(1,1,1,1)=4 | Pass |
| F7 seed critical-point exclusion | All coordinates nonzero; any coordinate zero | Multiplying derivative equations gives 81Πzᵢ³=Πzᵢ³, hence 80Πzᵢ³=0; zero propagates to all coordinates | Pass; no nonzero critical point |
| F7 residual pencil | H²=4,H·L₀=1,L₀²=−2; L₀·L₁=0 | (H−L₀)²=4−2−2=0; (H−L₀)·L₁=1 | Pass fibre/section classes |
| F7 quartic nodal count | Smooth elliptic quartic | χ=24 and regular torus χ=0 imply 24 simple-node contributions | Pass if genericity proven; coefficient search removed by R04 |
| F7 quartic connectedness/E(2) comparison | Smooth parameter path; n=2 | Both endpoints have χ=24,σ=−16,Q=2(−E₈)⊕3H | Necessary invariant agreement; not proof of diffeomorphism; atlas/path theorem remains a target |
| F7 Enriques quadrics | Squares (−1,3,−3,1,0,0) | Moments −1+3−3+1=0; −1+6−9+4=0; −1+12−27+16=0 | Pass nonempty common zero set |
| F7 Enriques Jacobian | Three supported coordinates versus four | Vandermonde(1,2,3) determinant 2; support≤3 forces squares 0; every nonzero zero has ≥4 supported coordinates and derivative rank3 | Pass; uses ℂ and distinct tᵢ |
| F7 Enriques projective freeness | Eigenvalues ±1 | Fixed points must lie in one of the two 3-coordinate blocks; each block's Vandermonde kernel is 0 | Pass headline; add signature R03 |
| F7 Enriques quotient invariants | Cover degree2 | χ=24/2=12,σ=−16/2=−8,b₂=10; H⊕−E₈ has rank10, signature−8 | Pass; H₁=ℤ/2 and torsion canonical class needed separately |
| Fermat polynomial/map definitions | 0,e₀,(1,1,1,1) | Values 0,1,4; evaluation agrees with Σvᵢ⁴ | Pass two native declarations |
| Fermat derivative formula | 0,e₀ | Derivatives 0 and 4·proj₀ on both sides | Mathematically consistent; API padding R07 |
| Fermat surjectivity headline | e₀ versus 0 | Derivative ranks 1 and 0; v≠0 excludes latter | Pass |
| Elliptic seed map/surjectivity headline | e₀ versus 0 | Derivative ranks 1 and 0; all-nonzero branch excluded by 81≠1 | Pass |
| Enriques quadric declaration | j=0,1,2 at e₀,e₅ | Values (1,1,1) and (1,6,36); neither point is on cover | Pass finite indexing; no out-of-range j |
| Enriques linear/projective map definitions | v=e₀+e₃ and v=e₀ | First maps to −e₀+e₃, a different projective point; second maps to −e₀, same projective point | Pass; ambient map is not free |
| Enriques Jacobian-surjectivity headline | Above four-coordinate zero; origin | Nonzero-zero derivative rank3; origin rank0 | Pass; both hv and hz actually in Lean signature |
| Enriques involutivity theorem | e₀+e₃,e₀ | Two applications multiply each coordinate by (±1)²=1 | Consistent Check; padding R07 |
| Presentation manifold realization | Empty presentation; ⟨a∣a,a⟩; ⟨a∣ ⟩ | π₁=1,1,ℤ; for second m−n=1 and b₂(boundary)=2 | Pass; executable construction requirement R04 |
| Nonrecognition reduction | Trivial branch k=9; nontrivial branch | Trivial branch b₂=18,σ=0,even form 9H; other branch π₁≠1 cannot be #9(S²×S²) | Pass logical separation; no sphere-recognition claim |
| Isometry bound | Q=Q′=[1]; empty matrix | v²≤1 gives candidates −1,0,1 but equation v²=1 retains ±1; rank0 has one empty isometry | Bound consistent; executable enumeration R04 |
| Kirby/KS formula | +1 unknot; +E₈ plumbing | For [1], x=1 gives (1−1)/8+0=0; E₈ has x=0 and KS=8/8=1 | Pass; division is integral before mod2 |
| Exotic ℝ⁴ construction | K3 form split as 3H⊕2(−E₈) | Removing 3H leaves rank16,signature−16,even definite 2(−E₈); −I₁₆ is odd | Obstruction consistent; common-neighborhood construction source unreadable |
| R01 supplier test | Trivial/cyclic surgery | Required L₅ values 0 versus ℤ; main GT does not state the cited calculation | Fail ownership contract; R01 |
| R02 order test | TangentialBordism and FourManifolds | Positions 9<119; edges 9→119 and 119→9 make a directed 2-cycle | Fail supply direction; R02 |
| R03 missing-carrier test | Native projective common zero set | Scratch definition and fixed-point-free signature elaborate with 0 errors | Fail absence justification; R03 |
| R05 locator test | Eight seeded targets | 8 targets, 0 attached exact source locators; 0 exact sample certifications | Fail locators; R05 |
| R06/R08 form/name test | Whole README and 12 declarations | 0 Needs lines; 0 per-definition Check lists; 2/12 Lean names in README | Fail shape/name agreement; R06/R08 |

There are **144 rows** above, including all eight seeded targets, every Lean declaration, the headline numerical/convention tests, and the targets touched by findings. They do not replace proofs of the open construction steps expressly marked in the table. Integer matrix calculations independently gave QC=I, the twisted-bundle diagonalization, SAS⁻¹=B, (AB)³=−I, (AB)⁶=I, and the E₈ leading minors. The two Enriques tests use actual projective points; no arbitrary-topology carrier was introduced.

The headline inventory read from the README is: intersection/handle and homotopy classification (F1–F2); disk embedding, controlled and proper products, smoothing/transversality, caps, realization and Freedman classification (F3); Spinᶜ lifting, the TOP Spin KS/signature relation, Pontryagin square and rank-three/four bundle classification (F4); all-base ASD reductions/compactification/gluing and Donaldson diagonalization (F5); blowups, E(1), monodromy and positive genus-one factorization (F6); K3, the Lie-spin filling, E(n), E(2)≅K3 and the Enriques cover/quotient (F7); presentation realization, nonrecognition and exotic ℝ⁴ in the last section. Algorithmic deliverables are separately addressed by R04. Rokhlin is an imported theorem and a calibration, not a second owned proof.

At the pins the three explicit Jacobian-surjectivity statements are present. R03 exhibits a missing statable headline. The native manifold/cohomology/gauge carriers required for the remaining broad classifications were not found in the relevant pinned geometry/topology APIs; the file honestly avoids asserting them through free predicates. Its docstring nevertheless does not individually account for all the unstatable headlines just listed (R08). The 12 `#check @...` results matched the supplied signature audit: all three nonzero-vector hypotheses and the three-quadric vanishing hypothesis are present, with no dropped typeclass or section variable. The source file needs only `import Mathlib`.

I opened the following pinned definitions/declarations, rather than inferring their contracts from names. Pins: Mathlib `6b7abb3c7686292736be2955bd3eb9ebf63b456a`, Tau Ceti `a91d3aafa8cd3e6bc33dfde0d7677ed0f1625039`.

| Pinned file and line | Actual declaration/contract checked |
|---|---|
| `Mathlib/Geometry/Manifold/ChartedSpace.lean:141` | `ChartedSpace` has an atlas, preferred charts and chart-source/atlas membership. It does **not** contain Hausdorffness, second countability, compactness or nonemptiness. The README adds its smooth-manifold separation/countability conventions separately. |
| `Mathlib/LinearAlgebra/Projectivization/Basic.lean:42` | `projectivizationSetoid` is the unit-scalar orbit relation on nonzero vectors. |
| `Mathlib/LinearAlgebra/Projectivization/Basic.lean:48` | `Projectivization` is that quotient; line membership and a zero-set predicate do not require a smooth atlas. |
| `Mathlib/LinearAlgebra/Projectivization/Basic.lean:60` | `Projectivization.mk` explicitly requires a nonzero vector. |
| `Mathlib/LinearAlgebra/Projectivization/Basic.lean:193` | `Projectivization.map` takes an injective semilinear map; no surjectivity or freeness is built in. |
| `Mathlib/LinearAlgebra/Projectivization/Basic.lean:201` | `map_mk` agrees with applying the linear map to the representative. |
| `Mathlib/LinearAlgebra/Projectivization/Basic.lean:216` and 221 | `map_id`, `map_comp` supply the generic functor laws; these do not assert a free action on a zero locus. |
| `Mathlib/Algebra/MvPolynomial/Eval.lean:256` | `MvPolynomial.eval` is polynomial evaluation as a ring homomorphism. |
| `TauCeti/LinearAlgebra/IntegralLattice/Rationalization.lean:114` and 118 | `ofIntegralForm` requires an additive group, finite free ℤ-module and symmetric bilinear form, and returns a lattice on ℚ⊗M. |
| `TauCeti/LinearAlgebra/IntegralLattice/Rationalization.lean:131`, 153 and 177 | Form base change, `ofIntegralForm.carrierEquiv`, and pairing compatibility use the same rationalized carrier. |
| `TauCeti/LinearAlgebra/IntegralLattice/Signature.lean:72`–81 | `sigPos`, `sigNeg`, `signature` are inertia indices and the triple (positive,null,negative), not a signed integer. |
| `TauCeti/Analysis/Fredholm/SardSmale.lean:468` | Banach-space critical-value theorem has completeness, second countability, Fredholmness and pointwise regularity ≥(dim ker)²+1. It is not the sharp finite-index budget requested by F5.G1. |

The object search included both pinned libraries, main, the board packages and the indexed open roadmaps, using `roadmaps grep` as well as local searches. In particular it searched polynomial/projective models, Spinᶜ, ASD/Kuranishi objects, holomorphic Morse theory, torus mapping classes, Bézout/Cayley–Bacharach, shrinking/Casson constructions and presentation theory. The Lean-name search found no competing declarations of the model/Jacobian names outside FourManifolds. The board's K3BlochGroups package consumes the F7 boundary-framing calibration; it does not construct a second example. FourManifolds is a reasonable owner of its explicit four-dimensional models and nonlinear SU(2) analysis. Scheme blowups, generic projective zero loci, linear Yang–Mills calculus and abelian Seiberg–Witten theory are different owned objects and should remain citations.

I compared main-branch SeibergWittenTheory, AffineMorseLefschetz and IntegralLattices (including its completed base) for ownership and roadmap organization. The broader K3Surfaces and EnriquesSurfaces open files concern families/general surfaces, while the former explicitly consumes FourManifolds' concrete quartic example. No second generic projective carrier is justified by that distinction.

The supplier audit resolved these named cuts. File references in this table are all `TauCetiRoadmap/<name>/README.md`; “open” means the supplied inspectable head, not an unspecified proposed revision.

| Supplier and edition | Locator resolved and ownership consequence |
|---|---|
| AlgebraicTopology, main | 1703–1756: Stage8.5 has the actual end predicates, stable-image groups, proper Whitehead criterion and proper deformation-retraction rectification. Ordinary stages 2–4/6/8 remain its chains, cup/duality and homotopy inputs. |
| CharacteristicClasses, main | 331–408: C1.2a S0–S5 contains support diagrams, proper pullback and the collared-pair comparison; C2 at 550 and C3 at 720 own Thom/ordinary classes. No new support cochain owner is needed in F3. |
| AffineMorseLefschetz, main | A0 at 69–110 defines the same native projective zero-locus carrier and family/Jacobian comparisons; A4.0 at 210 supplies boundary/noncompact duality; A5 at 494 and A6 at 535 supply hyperplane/Veronese comparisons. |
| IntegralLattices, main | 0F at 562 supplies integral unimodular splitting; 6A at 1643 supplies indefinite normal forms. Those are algebraic suppliers, not manifold realization or smoothability theorems. |
| ComplexKahlerGeometry, main | K5 at 568 and K6 at 1243 supply the stated linear elliptic/Hodge development; K7.1 at 1407 uses native projectivization and ratios as charts. |
| TopologicalKTheory, main | T1 at 163, T6 at 962 and the smooth comparison T6.6 are the cited bundle/projective interfaces; real normalization c(a)=2u² occurs at 1263. |
| GeneralizedCohomology, main | G4.0b at 1082 concerns the same smooth projective/Grassmannian carriers; G5.0 at 1375 constructs stable BSpin. |
| GroebnerGeometry, main | G1 at 63–101 supplies elimination, saturation and coefficient extension. Four's geometric incidence comparisons are applications; a second elimination engine would duplicate it. |
| SpinGeometry, main | G6.7 at 799 supplies untwisted quaternionic symmetries and kernel parity, specifically distinguishing arbitrary twists. |
| SmoothBundlesConnections, open | B1–B4 at 194–839 and B1.5 at 391 supply principal/associated bundles, connections and proper-submersion trivialization. B8.1–B8.3 at 1476–1590 expressly leaves nonlinear slices to Four. Its no-1/2 energy and Hessian factor 2 agree with F5. |
| PseudodifferentialOperators, open | P5 at 411, P6 at 600 and P7 at 658 provide Sobolev mapping, projected elliptic estimates/Fredholm theory and changes of order. Nonlinear gluing is not in those contracts. |
| IndexTheory, open | I4 at 432; I7.2 at 740 and I7.5 at 864: signature and untwisted Rokhlin/quaternionic comparison. The text expressly makes that comparison independent of Four examples. |
| StringOrientation, open | S1 at 63–99 contains the stable λ class, λ(ad V)=−2c₂(V), mod2 w₄ comparison and eight-connected classifier map. Hence torsion λ must not be inferred just from p₁/2. |
| HomotopySpheres, open | §3C.1–2 at 477–483 supplies Hopf/Whitehead operations; §4B at 648, §6C at 1115 and Stage9 at 1246 supply the named stable-space/low-stem inputs. The finite wedge coordinate calculation remains Four's. |
| TangentialBordism, open | B3.3 at 503–509 consumes the specified Four filling; B4.1 at 720–735 supplies the integral cup-one sign and mod2 operations consumed in F4. Both cuts exist; their supply directions conflict (R02). |
| GeometricTopology, main versus open revision | Basic handles/links and a broad TOP/PL comparison exist on main, but the named refined GT3d/e/g packages do not (R01). `brownGeneralizedSchoenflies` and `puncturedTorusImmersion` are visible in the open revision, which cannot substitute for main under this brief. |
| HeegaardFloer, main versus open revision | Main F0 at 161–169 names Sard–Smale and the generic Fredholm-section package. The open revision has the detailed sharp finite-k and parameter-linearization contracts cited in the PR description. Treat only main's actual scope as supply; its wording is much less specific. |

The citation resolver found no cross-roadmap names or Lean names “nowhere”; it searches main and all 432 indexed open pull requests, so this does not refute R01. It also said it had not checked library names against pins; the pinned declarations above were checked directly. Existing main-roadmap revisions were inspected for diagnosis, not accepted as new suppliers. No unlisted-roadmap placement is reported as a defect.

The seeded source sample was attempted in full: G0, G1, G2, F6.0, F6.0a, F6.0b, F7.0, F7.0b. There are no README locators marked “unverified” to add to that sample, and no manifest existed to provide alternate locators. None of the eight has an attached exact locator to certify (R05). Their numerical/degenerate tests are above. Seven other cited works were legally retrieved as readable text, permitting these additional source checks:

- `powellrayteichner` line 87, Theorem A, p.2: the good-fundamental-group disk theorem includes algebraic dual spheres, vanishing dual intersections/reduced self-intersections, and geometric duals in the conclusion; line 95 addresses the boundary framing. The roadmap's restricted 1/ℤ smooth-ambient application has those protections, but the source itself has greater generality.
- `freedmanquinn` line 3995, Lemma7.7.1, pp.116–117, and line 4008, Corollary7.7.2, p.117: finite stable ends and actual proper h-cobordism data are essential. The simply connected specialization in the README is consistent. Lines 4640, 4647 and 4652 locate Theorems8.17,8.18,8.19, pp.134–135; noncompact components and smooth boundary germs are retained in the roadmap. This checks the cited reformat numbering, not an assumed match to the original edition.
- `gabaietal` line 45, Theorem1.1, p.1, and line 71, Theorem1.3, p.2, in arXiv v2: the compact simply connected smooth pseudo-isotopy requires stabilization; π₄(TOP(4)/O(4))=0 is the subsequent result. Lines 47–63 explain the corrected proof route. No independent re-verification of that entire proof is claimed.
- `farrelltaylorwagoner` line 752, Corollary4.9, printed p.21: the proper Whitehead criterion uses both ordinary homology and compact-support cohomology, on finite-dimensional locally finite CW complexes simply connected at infinity. The README includes both tests and actual proper maps.
- `quinn1988` line 23, unnumbered theorem, p.145: transversality is to a specified normal microbundle and has a controlled relative isotopy. It does not give the same statement for a bare locally described subset; the README retains normal data.
- `tancer` line 73, Theorem1, p.2, and line 131, Proposition5, p.3, in arXiv v2: the nonrecognition reduction uses fixed relators-minus-generators k, a smooth five-dimensional neighborhood and boundary rank 2k in the trivial-group branch. This is not a statement about S⁴ recognition. Two source slips are recorded below.
- `bastletal` line 427, Theorem5.3, p.9 in arXiv v2: the characteristic-class Arf formula has numerator self-intersection minus signature; the README's opposite numerator is equal modulo2 because the quotient is an integer. For E₈ both give 1, and for CP² with a line both give 0. This supports the characteristic-number formula, not the missing primary locators for G0–G2 or F6/F7. The author-page URL timed out, so this check uses the explicitly identified arXiv version.

## Not verifiable

The following limitations concern text/proof verification, not a request to pause this review. The verdict and all findings above are final for this head. No source manifest was edited. Retrieval failures, including successful downloads that were merely error pages, were consolidated in the job's missing-reference record using stable work keys.

- **All eight seeded targets:** no exact theorem/page locator is supplied. In particular I cannot certify a source for the all-base flat Maurer–Cartan comparison, global ASD local-stabilizer continuation, all-charge obstruction gluing, finite coefficient genericity arguments, or marked Lie-spin boundary calculation from an unallocated bibliography. The table verifies their displayed test cases, not the missing source proof.
- **`donaldson1983`:** DOI and Project Euclid article/PDF endpoints tried. The downloaded “text” contains only an Incapsula failure (`donaldson1983` line 5), not the article. Thus no theorem/page verification of this primary gauge-theory source was possible.
- **`gompfstipsicz`:** the service resolved an AMS chapter; the AMS book page/preview was also located. No readable full text of *4-Manifolds and Kirby Calculus* was obtained. The roadmap does not give chapter/page allocations for the sampled constructions.
- **`freedman1982`:** DOI and Project Euclid PDF endpoint tried; the direct result was an error page. Corollary1.2, p.366, and §10 were not certified from that article. The independently readable FQ text does not silently count as reading it.
- **`gompf1983`:** the exact README Project Euclid PDF URL returned an Incapsula error page (`gompf1983` line 5). Theorem1.2 and the six-handle/common-neighborhood construction on pp.319–320 remain unverified.
- **`kirbysiebenmann`:** the sources service found no readable legal copy for the named book/Essay V.
- **`leeslashof`:** the roadmap names authors and an immersion/compression theorem without identifying the papers or locators. The service did not resolve a readable text from that information.
- **`quinnends`:** the service resolved *Ends of Maps I* to the JSTOR landing page and obtained no readable legal article. §3.4's precise line-normal-neighborhood specialization was not certified.
- **`marin`:** the service resolved *La transversalité topologique* to JSTOR and obtained no readable legal article. Definition1.6 and the stable-germ generality were not certified.
- **`freedmankirby`:** the named characteristic-surface argument resolved to an AMS proceedings landing page but not readable primary text. Bastl's displayed consequence was checked separately, with its limitations stated above.
- **`rabin`:** the DOI led to JSTOR, without readable legal text. The group-theoretic simulation/normal-form proof route was not certified; Tancer's reduction was independently read.
- **`browder`:** the service marked *Surgery on simply-connected manifolds* uncertified because it resolved only to a paywalled publisher. Chapter V §2, especially V.2.6, remains a locator-only citation, not a new missing-text request.
- The global shrinking, normal-approximation, finite-regularity continuation and singular gluing constructions are substantial proof programmes. The instance table cannot certify their full parameter, support and overlap assertions, especially without target-specific sources. No claim that all those general results have been proved or source-verified is made here.

## Source issues

- **Misprint** in tancer at §1, printed p.2, line 52: the source indexes the relator-word alphabet by the number m of relators; it should index the alphabet by the number n of generators; affects nothing.
- **Misprint** in tancer at Proposition5(iii), printed p.3, line 135: the source calls H₂ a free product of 2k copies of ℤ; it should say direct sum, or free abelian group of rank 2k; affects a stated result.
