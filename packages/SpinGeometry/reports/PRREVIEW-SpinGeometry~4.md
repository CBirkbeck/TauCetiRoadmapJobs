# Review of SpinGeometry (pull request #1674 at 60cedda)

**Verdict:** needs changes

## R01 (P1) — Break the reciprocal roadmap dependencies

**Location:** `TauCetiRoadmap/SpinGeometry/README.md:1583`: “GeneralizedCohomology G5.5 consumes Spin G1.3's trace but is independent of Spin G6.0.” Also lines 840, 1277 and 1426.

**Claim:** The proposed target ordering gives the required single direction of supply between roadmaps.

**Witness:** Main `TauCetiRoadmap/GeneralizedCohomology/README.md:1908` consumes Spin G1.3; main `TauCetiRoadmap/CharacteristicClasses/README.md:911` consumes G4.1a; main `TauCetiRoadmap/RiemannianGeometry/README.md:1337` consumes G3.4. Spin consumes their G5.5, C3.5 and R7 respectively.

These three two-edge cycles remain at this head. The narrower G5.0/G5.1 needs repair the separate local cycle through G4.4a, but do not move any of these roadmap-level owners. The dependency tool's zero-problem output does not erase the explicit reciprocal contracts.

**Exact repair:** Move the shared trace, frame adapters and exterior comparisons to earlier foundation owners, or separate the geometric foundations from the later Dirac/index consumer. Repoint both ends to one earlier owner per object. Retest the witnessed graph: F → GeneralizedCohomology → Dirac consumer has no return edge to F; do the same for the frame and exterior pairs. Preserve the mathematical targets and the narrowed G4.1–G4.4 needs.

## R02 (P2) — Put the skeletal extension in SpinGeometryPartII

**Location:** `TauCetiRoadmap/SpinGeometry/README.md:882`: “Skeletal frames and low-rank stabilization (G4.4a)”.

**Claim:** The new skeletal classification and stabilization comparison belong in the existing roadmap.

**Witness:** Main `TauCetiRoadmap/SpinGeometry/README.md:395` owns principal lifts; line 504 starts spinor bundles and plane roots. Main has no G4.4a; this head adds it.

The added Kirby reference supports the comparison but does not repair the binding Part II placement rule. This is an extension-placement finding, not a false-mathematics finding or a reason to reject the inherited roadmap wholesale.

**Exact repair:** Move G4.4a into `SpinGeometryPartII`, explain where SpinGeometry stops, and import its G4.2–G4.4/G5.3 together with AlgebraicTopology §8.9, SpinRepresentations Layer 2 and CharacteristicClasses C3.2/C7.3. Retain the new source locator and all low-rank/torsion tests. On TS² the repaired placement still gives e=2, w₂=0, one lift, and a trivial rank-three stabilization, while the original plane bundle is nontrivial.

## R03 (P3) — Record the cited works in sources.toml

**Location:** `TauCetiRoadmap/SpinGeometry/README.md:1585`, References; missing `TauCetiRoadmap/SpinGeometry/sources.toml`.

**Claim:** The source record is complete after adding the target locators.

**Witness:** Four works are listed at README:1587–1599; the folder contains no sources.toml. The new G4.4a/G5.0/G6.0 passages now have source locators, and the readable passages support their stated roles.

**Exact repair:** Record Lawson–Michelsohn, Nicolaescu, Atiyah–Bott–Shapiro and Kirby under stable keys, reusing `nicolaescu` and `kirby` and matching the earlier source-service records for the other two works, with locators, version information and access metadata. Preserve any settled uncertified status rather than asserting full-text verification. This changes the source-record count from zero to four without changing C₊²=Id or the S² remainder Id/2. The reviewer has not edited a manifest.

## Previous findings

- R01 — partly repaired: README:1021 and :1054 narrow G4 to G4.1–G4.4, eliminating the local G4.4a cycle. README:1583 and the three main supplier contracts retain the reciprocal roadmap edges. Current R01 remains blocking.
- R02 — not repaired: README:882 still adds G4.4a inside SpinGeometry. Its new Kirby locator at :944 supports the mathematics but leaves extension ownership unchanged. Current R02 remains blocking.
- R03 — partly repaired: README:944, :1009–1019 and :1262–1275 now give precise source roles and derivations. No sources.toml exists for the four references; current R03 retains only that P3 defect.

## Verified sound

:robot: Incremental AI review of **56 changed lines since a04aefa**. I reviewed the changed passages, their mathematical dependencies and supplier citations, and all three previous findings. Unchanged adversarial results below are explicitly carried from [r3]. This is not a second full review. The PR worktree was not edited. Repository-root README and CONTRIBUTING were read; the instructed parent paths are absent. Main examples inspected were Completed/HopfRinow and Completed/OrthogonalL2Bases, alongside the relevant main supplier sections.

**Gate and elaboration.** The supplied gate passes, and an independent gate rerun passes all reported text/dependency/file checks. The separate targeted `lake build TauCetiRoadmap.SpinGeometry.Suggested` succeeds, reporting 8976 jobs and only five `sorry` warnings. Direct elaboration of Suggested.lean succeeds with the same five warnings. The diff outside SpinGeometry is empty and the worktree is clean. No changed passage introduces copied source text, a computational algorithm, a restricted shortcut, admitted data or an option override.

The required dependency command returned:

