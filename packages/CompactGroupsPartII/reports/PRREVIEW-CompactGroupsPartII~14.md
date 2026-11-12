# Review of CompactGroupsPartII (pull request #1047 at 7fcba97)
Folder: `TauCetiRoadmap/RepresentationTheory/CompactGroupsPartII/`
**Verdict:** accepted

Incremental re-review of 0 changed lines in the folder since fc50ce5. The only change is to the family index `TauCetiRoadmap/RepresentationTheory/README.md` (two passages) and to the generated `roadmap-summary` block of the description. Both previous findings are repaired and the repairs introduce no new problem. No finding remains; the gate passes.

Unless otherwise specified, README locations mean `TauCetiRoadmap/RepresentationTheory/CompactGroupsPartII/README.md`; Lean locations mean its `Suggested.lean`.

## Previous findings

- R01 — repaired: family index :50–54 now reads "the Hilbert-Schmidt energy identity for continuous kernels, invariant Hermitian metrics and unitary equivalence from equal characters, … global forms with their formal characters"; :100–108 names LieGroups Layers 0, 2-5, 5A, 6, 7, ConvexityToric T1, pinned highest-weight modules, BanachSpaceTheory B5.
- R02 — repaired: the `roadmap-summary` block now states the energy identity, the dominant-torus-character classification, the integral basis of the Weyl invariants and "the character basis used after TopologicalKTheory constructs the representation ring"; no highest-weight-roadmap supplier is named.

## Verified sound

**The changed passages (family index).** Read the whole 14-line addition against the roadmap and against the suppliers as they are on main now (252dfa4, which has moved since this branch's base).

- Entry at the index :50–54. Each of its eight items is a layer of the roadmap: energy identity (§0.2), invariant metrics and unitary equivalence from characters (Layer 1, §1.4), G-finite Banach vectors (§2.1), countability and metrizability (§3.1), arbitrary products (§4.1), compact abelian Fourier theory (§5.1), global forms with formal characters (Layer 6), unitary SU(2) actions (§7.1). "Representation rings" is gone, in agreement with README:60–65 (TopologicalKTheory T6 owns R(G)).
- Dependency line at the index :100–108, compared item by item with README:375–400: Layers 0 and 2–5 (exponential, automatic smoothness, Lie integration, covers), Layer 5A (compact structure), Layer 6 (maximal tori, Weyl group, compact real roots), Layer 7 (compact simply connected covers), ConvexityToric T1 (period and weight dictionary), pinned Mathlib/Tau Ceti highest-weight modules, BanachSpaceTheory B5 (separability criterion). All eight agree with the roadmap's supplier contracts; none is a roadmap later in the merge order.
- Resolved on main: `TauCetiRoadmap/RepresentationTheory/LieGroups/README.md` :252, :356, :446, :463, :518 (Layers 0, 2–5), :641 (Layer 5A), :673 and :750 (Layer 6, "Compact real roots and the Weyl comparison"), :787 and :883–890 (Layer 7, "Compact semisimple integration": finite π₁ and compact universal cover). `TauCetiRoadmap/SymplecticGeometry/ConvexityToric/README.md` now heads the section "Layer 1" (:204, §1.1 at :206, dictionary and isogeny comparison at :218–228) and says at :200 that the labels T1–T5 denote the same five layers in supplier citations, so "T1" in the index and at README:48, :390 and the Layer 6 citations still resolves. `TauCetiRoadmap/BanachSpaceTheory/README.md` :42 and :841–848 (B5: Hilbert basis index countable iff separable).
- Both relative links of the new dependency line (`../SymplecticGeometry/ConvexityToric/README.md`, `../BanachSpaceTheory/README.md`) and the entry link `CompactGroupsPartII/README.md` exist at this head.
- No process words, pull-request numbers or LaTeX in the added lines.

**The description.** Read the `roadmap-summary` block and the author's paragraphs against the head. Checked: "three definitions and fifteen headline theorems" (18 declarations, 15 `sorry` warnings); "Besides the two files of the roadmap folder, the pull request changes only the family index" (`git diff --stat origin/main...HEAD`: the two folder files, 1739 and 311 lines, and the index, 14 lines); the supplier list (LieGroups Layers 0, 2–5, 5A, 6, 7; ConvexityToric T1; BanachSpaceTheory B5; TopologicalKTheory T6 as consumer) equals README:375–400 and :60–65. The generated `merge-order` block states an order for the shared family index (after the two earlier index changes, before LieHighestWeight's), so no unstated conflict.

