# GeneralAlgebraicKTheoryPartII port report

Branch: `roadmap/general-algebraic-k-theory-part-ii`.
Head commit: `04493c3a1299881e346de2707b9694ad7d6b48d1`.
Base: `c994070`; the initial working tree was clean.

The committed scope is exactly `TauCetiRoadmap/GeneralAlgebraicKTheoryPartII/README.md`, `TauCetiRoadmap/GeneralAlgebraicKTheoryPartII/Suggested.lean` and `TauCetiRoadmap/GeneralAlgebraicKTheoryPartII/metadata.toml`. The top-level roadmap list and pins are untouched. The instruction's parent README does not exist in this worktree layout; the repository-root README and CONTRIBUTING were read instead. Main-roadmap models read include FinancialMathematics, RepresentationTheory and SchubertGeometry; the mathematical suppliers were inspected separately.

## Validation

Build command: `lake build TauCetiRoadmap.GeneralAlgebraicKTheoryPartII.Suggested`.

```text
✔ [8954/8954] Built TauCetiRoadmap.GeneralAlgebraicKTheoryPartII.Suggested (1.5s)
Build completed successfully (8954 jobs).
```

Exit 0; warning count **0**. The Lean file has no declarations and therefore no admitted proofs or associated warnings. README edits after this build do not alter the built module.

Final push gate, exit 0:

```text
gate GeneralAlgebraicKTheoryPartII: set_option=0 blob=0 latex=0 tex=0 prnum=0 sorry-data=0 sorry-examples=0 residue=0 private-paths=0 imports=0 mathlib-subimports=0 no-import-mathlib=0 lean-lines=0 forbidden=0 dropped=0 readme-ids-missing=0 empty-sections=0 round-labels=0 long-fences=0 layer-ids=0 target-ids=0 depcheck=0 metadata=0 stray-files=0 dirty=0 outside-folder=0 source-material=0 OK
```

The required dependency command, with the supplied order, content checkout and `--movable`, returned exit 0:

```text
depcheck: 195 roadmaps, 1232 edges, 0 problem(s)
```

There is no UPWARD, CYCLE or moved line. The final resolver, supplied with `.lake/packages`, found no cross-roadmap citations or Lean names found nowhere. Its comparison used main `c994070` and the indexed open heads. The source-register check returned `0 problem(s)`; all 33 registered legal source texts were available. `git diff --check` is clean.

## Draft pull request body

Build enhanced additive and stable-envelope comparisons, restricted truncating invariants and the chromatic library needed for telescopic purity and redshift in algebraic K-theory. Starting from GeneralAlgebraicKTheory's classical models and RefinedTraceMethods' stable categorical K-theory, the roadmap reaches Theorem A, finite-sphere vanishing, two-height purity and redshift at every prime, then develops rational-transfer descent, height-one excision and homotopy invariance, continuity and cyclic assembly, with nonconnective and modular coefficient applications.

AI assistance: prepared and checked with Codex (GPT-6). The mathematical specification is the README; the acceptance module documents the headline theorems and their missing spectral carriers at the pins.

## Supplier roadmaps still in pull requests

GeneralAlgebraicKTheory; StableHomotopyKTheory; StableHomotopyKTheoryPartII; RefinedTraceMethods; AInfCohomology; HomotopySpheres; EllipticCohomology; QWittVectors; KTheoryLowDegrees; KTheoryFiniteLocalFields; SchemeKTheoryOperations.

EnhancedDerivedSheaves, BordismFormalGroups, GeneralizedCohomology, TopologicalKTheory, AlgebraicTopology and ModularCurves are consumed from main, including where an open proposal also revises them.

## Acceptance file and signature audit

Nothing moved from Lean to README. Suggested.lean is byte-for-byte the accepted package file: one `import Mathlib`, one module docstring, the requested namespace and no declarations. Its inventory names all spectral headline families and the carriers each needs. Both pinned libraries were searched by mathematical object: spectra and spectral rings, enhanced stable categories, periodic localizations, higher K/NK, TC, Thom and Morava objects. Ordinary prime spectra, spectral sequences and categorical Grothendieck groups do not supply those carriers. No headline can be stated by adding a few simple native definitions; no weaker replacement was added.

The mechanical declaration inventory has zero definitions, instances, structures, theorems or examples. Consequently the requested list of `#check @name` commands is empty, and there are no elaborated local signatures or binders to compare or repair. The module elaborated successfully through the required build; no additional Lean command was needed. No Tau Ceti module is used by this import-only file.

Pins actually inspected: Mathlib `f6090c7095e1e56b3464c1daba5f24631f1290d2`; Tau Ceti `358314d4ab97483df4fc4cb8adcc02e74a8d9f5a`. These agree with this worktree's manifest, rather than the older revisions recorded by package reviews.

| Native supplier inspected | Actual scope retained |
|---|---|
| `Mathlib/AlgebraicTopology/Quasicategory/Basic.lean:41`, `SSet.Quasicategory` | Inner-horn filling; neither stability nor a spectral K functor. |
| `Mathlib/CategoryTheory/Idempotents/Karoubi.lean:43`, `CategoryTheory.Idempotents.Karoubi` | An object, an endomorphism and its idempotence equation; no enhanced quotient. |
| `Mathlib/CategoryTheory/Triangulated/TStructure/Basic.lean:54` and line 262 | Native t-structure and bounded object property; upper and lower bounds depend on the object. |
| `TauCeti/CategoryTheory/Exact/ExactStructure.lean:241` | Category, preadditivity, zero object and binary biproducts remain required. |
| `TauCeti/Algebra/Category/ModuleCat/CartanMap/Basic.lean:226` and line 235 | Finite-projective induced exact structure and its equality with the split structure. |
| `TauCeti/CategoryTheory/GrothendieckGroup/Split.lean:113`; `Abelian.lean:79`; `Triangulated.lean:139` | Ordinary presented groups; essential smallness and the appropriate additive, abelian or pretriangulated hypotheses are retained. |
| `TauCeti/CategoryTheory/GrothendieckGroup/FiniteDimensionalVectorSpace.lean:148` | `TauCeti.SplitK0.finrankEquiv` retains `[Small k]`; its object formula sends a line to 1. |
| `Mathlib/RingTheory/WittVector/Defs.lean:52` | The native p-typical Witt carrier used in the Lubin–Tate coefficient formula; not the big Witt/NK action. |

## Supplier replacements, ownership and duplication

The package's supplier boundaries are retained. Stable categorical K, correction algebras, multiplicative K, trace and TC remain RefinedTraceMethods' constructions; classical plus/Q/S, Nil and Bass stay with GeneralAlgebraicKTheory; native ordinary K₀ stays with Tau Ceti and KTheoryLowDegrees. GeneralizedCohomology and BordismFormalGroups supply the spectral substrate and p-local chromatic theory. QWittVectors supplies the big Witt carrier and inverse-product comparison; the NK action and its negative-degree extension remain here.

