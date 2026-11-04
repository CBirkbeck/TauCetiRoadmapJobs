# Review of SpinGeometry (pull request #1674 at edf4ead)

**Verdict:** needs changes

AI-assisted independent review of the entire folder, including inherited content, at `edf4eadb901541445f5b907c44ba82ca1f6d0288`. There are 11 findings, four blocking (one P1 and three P2). The original Lean file elaborates, but the supplied gate fails. No pull-request file was changed. No mathematical counterexample to the new skeletal-frame comparison was found; that does not resolve the ownership, acceptance-test and documentation defects below.

## R01 (P1) — Break the reciprocal supplier dependencies

**Location:** `TauCetiRoadmap/SpinGeometry/README.md:917`, also lines 47–51, 299–300 and 907. The claim includes “GeneralizedCohomology G5.5 consumes Spin G1.3's trace” while G6.0 consumes that same supplier.

**Claim:** The item-level ordering is presented as sufficient to make the roadmap supply graph valid.

**Witness:** `TauCetiRoadmap/GeneralizedCohomology/README.md:1908` consumes SpinGeometry G1.3; SpinGeometry line 680 consumes GeneralizedCohomology G5.5. `TauCetiRoadmap/CharacteristicClasses/README.md:939` explicitly orders Spin G4.1a → C3.5 → Spin G4.3. These are reciprocal roadmap edges.

There is another reciprocal pair with RiemannianGeometry: its main README line 117 consumes SpinGeometry G1.2/G2.2/G3.4, whereas SpinGeometry lines 35–37 and 823–824 consume RiemannianGeometry R7. Splitting a roadmap into internally ordered items does not satisfy the brief's single direction of supply between roadmap owners. These are existing-main contracts, not hypothetical future dependencies or declared gaps.

**Repair:** Put the early shared Clifford trace, topological frame adapters and exterior-module comparisons in earlier foundation owners, or split foundations and later Dirac/index consumers into separate roadmaps. Repoint both ends to the single earlier owner. For example, with the trace in an earlier Clifford foundation, both GeneralizedCohomology and SpinGeometry import it and the two-edge trace cycle disappears. With the frame adapter in an earlier foundation, C3.5 supplies SpinGeometry without consuming SpinGeometry. Preserve all mathematical targets while doing this.

The prescribed checker nevertheless reports `depcheck: 205 roadmaps, 1514 edges, 0 problem(s)`. This is a limitation of that result, not evidence against the explicit reciprocal citations. No tooling or order file was modified.

## R02 (P2) — State Morita evaluation as a theorem, with the promised generality

**Location:** `TauCetiRoadmap/SpinGeometry/Suggested.lean:146`–153; README lines 177–199. The declaration starts `def multiplicityEvaluation [Nontrivial S]` and its body is `sorry`.

**Claim:** This admitted equivalence and its finite-dimensional evaluation law test the arbitrary-module evaluation promised by G1.3.

**Witness:** Elaborated `@multiplicityEvaluation` has neither `FiniteDimensional ℂ S` nor `FiniteDimensional ℂ E`; `@multiplicityEvaluation_tmul` has both. Take S=ℂ, V=0 and E=ℕ→₀ℂ: evaluation is valid, but the displayed theorem excludes E.

This is the gate's `sorry-data` failure. An admitted data object also makes its subsequent equation unsuitable as an acceptance test. The arbitrary-E assertion is supported by Nicolaescu Corollary 12.1.22 and Remark 12.1.23, printed p.632, `nicolaescu` line 29466.

**Repair:** Delete the admitted definition and everything that depends on it. Keep the real-bodied intertwiner submodule, and state one theorem asserting existence of a linear equivalence whose value on every pure tensor is T(s), explicitly binding finite-dimensional nonzero S and allowing arbitrary algebraic E. Alternatively define the raw evaluation linear map with a real body and state its bijectivity. A scratch existential signature with precisely those binders elaborated at the pins. On S=ℂ, E=ℕ→₀ℂ it is the ordinary scalar tensor-unit equivalence, sending 1⊗T to T(1); on E=0 it is the unique zero-space equivalence. The repaired statement handles both.

## R03 (P2) — Include the statable trace headline and account for the missing geometric headlines

**Location:** `TauCetiRoadmap/SpinGeometry/README.md:233`–267 and `TauCetiRoadmap/SpinGeometry/Suggested.lean:19`–26.

**Claim:** The selected interfaces suffice as the roadmap's acceptance test.

**Witness:** G1.3's normalized faithful negative-Clifford trace is absent. A scratch theorem quantifying a native linear functional, equating it to normalized regular trace, and asserting unit, cyclicity, positivity and faithfulness elaborates without any new carrier.

The probe uses finite-dimensional real inner-product V, native `QuadraticForm ℝ V`, the explicit equation Q(v)=−⟨v,v⟩, `LinearMap.trace`, `LinearMap.mulLeft`, and the native real Clifford star. It does not encode a missing condition in a free predicate. Thus “carrier unavailable” cannot justify this omission. The module docstring also does not enumerate the absent Lichnerowicz, closed-domain, KO-index, quaternionic-kernel/index and skeletal-comparison headlines with their respective missing carriers.

**Repair:** Add the trace existence/characterization/faithfulness theorem with honest `sorry`, as well as R02's general evaluation theorem. Inventory the geometric headlines individually in the module docstring, naming the missing principal-lift, smooth Clifford-module, Sobolev-domain, KO-index or kernel-comparison carrier for each. Do not substitute pointwise contraction or bare vector-space parity for a geometric index theorem. The trace probe includes rank zero, where τ(a)=a and τ(a*a)=a², and the negative line, where τ((a+be)*(a+be))=a²+b²; these test the intended normalization and faithfulness.

## R04 (P2) — Put the new extension in a Part II roadmap

**Location:** `TauCetiRoadmap/SpinGeometry/README.md:504`–557.

**Claim:** The new skeletal-frame classification, stabilization groupoid equivalence and integral rank-two criterion extend the existing roadmap in place.

**Witness:** Main already contains SpinGeometry G1–G6, including principal lifts G4.2–G4.4 and square roots G5.3. The diff inserts a new 55-line G4.4a into that existing specification rather than importing it from an extension.

**Repair:** Move the new comparison to SpinGeometryPartII, introduce it by saying where SpinGeometry stops, and import SpinGeometry G4.2–G4.4/G5.3 plus AlgebraicTopology 8.9 and SpinRepresentations Layer 2 by name. Do not copy the base roadmap or its declarations into Part II. The TS² check remains e=2, w₂=0, one spin structure and a stable frame; this move preserves the new mathematics and the base ownership. This is a repairable extension-placement defect, not a claim that the entire inherited SpinGeometry development must be rejected.

## R05 (P3) — Add exact source locators at the targets

**Location:** `TauCetiRoadmap/SpinGeometry/README.md:919`–928 and throughout G1–G6, especially G4.4a at line 504.

**Claim:** Three broad references identify the sources of the individual targets.

**Witness:** G4.4a has no source locator. G2.2's Hodge/chirality identity has no attached locator, although Nicolaescu Example 12.1.25, equation (12.1.1), printed p.633, `nicolaescu` line 29514, states it.