**Gate.** The worker's gate at 7fcba97 passes every check (all counters 0, `build=0 OK`); there is no gate failure to report. Dependency check, run with the candidate order, `--movable` and main content, exit 0:

```text
depcheck: 235 roadmaps, 2133 edges, 0 problem(s)
```

No UPWARD, CYCLE or `moved:` line.

**Elaboration.** `lake env lean` on `Suggested.lean` at this head: exit 0, exactly fifteen `declaration uses sorry` warnings (lines 53, 68, 86, 148, 163, 170, 189, 204, 218, 241, 250, 257, 269, 289, 302), nothing else. A scratch copy with `#check @name` for all 18 declarations (3 definitions, 15 theorems) elaborated without error; the types are those of the supplied signature inventory, which is byte-for-byte the folder the previous review compared with the README. The one flagged binder loss is `compactCharacter : (G) → [CommGroup G] → [TopologicalSpace G] → PontryaginDual G → C(G, ℂ)`: a coercion of an existing circle character, which needs neither compactness nor Hausdorffness; its two consumers (`compactCharacter_span_dense`, `exists_characterBasis`) carry `[IsTopologicalGroup G] [CompactSpace G] [T2Space G]` in their own signatures. Nothing changed.

**Headlines and padding.** `Suggested.lean` is unchanged, so the previous report's inventory (fifteen statable headlines stated; §1.3 and §§6.5–6.7 named in the module docstring as not statable, with the missing carriers) and its one-tactic probe (all fifteen remain open under `simp`, `rfl`, `infer_instance`, `exact?`) carry over; pins are unchanged (`lake-manifest.json` is not in the diff).

**Sources.** No seeded target lies in a changed passage. Spot-checked again three locators the sample names: Knapp2021 lines 10109–10120 (Proposition 4.8 and Corollary 4.9, printed p.240) for §§1.2–1.3 at README:615 and :645; Etingof2024 lines 6–12 (§37.1, countable base assumed) and lines 151–157 (Theorem 37.5) for §3.1 at README:900, which restricts the citation to the countable setting. §§6.4 and 6.8 carry no book locator (they are deductions from pinned declarations and earlier sections). The other sampled targets (0.1, 5.1, 6.1–6.3, 6.5–6.7, 6.9, 7.1) are covered by the locator table of the previous report on the identical text.

**Duplication, ownership, overlaps.** The overlap inventory at this index (439 open pull requests) lists no other pull request changing this roadmap, no cited id dropped, no id only an open revision defines; `roadmaps resolve` lists no unresolved citation or Lean name. The five closest roadmaps (AutomorphicFormsOnReductiveGroups, NoncompactQuantumSymmetry, SmoothBanachRepresentations, ClassicalGroups, LieHighestWeight) are the same five whose scope the previous report compared; the folder text they were compared with is unchanged. The 19 pinned-library comparisons and 13 cross-roadmap comparisons of the previous report stand for the folder; this round re-resolved the four supplier roadmaps the changed index names (above).

**Outside the folder.** `git diff --stat origin/main...HEAD` excluding the folder and the family index is empty.

**Adversarial table.** No statement of the roadmap changed. The first two rows are this round's checks of the changed index text; the remaining rows are carried forward unchanged from the previous report (the review at fc50ce5), whose computations were made on the identical folder.

