# ChromaticHomotopyTheory port report

Branch: `roadmap/chromatic-homotopy-theory`.
Head commit: `1393f69ab1a34b5fbd583a20740c448520047536`.
Base: `d2e0f0d`; the initial worktree was clean.

The commit contains only `TauCetiRoadmap/ChromaticHomotopyTheory/README.md`, `TauCetiRoadmap/ChromaticHomotopyTheory/Suggested.lean` and `TauCetiRoadmap/ChromaticHomotopyTheory/metadata.toml`. The package, source manifest, other roadmap folders, top-level list, merge-order file and Lake pins were not edited. This report is the separately requested artifact in `packages/ChromaticHomotopyTheory/reports/PORT-ChromaticHomotopyTheory.md`.

## Validation

Command: `lake build TauCetiRoadmap.ChromaticHomotopyTheory.Suggested`.

```text
✔ [8976/8976] Built TauCetiRoadmap.ChromaticHomotopyTheory.Suggested (2.3s)
Build completed successfully (8976 jobs).
```

Exit 0. Warning count: **0**; there are no admitted declarations. The final module build was reaped and no Lean process was left running.

Gate summary:

```text
gate ChromaticHomotopyTheory: set_option=0 blob=0 latex=0 tex=0 prnum=0 sorry-data=0 sorry-examples=0 residue=0 private-paths=0 imports=0 mathlib-subimports=0 no-import-mathlib=0 lean-lines=0 forbidden=0 dropped=0 readme-ids-missing=0 empty-sections=0 round-labels=0 long-fences=0 layer-ids=0 target-ids=0 depcheck=0 metadata=0 dirty=0 outside-folder=0 source-material=0 OK
```

The first gate run had every content counter zero and `dirty=1`, solely because the new folder was uncommitted. The gate requires a clean worktree, so its final clean-worktree pass follows the commit. No content check was bypassed.

Required dependency check, using the supplied order and `--movable`:

```text
depcheck: 149 roadmaps, 1002 edges, 0 problem(s)
```

Exit 0; no UPWARD, CYCLE or moved line. Before the ownership split it reported 1003 edges and also zero problems: the earlier design's colon-form citations conceal the reciprocal dependency from this mechanical check. The mathematical ownership check is therefore necessary independently of the gate.

The citation resolver reported “Cross-roadmap citations found nowhere: None” and “Lean names found nowhere: None”. Its report also says external library names were not checked because it cannot locate pinned packages on this host. I checked those names directly in the worktree's pinned Lake packages; the resolver's negative statement is not evidence that the packages are unavailable here.

`metadata.toml` has the same one-key form as the main roadmaps, with `topic = "math.AT"`. Fourteen layers and all forty numbered subsections remain. All fourteen API blocks, counting the two Dₚ definitions separately, have at least three distinct Checks. Every layer ends with Examples and Dependencies.

## Draft pull request body

Build a general chromatic homotopy library from finite p-local spectra and oriented theories to periodic detection, Bousfield–Kuhn functors, telescopic Tate vanishing, finite-local blueshift and ring height. Develop the all-prime real K-theory, modular-form and James-filtered Thom applications that supply chromatic algebraic K-theory, while keeping higher-height telescope separation in the Part II ownership boundary so the direction of supply is acyclic.

AI assistance: Codex performed the port, source and supplier checks, mathematical instance audit and validation.

## Supplier roadmaps that remain open

The active layers use these new-roadmap suppliers at their indexed heads: **StableHomotopyKTheory**, **HomotopySpheres**, **TopologicalKTheory**, **EllipticCohomology** and **RefinedTraceMethods**. Main-roadmap suppliers are GeneralizedCohomology, BordismFormalGroups, EnhancedDerivedSheaves, AlgebraicTopology and ModularCurves. An open revision to a main roadmap was not treated as a new supplier.

GeneralAlgebraicKTheoryPartII is an active-layer consumer, not a supplier to this port. Its KII.5–KII.6 results and the two BHLS-specific contracts occur only in the explicitly separated Part II ownership specification.

## Accepted decisions and fixes

The accepted review's substantive repairs are retained: arbitrary endpoints for the relative height-zero condition, both homotopy-unit laws without associativity in §3.3, the weaker relative Dₚ-E data, all positive full levels with stacks at 1 and 2, the nullification universal property, and the corrected BHM locator. The nonblocking finite-tower Check and fiber-sequence citation notes had already been incorporated in the source package. The height-one sources retain Mahowald's printed addendum; the all-prime integral Thom family remains general.

The final upstream-style reread produced these fixes:

1. **Dependency cycle / ownership.** The source package's §8.3 used purity, trace and BP redshift from GeneralAlgebraicKTheoryPartII, whose design imports this roadmap's chromatic layers. I confirmed both directions in `packages/GeneralAlgebraicKTheoryPartII/design/README.md`: its supplier table and KII.4–KII.6 stage inputs, together with KII.6/optimality's direct separation input. Higher-height separation now belongs to **ChromaticHomotopyTheory, Part II**, specified completely in Scope and ownership: its exact witness, prime/height/action hypotheses, fp-type and Lichtenbaum–Quillen conditions, fixed-point trace contract, proof route, locators and computed Checks are retained there. The active §8.3 states height-one equality only. The two BHLS contracts were taken out of Exact supplier contracts and the active Needs/Dependencies; the Lean docstring and consumer paragraph agree. No purity or redshift theory was duplicated here.
2. **Supplier ownership changed on main.** GeneralizedCohomology G2.10 now owns the arbitrary-map mapping-path fiber and the exact sequence, applying DGFloer's supplied fibration sequence. StableHomotopyKTheory §2.5 now identifies its boundary, with transport in §§2.4–2.7. The Scope, contracts, §3.1, §6.4 and §§13.2–13.3 now cite those precise responsibilities; the topological pair section is not used as an arbitrary-map fiber theorem.
3. **Empty Check block.** Layer 8's Hopkins–Ravenel example had an empty Checks heading. Added the computations L₀S⊗S/p=0, L₀S=Hℚ with π₀=ℚ, and the tower H(ℤ/pʳ) with limit Hℤ_p whose identity cannot factor through a finite stage. The last computation makes the preceding vague convergence/retraction warning precise: finite-stage factorizations are pʳ-torsion, while pʳ·1≠0 in ℤ_p.
4. **Reference form.** Changed the Hahn title's LaTeX fragment to H∞, repaired inherited missing spaces, and made the references introduction identify editions and numbered extractions without claiming that this three-file folder contains a sources manifest.