**Repair:** Attach theorem/section and printed-page locators to every mathematical target and record the cited works in `sources.toml`. Identify the course notes invoked by the PR description and by the README's unspecified “course” references. Distinguish which parts of a target the source proves from new generalizations: Nicolaescu's manifold spin discussion does not itself certify the arbitrary paracompact-base or infinite-CW extension. For G2.2, add the locator above and retain the two-plane calculations Γ1=i e₁₂ and Γe₁=i e₂. For G4.4a, cite the actual skeletal source and the general obstruction supplier, including the extension argument at the stated generality.

## R06 (P3) — Replace the seven commit-pinned roadmap links

**Location:** `TauCetiRoadmap/SpinGeometry/README.md:61`, 64 and 71–75.

**Claim:** Commit-pinned supplier links are acceptable permanent supplier contracts.

**Witness:** The gate reports `blob=7`, covering GeneralizedCohomology G5.5, TopologicalKTheory T7, PDO P1.0/P4/P5/P6 and ComplexKahlerGeometry K5a.

**Repair:** Use repository-relative links and exact current section/target names, resolving each against the authorized main or new-roadmap head. For example, G5.5's scalar-trace contract is present on main at GeneralizedCohomology line 1908; replacing its historical link does not fix R01's direction and must be combined with that repair. All seven offending links must be replaced.

## R07 (P3) — Remove the two TeX fragments outside code spans

**Location:** `TauCetiRoadmap/SpinGeometry/README.md:174`, 799.

**Claim:** The formulas satisfy the Unicode/code-span house style.

**Witness:** The gate reports `tex=2`: the adjoint exponent at line 174 and the cotangent projection subscript at line 799 are outside code spans.

**Repair:** Put the entire expressions in code spans or use Unicode notation. Preserve the actual mathematics: the conjugate-linear adjoint sends i to −i, and the projection is from T*M to M. Both values remain unchanged by the formatting repair.

## R08 (P3) — Restore the required import header

**Location:** `TauCetiRoadmap/SpinGeometry/Suggested.lean:1`–17.

**Claim:** The import header has the permitted form.

**Witness:** There is no `import Mathlib`; eight imports name `Mathlib.<submodule>`; the first import is Tau Ceti. These account for all three gate failures `imports=1`, `mathlib-subimports=8`, `no-import-mathlib=1`.

**Repair:** Start with the single line `import Mathlib`, followed only by individual Tau Ceti modules actually used. Remove the eight Mathlib subimports and unnecessary Tau Ceti imports. Re-elaborate under the same pins and defaults. The original header's successful elaboration is not a waiver of these three form checks.

## R09 (P3) — Give each definition discriminating Checks and each target its dependencies

**Location:** `TauCetiRoadmap/SpinGeometry/README.md:138`–899, especially G1.3, G3.2 and G4.4a.

**Claim:** General requests for edge cases and the final dependency narrative provide the required per-definition acceptance checks and build order.

**Witness:** There are no `**Checks.**` lists or `*Needs:*` lines. G3.2 defines Hermitian Clifford modules but supplies no three explicit discriminating examples. The new skeletal definition likewise has examples only in running prose.

**Repair:** Use the required Summary, Scope/ownership, Conventions, Exact supplier contracts, build guide and Layer headings. Preserve the substantial mathematical APIs, but expose them as prose bullets; add at least three computed positive/negative Checks per definition and per-target `*Needs:*` lines. End layers with Examples and Dependencies. For G3.2, use c(e)=i on ℂ (square −1, skew adjoint), c(e)=1 (square +1, fails), and the zero module (valid, dimension zero). For skeletal frames use TS², the two S¹ classes, and a rank-two line with e=1, whose stabilization has nonzero w₂ and no spin lift. Keep the dependence on G5.3 after its construction instead of saying simply that all G5 follows all G4.

## R10 (P3) — Remove elementary API padding from the acceptance file

**Location:** `TauCetiRoadmap/SpinGeometry/Suggested.lean:51`–65, 85–96 and 234–239.

**Claim:** The right-action square/anticommutation, the generator square/anticommutator and the quaternionic wrapper belong among the headline tests.

**Witness:** Right-action anticommutation is already proved by one `simp`. Generator square is native `CliffordAlgebra.comp_ι_sq_scalar` after Q=−g; the mixed relation is native `ι_mul_ι_add_swap` transported through ρ. The quaternionic wrapper is one application of the preceding theorem.

**Repair:** Delete these API statements from `Suggested.lean`; retain their mathematics as README API/Checks and cite the native algebra relations. Delete a supporting definition too if no retained headline needs it. Do not merely prove an admitted API statement in place. Keep the substantive finite-dimensional quaternionic parity result only if explicitly selected as a headline; its one-line representation wrapper adds no new acceptance condition. The unit-vector square is −Id and the orthogonal mixed sum is zero before and after deletion. Bare `simp`, `rfl` and `infer_instance` did not solve any of the six admitted theorems in the separate probe; the padding identification here also uses the opened native relations and the existing short proofs, not a claim that those six probes succeeded.

## R11 (P3) — Synchronize declaration names and complete the Lean documentation

**Location:** `TauCetiRoadmap/SpinGeometry/Suggested.lean:19`–26, 102–123 and 173–184; README G1–G6.

**Claim:** The file and README provide the required mutually matching named headline interface.

**Witness:** `IsGeometricAction`, `multiplicitySpace` and `diracInFrame_eq` are declared but not named in the README. Conversely, the README backticks the owned `cliffordScalarTrace` and `realCliffordSpinorBundle`, neither declared here. Several theorems have no docstring.

**Repair:** Name the retained Lean declarations in the README, remove code-name claims for unstatable constructions, and give every retained declaration a mathematical docstring. Use the prescribed module title and layer comments in README order. Do not add a stand-in just to satisfy a name check. R03 supplies the meaningful trace theorem; the real spinor-bundle construction stays a prose target with its missing carrier identified. The worker's name scanner returned zero missing IDs, so this finding rests on the actual file contents rather than its output.

## Verified sound

Read both review files in full, the repository's normative writing/review guidance, and main examples from Completed/HopfRinow, Completed/OrthogonalL2Bases and RiemannianGeometry. Main context was `fa41b3747f56d4e77bd69e7099c1be4f2e4959ba`; library checkouts matched Mathlib `6b7abb3c7686292736be2955bd3eb9ebf63b456a` and Tau Ceti `a91d3aafa8cd3e6bc33dfde0d7677ed0f1625039`. The PR diff has no changes outside the requested folder, no set_option, no admitted examples and no computational-algorithm target. The new material builds on actual lift and obstruction owners; it does not attempt a shortcut through a trivial bundle. No copied source passage was identified in the portions compared.

The successful commands were the permitted targeted build of `TauCeti.Topology.Algebra.CliffordAlgebra.Spin.Covering`, followed by `lake env lean` on the original file and three scratch probes. The original file has seven sorry warnings: six theorems and the admitted data definition. The 20-declaration `#check @name` probe completed. The six admitted theorems were tried with bare simp/rfl/infer_instance on a copy; none closed. The two additional full-headline signatures in R02/R03 also elaborate, with honest theorem sorries. No dependency pins or reviewed files were edited.