StableHomotopyKTheoryPartII's design locator PO.4 is replaced throughout by its actual §§4.4–4.5, read at the supplied open head. The degree-zero power operation and transfer ideal are consumed, with no local restatement as owned constructions. The old CH labels in Downstream consumers are replaced with ChromaticHomotopyTheory's actual numbered layers. In §4.13 the space Postnikov construction is explicitly used from StableHomotopyKTheory; the owned content is its connected-cover indexing and convention comparison. These ownership boundaries are recorded in Scope and ownership; no target-number stub is introduced.

Object searches used `roadmaps grep` across the indexed main and open heads, with sufficiently large limits and narrower followups for Bousfield–Kuhn, Tate/blueshift, stable envelopes/hearts/Morita, Witt/NK, redshift/purity, correction algebras, cyclic assembly, Morava realization and spectral affineness. The same search was made in board-package READMEs. Relevant open-head matches and main supplier passages were read, including BordismFormalGroups F6.3–F6.5, EnhancedDerivedSheaves E0.4/E0.7/E3.1/E5, RefinedTraceMethods §§2.1–2.19 and 4.6–4.19, and the stated sections of the other suppliers. No new fully qualified Lean name can collide because this module declares none. No further mathematical target was deleted during this port.

The material overlapping ChromaticHomotopyTheory is deliberately retained here under the accepted package decision and the supplied order: GeneralAlgebraicKTheoryPartII immediately precedes ChromaticHomotopyTheory. Making the latter a supplier would reverse this direction, including its use of purity. Its readable head claims overlapping ownership in Layers 3–13 and asks for two additional BHLS contracts; the accepted package already records the former conflict. Those external files are read-only for this job. This report does not claim that cross-folder reconciliation or the additional BHLS requests has been completed. The retained work here is the general chromatic prerequisite needed by this earlier roadmap, rather than a purity-specific shortcut.

## Mathematical and editorial fixes

- §2.2: removed conflicting prose that made the general connective excision target sound restricted to discrete Milnor squares. The stated tensor condition and acyclic auxiliary-ring hypotheses now agree throughout. Evidence: lt line 1182 and lt line 1197; the discrete surjective case is a special case.
- §3.5: specified the perfect prestable Freyd envelope as the finite-colimit closure of space-valued additive representables, added its finite-limit/loop API and a third discriminating Check. At k, the suspended representable has π₁=k and π₀=0, while ordinary representables are discrete; looping recovers the representable. Evidence: pp line 1595, pp line 1642 and pp line 1651.
- §4.13: listed the indexing comparison's naturality, fiber and connectivity API without planning the supplier's Postnikov construction again.
- §4.14 and the BordismFormalGroups contract: named general straightening and pointwise Kan-extension composition explicitly. EDS's restricted straightening alone is not asserted to cover an arbitrary space base; BordismFormalGroups F6.5 provides the general construction used by the proof.
- §4.26: distinguished the transfer class from its integer basepoint restriction. At p=2, P(2)=2+tr(1), res P(2)=4 and res tr(1)=2, but the constant c(2) is nonzero in the Morava transfer quotient. Thus saying that the integer 2 itself vanishes there would contradict the preceding Check. The p=3 restriction discrepancy is 6. Evidence: hahn line 53 and StableHomotopyKTheoryPartII §§4.4–4.5.
- §6.1a: made functoriality, the tilt adjunction, multiplicative coefficient compatibility, composition and base change of nilpotence detection explicit API items. Evidence: bsy line 809, bsy line 1962 and bsy line 2028.
- §6.3: called Yuan nonvanishing an owned lower-bound target, rather than an unexplained imported input.
- §6.6: named the Morava coefficient and connective-cover inputs that supply the separated square-zero test spectrum.
- §7.5: replaced the space Postnikov citation by the spectral Postnikov and multiplicative truncation contracts actually used for τ≤rS.
- §8.1: wrote H(ℚ/ℤ) and specified ordinary finite chromatic L_n^f localization. Global p-inversion would retain its other-primary torsion.
- §9.2: confined the truncating-invariant proof to connective Hℤ-algebras, all K(1)-acyclic, with Hℤ-linear auxiliary correction rings. Discrete-ring acyclicity alone does not imply truncation on arbitrary connective spectral rings. Evidence: lt line 1201.
- §9.7: exposed the module action through the multiplicative unital trace K(ℤ/pʳ)→TC(ℤ/pʳ), which transfers acyclicity to the stage. No height-one K≃TC theorem is assumed. Evidence: lmmt line 1120 and RefinedTraceMethods §4.11.
- Conventions and §8.2: distinguished unit-inserting Amitsur cofaces from multiplication codegeneracies, specified the associative cobar diagram and its API, and added the two-factor ℚ×ℚ witness. The commutative finite-index specialization remains with EnhancedDerivedSheaves E5:descent; the retained ε/rational-unit target allows associative algebras. Evidence: cmnn20 line 567.
- §9.3: clarified that the smooth spectral polynomial algebra is defined for every E₁ input; only its π₀ comparison requires connectivity, as its existing API already specifies.
- §7.4: clarified that p-inversion is exactly the bottom localization in the displayed splitting, without implying a distinction from T(0).
- Normalized excess blank lines and section citations. Metadata remains `topic = "math.KT"`, matching the main K-theory folders. No source passages were copied into the roadmap.

The accepted review reports no remaining nonblocking findings. Its earlier repairs are preserved, including rational D₀ for spectral étale descent, the Witt sign, the Thom-cover indices, all-prime Thom acyclicity, the K-theory shift ΣM, the full semilinear stabilizers and the rational-part hypothesis for global height-zero redshift. Its JSON truncates the units slug to `spectral-units-`; the full reviewed obligation is `spectral-units-and-lines`. The characteristic-series condition is expressed through χ=γ⁻¹ in the QWittVectors contract and §4.36, rather than by a separate literal gap label. Neither discrepancy changes the accepted mathematical conditions.

## Computed adversarial mathematics pass

These are boundary and convention computations, not proofs of the general theorems. Each target's row includes its definition/API on the displayed inputs; separate rows isolate different conclusions or constructions. All degenerate inputs were tested within their hypotheses: zero rings are allowed, fields are nonzero, positive heights and prime parameters retain their ranges. No Lean hypothesis can silently disappear because there are no local declarations. Computations involving finite fields use their supplied K-groups, and chromatic zeros use the stated detector/support hypotheses, not a claim that T(n)=K(n) for arbitrary spectra.

