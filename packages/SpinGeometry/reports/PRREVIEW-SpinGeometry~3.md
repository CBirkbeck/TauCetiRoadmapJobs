# Review of SpinGeometry (pull request #1674 at a04aefa)

**Verdict:** needs changes

## R01 (P1) — Break the reciprocal supplier dependencies

**Location:** `TauCetiRoadmap/SpinGeometry/README.md:1548`, also lines 132–154, 723, 840 and 1391: “GeneralizedCohomology G5.5 consumes Spin G1.3's trace but is independent of Spin G6.0.”

**Claim:** Ordering individual targets within mutually dependent roadmaps suffices to give the required direction of supply.

**Witness:** Main `TauCetiRoadmap/GeneralizedCohomology/README.md:1908` consumes SpinGeometry G1.3; SpinGeometry G6.0 consumes G5.5. Main `CharacteristicClasses/README.md:911` consumes G4.1a; G4.3 consumes C3.5. Main `RiemannianGeometry/README.md:1337` consumes G3.4; G6.4 consumes R7.

These are three actual reciprocal roadmap pairs, not missing implementations or declared supplier gaps. The report of zero mechanical dependency problems does not remove these explicit edges. The previous R01 is **not repaired**.

**Exact repair:** Move the early shared trace, frame adapters and exterior-module/connection comparisons to earlier foundation owners, or split geometric foundations from the later Dirac/index development. Repoint both ends of every pair to the resulting single earlier owner. Preserve the existing mathematical targets. Test the repaired graph by listing its roadmap edges: with trace owned by an earlier foundation F, the two relevant edges become F → GeneralizedCohomology and GeneralizedCohomology → the Dirac consumer, with no edge back to F. Apply the same test to the frame and exterior comparisons.

Also replace G5.0/G5.1's blanket `G4` needs with their actual G4.1–G4.4 inputs. Taken literally, line 1035 includes G4.4a, which needs G5.3, which needs G5.1. The build-guide qualification does not make that blanket dependency accurate. Moving the extension as in R02 and narrowing these needs resolves this local cycle too.

## R02 (P2) — Place the skeletal extension in SpinGeometryPartII

**Location:** `TauCetiRoadmap/SpinGeometry/README.md:882`: “Skeletal frames and low-rank stabilization (G4.4a)”.

**Claim:** The new skeletal classification, stabilization equivalence and integral rank-two comparison extend the existing roadmap in place.

**Witness:** Main `TauCetiRoadmap/SpinGeometry/README.md:395` already owns principal lifts and their classification; line 504 starts its spinor/square-root development. G4.4a is absent there and is added by this PR.

The mathematics of the TS², circle and torsion examples survives the adversarial checks below. The defect is the binding extension-placement rule, not a counterexample to that mathematics. The previous R04 is **not repaired**.

**Exact repair:** Move the new comparison into `SpinGeometryPartII`, introduce it by stating where the base roadmap stops, and import SpinGeometry G4.2–G4.4/G5.3, AlgebraicTopology §8.9, SpinRepresentations Layer 2 and CharacteristicClasses C7.3. Do not reproduce the base roadmap's constructions. Retest TS²: e=2, w₂=0, one lift, and a framed stabilization, while the unstabilized tangent bundle remains nontrivial. These values are unchanged by the ownership move. This repairable addition does not warrant rejecting the inherited roadmap as a whole.

## R03 (P3) — Finish the target locators and source record

**Location:** `TauCetiRoadmap/SpinGeometry/README.md:882`, 965 and 1106; references at line 1550. G6.0 begins “Real Clifford-linear analytic index”.

**Claim:** The attached references identify the source support for every target.

**Witness:** G4.4a, G5.0 and G6.0 have no attached theorem/section/page locator; the folder has no `sources.toml`. Kirby's author-hosted Chapter IV, printed pp.33–34, supports the skeletal comparison (`kirby` line 1115).

Most Nicolaescu locators added elsewhere are correct; this is a **partial repair** of previous R05. Broad Chapters I–II and ABS §§6/11 do not identify the source of the complete real analytic-index construction. G6.7 expressly limits its Nicolaescu reference to representations, which is appropriate; its analytic deductions must remain distinguished from that source statement.

**Exact repair:** Attach exact locators to these targets and record the three referenced works, plus the chosen skeletal source, in `sources.toml` under stable keys. For G4.4a, Kirby's *The topology of 4-manifolds*, Chapter IV, pp.33–34, is a legally available alternative; distinguish the supplied general obstruction machinery from the source's discussion. Identify the exact real regular-module and analytic-index passages, or explicitly give the derivation from precise supplier targets with a source for the geometric comparison. Record paywalled texts as uncertified rather than claiming verification. The corrected skeletal locator passes the same TS² test: stabilization is essential because e(TS²)=2≠0 although w₂=0. Adding a locator changes neither this calculation nor the real-line right action C₊²=1.

## Verified sound

:robot: Independent AI-assisted review. I read both reviewed files in full, compared all eleven prior findings, and reviewed all 28 target subsections, including the unchanged material. The worktree was not edited. The repository-root README and CONTRIBUTING supplied the normative guidance; the parent-directory paths named in the local instructions were absent. Main examples inspected were Completed/HopfRinow, Completed/OrthogonalL2Bases and RiemannianGeometry.

The mathematical computations below are finite adversarial tests and proof-route checks, not a claim that a collection of examples proves every planned theorem. No new mathematical counterexample was found in the sampled target formulas. Scope includes arbitrary algebraic multiplicity modules, general numerable lifts, low ranks, all Clifford factors, real and complex adjoints, and untwisted versus twisted operators; it does not replace the general theory with special examples.

**Previous findings, checked first.** “Repaired” here refers to the particular prior finding, not approval of the folder.