The signature comparison found the dropped S/E finiteness in `multiplicityEvaluation`, and the retained finite-E restriction in its theorem, reported in R02. `diracInFrame` drops `VectorBundle ℝ F W` while its theorem retains it; the pointwise contraction only needs the actual linear-valued covariant derivative, so this is not a false algebraic identity. The metric-action hypotheses are present in the chirality theorems. Quaternionic parity retains finite-dimensional V; the bare square-law theorem correctly drops the unused group and representation. The ordered orthonormal basis determines the Lean chirality, without pretending to carry a separate orientation.

The checker output, reproduced in full, is:

```text
depcheck: 205 roadmaps, 1514 edges, 0 problem(s)
```

The supplied gate was FAIL: blob 7, tex 2, sorry-data 1, imports 1, mathlib-subimports 8, no-import-mathlib 1; all its other reported counters, including build, depcheck, stray-files and outside-folder, were zero. R02 and R06–R08 account for every failing rule. Passing elaboration does not establish mathematical truth or a passing gate.

**Headline inventory.** The README reaches: the negative-metric/Fock dictionary and compatible Hermitian metrics; arbitrary-module Morita evaluation and faithful scalar trace; intrinsic chirality, Hodge and graded-product comparisons; smooth Clifford modules/connections; principal spin obstruction/classification and the new skeletal/stabilization comparison; spinor bundles and plane-bundle square roots; Dirac frame/symbol/domain and curvature theorems; untwisted/twisted Lichnerowicz and vanishing; the de Rham/signature realization and compact-support symbol class; the real KO analytic index and products; and four-dimensional quaternionic kernel/index comparison. The file has pointwise chirality and complement statements, a contraction statement, admitted evaluation data and vector-space quaternionic parity. It does not yet test that entire inventory or explain each unavailable carrier. R02/R03 separate a demonstrably statable omission from genuinely geometric missing constructions.

**Source sample.** The brief supplies no identities for its alleged 15 sampled targets: it says “none found by heading.” No unverified locator flags or source manifest are present either. Therefore I cannot claim to have reproduced that worker sample. I used a reproducible supplemental sample: Python Random seeded by the full head string, sampling 15 from the ordered 29 subsections G1.1–G6.7 (with G4.1a/b and G4.4a separate). Its output is G1.2, G6.6, G1.4, G1.1, G5.0, G6.0, G2.2, G5.1, G6.3, G4.2, G2.3, G4.1b, G3.3, G6.2, G3.4. All are in the computed table below. The new G4.4a and every Lean declaration were examined independently of that sample.