| Statement | Instances tried | Values computed on the compared sides | Result | Change |
|---|---|---|---|---|
| Transfer convention | R→R, free rank 2; finite-free rank 3 | [R²]↦2[R]; [B]↦3[R]; restriction∘extension has rank factor 3 | Pass | Retain |
| Shift convention | k→0→Σk; two suspensions | 0=1+(−1); [Σ²k]=+1 | Pass | Retain |
| Connectivity convention | ΣHℤ→0; S¹→* | Fiber π₀=0, π₁=ℤ in both examples; the space fiber is connected | Pass | Retain |
| Full versus connective mapping spectrum | X=ΣHk,Y=Hk | π₋₁Hom=k; π₋₁τ≥0Hom=0 | Pass | Retain |
| Bottom detector convention | p=2, H𝔽₃; Hℚ | H𝔽₃[1/2]=H𝔽₃; Hℚ⊗H𝔽₃=0; both detectors fix Hℚ | Pass | Retain |
| Height convention | 0,H𝔽_p,Hℚ,H𝔽_q with q≠p | Heights −1,−1,0,0; T(0) values 0,0,Hℚ,H𝔽_q | Pass | Retain |
| Universes and the swindle | κ=ω; uncountable κ | Finite-projective K₀(k)=ℤ at κ=ω; a countable-sum cone has K₀=0 | Pass | Retain uncountability |
| Amitsur convention and §8.2 API | A=ℚ×ℚ,e₁=(1,0) | d₀e₁=e₁⊗e₁+e₂⊗e₁; d₁e₁=e₁⊗e₁+e₁⊗e₂; multiplication sends both to e₁ | Pass | Cofaces/codegeneracies separated |
| Witt sign and inverse denominator | χ=1−rt; ν²=0 | χ(νx)=1−rνx; value at x=0 is 1; χ(0)⁻¹=1 | Pass | Retain |
| Exact stable sequence supplier | C→C→0; 0→C→C | F(C)→F(C)→0; 0→F(C)→F(C), with identity nonzero arrows | Pass | Imported |
| Perfect module supplier | A=0; Hk⊕Hk | Perf(0)=0,K(0)=0; rank(Hk²)=2 | Pass | Imported |
| Stable S supplier | S₀; split S₂ on k,k | S₀=0; middle rank 2=1+1 | Pass | Imported |
| Nonconnective supplier | Flasque category; Perf(k) | K(flasque)=0; K₀(k)=ℤ; K₋₁(k)=0 | Pass | Imported |
| Idempotent completion supplier | Bounded free (k×k)-complexes | K₀ before ℤ, after ℤ²; generator maps to (1,1), not onto (1,0) | Pass | Retain completeness |
| Correction algebra supplier | Identity square | A′⊗_A B=A; correction C=A; comparison id_A | Pass | Imported |
| Multiplicative K supplier | Free ranks 2 and 3; zero ring | Tensor rank 6=2·3; K(0)=0 with scalar action zero | Pass | Imported |
| Circle/finite Tate supplier | Trivial Hℚ; p=2,3 | Finite norm ×2,×3 invertible; raw circle π₀=ℚ; completed circle value 0 | Pass | Retain completion |
| Finite-field supplier | q=2,3; r=1,2 | Odd group orders qʳ−1: 1,3 and 2,8; positive even groups 0 | Pass | q=1,r=0 excluded |
| Real Bott normalization supplier | Degree-4 a, degree-8 b | a²=4b; c(a²)=4u⁴=c(4b); c(b)=u⁴ | Pass at 2 | Retain factor 4 |
| Elliptic grading supplier | Δ,Δ²⁴ | Degrees 24,576; weights 12,288 | Pass | Retain |
| Big Witt comparison supplier | τ(1), N=2 | γ=1+t+t²; χ=1−t; t² coefficients 1 versus 0 | Pass | Retain inverse |
| §0.1 localization | q=id; q:D→0 | Fib(id_KD)=0; Fib(KD→0)=KD | Pass | Retain |
| §1.1 GL | Hℤ,r=1; Hk⊕ΣHk | π₀GL₁={1,−1}; square-zero π₁GL₁=k | Pass | Retain spectral GL |
| §1.1 connected plus comparison | Hk | π₀ of positive K-space=0; K₀(k)=ℤ | Pass | Rank component separate |
| §1.2 additive K | Finite k-spaces; zero category | Group completion ℕ→ℤ, rank 1↦1; zero gives 0 | Pass | Retain |
| §1.2 mapping-spectrum API | ΣHk,Hk | Full π₋₁=k; connective π₋₁=0, Ω∞ unaffected | Pass | Retain |
| §1.3 additive Morita | Generator A; A²; 0 | End_A(A)=A via left multiplication; Hom(A,A²)=A²; End(0)=0 | Pass | Right action fixed |
| §1.3 stable Morita | Perf(k), generator k | Shifts k,Σk generate; their Euler coordinates 1,−1 | Pass | Retain thick generation |
| §1.4 A-theory | X=*; X=S¹ | S[Ω*]=S; S[ΩS¹]=S[ℤ]; augmentation∘unit=id | Pass | Retain |
| §1.4 finite domination | Rank and reduced projective class | Finite-cell Euler image is ℤ[1]; retract completion includes reduced K₀ classes | Pass | Retain retracts |
| §2.1 restricted truncation | F=0; R=HA; k=0 | F-values 0→0; HA→Hπ₀HA=id; τ≤0HA=HA | Pass | Retain |
| §2.1 auxiliary acyclicity | R=H𝔽_p, M=T(i), i≥1 | M⊗R=0; every Postnikov stage equals R; both detector values 0 | Pass | Retain ring action |
| §2.2 excision | Identity-side square over Hk | π₀ tensor k⊗_k k=k; correction comparison id; invariant square error 0 | Pass | Clarified general hypotheses |
| §2.2 nondiscrete control | Identity square on Hk⊕ΣHk | π₁=k≠0; π₀ tensor=k; correction id; zero-invariant square error 0 | Pass | Added Check |
| §2.2 nilinvariance | F=0, k[ε]/ε²→k | I²=0; F(source)=0=F(target) | Pass | Retain auxiliary-domain condition |
| §2.3 coefficient connectivity | Identity; Λ=ℤ/2,ℤ/3 | Coefficient fibers 0 in every degree; shifted connectivity bound holds | Pass | Retain n≥1 |
| §2.3 p-inverted truncation | S[1/p]→Hℤ[1/p] | Mod-p input fiber 0; p-completed relative K=0 | Pass | Retain π₀ isomorphism |
| §2.4 nonpositive K | Hk⊕ΣHk→Hk; j=0,−1 | ℤ→ℤ with 1↦1; 0→0 | Pass | Retain |
| §3.1 amplitude | Hk,ΣHk,ΣʳHk | [0,0],[1,1],[r,r]; shift adds (1,1) | Pass | Objectwise bounds |
| §3.1 nonexample | Finite spectra with standard truncation | τ≤0S=Hℤ has unbounded mod-p homology; not finite | Pass | Retain restriction test |
| §3.2 envelope | Proj(Hk); 0 | Stab=Perf(k); K₀=ℤ; Stab(0)=0 | Pass | Retain |
| §3.2 additive/stable distinction | Perf(k) viewed additively | Additive K₀=⊕_(j∈ℤ)ℤ; stable K₀=ℤ; e_j↦(−1)^j | Pass | No automatic envelope equality |
| §3.3 heart | Perf(k) and finite k-spaces | K₀=ℤ on both; negative groups 0; [Σk]=−1 | Pass | Noetherian hypothesis retained |
| §3.4 regular localization | R=Hk[u], |u|=2 | Cofiber of u is Hk; π₀=k, other πᵢ=0; u-inversion kills it | Pass | Restriction map direction |
| §3.4 identity localization control | R=0 | Kernel=0; sequence 0→0→0 | Pass | Retain actual kernel criterion |
| §3.5 prestable envelope definition | Discrete finite k-spaces; suspended representable | At k, π₁=k,π₀=0; representables have π₁=0; first loop has π₀=k | Pass | Definition/API/third Check added |
| §3.5 limit API | Zero presheaf; product of two k-representables | Zero value 0; product value k²=Hom(k,k²) | Pass | Added API |
| §3.6 bounded-heart fiber | C=0; C=Perf(k) | D=0 at C=0; K₀ map e₀+e₁↦1−1=0 | Pass | Retain |
| §4.1 telescope | Zero self-map; positive power v² | Tel(0)=0; colimit of even subsequence equals Tel(v) | Pass | Supplied positive telescope |
| §4.2 periodic groups | *; bounded ΣʳH𝔽_p | Every sufficiently high stage group 0; periodic colimit 0 | Pass | Retain abelian tail |
| §4.3 completion | Hℚ; Hℤ | Hℚ^∧p=0 but Hℚ[1/p]=Hℚ; positive periodic groups of both vanish | Pass | Positive heights only |
| §4.4 acyclicity iff | H𝔽_p; K(n) | Both positive detectors give 0 on H𝔽_p; both detect K(n) nonzero | Pass, both directions | Ring hypothesis retained |
| §4.4 excluded bottom iff | H𝔽₃,p=2 | T(0) value H𝔽₃≠0; K(0) value 0 | Pass | Bottom not identified |
| §4.5 towers | n=0,S; H𝔽₃,p=2 | Outputs Hℚ and S[1/2] on S; 0 and H𝔽₃ on H𝔽₃ | Pass | Global variant retained |
| §4.6 finite kernels | S/2,S/3;p=2,n=0 | p-finite outputs 0,S/3; ordinary finite outputs 0,0 | Pass | p-primary generators |
| §4.7 comparison | S_(p); Hℚ; H𝔽_q,q≠p | First two bottom outputs Hℚ on both sides; excluded input gives H𝔽_q versus 0 | Pass | p-locality retained |
| §4.8 fracture | H𝔽₃,p=2,m=0,n=1; 0 | First square left column H𝔽₃,right column 0; pullback H𝔽₃; zero square all 0 | Pass | Retain |
| §4.9 bottom comparison | H𝔽₃,p=2; Hℚ | L₁^(p,f)H𝔽₃=H𝔽₃[1/2]=H𝔽₃; rational input Hℚ=Hℚ | Pass | Retain |
| §4.10 finite functor | Finite Postnikov space; Ω∞v⁻¹V | First output 0; second has nonzero [V,v⁻¹V] containing its unit | Pass | Excludes zero functor |
| §4.10 nonconnectivity and powers | Same periodic witness, degrees −d,−2d | Both periodic groups equal nonzero degree-zero group; v² subsequence same colimit | Pass | Excludes connective substitute |
| §4.11 Bousfield–Kuhn | Ω∞Hℤ; Ω∞T(n) | Outputs 0 and L_T(n)T(n)≠0 | Pass | Retain finite-source characterization |
| §4.11 bottom nonexample | Σ⁻¹Hℚ | Ω∞=*; p-inverted spectrum Σ⁻¹Hℚ≠0 | Pass | No bottom functor |
| §4.12 detection direction | Hℤ→0 | T(n)Hℤ=0; reduced Σ∞ℤ has nonzero sphere summands | Pass | Converse excluded |
| §4.13 connected covers | S⁰; K(ℤ,1),r=2 | τ≤0S⁰=S⁰; base component=*; K(ℤ,1)⟨2⟩=* | Pass | Supplier construction used |
| §4.13 homotopy API | S²⟨3⟩→S² | π₂ source 0,target ℤ; π₃ both ℤ | Pass | Indexing API added |
| §4.14 fiber homology | Identity; ∅→*; E=Hℚ | Fiber augmentations id_Hℚ and 0→Hℚ; latter not equivalence | Pass | General straightening supplied |
| §4.15 sharp bound | n=1,2; *=contractible | m=n+1 gives 2,3; reduced spectra and all periodic groups 0 | Pass | Positive range retained |
| §4.16 suspension/loops | id; Hℤ→0 at n=1 | Identity fiber 0; Hℤ fiber π₀=ℤ fails m=2 | Pass | Connectivity retained |
| §4.17 BP/k classes | BP⟨0⟩=Hℤ_(p); BP⟨1⟩ | Bottom inversion class Hℚ; mod-p smash of BP⟨1⟩ nonzero, of E(1) zero | Pass | HF_p term retained |
| §4.18 geometric height | Multiplicative and additive laws over 𝔽_p | Heights 1 and ∞; additive [p]=0, invariant ideal 0≠(1) | Pass | Uniform finite bound |
| §4.19 restricted localization | Hℚ,n=1; L₁S,n=2 | T(1)Hℚ=0; T(2)L₁S=0; comparison 0→0 | Pass | Local input retained |
| §4.20 height one | p=2,3; Hℤ; KU_p^∧ | Both detectors kill Hℤ; both detect KU_p^∧ | Pass | All primes |
| §4.21 BP inversion | n=0,1;p=2 | Hℤ_(2) positive support 0; rational π₋₂ BP⟨1⟩=0 versus E(1)=ℚ | Pass | No rational equivalence |
| §4.22 localized norm | G=1; C₂ on Hℚ | Norm id and ×2; cofiber 0 in each case | Pass | Local cofiber specified |
| §4.23 transfer sections | C₂,C₃ over ℚ | (1/2)·2=1; (1/3)·3=1 | Pass | Transfer distinguished from augmentation |
| §4.24 telescopic Tate | KU₂^∧,C₂; G=1 | KU₂ Tate π₀=ℚ₂, T(1)-value 0; trivial-group Tate 0 | Pass | Raw/local distinction |
| §4.25 blueshift | n=1; zero/rational input | Raw Tate 0; lower reflector p-inversion fixes 0 | Pass | Allows further height drop |
| §4.26 operation normalization | 2 at p=2,3 | res P(2)=4,8; res(P(1)+P(1))=2; differences 2,6 | Pass | Full transfer separated from restriction |
| §4.26 transfer nonconstant | p=2,height≥2 | P(2)−2=tr(1); quotient tr(1)=0, c(2)≠0 | Pass | Corrected Check |
| §4.26 invariant-ideal quotient | p=2,h=2,k=1 | [2](z) mod(2,u₁) begins u₂z⁴; g₂ constant u₂ | Pass | Divisibility after reduction |
| §4.27 Hahn | H𝔽_p; Hℚ | All finite K(i)H𝔽_p=0; K(0)Hℚ≠0, K(1)Hℚ=0 | Pass, one direction | Retain power operations |
| §4.28 height API | 0,H𝔽_p,Hℚ | Vanishing thresholds 0,0,1; heights −1,−1,0 | Pass, threshold iff | Retain |
| §4.29 Tate converse | KU₂^∧, trivial C₂ | Tate π₀=ℚ₂; T(0) not zero, T(1) zero; KU has no T(j) for j≥2 | Pass | Conclusion starts at i+1 |
| §4.30 modular input | p=2,3; n=3 | T(3)tmf=T(3)Tmf=T(3)TMF=0; Δ²⁴ degree 576 | Pass | Connective/global spectra distinct |
| §4.31 Thom unit | p=2,3 | 1−p=−1,−2, both p-adic units; Thom π₀=𝔽₂,𝔽₃ | Pass | All primes |
| §4.31 cover index | S³→K(ℤ,3); alternative K(ℤ₂,3) | Correct fiber π₂=π₃=0; alternative π₂=ℤ₂/ℤ | Pass | Index 4 retained |
| §4.31 integral negative control | Sign model at p=3 | Sphere retract π₃=ℤ/3; π₃Hℤ_(3)=0 | Pass | 2-local statement retained |
| §4.32 Thom families | m=0,1,p=2 | π₀y(0)=ℤ₂; π₀y(1)=𝔽₂; π₀z(1)=ℤ_(2) | Pass | Bottom exception retained |
| §4.32 connected James cover | J₁S²=S² | S²⟨3⟩ π₂=0,π₃=ℤ; S²⟨2⟩ π₂=ℤ | Pass | Index 3 retained |
| §4.32 acyclicity ranges | m=1,2 | Positive ranges ∅,{1}; y bottom=0; z bottom π₀=ℚ | Pass | Retain twisted target |
| §4.32 odd-prime slopes | (p,m,i)=(3,2,1),(5,2,1),(3,2,2) | 1/4−1/16=3/16; 1/8−1/48=5/48; equal-index difference 0 | Pass | Strict i<m retained |
| §4.33 reduced James splitting | W=*; W=S² | Reduced wedge 0; rational homology of second is ℚ in degrees 2,4,6,… | Pass | No degree-zero sphere |
| §4.33 wrong-primary control | Add mod-3 Moore summand at p=2 | Its p-inversion remains ΣS/3≠0 | Pass | Global hypothesis retained |
| §4.34 ordinary unit detection | H𝔽₂; rational/mod-3/mod-2 homology | First two 0; mod-2 π₀=𝔽₂ | Pass | Every prime and height∞ retained |
| §4.34 mapping algebra | R=ℚ×ℚ | Hom(1,R) product (ac,bd); E₁₂E₂₁=E₁₁ versus E₂₁E₁₂=E₂₂ | Pass | Correct mapping source |
| §4.35 nonpositive nilinvariance | ℤ/4→𝔽₂; ℤ/9→𝔽₃; I=0 | K₀ maps ℤ→ℤ,id; K₋₁=0→0; I=0 quotient id | Pass | No positive integral assertion |
| §4.36 Witt action | 𝔽₃[ε]/ε²; a=τ(1),τ(r),0 | Images 1−εx,1−rεx,1; evaluation 1 in every case | Pass | Negative-series convention |
| §4.36 wrong sign | p=3,ν=ε | (1+εx)−(1−εx)=2εx≠0; at p=2 difference 0 | Pass | Characteristic-3 control retained |
| §4.36 ghosts | τ(c); coordinates (0,1) over ℤ | Ghosts cⁿ; for (0,1), w₁=0,w₂=2 and derivative 2t²+2t⁴+⋯ | Pass | Retain χ, not γ |
| §4.36 continuity/contraction | ν²=0; regular field k,j=−1 | Series ≡1 mod t² gives unit 1 on symbol; NK₋₁(k)=0 | Pass | All-integer action |
| §4.37 NK localization | ℤ[1/2][ε]/ε²; 𝔽₂[ε]/ε² | ×2 inverse ×1/2 in first; ×2=0 on square-zero unit subgroup in second | Pass | Separate hypotheses |
| §4.37 relative torsion | ℤ/9,(3) | Units 1,4,7 form group of order 3; relative K₁ p-primary | Pass | Rational nilinvariance |
| §4.38 high connectivity | Identity map, any n≥1 | Input/output fibers 0 in every degree | Pass | Uniform bound retained |
| §4.39 correction connectivity | m=n=0; identity side | Bound 2; actual fiber 0 in every degree | Pass | Retain genuine correction algebra |
| §4.40 finite-stage truncation | k=0,1; R=HA | τ≤0R=τ≤1R=HA; zero versus one finite induction step | Pass | No infinite-limit interchange |
| §4.41 restricted truncation | H𝔽₂,p=2; H𝔽₃,p=3 | Finite-local input 0; completed K=Hℤ_p; every positive telescope gives 0 | Pass | Restricted domain |
| §4.42 p-power coefficients | p=2,3;r=1,2 | K₀(ℤ/pʳ)=ℤ; bottom rational K₀=ℚ; every positive local K=0 | Pass | Does not kill K₀ |
| §4.42 algebra module action | A=𝔽₃[ε]/ε²;i=2 | L_T(2)K(𝔽₃)=0, hence its K(A)-module value 0 | Pass | All associative algebras |
| §4.43 category vanishing | C=0; Perf(H𝔽_p) | End(0)=0; H𝔽_p finite-local=0; positive local K=0 | Pass | Full End required in stable case |
| §4.44 compact kernel | A=S,n=0;p=2 | S/2 killed; S/3 preserved; A=0 kernel 0 | Pass | p-primary kernel |
| §4.45 Mitchell | ℤ,S[1/p]; i=2; i=1 control | T(2)-local K=0,0; height-one K(ℤ)≠0 | Pass | Height≥2 |
| §4.46 Theorem A | A=0; localized A; n=1,2 | 0→0; comparison identity for localized input; bottom removal index starts 2 | Pass | Two forms distinct |
| §5.1 connective cover | A=Hk; KU | Covers Hk,ku; ku→KU K-fiber K(ℤ), with T(2)-value 0 | Pass | n≥2 |
| §5.2 high trace | A=0; KU | Zero zigzag all 0; KU middle cover ku, not KU | Pass | No height-one extension |
| §5.3 genuine transfer | G=1; C₂,C₃ free orbit | Norm id; res∘ind on K₀ equals ×2,×3 | Pass | Genuine/Borel comparison separate |
| §5.4 CMNN base | n=2,m=0 | Sphere S[1/p]; T(2)K=0; m+1=1 outside high-trace range | Pass | Mitchell base retained |
| §5.4 assembly step | p=2,3;m≥1 | p−1=1,2 summands; detector on each connective cyclic-bar term 0, hence cofiber 0 | Pass | §4.19 supplier retained |
| §5.5 purity | A=0,H𝔽_p;n=1,2 | Adjacent-local input 0; positive local K=0; n=1 lower detector S[1/p] | Pass | All E₁ inputs |
| §5.6 nilpotent comparison | id; ℤ/4→𝔽₂; ℤ/9→𝔽₃ | Kernels 0,(2),(3), squares 0; specified positive local relative K/TC 0 | Pass | π₀ condition retained |
| §6.1 upper bound | 0,H𝔽_p,Hℚ,Eₙ | Input heights −1,−1,0,n; upper bounds 0,0,1,n+1 | Pass | Infinity allowed |
| §6.1a perfect-algebra realization | A=0,k; height 1 | E(0)=0; π₀E(k)=W(k); reduction W(k)/p=k | Pass | Adjunction API added |
| §6.1a coefficient functoriality | Identity; 𝔽_p→𝔽_(p²) | Witt map 1↦1; reduction induces same inclusion; identity keeps every coefficient | Pass | Added API |
| §6.1a cover nonvacuity | Identity E(L)→E(L); R→0 | Identity detects maps; R/p has nonzero tensor powers and becomes 0 under R→0 | Pass | Unit compactness not assumed |
| §6.1a rational cover negative control | Hℚ[x]→Hℚ(x)[u±1] | Module R/x nonzero before, 0 after; its tensor powers over R have nonzero π₀=ℚ | Pass | Single generic point insufficient |
| §6.1a parity nonexample | Free E(k)-algebra degree-one generator | π₁ contains its generator; E(A) odd π=0 | Pass | Realization specified |
| §6.2 chromatic field maps | E₁(L); Hℚ; H𝔽_q,q≠p | Identity; characteristic-zero extension; last rationalization 0 and no unital map to char 0 | Pass | Nonzero rational bottom |
| §6.3 Lubin–Tate lower bound | E₁,E₂;p=2,3 | Input heights 1,2; nonzero local K at 2,3 respectively | Pass | Owned target clarified |
| §6.4 bottom lower bound | E₀(L), char L=0 | Completed K π₀=ℤ_p,π₁=ℤ_p, from ku⊕Σku | Pass | Even periodicity fixed |
| §6.5 redshift | Hℚ,E₁; (H𝔽₂)^tC₂ at odd p | Heights 0→1,1→2; excluded ring has ht=0,rationalization 0, positive odd K=0 | Pass | Rational-part hypothesis retained |
| §6.6 both heights | n=1 periodic E₀; square-zero test M | T(1)E₀=0 but T(1)K(E₀)≠0; stable relative K=ΣM, π₁ΣHA=A versus π₋₁ΩHA=A | Pass | Inputs named explicitly |
| §6.7 graded vanishing iff | Hℚ,n=0 p-local; E₁,n=1,2 | First pieces both nonzero; E₁ support at 1 nonzero/2 zero, K support 2 nonzero/3 zero | Pass, both directions | No tower equivalence |
| §7.1 nice predicate | id_Hℤ; Hℤ⊕ΣHℤ→Hℤ | π₀ identity in both; rational π₁ 0→0 versus ℚ→0 | Pass | Negative control retained |
| §7.1 excluded carrier | id_H𝔽_p | π₀=𝔽_p≠ℤ | Pass | Fixed π₀ identification |
| §7.2 K preserves nice | id_Hℤ | Output π₀=ℤ,id; negative K=0; repeated π₀ still ℤ | Pass | Multiplicative output |
| §7.3 iterated finite coefficients | p=2,3;r=1,2;j=1,2 | Rank K₀=ℤ; targets Hℤ,K(ℤ); coefficient map would require pʳ=0 in ℤ, false | Pass | Rank map, not coefficient map |
| §7.4 Morava K coefficients | m=1,p=2,3;i=3 | Possible heights {0,1,2}; T(3)K(K(1))=0; splitting rational ranks π₀=π₁=1 | Pass | Exceptional heights not all asserted nonzero |
| §7.5 truncated spheres | r=0,1;i=2 | τ≤0S=Hℤ; positive bounded-spectrum detectors 0; T(2)-local K=0 | Pass | Spectral truncation citations |
| §7.6 BP localization | n=0,1,2 | Comparison starts at heights 1,2,3; vanishing at 2,3,4; sequence requires n≥1 | Pass | Localized sequence only |
| §7.7 suspension A-theory | W=*; finite type>n | Reduced input 0 in first; every positive James tensor detector 0 in second; A(*) map id for * | Pass | Connected/reduced hypotheses |
| §7.8 Thom K | m=1,2;p=2 | Positive ranges ∅,{1}; y(2) height-one K=0; z comparison with K(ℤ_(2)); bottom π₀z[1/2]=ℚ | Pass | z bottom excluded |
| §8.1 ε-enlargement | Σ=∅; T=0; zero tower | F=0 in intersection gives T; zero transition length 1 | Pass | Definition retained |
| §8.1 rapid versus nilpotent | Constant nonzero tower | Every transition composite id≠0; tower is rapid by definition | Pass | Not conflated |
| §8.1 ordinary/global separator | H(ℚ/ℤ), p=2 | Rational value 0; 3-primary summand survives p-inversion | Pass | Ordinary L_n^f specified |
| §8.2 rational transfer | A=R=M=unit; degree 2 | Unit lifts to 1; cobar error 0; transfer(1/2)=1 | Pass | Denominator nonzero |
| §8.2 quotient mapping algebra | R=ℚ×ℚ; null unit in quotient | Product (ac,bd); μ∘(0⊗id)=0=id_R | Pass | Correct unit source |
| §8.3 Galois descent | G=1; A→A×A | Identity comparison; transfer(a,b)=a+b and transfer(1,0)=1 | Pass | Both comparisons retained |
| §8.4 semilinear even complex | H=1; free twisted rank d | Sphere witness rank 1; k-dimension d·card H>0 as integer | Pass | Semilinear action retained |
| §8.5 Lubin–Tate transfer | H=1; supersingular orders 48,24 | Identity transfer; rational scaling denominators d·48,d·24 positive | Pass | Full group retained |
| §8.6 ko algebra | A=ko,0;i=2,3 | Bott inversion KO; zero case 0→0; T(3)-local K=0 | Pass | No arbitrary regularity assumed |
| §8.7 tmf algebra | A=tmf,0;i=2,3,4 | Height-2 target Tmf; height-3 target TMF; height-4 K=0; zero case all 0 | Pass | Distinct coefficient models |
| §8.8 supersingular groups | p=2,3 | (9−1)(9−3)=48; 12·2=24; at p=3,L_K(2)TMF(3)=0 | Pass | Correct prime-specific actions |
| §8.9 coefficient localization | ko→KO; tmf→Tmf | K(ℤ) fibers; their T(2)-values 0 | Pass | Coefficient hypotheses retained |
| §9.1 p-inversion/truncation | Hℤ; H𝔽₂,H𝔽₃ | Discrete π₀ comparisons id; 𝔽_p[1/p]=0; L_K(1)K(𝔽_p)=0 | Pass | Connectivity only for π₀ comparison |
| §9.2 nilpotence/excision | k[ε]/ε²→k; identity Milnor square | ε²=0; local relative spectrum 0; identity-square error 0 | Pass | Hℤ-linear proof domain |
| §9.2 auxiliary-domain control | Hℤ⊕ΣHℤ | π₁=ℤ; underlying K(1)-local value 0 via its Hℤ-module action | Pass | Added Check |
| §9.2 cdh | Empty scheme; unit-ideal blowup | K(∅)=0; blowup X with empty exceptional center; discrepancy 0 | Pass | Finite-presentation hypotheses |
| §9.3 flat/smooth lines | Hk; 0; sphere degree 0,1,2 | Both π₀=k[x]; zero rings 0; smooth pieces S,S,Σ∞_+BC₂ versus flat S,S,S | Pass | No integral spectral equivalence |
| §9.3 augmentation API | Generator x; x=0 | Evaluation sends x↦0; constant inclusion/evaluation composite id | Pass | Retain |
| §9.4 homotopy invariance | 𝔽_p[ε]/ε² | Unit 1+εx≠1 evaluates to 1; local relative spectrum 0 | Pass | Integral negative control |
| §9.5 KH comparison | Field k; simplex degrees 0,1 | K(k)=KH(k); A[Δ⁰]=A,A[Δ¹]=A[t] | Pass | Supplier carrier retained |
| §9.6 TC obstruction | p=2,3; ℤ→ℤ[1/p] | Source local TC≠0; target completed TC=0 | Pass | Height one excluded from high trace |
| §9.7 filtered category counterexample | r=1,2; p-power torsion union | Stage local TC 0,0 by trace module; union local TC=L_K(1)TC(ℤ)≠0 | Pass | Module route made explicit |
| §10.1 additive/stable comparison | C=0; Perf(k) | First 0→0; second K₀ sends e_j↦(−1)^j, e₀+e₁↦0; integral groups unequal | Pass | High-height conclusion only |
| §10.2 sifted continuity | Constant filtered and simplicial A | Colimit A and realization A; localized subcategory colimit L_T(n−1)(ambient colimit) | Pass | Ambient/local colimits distinct |
| §10.3 orbit diagram | G=1,C₂,ℤ,S₃,Q₈ | G/G in first three; none in last two; finite-cyclic family for ℤ omits G/G | Pass | Nonabelian controls |
| §10.4 TC assembly | Cyclic G; R=0 | Terminal-orbit assembly id; TC(0)=0; completion after colimit still 0 | Pass | Connective coefficients |
| §10.5 K assembly | KU; G=1,ℤ,S₃,Q₈;n=2 | Cyclic maps id; τ≥0KU=ku; nonabelian localized assembly fibers 0 | Pass | Periodic input covered |
| Worked periodic field | u degree 2 | Torsion-module K₀ class 1−(−1)²=0; completed cofiber π₀=π₁=ℤ_p | Pass | Retain |
| Worked finite field | p=2,3;j=1,2 | Odd orders 1,3 and 2,8, all prime to p; p-completed positive groups 0 | Pass | Retain |
| Worked bottom boundary | (H𝔽₂)^tC₂ at odd p | Suspension +1=−1 on K, so 2K=0; input p-inversion nonzero, rationalization 0 | Pass | Retain exclusion |
| Worked assembly | KU,G=ℤ and S₃ | First terminal orbit and identity; S₃ cyclic orders 1,2,3 with conjugation, no terminal orbit | Pass | Infinite cyclic family retained |