| Previous finding | Present passage and disposition |
| --- | --- |
| R01 reciprocal suppliers | README:1548 “G5.5 consumes Spin G1.3's trace” — **not repaired**, current R01. All three pairs were re-resolved on main. |
| R02 admitted/restricted evaluation | Lean:65 “`theorem multiplicityEvaluation_exists [FiniteDimensional ℂ S] [Nontrivial S]`” — **repaired**. E has no finite-dimensional restriction; evaluation is an existential theorem, not admitted data. |
| R03 missing trace/headlines | Lean:75 `cliffordScalarTrace_exists`; docstring:10–31 names the missing geometric carriers — **repaired** for the trace and the enumerated geometric headlines. |
| R04 extension placement | README:882 “Skeletal frames and low-rank stabilization” — **not repaired**, current R02. |
| R05 exact sources | README:242 “Proposition 12.1.19, pp. 630–631” — **partly repaired**. Correct attached locators now cover most targets; current R03 identifies the remaining omissions. |
| R06 commit-pinned links | README:150 uses the repository-relative GeneralizedCohomology G5.5 link — **repaired** for all seven forbidden blob links. The independent supply-direction defect remains. |
| R07 TeX fragments | README:62 places the adjoint equality in a code span; README:1300 does the same for the symbol triple — **repaired**; gate tex=0. |
| R08 import header | Lean:1 “`import Mathlib`” — **repaired**; no other imports. |
| R09 shape/API/Checks | README:603–626 supplies Hermitian-module API, a locator, Needs, and three computed Checks — **substantially repaired** across all 28 targets and six layers. The overbroad G4 dependencies remain under R01. |
| R10 old API padding | The right-action, generator-relation, frame-contraction and quaternionic wrapper declarations are absent; Lean:6 selects evaluation, trace and intrinsic chirality — **repaired**. The five remaining admissions survived the basic one-tactic probes. |
| R11 names/documentation | README:452–468 names all retained chirality declarations; Lean:3–31 supplies the prescribed module explanation — **repaired**. All eleven declaration names occur in the README and all retained declarations have docstrings. |

No last-repair report marking a finding “not actionable in this package” was supplied or present among this job's prior-review artifacts; these are outstanding prior defects, not overrides of a settled disposition.

**Gate and elaboration.** The supplied gate at this exact head passes every listed rule, including build, dependency check, stray-files and outside-folder. Independent `git diff --stat origin/main...HEAD -- . ':!TauCetiRoadmap/SpinGeometry'` produced no output. There is no `set_option`, admitted data, admitted example, route-specific shortcut or computational-algorithm target in the reviewed files. No copied passage was identified in the source portions compared.

The required dependency command returned, in full:

```text
depcheck: 205 roadmaps, 1562 edges, 0 problem(s)
```

There was no UPWARD, CYCLE or moved line. R01 records explicit reciprocal citations the mechanical output does not report; no tool or merge-order file was changed. All 28 Needs lines and the supplier/downstream paragraphs were read. An absent merge-order entry was not treated as a defect. No declared gap was found.

The original `Suggested.lean` elaborated under the pinned defaults with exactly five `sorry` warnings and no errors. A separate copy with `#check @name` for **all eleven declarations** also elaborated. I compared every displayed type with the README and the worker's signature extraction: no required binder was lost. In particular S is finite-dimensional and nonzero in evaluation, E is arbitrary, trace retains finite-dimensional real V and the negative-metric equation, and chirality retains its orthonormal basis and concrete geometric-action hypothesis. The algebraic chirality targets allow infinite-dimensional S exactly as README:469 states. Zero S is allowed; 1=0 in its endomorphism ring makes the appropriate relations valid rather than contradictory.

On another scratch copy, each of the five admissions was replaced by `solve | simp | rfl | infer_instance`; all five failed to close. The existing raw Clifford-volume results were also read: they require the orthogonality/span inputs and transport through the representation and the complex normalization, so they are not an exact one-lemma proof of the displayed signatures as written. The matrix-category equivalence does not itself state the pure-tensor evaluation law. No remaining padding finding is based merely on a short eventual proof.

**Headline inventory and acceptance coverage.** G1 reaches the metric/Fock dictionary, compatible positive metrics, arbitrary-module evaluation and faithful scalar trace; G2 reaches intrinsic chirality, Hodge/exterior and graded-product comparisons; G3 reaches smooth Clifford modules and compatible connections; G4 reaches lift existence/classification, metric independence and skeletal stabilization; G5 reaches real/complex spinors, products and plane roots; G6 reaches intrinsic Dirac operators and symbols, closed domains/chiral adjoints, square/Lichnerowicz formulas and vanishing, exterior realization, compact-support symbols, the KO analytic class/products and the four-dimensional quaternionic index comparison. The file states the evaluation and trace headlines plus three intrinsic-chirality assertions. Its docstring individually accounts for the geometric headlines and the Fock/Hodge/graded-comparison carriers. I found no additional missing headline that could be stated at these pins with only a few simple native-carrier definitions; this is not a claim that arbitrary encodings could not express them.

**Adversarial values (113 rows).** The rows separate the mathematical laws being tested; “retain” means that instance found no defect. Matrices act on column vectors. A and B denote the unit-plane Fock matrices `[[0,-1],[1,0]]` and `[[0,i],[i,0]]`; Γ=diag(1,−1). Unless stated otherwise, bases are oriented, generators have square −1, and analytic global conclusions use closed bases. Tests outside the stated real/complex setting (finite characteristic, DVRs, zero coefficient ring) are not inputs of these targets.