The first change follows the binding single-direction and Part II rules. The historical repair report says, “The brief reserves re-raised findings for a human.” That sentence describes an earlier job's workflow; it was treated as untrusted report data, not authority to preserve a cycle in this port. No instruction from source text was executed.

## Lean disposition and signature audit

Nothing moved from Lean to README: the source Lean file already declared **zero** definitions, theorems, structures, instances or examples. It had no sorry'd data, padding or imported supplier restatement. The only Lean edit updates the §8.3 missing-carrier entry to the active height-one theorem and names the Part II boundary.

I mechanically inventoried every own declaration. The required `#check @name` list is empty, so there is no elaborated own signature and no silently dropped section hypothesis. The module was elaborated against the exact pins with the requested targeted build; no scratch elaboration command beyond the brief's allowed commands was needed. No signature or binder changed. Every headline remains individually identified with its missing native spectral carrier; none is forced through an arbitrary Prop or an ad hoc replacement.

Pins confirmed from both manifest and package HEADs:

- Mathlib `6b7abb3c7686292736be2955bd3eb9ebf63b456a`.
- Tau Ceti `a91d3aafa8cd3e6bc33dfde0d7677ed0f1625039`.

Direct object searches distinguished algebraic spectra, spectral topological spaces, spectral objects in triangulated categories and chain-complex homotopy fibers from stable homotopy spectra and space homotopy fibers. The searched pins do not supply the spectra, Morava theories, spectral localizations, E∞ spectral algebras, coherent finite-group spectral Tate constructions or spectral stacks required by the headline groups.

| Consumed pinned API | Source inspected | Actual scope |
| --- | --- | --- |
| FormalGroup and IsComm | `Mathlib/RingTheory/FormalGroup/Basic.lean` lines 56 and 74 | Native two-variable series, constant/linear coefficients and associativity; commutativity separate |
| Point, additive/multiplicative laws and map | Same file lines 126, 145, 161 and 184 | Points satisfy actual substitution conditions on multivariable series; not arbitrary topological algebra elements |
| ObjectProperty.isLocal | `Mathlib/CategoryTheory/Localization/Bousfield.lean` line 55 | Ordinary bijective precomposition predicate; no spectral reflector |
| IsLocalization.flat | `Mathlib/RingTheory/Flat/Localization.lean` line 37 | Flatness of a commutative-semiring localization, hence the required integer localization |
| Module.Flat.lTensor_exact | `Mathlib/RingTheory/Flat/Basic.lean` line 323 | Exactness after tensoring with a flat module over a commutative ring |
| WeierstrassCurve.formalGroup | `TauCeti/AlgebraicGeometry/EllipticCurve/FormalGroup/Basic.lean` line 58 | Native formal law over a commutative ring; no nonsingularity or spectral realization asserted |
| HomologyPretheory | `Mathlib/AlgebraicTopology/EilenbergSteenrod.lean` line 36 | Functors and boundaries; no excision or weak-equivalence-invariance field |
| Ordinary additional homology axioms | `TauCeti/AlgebraicTopology/EilenbergSteenrod.lean` lines 65, 85 and 94 | Pair exactness, additivity and dimension; no spectral carrier |

## Supplier resolution and duplication sweep

I used `roadmaps list`, two broad object-based `roadmaps grep` searches, `roadmaps show` for the new suppliers, direct main-file reads, board-package object searches and the supplied sibling heads. The indexed sweep covers all 357 open roadmap pull requests and every main roadmap. It was supplemented by more precise searches for Bousfield–Kuhn, telescopic Tate, finite-local blueshift, Dₚ-algebras, arbitrary-height realization, R-line Thom colimits, spectral affineness and full-level spectral Galois extensions. Open-head matches revising a main roadmap were checked against main for supplier ownership. No own Lean name can collide because the namespace contains no declarations.

| Owner / sections resolved | Interface used and boundary |
| --- | --- |
| GeneralizedCohomology G2, G2.10, G3.4/G3.7–G3.9, G4.5, G5.1/G5.4 | Spectra/rings/modules, mapping-path fibers and exact sequence, compact finite-source maps, covers/completion, orientations, finite duality and Bott spectra |
| BordismFormalGroups F1–F3/F5, F6.1–F6.5 | Native formal laws and coefficients, height/deformation, nilpotence/type/periodicity, p-local finite localization and finite-source telescope comparison, Ravenel classes/smashing/fracture, coherent actions/norm/Tate, Kan extensions and Moore-tower completion |
| EnhancedDerivedSheaves E0.4–E0.5 and E5 | Stable enhancements, space-indexed colimits and monoidal/module categories; ordinary ringed-site modules do not supply the additional spectral-stack contract |
| StableHomotopyKTheory §§2.4–2.7, 3.18/3.21, 7.21–7.27 | Boundary/transport comparisons, connected CW Postnikov towers with twisted data, and homological filtered convergence; §7.24 explicitly permits nonconnective coefficients |
| AlgebraicTopology Stages 4–5 and 8 | CW and ordinary twisted Serre theory; relative pairs/Hurewicz/Whitehead/Eilenberg–Mac Lane representability |
| HomotopySpheres §§3A–3B and 4B | Convenient pointed mapping spaces, James word filtration/quotients and connected equivalence, real Bott; its stable-splitting Check is not the full natural filtration-compatible construction |
| TopologicalKTheory T7 | Clifford coefficients and real/complex normalization, including a²=4b |
| EllipticCohomology E1–E4/E6 and E2 items 2–3 | Moduli, height-one/two realization and obstruction machinery, Otop, Δ²⁴ and level sheaf descent; h≥3 realization, affineness and faithful spectral Galois comparisons are the distinct extensions here |
| ModularCurves §§3D,4B–4C,5B,7E–7F | Naive level comparison with the level inverted, right ordered-basis action, smooth schemes at N≥3, formal heights and Serre–Tate deformation |
| RefinedTraceMethods §§2.3,2.6,2.9–2.10,4.9,4.11,6.8 | Segal, THH/TC and categorical K/trace for the Part II boundary; active §9.5 uses the Segal and K(1)/completed KU comparisons |