The following rows audit each accepted residual supplier condition. They test its mathematical interface; they do not assert that the supplier has implemented it.

| Supplier condition | Instances tried | Values computed on the compared sides | Result | Change |
|---|---|---|---|---|
| witt-characteristic-series | a=0,τ(1),τ(c) | χ=1,1−t,1−ct; ghosts 0,1,cⁿ; γ has opposite logarithmic derivative | Pass | Derived normalization retained |
| multiplicative-postnikov | Hk⊕ΣHk; stages 0,1 | Hk and original extension; fiber ΣHk with π₁=k | Pass | Retain |
| nilpotent-kzero | ℤ/4→𝔽₂; ℤ/9→𝔽₃ | Ideals square zero; K₀=ℤ→ℤ,1↦1 | Pass | Retain |
| tc-z-k1-nonzero | p=2,3 | L_K(1)TC(ℤ)≠0 at both; odd-prime KU summand has π_(2r)=ℤ_p | Pass | Retain separate prime-two input |
| tc-z-inverse-p-vanishing | p=2,3 | Mod-p THH(ℤ[1/p])=0; completed TC=0 | Pass | Retain |
| k1-tc-filtered-colimits | Constant discrete ℤ diagram | Ring colimit ℤ; local TC comparison identity | Pass | Ring/category distinction retained |
| tc-mod-p-cyclotomic-colimits | Empty and constant connective diagrams | Empty colimit 0,TC(0)/p=0; constant comparison id | Pass | Retain |
| tc-mod-p-ring-sifted-colimits | Constant simplicial Hℤ | Realization Hℤ on both sides; TC/p comparison id | Pass | Retain |
| thh-all-cyclic-assembly | G=1,ℤ | Terminal orbit G/G; cyclotomic assembly identity | Pass | Infinite cyclic retained |
| linear-weak-additive-motives | Zero category; split pair C⊕D | U(0)=0; U(C⊕D)=U(C)⊕U(D) | Pass | Retain |
| linear-motive-tensor-unit | Perf(A); A=0 | Unit⊗unit=unit; zero-base motive 0 | Pass | Retain |
| linear-motive-kzero-unit | Free ranks 1,2 | [A]↦1,[A²]↦2·1 | Pass | Retain |
| linear-motive-projection-formula | Free rank-2 extension, rank-3 tensor | Both sides rank 6=2·3; identity extension factor 1 | Pass | Retain |
| spectral-etale-descent | 𝔽₄/𝔽₂, detector D₀=Hℚ | H²(C₂,ℚ)=ℚ/2ℚ=0; both π₋₂=0 | Pass | Rational detector retained |
| spectral-etale-descent negative control | Same torsor, global S[1/3] | Derived 2-completions Hℤ₂; fixed-point π₋₂=ℤ/2 versus source 0 | Pass | Excludes p-inversion at bottom |
| spectral-strict-henselian-detection | H𝔽₂,n=0; R=0 | Unique prime leads to H𝔽̄₂; rational K₀ ℚ=ℚ≠0; zero ring has K=0 and no prime | Pass | Nonvanishing retained |
| suslin-algebraically-closed-comparison | Char-0 algebraically closed L | Completed K π₀=ℤ_p,π₁=0; ku same values | Pass | Bott normalization retained |
| localizing-nisnevich-descent | Empty scheme; identity cover | E(∅)=0; constant identity Čech totalization E(X) | Pass | Retain |
| localizing-derived-blowup | Unit ideal | Blowup X; exceptional locus ∅; invariant-square error 0 | Pass | Retain derived square |
| abstract-blowup-noetherian-approximation | Identity square of Spec ℤ | Noetherian model itself; all base-change maps identity | Pass | Retain finite presentation |
| abstract-blowup-platification-domination | Identity modification | Unit-ideal blowup=id; center empty | Pass | Retain dense-open condition |
| kh-simplicial-model | Degrees 0,1 | A[x₀]/(x₀−1)=A; A[x₀,x₁]/(x₀+x₁−1)=A[x₁] | Pass | Central variables |
| kh-regular-comparison | Field k | K₀(k)=KH₀(k)=ℤ; rank 1↦1 | Pass | Retain regularity |
| kv-relative-comparison | Identity ring map | Relative K=0; all spectral-sequence terms 0; relative KH=0 | Pass | Lower bound retained |
| kh-nilpotent-invariance | k[ε]/ε²→k | I²=0; KH fiber 0; integral NK₁ unit 1+εx≠1 | Pass | No integral K-invariance |
| stable-james-splitting | W=*,S²; disconnected S⁰ | Reduced wedge 0; degrees 2,4,6,…; components ℕ versus ℤ for S⁰ | Pass | Connectedness retained |
| all-height-morava-realization | h=1,3 | Deformation parameter counts 0,2; π₀=W(k),W(k)[[u₁,u₂]] | Pass | All heights retained |
| elliptic-spectral-affineness | Tensor by S and 0 | Global sections ΓOtop and 0 on both sides | Pass | Colimit compatibility retained |
| elliptic-level-three-galois | p=2; p=3 control | Deck order 48; at 3 the level-three spectrum is 3-inverted and K(2)-value 0 | Pass | Prime-specific use |
| elliptic-supersingular-at-two | Residue 𝔽₄, GL₂(𝔽₃) | Field order 4; deck order 48 | Pass | Retain full action |
| elliptic-supersingular-at-three | Residue 𝔽₉, full versus geometric group | Field order 9; group orders 24 versus 12 | Pass | Semilinear part retained |
| spectral-units-and-lines | Hℤ; zero ring | π₀GL₁Hℤ={1,−1},2 excluded; zero ring's unit component singleton | Pass | Full reviewed slug retained |
| relative-thom-colimit | Point,empty source,constant line on X | Colimits R,0,R⊗Σ∞_+X | Pass | Domain/target explicit |
| multiplicative-thom-refinement | Point with trivial loop map | Thom algebra R with 1_R and original multiplication | Pass | Coherent refinement retained |