| Statement | Instances tried | Values on the two sides / negative control | Result; change |
| --- | --- | --- | --- |
| Conventions: curvature | Unit sphere tangent plane | R₁₂e₂=e₁; R₁₂e₁=−e₂; sectional curvature 1 and Scal(S²)=2 | retain |
| Conventions: Clifford sign | Unit e and v=0 | c(e)²=−Id=Q(e)Id; c(0)²=0=Q(0)Id | retain |
| Conventions: symbol | c(e)=i, ξ=1 | σgeom=i; σF=i²=−1; σF(D²)=1=ξ² | retain |
| Conventions: complexification scalars | v⊗1, z=i | comm(i·(v⊗1))=i⊗v=i·comm(v⊗1) for the specified right action | retain |
| G1.1 positive/negative dictionary | One negative generator | (ie)²=1; positive bivector maps to −e₁e₂ with square −1 on both sides | retain |
| G1.1 conjugation direction | Spin plane, positive bivector at θ=π/4 | Positive action sends e₁ to −e₂; image cosθ−sinθ e₁e₂ in negative algebra also sends e₁ to −e₂ | retain |
| G1.1 rank-zero branch | V=0 | Cl=ℝ; native Spin has cardinality 1, geometric μ₂ cardinality 2 | retain |
| G1.2 polarization pairing | Unit v, Jv | gℂ(v¹⁰,v⁰¹)=1/2; hℂ(v¹⁰,v¹⁰)=1/2; hJ(v,v)=1 | retain |
| G1.2 three CAR relations | Exterior plane, E=εw and I=ιw | E²=I²=0; EI+IE=Id; hence A²=B²=−Id and AB+BA=0 | retain |
| G1.2 Hermitian slot convention | v=e₁,w=Je₁ | hJ(v,Jv)=i; 2hℂ(v¹⁰,(Jv)¹⁰)=i | retain |
| G1.2 rescaling | T=diag(1,√2) | T ε T⁻¹=√2 ε; T(−2ι)T⁻¹=−√2ι; pullback Gram=diag(1,2) | retain |
| G1.2 skew adjointness | Plane A,B | A†=−A, B†=−B; replacing B by Id gives Id†=Id≠−Id | retain |
| G1.3 conjugation/star | Scalar i and real generator e | κ(i)=−i; native star(i)=i; negative adjoint(i)=−i and adjoint(e)=−e | retain |
| G1.3 anti-multiplicativity | Orthogonal e₁,e₂ | (e₁e₂)*=−e₁e₂=e₂*e₁*; an unreversed product gives +e₁e₂ | retain |
| G1.3 compatible metrics | Irreducible plane and S⊕S | h and 3h work; −h is not positive; multiplicity Gram diag(1,2) is allowed and not scalar | retain |
| G1.3 multiplicitySpace definition | S=ℂ,E=ℂ; then plane S | Scalar T:z↦az gives T(bs)=bT(s); conjugation sends i to −i and is not complex-linear | retain |
| G1.3 Morita evaluation headline | V=0,S=ℂ,E=ℕ→₀ℂ | T determined by x=T(1); e(1⊗T)=x; inverse x↦1⊗(z↦zx) | retain; prior R02 repaired |
| G1.3 evaluation, zero and identity | E=0 and E=S | Both sides zero in the first case; e(s⊗Id)=s in the second | retain |
| G1.3 matrix-unit counit | S=ℂ²,j=1,T=Id | E₁₁T(e₁)=e₁; E₂₁T(e₁)=e₂; ΣEᵢ₁xᵢ is ordinary evaluation | retain |
| G1.3 finite multiplicity dimension | dim S=2, dim multiplicity=3 | dim E=6=2·3; zero multiplicity gives 0=2·0 | retain |
| G1.3 normalized regular trace | n=0,1,2,3,4,8 | tr L₁=1,2,4,8,16,256; dividing by 2ⁿ gives τ(1)=1 each time | retain; prior R03 repaired |
| G1.3 trace cyclicity | Negative plane a=e₁,b=e₂; then a=b=e₁ | τ(ab)=τ(ba)=0; second case both −1 | retain |
| G1.3 negative trace positivity | a=1+e₁+2e₂ | τ(a*a)=1+1+4=6; regular trace is 24, so 24/4=6 | retain |
| G1.3 semidefinite radical | Q=0 on a real line | e≠0, e²=0, τ(reverse(e)e)=0; null set is span(e), the radical ideal | retain |
| G1.3 positive-form star distinction | Q(e)=1 | τ(reverse(e)e)=1; τ(native-star(e)e)=−1 | retain |
| G1.3 scalar extension/invariance | Negative line a=2+3e; e↦−e | τ(a)=2=τ(2−3e); τℂ(i⊗a)=2i; τℂ(κ(i⊗a))=−2i | retain |
| G1.3 grading converses | a=1+e | involute(a)=1−e, neither a nor −a; pure 1 is even and e odd | retain; coefficient 2 invertible |
| G1.3 reverse dual action | Plane A,B | Dual generators Aᵀ=−A, Bᵀ=B; their squares remain −Id | retain |
| G1.4 central labels | n=1, c(e)=−i or i | ω=ic(e)=1 or −1; projectors (1,0) or (0,1) | retain |
| G1.4 odd/even orientation | Ordered (e₁,e₀) | ψ(ie₁)=ie₀e₁=−ie₁e₀=−Γ; plus odd factor is minus half-spin | retain |
| G1.4 centrality/square | n=3 | ω=−e₁e₂e₃; raw volume square 1; ω²=1 and [ω,eⱼ]=0 | retain |
| G2.1 chirality definition/square | Plane; n=0,4,8 | iAB=diag(1,−1), square Id; remaining normalized squares 1,1,1 | retain |
| G2.1 basis/orientation | Rotate plane; reverse one vector | Rotation gives same Γ; reversal gives −Γ=diag(−1,1) | retain |
| G2.1 anticommutation | Plane A and zero-space v | ΓA=[[0,−1],[−1,0]]=−AΓ; v=0 gives 0=0 | retain |
| G2.1 Hermitian/native stars | Plane volume i e₁e₂ | Hermitian adjoint Γ=Γ; complex-linear native star Γ=−Γ | retain |
| G2.1 positive/negativeSpinors | Plane; V=0; S=0 | Eigenspaces span(1,0),span(0,1); then (S,0); then (0,0) | retain |
| G2.1 complement/projections headline | Plane | (Id±Γ)/2=diag(1,0),diag(0,1); sum Id, product 0 | retain |
| G2.1 geometric-action predicate | Negative line c=i, bad c=1 | i²=−1 and i†=−i; 1²=1≠−1 and 1†=1≠−1 | retain |
| G2.1 signed zero orientation | σ=±1 | Γσ=±Id gives half ranks (1,0) or (0,1) | retain |
| G2.2 Hodge/chirality | Unit plane degrees 0,1,2 | Γ1=i e₁₂; Γe₁=i e₂; Γe₁₂=−i; formula i^(1+p(p−1))* gives same values | retain |
| G2.2 star-square | Plane 1 and e₁ | *²1=1; *²e₁=−e₁; combining phases gives Γ²=1 in both degrees | retain |
| G2.2 Chevalley evaluation | 1,e₁,e₁₂ | Images Id,A,AB; c(e₁)e₁=−1 maps to A²=−Id | retain |
| G2.2 Hilbert–Schmidt normalization | Plane Id | Ordinary norm²=tr Id=2; normalized norm²=1=exterior norm²(1) | retain |
| G2.2 two dual gradings | Plane | Induced dual Γᵀ=diag(1,−1); reverse-dual iAᵀBᵀ=diag(−1,1) | retain |
| G2.3 graded product | Two planes | Γ⊗Γ diagonal (1,−1,−1,1); half ranks (2,2) | retain |
| G2.3 mixed Clifford relation | A⊗Id,Γ⊗A | Anticommutator (AΓ+ΓA)⊗A=0; omitting Γ gives 2A⊗A≠0 | retain |
| G2.3 Koszul symmetry/unit | Two odd lines; rank-zero even line | Flip sign −1; double flip +1; unit grading leaves Γ unchanged | retain |
| G2.3 graded twist/evaluation | Purely odd A, dim A=1 | Tensor grading −ΓS; intrinsic grading ΓS; half ranks interchanged | retain |
| G3.1 Clifford bundle/product | Trivial negative line | (a+be)(c+de)=(ac−bd)+(ad+bc)e; rank-zero algebra fiber ℝ, unit 1 | retain |
| G3.1 norm/isometry | Reflection and dilation | e↦−e preserves norm²=1 and square −1; e↦2e gives norm²=4 and square −4 | retain |
| G3.1 equivariance/invariant tensor | Spin plane z=cosθ+sinθ e₁e₂, θ=π/2 | Conjugation sends eⱼ to −eⱼ; μ(z)c(eⱼ)μ(z)⁻¹=−c(eⱼ) | retain under smooth associated-bundle conventions |
| G3.2 module presentations | c=i on line; c=1; zero module | Universal generator square −1 passes; +1 fails; zero endomorphism ring has 0=Id and both laws 0=0 | retain |
| G3.2 sums/pullbacks/twists | Two copies of c=i; trivial line twist | diag(i,i)²=−Id₂; twist by 1 leaves i | retain |
| G3.3 compatibility | Constant c=i, trivial connection | ∇(is)=i ds=c(∇e)s+c(e)∇s | retain |
| G3.3 Hermitian is insufficient | B₀=diag(i,−i), c(e₁)=A | [B₀,A]=[[0,−2i],[−2i,0]]≠0 | retain negative control |
| G3.3 affine difference | Compatible scalar connection increments ia,ib | Difference i(a−b) commutes with c=i and is skew adjoint; noncommuting B₀ fails | retain |
| G3.3 curvature compatibility | Flat bundle | [Rᴱ,c]=[0,c]=0=c(Rⱽv) | retain |
| G3.4 exterior d and d* | ℝ: f=x²,h=x | d f=2x dx; d*(x dx)=−1; D(f,h)=(−1,2x) | retain |
| G3.4 square/pullback limit | Same pair; point | D²(f,h)=(−2,0)=−(f″,h″); point operator 0, line operator i∂ need not vanish | retain |
| G4.1a covering/kernel | Spin(2): z=i,−1 | z²=−1,1; kernel {1,−1}; Spin(1) and geometric Spin(0) also two-point covers | retain |
| G4.1b differential | θ↦2θ | Derivative 2, inverse 1/2; composite differential 1 | retain |
| G4.2 lift data | Base point | One lift isomorphism class; automorphism group has 2 elements; Boolean existence retains neither automorphism | retain |
| G4.2 metric map | g′=4g | B=4Id, B⁻¹/²=Id/2; g′(e/2,e/2)=1, whereas g′(2e,2e)=16 | retain |
| G4.2 pullback/smooth lift | Trivial lift on circle pulled back to point | Fiber remains μ₂ with 2 elements; each sheet over a smooth interval is a smooth copy of that interval | retain |
| G4.3 obstruction both ways | Plane bundles over S² with e=1,2 | w₂=1,0; lift counts 0,1; TS² is not framed despite the latter lift | retain |
| G4.3 cocycle normalization | Trivial transition lifts | Product 1·1·1=1, corresponding to additive obstruction 0 | retain |
| G4.4 torsor | S¹ and T² | H¹ orders 2 and 4; twisting by ε twice adds 1+1=0 | retain |
| G4.4 direct sum/zero unit | m=0,n=1 | μ₂×μ₂ modulo diagonal μ₂ has 2 elements, maps isomorphically to Spin(1); trivial zero lift is unit | retain |
| G4.4 nontrivial zero twist | S¹ flat central line | Holonomy −1; twice twisted holonomy (−1)²=+1 | retain |
| G4.4a orientation model | Trivial positive-rank bundle on connected circle | π₀O(n) has 2 elements=H⁰(S¹;F₂); orientation fixes one component | retain; move under R02 |
| G4.4a skeletal quotient | Trivial rank-three bundle on S¹ | π₁SO(3)=Z/2 gives 2 skeletal classes=2 lift classes; automorphisms per lift Z/2 are absent from quotient | retain; R02/R03 |
| G4.4a fixed cochain vs class | Trivial bundle on a triangulated disc; boundary loop of winding parity 1 | One chosen frame has obstruction value 1 and cannot extend; H²(disc;F₂)=0 and changing an edge yields value 0 | retain |
| G4.4a stabilization | TS² | e=2, w₂=0; TS²⊕ε¹ trivial of rank 3; H¹(S²;F₂)=0 gives one class | retain; R02 |
| G4.4a pullback covers | SO(1) and SO(2) in SO(3) | Preimage of SO(1)={±1}; preimage of SO(2) circle with degree 2 | retain |
| G4.4a integral divisibility | H²=ℤ, e=1,2; H²=ℤ/2,e=1 | 2c=e has 0 solutions for e=1, c=1 for e=2; torsion case 2H²=0 so e=1 has no root | retain |
| G5.0 regular real spinors | n=0,1,2 | Fiber dimensions 1,2,4=2ⁿ; rank-zero parity σ gives even or odd real line | retain; add locator R03 |
| G5.0 positive right action | n=1 basis (1,e) | C₊=[[0,1],[1,0]], C₊²=Id; c₋=A, c₋²=−Id; C₊A+AC₊=0 | retain |
| G5.0 parallel/Spin equivariance | Constant external action, spin plane transition g | C₊(gs)=gC₊(s) since g even; ∇C₊=0 for induced connection | retain; e.g. g=−1 yields −C₊s both sides |
| G5.1 spinor ranks | n=1,2,4 | Chosen odd rank 1 vs faithful sum rank 2; even half ranks (1,1),(2,2) | retain |
| G5.1 lift twist | Two circle lifts | Spinor holonomies +1 and −1; fiber rank 1 in both | retain |
| G5.2 bundle product/K-class | Two planes and signed points | Half ranks (2,2), virtual rank 0=0·0; positive/negative point multiply a class by +1/−1 | retain |
| G5.3 square-root characters | θ=π/2 | E weight −1, S⁺ weight −i, S⁻ weight i; both squared −1; S⁻ is the weight-z root | retain |
| G5.3 curvature/root obstruction | e(E)=2 or 1 over S² | Root c₁=1 or nonexistent; dual c₁=−1; curvature Froot=FE/2 | retain |
| G6.0 real-module inner product | Constant sections s=e,t=1, A=Cl(0,1), unit volume | ⟨e,1⟩=−e; ⟨1,e⟩=e; conjugation gives (−e)*=e | retain |
| G6.0 norm comparison | A=ℍ, point s=1; A=M₂(ℍ), s=diag(1,0) | First scalar/module norm² both 1; second normalized trace norm²=1/2, module norm²=1 | retain; equality rightly not claimed |
| G6.0 closed domain/local branch | Periodic circle Fourier coefficients 1/k; open line | Σ1/k² finite but derivative coefficients 1 have divergent squared sum; on line local ellipticity holds while constant spinors are not L² | retain |
| G6.0 bounded transform | λ=0,1,−1 | F values 0,1/√2,−1/√2; F²−1=−1/(1+λ²) | retain |
| G6.0 scalar Lichnerowicz/vanishing | S², flat torus | Remainder 2/4=1/2 implies zero kernel; flat remainder 0 permits parallel constants | retain |
| G6.0 degree-zero calibration | Positive/negative point | Even/odd kernel lines give +1/−1; unsigned dimension gives 1 in both and is excluded | retain; locator R03 |
| G6.0 real circle/product classes | Periodic/antiperiodic circles | η/0; periodic product η²≠0; product with antiperiodic factor 0 | retain |
| G6.0 regular-module warning | n=4 and 8 | Volume-sign pieces give a−a=0 and 8b−8b=0, despite real dimensions 16 and 256 | retain |
| G6.0 complexification/Morita | n=4 class a; n=8 class b | c(a)=2u²; c(b)=u⁴; fixed dual multiplicity ranks 4 and 16 must be removed by Morita | retain |
| G6.0 n≡2 mod4 | Flat periodic T² | Complex chiral index 1−1=0; real class η² nonzero but c(η²)=0 | retain |
| G6.1 Leibniz/symbol | D=i∂; f=x and f constant | [D,x]s=is; constant commutator 0; σF(1)=−1 | retain |
| G6.1 minimal/maximal/H¹ | Periodic Fourier mode e^(ikx) | D eigenvalue −k; graph weight 1+k² equals H¹ weight; adjoint eigenvalue again −k | retain |
| G6.1 chiral blocks | D⁺=D⁻=2 | D(1,0)=(0,2); reverse block has adjoint 2; full index 0 | retain |
| G6.1 arbitrary grading/twist | Exterior circle parity; odd line twist | γ=diag(1,−1) anticommutes with A; odd twist changes γ to −γ, not the operator | retain |
| G6.2 square and curvature factor | Flat line; formal plane curvature B₀ | −∂²=∇*∇+0; full ordered curvature sum is 2c₁c₂B₀, half of it is c₁c₂B₀ | retain |
| G6.2 perturbed Dirac negative control | D′=D+Id | D′²−D²=2D+Id≠0; excludes arbitrary Dirac-type zero-order perturbations | retain |
| G6.3 spin curvature sign | Unit S² | R^S₁₂=−(1/2)c₁c₂; c₁c₂R^S₁₂=1/2 Id=Scal/4 | retain |
| G6.3 twisted term | Flat trivial W; plane F₁₂=i f Id | Extra term 0 first; second c₁c₂if=fΓ with eigenvalues f,−f, so scalar positivity alone is insufficient for twists | retain |
| G6.4 exterior operator | Circle f=x²,h=x locally | D=(−1,2x dx)=d+d*; square (−2,0)=Hodge Laplacian | retain |
| G6.4 distinct gradings/harmonics | Flat circle; point | Exterior harmonic degree ranks (1,1); point ranks (1,0,…); Γ1=i e₁₂ differs from parity(1)=1 | retain |
| G6.5 all circle/torus twists | Length 2π, T² | Spectra ℤ and ℤ+1/2; zero multiplicity 1,0; four torus shifts, only (0,0) has zero momentum | retain |
| G6.5 sphere low ranks | S¹,S²,S³ | Scal=0,2,6; periodic circle kernel 1, sphere kernels 0,0 | retain |
| G6.6 symbol inverse/support | ξ unit, ξ=0; base point vs ℝ | c(ξ)(−c(ξ))=Id; at 0 product 0, no inverse; zero sections compact only for closed base | retain |
| G6.6 phase homotopy | t=0,1 | Multipliers 1,i, each modulus 1; invertibility retained off zero | retain |
| G6.7 quaternionic square/dimension | J(z,w)=(−bar w,bar z); ℂ line | J²=−Id on ℂ², dimensions 2=2·1; line square is nonnegative \|a\|², never −1 | retain |
| G6.7 kernel/domain/phase | Flat T⁴; J′=iJ | Half-kernel complex dimensions 2,2; α=1−1=0; (iJ)²=i(−i)J²=−Id | retain |
| G6.7 KO sign | n=4, Γ=−ω₋ | Γ=+1 implies ω₋=−1; external volume on ε-even part also −1, selects a; c(a)=2u² | retain |
| R01 supply graph | Three named reciprocal pairs | Each has path length 2 from SpinGeometry back to itself; mechanical problem count 0 | fail; move ownership |
| R02 extension ownership | Main vs PR G4.4a | Main has 0 G4.4a sections; PR has 1; TS² e=2,w₂=0 on either placement | fail; move to Part II |
| R03 source coverage | Three target blocks; manifest | Attached locators for G4.4a/G5.0/G6.0: 0,0,0; source manifests: 0 | fail; add locators/record |