```text
depcheck: 205 roadmaps, 1563 edges, 0 problem(s)
```

There is no UPWARD, CYCLE or moved line. R01 supplies the independently verified reciprocal edges omitted by this output. Every Needs line and the supplier/downstream paragraphs were read; no declared gaps are present. The changed G5 needs now exclude G4.4a, so G5.1 → G5.3 → G4.4a is locally acyclic.

**Lean signatures and headlines.** Suggested.lean is byte-for-byte unchanged since a04aefa. A scratch copy with `#check @name` for all **11 declarations** elaborated; its types were compared with the README and the supplied signature extraction. No required binder disappeared. Evaluation retains finite-dimensional nonzero S and arbitrary E; trace retains finite-dimensional real V and Q(v)=−⟨v,v⟩; the three chirality theorems retain the orthonormal basis and geometric-action hypothesis. The six definitions remain concrete native-carrier definitions. No new admission or weakened substitute was added.

The README's headlines are the metric/Fock dictionary and Morita evaluation/trace; intrinsic chirality, Hodge and graded products; Clifford bundles/connections; spin obstruction, lift classification and skeletal stabilization; spinor bundles/products/plane roots; geometric Dirac symbols and domains; square and Lichnerowicz formulas with vanishing; exterior realization and compact-support symbol; real KO index/products and quaternionic four-dimensional kernels. The five retained Lean theorems state evaluation, trace and three chirality results. The module docstring names the geometric and comparison headlines and their missing carriers. The unchanged one-tactic audit is inherited from [r3]: `simp`, `rfl` and `infer_instance` did not close any admission; the raw-volume and Morita lemmas did not directly supply the represented normalized statements. No touched Lean statement requires a fresh padding probe.

**Source checks of the changed passages.** The sources service fetched the author-hosted Nicolaescu text dated February 21, 2026. Its printed pages run twelve below the PDF page numbers and its theorem numbering agrees with the README. The service also returned the legal author-hosted Kirby scan; its cached OCR text and provenance were read. No source passage is reproduced here.

| Changed target / dependency | Exact readable locator | Result and limit |
| --- | --- | --- |
| G4.4a | Kirby, Chapter IV, printed pp.33–34: kirby line 1115, line 1121, line 1131, line 1158, line 1168 | Skeletal frames, the n≥3 restriction, framed low-rank stabilization, principal covers and H¹ torsor are present. The added prose correctly assigns cellular/infinite-CW details and the integral Euler criterion to named suppliers. |
| G5.0 | Nicolaescu §12.1.2, pp.628–629, Exercise 12.1.15 and Example 12.1.18: nicolaescu line 29315, line 29351, line 29355, line 29377 | Real Clifford sign, exterior representation, symbol identification, adjoints and parity support the regular metric. Right-action self-adjointness is explicitly derived, not attributed to a nonexistent real-index theorem. |
| G6.0 / G6.1 | Proposition 12.1.66, p.655: nicolaescu line 30366, line 30370, line 30381 | Formal symmetry uses skew-adjoint multiplication and a compatible metric connection. It does not claim closed-domain self-adjointness; the README supplies that separate route. |
| G6.0 / G6.2 | Theorem 12.1.67, p.656: nicolaescu line 30412, line 30422, line 30440 | The connection-induced square has the increasing-pair curvature sum. The derivation applies to the full complexified real regular module. |
| G6.0 / G6.3 | Proof of Theorem 12.2.33, pp.672–673: nicolaescu line 31077, line 31082, line 31087, line 31094, line 31100 | The contraction uses only Clifford relations, pair symmetry and Bianchi. It does not require irreducibility or even dimension. Injective real inclusion descends the resulting identity. |
| G6.0 analytic-index route | GeneralizedCohomology G5.5; ComplexKahlerGeometry K5a; PDO P6; TopologicalKTheory T7, resolved below | These are actual named contracts. The README now distinguishes its derived real KO construction from the local source formulas; the remaining roadmap cycle is R01. |

Of the **15 seeded targets**, the changed G5.0/G6.0 passages and the G6.2/G6.3 formula dependencies were checked freshly as above. G1.1, G1.2, G1.3, G2.1, G2.3, G3.3, G4.3, G5.1, G5.2, G5.3 and G6.7 contain no changed mathematical statement or locator; their unchanged tests/source assessments are inherited from [r3], with the new G5.1 dependency restriction checked here. No added locator is flagged unverified. The new generalization to the regular module is justified by the opened proof, not by remembered theorem wording.

**Supplier and ownership resolution.** `roadmaps grep` searched the objects (skeletal Spin structures, regular Clifford modules, scalar trace and the regular-operator comparison), and `roadmaps show SmoothBundlesConnections` was used before direct main-section reads. The board package README/plan search found no competing owner for the changed geometric construction. Main was checked at fa41b3747f56d4e77bd69e7099c1be4f2e4959ba; existing-roadmap revisions were not substituted for main. Only the authorized new-roadmap heads supplied external contracts. Unlisted search hits were not used as suppliers. No new Lean name is introduced.