## Source and citation review

The cached registered texts were read at the target locators, with additional surrounding proof text for the delicate uses. In particular: lt line 689 for the coefficient connectivity estimate and its π₀ hypothesis; lt line 1182 and lt line 1201 for excision and its relative-base version; pp line 1595 and pp line 1627 for the Freyd envelope; lmmt line 316 for ring acyclicity; lmmt line 694 for the CMNN induction and its base; hahn line 53 and hahn line 62 for transfer and module cofibers; lmmt line 948 and akq line 632 for the all-prime Thom input; bsy line 809, bsy line 1962 and bsy line 2419 for perfect-algebra realization and field maps; barwick-lawson line 207 and barwick-lawson line 253 for regularity; lt line 1440 for the exact finite-presentation convention for abstract blowups; lmmt line 1097 and lmmt line 1110 for the height-one obstruction and category-colimit counterexample. Bibliographic editions and exact mathematical locators remain in References. The table computations were made here, not adopted as verdicts from the earlier reviews.

Cross-roadmap sections were checked in the repository's main files where present, otherwise the readable open-head files: GeneralAlgebraicKTheory §§3.12–3.14, 6.9, 6.19, 7.1–7.7, 9.8–9.17, 10.1–10.13, 11.15–11.16 and 13.8a–c; StableHomotopyKTheory Layers 3–7; StableHomotopyKTheoryPartII §§4.4–4.5; EnhancedDerivedSheaves E0.4/E0.7/E3.1 and E5:abstract.1–4/E5:presentability.1–3; RefinedTraceMethods §§2.1–2.17, 4.6 and 4.9–4.19; AInfCohomology AI.7.2; BordismFormalGroups F1–F3 and F6.1–F6.5; GeneralizedCohomology G2/G3/G4.5/G5; TopologicalKTheory T4/T7.1; HomotopySpheres §§3B/4B/4C; EllipticCohomology E1–E6; QWittVectors §§1.1–1.6 and 1.4a; KTheoryLowDegrees §§1.1–1.3/13.1; KTheoryFiniteLocalFields §§0.4/1.1–1.6/6.5a; SchemeKTheoryOperations Layers 1–5; AlgebraicTopology Stages 4/8; ModularCurves §7E. Declared extensions are distinguished from those existing sections' actual contents. MotivicEtaleKTheory §7.2 was checked as an ownership-only regulator citation; HabiroRings imports the QWittVectors construction rather than owning it.

## Unresolved and external conditions

The accepted package is conditional on the 33 named supplier obligations. This port keeps them explicit and does not claim they are implemented or all already present in supplier prose. Their implementation is mathematical library work. The external ChromaticHomotopyTheory ownership reconciliation described above also remains, together with its separately requested BHLS extensions; this job neither changes the accepted package's merge direction nor edits another folder. No other unresolved port defect was found. Ownership against the supplied open heads was checked; no unprovided head was sought independently. No suspicious instruction requesting credentials, external writes or out-of-scope execution was encountered in the material used.

No push, pull-request creation, issue edit or comment was made.


Pull request: #1742 (roadmap/general-algebraic-k-theory-part-ii at 04493c3)