The regular-trace and raw-volume entries were independently recomputed with exact signed Clifford-monomial multiplication for ranks 0,1,2,3,4,8. The positive right-action square and left/right anticommutator were checked on every basis vector in ranks 1,2,4. The remaining rows give direct hand calculations, dimension calculations, or explicitly identified source/supplier formulas; the KO rows verify the specified coefficient conventions rather than independently prove Bott periodicity. None is represented as a Lean proof of the admitted headlines.

**Seeded source sample: all 15 requested targets.** The author-hosted Nicolaescu PDF has printed page numbers twelve below the PDF page numbers; all locators below use printed pages. Its numbering agrees with the README. Sources were fetched through the sources service. No manifest was edited. No additional README locator was explicitly marked unverified.

| Target | Source text actually inspected | Support and limits |
| --- | --- | --- |
| G1.2 | Nicolaescu Proposition 12.1.19, pp.630–631; `nicolaescu` line 29392, line 29423 and line 29450 | Even-dimensional Euclidean Fock model, √2 action and adapted basis. The README explicitly converts Hermitian slots. The native-action rescaling is its own comparison, checked by TεT⁻¹ and TιT⁻¹ above. Source square misprint recorded below. |
| G1.4 | Lemma 12.1.29 and Proposition 12.1.30, pp.634–635; `nicolaescu` line 29553 and line 29562 | Even-algebra map and two factors are present. Source orders the added generator first in the lemma but the product orientation last in the proposition; the README's explicit minus sign resolves that difference. |
| G3.2 | Definition 12.1.64(a1), pp.653–654; `nicolaescu` line 30304 | Skew-Hermitian real Clifford multiplication; source speaks of tangent/cotangent Dirac bundles. G3's general V-bundle version is a declared associated-bundle construction, not a claim that the source states that generality verbatim. |
| G3.4 | Proposition 12.2.1, p.657, proof p.658; `nicolaescu` line 30497 and line 30522 | Levi–Civita exterior module and d+d* identification; the normal-frame d* sign matches the line calculation. |
| G4.2 | §12.2.3, pp.668–669; `nicolaescu` line 30917 | Smooth oriented tangent lifts and their cocycles. The README correctly separates its general numerable-base extension and metric-square-root argument; these are not certified by this narrow locator alone. |
| G4.4 | Remark 12.2.28 and Exercise 12.2.29, p.669; `nicolaescu` line 30957 and line 30971 | Fixed-frame lift isomorphisms, central cocycle twisting, free transitive H¹ action. General bases and geometric rank zero use the explicit supplier conventions. |
| G4.4a | No target locator. Supplemental Kirby, Chapter IV, pp.33–34; `kirby` line 1115, line 1121, line 1131 and line 1168 | Supports skeletal frames, rank≥3 limitation, stabilization and comparison with lifts. This author-hosted book is not identified as the PR's unspecified pp.89–92 course notes. R03 remains. |
| G5.0 | No target locator | Algebraic right-action and rank-zero values checked independently. No text locator certifies the full real regular-bundle construction. R03. |
| G5.1 | §12.2.3 and Lemma 12.2.32, pp.670–672; `nicolaescu` line 31005, line 31041 and line 31054 | Associated spinor bundle, lifted connection and Clifford compatibility. The README distinguishes chosen odd factor from the source's doubled odd spinor module; ranks agree. |
| G5.2 | Graded-module discussion, p.633; `nicolaescu` line 29492 | Supplies graded algebraic module model. Bundle transport and virtual K-product are separately derived using the named suppliers. Signed rank-zero convention is additional explicit data. |
| G6.0 | No target locator; ABS §§6/11 unavailable in full text | Finite-Clifford operator suppliers and KO coefficient conventions were resolved, and the model computations are above. The entire analytic-index construction is not source-certified. R03. |
| G6.2 | Theorem 12.1.67, p.656; `nicolaescu` line 30412 and line 30422 | Precisely a connection-induced geometric Dirac operator; the ordered curvature sum and 1/2 full-sum factor agree. No arbitrary zero-order perturbation is admitted. |
| G6.3 | Theorem 12.2.33, p.673, and Exercise 12.1.68, p.657; `nicolaescu` line 31100 and line 30468 | Untwisted scalar term and Hermitian product-twist curvature term. The sphere sign was recomputed in the README's R convention. |
| G6.4 | Proposition 12.2.1, p.657; Example 12.1.25, p.633; `nicolaescu` line 30497 and line 29514 | Exterior Dirac and Hodge/chirality formula; no numerical signature theorem is claimed from these passages. |
| G6.7 | §12.1.8, pp.651–653; `nicolaescu` line 30201, line 30267 and line 30273 | Quaternionic half-spin models and labels. The source supports the stated representation input; the Sobolev restriction, kernel/cokernel and KO comparisons are additional targets with analytic suppliers, not assertions found on these pages. |