| Statement | Instances | Computed values on both sides / wrong model | Result | Change |
| --- | --- | --- | --- | --- |
| Family index entry (changed) | Eight listed items against the eight layers 0–7; R(G) | 8 of 8 items match a layer heading; R(G) appears in 0 layers and is owned by TopologicalKTheory T6 (README:60–65); index now lists 0 excluded objects. | Agrees. | None |
| Family index dependency line (changed) | Eight named suppliers against README:375–400 and main | 8 of 8 named (Layers 0, 2–5, 5A, 6, 7; T1; pinned modules; B5) occur in the supplier contracts; 8 of 8 resolve on main; 0 are later in the order (depcheck 0 problems). | Agrees. | None |
| Conventions: irreducible/zero | Trivial actions on 0, ℂ, ℂ² | Invariant-subspace lattices have 1, 2, more than 2 elements; `IsSimpleOrder` admits just the line. | Zero excluded. | Keep |
| Conventions: coefficient/trace/Haar | C₃ scalar ω | ⟪ω,1⟫=ω², trace=ω; (1+ω+ω²)/3=0; norm of constant²=3/3=1. | Inverse indexing and normalization agree. | Keep |
| 0.1 tensor/naturality/unit/associativity | Line maps 2I,3I,5I | Tensor and composition give 6; both triple routes give 30; tensor unit preserves 2. Rescaling violates the pure-tensor prescription. | Coherence agrees. | Keep |
| 0.1 shrinking, tensor and dual | C₃ scalar ω | Shrinking preserves ω; tensor square gives ω²; dual gives ω⁻¹=ω², not ω. | Variance correct. | Keep |
| 0.1 evaluation, coevaluation and contractions | Dual basis of ℂ²; zero space | e₁*⊗e₂ maps to 0, e₁*⊗e₁ to 1; coevaluation has two diagonal tensors; contractions return e₁ and e₁*. On 0, both routes are the zero identity. | Both inverse identities pass. | Keep |
| 0.2 energy | Two points mass ½, k=1 | Averaging projection energy=1; product integral=4·¼=1. | Normalization correct. | Keep |
| 0.2 adjoint/complex linearity | k(1,2)=i, other entries 0 | A₁₂=i/2, A*₂₁=−i/2; both energies=¼. A_(ik)=iA_k has entry −½. Transpose gives wrong sign. | Laws discriminate. | Keep |
| 0.2 norm bound/scaling/degeneracy | Constant kernel, total mass M; μ=0; empty space | Eigenvalue and norm=M, bound=M·1, energy=M²=product mass. At M=0 or empty space both sides=0. | Finite measure, not probability, suffices. | Keep |
| 0.2 rank-one formula/a.e. kernel | k=a(x)conj b(y); μ=δ₁ and k supported at (2,2) | Energy=‖a‖²‖b‖²=product integral. Second example gives A=0, integral=0 although k≠0. | No false pointwise injectivity. | Keep |
| 0.2 nonregular measure | Dieudonné measure on [0,ω₁] | L² is a line; A scalar=k(ω₁,ω₁); both energies=its squared modulus, while μ({ω₁})=0. | Regularity unnecessary. | Keep |
| 0.2 convolution order | S₃, x=(12),y=(23), f=indicator of (123) | xy⁻¹=(123): value 1; y⁻¹x=(132): value 0. Normalized kernel mass=1/6=‖f‖²₂. | Matches native order. | Keep |
| Layer 0 example | Weyl integral of 1 on SU(2) | (1/(2π))·4·(π/2)=1=Haar mass. | Weyl factor correct. | Keep |
| 1.1 Gram convention/positivity | Line, T=2I or 0 | h(1,i)=2i, h(i,1)=−2i; reversed slot gives −2i for first test. T=0 gives h(1,1)=0, not >0. | Scalar slot and strict positivity fixed. | Keep |
| 1.1 invariance iff commutation | T=diag(1,2), trivial action and axis swap S | Trivial case: both true. TS e₁=2e₂≠e₂=ST e₁; h(Se₁,Se₁)=2≠1. | Both directions agree. | Keep |
| 1.1 real linearity/inverse | T=diag(1,2), T'=I; zero space | T+3T' and summed forms have diagonal (4,5); inverse recovers (1,2). Zero space has one form and operator. | Degeneracy harmless. | Keep |
| 1.2 unique scalar | Irreducible line T=2I; trivial ℂ² diag(1,2); zero | c=2 unique, c=1 fails; no common scalar on ℂ², which is reducible; zero would destroy uniqueness but is excluded. | Hypothesis needed. | Keep |
| 1.2 metric-rescaling isometry | h₂=4h₁ | h₂(v/2,v/2)=h₁(v,v), whereas identity gives 4h₁. | Direction correct. | Keep |
| 1.3 commutant algebra/adjoint | Two copies, E₁₂,E₂₁ | E₁₂E₂₁=E₁₁, reverse=E₂₂ in both factors; E₁₂*=E₂₁. | Not opposite algebra or entrywise conjugation. | Keep |
| 1.3 units/metrics/empty product | diag(1,2); one or zero copies | Inverse diag(1,½), product I; eigenvalues 1,2>0. One copy gives c>0; no copies gives one element and the vacuously definite form. | Inverses and metric cone agree. | Keep |
| 1.3 coordinate change/reindexing | U=diag(1,i), A=[[1,1],[1,2]]; swap | UAU*=[[1,−i],[i,2]], opposite=[[1,i],[−i,2]]; swap sends diag(1,2) to diag(2,1). | Sign and direction fixed. | Keep |
| 1.3 finite average | C₃ trivial line | Normalized average=3/3=1; raw sum=3. | Imported normalization agrees. | Keep |
| 1.4 unitary equivalence | SU(2) standard and conjugate at diag(i,−i) | Traces both 0; JgJ⁻¹=conj g, J*J=I; identity fails since g≠conj g. | Equal characters do not mean equal matrices. | Keep |
| 1.4 reducible, noncompact group | ℤ: diag(1,(−1)^n) and flip^n | Both traces=1+(−1)^n; B=[[1,1],[1,−1]], B*B=2I; B/√2 is unitary intertwiner. | No irreducibility/compactness needed. | Keep |
| 1.4 negative/zero cases | Unipotent ℤ action versus trivial ℂ²; 0 versus 0 or ℂ | Unipotent trace=2, but generator sends e₂ to norm √2≠1, so excluded. Zero pair traces 0=0; 0 versus line has 0≠1. | Unitarity and dimension controls work. | Keep |
| 2.1 `IsGFinite` | Zero, trivial line over 𝔽₂, two circle modes, ℤ-shift δ₀ | Orbit-span dimensions 0,1,2,∞. Last fails; field-general definition includes 𝔽₂. | Finite span, not finite orbit. | Keep |
| 2.1 submodule/maps/translates | Modes 0 and 1, scalar 0, mode-0 projection | Sum dimension 2; zero dimension 0; projection dimension 1; translation preserves dimension 2. | Closure and equivariant functoriality agree. | Keep |
| 2.1 Banach density hypothesis | Rotations on C(S¹) | Nonidentity rotation has ‖R−I‖=2, while each orbit is continuous; vector approximation error <ε/2+ε/2=ε. | Norm continuity not imposed. | Keep |
| 2.1 covariance/finite range | S₃, f=6δ_t, h=(12),t=(23) | π(f)=π(t); left covariance gives π(ht)=π((123)), reverse gives π((132)); translate span dimension ≤6. | Correct multiplication and finite-range route. | Keep |
| 2.1 approximate identity/compact bound | Trivial Banach action; mass 1 or 2; real dilation | Integrated vectors v or 2v, respectively; Cπ=1 for trivial action; sup exp(t)=∞ for noncompact dilation. | Normalization and compactness used. | Keep |
| 3.1 countability/separability | Trivial group, C₃, S₃ | Irrep counts 1,3,3; basis sizes 1,3,1²+1²+2²=6; all countable, L² separable, groups metrizable. | Class count need not equal basis size. | Keep |
| 3.1 infinite products | Circle^ℕ, Circle^J with J uncountable | Finite integer sequences on ℕ countable; distinct coordinate characters have squared L² distance 2; uncountable J gives nonseparable L² and nonmetrizable product. | Both directions discriminate. | Keep |
| 0.2/3.1 product sigma algebra | Uncountable circle product; identity x and y differing outside a chosen countable set of coordinates | Indicator of the complement of {identity} is 0 at x and 1 at y, but every set depending on those coordinates gives equal membership. That open set is Borel but not in the coordinate product sigma algebra. | Continuous product kernels need the stated separate measurability argument. | Keep |
| 3.1 support versus dual | Single coordinate character on Circle^J | Fourier support size 1, coefficient mass 1; whole dual has cardinal at least J. | Individual countable support is not separability. | Keep |
| 4.1 finite coordinates | Empty product; S₃×C₃ with sign·ω | Empty product: 1=empty scalar product; at ((12),generator), both formulas give −ω. | Nonabelian factors allowed. | Keep |
| 4.1 product dual/integer uniqueness | Circle² vector (1,−1), point (i,−1) | Value i·(−1)⁻¹=−i; restrictions recover 1,−1. Zero map gives 1; inverted map gives i. | Generator formula fixes the map. | Keep |
| 4.1 direct-sum topology | Coordinate characters χ_n on Circle^ℕ | At constant −1 each χ_n=−1, never tending to 1; coordinatewise direct-sum topology would tend to 0. | Discrete topology necessary. | Keep |
| 4.1 circle supplier | T=2π, x=π/2, n=0,1,−1 | Exponential values 1,i,−i equal z^n at i; 2π>0. | Corrected locator/type/sign agree. | Keep |
| 5.1 `compactCharacter` laws | χ=z,ψ=z⁻¹ at i | Values i,−i; product 1=c_(χψ); conjugate i=−i=c_(χ⁻¹); trivial character=1. | Body determines correct map. | Keep |
| 5.1 irrep correspondence/basis | Circle scalar χ at i; trivial ℂ² | Dimension 1 and trace i, but coefficient −i; basis indexed by χ comes from inverse model. Trivial ℂ² dimension 2 is reducible. | Reindexing pinned by scalar formula. | Keep |
| 5.1 orthogonality/uniform density | C₃ and trivial group | Distinct pairing=(1+ω+ω²)/3=0; diagonal 1. Three characters span ℂ³; constant 1 spans ℂ on trivial group. | Density and orthogonality agree. | Keep |
| 5.1 expansion/Parseval | f=cχ+2cψ, χ≠ψ | Coefficients 1,2 reconstruct f; squared norm=1+4=5. | L² statement, no pointwise overclaim. | Keep |
| 6.1 weights/formal character | Inverse circle character, trivial ℂ², zero | e_(−1),2e₀,0 evaluate at i to −i,2,0; coefficients equal weight dimensions 1,2,0. | Multiplicity and zero case correct. | Keep |
| 6.1 sum/tensor/dual | Weights ±1 | t+t⁻¹ has trace 0 at i and dimension 2; tensor tt⁻¹=1; dual t⁻¹. −e₀ coefficient −1 cannot be a weight dimension. | Virtual and genuine distinguished. | Keep |
| 6.2 period iff | Circle z^n and half-weight | dχ=in, ℓ=n; period value exp(2πin)=1 for n integral; half-weight gives exp(iπ)=−1. | Nonintegral converse rejected. | Keep |
| 6.2 sign/rank zero | n=−1, θ=π/2; trivial torus | exp(iℓθ)=−i, wrong exp(ℓθ)=exp(−π/2); rank zero has lattice 0, unique character value 1. | i and period normalization correct. | Keep |
| 6.3 conjugation/opposite weights | Real rotation plane v=e₁−ie₂ | Rθv=e^(iθ)v; cv has weight −1; c(iv)=−icv; c²v=v. | Semilinear, not complex-linear. | Keep |
| 6.3 real form/base change | Real trivial line and rotation plane | Fixed set in ℂ is ℝ since c(i)=−i; ±1 eigenspaces each complex dimension 1, total 2=real plane dimension. | Fixed real form is not all complexification. | Keep |
| 6.4 Weyl action/representatives | s₁=(12),s₂=(23), permutation matrices | nσ⁻¹tnσ e_j=t_(σ(j))e_j; (s₁s₂)e₁=e₂, reverse=e₃. Multiplying representative by diagonal phase gives same torus conjugation. | Left action matches pin. | Keep |
| 6.4 orbit sums/multiplication | (1,1,0), zero; eλeμ | Orbit sizes 3 and 1, not 6; w(eλeμ)=e_(wλ+wμ)=e_(w(λ+μ)). | No stabilizer overcount. | Keep |
| 6.5 cocharacter equality | SU(2), H_R=diag(i,−i); SO(3) | exp(2πH_R)=I, exp(πH_R)=−I; Y_SU2=ℤH_R=Q∨. Quotient has Y=½ℤH_R, index 2 over Q∨. | Simply connected hypothesis essential. | Keep |
| 6.5 sign/dominance | SU(2) weight n, H=−iH_R | λ(H)=(iℓ)(−iH_R)=n; root(H)=2; dominance n≥0. Half-weight pairing ½ fails integrality. | Normalizations agree. | Keep |
| 6.5 finite central cover | U(2), SO(3), circle, trivial group | (z,A)↦zA has kernel {(1,I),(−1,−I)} and dimensions 1+3=4. SO(3) kernel size 2; circle/trivial cover kernel size 1 and derived dimension 0. | No zero-rank or central-kernel defect. | Keep |
| 6.5 descent/index | U(2) central q and SU(2) highest a | Kernel scalar (−1)^(q−a): (1,1) gives 1, (0,1) gives −1; allowed lattice index 2=kernel order. | Full period condition retained. | Keep |
| 6.5 center versus derived dominance | U(2) weight (a,b) | Derived=a−b; center q=a+b; q−derived=2b; Killing form zero on center. | Dominance only tests derived direction. | Keep |
| 6.6 classification/descent | SU(2) weights 1,2 on SO(3) quotient | −I acts by −1,+1; only second descends, dimension 3; excluded first dimension 2. | Necessity and sufficiency agree. | Keep |
| 6.6 central uniqueness | Circle weights 0,1; U(2) weights (1,0),(2,1) | Circle derived weights both 0, center at i is 1,i. U(2) derived both 1, center i,i³=−i. | Central characters not discarded. | Keep |
| 6.6 operations/intertwiners | Descending (q,a)=(1,1), dual and tensor; 2I | Dual (−1,1) parity −2 gives kernel scalar 1; tensor gives 1·1=1; descended 2I still maps v to 2v. | Descent respects operations. | Keep |
| 6.6 connectedness control | C₂ trivial and sign | Both derivatives 0, values at generator 1 and −1. | Disconnected false converse excluded. | Keep |
| 6.7 invariant basis/unitriangularity | SU(2) weights 2,0 | χ₂=t²+1+t⁻²=m₂+m₀; χ₀=m₀; diagonal (1,1), determinant 1. | Integral basis plausible with stated proof. | Keep |
| 6.7 nonnegative weights not genuine | SU(2), t²+t⁻² | Weight coefficients 1,1; irreducible expansion χ₂−χ₀ has coefficient −1. | No false positivity claim. | Keep |
| 6.7 torus/trivial limits | Circle W=1, trivial group | Invariants ℤ[t,t⁻¹], basis t^n; trivial case ℤ, basis 1. | Center and zero rank retained. | Keep |
| 6.8 U(n) congruence | U(3), λ=(2,1,−1); bad q=0,a=(1,0) | q=2,a=(1,2), Σia_i=5≡2 mod3; bad kernel scalar ζ⁻¹≠1. Generally Σia_i=q−nλ_n. | Correct central congruence. | Keep |
| 6.8 Laurent/low rank | U(2), U(1), U(0), SO(3) | e₂e₂⁻¹=1 requires inverse; U(1) ring ℤ[t,t⁻¹], mod1 vacuous; U(0) gives ℤ; SO(3) allows even d with dimension d+1. | Generality and boundary cases agree. | Keep |
| 6.9 positive U(2) recognition | f(2,0)=1,f(1,1)=2,f(0,2)=1 | m(2,0)=1−0=1, m(1,1)=2−1=1; reconstruction 1,2,1; dimension 3+1=4. | Recovery and sufficiency agree. | Keep |
| 6.9 negative/natural subtraction | f(1,−1)=f(−1,1)=1, f(0,0)=0 | Symmetric, but required 1≤0 false; formal m(0,0)=−1. Nat subtraction's 0 cannot rescue the input. | False genuine character excluded. | Keep |
| 6.9 negative determinant/zero | Singleton (−1,−1), zero f | At diag(i,−1), det⁻¹=1/(−i)=i; det gives −i. Zero f gives n=0, trace 0, inequalities 0≤0. | Negative exponents/zero included. | Keep |
| 6.9 bounded enumeration | Total q=−3,…,3, coordinates −4,…,4, symmetric coefficients 0,1,2 with outward inequalities | 101 valid functions; all 101 exactly reconstructed by string differences; all 101 weight sums equal string-dimension sums. | Independent computed sanity test, not proof. | Keep |
| 7.1 torus weights/parity kernels | Sym¹,Sym² at i and −1 | At i: (−i,i), (−1,1,−1); at −1: (−1,−1), (1,1,1). Kernels {I},{±I}; Sym⁰ kernel all SU(2). | Odd highest weight faithful. | Keep |
| 7.1 sum/faithfulness/dimensions | Sym¹⊕Sym¹, Sym⁰⊕Sym¹, Sym² | Dimensions 4,3,3; kernels {I},{I},{±I}; odd-weight occurrence true,true,false. | Iff matches injectivity. | Keep |
| 7.1 realization/uniqueness | m=δ₂,2δ₁,0 | Realized dimensions and identity characters 3,4,0 equal Σ(d+1)m_d; character independence recovers same lists. | Existence includes zero. | Keep |
| 7.1 embedding comparison | Standard SU(2), trivial map, SO(3) quotient | Standard derivative H_R↦H_R≠0, kernel {I}; trivial derivative 0, kernel all; quotient kernel {±I}. | Smoothness alone insufficient, injectivity used. | Keep |
| 7.1 partition counts | n=0,1,2,3,4 | (p,p_odd)=(1,1),(1,1),(2,1),(3,2),(5,2); differences 0,0,1,1,3. Faithful n=4 partitions: (4),(2,2),(2,1,1). | Empty partition convention correct. | Keep |
| R01 summary scope | Family index versus target inventory | One ring construction claimed here; zero ring constructions owned here; actual owner TopologicalKTheory T6. Highest-weight input is pinned modules, not roadmap contract. | Descriptions disagree. | R01 |
| R02 generated summary | Generated block versus head | One excluded ring construction and one wrong supplier remain; two present headlines at Lean:53,86 are energy and unitary equivalence. | Block disagrees. | R02 |

## Not verifiable

- Conway1990, *A Course in Functional Analysis*, VII.9, Exercises 8–11, cited in §§4.1 and 5.1: settled as uncertified in the manifest; no legal full text was read and none was requested. The exercise numbering remains uncertified; the statements were checked independently in the previous report's table (rows for §§4.1 and 5.1).

## Source issues

- **Misprint** in Knapp2021 at Corollary 4.10(a), printed p.241: the source says the second representation's two vectors lie in V; it should be V′, the second representation's space; affects a stated result; corrected in print at Corrections, p.814.
- **Gap** in Knapp2021 at Proposition 4.67 proof, printed p.267: the source says the covering-index equality follows from the torus and period propositions; it should be justified additionally by extending every character of the finite kernel to the covering torus; affects the proof; corrected in print at Corrections, pp.814–815.