| Citation resolved this round | Repository-relative witness and conclusion |
| --- | --- |
| CharacteristicClasses C3.2/C7.3 | Main `TauCetiRoadmap/CharacteristicClasses/README.md:826`, :835 and :1559: top Stiefel–Whitney class reduces Euler, and radial sphere stabilization is actually supplied. |
| CharacteristicClasses C3.5 | Same file :901–935: spin-cover cocycle and w₂ comparison exist; its explicit G4.1a input is R01. |
| AlgebraicTopology §8.9 | Main `TauCetiRoadmap/AlgebraicTopology/README.md:1870`: obstruction/difference cochains, section version, adjustment and homotopy naturality; fixed cochain zero is distinguished from class zero. |
| SpinRepresentations Layer 2 | Main `TauCetiRoadmap/RepresentationTheory/SpinRepresentations/README.md:520`: n≥3 simple connectivity and rank-two cover. Algebraic ownership and the distinct n=0 generated group remain there. |
| SmoothBundlesConnections B2.1/B3.3 | Main `TauCetiRoadmap/SmoothBundlesConnections/README.md:559`, :936 and :941: actual associated bundles, complexification, induced connections and parallel invariant tensors. |
| GeneralizedCohomology G5.5 | Main `TauCetiRoadmap/GeneralizedCohomology/README.md:1892`, :1908, :1981, :1986, :1992, :2021, :2034, :2040, :2084 and :2099: real module norms, adjoints/regularity, functional calculus, stabilization and KO^(−n) classifier with finite-kernel comparison. Trace input produces R01. |
| ComplexKahlerGeometry K5a | Main `TauCetiRoadmap/ComplexKahlerGeometry/README.md:748–785`: actual real/complex bundle-distribution and Sobolev fixed spaces, isometric inclusion, conjugation and H^s_loc comparison. |
| TopologicalKTheory T6.4/T7 | Main `TauCetiRoadmap/TopologicalKTheory/README.md:1021` and :1220–1268: continuous principal/associated bundles, graded module quotient, raw-volume signs, η²≠0, c(a)=2u² and c(b)=u⁴. |
| PseudodifferentialOperators P1.0/P4–P6 | Authorized head `TauCetiRoadmap/PseudodifferentialOperators/README.md:151`, :460 and :1470: differential-operator core, Bochner-connection distinction, local parametrices and elliptic theory. |
| RiemannianGeometry R7 | Main `TauCetiRoadmap/RiemannianGeometry/README.md:1325–1347`: real exterior Weitzenböck comparison; its G1.2/G2.2/G3.4 input produces R01. |
| HopfRinow L1 | Main `Completed/HopfRinow/README.md:29`: positive Levi–Civita and regularity, rather than a second connection construction. |
| DifferentialGeometry and OrthogonalSpinGroups | Main `TauCetiRoadmap/DifferentialGeometry/README.md:268`, :782, :806, :816 and `Completed/OrthogonalSpinGroups/README.md:331`, :610: exterior/cohomological and algebraic-group foundations remain existing owners. |
| TangentialBordism B3.0 / IndexTheory I7.5 | Authorized heads `TauCetiRoadmap/TangentialBordism/README.md:1700–1720` and `TauCetiRoadmap/IndexTheory/README.md:854–875`: consume the real analytic class/quaternionic parity. Neither is imported backwards by the changed proof route. |

The new text elaborates existing G5.0/G6.0 constructions through these owners; it does not add a competing generic functional-calculus or associated-bundle theory. The independent new skeletal comparison still needs Part II placement under R02.

**Pinned declarations opened.** Pins match the preceding report: Mathlib 6b7abb3c7686292736be2955bd3eb9ebf63b456a and Tau Ceti a91d3aafa8cd3e6bc33dfde0d7677ed0f1625039. File names below are relative to those repositories.

| Declaration/file | Native content and limit |
| --- | --- |
| `CliffordAlgebra.comp_ι_sq_scalar`, `ι_mul_ι_add_swap`, `Mathlib/LinearAlgebra/CliffordAlgebra/Basic.lean:125`, :263 | Existing generator squares and polarization. The real negative-metric instance yields −\|v\|² and −2⟨v,w⟩; no new relation theorem is planned. |
| `CliffordAlgebra.equivExterior`, `Mathlib/LinearAlgebra/CliffordAlgebra/Contraction.lean:351` | Linear equivalence under invertible 2, available over ℝ and ℂ. It is not itself an algebra equivalence or metric bundle. |
| `CliffordAlgebra.instStarRing`, `star_def`, `star_ι`, `star_smul`, `Mathlib/LinearAlgebra/CliffordAlgebra/Star.lean:36–60` | Reverse after involute; vectors negate, scalar coefficients are fixed. Real adjoints in G5.0 are compatible; complex Hermitian adjoints require the separately specified conjugation. |
| `TauCeti.SpinPolarizationData.cliffordEquivEnd`, `TauCeti/RepresentationTheory/Spin/Structure.lean:180` | Existing finite-dimensional even polarized algebra classification; geometric normalization remains a comparison, not a new classification. |
| Private `scalarTrace`, `TauCeti/Algebra/Lie/GeneralLinear/Clifford.lean:57` | Search hit is matrix trace times a scalar embedded into a Clifford algebra, with domain matrices. It is not the Clifford-to-ℝ normalized faithful trace demanded here. |

The source and pin reads support the new right-action derivation: Rᵥ* = −Rᵥ and εRᵥ=−Rᵥε imply (Rᵥε)*=Rᵥε and (Rᵥε)²=\|v\|². Even left Spin multiplication commutes with both factors; the invariant-tensor theorem therefore gives parallelism for an induced principal Spin connection.