Additional source checks included G1.3's arbitrary twisting space (Corollary 12.1.22/Remark 12.1.23, p.632, `nicolaescu` line 29466), positive metric uniqueness (Proposition 12.1.27, p.634, line 29526), the orthogonal basis behind the trace derivation (p.629, line 29355), chirality (p.632, line 29473), the plane Hodge formula (p.633, line 29514), spin obstruction (Proposition 12.2.25, p.669, line 30950), and circle/torus examples (p.670, line 30984; p.673, line 31121). Arbitrary-E Morita evaluation is supported: the source does not impose finite dimension on its twisting space.

**Pinned library audit.** The checked repository identities were main `fa41b3747f56d4e77bd69e7099c1be4f2e4959ba`, Mathlib `6b7abb3c7686292736be2955bd3eb9ebf63b456a`, and Tau Ceti `a91d3aafa8cd3e6bc33dfde0d7677ed0f1625039`, matching the manifest pins. Library paths below are relative to the corresponding library root. The audit distinguishes algebraic carriers and lemmas from the geometric comparisons this roadmap owns.

| Opened declaration/file at pin | What it establishes; restriction checked |
| --- | --- |
| Mathlib `LinearAlgebra/CliffordAlgebra/Basic.lean:125`, `:263` | `comp_ι_sq_scalar` and `ι_mul_ι_add_swap` already provide the generator relations. They are consumed, not new headline admissions. |
| Mathlib `LinearAlgebra/CliffordAlgebra/Basic.lean:379` | `equivOfIsometry` is the existing algebraic isometry transport, not smooth bundle descent. |
| Mathlib `LinearAlgebra/CliffordAlgebra/Contraction.lean:351` | `equivExterior` is a linear equivalence requiring invertible 2; it is not an algebra equivalence. The real/complex targets meet this requirement. |
| Mathlib `LinearAlgebra/CliffordAlgebra/BaseChange.lean:182` | `equivBaseChange` points from the base-changed Clifford algebra to the scalar tensor Clifford carrier. The README correctly uses its inverse for the other direction. |
| Mathlib `LinearAlgebra/CliffordAlgebra/EvenEquiv.lean:48`, `:204` | `EquivEven.Q'` has carrier V×ℝ with negative added line; `equivEven` supplies the native algebra construction. The added vector is last, as the README says. |
| Mathlib `LinearAlgebra/CliffordAlgebra/Prod.lean:170` | `prodEquiv` has graded tensor-product codomain. An ordinary ungraded tensor product is not substituted. |
| Mathlib `LinearAlgebra/CliffordAlgebra/Star.lean:36`, `:50`, `:56`, `:60` | Native star is reverse(involute x), sends vectors to their negatives and fixes scalar coefficients. It does not conjugate complex scalars; the README's separate κ is necessary. |
| Mathlib `LinearAlgebra/CliffordAlgebra/Conjugation.lean:303`, `:311` | Existing even/odd-to-involute implications. G1.3 asks for the converses rather than pretending these lines supply an iff. |
| Mathlib `RingTheory/Morita/Matrix.lean:187`, `:205` | `ModuleCat.matrixEquivalence`, `moritaEquivalenceMatrix`; finite matrix index with a selected index, no finite-dimensional hypothesis on the arbitrary module. Pure-tensor evaluation and universe transport still require the proposed comparison. |
| Mathlib `LinearAlgebra/Trace.lean:75`, `:103`, `:190` | Native trace, cyclicity and trace of identity. Definition falls back to zero without a finite basis, so the trace headline's finite-dimensional Clifford setting matters. |
| Tau Ceti `RepresentationTheory/Spin/Polarization/CliffordAction.lean:230`, `:240` | Native `spinAction` and generator evaluation; the roadmap adds geometric metric normalization. |
| Tau Ceti `RepresentationTheory/Spin/Structure.lean:180` | `SpinPolarizationData.cliffordEquivEnd` under its finite-dimensional, invertible-2, even-dimensional polarized hypotheses. No second matrix-classification target is needed here. |
| Tau Ceti `LinearAlgebra/CliffordAlgebra/VolumeElement.lean:242`, `:260`, `:290` | Even raw-volume anticommutation on the span, its square and reversal. These are inputs to the normalized represented volume, not geometric Hodge identities. |
| Tau Ceti `LinearAlgebra/CliffordAlgebra/SignSwitch.lean:140` | Sign switching with an additional line; no inference that the two real full algebras are isomorphic in every rank. |
| Tau Ceti `Topology/Algebra/CliffordAlgebra/Spin/Covering.lean:52`; `Connected.lean:38`; `Compact.lean:265` | Native cover needs n≠0 and compactness; path connectivity covers n≥2. Neither claims the rank-zero geometric μ₂ convention or simple connectivity. |
| Tau Ceti `Topology/Algebra/CliffordAlgebra/Spin/Real/Projection.lean:78`, `:108`, `:175` | Native continuous units-range equivalence, SO-range projection and surjectivity. These do not provide a second arbitrarily chosen topology. |
| Tau Ceti `Geometry/Lie/CliffordAlgebra/Spin/Projection.lean:272`, `:301`; `Differential.lean:248` | Smooth projection and Lie-map identity, followed by the coordinate differential with its built-in polar-form factor 2. |
| Tau Ceti `Geometry/Manifold/LocalDiffeomorph.lean:414`; `Geometry/Lie/Subgroup/Embedded.lean:137` | Boundaryless inverse-function theorem and finite-dimensional real closed-subgroup construction. These support the smooth refinement and discrete rank-zero subgroup route. |
| Tau Ceti `RepresentationTheory/QuaternionicStructure.lean:68`, `:94` | Native predicate requires conjugate-linear square −Id and Spin intertwining; it includes neither finite dimension nor a Hermitian norm. Its bijectivity is already supplied; kernel parity still needs finite dimension. |