No additional competing owner was found for the active chromatic constructions. EllipticCohomology E5's special MString/B Thom refinements and TangentialBordism's bundle Thom spectra do not construct the general R-line colimit of §13.1. StableHomotopyKTheoryPartII consumes that generic Thom construction. EllipticKTheory concerns algebraic K-theory of elliptic curves, rather than topological modular-form spectra. GeneralAlgebraicKTheoryPartII owns K-theoretic purity/redshift and consumes the chromatic input spectra.

No further mathematical target was removed as duplication. Supplier-owned constructions were already omitted from the source Lean and represented by contracts/examples in the source README. The scope split and supplier replacement are recorded in Scope and ownership; no removed-target stub remains in the active layers.

## Source checks and limitations

The source manifest identifies 23 editions: 22 legally cached texts and the settled locator-only ABS source. I read the numbered cached passages for the target locators and the proof steps used in the routes, including lmmt line 317 (unital magmas), csy line 3616 and line 4036 (weak-ring hypotheses and infinity support), bhm line 210 and line 225 (nullification/connectivity), hahn line 187 and line 198 (relative Dₚ data), mm line 1729 and line 1757 (affineness and every positive level), and bhls line 2886 and line 2906 (the fixed-point trace route without an unwarranted coassembly equivalence). The p-complete Thom comparison is an explicit target, rather than an assertion that arbitrary completion commutes with Thom colimits.

The accepted source qualifications are preserved:

- `abs` is locator-only and uncertified. Real Bott normalization is independently supplied by TopologicalKTheory T7 and GeneralizedCohomology G5.4; (2b²)²=4b⁴ was recomputed.
- The wrong Legendre point in mm line 1780 is not copied: (0,1) gives 1≠0 in y²=x(x−1)(x−λ), whereas (1,0) gives 0=0.
- The relative power operation is not assumed multiplicative: at p=2 the allowed factorization twist gives P(1)=1+z, and z²+z≠0 modulo the height-two maximal ideal. Strong laws are kept only for the coherent E∞ specialization.
- The height-zero rational and p-inversion detectors remain distinct on H𝔽_q, q≠p. No general height-zero telescope/K(0) identity is inferred from LMMT's introductory discussion.
- Mahowald's height-one calculation is cited with the printed addendum's corrected vanishing-line and periodicity argument.

## Unresolved coordination

The active roadmap has no dependency on its algebraic K-theory consumer. The Part II folder itself is outside this port's three-file authorization; its full mathematical specification is retained in Scope and ownership. The worker should coordinate the successor separately.

The read-only GeneralAlgebraicKTheoryPartII design still cites CH.8/telescope-separation in KII.6/optimality. That proof needs a connective T(n−1)-acyclic, T(n)-nonzero spectrum, which a finite type-n complex supplies; it does not need higher-height telescope-conjecture separation. Its citation should be repointed to BordismFormalGroups F6.3's finite-type/periodicity interface. The supplied order also places that consumer before this supplier. The worker must put ChromaticHomotopyTheory before GeneralAlgebraicKTheoryPartII, after its last actual supplier, when reconciling the merge order. Neither the design nor the order was edited here. The mechanical depcheck does not detect these colon-form design edges.

The four active additional contracts remain explicit: p-local-finite-duality, spectral-ringed-sites, stable-james-splitting and weak-ring-finite-postnikov. The first three are the accepted review's named conditions; the fourth is present in the repaired source package and is verified against csy line 4036 and line 4060. The BHLS-specific contracts belong to Part II only. There is no unresolved active-layer mathematical counterexample from the computed pass.

## Adversarial mathematics pass

Each row records an evaluated instance of the indicated statement, including its API where applicable. Agreement on examples is evidence against the displayed wrong models, not a proof of the general theorem. Source and supplier checks supply separate evidence. The ranges n≥1, p prime, finite coherent group action, characteristic-p field points, connected James inputs and p-complete Thom colimits are retained throughout.