**Adversarial table.** Fresh exact signed-blade calculations tested the regular left/right actions on every basis vector in ranks 0–4 and the constant-curvature contraction. Remaining fresh entries are direct matrix, cohomology or specified coefficient calculations. Tests do not constitute full proofs of the infinite-CW or analytic statements. A=[[0,−1],[1,0]], B=[[0,i],[i,0]] and Γ=diag(1,−1); matrices act on columns. Finite characteristic and zero coefficient rings are outside the real/complex hypotheses. Every retained row cites [r3]; old finding rows are replaced by current measurements below.

The table contains **106 carried mathematical rows and 20 fresh rows**.

| Statement | Instances tried | Values on the two sides / negative control | Result; change |
| --- | --- | --- | --- |
| Conventions: curvature | Unit sphere tangent plane | R₁₂e₂=e₁; R₁₂e₁=−e₂; sectional curvature 1 and Scal(S²)=2 | retained; [r3] |
| Conventions: Clifford sign | Unit e and v=0 | c(e)²=−Id=Q(e)Id; c(0)²=0=Q(0)Id | retained; [r3] |
| Conventions: symbol | c(e)=i, ξ=1 | σgeom=i; σF=i²=−1; σF(D²)=1=ξ² | retained; [r3] |
| Conventions: complexification scalars | v⊗1, z=i | comm(i·(v⊗1))=i⊗v=i·comm(v⊗1) for the specified right action | retained; [r3] |
| G1.1 positive/negative dictionary | One negative generator | (ie)²=1; positive bivector maps to −e₁e₂ with square −1 on both sides | retained; [r3] |
| G1.1 conjugation direction | Spin plane, positive bivector at θ=π/4 | Positive action sends e₁ to −e₂; image cosθ−sinθ e₁e₂ in negative algebra also sends e₁ to −e₂ | retained; [r3] |
| G1.1 rank-zero branch | V=0 | Cl=ℝ; native Spin has cardinality 1, geometric μ₂ cardinality 2 | retained; [r3] |
| G1.2 polarization pairing | Unit v, Jv | gℂ(v¹⁰,v⁰¹)=1/2; hℂ(v¹⁰,v¹⁰)=1/2; hJ(v,v)=1 | retained; [r3] |
| G1.2 three CAR relations | Exterior plane, E=εw and I=ιw | E²=I²=0; EI+IE=Id; hence A²=B²=−Id and AB+BA=0 | retained; [r3] |
| G1.2 Hermitian slot convention | v=e₁,w=Je₁ | hJ(v,Jv)=i; 2hℂ(v¹⁰,(Jv)¹⁰)=i | retained; [r3] |
| G1.2 rescaling | T=diag(1,√2) | T ε T⁻¹=√2 ε; T(−2ι)T⁻¹=−√2ι; pullback Gram=diag(1,2) | retained; [r3] |
| G1.2 skew adjointness | Plane A,B | A†=−A, B†=−B; replacing B by Id gives Id†=Id≠−Id | retained; [r3] |
| G1.3 conjugation/star | Scalar i and real generator e | κ(i)=−i; native star(i)=i; negative adjoint(i)=−i and adjoint(e)=−e | retained; [r3] |
| G1.3 anti-multiplicativity | Orthogonal e₁,e₂ | (e₁e₂)*=−e₁e₂=e₂*e₁*; an unreversed product gives +e₁e₂ | retained; [r3] |
| G1.3 compatible metrics | Irreducible plane and S⊕S | h and 3h work; −h is not positive; multiplicity Gram diag(1,2) is allowed and not scalar | retained; [r3] |
| G1.3 multiplicitySpace definition | S=ℂ,E=ℂ; then plane S | Scalar T:z↦az gives T(bs)=bT(s); conjugation sends i to −i and is not complex-linear | retained; [r3] |
| G1.3 Morita evaluation headline | V=0,S=ℂ,E=ℕ→₀ℂ | T determined by x=T(1); e(1⊗T)=x; inverse x↦1⊗(z↦zx) | retained; [r3] |
| G1.3 evaluation, zero and identity | E=0 and E=S | Both sides zero in the first case; e(s⊗Id)=s in the second | retained; [r3] |
| G1.3 matrix-unit counit | S=ℂ²,j=1,T=Id | E₁₁T(e₁)=e₁; E₂₁T(e₁)=e₂; ΣEᵢ₁xᵢ is ordinary evaluation | retained; [r3] |
| G1.3 finite multiplicity dimension | dim S=2, dim multiplicity=3 | dim E=6=2·3; zero multiplicity gives 0=2·0 | retained; [r3] |
| G1.3 normalized regular trace | n=0,1,2,3,4,8 | tr L₁=1,2,4,8,16,256; dividing by 2ⁿ gives τ(1)=1 each time | retained; [r3] |
| G1.3 trace cyclicity | Negative plane a=e₁,b=e₂; then a=b=e₁ | τ(ab)=τ(ba)=0; second case both −1 | retained; [r3] |
| G1.3 negative trace positivity | a=1+e₁+2e₂ | τ(a*a)=1+1+4=6; regular trace is 24, so 24/4=6 | retained; [r3] |
| G1.3 semidefinite radical | Q=0 on a real line | e≠0, e²=0, τ(reverse(e)e)=0; null set is span(e), the radical ideal | retained; [r3] |
| G1.3 positive-form star distinction | Q(e)=1 | τ(reverse(e)e)=1; τ(native-star(e)e)=−1 | retained; [r3] |
| G1.3 scalar extension/invariance | Negative line a=2+3e; e↦−e | τ(a)=2=τ(2−3e); τℂ(i⊗a)=2i; τℂ(κ(i⊗a))=−2i | retained; [r3] |
| G1.3 grading converses | a=1+e | involute(a)=1−e, neither a nor −a; pure 1 is even and e odd | retained; [r3] |
| G1.3 reverse dual action | Plane A,B | Dual generators Aᵀ=−A, Bᵀ=B; their squares remain −Id | retained; [r3] |
| G1.4 central labels | n=1, c(e)=−i or i | ω=ic(e)=1 or −1; projectors (1,0) or (0,1) | retained; [r3] |
| G1.4 odd/even orientation | Ordered (e₁,e₀) | ψ(ie₁)=ie₀e₁=−ie₁e₀=−Γ; plus odd factor is minus half-spin | retained; [r3] |
| G1.4 centrality/square | n=3 | ω=−e₁e₂e₃; raw volume square 1; ω²=1 and [ω,eⱼ]=0 | retained; [r3] |
| G2.1 chirality definition/square | Plane; n=0,4,8 | iAB=diag(1,−1), square Id; remaining normalized squares 1,1,1 | retained; [r3] |
| G2.1 basis/orientation | Rotate plane; reverse one vector | Rotation gives same Γ; reversal gives −Γ=diag(−1,1) | retained; [r3] |
| G2.1 anticommutation | Plane A and zero-space v | ΓA=[[0,−1],[−1,0]]=−AΓ; v=0 gives 0=0 | retained; [r3] |
| G2.1 Hermitian/native stars | Plane volume i e₁e₂ | Hermitian adjoint Γ=Γ; complex-linear native star Γ=−Γ | retained; [r3] |
| G2.1 positive/negativeSpinors | Plane; V=0; S=0 | Eigenspaces span(1,0),span(0,1); then (S,0); then (0,0) | retained; [r3] |
| G2.1 complement/projections headline | Plane | (Id±Γ)/2=diag(1,0),diag(0,1); sum Id, product 0 | retained; [r3] |
| G2.1 geometric-action predicate | Negative line c=i, bad c=1 | i²=−1 and i†=−i; 1²=1≠−1 and 1†=1≠−1 | retained; [r3] |
| G2.1 signed zero orientation | σ=±1 | Γσ=±Id gives half ranks (1,0) or (0,1) | retained; [r3] |
| G2.2 Hodge/chirality | Unit plane degrees 0,1,2 | Γ1=i e₁₂; Γe₁=i e₂; Γe₁₂=−i; formula i^(1+p(p−1))* gives same values | retained; [r3] |
| G2.2 star-square | Plane 1 and e₁ | *²1=1; *²e₁=−e₁; combining phases gives Γ²=1 in both degrees | retained; [r3] |
| G2.2 Chevalley evaluation | 1,e₁,e₁₂ | Images Id,A,AB; c(e₁)e₁=−1 maps to A²=−Id | retained; [r3] |
| G2.2 Hilbert–Schmidt normalization | Plane Id | Ordinary norm²=tr Id=2; normalized norm²=1=exterior norm²(1) | retained; [r3] |
| G2.2 two dual gradings | Plane | Induced dual Γᵀ=diag(1,−1); reverse-dual iAᵀBᵀ=diag(−1,1) | retained; [r3] |
| G2.3 graded product | Two planes | Γ⊗Γ diagonal (1,−1,−1,1); half ranks (2,2) | retained; [r3] |
| G2.3 mixed Clifford relation | A⊗Id,Γ⊗A | Anticommutator (AΓ+ΓA)⊗A=0; omitting Γ gives 2A⊗A≠0 | retained; [r3] |
| G2.3 Koszul symmetry/unit | Two odd lines; rank-zero even line | Flip sign −1; double flip +1; unit grading leaves Γ unchanged | retained; [r3] |
| G2.3 graded twist/evaluation | Purely odd A, dim A=1 | Tensor grading −ΓS; intrinsic grading ΓS; half ranks interchanged | retained; [r3] |
| G3.1 Clifford bundle/product | Trivial negative line | (a+be)(c+de)=(ac−bd)+(ad+bc)e; rank-zero algebra fiber ℝ, unit 1 | retained; [r3] |
| G3.1 norm/isometry | Reflection and dilation | e↦−e preserves norm²=1 and square −1; e↦2e gives norm²=4 and square −4 | retained; [r3] |
| G3.1 equivariance/invariant tensor | Spin plane z=cosθ+sinθ e₁e₂, θ=π/2 | Conjugation sends eⱼ to −eⱼ; μ(z)c(eⱼ)μ(z)⁻¹=−c(eⱼ) | retained; [r3] |
| G3.2 module presentations | c=i on line; c=1; zero module | Universal generator square −1 passes; +1 fails; zero endomorphism ring has 0=Id and both laws 0=0 | retained; [r3] |
| G3.2 sums/pullbacks/twists | Two copies of c=i; trivial line twist | diag(i,i)²=−Id₂; twist by 1 leaves i | retained; [r3] |
| G3.3 compatibility | Constant c=i, trivial connection | ∇(is)=i ds=c(∇e)s+c(e)∇s | retained; [r3] |
| G3.3 Hermitian is insufficient | B₀=diag(i,−i), c(e₁)=A | [B₀,A]=[[0,−2i],[−2i,0]]≠0 | retained; [r3] |
| G3.3 affine difference | Compatible scalar connection increments ia,ib | Difference i(a−b) commutes with c=i and is skew adjoint; noncommuting B₀ fails | retained; [r3] |
| G3.3 curvature compatibility | Flat bundle | [Rᴱ,c]=[0,c]=0=c(Rⱽv) | retained; [r3] |
| G3.4 exterior d and d* | ℝ: f=x²,h=x | d f=2x dx; d*(x dx)=−1; D(f,h)=(−1,2x) | retained; [r3] |
| G3.4 square/pullback limit | Same pair; point | D²(f,h)=(−2,0)=−(f″,h″); point operator 0, line operator i∂ need not vanish | retained; [r3] |
| G4.1a covering/kernel | Spin(2): z=i,−1 | z²=−1,1; kernel {1,−1}; Spin(1) and geometric Spin(0) also two-point covers | retained; [r3] |
| G4.1b differential | θ↦2θ | Derivative 2, inverse 1/2; composite differential 1 | retained; [r3] |
| G4.2 lift data | Base point | One lift isomorphism class; automorphism group has 2 elements; Boolean existence retains neither automorphism | retained; [r3] |
| G4.2 metric map | g′=4g | B=4Id, B⁻¹/²=Id/2; g′(e/2,e/2)=1, whereas g′(2e,2e)=16 | retained; [r3] |
| G4.2 pullback/smooth lift | Trivial lift on circle pulled back to point | Fiber remains μ₂ with 2 elements; each sheet over a smooth interval is a smooth copy of that interval | retained; [r3] |
| G4.3 obstruction both ways | Plane bundles over S² with e=1,2 | w₂=1,0; lift counts 0,1; TS² is not framed despite the latter lift | retained; [r3] |
| G4.3 cocycle normalization | Trivial transition lifts | Product 1·1·1=1, corresponding to additive obstruction 0 | retained; [r3] |
| G4.4 torsor | S¹ and T² | H¹ orders 2 and 4; twisting by ε twice adds 1+1=0 | retained; [r3] |
| G4.4 direct sum/zero unit | m=0,n=1 | μ₂×μ₂ modulo diagonal μ₂ has 2 elements, maps isomorphically to Spin(1); trivial zero lift is unit | retained; [r3] |
| G4.4 nontrivial zero twist | S¹ flat central line | Holonomy −1; twice twisted holonomy (−1)²=+1 | retained; [r3] |
| G4.4a orientation model | Trivial positive-rank bundle on connected circle | π₀O(n) has 2 elements=H⁰(S¹;F₂); orientation fixes one component | retained; [r3] |
| G4.4a skeletal quotient | Trivial rank-three bundle on S¹ | π₁SO(3)=Z/2 gives 2 skeletal classes=2 lift classes; automorphisms per lift Z/2 are absent from quotient | retained; [r3] |
| G4.4a fixed cochain vs class | Trivial bundle on a triangulated disc; boundary loop of winding parity 1 | One chosen frame has obstruction value 1 and cannot extend; H²(disc;F₂)=0 and changing an edge yields value 0 | retained; [r3] |
| G4.4a stabilization | TS² | e=2, w₂=0; TS²⊕ε¹ trivial of rank 3; H¹(S²;F₂)=0 gives one class | retained; [r3] |
| G4.4a pullback covers | SO(1) and SO(2) in SO(3) | Preimage of SO(1)={±1}; preimage of SO(2) circle with degree 2 | retained; [r3] |
| G4.4a integral divisibility | H²=ℤ, e=1,2; H²=ℤ/2,e=1 | 2c=e has 0 solutions for e=1, c=1 for e=2; torsion case 2H²=0 so e=1 has no root | retained; [r3] |
| G5.1 spinor ranks | n=1,2,4 | Chosen odd rank 1 vs faithful sum rank 2; even half ranks (1,1),(2,2) | retained; [r3] |
| G5.1 lift twist | Two circle lifts | Spinor holonomies +1 and −1; fiber rank 1 in both | retained; [r3] |
| G5.2 bundle product/K-class | Two planes and signed points | Half ranks (2,2), virtual rank 0=0·0; positive/negative point multiply a class by +1/−1 | retained; [r3] |
| G5.3 square-root characters | θ=π/2 | E weight −1, S⁺ weight −i, S⁻ weight i; both squared −1; S⁻ is the weight-z root | retained; [r3] |
| G5.3 curvature/root obstruction | e(E)=2 or 1 over S² | Root c₁=1 or nonexistent; dual c₁=−1; curvature Froot=FE/2 | retained; [r3] |
| G6.0 real-module inner product | Constant sections s=e,t=1, A=Cl(0,1), unit volume | ⟨e,1⟩=−e; ⟨1,e⟩=e; conjugation gives (−e)*=e | retained; [r3] |
| G6.0 norm comparison | A=ℍ, point s=1; A=M₂(ℍ), s=diag(1,0) | First scalar/module norm² both 1; second normalized trace norm²=1/2, module norm²=1 | retained; [r3] |
| G6.0 closed domain/local branch | Periodic circle Fourier coefficients 1/k; open line | Σ1/k² finite but derivative coefficients 1 have divergent squared sum; on line local ellipticity holds while constant spinors are not L² | retained; [r3] |
| G6.0 bounded transform | λ=0,1,−1 | F values 0,1/√2,−1/√2; F²−1=−1/(1+λ²) | retained; [r3] |
| G6.0 degree-zero calibration | Positive/negative point | Even/odd kernel lines give +1/−1; unsigned dimension gives 1 in both and is excluded | retained; [r3] |
| G6.0 real circle/product classes | Periodic/antiperiodic circles | η/0; periodic product η²≠0; product with antiperiodic factor 0 | retained; [r3] |
| G6.0 regular-module warning | n=4 and 8 | Volume-sign pieces give a−a=0 and 8b−8b=0, despite real dimensions 16 and 256 | retained; [r3] |
| G6.0 complexification/Morita | n=4 class a; n=8 class b | c(a)=2u²; c(b)=u⁴; fixed dual multiplicity ranks 4 and 16 must be removed by Morita | retained; [r3] |
| G6.0 n≡2 mod4 | Flat periodic T² | Complex chiral index 1−1=0; real class η² nonzero but c(η²)=0 | retained; [r3] |
| G6.1 Leibniz/symbol | D=i∂; f=x and f constant | [D,x]s=is; constant commutator 0; σF(1)=−1 | retained; [r3] |
| G6.1 minimal/maximal/H¹ | Periodic Fourier mode e^(ikx) | D eigenvalue −k; graph weight 1+k² equals H¹ weight; adjoint eigenvalue again −k | retained; [r3] |
| G6.1 chiral blocks | D⁺=D⁻=2 | D(1,0)=(0,2); reverse block has adjoint 2; full index 0 | retained; [r3] |
| G6.1 arbitrary grading/twist | Exterior circle parity; odd line twist | γ=diag(1,−1) anticommutes with A; odd twist changes γ to −γ, not the operator | retained; [r3] |
| G6.2 square and curvature factor | Flat line; formal plane curvature B₀ | −∂²=∇*∇+0; full ordered curvature sum is 2c₁c₂B₀, half of it is c₁c₂B₀ | retained; [r3] |
| G6.2 perturbed Dirac negative control | D′=D+Id | D′²−D²=2D+Id≠0; excludes arbitrary Dirac-type zero-order perturbations | retained; [r3] |
| G6.3 spin curvature sign | Unit S² | R^S₁₂=−(1/2)c₁c₂; c₁c₂R^S₁₂=1/2 Id=Scal/4 | retained; [r3] |
| G6.3 twisted term | Flat trivial W; plane F₁₂=i f Id | Extra term 0 first; second c₁c₂if=fΓ with eigenvalues f,−f, so scalar positivity alone is insufficient for twists | retained; [r3] |
| G6.4 exterior operator | Circle f=x²,h=x locally | D=(−1,2x dx)=d+d*; square (−2,0)=Hodge Laplacian | retained; [r3] |
| G6.4 distinct gradings/harmonics | Flat circle; point | Exterior harmonic degree ranks (1,1); point ranks (1,0,…); Γ1=i e₁₂ differs from parity(1)=1 | retained; [r3] |
| G6.5 all circle/torus twists | Length 2π, T² | Spectra ℤ and ℤ+1/2; zero multiplicity 1,0; four torus shifts, only (0,0) has zero momentum | retained; [r3] |
| G6.5 sphere low ranks | S¹,S²,S³ | Scal=0,2,6; periodic circle kernel 1, sphere kernels 0,0 | retained; [r3] |
| G6.6 symbol inverse/support | ξ unit, ξ=0; base point vs ℝ | c(ξ)(−c(ξ))=Id; at 0 product 0, no inverse; zero sections compact only for closed base | retained; [r3] |
| G6.6 phase homotopy | t=0,1 | Multipliers 1,i, each modulus 1; invertibility retained off zero | retained; [r3] |
| G6.7 quaternionic square/dimension | J(z,w)=(−bar w,bar z); ℂ line | J²=−Id on ℂ², dimensions 2=2·1; line square is nonnegative \|a\|², never −1 | retained; [r3] |
| G6.7 kernel/domain/phase | Flat T⁴; J′=iJ | Half-kernel complex dimensions 2,2; α=1−1=0; (iJ)²=i(−i)J²=−Id | retained; [r3] |
| G6.7 KO sign | n=4, Γ=−ω₋ | Γ=+1 implies ω₋=−1; external volume on ε-even part also −1, selects a; c(a)=2u² | retained; [r3] |
| G4.4a added Kirby comparison and stabilization locator | TS²; trivial rank-three bundle on S¹ | TS²: e=2, w₂=0, lift count 1, stable rank 3; S¹: 2 skeletal classes=2 lifts | fresh; locator supported, placement R02 remains |
| G4.4a added C3.2 integral-Euler route | H²=ℤ with e=2 and e=1; H²=ℤ/2 with e=1 | ρ(2)=0 and 2·1=2; ρ(1)=1 and no integral half; on ℤ/2 multiplication by 2 has image {0}, so ρ(1)≠0 by exactness | fresh; retains torsion |
| G4.4a root-isomorphism retention | Trivial complex line on S¹, root maps 1 and z | Pointwise square roots exist; continuous square root of z would have winding 1/2, impossible; two root-isomorphism classes match two lifts | fresh; omitting root map would collapse the distinction |
| G5.0 regular metric and parity | n=0,1,2,3,4; a=1+2e₁+3e₁e₂ | Dimensions 1,2,4,8,16=2ⁿ; squared norm of a and of its exterior image is 14; even/odd basis blades have parity +1/−1 | fresh; native exterior equivalence transports metric |
| G5.0 right multiplication adjoint | n=1, basis (1,e) | R=[[0,−1],[1,0]], Rᵀ=−R, ε=diag(1,−1), εR=−Rε | fresh; skew-adjointness supported |
| G5.0 positive action and updated Check | n=1; w=0 and w=2e | C=Rε=[[0,1],[1,0]]=Cᵀ; C²=Id; C(0)²=0; C(2e)²=4Id=\|2e\|²Id | fresh; all stated signs agree |
| G5.0 positive relations and oddness | Every generator and blade for n=1,2,3,4 | Cᵢ²=Id; CᵢLᵢ=−LᵢCᵢ; εCᵢ=−Cᵢε; for i≠j, CᵢCⱼ+CⱼCᵢ=0 | fresh; untwisted R instead squares to −Id |
| G5.0 Spin metric invariance | n=2, g=e₁e₂, a=1+2e₁+3e₁e₂ | g·a=−3+2e₂+e₁e₂; norm²=14 on both sides; g†g=1 | fresh; even left action is unitary |
| G5.0 Spin equivariance | n=2, g=e₁e₂, s=1, w=e₁ | C₊(g)=e₂=gC₊(1); odd left e₁ instead gives C₊(e₁)=1 versus e₁C₊(1)=−1 | fresh; evenness is necessary |
| G5.0 invariant-tensor parallelism | Local connection d+f(x)L_(e₁e₂) | [L_(e₁e₂),C₊(e₁)]=0 and ∂C₊=0, so ∇C₊=0; replacing connection term by L_e₁ gives a commutator sending 1 to −2≠0 | fresh; principal Spin hypothesis excludes wrong model |
| G5.0 signed rank zero | σ=+1,−1 | Dimension 1; ε=+Id or −Id; parity ranks (1,0) or (0,1); no external generators | fresh; empty relations consistent |
| G5.0/G5.1 narrowed dependencies | G5.1 → G5.3 → G4.4a, arrows mean supplies | 2 directed edges, 0 return edges from G4.4a to G5.1; prior blanket G4 supplied 1 return edge | fresh; local cycle repaired |
| G6.0 formal adjoint via complexification | Flat periodic circle, D=L_e ∂ₓ on real two-component functions | L_eᵀ=−L_e and ∂ₓ*=−∂ₓ give D*=D and D²=−∂ₓ²; complexified matrices unchanged | fresh; geometric Dirac hypotheses retained |
| G6.0 new S² curvature Check | Unit sphere, B=e₁e₂ | B²=−1; R₁₂=−L_B/2; L_B R₁₂=Id/2=2Id/4; reversing curvature sign gives −Id/2 | fresh; matches G6.2/G6.3 |
| G6.0 contraction on full regular module, including odd rank | Constant sectional curvature 1, n=0,1,2,3,4 | Σ_(i<j)(−L_(eᵢeⱼ)²/2)=0,0,1/2,3/2,3 times Id = n(n−1)Id/4 | fresh; no irreducibility used |
| G6.0 real inclusion and closed-domain route | s=e; circle Fourier sequence s_k=1/k for k≥1 | Real and complexified curvature give s/2 on S²; inclusion kernel {0}; circle L² sum Σ1/k² finite, H¹ derivative sum Σ1 infinite on both real pair and complexification | fresh; equality descends and domain restriction matters |
| G6.0 functional calculus and index calibration | λ=0,1; signed points; periodic/antiperiodic circles | F=0,1/√2 and F²−1=−1,−1/2; point classes +1,−1; circle classes η,0, with products η²,0 | fresh; exact G5.5/T7 contracts, not a Nicolaescu KO theorem |
| R01 reciprocal supply | SpinGeometry with GeneralizedCohomology, CharacteristicClasses, RiemannianGeometry | 3 directed two-edge cycles; mechanical checker reports 0 problems | fail; move ownership |
| R02 extension placement | Main and this head | G4.4a counts 0 and 1; moving it leaves TS² values e=2,w₂=0 unchanged | fail; Part II required |
| R03 locator and source-record repair | Three changed target blocks; reference records | Attached locators now 1,1,1 instead of 0,0,0; four cited works, zero sources.toml records | partial; remaining P3 source record |

## Not verifiable

- Full Lawson–Michelsohn Chapters I–II and ABS §§6/11 remain outside this incremental source certification, as documented in [r3]. Its legal publisher preview did not expose the full geometric chapters; ABS was recorded as paywalled/uncertified. No settled source was requested again.
- Kirby's OCR damages the fiber-restriction line (kirby line 1141). The fresh check uses the legible skeletal, stabilization and torsor paragraphs, not that damaged formula. This book is explicitly named in the README; no identity with unspecified course notes is assumed.
- The reports and finite tests are not completed proofs of the global Sobolev-domain, infinite-CW naturality or KO classification theorems. The precise supplier contracts and the newly cited local proof steps were checked. The new prose correctly distinguishes those levels of evidence.

## Source issues

- none

No new source error was established in the changed-locator checks. The seven Nicolaescu errata recorded in [r3] concern unchanged passages and remain recorded there.

[r3]: packages/SpinGeometry/reports/PRREVIEW-SpinGeometry~3.md