The declaration-name resolver found no unresolved cross-roadmap citation or Lean name, but explicitly said it had not checked external Lean names against pinned packages. I therefore did not treat that result as evidence about library existence; the pin reads above supply that evidence.

**Ownership and cross-roadmap resolution.** `roadmaps grep` was used for SpinGeometry references and for scalar-part traces, skeletal descriptions, regular Clifford modules, Bochner connections and quaternionic parity; `roadmaps show` was used to locate the named owners, followed by direct reads at main or the authorized new-roadmap heads. Existing-roadmap revisions were not used as new suppliers. The board package index contains AnalyticNumberTheory, AutomorphicCongruences, KatoEulerSystems, LawrenceVenkateshMethod and LogicAndDefinabilityInNumberTheory; the readable package README/plan search found no competing geometric-spin construction. No conflicting declaration name in another authorized roadmap was identified. Search hits from additional, unlisted PRs were not used to invent dependencies.

| Contract resolved | File/line read and ownership conclusion |
| --- | --- |
| SpinRepresentations L0–L4/L7/L9 and Layer 2 topology | Main `TauCetiRoadmap/RepresentationTheory/SpinRepresentations/README.md:427`, `:520`, `:596`. `SpinCompactTopologyFoundation` really supplies n≥3 simple connectivity, independently of the new skeletal comparison. The algebraic Fock/classification/periodicity ownership is retained there. |
| OrthogonalSpinGroups L0–L2 | Main `Completed/OrthogonalSpinGroups/README.md:331`, `:408`, `:610`. The archived main owner exists; the PR worktree also has its older active-folder path, so an active-folder search alone is not a missing-owner witness. |
| SmoothBundlesConnections B1–B5/B6.0 | Main `TauCetiRoadmap/SmoothBundlesConnections/README.md:315`, `:559`, `:605`, `:802`, `:936`, `:979`, `:1115`, `:1306`. Principal descent, associated bundles/metrics, frames, induced connections and invariant parallel sections are real contracts. In particular B3.3:941–944 supplies the invariant-tensor argument. |
| HopfRinow L1 | Main `Completed/HopfRinow/README.md:29`. Positive Levi–Civita connection and its Tau Ceti regularity are cited; no new Levi–Civita construction is assigned to SpinGeometry. |
| RiemannianGeometry R1/R5/R7 | Main `TauCetiRoadmap/RiemannianGeometry/README.md:117`, `:1333`. Curvature and real exterior Weitzenböck comparison exist. R7 expressly consumes SpinGeometry G1.2/G2.2/G3.4, producing R01. |
| DifferentialGeometry L0–L2/L5–L9 | Main `TauCetiRoadmap/DifferentialGeometry/README.md:268`, `:311`, `:341`, `:503`, `:782`, `:806`, `:816`, `:862`. Forms, orientation, integration and cohomology comparison are supplied, rather than replanned here. |
| ComplexKahlerGeometry K1/K4/K5a | Main `TauCetiRoadmap/ComplexKahlerGeometry/README.md:96`, `:444`, `:568`, `:596`, `:744`. Pointwise Gram/Hodge package explicitly precedes analysis; real-bundle complexification/fixed-space Sobolev comparison is present at :748. The scalar-only Hodge theorem is not being substituted for a bundle Dirac-domain theorem. |
| CharacteristicClasses C1/C3.5/C7.3 | Main `TauCetiRoadmap/CharacteristicClasses/README.md:213`, `:901`, `:1559`. Actual frame/rank-zero conventions, refined Čech lift cocycle, singular comparison under CW-type hypotheses and radial sphere stabilization are present. C3.5's consumption of G4.1a causes R01. |
| AlgebraicTopology Stages 2–6/§8.9 | Main `TauCetiRoadmap/AlgebraicTopology/README.md:1870`. Includes section/lifting obstruction cochains with local coefficients, difference realization and the fixed-cochain versus adjustable-class distinction. No finite-CW restriction is silently imported into G4.4a. |
| TopologicalKTheory T1–T4/T6.4/T7 | Main `TauCetiRoadmap/TopologicalKTheory/README.md:163`, `:401`, `:613`, `:754`, `:816`, `:1022`, `:1220`. Numerable classification, K-products, compact-support triples and continuous principal-bundle category exist. T7:1235–1268 pins raw-volume a/b and c(a)=2u²,c(b)=u⁴. |
| GeneralizedCohomology G5.5 | Main `TauCetiRoadmap/GeneralizedCohomology/README.md:1892`, `:1908`, `:1927`, `:1981`, `:1986`, `:1992`, `:2021`, `:2034`, `:2040`, `:2064`, `:2084`, `:2099`. All named real Hilbert/finite-Clifford comparison, functional-calculus, stabilization and index contracts exist, with the negative affiliated signature distinguished from positive external generators. Its SpinGeometry trace input causes R01. |
| PseudodifferentialOperators P1.0/P4–P6 | Authorized new-roadmap head `TauCetiRoadmap/PseudodifferentialOperators/README.md:151`, `:457`, `:769`, `:914`, `:1470`. Formal-adjoint/symbol core, canonical Bochner connection and elliptic mapping/regularity are actual targets. The connection-induced square formula respects its distinction between first-order and zeroth-order remainders. |
| TangentialBordism B3.0 | Authorized head `TauCetiRoadmap/TangentialBordism/README.md:1700`, `:1714`. Owns the geometric ABS/PT-to-real-Dirac comparison and consumes SpinGeometry's analytic class. It is not an input here. |
| IndexTheory I7.5 | Authorized head `TauCetiRoadmap/IndexTheory/README.md:854`, `:866`. Consumes untwisted quaternionic kernel parity and derives the numerical signature comparison. No reverse supplier edge is introduced here. |