The author-hosted Nicolaescu text was obtained through the sources service at the redirected [author URL](https://academicweb.nd.edu/~lnicolae/Lectures.pdf). Printed pages are 12 less than the PDF page markers in this extraction. These are checked locators supplied by this review, not locators that the README already contains:

| Target | Source inspected, printed page and extraction line | Extent of verification |
| --- | --- | --- |
| G1.2 | Prop.12.1.19, pp.630–631; `nicolaescu` lines 29392, 29423–29454 | Isotropic decomposition, √2 action and Clifford relation; conjugate-first Hermitian convention translated explicitly. |
| G6.6 | Spin chiral symbol, §12.2.3 p.672; `nicolaescu` line 31068 | Clifford symbol supported; compact-support K-class and functoriality require TopologicalKTheory, not this source paragraph alone. |
| G1.4 | 12.1.29–12.1.30, pp.634–635; `nicolaescu` lines 29553–29575 | Even-algebra equivalence and two factors; roadmap's explicit sign label verified separately below. |
| G1.1 | Def.12.1.10/Prop.12.1.11/Cor.12.1.14, pp.626–627; `nicolaescu` lines 29261–29306 | Negative convention and isometry functoriality; native base-change direction independently opened. Full real periodicity is a supplier. |
| G5.0 | Real algebra/Clifford module discussion, pp.628–629; `nicolaescu` lines 29319–29377 | Supports the underlying algebra and real modules, not the full fixed external action/real KO package. Those formulas were computed; no exact source certification for the whole subsection. |
| G6.0 | Thm.12.2.33, p.673; `nicolaescu` lines 31100–31104 | Spin square and positive-curvature consequence supported. Full real Hilbert-module index/calibration not verified from an accessible primary text. |
| G2.2 | Example12.1.25, equation12.1.1, p.633; `nicolaescu` lines 29500–29516 | Hodge/chirality and the two gradings supported; checked coefficient-field typo below. Normalized Hilbert–Schmidt factor computed independently. |
| G5.1 | §12.2.3, pp.670–672; `nicolaescu` lines 31003–31055 | Associated spinor bundle and lifted connection, under a chosen manifold spin lift. |
| G6.3 | Thm.12.2.33 and Ex.12.1.68, pp.673 and 657; `nicolaescu` lines 31100, 30468–30478 | Untwisted square and arbitrary Hermitian twist, retaining its curvature term. |
| G4.2 | §12.2.3/Remark12.2.28, pp.668–669; `nicolaescu` lines 30917–30927, 30957–30980 | Actual lift and its equivalences on manifolds; does not certify general paracompact bases or the Sylvester metric-change construction. |
| G2.3 | Graded-module discussion, p.633; `nicolaescu` lines 29492–29499 | Distinction between intrinsic chirality and a multiplicity grading; full graded direct-sum comparison additionally uses the native prodEquiv. ABS text not accessible. |
| G4.1b | §12.1.6, pp.643–644; `nicolaescu` lines 29902–29960 | Lie differential and factor two supported; native units-range/smooth transport also checked at the pin. |
| G3.3 | Def.12.1.64, p.653; `nicolaescu` lines 30311–30318 | Levi–Civita Clifford compatibility and parallel grading. Associated-tensor parallelism resolved to SBC B3.3. |
| G6.2 | Thm.12.1.67 and its proof, p.656; `nicolaescu` lines 30412–30465 | Curvature contraction, its 1/2 versus increasing-pair convention, and normal-frame route verified. |
| G3.4 | §12.2.1, pp.657–659; `nicolaescu` lines 30485–30561 | Levi–Civita exterior module and d+d* instance; shared metric/analysis ownership checked separately. |

Additional opened locators: Cor.12.1.22/Remark12.1.23 p.632 (`nicolaescu` line 29466), Prop.12.1.27 p.634 (line 29526), Prop.12.1.42 p.641 (line 29798), Prop.12.2.25/Remark12.2.28 p.669 (lines 30950, 30957), circle Ex.12.2.30 p.670 (line 30984), and torus Ex.12.2.35 p.673 (line 31121). The actual source limits and its errors are not silently imported into the roadmap.

**Computed adversarial table (96 rows).** A, B below are the two-plane Fock matrices A=[[0,−1],[1,0]], B=[[0,i],[i,0]], so AB=diag(−i,i), Γ=iAB=diag(1,−1). For Clifford monomials e_I, e_j²=−1 unless a different Q is explicitly specified. “Pass” means the stated instance and both displayed sides agree, not a proof in all dimensions. Structural naturality laws are tested on actual identity, reflection, twisting or frame-change maps, not on unspecified free predicates.

| Statement / location | Instances tried | Values computed on the two sides | Result / change |
| --- | --- | --- | --- |
| Negative Q and generator convention, lines 93–95 | Unit e; zero v | e²=−1=Q(e); c(0)²=0=−norm(0)² | Pass; positive-square model excluded. |
| Mixed Clifford relation, G1.2; Lean anticommutator | v=w=e₁; v=e₁,w=e₂ | A²+A²=−2Id; AB+BA=0; RHS −2 and 0 | Pass; native relation, R10. |
| Base-change direction and tensor scalar action, lines 96–108 | i⊗1 and 1⊗e | inverse base change sends i⊗1 to i and 1⊗e to ι(1⊗e); commutor sends e⊗i to i⊗e | Pass; scalar action must be transported. |
| Bilinear versus Hermitian extension, lines 109–112 | x=i e, norm(e)=1 | g_C(x,x)=−1, h_C(x,x)=1; Q_C(x)=1=−g_C(x,x) | Pass; treating g_C as Hermitian fails. |
| Native versus conjugate Clifford star, lines 113–127 | Scalar i; real e | native star(i)=i, geometric star(i)=−i; both send e to −e | Pass; wrong linear star excluded. |
| Chirality convention, lines 128–135 | Oriented plane, its reversal, zero frame | Γ=diag(1,−1); reversed Γ=diag(−1,1); empty product Γ=1 | Pass. |
| Fourier/geometric symbols, lines 137–143 and G6.1 | Unit covector in plane | σ_geom²=A²=−Id; σ_F²=(iA)²=Id | Pass; missing i would reverse square sign. |
| Positive-to-negative even dictionary, G1.1 | Two positive generators versus negative pair | (e₁e₂)²=−1 in both; image is −e₁e₂; multiplying complex generators by i produces that sign | Pass; no real full-algebra identification inferred. |
| Rank-zero geometric Spin, G1.1/G4.1a | V=0 | native generated Spin={1}; even unitary scalars={−1,1}; SO(0)={1} | Pass; distinct carriers retained. |
| Polarization and pairing, G1.2 | w=(e₁−ie₂)/2, bar(w) | g_C(w,w)=0, g_C(w,bar(w))=1/2; norm(w)²=1/2 | Pass. |
| Fock rescaling, G1.2 | Exterior degrees 0 and 1 | Native c(e₁)=[[0,−1],[1,0]] in basis (1,w) with coefficients adapted to w; T=diag(1,√2) changes entries to −1/√2,√2, exactly √2(ε−ι) since ι(bar(w))w=1/2 | Pass; degree-one metric factor 2. |
| Hermitian convention, G1.2 | v=e₁,w=Je₁ | h_J(v,w)=i; 2h_C(v^(1,0),w^(1,0))=i | Pass; conjugate slot gives −i and is excluded. |
| Creation/annihilation, G1.2 | Unit normalized exterior generator u | ε²=ι²=0; ει+ιε=Id; ε†=ι; A†=−A | Pass. |
| Compatible metric uniqueness, G1.3 | Irreducible plane S=ℂ²; reducible S⊗ℂ² | Commutant of A,B is scalar; weights diag(1,2) on multiplicity give a compatible nonscalar metric | Pass; uniqueness restricted to irreducible S. |
| Morita evaluation and inverse, G1.3 | S=ℂ²,E=S⊗ℂ³ | dim Hom_Cl(S,E)=3; dim domain=2·3=6=dim E; e_i⊗T_j maps to e_i⊗f_j | Pass; raw evaluation must replace admitted data. |
| Morita generality, G1.3; Lean evaluation law | S=ℂ, E=0 and E=ℕ→₀ℂ | Domain and codomain have dimensions 0 and infinite respectively; 1⊗T maps to T(1) in both | Mathematics passes; finite-E Lean restriction fails coverage, R02. |
| Matrix-counit evaluation, G1.3 | S=ℂ², j=1, T linear intertwiner | E_i1 T(e₁)=T(e_i); sum_i E_i1 x_i evaluates the two tensor coordinates | Pass; not definitional instance equality. |
| Reverse-dual action, G1.3 | Plane A on S, functional e₁* | Dual action Aᵗ=[[0,1],[−1,0]]; (Aᵗ)²=−Id; (AB)ᵗ=BᵗAᵗ | Pass; reverse is necessary for left action. |
| Conjugation automorphism, G1.3 | a=i+e₁ and ab with b=e₂ | κ(a)=−i+e₁; κ(ab)=−ie₂+e₁e₂=κ(a)κ(b); κ²(a)=a | Pass; fixes real generators. |
| Geometric anti-involution, G1.3 | a=e₁,b=e₂ | (ab)*=−e₁e₂=b*a*; i* =−i; ** fixes both generators | Pass. |
| Grading eigenspace iff, G1.3 | 1,e,1+e over ℝ | involute values 1,−e,1−e; first fixed, second negated, third neither | Pass in both directions; 2 invertible. |
| Scalar trace definition/normalization, G1.3 | Cl(0,1), a=x+ye | L_a=[[x,−y],[y,x]], half its trace=x=scalar coefficient; τ(1)=1 | Pass; statable headline omitted, R03. |
| Trace cyclicity and reversal, G1.3 | e₁,e₂; e₁,e₁ | τ(e₁e₂)=τ(e₂e₁)=0; τ(e₁²)=−1; reverse/involute preserve scalar part | Pass; no commutativity assumption. |
| Ordered-basis pairing, G1.3 | I={1,2}; Q negative or diag(1,0) | reverse(e₁₂)e₁₂=1 for negative plane; τ(reverse(e₂)e₂)=0 for radical generator | Pass, including degeneracy. |
| Semidefinite trace and radical ideal, G1.3 | Q=0 on a line, a=x+ye | e²=0; τ(a*a)=x²; null set ℝe equals ideal(e); positive line gives x²+y² | Pass; faithfulness distinguishes degenerate Q. |
| Negative trace positivity, G1.3 | Cl(0,1), a=x+ye; complex a=i+e | τ(a*a)=x²+y²; τ_C((i+e)*(i+e))=2 | Pass; positive-form reverse alone gives wrong sign for e. |
| Trace transport, G1.3 | Algebra automorphism e↦−e; scalar extension | τ(x−ye)=x=τ(x+ye); τ_C(1⊗a)=x | Pass; normalized regular trace is invariant. |
| Odd central factors, G1.4 | n=1, e acts by −i or i | ω=i e has eigenvalues +1 and −1; (1±ω)/2 gives (1,0) or (0,1) | Pass; labels fixed. |
| Odd/even embedding sign, G1.4 | n=1, ordered (e₁,e₀) | ψ(i e₁)=i e₀e₁=−i e₁e₀=−Γ; + factor restricts S⁻ | Pass; moving e₀ first flips sign. |
| Chirality square/self-adjointness, G2.1; Lean chirality_sq | ℓ=0,1,2 | Γ²=1 in each; geometric Γ*=Γ; native star Γ gives +Γ,−Γ,+Γ | Pass; two stars distinguished. |
| Chirality anticommutation, G2.1; Lean chirality_anticommutes | A and Γ above; zero tangent space | ΓA=[[0,−1],[−1,0]]=−AΓ; zero case 0=0 | Pass. |
| Spinor eigenspaces/projections, G2.1; Lean positive/negative/isCompl | Plane and rank zero | Plane dimensions (1,1), projections diag(1,0),diag(0,1), sum Id, product 0; rank zero (dim S,0) | Pass; zero module gives both zero. |
| Signed rank-zero chirality, G2.1 | σ=+1,−1 | Γσ=+Id,−Id; positive/negative ranks (1,0),(0,1) for S=ℂ | Pass; separate sign, not a second zero frame. |
| Exterior c=ε−ι, G2.2 | e₁ acting on 1 and e₁ | c(e₁)1=e₁; c(e₁)e₁=−1; its square is −1 on both | Pass. |
| Hodge/chirality formula, G2.2 | n=2, degrees p=0,1,2 | Γ1=i e₁₂, Γe₁=i e₂, Γe₁₂=−i; RHS phases i,i,−i give identical values | Pass. |
| Star square, G2.2 | n=2, p=0,1,2 | *²=+1,−1,+1, equal (−1)^(p(2−p)) | Pass. |
| Exterior-to-End metric, G2.2 | n=2, 1 and e₁ | Exterior norms squared=1; ordinary HS norm²(Id)=HS norm²(A)=2; normalized trace gives 1 | Pass; factor 2^ℓ is necessary. |
| Two form gradings and reverse dual, G2.2 | n=2, Id∈End(S) | Exterior parity fixes Id; chirality sends Id to Γ; reverse-dual chirality=−Γᵗ, induced parity=Γᵗ | Pass; decompositions differ. |
| Product Clifford action, G2.3 | Two planes | (A⊗Id)²=−Id, (Γ⊗A)²=−Id, mixed sum 0; product volume Γ⊗Γ | Pass; ungraded tensor action fails mixed relation. |
| Koszul symmetry and associativity, G2.3 | Two odd basis vectors; three homogeneous factors | Swap gives −v⊗u on both graded sides; associator exponent is pq+pr+qr in either bracketing | Pass; rank-zero unit exponent 0. |
| Graded multiplicity, G2.3 | S ranks (1,1); A purely odd rank1 | Tensor grading swaps S labels, intrinsic Γ leaves labels unchanged; even/odd ranks remain (1,1) | Pass; wrong equality of gradings excluded. |
| Smooth algebra-bundle gluing/norm, G3.1 | Trivial plane; reflected orthonormal frame | e₁↦−e₁ preserves e₁²=−1 and coefficient norm; 1·e₁=e₁ norm1 in both charts | Pass; isometry hypothesis matters. |
| Compact-group invariant tensor, G3.1 | Central −1 spin action and a rotation | Central action on V is Id, on S is −Id, so conjugation fixes c; for z=e^(θe₁e₂), conjugation rotates c(e₁) by 2θ | Pass; zero tensor fails Clifford square on nonzero S. |
| Hermitian Clifford-module definition, G3.2; Lean IsGeometricAction | Line action i versus 1; zero module | i²=−1 and i†=−i; 1²=1 and 1†=1; zero module has Id=0 and all equations 0=0 | Pass; add these Checks, R09. |
| Compatible connection equivalence, G3.3 | Flat c=A constant, ∇=d; vary c(x)=e^x A | ∇c=0 for first; derivative e^x A≠0 for second; Leibniz defect is same e^x A | Pass; arbitrary connection not silently accepted. |
| Curvature compatibility, G3.3 | Flat module; curved round plane | Flat commutator 0=0; R^S₁₂=−AB/2 gives [R^S₁₂,A]=−B=c(R₁₂e₁) | Pass. |
| Connection affine/tensor/dual API, G3.3 | Fixed line metric, ∇=d+i a and d+i b | Affine potential i(ta+(1−t)b) remains imaginary; dual potential −ia; tensor potential i(a+b) | Pass; requires fixed metric. |
| Exterior LC/d+d*, G3.4 | Flat line, form f+g dx | D(f+g dx)=−g′+f′dx=d f+d*(g dx) | Pass; different-dimensional tangent pullback not claimed. |
| Compact cover and low ranks, G4.1a | n=1,2,3 | n1 cover has two points over one; n2 z↦z² has kernel ±1; n3 S³→SO3 has kernel ±1 and π₁S³=0 | Pass; n2 π₁Spin=ℤ not 0. |
| Smooth differential normalization, G4.1b | Negative e₁e₂ | [e₁e₂,e₁]=2e₂; derivative of rotation by 2θ sends e₁ to 2e₂ | Pass; positive-form bivector sign is reversed. |
| Spin lift definition/equivalence, G4.2 | Circle periodic/antiperiodic covers | Both associated SO(1) bundles trivial; covering spaces have 2 versus 1 components and are inequivalent | Pass; mere w₂=0 would lose data. |
| Metric change, G4.2 | g′=4g; two noncommuting positive matrices | B=4Id, B^(−1/2)=Id/2; new squared norm of e/2=1. Generic square roots do not commute, so composite equality is not assumed | Pass; homotopy comparison appropriate. |
| Sylvester differential, G4.2 | B=diag(1,4) | B½=diag(1,2); H_ij multiplied by 2,3,3,4, all nonzero | Pass; positive-definiteness excludes zero eigenvalue. |
| Obstruction iff, G4.3 | TS²; oriented plane with Euler1 on S² | w₂=2 mod2=0, lift exists; w₂=1, no lift | Pass in both directions. |
| Twist torsor/automorphisms, G4.4 | Point, S¹, T²; empty base | Isomorphism-class counts 1,2,4,1; automorphism counts over connected bases 2; empty base automorphism group has one element | Pass; class set distinguished from groupoid. |
| Direct sums and rank-zero unit, G4.4 | Two rank1 trivial lifts | (μ₂×μ₂)/diagonal μ₂ has 2 elements; tensor twist signs multiply; trivial rank0 acts as +1 | Pass; arbitrary rank0 can twist. |
| Skeletal orientation model, G4.4a | Trivial line on S¹ versus Möbius line | Vertex sign has two extendible classes for trivial line; Möbius edge reverses sign, hence 0 | Pass; w₁=0 versus 1. |
| Skeletal spin quotient, G4.4a | Trivial rank3 on point,S¹,T² | Frame-class counts 1,2,4 equal H¹ counts; lift automorphism group μ₂ is omitted from quotient | Pass. |
| Fixed obstruction cochain versus class, G4.4a | Trivial rank3 on disk with winding-one boundary SO3 frame | Boundary obstruction cochain value1; absolute H²(disk;F₂)=0; chosen frame does not extend, adjusted frame does | Pass; prevents conflating class and cochain. |
| Difference cocycle and moving vertices, G4.4a | One-loop graph; two loops | Differences 0 or1; two-loop values (0,0),(1,0),(0,1),(1,1); moving vertex loops alters edge cochain by δ of vertex data | Pass; one-loop coboundary 0. |
| Low-rank stabilization groupoids, G4.4a | n=1 and n=2 | Pullback Spin3 cover over SO1 is μ₂; over SO2 is squaring S¹; both keep kernel size2 | Pass; no choice-free framing of complement claimed. |
| Rank-two criterion including torsion, G4.4a | H²=ℤ with e=1,2; H²=ℤ/2 with e=1; H²=ℤ/3 with e=1 | Membership in 2H²: false,true,false,true; reduction obstruction: nonzero,0,nonzero,0 | Pass in both directions; odd torsion is divisible by2. |
| TS² skeletal/stable check, G4.4a | e(TS²)=2 | Unstabilized obstruction integer2≠0; stabilized loop class 2 mod2=0; H¹S²=0 gives one lift | Pass; not global framing of TS². |
| Real regular bundle/parity, G5.0 | n=0,1 | Ranks1,2; μ₂ acts by sign; n1 basis (1,e) has parity (+1,−1) and positive unit norms | Pass. |
| External right positive action, G5.0; Lean realCliffordPositiveRightVector | n=1, Q(e)=−1, basis(1,e) | C₊=[[0,1],[1,0]], C₊²=Id; left c₋=[[0,−1],[1,0]], c₋²=−Id; anticommutator0 | Pass; right action is self-adjoint. |
| External-action equivariance/parallelism, G5.0 | Constant Spin element g even | C₊(gs)=g ε(s)e=g C₊s; connection commutator zero for associated constant right action | Pass; tangent and external vectors are distinct inputs. |
| Spinor bundle ranks and lift change, G5.1 | n=0,2,3; periodic→antiperiodic circle | Ranks1,2,2 for chosen factors; faithful odd sum rank4; central holonomy changes +1 to−1 | Pass. |
| Spin curvature and parallel volume, G5.1 | Oriented round2 frame | R^S₁₂=−AB/2, which commutes with Γ; ∇Γ=0 | Pass; LC lift fixes the connection. |
| Virtual chiral product, G5.2 | Plane spinors ranks(1,1); signed point | Product ranks(2,2), virtual rank0=0·0; signed point multiplies class by±1 | Pass as rank check; bundle theorem still required. |
| Plane root weights/connections, G5.3 | z=i (θ=π/2) | E weight z²=−1; S⁺ weight−i, S⁻ weight i; squares−1; opposite curvature halves ±F/2 | Pass; S⁺ squares to E*, not E by label. |
| Pointwise contraction, Lean diracInFrame/eq | e₁,e₂ versus rotated frame (e₂,−e₁); zero c | Sum c₁d₁+c₂d₂ becomes c₂d₂+(−c₁)(−d₁), equal; zero c gives0 | Pass algebraically; not a geometric Dirac headline alone. |
| Dirac Leibniz and ellipticity, G6.1 | Flat line c=i, s=1, f=x | D(fs)=i=c(df)s+fDs; σ_geom(ξ)=iξ invertible iff ξ≠0 | Pass; no invertibility at zero asserted. |
| Closed-domain/self-adjoint claim, G6.1 | Periodic circle modes k; open interval negative control | Graph norm weights 1+k² give H¹; real eigenvalues ±k; on interval unrestricted H¹ has nonzero boundary pairing | Pass with closedness; interval excluded. |
| Sobolev regularity/resolvent, G6.1 | Circle high Fourier mode k | D multiplies by k; Sobolev gain1; resolvent eigenvalue (k−i)⁻¹ tends0; kernel constants dimension1 | Pass; noncompact global compactness not asserted. |
| Chiral blocks/adjoints, G6.1 | D on ℂ² with offdiagonal1 | D=[[0,1],[1,0]], ΓD=−DΓ; D⁺=D⁻=1 and their adjoints agree | Pass; distinguishes domains from bounded H¹→L² adjoint. |
| Full ungraded index, G6.1 | Circle D | Kernel and adjoint kernel both dimension1; index1−1=0 | Pass; not chiral index. |
| Symbol phase homotopy, G6.1/G6.6 | Unit ξ and t=0,1/2,1 | Multipliers 1,e^(iπ/4),i all modulus1; determinant never zero | Pass; exactness away from zero preserved. |
| General square formula, G6.2 | Flat line; round2 spin module | Flat D²=−∂²=∇*∇; round curvature contraction AB(−AB/2)=Id/2 | Pass; equals Scal/4=2/4. |
| Twisted square, G6.3 | Flat2 with twist F₁₂=i f | Extra term i f AB=diag(f,−f); zero twist gives0 | Pass; a general twist does not inherit untwisted positivity. |
| Positive/nonnegative scalar conclusions, G6.3 | Round S²; periodic flat torus | Scal/4=1/2 forces kernel0; flat kernel consists of parallel constant spinors | Pass; positive gap/closedness retained. |
| de Rham and signature gradings, G6.4 | Flat line; harmonic forms on S² | D²=−∂² on both degrees; S² harmonic dimensions b₀=b₂=1, b₁=0; Γ exchanges 0/2 with phases i,−i | Pass; chirality eigendimensions1,1. |
| Circle spectra, G6.5 | Length2π periodic and antiperiodic | Eigenvalue sets ℤ and ℤ+1/2 (sign depends on odd factor); kernel dimensions1 and0 | Pass; periodic cover disconnected. |
| Torus and sphere Checks, G6.5 | T² all four spin twists; round S² | Periodic T² constant spinors dimension2, other twists0; S² kernel0 | Pass; exact H¹ counts2²=4. |
| Real H¹/L² and bounded transform, G6.0 | Periodic circle mode k | F eigenvalue k/√(1+k²); F²−1=−1/(1+k²)→0; zero mode F=0 | Pass; Fredholm/compactness uses closed base. |
| Right Hilbert-Clifford pairing, G6.0 | One-point module A=Cl(0,1); s=e,t=1 | ⟨e,e⟩=1; ⟨e,1⟩=−e; conjugate of−e is e=⟨1,e⟩ | Pass; scalar trace inner product compatible. |
| Module versus scalar norm, G6.0 | Cl(0,3)≃ℍ⊕ℍ, projection p=(1,0) | C*-norm²(p)=1; normalized trace(p*p)=1/2 | Pass; norms equivalent, not equal. |
| Real Dirac right linearity/external oddness, G6.0 | Flat1, section f+g e | D(f+g e)=−g′+f′e; ordinary right multiplication commutes, C₊ anticommutes | Pass; two actions not conflated. |
| Real index rank0/orientation/product, G6.0 | Signed points, periodic circles, T² | Point classes+1,−1; circle η; η·η=η²; antiperiodic factor gives0 | Pass on calibrated cases; global index theorem not independently source-certified. |
| Regular-module calibrations, G6.0 | n=4,8 | Cl(0,4) real dimension16=8+8, classes a−a=0; Cl(0,8) dimension256=8·16+8·16, classes8b−8b=0 | Pass; raw dimension is not index. |
| Complexification/Morita removal, G6.0 | n=2,4,8 | c(η²)=0, c(a)=2u², c(b)=u⁴; ordinary fixed-dual multiplicities2,4,16 must be removed | Pass against TopK T7; no ungraded kernel count. |
| Four-dimensional quaternionic structure, G6.7 | J(z₁,z₂)=(−bar(z₂),bar(z₁)); J=conj on ℂ | J²=−Id on ℂ², complex dimension2; conjugation squares+Id and is excluded | Pass; finite-dimensional parity meaningful. |
| Quaternionic phase ambiguity, G6.7 | J and iJ | (iJ)²=i·(−i)J²=−Id; multiplying by t=e^(iπ/4) intertwines J with iJ since t/bar(t)=i | Pass; norm1 phase hypothesis used. |
| Kernel dimension/index, G6.7 | Quaternionic kernel/cokernel ranks r,s | Complex dimensions2r,2s; complex index2(r−s); KO₄ coefficient r−s | Pass; arbitrary complex twists excluded. |
| Raw volume normalization, G6.7 | n4, ω=e₁e₂e₃e₄ | ω²=1; ε=LωRω; product of C₊ generators=Rω; on ε-even sector Rω=Lω=−Γ | Pass; Γ=+1 corresponds to volume−1. |
| Finite parity theorem, Lean lines195–229 | V=0, ℂ² as above, attempted ℂ | Dimensions0,2 even; in dimension1 Jz=a bar(z) requires abs(a)²=−1, impossible | Pass; no group action needed. |
| Quaternionic wrapper, Lean lines234–239 | Trivial group and Q₈ acting by left multiplication on ℍ | In each case J²=−1 on complex dimension2; conclusion Even2 identical | Pass but wrapper padding, R10. |

The Fock-rescaling row uses the unnormalized basis (1,w), where native creation coefficient is 1 and native contraction coefficient is −1 because 2g_C(bar(w),w)=1. The normalized orthonormal basis (1,√2w) gives A and B used in the other rows. This distinguishes a basis normalization from a change of the Hermitian slot convention.

**Library declarations opened and duplication audit.** Object searches covered Clifford/exterior/base change, conjugation, volume products, regular trace, matrix Morita equivalence, Spin covers and units ranges, covariant derivatives and quaternionic structures. Relevant definitions and hypotheses were inspected, not merely matched by proposed names. Paths in this table are relative to the named pinned library.

| Pinned owner and locator | What was read / consequence |
| --- | --- |
| Mathlib `LinearAlgebra/CliffordAlgebra/Basic.lean:125`, `:136` | `comp_ι_sq_scalar` and `lift`: native generator square and universal property, without a private geometric algebra. |
| Mathlib `LinearAlgebra/CliffordAlgebra/Basic.lean:379` | `equivOfIsometry`: algebra equivalence from an actual quadratic isometry. |
| Mathlib `LinearAlgebra/CliffordAlgebra/Contraction.lean:351` | `equivExterior` is a linear equivalence requiring invertible2; it is not an algebra equivalence with wedge multiplication. |
| Mathlib `LinearAlgebra/CliffordAlgebra/BaseChange.lean:118`, `:142`, `:182` | Involute/reverse transport and `equivBaseChange`: Clifford of the extended form maps TO the scalar tensor Clifford carrier; README correctly uses its inverse. |
| Mathlib `LinearAlgebra/CliffordAlgebra/Conjugation.lean:303`, `:311` | Forward even/odd involute laws; no public converse asserted from these declarations. |
| Mathlib `LinearAlgebra/CliffordAlgebra/Star.lean:36`, `:50`, `:56`, `:60` | Actual native StarRing, generator, scalar and scalar-embedding laws: star fixes complex coefficients. |
| Mathlib `LinearAlgebra/CliffordAlgebra/Prod.lean:170` | `prodEquiv` targets a graded tensor product. |
| Mathlib `RingTheory/Morita/Matrix.lean:41`, `:59`, `:144`, `:187`, `:205` | Matrix module functor, corner submodule with scalar tower, counit and equivalences. No finite-dimensional hypothesis on the arbitrary module E. |
| Mathlib `LinearAlgebra/Trace.lean:75`, `:103` | Native trace and trace cyclicity; trace has a zero fallback when no finite basis exists, so finite-dimensional Clifford hypotheses matter in R03. |
| Mathlib `Geometry/Manifold/VectorBundle/CovariantDerivative/Basic.lean:489`, `:503` | Addition of a one-form and the difference construction; the latter carries smooth-bundle/manifold/finiteness assumptions. |
| Tau Ceti `LinearAlgebra/CliffordAlgebra/VolumeElement.lean:242`, `:260`, `:290` | Raw even-volume anticommutation, square and reversal, distinct from the geometric Hermitian/chirality comparisons. |
| Tau Ceti `LinearAlgebra/CliffordAlgebra/SignSwitch.lean:140` | Sign switch after adjoining a positive line; not a real full-algebra isomorphism Cl(n,0)≃Cl(0,n). No false duplication finding made. |
| Tau Ceti `Topology/Algebra/CliffordAlgebra/Spin/Covering.lean:52` | Actual covering theorem requires NeZero n and compact Spin carrier. |
| Tau Ceti `Topology/Algebra/CliffordAlgebra/Spin/Connected.lean:38` and `Compact.lean:265` | Path-connectedness at n+2 and compactness instance. These do not alone prove simple connectivity. |
| Tau Ceti `Topology/Algebra/CliffordAlgebra/Spin/Real/Projection.lean:78`, `:108`, `:175` | Topological units-range equivalence, continuous SO-range projection and surjectivity. |
| Tau Ceti `Geometry/Lie/CliffordAlgebra/Spin/Projection.lean:272`, `:301`; `Differential.lean:248` | Smooth units-range map and coordinate Lie differential, including its polar-form factor2. |
| Tau Ceti `RepresentationTheory/QuaternionicStructure.lean:68`, `:94` | Native predicate contains the square and intertwining equations, not finite-dimensionality or a Hermitian metric; its bijectivity theorem is already supplied. |

The main and authorized open-roadmap object search used `roadmaps grep` and `roadmaps show`, followed by direct reads. Main's existing SpinGeometry definitions are the baseline of this PR, not a second owner. No conflicting fully qualified Lean name was found in a different roadmap among the matched declarations. The board package index lists five unrelated packages; local package README/design searches did not identify a competing geometric-spin owner. The algebraic real periodicity, native Fock action and raw volume results are expressly supplied rather than reconstructed as new geometric results. The pointwise geometric normalizations, bundles, lift comparisons and analytic Dirac constructions are SpinGeometry's mathematical direction; the new skeletal extension belongs in its Part II under the brief.

**Resolved cross-roadmap contracts.** These are actual section resolutions; reciprocal edges are still defects under R01. Existing-roadmap revisions were not treated as new dependencies. Open heads were used to check overlap and, for new roadmaps, to resolve their own contracts.

| Supplier / consumer | Resolution checked |
| --- | --- |
| SpinRepresentations Layers0–4,7,9 and Layer2 foundation | Main `TauCetiRoadmap/RepresentationTheory/SpinRepresentations/README.md:428` and `:520`: native compact cover/path connectivity, then n≥3 simple connectivity. The supplied open SpinRepresentations head also has `SpinCompactTopologyFoundation` (line605); it does not own geometric Clifford bundles. |
| OrthogonalSpinGroups Layers0–2 | Main `Completed/OrthogonalSpinGroups/README.md:331`, `:408`, `:610`; archived location, not a missing supplier. The relative active-folder link needs correction in the supplier rewrite. |
| SmoothBundlesConnections B1–B6.0 | Main sections B1.1 line315, B2.1 line559, B2.2 line605, B2.5 line802, B3.3 line936, B4.1 line979, B5.1 line1115, B6.0 line1306. Invariant tensors really are parallel associated sections at lines941–944. |
| HopfRinow L1 | Main `Completed/HopfRinow/README.md:29` onward explicitly supplies native Levi–Civita and regularity; archived location should replace active-folder link. |
| RiemannianGeometry R1/R5/R7 | Main R1 curvature convention, constant-curvature formula and R7 real Weitzenböck development; its supplier list at line117 consumes SpinGeometry's exterior comparison, yielding R01. |
| DifferentialGeometry L0–L2,L5–L9 | Main sections at lines268,311,341,503,782,806,816,862: forms, exterior derivative, orientation, integration and cohomology comparisons. |
| ComplexKahlerGeometry K1/K4/K5a | Main K1 line96, K4 line444, K5 line568, including the independent pointwise Gram/star package at lines582–610. Analytic real/complex bundle support is part of K5a, not a supplied geometric spin operator. |
| CharacteristicClasses C1/C3.5/C7.3 | Main C1.0 line213; C3.5 lines901–943; sphere stable tangent adapter lines1559–1562. The stated rank-zero convention and radial stable framing exist. |
| AlgebraicTopology stages2–6 and 8.9 | Main 8.9 lines1870–1910 supplies local-coefficient section/difference cochains and distinguishes fixed-cochain vanishing from class vanishing. Supports the actual CW proof route; no absent-target finding. |
| TopologicalKTheory T1–T3/T6.4/T7 | Main bundle/K-ring/compact-support sections lines163,613,754; continuous principal-bundle subsection in T6; T7 graded ABS quotient lines1225–1268 includes the exact a,b signs and complexification coefficients. |
| GeneralizedCohomology G5.5 | Main G5.5-Transfer lines1892–1938 and following RealHilbert/Regularity subsections supply the named finite-Clifford analysis contracts. Its explicit SpinGeometry trace consumption establishes R01. |
| PseudodifferentialOperators P1.0/P4–P6 | Supplied new-roadmap head: P1.0 line151, P4 line769, P5 line914, P6 line1470. Includes actual operator/formal-adjoint, mapping and elliptic-regularity targets. |
| TangentialBordism B3.0 and IndexTheory I7.5 | Supplied open heads place the analytic/geometric ABS and numerical index comparisons downstream of SpinGeometry. They are consumers here, not inputs. |

No UPWARD line was produced. Roadmaps on main are allowed suppliers independently of their absence from ORDER; absence from that file was not treated as a defect. No declared gap was found, and no nonexistent supplier prerequisite was inferred merely from an unimplemented but explicitly planned section.

## Not verifiable

- The worker's claimed 15-target sample has no target list or seed in the brief or scratch evidence. The reproducible supplemental sample above is not represented as the worker's sample.
- Lawson–Michelsohn, *Spin Geometry*, Chapters I–II: the sources service found no legal full text through the bibliographic query or DOI `10.1515/9781400883912`; the publisher landing page did not expose the needed text. Publisher-preview/bibliographic search did not certify the target chapters. Broad chapter citations cannot certify individual hypotheses or pages.
- Atiyah–Bott–Shapiro, *Clifford modules*, DOI `10.1016/0040-9383(64)90003-5`: the sources service returned `uncertified` for the paywalled publisher. No request was made to bypass access. Its precise graded quotient and KO comparison locators were not checked against the paper.
- Kirby course notes pp.89–92: the README supplies no title, version or URL. The service's broad query returned an uncertified Springer result, which cannot be identified with the course notes. That result was not silently substituted for the intended text.
- The Zulip reference fetched through the sources service yields an application shell, not message 400464524 (`clifford-zulip` line7). The pinned contraction API was inspected instead. The two Mathlib PR pages were fetched legally: `mathlib-pseudoscalar` line203 concerns positive-form pseudoscalars; `mathlib-basis` line172 concerns construction from a basis. Neither online page replaces the pinned declarations.
- The full paracompact/infinite-CW comparison, Sylvester smooth metric-change theorem, real finite-Clifford completion/stabilization/index package and all-dimensional analytic KO calibration have not been source-certified at exact published locators. Their supplied contracts, formulas and explicit test instances were checked as described above. There is no claim of a complete proof audit of these large constructions.

Missing-text entries from this run were consolidated, and entries resolved by successful source fetches were removed. No source manifest or PR content was edited. Missing sources did not stop the mathematical, signature, gate and ownership checks or the delivery of this verdict.

## Source issues

The following were found in the author-hosted Nicolaescu version. Ambiguous extracted symbols were checked against rendered pages631–633,645,654,659,670; in particular the conjugation bar in the complex adjoint formula is present in print and is **not** an error. None of the errors below was used as a premise of the review.

- **Misprint** in nicolaescu at proof of Proposition12.1.19, printed p.631: the source says every real vector has Clifford square −Id; it should be −norm(v)²Id, or restrict to unit vectors; affects the proof.
- **Misprint** in nicolaescu at chirality identity following Remark12.1.23, printed p.632: the source says Γx equals the parity sign times Γ; it should be the parity sign times xΓ; affects a stated result.
- **Misprint** in nicolaescu at Example12.1.25, printed p.633: the source says the final spinor-dual tensor product is over ℝ; it should be over ℂ in this complex-module identification; affects a stated result.
- **Error** in nicolaescu at Example12.1.44, printed p.645: the source says odd central-volume multiplication interchanges the two irreducible Clifford factors; it should preserve both factors, with their Spin equivalence supplied by a separate intertwiner; affects the proof.
- **Misprint** in nicolaescu at Exercise12.1.45, printed p.645: the source says the second unit vector satisfies v=Jv; it should be v=Ju; affects a stated result.
- **Error** in nicolaescu at proof of Proposition12.1.65, printed p.654: the source says simultaneously taking affine combinations of metrics and compatible connections preserves compatibility; it should first fix a compatible metric and patch connections compatible with that same metric; affects the proof.
- **Misprint** in nicolaescu at proof of Lemma12.2.2, printed p.659: the source says the final iterated-vector-derivative term has a minus sign; it should have a plus sign from the dual-connection Leibniz rule; affects the proof.
- **Error** in nicolaescu at Example12.2.31(c), printed p.670: the source says every sphere has a unique spin structure; it should exclude S¹, which has two, and state the intended rank convention; affects a stated result.
- **Error** in nicolaescu at Example12.2.31(d), printed p.670: the source says w₂(RPⁿ) vanishes exactly for n congruent3 modulo4; it should include n congruent0 modulo4 for n≥2, and handle n=0,1 separately; affects a stated result.

Short witnesses for these source issues: v=0 has Clifford square0; x=0 makes the printed chirality identity's two sides0 and Γ; a real tensor S⊗ℝS* has twice the real dimension of S⊗ℂS*; odd ω is scalar on each simple factor. For the connection claim on a trivial complex line take h₁=1, ∇₁=d, h₂=e^(2x), ∇₂=d+dx, and average with weight1/2: at x=log2, dh=4dx but 2Ah=(5/2)dx. Finally H¹(S¹;F₂)=F₂ gives two spin structures, and w₂(RP⁴)=binomial(5,2)a²=0.

For Lemma12.2.2, `nicolaescu` line30550, take the flat real line, α=dx, X=x²∂x and Y=Z=∂x. The left side is0; the printed right side is2−2−2−2=−4. Correcting the last sign gives0.