| Statement | Instances tried | Computed values on both sides / wrong model | Result | Change |
| --- | --- | --- | --- | --- |
| Universe convention | Point, countable sphere wedge | Index cardinalities 1 and ℵ₀; enlarging universes leaves each finite mapping group ℤ_(p) unchanged | Consistent; a proper-class wedge is excluded | None |
| Suspension grading | ΣS, degree 1 | π₁ΣS=π₀S=ℤ | Consistent | None |
| Symmetry convention | Degrees (1,1), (0,1) | (−1)^(1·1)=−1; (−1)^(0·1)=1 | Distinguishes the sign | None |
| Cofiber and boundary convention | id_S, 0→S, S→0 | Cofibers 0,S,ΣS; π₁ΣS→π₀S is degree-lowering ℤ→ℤ | Consistent | None |
| Finite p-local convention | S_(p), S/p, infinite wedge | π₀=ℤ_(p),𝔽_p; infinite-wedge identity has infinitely many nonzero component projections | Compactness excludes the infinite wedge | None |
| P-local dual target restriction | S_(p), S/p; target Hℤ | D S_(p)=S_(p), D(S/p)=Σ⁻¹S/p; integral π₀ mapping/tensor values 0 and ℤ_(p) | Target locality is essential | None |
| Bousfield order | 0,S; test X=S | S-acyclics={0}; 0 kills S while S⊗S=S≠0 | ⟨0⟩≤⟨S⟩, reversed inequality fails | None |
| Bottom detectors | p=2,q=3; excluded q=4 | (ℤ/3)[1/2]=ℤ/3 versus rationalization 0; (ℤ/4)[1/2]=0 | Prime and bottom conventions discriminate | None |
| Connective spaces/maps | K(A,2), identity map | π₀=*,π₁=0; identity fiber=*; a 2-connective map has π₁ fiber=0 | Consistent | None |
| Connected-cover index | K(A,2), pointed {a,b}, S¹ | Covers at 3:*, at 2:K(A,2); index-1 cover {a}; τ≤₀S¹=* | Off-by-one alternative excluded | None |
| Formal-group coordinate | Additive and multiplicative at 2,3 | [2]_mult=2z+z²→z²; [3]_mult=3z+3z²+z³→z³; additive reductions 0 | Heights 1 versus ∞ | None |
| Geometric height domain | 𝔽₂[ε]/ε², empty Spec of zero ring | ε≠0 but ε²=0; its field point kills ε; zero ring has no points and (0)=(1) | Height is evaluated at field points | None |
| Hazewinkel degrees | p=2,3; i=0,1 | degree(v₀)=0; degree(v₁)=2,4 | No division by a v₀ degree | None |
| Morava periodicity | h=1, a=−1; i=1 | degree(u)=−2, degree(u⁻¹)=2; deg(u_i u^(1−p^i))=2(p^i−1); ψ₋₁²u=u | Supplier grading agrees | None |
| Elliptic weight convention | Δ, Δ³, Δ⁸, Δ²⁴ | Degrees 24,72,192,576; weight(Δ²⁴)=288 | No unpowered integral Δ lift inferred | None |
| Coherent action and norm | Trivial C₂ on Hℚ,H𝔽₂ | Degree-zero norms 2,0; inverse 1/2 exists only in ℚ | Coherent action and coefficient hypotheses retained | None |
| Completed tensor convention | Completed sphere and zero | S_p^∧⊗̂S_p^∧=S_p^∧; 0⊗̂S_p^∧=0 | Correct tensor unit | None |
| GeneralizedCohomology p-local finite-duality contract | Sphere, Moore, finite subwedges | Duals S_(p),Σ⁻¹S/p; colim finite subwedges=whole wedge | Separate p-local specialization retained | None |
| Weak-ring finite-Postnikov contract | Hℚ,n=0; H𝔽_p; Q_i,i≤n | H̃_*(BC_p;ℚ)=0; H̃_(n+1)(K(C_p,n+1);𝔽_p)=𝔽_p≠0 and infinity support nonempty; Q_i has support {i} | Infinity endpoint cannot be omitted | None |
| Spectral ringed-site contract | Spec A; 0,O,O∨ΣO | Global sections 0,A,A∨ΣA; affine tensor unit A | Distinguishes spectral module/descent interface | None |
| Stable James splitting contract | W=*,S¹,S²,S⁰ | Reduced wedges 0,⋁_(r≥1)S^r,⋁_(r≥1)S^(2r); disconnected components ℕ versus ℤ | r=0 and disconnected alternatives fail | None |
| Layer 0 localization examples | Detector 0,S,Hℚ; X=S,S/p | Outputs 0,S,Hℚ; Hℚ⊗S/p=0 | Both extreme reflectors discriminate | None |
| Layer 1 orientation comparison | Hℤ,KU; coordinate z↦−z | Laws X+Y and X+Y+XY; negative coordinate gives X+Y−XY | Sign fixed | None |
| Layer 1 coordinate invertibility | z↦pz over ℤ_p | Linear coefficient p is not a unit; reduction has derivative 0 | Not a coordinate isomorphism | None |
| Layer 1 BP versus MU | p=3, degree 2 | BP has no degree-2 monomial:0; MU_(3) gives ℤ_(3) | Retract is distinct from whole MU | None |
| Layer 1 Morava coefficients | K(0),K(1) at 2,H𝔽₂ | Degree (0,2,3) values (ℚ,0,0),(𝔽₂,𝔽₂,0),(𝔽₂,0,0) | Endpoints distinguished | None |
| Layer 1 coefficient cofibers | n=1, BP⟨1⟩/v₁,k(1)/v₁; n=0 | π₀=ℤ_(p),𝔽_p; Hℤ_(p)/p=H𝔽_p; K(0)⊗K(1)=0 | Distinct quotients retained | None |
| Layer 2 type | Sphere, Moore, zero | Types 0,1,∞; smash types max(0,1)=1,max(1,∞)=∞ | Zero has no finite exact type | None |
| Layer 2 nilpotence endpoint | Unit of H𝔽_p and zero ring | All finite K-smashes 0 but 1^r=1≠0 in H𝔽_p; for 0,1=0 | Infinity detector essential | None |
| Layer 2 thick classification | Sphere, Moore, zero | Thick closures C₀,C₁,{0}; rational homologies ℚ,0,0 | C₀≠C₁ | None |
| Layer 2 self-map test | p on S/p; v^a | p induces 0 on K(1)_*(S/p); degree(v^a)=ad | p is not a v₁ self-map | None |
| Layer 2 common powers | id,v,v²; odd sign | Matched exponents (1,1),(2,1); degrees d,2d; (−1)²=1 | Eventual, not immediate, commutation | None |
| §3.1 periodic-group definition | *, bounded Hℤ, type-n V | Colimits 0,0; identity of V survives as v^r≠0 | Excludes zero periodic functor | None |
| §3.1 map functoriality | Identity, zero, two identities on V | Periodic identity class maps to itself, to 0, to itself under composition | Correct variance in X | None |
| §3.1 stable/unstable API | Ω∞X, large j | [Σ^jV,Ω∞X]=[Σ∞Σ^jV,X] on the same cofinal tail | No negative unstable group used | None |
| §3.1 periodic degree-shift API | v and v² of degree d,2d | Tails r≥1 and r even have same colimit; one transition shifts k to k+d | Shift and cofinality agree | None |
| §3.1 relative height-zero iff | id_BS₃; BS₃×K(ℤ/q,2)→BS₃ | Higher maps 0→0; fiber π₂[1/p]=0 for q=p,ℤ/q for q≠p; π₁F=0 | Both directions agree without tensoring S₃ | Direct G2.10 supplier citation |
| §3.1 unstable representatives | Moore at p=3 and 2 | Odd-prime degree 4; at 2 use degree-8 Adams power, not degree 2 | Finite suspension representative required | None |
| §3.2 cover invariance | Σ⁻¹Hℚ; Hℤ | Before/after cover positive-height periodic groups are 0 | n≥1 essential | None |
| §3.2 orthogonality | K(n),Hℚ,H𝔽_p versus T(n) | Nonzero,0,0 detector smashes | Includes ∞ | None |
| §3.2 S/p implication | X=S/q,q≠p | S/p⊗S/q=0 and T(n)⊗S/q=0 | Correct implication direction | None |
| §3.2 completion comparison | S→S_p^∧, positive height versus 0 | Same positive periodic groups; π₀[1/p] gives ℤ[1/p]→ℚ_p, not onto | Height-zero exclusion retained | None |
| §3.2 periodic-group acyclicity iff | Hℤ,V | Pairs (periodic groups,telescope smash)=(0,0),(nonzero,nonzero) | Both directions distinguish | None |
| §3.3 unital magma comparison | 0,K(n), rational nonassociative HA | Detector pairs (0,0),(nonzero,nonzero),(0,0); (a²)a=0 while a(a²)=1 | Associativity unnecessary | None |
| §3.3 unit law | Zero multiplication on nonzero R | η-action composite 0≠id_R | Wrong zero product excluded | None |
| §3.3 associative telescope model | End(U∨U) | e₁₂e₂₁=e₁₁≠e₂₂=e₂₁e₁₂ | E₁ structure retained, commutativity not asserted | None |
| §3.3 height-zero restriction | R=H𝔽_q,q≠p | S[1/p]⊗R=R≠0; Hℚ⊗R=0 | n≥1 essential | None |
| Layer 3 telescope laws | 0,id_V,v²,p on sphere | Tel(0)=0,Tel(id)=V,Tel(v²)=Tel(v); π₀Tel(p)=ℤ[1/p] | Separate all-spectra bottom | None |
| §4.1 tower definitions | S,n=0; S/q,n=1 | Outputs Hℚ versus S[1/p]; on S/q,0 versus S/q | Two conventions distinct | None |
| §4.1 units/naturality API | X=Hℚ,0 | Units and tower transitions id on Hℚ, unique on 0; composites id,id | Unit-compatible towers | None |
| §4.1 locality and positive-height Check | X=K(1),n=1 | Both towers fix K(1)≠0; both bottom-only functors give 0 | Constant-bottom wrong towers fail | Retained earlier nonblocking repair |
| §4.1 smashing API | Hℚ, S/p at n=0 | Hℚ⊗Hℚ=Hℚ; Hℚ⊗S/p=0=L₀S/p | Correct idempotence/tensor formula | None |
| §4.2 kernel | n=0,S/p,S/q | P-finite outputs 0,S/q; rational-bottom outputs 0,0 | All-spectra kernel discriminates | None |
| §4.2 compact quotient | Localized sphere | Maps from the local unit compute π₀; π₀ of filtered local colimit is colim π₀ | Compactness is in local category | None |
| §4.3 p-local comparison | S_(p),0; excluded S/q | Permitted pairs (Hℚ,Hℚ),(0,0); excluded pair(S/q,0) | Hypothesis essential | None |
| §4.4 fracture | (E,F)=(0,S),(S,0) | Vertices(X,X,0,0),(X,0,X,0); both pullbacks X | Both degenerate orientations agree | None |
| §4.4 sufficient smashing hypothesis | E=S[1/p],F=T(1); X=S/q | Lower corner S/q, upper-right 0; pullback S/q | Correct m=0 bottom | None |
| §4.5 bottom finite-local comparison | 0,S/q,q≠p | L₁^(p,f)X and X[1/p] both 0,S/q respectively | No p-local restriction needed | None |
| Layer 4 fixed/acyclic examples | Hℚ,H𝔽_p | Both towers give Hℚ and 0 respectively | Each detector calculation agrees | None |
| §5.1 finite telescopic functor | *, finite Postnikov, Ω∞T(n) | Φ_v values 0,0,nonzero | Wrong zero functor excluded | None |
| §5.1 homotopy API | Type-n V, X=V | π_kΦ_v colimit contains surviving periodic identity | Groups identify actual spectrum | None |
| §5.1 power API | v,v² | Even-index cofinal subsystem yields same groups and spectrum | Positive powers compatible | None |
| §5.1 finite-source variance API | id_V,0:V→V | Precomposition gives id,0 on the nonzero periodic identity | Contravariant source direction | None |
| §5.1 Ω∞ API | X=T(n),0 | Mapping-localization outputs nonzero,0 on both sides | Correct infinite-loop comparison | None |
| §5.2 Bousfield–Kuhn existence | Ω∞0,Ω∞T(n) | Outputs 0,L_T(n)T(n)≠0 | Headline is nonvacuous | None |
| §5.2 locality/uniqueness API | Wrong Φ_n⊕Hℚ | Finite positive-type sources kill extra Hℚ, but value at * becomes Hℚ, which is not T(n)-local | Locality excludes hidden summand | None |
| §5.2 finite-source API | Zero finite map and identity | Induced maps on Φ_v are 0,id; same under F(V,Φ_n−) | Coherent comparison retains variance | None |
| §5.2 natural Ω∞ API | Identity and zero of T(n) | L_T(n) maps id and 0; same via Φ_nΩ∞ | Naturality has content | None |
| §5.2 no unrestricted height 0 | Σ⁻¹Hℚ | Ω∞=*; p-inversion Σ⁻¹Hℚ≠0 | Missing height-zero functor not substituted | None |
| §5.3 detection and failed preservation | Hℤ→0; Σ⁻¹Hℚ→0 | T(n)Hℤ=0; Σ∞ℤ has sphere retract; at0 negative rational class is lost by Ω∞ | Detection direction/range retained | None |
| Layer 5 Φ_n versus stabilized space | S⁰ | Φ_nS⁰=0; L_T(n)Σ∞S⁰=L_T(n)S≠0 | Different functors | None |
| §6.1 Serre filtration | Base *, empty total space | One column E_t(F_+); empty preimage contributes 0 | Correct unreduced fiber | None |
| §6.1 graded/cellular API | A single s-cell | Quotient Σ^s(E⊗Σ∞_+F); π_(s+t)=E_t(F_+) | Suspension sign agrees | None |
| §6.1 differential | r=2,(s,t)=(2,0) | Target(0,1); total degrees 2→1 | Homological indexing fixed | None |
| §6.1 monodromy API | Reflection torus and identity torus | 1−(−1)=2 gives ker0,cokerℤ/2,H₂=0,H₁=ℤ⊕ℤ/2; identity gives0,H₂=ℤ,H₁=ℤ² | Constant system wrong for reflection | None |
| §6.1 convergence API | KU,ℂP∞ | E²=ℤ at even s≥0,even t; parity kills every d_r; union finite-stage image filtrations=KU_*(ℂP∞) | Infinite base/nonconnective coefficient retained | None |
| §6.2 fiberwise comparison | id_Y,∅→*,two-point fiber | Augmentations id_E,0→E,fold E⊕E→E with fiber E | Empty/two-point wrong hypotheses excluded | None |
| §6.2 Kan-extension route | Constant point fiber on Y | Both colimits E⊗Σ∞_+Y | No boundedness needed for this route | None |
| §6.3 nullification definition | V,K(ℚ,2),V∨K(ℚ,2) | Outputs *,K(ℚ,2),K(ℚ,2); reduced rational mapping groups of V all0 | Identity and constant wrong functors fail | None |
| §6.3 nullification universal property | V-null Z; source V | Map_*(N_VV,Z)=*≃Map_*(V,Z) | Output and unit determine reflector | None |
| §6.3 idempotence API | *,K(ℚ,2) | N_V²=N_V on outputs *,K(ℚ,2); units equivalences | Correct null objects | None |
| §6.3 rational/periodic API | Simply connected p-local K(ℚ,2) | Rational π₂=ℚ before/after; all positive periodic groups 0 | p-local rational comparison retained | None |
| §6.3 sharp bound | n=1; K(ℤ/p,n) | m=n+1=2; boundary object has connectivity n,nonzero K(n)-homology | Boundary excluded | None |
| §6.3 arbitrary-endpoint map theorem | BS₃ product projections with q=p,q≠p | π₂F[1/p]=0,ℤ/q; reduced p-inverted H₂=0,ℤ/q | No fundamental-group abelianization | None |
| §6.4 connective preservation | Identity; Hℤ→0 | Identity cofiber 0; latter fiber π₀=ℤ violates m≥2 | Forbidden preservation shortcut excluded | None |
| §7.1 marked realization | h=1,2,3; additive law | Deformation parameter counts0,1,2; h=1 ringℤ_p; additive h=∞ excluded | Higher finite heights retain exact range | None |
| §7.1 formal identification API | Multiplicative h=1; h=3 Honda | π₀=ℤ_p,W(k)[[u₁,u₂]]; special fibers give original marked laws | Algebraic marking retained | None |
| §7.1 locality/evenness API | h=1 KU_p^∧ | π₀=ℤ_p,π₁=0,π₂=ℤ_p; K(1)-localization fixes it | Spectrum, not just coefficient ring | None |
| §7.1 uniqueness API | Two differently named periodic generators | u and w=u⁻¹ have degrees−2,+2; same marked deformation and Laurent ring | No canonical coordinate claim | None |
| §7.2 coherent action API | Identity, ψ₋₁ at odd p | u↦u,−u; ψ₋₁²u=u; π₀ fixed | π₀-only action insufficient | None |
| §7.2 coefficient continuity/restriction API | a∈ℤ_p^× modulo pʳ; finite {±1} | Multipliers a^m reduce compatibly mod pʳ; finite subgroup square=id | Adic and coherent restrictions agree | None |
| §7.2 residue-field action | h=2,3 | Frobenius orders2,3 on 𝔽_(p²),𝔽_(p³) | Galois factor retained | None |
| Layer 7 Adams normalization | p=3,a=2, degrees2,−2 | Multipliers2 and1/2 in ℤ₃; at a=−1 both−1 | Inverse periodicity correct | None |
| §8.1 homotopy-action locality | M=R,0; zero action on M≠0 | Unit-action composites id_R,0=id_0,0≠id_M | Homotopy unit excludes zero wrong model | None |
| §8.1 height-ideal criterion | Multiplicative, additive characteristic-p, zero ring | Ideals (p,v₁)=(1),0≠(1),0=(1) respectively | Uniform bound and empty Spec behave correctly | None |
| §8.2 local telescope comparison | L_(n−1)S,K(n); KU_(p),n=1 | Reflector pairs(0,0),(K(n),K(n)); KU coefficients ℤ_(p) before K(1)-completion,ℤ_p after | Restricted domain retained | None |
| §8.3 height-one equality | p=2 and odd p | Both detector localizations agree; type-one telescope remains nonzero | Includes corrected prime-two source | None |
| Part II higher separation statement | p=2,n=2,k=0 | Fixed-point ring π₋₁=H¹(ℤ;ℤ₂)=ℤ₂; claimed X has L_T(2)X=X and L_K(2)X≠X | Statement/source range consistent; dependency cycle is separate | Assigned to Part II in Scope and ownership |
| Part II fp-type index | ku₂^∧⊗cofib(v₁⁴ on S/2); ku₂^∧⊗S/2 | 𝔽₂[v₁]/v₁⁴ in degrees0,2,4,6; versus 𝔽₂[v₁] in infinitely many degrees | fp-type1, not0 | None |
| Part II adjacent-height ring identity | Hℤ_p,n=2; excluded E₂ | Both localizations0 for Hℤ_p; E₂ versus completed W(k)((u₁)) coefficients differ | T(n)-acyclicity essential | None |
| §8.4 BP truncation support | n=0; n=1,i=2 | T(i)Hℤ_(p)=0; T(2)BP⟨1⟩=T(2)E(1)=0 | All-prime module route retained | None |
| §8.4 inversion versus rationalization | n=1,degree−(2p−2) | Rational groups 0 versusℚ; T(1)-localized cofiber 0 | Not an L₁^f-equivalence | None |
| Layer 8 Ravenel class example | BP[p⁻¹],Hℚ | Same rational acyclics; degree2p−2 groupsℚ versus0 | Bousfield class not spectrum equality | None |
| Layer 8 smashing examples | n=0,X=S,S/p | Both sidesHℚ,0; identity/zero substitutes fail on S/p,S | Empty Check block repaired | Added computed Checks |
| Layer 8 convergence versus finite factorization | H(ℤ/pʳ) tower | Limitπ₀=ℤ_p; finite-stage factors killed by pʳ, while pʳ·1≠0 inℤ_p | Convergence does not imply finite factorization | Made vague assertion explicit |
| §9.1 localized norm | G=1; Hℚ,H𝔽₂ with C₂ | Normid,×2,0; cofibers0,0,nonzero | Localized versus raw distinction retained | None |
| §9.2 transfer criterion | Rational C₂,C₃,S₃; integral C₂ | Degrees2,3,6 with sections1/2,1/3,1/6; integral×2 has no section | Augmentation cannot replace transfer | None |
| §9.2 cyclic Kahn–Priddy | Shifted cyclic transfer | Section after Ω^(∞+1); integralπ₀ unshifted transfer×p has no inverse | Suspension shift substantive | None |
| §9.3 telescopic Tate | KU_p^∧ with trivial C_p | Rawπ₀=ℚ_p(ζ_p)≠0, T(1)-local output 0 | Raw vanishing not inferred | None |
| §9.3 induced nonabelian action | Ind_1^G L_T(n)S, G=C₂,S₃ | Orbits=fixed=L_T(n)S; normid; raw cofiber 0 | No inversion of group order used | None |
| §9.4 finite-local blueshift | n=1,KU_p^∧; X=0,S[1/p] | KU Tate rational/p-inverted; zero output 0; p-inverted input Tate 0 by averaging | Height drops at least one, not exactly one | None |
| §9.5 Euler inversion | p=2,3 | 2+z=0 givesℚ₂; z²+3z+3=0 and z²=−3ζ₃ givesℚ₃(ζ₃) | Nonzero raw Tate field | None |
| §9.5 KU locality comparison | p=2,3 | KU_(2)≃E(1); at3 two shifted summands; completedπ₀=ℤ_p | Completion justified by local theory | None |
| Layer 9 integral Tate example | Hℤ,C₂, even/odd degree | Tate groupsℤ/2,0; p-inversion and positive telescopes kill every H𝔽₂ summand | Nonzero input is not finite-local | None |
| §10.1 absolute Dₚ definition | H𝔽_p; zero θ | P(0)=0,P(1)=1; zero θ givesP(1)=0≠1 | Unit square fixes operation | None |
| §10.1 relative Dₚ-E definition | E at p=2,θ twisted by1+z | Restriction atz=0 unchanged; P(1)=1+z≠1; modulo height-two maximal ideal,(1+z)²−(1+z)=z²+z≠0 | Relative data imply neither unit nor multiplicativity | None |
| §10.1 E∞ specialization API | E,classes0,1 | P(0)=0,P(1)=1,P(1·1)=1; additive discrepancy is transfer | Strong laws restricted correctly | None |
| §10.1 quotient zero-detection | R=0,x=0 | Source and targetπ₀ groups 0; P(0)=0 | Zero-algebra case consistent; cofibers retained | None |
| §10.1 p-series divisibility | p=2,h=2,k=1; h=1 | Before reductionu₁z² blocks division byz⁴; mod(2,u₁),g₂ leading coefficientu₂; h=1 rangeempty | No negative or out-of-range parameter | None |
| §10.2 Hahn upward theorem | H𝔽_p; bare K(r) | Consecutive detectors(0,0); for K(r),lower0 and own nonzero | Bare associative counterexample excluded by Dₚ | None |
| §10.2 bottom implication | H𝔽_q,q≠p | Hℚ-smash 0,T(0)-smashH𝔽_q≠0 | Only T(0)-acyclic⇒rational-acyclic used | None |
| §10.3 ring height definition | 0,H𝔽_p,Hℚ,H𝔽_q,Hℤ_(p),KU_p^∧ | Heights−1,−1,0,0,0,1 | Matches first vanishing threshold | None |
| §10.3 threshold iff API | Hℚ at n=−1,0 | T(0) smash nonzero, T(1) smash 0; 0≤−1false, 0≤0true | Both directions agree | None |
| §10.3 monotonicity API | Hℤ_(p)→H𝔽_p; R→0 | Heights0→−1 and ht(R)→−1 | Direction decreases | None |
| §10.3 infinity and negative endpoint API | Empty vanishing set; H𝔽_p | infempty=∞; all finite detectors vanish gives−1 whileπ₀=𝔽_p≠0 | Height−1 does not mean zero | None |
| §10.4 Tate height converse | Hℚ,KU_p^∧,H𝔽_p | Tate 0; KU raw field nonzero butT(1)-acyclic andT(2)KU=0; H𝔽_p all finite detectors0 | Conclusion starts at i+1 | None |
| §10.4 weaker intermediate statement | M=0,E_(i+1), including i=0 | Detector pairs(0,0),(nonzero,nonzero); rational Euler-inverted coefficientnonzero | Homotopy-E input retained | None |
| §11.1 real Bott comparison | A=ko,0; degree−8 | Relative tensorsKO,0; rational groups 0→ℚ forko→KO | Positive-height restriction essential | None |
| §11.1 real coefficient normalization | α²=4β; complexification | (2b²)²=4b⁴; alternativeα²=β would force4=1 | Factor four retained | None |
| Layer 11 ko examples | Degrees0,1,2,3,8 | ℤ,ℤ/2,ℤ/2,0,ℤ; complexβ imageb⁴ degree8 | Distinguishesko fromku | None |
| §12.1 elliptic affineness/projection | SpecA; V=0,S,S∨ΣS | Both sides0,A,A∨ΣA; ΓO=A | Quasicoherence retained | None |
| §12.2 modular bounds | Ordinary,nodal,supersingular; n≥3 | Heights1,1,2; higherT(n)-smashes 0; n=2 discriminant cofiber localized0 | Includes p=2,3 | None |
| §12.2 connective distinction | Rational degree −21 | tmf group 0; Tmf has nonzero negative class | No height-zero connective equivalence | None |
| §12.3 Galois definition, fixed-point API | Trivial C₂,S₃ torsors | B=A²,A⁶; B^hG=A | Base recovered with actual action | None |
| §12.3 tensor-product API | Same torsors | B⊗_AB=A⁴,A³⁶=∏_GB | Formula b₁g(b₂) has correct factor count | None |
| §12.3 faithfulness API | Trivial torsor; B=0,A=Hℤ; A=0 | Projection recoversM; zero B kills Hℤ≠0; zero A has only M=0 | Independent conservativity requirement | None |
| §12.3 full-level theorem | N=1,2,3,5 | GL₂ orders1,6,48,480; N=2inertia −1 fixes basis | All positive levels retained, small stacks essential | None |
| §12.3 action convention | Upper g,lower h over𝔽₃; diag(−1,1) | gh gives (2P+Q,P+Q); hg gives (P+Q,P+2Q); pairing ζ↦ζ⁻¹ | Right basis action gives left pullback action | None |
| §12.3 prime-localization API | N=3,p=2; N=2,p=2 | 3 invertible in ℤ_(2), cover retained; inverting 2 kills 2-primary coefficient test | Level inversion is explicit | None |
| §12.4 supersingular comparison | p=2,3 | Geometric/residue orders24·2=48,12·2=24 | Galois factors cannot be omitted | None |
| Layer 12 sheaf/global grading | Descent bidegree(1,2r) | Total degree2r−1odd despite even homotopy sheaves | No even-global-homotopy inference | None |
| §13.1 units definition | H𝔽₂,H𝔽₃,zero ring | Unit component counts 1,2,1; additive counts2,3,1 | Excludes nonunits | None |
| §13.1 Thom colimit/universal API | Trivial line on point / two points | Mf=R,R⊕R; maps out Hom(R,M),Hom(R,M)² | Correct source and target | None |
| §13.1 base-change API | R→R′,pointline | R′⊗_RR=R′,same as transported Thom line | Coefficient direction correct | None |
| §13.1 E_n API | Trivial loop input, point | ThomunitR with its E_n structure;zero R stays 0 | Structured input retained | None |
| §13.2 Hopkins–Mahowald | p=2,3 | Selected units−1,−2; Thom π₀=𝔽₂,𝔽₃ | p-complete unit class correct | None |
| §13.2 integral completed cover | Completed / uncompleted S³ | ker/coker(ℤ_p→ℤ_p)=0,0; coker(ℤ→ℤ_p)=ℤ_p/ℤ | Cover index 4 and completion essential | None |
| §13.3 James-filtered definitions | m=0;(p,m)=(2,1),(3,1),(3,2) | Indices 0,1,2,8; y(0)π₀=ℤ_p; laterπ₀=𝔽_p; integralπ₀=ℤ_p | Zero and odd-prime branches retained | None |
| §13.3 transition/colimit API | Degree-zero families | Integral transition maps id_(ℤ_p); mod-p id_(𝔽_p); z→y reduction mod p; colimit groupsℤ_p,𝔽_p | Completed colimits agree | None |
| §13.3 Postnikov fiber | J₁S²→K(ℤ,2) | π₂map id_ℤ; fiberπ₁=π₂=0 | Cover index 3 | Direct G2.10 supplier citation |
| §13.4 Thom support | m=1,2; y,z | y-ranges{0},{0,1}; z-ranges empty,{1}; rational π₀z=ℚ_p≠0 | Integral bottom excluded | None |
| §13.4 slope denominator | (p,m)=(2,1),(3,1),(3,2) | Denominators 2,4,16; slopes 1/2,1/4,1/16 | Nonzero; v₀ handled separately | None |
| §13.5 arbitrary-E James acyclicity | Hℚ,K(ℤ/p,1); W=* | Reducedrationalgroups 0; positive tensor algebra on 0 = 0; point wedge 0 | Not restricted to telescopes | None |
| §13.5 reduced-index convention | W=S²,E≠0 | Cells 2,4,6,…; spurious r=0 adds E≠0 | Wedge excludes unit | None |
| §13.5 finite-type specialization | Type m>n,n=1,p-localW | K(0),T(1)smashes 0; p-inversion equals rationalization 0 | Bottom specialization correct | None |
| Layer 13 connected James theorem | S⁰ versus S² | π₀J∞S⁰=ℕ≠ℤ=π₀ΩS¹; J₂S² has cells 2,4 | Connectedness essential | None |
| Worked examples | q≠p;ζ₃;Bott; reflection; completed fiber | S/q≠0 versus rational 0; (ζ₃−1)²=−3ζ₃;4b⁴=4b⁴;H₁=ℤ⊕ℤ/2;uncompleted π₂=ℤ_p/ℤ | All agree with their section formulas | None |


Pull request: #1643 (roadmap/chromatic-homotopy-theory at 1393f69)