The foundation/geometry ownership split otherwise makes sense by object: native Clifford/Fock/raw-volume algebra is consumed; this roadmap owns the metric-normalized representation comparisons, geometric bundles/lifts and their Dirac operators. General operator theory and topological KO classification remain with their named owners. R01 and R02 specify the ownership moves still needed; no such move was performed during this read-only review.

## Not verifiable

- **Full Lawson–Michelsohn Chapters I–II.** The DOI lookup did not yield a readable text. The legal publisher preview was then fetched; it has 45 PDF pages and ends in Chapter I §5, around printed p.32 (`lawson-michelsohn` line 1551). It does not expose Chapter II's spinor/Dirac material or certify the full G5.0/G6.0 construction. This is partial access, not full verification. The original missing entry was retained with this narrower explanation.
- **ABS §§6 and 11.** The sources service classified DOI `10.1016/0040-9383(64)90003-5` as paywalled/uncertified. No full text was read or requested past the paywall; it is not entered as a renewed missing-source request. Its coefficient conventions were checked against TopologicalKTheory's explicit contract instead.
- **Unspecified Kirby course notes pp.89–92.** No title/version was supplied. The legal author-hosted *The topology of 4-manifolds*, Chapter IV, pp.33–34, is readable and supports the central comparison, but is not silently identified with those notes. Its OCR includes a damaged fiber-restriction line; the verdict does not depend on deciphering that line.
- **Exact source certification of G5.0/G6.0 and the full analytic part of G6.7.** The record above verifies algebraic tests, actual supplier contracts and the source's representation input. It does not certify the whole Hilbert-module completion, real family-index classification or all Sobolev-kernel comparisons from a published passage. Missing locators are R03; supplied-but-unimplemented targets were not misreported as unowned gaps.
- **Scope of exhaustive verification.** The finite calculations do not certify arbitrary infinite-CW descent, all smooth parameter families, or every naturality/coherence theorem by example. Those proof routes and their stated inputs were reviewed; no completed proof of them exists in this roadmap acceptance file. No source-rendering utility was available for a fresh visual comparison of mathematical glyphs; ambiguous OCR bars were not used to raise an erratum.

## Source issues

The following issues were encountered in the readable Nicolaescu text. The roadmap generally avoids importing them. Witnesses: v=0 has square 0, not −Id; x=0 refutes the missing-factor chirality formula; real rather than complex tensoring doubles the real dimension. For simultaneous averaging, use h₁=1, ∇₁=d, h₂=e^(2x), ∇₂=d+dx with weight 1/2: at x=log2, dh=4dx but 2Ah=(5/2)dx. For the derivative sign take α=dx, X=x²∂x and Y=Z=∂x: the printed expression gives −4 and the corrected expression 0. H¹(S¹;F₂) has two elements; binomial(5,2)=10 is even for RP⁴.

- **Misprint** in nicolaescu at proof of Proposition 12.1.19, printed p.631: the source says every real vector acts with square minus identity; it should be minus its squared norm times identity; affects the proof.
- **Misprint** in nicolaescu at chirality discussion following Remark 12.1.23, printed p.632: the source says commuting chirality past a homogeneous element leaves only signed chirality; it should retain that element as a factor on the right; affects a stated result.
- **Misprint** in nicolaescu at Example 12.1.25, printed p.633: the source says the final spinor-dual tensor product is over the reals; it should be over the complexes; affects a stated result.
- **Error** in nicolaescu at proof of Proposition 12.1.65, printed p.654: the source says simultaneous affine averaging of compatible metrics and connections preserves compatibility; it should first fix the metric and then patch connections compatible with that metric; affects the proof.
- **Misprint** in nicolaescu at proof of Lemma 12.2.2, printed p.659: the source says the final iterated-vector-derivative term has a minus sign; it should have a plus sign from the dual-connection Leibniz rule; affects the proof.
- **Error** in nicolaescu at Example 12.2.31(c), printed p.670: the source says every sphere has a unique spin structure; it should exclude the circle, which has two, and specify the rank convention; affects a stated result.
- **Error** in nicolaescu at Example 12.2.31(d), printed p.670: the source says vanishing of w₂ for real projective space occurs only in dimensions congruent three modulo four; it should also include dimensions congruent zero modulo four, with low dimensions handled separately; affects a stated result.
