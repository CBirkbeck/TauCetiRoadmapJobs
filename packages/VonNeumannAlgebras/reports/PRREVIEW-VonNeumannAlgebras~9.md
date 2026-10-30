# Review of VonNeumannAlgebras (pull request #889 at df71dfe)

**Verdict:** needs changes

## R01 (P1) — The spectral supplier cycle remains

**Location:** `TauCetiRoadmap/VonNeumannAlgebras/README.md:41`: “The supply runs in one direction at the level of targets”; also lines 210–224 and the amended Layer 2 dependency list at line 852.

**Claim:** Ordering targets within folders does not produce the required single direction between roadmaps. V4.0.Fields supplies SelfAdjointSpectralTheory, whose SA-B85–B86 this folder consumes. Removing Fields from the Layer 2 summary does not remove either edge.

**Witness:** Main `TauCetiRoadmap/OperatorTheory/SelfAdjointSpectralTheory/README.md:690` consumes V4.0.Fields; this README:222 consumes SA-B85. The two edges are VNA → OperatorTheory → VNA.

**Repair:** Separate the independent field foundations from the later spectral/classification consumers, with the latter in Part II, or move Fields to an independent earlier owner. Import existing spectral theory by section. The resulting order must be foundations → OperatorTheory → extension, without an edge back to foundations. The one-point measure-change test still gives 2·|f/√2|²=|f|² after moving ownership. This is previous R01, still present; the mechanical checker misses it.

## R02 (P1) — Three constructions still duplicate BanachAlgebras on main

**Location:** `TauCetiRoadmap/VonNeumannAlgebras/README.md:66`: “The L² left-regular representation of a locally compact group is owned here”; V8.RegularL2 at line 1856, V11.UnitizationCharacters at line 3062, and V11.FourierUniqueness at line 3080.

**Claim:** These are already planned general constructions, not new von Neumann adapters. Main BanachAlgebras explicitly owns the same objects, including nondegeneracy and faithfulness of the integrated regular representation.

**Witness:** Main `TauCetiRoadmap/BanachAlgebras/README.md:935` states A7.RegularL2; line 433 starts the unitization comparison; lines 997–1022 supply Fourier uniqueness for finite measures and L¹.

**Repair:** Delete the duplicated general constructions and consume BanachAlgebras A3 and A7 by name. Keep the von Neumann-specific applications. Separate the independent double-dual embedding from the later Fourier consumers so importing A7 does not create another cycle. Controls: on ℤ both regular actions give λ₁δ₀=δ₁; for A=0 both unitized spectra are a singleton; on the trivial group both Fourier uniqueness statements say a=b iff their constant transforms agree. Changing a proof route does not change those objects. This is previous R02, still present.

## R03 (P2) — The spatial-tensor ownership assertion disagrees with the supplied CStarAlgebras head

**Location:** `TauCetiRoadmap/VonNeumannAlgebras/README.md:4085`: “its C5 consumes V13b.SpatialNorm's spatial norm, its representation independence, slice maps and inclusion functoriality”; the changed slice-map target is at lines 3637–3643.

**Claim:** The current supplied CStarAlgebras file says the opposite and constructs those shared objects itself. The earlier report's statement that C5 already imports them from this roadmap is not supported by that file. Thus the corrected slice maps still have two declared owners.

**Witness:** Supplied `TauCetiRoadmap/CStarAlgebras/README.md:47` says V13b consumes C5; lines 548–556 construct the minimal completion and inclusion functoriality, and line 565 constructs slice maps.

**Repair:** Make the ownership move agree in both roadmaps: keep the shared spatial norm and slice foundations in this earlier owner, and have CStarAlgebras C5 import V13b.SpatialNorm, retaining its maximal-tensor and C*-specific extensions. Remove C5's reverse-supply sentence and duplicated constructions in its own package. Do not introduce a VNA dependency on later CStarAlgebras. For A=B=ℂ and ψ=id, both purported constructions give Rψ(z)=z with norm 1; after the repair that is one supplied construction. This is a dependency check of the changed slice passage, not a proposed edit to the sibling checkout.

## R04 (P3) — The companion files still violate the Lean form and padding rules

**Location:** `TauCetiRoadmap/VonNeumannAlgebras/FiniteComplexModularTargets.lean:1` and `TauCetiRoadmap/VonNeumannAlgebras/ProjectionClosureTargets.lean:1`; the latter's lines 34 and 41 declare the duplicate closure theorem and finite-dimensional boundary.

**Claim:** Both files retain Mathlib submodule imports and the old suggested-forms docstrings. The projection file repeats a Suggested headline and adds a boundary theorem; the diagonal modular file represents a convention model rather than the general modular headline. Both files are byte-unchanged since the previous review.

**Witness:** ProjectionClosureTargets:34 has exactly Suggested:102's conclusion and hypothesis, so the previous single-`exact` proof still applies. At H=ℂ its boundary theorem only says the projection set {0,1} is closed.

**Repair:** Delete the two companion files. Keep the general WOT headline in Suggested and the finite-block, boundary and diagonal examples in the README. Delete padding from the acceptance-test material; do not prove it in place. The H=ℂ control remains {0,1}, excluding the positive contraction 1/2. This is previous R07, unrepaired despite the passing scanner.

## Previous findings

- R01 — not repaired: README:41–44 still interleaves Fields and SA-B85–B86 across two roadmap folders; the amended dependency list at :852 continues to consume SA-B85–B86. See R01.
- R02 — not repaired: README:66–69 still assigns the regular representation and unitization/Fourier foundations here; targets :1856, :3062 and :3080 duplicate main BanachAlgebras. See R02.
- R03 — repaired: README:2122–2124 now states c>0, d′=d/c and covol′=c·covol, with n=2, c=2 giving 1/(8π), 2π/3 and product 1/12.
- R04 — repaired: README:1303 requires a nonzero finite-dimensional source; :1359–1362 includes the zero-source obstruction and the ℂ⊕M₂ corner construction.
- R05 — repaired: README:3638–3643 gives the unconditional slice-norm inequality, equality only for a nonzero surviving factor, and norm zero otherwise; :3657–3659 tests both orientations.
- R06 — repaired: Suggested:206 states general nonunital Tomiyama with explicit range, fixing and norm-one hypotheses, positivity, bimodularity and native complete positivity. All required binders survive elaboration.
- R07 — not repaired: Both companion files retain their submodule imports, suggested-forms docstrings, duplicate/boundary declarations and diagonal convention model. See R04.
- R08 — repaired: README:1895 requires 0<ε≤1/2; :1898–1900 computes 1/12 at ε=1/4 and the excluded ε=1 value 5/12.
- R09 — repaired: README:308–311 and :362–364 locate Peterson's state/GNS/separable representation results; :1981–1987 locates the Jones examples and explicitly distinguishes their generalization using pinned L¹ continuity and Haar uniqueness.

No last-repair report marking a finding “not actionable in this package” was supplied or found among this package's reports. The previous review was evidence, not an instruction.

## Verified sound

:robot: AI review by Codex. This is an **incremental re-review of 103 changed lines since dbf8680**, not a new full review. All changed passages, the one new Lean theorem, their direct dependencies and consumers, and all nine previous findings were checked. The two unchanged companion files were reread for R04. The normative root README and CONTRIBUTING were read; the requested parent paths do not exist in this worktree. Main BanachSpaceTheory and AmenableGroups were consulted for shape. No pull-request file was edited.

**Gate and elaboration.** The worker's head-specific gate reports every check passing, including build. The independently rerun gate passes every scanner and dependency check. A separate targeted `lake build TauCetiRoadmap.VonNeumannAlgebras.Suggested` succeeds (8,976 jobs). Direct `lake env lean` on Suggested succeeds with exactly 11 intentional sorry warnings and no other diagnostics. A fresh scratch copy with `#check @name` for all **19 declarations** also elaborates; eight definitions and eleven theorems retain their intended parameters. The supplied signature report and the fresh output agree. No required section hypothesis disappeared; no signature correction was necessary.

The independent dependency command gives:

```text
depcheck: 207 roadmaps, 1463 edges, 0 problem(s)
```

There is no UPWARD, CYCLE or moved line. R01 is an explicit cycle that this output fails to detect. The supplier contracts and Needs lines were scanned; changed references were resolved against main at 4dffb5d and the supplied heads. No declared gap exists. The outside-folder diff is empty. Citation resolution reports no missing cross-roadmap citations or Lean names, but also says it did not inspect pinned library names; the pin checks below were done directly. Gate success likewise does not override the companion-file defects.

**Headline and padding check.** The README endpoints remain bicommutant/Kaplansky/projection closure; projection comparison, trace and simplicity; preduals and normality; type decomposition and standard form; coupling dimension/index; group actions/crossed products and discrete-series covolume; Tomita–Takesaki/KMS; weights, cocycles, cores and duality; Jordan/Dye reconstruction; Arveson/Tomiyama; injectivity, semidiscreteness, hyperfiniteness and injective-factor classification. Suggested's ten former headlines and its missing-carrier explanations are unchanged. Tomiyama is now the eleventh headline, using native carriers with no extra definition or stand-in. Separate one-tactic trials with `simp`, `rfl` and `infer_instance` all fail on it; object searches at both pins found no exact norm-one-projection theorem to apply. The previous report's trials of the unchanged theorems are carried forward, including its successful duplicate-closure `exact` probe. Tactic failure is not a proof of mathematical depth.

**Pins and ownership.** Mathlib is 6b7abb3c7686292736be2955bd3eb9ebf63b456a; Tau Ceti is a91d3aafa8cd3e6bc33dfde0d7677ed0f1625039. Directly reopened:

- `Mathlib/Analysis/CStarAlgebra/CompletelyPositiveMap.lean:50`: a complex linear map with positivity of every finite CStarMatrix amplification. It does not assume normality, unitality or a projection. Line 65's morphism class alone supplies no linearity, whereas the bundled structure used here does.
- `Mathlib/MeasureTheory/Function/LpSpace/DomAct/Continuous.lean:53`: `Lp.instContinuousSMulDomMulAct`, with its locally finite/inner-regular measure and 1≤p<∞ hypotheses. The new citation uses p=1 and retains the action-convention adapter.
- `Mathlib/MeasureTheory/Measure/Haar/Unique.lean:889`: `isMulLeftInvariant_eq_smul_of_innerRegular`. The restricted measure must be invariant, finite on compacts and inner regular, not itself a Haar measure; the target explicitly undertakes these adapters and includes zero restriction.
- `Mathlib/Analysis/CStarAlgebra/GelfandNaimarkSegal.lean:196` and :246: `PositiveLinearMap.gnsNonUnitalStarAlgHom` and `gnsStarAlgHom`. These provide the native representations used in the repaired locator passage; separability, faithful-state selection and nondegeneracy remain explicit targets.

The ownership search used `roadmaps list`, `roadmaps grep`, and `roadmaps show`, plus the supplied checkouts and a board-package object search. CStarAlgebras:41–49 explicitly assigns Tomiyama to V13a, so this is the appropriate owner of the new theorem. Its C5 conflict is R03. Main BanachAlgebras A3/A7 was reopened at :433–449, :935–948 and :997–1022. Main OperatorTheory/SelfAdjointSpectralTheory SA-B05 (:293), B49 (:436), B52–B53 (:447–452), B85 (:676–710) and B86 (:753–761) resolve the changed Layer 2 dependency summary; their scopes match that summary, apart from the surviving roadmap cycle. BanachSpaceTheory B1:43–70 supplies the quoted weak-dual and evaluation criteria, not a second spatial C*-tensor construction. No additional owner of Tomiyama was found in the pinned libraries or the searched packages. Ownership against open pull requests whose files were not supplied was not checked; index hits for those heads were not treated as declaration evidence.

**Sources and sampled passages.** Five works used in the changes were fetched through the legal sources service. No source text was put in the repository or copied into this report. No README locator is marked unverified. The seeded §13.1 changes were checked against Hiai and Tomiyama; §13.2 changes are the slice-norm correction and its zero-factor tests. The unchanged portions of both samples retain the previous review's source audit and its limitations; they were not represented as newly verified.

| Changed passage / locator | Text read and scope comparison | Result |
| --- | --- | --- |
| V0 states and GNS, Peterson 4.1.4–4.1.7, pp. 56–58 | peterson line 2185; line 2193; line 2218; line 2248. The GNS theorem is unital; the corollary's proof explicitly gives a separable faithful representation for separable A. | The README names the nonunital essential-subspace/approximate-unit reduction and countable amplification separately. It does not attribute the literal ℓ² refinement to the source. The source's nonunital spectral-attainment overstatement is recorded below, not imported as a target. |
| V5 nonzero finite-dimensional embedding | anantharaman-popa line 1853, Corollary 2.4.11, printed p. 39; line 2780, Proposition 4.1.6, p. 61; line 1881, construction within Proposition 2.4.13, p. 39. | Equal trace gives equivalent projections; every trace in [0,1] occurs. The product uᵢ* uⱼ construction needs orthogonality and equivalence, not minimality. This justifies extracting that part of the type-I proof for diffuse corners. |
| V8 dense translations | jones line 2303, §11.2 p. 73; line 2327, Example 11.2.21, pp. 73–74. | The compact model and ℚ acting on ℝ are present. The source suggests the locally compact extension; the README honestly supplies its own general L¹/Haar proof route with pinned inputs. |
| V8 finite-base Bernoulli basis | jones line 2307, Example 11.2.17, p. 73. | The source uses finite subsets for a two-point base and allows changing its weights. The labelled finite-support extension in the README is the appropriate finite-base argument. |
| §13.1 nonunital Tomiyama | hiai line 2666, Theorem 6.5, pp. 55–56, arXiv:2004.02383v1; its conclusion points to Theorem 6.4(ii),(v). | The statement covers a C*-algebra and C*-subalgebra and yields bimodularity and CP. Hiai presents only a simpler von Neumann proof case; this is statement verification, not certification of a complete nonunital proof there. |
| §13.1 historical/unital comparisons | tomiyama1957 line 19, Theorem 1, pp. 608–609; peterson line 3948, Theorem 6.2.1, p. 98, and CP argument at line 3962. | Original Tomiyama assumes ambient unit; Peterson assumes a unital inclusion. The repaired README now labels those restrictions. Normality is not asserted. |
| §13.2 slice norms | The unchanged Takesaki I IV.4.9 representation-independence locator remains uncertified as in review 8. | Once representation independence is available, compression by the GNS vector gives ≤‖ψ‖; testing a⊗b with ‖a‖=1 gives the reverse bound for A≠0. Zero factors and symmetric slices are computed below. |

**Computed adversarial pass.** The following fresh rows cover every changed mathematical assertion, its defining hypotheses and dependent controls. These finite tests are witnesses, not proofs of the unrestricted theorems. The subsequent table carries forward the previous review's rows for untouched statements, with explicit provenance on each row.

| Statement | Instances | Values on each side / negative control | Result and change |
| --- | --- | --- | --- |
| V0 state separation and GNS locator | ℂ² with coordinate states; M₂ with τ=Tr/2 | δ₁(1,0)=1, δ₂(1,0)=0; τ(e₁₁)=1/2; GNS dimension 4, cyclic span M₂·I=M₂ | Locator supports separation; unital GNS case explicit |
| V0 nonunital essential-subspace reduction | c₀ acting diagonally on ℓ²⊕ℂ, by zero on last summand | closure(c₀H)=ℓ²⊕0; finite-support approximate units converge to I there and to 0 on the discarded summand | Nondegenerate after restriction, not before |
| V0.SeparableFaithful ℓ² refinement | A=ℂ; A=0; c₀ with weights 2^(-n-1) | Σ weights=1; ψ(eₙ)=2^(-n-1)>0; scalar action on ℓ² has full orbit span; zero action has span 0≠ℓ² | Nontrivial hypothesis retained; countable amplification handles finite nonzero GNS |
| V2 amended spectral dependencies | a=diag(0,1), f=1_{1}, ξ=e₂ | f(a)=e₂₂, ‖f(a)ξ‖²=1=∫\|f\|²dδ₁; Φ(f)=e₂₂ with norm 1 | B05/B49/B52/B85–B86 dependencies match; ownership cycle R01 remains |
| V2 abelian representation multiplicity | ℂ² on ℂ² versus on ℂ³, first coordinate doubled | same null sets; multiplicities (1,1) versus (2,1), representation dimensions 2≠3 | Both constructions still need multiplicity, not just measure class |
| V5 finite-dimensional unital embedding | 0, ℂ, ℂ⊕M₂ into R | zero source gives f(1)=0≠1_R; scalar source gives 1_R; block support traces 1/2+1/2=1, matrix atoms 1/4+1/4=1/2 | Repaired nonzero hypothesis and negative control |
| V5 borrowed matrix-unit construction | q₁,q₂ orthogonal of trace 1/4, uᵢ*uᵢ=qᵢ and uᵢuᵢ*=q₁ | eᵢⱼ=uᵢ*uⱼ gives e₁₂e₂₁=q₁, e₂₁e₁₂=q₂, e₁₁e₂₂=0 | Construction uses equivalence, not minimality |
| V8 small-radius convolution | ε=1/4 and 1/2 | four ramp integrals ε/12 sum to ε/3; values 1/12 and 1/6 respectively | Correct including endpoint ε=1/2 |
| V8 excluded convolution radius | ε=1 | central error²=1/4; two tails 1/12 each; total 5/12≠1/3 | Added negative control correct |
| Dense translations: hypotheses and Haar restriction | ℚ⊂ℝ; ℤ⊂ℝ; trivial group | ℚ-invariant events have indicator c∈{0,1}; restriction is 0μ or 1μ; ℤ-invariant periodic half-interval event has mass 1/2 per unit interval and is neither null nor conull; trivial group has only ∅ and G | Density essential; infinite total mass allowed |
| L¹/L∞ pairing convention | ℝ, g=1, φ=1_[0,1], f=1_[−1,0] | ∫φ(x)f(x−1)dx=1; ∫φ(1+y)f(y)dy=1; using f(x+1) gives 0 | Correct inverse in α_g and direction of variable substitution |
| Bernoulli labelled support and ergodicity | fair two-point base on ℤ; weights (3/4,1/4) | k prescribed fair coordinates have mass 2^(-k); N disjoint equal-label pairs have mass (1/2)^N or (5/8)^N→0; a nonzero constant orbit coefficient c has sum Σ\|c\|²=∞ | Finite-label generalization works; one-point base would give equality probability 1 |
| V9 Haar scaling and coupling | weight n=2, c=2; n=4, c=3 | n=2: (1/(8π))(2π/3)=1/12; n=4: ((3/(4π))/3)(3π/3)=1/4=(n−1)/12 | Both separate factors and product now correct |
| Native CP carrier used by tomiyama | identity on M₂; transpose on M₂; matrix level 0 | id amplification preserves each positive matrix; transpose sends rank-one Choi matrix to flip with eigenvalues 1,1,1,−1; level 0 has only zero | Native carrier excludes positive-but-not-CP transpose without a stand-in |
| Tomiyama projection hypotheses and closed range | diagonal expectation E on M₂; transpose T; zero map | E²=E, ker(I−E)=diagonal matrices, ‖E‖=1; T(e₁₂)=e₂₁≠e₁₂ despite range M₂; ‖0‖=0 | Range/fixing hypotheses determine projection; zero excluded |
| Tomiyama bimodularity Check | a=diag(2,3), b=diag(5,7), x=[[1,2],[3,4]] | axb=[[10,28],[45,84]]; E(axb)=diag(10,84)=aE(x)b | Correct computed convention witness |
| Tomiyama positivity and all matrix levels | E diagonal expectation, x=[[1,1],[1,1]] | x eigenvalues 0,2; E(x)=I with eigenvalues 1,1; E^(k)(X)=Σⱼ (I_k⊗eⱼⱼ)X(I_k⊗eⱼⱼ)≥0 | Positive compression formula proves the Check at every level |
| Tomiyama nonunital subalgebra | P(x)=e₁₁xe₁₁ on M₂; a=2e₁₁,b=5e₁₁, above x | P(1)=e₁₁≠I, P²=P, ‖P‖=1; P(axb)=10e₁₁=aP(x)b | Correctly includes corners without ambient unit preservation |
| Tomiyama nonunital algebra and zero boundary | id on c₀; zero algebra | id(eₙ)=eₙ, ‖id‖=1; every amplified identity fixes X≥0; on 0 the only map has norm 0 | General signature includes c₀ and excludes impossible norm-one zero case |
| Right slice, positive functional | (A,B,ψ)=(0,ℂ,id),(ℂ,ℂ,id),(ℂ,ℂ,2id) | map norms 0,1,2; functional norms 1,1,2; inequalities 0≤1,1≤1,2≤2 | Equality qualified by A≠0 |
| Left slice, positive functional | (A,B,φ)=(ℂ,0,id),(ℂ,ℂ,id); φ=0 | map norms 0,1,0 versus functional norms 1,1,0 | Equality qualified by B≠0; zero functional valid |
| Slice GNS vector functional and general extension | ψ=2idℂ; ψ=i·idℂ | ψ(b)=⟨√2,b√2⟩=2b, vector norm²=2; i·id is a linear combination of positive maps and its slice sends a⊗b to iab with norm 1 | “Vector functional” correctly replaces “vector state”; arbitrary extension is bounded |
| Shared spatial tensor ownership | ℂ⊗minℂ, ψ=id | both C5 and V13b prescribe z⊗w↦zw and Rψ(z⊗w)=zw; both map norms 1 | Same construction, not two variants; R03 |

**Unchanged statements: 129 carried rows.** These preserve the previously computed values and conclusions; only finding cross-references are updated. Together with the 23 fresh rows above, the table contains 152 mathematical rows.

[prior]: packages/VonNeumannAlgebras/reports/PRREVIEW-VonNeumannAlgebras~8.md

| Statement | Instances | Values on each side / negative control | Result and change |
| --- | --- | --- | --- |
| V0 norm-one state definition | ℂ, M₂, zero algebra | idℂ(1)=‖idℂ‖=1; Tr(I₂)=‖Tr‖=2; on 0 every functional has norm 0 | Retain; zero has no state  Carried from [review 8][prior]. |
| V0 state positivity and convex structure | ℂ²; x=[[1,−1],[−1,1]] | weights (t,1−t) have mass 1 for 0≤t≤1; x≥0 but x₁₂=−1 | Retain; boundedness alone is insufficient  Carried from [review 8][prior]. |
| V0 compactness restriction | c₀ point evaluations δₙ | ‖δₙ‖=1, δₙ(x)→0 for each x, ‖0‖=0 | Retain nonunital negative control  Carried from [review 8][prior]. |
| V0 finite amplification cyclicity | B(ℂ²) on ℂ²⊕ℂ² | vector (e₁,e₂) has arbitrary image (Te₁,Te₂); (e₁,e₁) always has equal image coordinates | Retain independent-coordinate criterion  Carried from [review 8][prior]. |
| V1 WOT versus SOT | unilateral shift S on ℓ² | ⟨eᵢ,Sⁿeⱼ⟩→0 but ‖Sⁿe₀‖=1; Cesàro averages have squared norm 1/N | Retain convexity in closure comparison  Carried from [review 8][prior]. |
| V1 continuous duals | φ(T)=Σₙ≥1 n⁻²⟨eₙ,Teₙ⟩ | φ(I)=π²/6; φ(eₙₙ)=1/n² at infinitely many n, unlike finite-rank coefficient functionals | Retain distinction between ordinary and ultra topologies  Carried from [review 8][prior]. |
| V1 bicommutant headline | scalar algebra on ℂ²; M₂; H=0 | (ℂI)′=M₂, (ℂI)″=ℂI; M₂″=M₂; zero case both sides singleton and closed | Retain both directions  Carried from [review 8][prior]. |
| V1 generated star algebra | generator e₁₂ in M₂ | adjoint gives e₂₁; products give e₁₁,e₂₂; generated algebra=M₂ | Retain star closure  Carried from [review 8][prior]. |
| V1 Kaplansky headline | finite-rank operators plus scalars on ℓ² | PₙTPₙ→T strongly, ‖PₙTPₙ‖≤‖T‖; scalar unit balls are already closed | Retain ball bound and strong topology  Carried from [review 8][prior]. |
| V1 projection closure / finite coefficient matching | compression C=1/2 to one coordinate | P=[[1/2,1/2],[1/2,1/2]] has P²=P and compression 1/2; (1/2)²=1/4≠1/2 | Retain infinite-dimensional extension requirement  Carried from [review 8][prior]. |
| Companion finite-dimensional projection closure | H=ℂ; H=0 | projection sets {0,1} and {0}; 1/2 is a positive contraction outside first set | True boundary case, delete from acceptance file (review 8 R07; this report R04)  Carried from [review 8][prior]. |
| V2 corner and support | p=e₁₁, x=diag(0,2) | pM₂p=ℂp with identity p; support(x)=e₂₂; support(0)=0 | Retain corner unit and zero conventions  Carried from [review 8][prior]. |
| V2 polar membership adapter | x=2e₂₁ | x*x=4e₁₁, modulus=2e₁₁, v=e₂₁, v·modulus=2e₂₁ | Retain algebra-membership adapter; import generic polar theorem  Carried from [review 8][prior]. |
| V2 Borel membership adapter | x=diag(0,2), indicator of {2} | f(x)=e₂₂ in W*(x); constant 1 gives I | Retain membership, import functional calculus  Carried from [review 8][prior]. |
| V2 projection joins | p=e₁₁, q=(1/2)[[1,1],[1,1]] | p∧q=0, p∨q=I; pq≠qp | Retain noncommuting lattice test  Carried from [review 8][prior]. |
| V2 completed Hilbert tensor | ℂ²⊗ℂ³; zero factor | dimension 6, ‖e₁⊗e₂‖=1·1=1; 0⊗K=0 | Retain genuine completion target  Carried from [review 8][prior]. |
| V2.RectangularL2 product and cross norm | counting two points × Lebesgue [0,1]; empty rectangle | rectangle mass 2·1=2 and indicator norm²=2; empty mass 0 even against infinite measure | Retain extended product convention  Carried from [review 8][prior]. |
| V2 rectangular non-σ-finite case | infinite counting space, finite singleton rectangle | κ({s}×[0,1])=1; elementary indicator norm²=1 | Retain named native product construction; no unlicensed Fubini inference  Carried from [review 8][prior]. |
| V2 reference-vector infinite tensor | ξₙ=e₁; ηₙ=−e₁ | raw finite-prefix overlaps (−1)ᴺ do not converge; phase-corrected overlaps all 1 | Retain phase-sensitive distinction  Carried from [review 8][prior]. |
| V2 abelian single generator | ℂ², a=diag(0,1) | spectral projections 1−a=e₁₁, a=e₂₂, generated algebra ℂ² | Retain self-adjoint generator example  Carried from [review 8][prior]. |
| V2 given-measure MASA | two atoms of positive mass | multiplication operators are diagonal; commutant also diagonal; off-diagonal e₁₂ fails to commute with e₁₁ | Retain  Carried from [review 8][prior]. |
| V2.AbelianLocalizable | ℓ∞(I), I uncountable | orthogonal nonzero atoms indexed by I; a finite positive sum has only countably many positive masses | Retain no universal faithful-normal-state assertion  Carried from [review 8][prior]. |
| V2.NonmodularProjectionLattice | D(x)ₙ=xₙ/(n+1), yₙ=1/(n+1) | D⁻¹y=(1,1,…)∉ℓ²; B∧C=0, A∨B=H; A∨(B∧C)=A≠C=(A∨B)∧C | Retain explicit failure of modularity  Carried from [review 8][prior]. |
| V3 matrix units and minimality | M₂; M₂⊕ℂ | e₁₂e₂₁=e₁₁; e₁₁ corner is ℂ; centers have dimensions 1 and 2 | Retain type-I blocks rather than factorizing a direct sum  Carried from [review 8][prior]. |
| V3 inclusion multiplicities | multiplicity matrix [[2,1],[1,1]] on dimensions (1,2) | target dimensions (4,3); dimension sums are 2·1+1·2=4 and 1·1+1·2=3 | Retain orientation of multiplicities  Carried from [review 8][prior]. |
| V3 algebraic subgroup basis | H=C₂ in S₃ | three cosets, group-algebra left rank 3; complex dimensions 2·3=6 | Retain finite-index algebraic statement  Carried from [review 8][prior]. |
| V4.Core trace duality | trace-class h=diag(n⁻²) | Tr(h)=‖h‖₁=π²/6 and φ_h(I)=π²/6; rank-one e₁₁ gives 1 | Retain canonical trace/duality extension of supplied ideals  Carried from [review 8][prior]. |
| V4.PositivePredual base norm | functional with density diag(1,−1) | positive/negative masses 1 and 1; norm=2, while value at I=0 | Retain base norm rather than absolute value at identity  Carried from [review 8][prior]. |
| V4.Normality | increasing rank-n projections in B(ℓ²) | Pₙ↑I, vector-state values eventually 1 for each basis vector; singular state killing compacts gives 0 on each Pₙ but 1 on I | Retain nets/normality distinction  Carried from [review 8][prior]. |
| IsCyclic definition | M₂ on ℂ², ξ=e₁ and ξ=0 | M₂e₁=ℂ²; M₂0={0} | Retain nonzero and zero-vector controls  Carried from [review 8][prior]. |
| IsSeparating definition | ℂI on ℂ², ξ=e₁; M₂, ξ=e₁ | cIe₁=0 forces c=0; e₂₂e₁=0 although e₂₂≠0 | Retain  Carried from [review 8][prior]. |
| Cyclic/separating commutant headline | M₂ and ℂI on ℂ²; H=0 | M₂e₁ cyclic=true and e₁ separating for ℂI=true; for ℂI cyclic=false and separating for M₂=false; zero case both true | Retain both implications and degenerate case  Carried from [review 8][prior]. |
| V4 faithful state versus extension | vector e₁ for ℂI⊂M₂ | φ(cI)=c is faithful on ℂI; extension has φ(e₂₂)=0 with e₂₂≠0 | Retain representation/support qualifications  Carried from [review 8][prior]. |
| V4.0.Fields measure-change unitary | one point, μ mass 1 and ν mass 2 | U(f)=f/√2, ‖Uf‖²_ν=2·\|f/√2\|²=\|f\|²=‖f‖²_μ | Retain square-root direction; ownership cycle R01  Carried from [review 8][prior]. |
| V4.0.Decomposition | M₂⊕ℂ | two central support projections (I₂,0),(0,1); fibres M₂ and ℂ | Retain measurable-fibre target; not a second owner of SA-B85  Carried from [review 8][prior]. |
| ProjectionEquivalent definition | p=e₁₁,q=e₂₂,v=e₂₁ | v*v=p, vv*=q; v*=e₁₂ reverses orientation | Retain initial-to-final convention  Carried from [review 8][prior]. |
| ProjectionSubequivalent definition | p=e₁₁,q=I₂ | v=e₁₁ gives v*v=p and vv*≤q; reverse impossible since ranks 2≤1 fails | Retain order direction  Carried from [review 8][prior]. |
| Projection Schröder–Bernstein headline | p=e₁₁,q=e₂₂ | both subequivalences true, equivalence true, p=q false | Retain equivalence, not equality  Carried from [review 8][prior]. |
| IsFactor definition | M₂, ℂ², zero algebra | centers ℂI, ℂ², {0}; factor predicate true,false,false because zero identity excluded | Retain explicit nonzero field  Carried from [review 8][prior]. |
| IsFinite definition | M₂; unilateral shift S in B(ℓ²) | finite matrices v*v=I imply vv*=I; S*S=I, SS*=I−e₀₀ | Retain finite/infinite distinction  Carried from [review 8][prior]. |
| IsTypeIIOne definition | R, M₂, zero | every nonzero R projection splits; e₁₁ in M₂ has no nonzero proper subprojection; zero fails factor condition | Retain exclusion of type I and zero  Carried from [review 8][prior]. |
| IsTracialState definition | tr/2 and x↦x₁₁ on M₂ | tr/2(e₁₂e₂₁)=tr/2(e₂₁e₁₂)=1/2; vector state gives 1 and 0 | Retain trace axiom independently of positivity  Carried from [review 8][prior]. |
| V5 Dixmier averaging | x=e₁₁ in M₂ | (x+uxu*)/2=I₂/2 for coordinate swap u; tr/2(x)=1/2 | Retain normalization  Carried from [review 8][prior]. |
| Trace uniqueness headline | M₂ versus ℂ² | matrix trace weights forced (1/2,1/2); on ℂ² weights (t,1−t) vary | Retain factor hypothesis  Carried from [review 8][prior]. |
| Faithful trace existence headline | R, dyadic projection p | τ(1)=1, τ(p)=1/2, τ(p*p)=1/2>0; zero functional has τ(1)=0 | Retain positive faithful normalization  Carried from [review 8][prior]. |
| Algebraic simplicity headline | R, nonzero dyadic p with trace 1/4 | four equivalent orthogonal translates of p sum to 1; any ideal containing p contains 1 | Retain algebraic rather than closed-ideal endpoint  Carried from [review 8][prior]. |
| V5.LatticeFinite | M₂; B(ℓ²) graph construction | finite-dimensional modular dimension identity holds; graph row gives A≠C | Retain full finite/infinite criterion  Carried from [review 8][prior]. |
| V6 semifinite trace | B(ℓ²); rank-n p | Tr(p)=n, Tr(I)=∞; τ on R has τ(I)=1 | Retain finite versus semifinite normalization  Carried from [review 8][prior]. |
| V6 product trace and II∞ comparison | R⊗B(ℓ²), p trace 1/2 in R | (τ⊗Tr)(p⊗e₁₁)=1/2; (τ⊗Tr)(I)=∞ | Retain extended values  Carried from [review 8][prior]. |
| V6 tracial standard form | L²(M₂,tr/2), Jx=x* | J²x=x and JL_aJ=R_a*; J fixes positive matrices | Retain conjugate-linear direction  Carried from [review 8][prior]. |
| V6.FullCornerType | M₂,e₁₁; type-III nonzero full p | e₁₁M₂e₁₁=ℂ finite; in type III no nonzero finite subprojection survives in the corner | Retain nonzero full-support condition  Carried from [review 8][prior]. |
| V6.LatticeTypes | M₂; diffuse R; ℂ² | rank-one atoms in M₂; none in R; all projections central in ℂ² | Retain separation of atomicity, centrality and finiteness  Carried from [review 8][prior]. |
| V7.StandardAmplifications | standard M₂ module and column module ℂ² | L²(M₂) has ordinary dimension 4; column module 2, represented by a commutant projection of normalized trace 1/2 | Retain normalized module dimension  Carried from [review 8][prior]. |
| V7.AmplificationTrace | 0, two copies, infinitely many copies of L²(R) | commutant unit traces 0,2,∞ | Retain sum over arbitrary index sets  Carried from [review 8][prior]. |
| V7.Dimension | same column module embedded using e₁₁ or e₂₂ in M₂ commutant | both trace values 1/2; equivalent projections, different operators | Retain embedding independence  Carried from [review 8][prior]. |
| V7.SumsAndCorners | two column M₂ modules; p in R with τ(p)=1/2 | dimensions 1/2+1/2=1; corner trace renormalization divides by 1/2 and thus multiplies by 2 | Retain direction of scaling  Carried from [review 8][prior]. |
| V7.CountableAndTypeI | nonzero separable versus uncountable amplification | countable infinite and uncountable units both have scalar trace ∞, but Hilbert dimensions differ | Retain warning that ∞ alone does not classify nonseparable modules  Carried from [review 8][prior]. |
| V7.Index | N⊂N⊗M₂ with product trace; N=N | indices 4 and 1, since L²(M₂) has dimension 4 | Retain unrestricted inclusion endpoint  Carried from [review 8][prior]. |
| V7.GroupApplications / V8.SubgroupCosets | C₂⊂S₃; {1}⊂ℤ | three cosets give dimension 3; ℤ gives ∞; Σ₂⁻ⁿuₙ has infinitely many coefficients and L² norm² 1/3 | Retain completed rather than algebraically finite expansion at infinite index  Carried from [review 8][prior]. |
| V8 group-algebra factor criterion | C₂, S₃, F₂ | L(C₂)=ℂ²; center L(S₃) has dimension 3; nonidentity F₂ conjugacy classes infinite | Retain ICC qualification and nonabelian controls  Carried from [review 8][prior]. |
| V8 nonsingular action convention | two-point flip | α_g(e₁₁)=e₂₂ and α_g²=id; scalar fixed space is one-dimensional | Retain inverse in pullback action  Carried from [review 8][prior]. |
| V8.RegularL2 bound and faithfulness | G=ℤ, f=δ₋₁+iδ₀+δ₁ | multiplier 2cosθ+i has norm √5; ‖f‖₁=3; λ(δ₁)δ₀=δ₁ | Mathematically consistent, duplicate owner R02  Carried from [review 8][prior]. |
| V8 strong versus norm continuity | translations on L²(ℝ) | for s≠0, operator norm distance from identity=2; orbit norm of 1_[0,1] tends to 0 | Retain strong continuity  Carried from [review 8][prior]. |
| V8 modular character | affine group, right multiplier (2,0) | pullback integral factor c=2; inversion multiplier at (2,0)=2, not 1/2 | Retain inversion/adjoint convention  Carried from [review 8][prior]. |
| V8.LCHRegularNormalBridge covariance | finite group flip acting on ℂ² | λ_gπ(e₁₁)λ_g*=π(e₂₂)=π(α_g(e₁₁)); group element squared gives identity | Retain regular covariance  Carried from [review 8][prior]. |
| V8 regular versus universal property | M=ℂ,G=ℤ | point character on C(𝕋) evaluates 1 at a singleton-supported representative; the same singleton is zero in Haar L∞ | Retain absence of a normal universal quotient  Carried from [review 8][prior]. |
| V8.CompactErgodicActions | conjugation on M₂ by SU(2) | Haar average of e₁₁=I₂/2, invariant state gives 1/2, fixed algebra=ℂI | Retain trace conclusion; primary locator remains uncertified  Carried from [review 8][prior]. |
| V9 Weil/covolume | ℝ/ℤ; ℝ/(2ℤ) | fundamental intervals have masses 1 and 2; at μ′=2μ these become 2 and 4 | Retain positive lattice-spacing convention  Carried from [review 8][prior]. |
| V9 formal degree | compact circle character; ℝ character | normalized circle coefficient norm²=1 so d=1; ℝ coefficient has infinite squared integral so no formal degree | Retain square-integrability hypothesis  Carried from [review 8][prior]. |
| V10.ClosedOperators inverse Cayley | T=0; T=1 on ℂ | U=(T−i)/(T+i)=−1,−i respectively; i(1+U)/(1−U)=0,1 | Retain direction and exclude fixed vectors at U=1  Carried from [review 8][prior]. |
| V10.Affiliation | multiplication by x on L²(ℝ) | spectral projection at [0,1] is multiplication by 1_[0,1]; it commutes with every bounded multiplier | Retain affiliation/PVM relation  Carried from [review 8][prior]. |
| V10.TracialLp | h=diag(4,1) with unnormalized trace | ‖h‖₁=5, ‖h‖₂²=17, ‖h‖∞=4 | Retain distinct norms and density construction  Carried from [review 8][prior]. |
| V10.ModularTheory | h=diag(2/3,1/3), standard matrix model | Δ(e₁₂)=2e₁₂, Δ(e₂₁)=e₂₁/2; σ_t(e₁₂)=2^(it)e₁₂ | Retain modular sign  Carried from [review 8][prior]. |
| V10.FiniteComplexPowers | same h, z=1 and z=i | β₁(e₁₂)=2e₁₂, β₁(e₂₁)=e₂₁/2; β_i factors have modulus 1 | Retain star locus Re z=0 for noncentral h  Carried from [review 8][prior]. |
| Companion diagonalPower / diagonalModularPower | h=(2,1), z=0,1; n=0 | h⁰=I; β₁(e₁₂)=2e₁₂; empty matrices form a singleton | Correct model, delete convention stand-in from acceptance material  Carried from [review 8][prior]. |
| Companion star identity and iff | h=(2,1), z=1; h=(1,1) | β₁(e₁₂)*=2e₂₁=β₋₁(e₂₁); β₁(e₂₁)=e₂₁/2; central h gives β_z=id for every z | Retain README mathematics, review 8 R07; this report R04 file repair  Carried from [review 8][prior]. |
| V10 KMS strip | h above, a=e₁₂,b=e₂₁ | φ(ab)=2/3, φ(ba)=1/3; φ(σ_i(a)b)=2⁻¹·2/3=1/3 | Retain inverse-ratio imaginary shift  Carried from [review 8][prior]. |
| V10 finite S/J commutants | S(x)=x* on matrix algebra | SL_aS(x)=xa*=R_a*(x); S²=id | Retain antilinear action, not linear conjugation  Carried from [review 8][prior]. |
| V10.Hecke conventions | H={1}, noncommuting g,h in S₃ | left convolution δ_g*δ_h=δ_gh; opposite convention gives δ_hg≠δ_gh | Retain left/right distinction and no false commutativity  Carried from [review 8][prior]. |
| V10.AffineHecke modular ratio | slope 2 | modular character=2; inverse ratio=1/2; for R_(2,0)1_H, Δ-eigenvalue=1/2 | Retain ratio and operator convention  Carried from [review 8][prior]. |
| V10.AffineAP prime-ratio target | ratio λ=2 and inverse | forward ratio=2, reversed pair ratio=1/2; block lower bounds c/k have divergent sum for c>0 | Retain reciprocal convention; arithmetic source contracts resolved  Carried from [review 8][prior]. |
| V10.AffineType endpoint | β=1 versus β=0 | prime weights p⁻¹ versus 1; modular ratios at β=1 are rational powers with dense log subgroup; β=0 makes all ratios 1 | Retain positive-temperature endpoint distinction, primary text not certified  Carried from [review 8][prior]. |
| V11 weights and supports | φ(x)=Tr(e₁₁x) on M₂ | φ(e₁₁)=1, φ(e₂₂)=0; support=e₁₁ rather than I | Retain nonfaithful support reduction  Carried from [review 8][prior]. |
| V11 weight scaling/cocycle | ψ=2φ for faithful φ | (Dψ:Dφ)_t=2^(it)I, value at t=0 is I; same modular automorphisms | Retain scalar cocycle rather than identifying weights  Carried from [review 8][prior]. |
| V11 Pedersen–Takesaki density | tracial M₂ and h=diag(2,1) | ψ(e₁₁)=2, ψ(e₂₂)=1; h^(it) conjugation gives ratio 2^(it) | Retain density, not normalized state by default  Carried from [review 8][prior]. |
| V11 standard cone | M₂ Hilbert–Schmidt model | positive x fixed by J; x=e₁₂ is not positive and Jx=e₂₁≠x | Retain cone and antiunitary distinction  Carried from [review 8][prior]. |
| V11 expectation criterion | diagonal subalgebra and h=diag(2/3,1/3) | σ_t preserves each eᵢᵢ; E removes off-diagonal entries; φ(E(x))=φ(x) | Retain state preservation and modular invariance  Carried from [review 8][prior]. |
| V11 Connes S/T | finite factor; III_λ, 0<λ<1 | finite S={1}; III_λ nonzero values λ^ℤ, with 0 also present; period magnitude 2π/abs(log λ) | Retain type distinction, no classification of arbitrary factors by S alone  Carried from [review 8][prior]. |
| V11 continuous core normalization | scalar algebra with trivial modular action | at s=log 2, θ_s(h)=2h; with trace density e^(−r)dr, substitution gives Tr(θ_s(f))=2Tr(f) | Retain paired sign convention  Carried from [review 8][prior]. |
| V11 Takesaki duality | trivial action of C₂ on ℂ | first algebra ℂ²; crossed again by dual flip gives M₂=B(ℓ²(C₂)) | Retain crossed-product direction  Carried from [review 8][prior]. |
| V11.DoubleDualEmbedding | G=ℤ, dual=𝕋 | ev(n)(z)=zⁿ; sup_z abs(zⁿ−1)=2 for n≠0, zero for n=0 | Retain discrete closed embedding; split ownership for later users  Carried from [review 8][prior]. |
| V11.UnitizationCharacters | A=0 and A=ℂ | external unitized spectra have cardinalities 1 and 2; removing augmentation leaves 0 and 1 points | Correct object already owned by A3, R02  Carried from [review 8][prior]. |
| V11.FourierUniqueness | G={1}, finite measures aδ₁,bδ₁ | transforms are constants a,b; equality iff a=b; L¹ zero transform iff scalar 0 | Correct specialization of existing A7 endpoint, R02  Carried from [review 8][prior]. |
| V11 inversion/Plancherel convention | finite C₂, normalized Haar | transform of (1,0) is (1/2,1/2); dual counting inverse gives (1,0), L² norm²=1/2 on both sides | Retain positive transform/conjugate inverse normalization  Carried from [review 8][prior]. |
| V11 ITPFI ratios | product densities diag(2/3,1/3) | single-site eigenvalue ratio 2, inverse 1/2; finite blocks give 2^ℤ; trace density gives only 1 | Retain ratio-set versus tracial boundary  Carried from [review 8][prior]. |
| V11 flow classification | III_λ with λ=1/2 | flow period abs(log λ)=log 2; reciprocal parameter gives same absolute period but lies outside 0<λ<1 | Retain parameter range; book locators uncertified  Carried from [review 8][prior]. |
| V12 two projections | p=e₁₁,q=(1/2)[[1,1],[1,1]] | (p−q)²=I₂/2; diagonal compression pqp=p/2 | Retain b=1/2 convention  Carried from [review 8][prior]. |
| V12 tracial ultrapower ideal | decreasing projections eₙ=1_[0,1/n] in diffuse MASA | ‖eₙ‖₂²=1/n→0, ‖eₙ‖=1; constant 1 has L² norm 1 | Retain Check; “orthogonal projections” means self-adjoint, not pairwise disjoint  Carried from [review 8][prior]. |
| V12 central sequence / Γ | site-n diag(1,−1) in R | τ(uₙ)=0, ‖uₙ‖₂=1; commutator with any earlier finite head is 0 | Retain nontrivial central sequence  Carried from [review 8][prior]. |
| V12 nonfactor warning | R⊕ℂ, weights 1/4 and 3/4 | distance² from (uₙ,0) to center≥1/4; every unitary has abs(trace)≥1/2 | Retain distinction from trace-zero Γ unitary  Carried from [review 8][prior]. |
| V12 free-group estimate | generators a,b and u_a in L(F₂) | ‖u_a u_b−u_b u_a‖₂²=2, while ‖u_a−τ(u_a)‖₂=1 | Retain noncommutative control for central-sequence estimate  Carried from [review 8][prior]. |
| V12.J.Maps | transpose on M₂ | T(x²)=T(x)², but T(e₁₂e₂₁)=e₁₁ whereas T(e₁₂)T(e₂₁)=e₂₂ | Retain Jordan rather than multiplicative conclusion  Carried from [review 8][prior]. |
| V12.J.Frame | constant frame function on ℂ³ | f(v)=1 for unit v, frame sum=3; density T=I₃ has Tr(T)=3 | Retain frame weight normalization  Carried from [review 8][prior]. |
| V12.J.Scalar | μ(p)=Tr(p) on M₃ | orthogonal ranks add: 1+1=2; extension has value 3 on I₃ | Retain bounded finite additivity, not state normalization  Carried from [review 8][prior]. |
| V12.J.Dye/Bloch boundary | odd nonlinear bijection of sphere: stretch z by factor 2 then normalize | e_x and e_z remain perpendicular as vectors, but (e_x+e_z)/√2 maps to (1,0,2)/√5; dot with e_z changes 1/√2→2/√5 | Retain type-I₂ obstruction; antipodes, hence projection orthogonality, preserved  Carried from [review 8][prior]. |
| V12.J.Enriched | transpose with states transported by transpose | Tr(T(ρ)T(p))=Tr(ρp); for ρ=p=e₁₁ both values 1 | Retain state/evaluation compatibility rather than arbitrary logic map  Carried from [review 8][prior]. |
| V12.J.CentralSplitting | identity on ℂ plus transpose on M₂ | scalar block multiplicative; matrix e₁₂,e₂₁ product reversed, e₁₁ versus e₂₂ | Retain central-piece orientation, not one global sign  Carried from [review 8][prior]. |
| V13a operator system / CP | transpose on M₂ | positive Choi rank-one matrix has partial transpose equal to flip; flip eigenvalue on e₁⊗e₂−e₂⊗e₁ is −1 | Retain CP rather than positivity  Carried from [review 8][prior]. |
| V13a Arveson extension | state on diagonal M₂ | density [[1/2,c],[conj c,1/2]] has eigenvalues 1/2±abs(c); c=0 and c=1/4 give distinct positive extensions | Retain existence without uniqueness  Carried from [review 8][prior]. |
| V13a injectivity/projection criterion | B(H); diagonal ℓ∞ in B(ℓ²); zero H | identity and diagonal projection have norm 1 when nonzero; zero-space projection has norm 0 | Retain norm-one qualifier for M≠0  Carried from [review 8][prior]. |
| V13a corners/expected subalgebras | e₁₁M₂e₁₁ | compression sends I to e₁₁, its corner identity; corner algebra ℂe₁₁ is injective | Retain corner unit rather than ambient-unit requirement  Carried from [review 8][prior]. |
| V13b.SpatialNorm sum | u=e₁₂⊗e₁₂+e₂₁⊗e₂₁ | u exchanges 11 and 22, u*u projection rank 2, ‖u‖=1; sum of elementary norms=2 | Retain spatial norm, not projective sum norm  Carried from [review 8][prior]. |
| V13b cross norm | I₂⊗I₂ | operator norm 1=1·1, Hilbert–Schmidt cross norm √2·√2=2 | Retain operator norm  Carried from [review 8][prior]. |
| V13b representation independence | ℂ² on ℂ² and ℂ³, first coordinate doubled | represented tensor projection ranks 2 and 3, both norms 1 | Retain norm independence, not operator equality  Carried from [review 8][prior]. |
| V13b spatial inclusion | diagonal ℂ²⊂M₂, x=e₁₁⊗I₂ | domain and ambient operator norms both 1; zero inclusion gives norm 0 on its only element | Retain isometric inclusion, no quotient-exactness claim  Carried from [review 8][prior]. |
| V13b hyperfinite examples | R finite heads, B(ℓ²) finite corners plus scalar tail, zero | head approximants fix head elements exactly; Pₙξ→ξ; zero sequence generates 0 | Retain sequential scope at separable predual  Carried from [review 8][prior]. |
| V13b semidiscreteness topology | truncation maps on ℓ∞(ℕ), x=1 | each fixed coordinate error eventually 0; operator norm error=1 for all N | Retain point-ultraweak rather than norm convergence  Carried from [review 8][prior]. |
| V13b CP factorization | M₂ | identity factors through M₂ with both maps identity, error 0 and norms 1 | Retain matrix-stage normalization  Carried from [review 8][prior]. |
| V13b Powers–Størmer | a=diag(4,0),b=diag(1,0) | ‖√a−√b‖₂²=1, ‖a−b‖₁=3; a=b gives 0≤0 | Retain inequality, not equality  Carried from [review 8][prior]. |
| V13b min-norm criterion | M₂ in standard form with right opposite action | multiplication sends e₁₁⊗e₁₁^op to a rank-one compression of norm 1; tensor norm also 1 | Retain opposite-algebra orientation  Carried from [review 8][prior]. |
| V13b finite-rank Følner criterion | P=I on L²(M₂,tr/2) | rank P=4, Hilbert–Schmidt norm=2, commutators 0; Tr(L_e₁₁)/4=2/4=1/2=τ(e₁₁) | Retain both commutator and trace conditions  Carried from [review 8][prior]. |
| V13b II₁ hyperfinite uniqueness | dyadic heads M₂⊂M₄⊂R | a matrix element in head k has approximation error 0 at every n≥k; normalized traces agree | Retain separable II₁ qualification from source  Carried from [review 8][prior]. |
| V13b arbitrary-cardinality reduction | B(ℓ²(I)), I uncountable | finite-rank corner p_F has trace abs(F); sup_F p_F=I with trace ∞, no countable exhaustion of all basis vectors | Retain nets rather than an illicit sequence  Carried from [review 8][prior]. |
| V13b δ-related tuples | ξ=η and family {1} | Σa*a=Σaa*=1, tuple error 0; conjugating unitary 1 gives distance 0 | Retain normalization; zero family has sums 0 and is excluded  Carried from [review 8][prior]. |
| V13b equivalence-relation finite control | orbit relation on two equally weighted points | averaging sends (a,b) to ((a+b)/2,(a+b)/2); matrix algebra M₂ is finite-dimensional/hyperfinite | Retain finite instance; CFW proof text not obtained  Carried from [review 8][prior]. |
| V13b periodic automorphism invariant | α=id on R | outer period 1, implementing unitary 1, obstruction 1 | Retain boundary of periodic classification; no claim this tests the general conjugacy proof  Carried from [review 8][prior]. |
| V13b bicentralizer definition | tracial M₂ | all constant sequences centralize τ; commuting with every constant matrix forces B(M₂,τ)=ℂI | Retain ordinary bicentralizer normalization  Carried from [review 8][prior]. |
| V13b Q-stability convention | m orthogonal isometries with φuᵢ=m⁻¹uᵢφ | evaluating at uᵢ* gives φ(uᵢuᵢ*)=1/m; sum of range masses=m·1/m=1 | Retain bimodule-action orientation  Carried from [review 8][prior]. |
| V13b III₁ product approximation | faithful product state, finite tensor head F | φ=φ_F⊗φ_tail gives state error 0; expectation fixes head operators with operator error 0 | Retain product criterion's intended controls; uniqueness uses cited nontrivial sources  Carried from [review 8][prior]. |

## Not verifiable

- The unchanged parts of §13.2 retain review 8's source limitations. In particular Takesaki I IV.4.9, Takesaki III XV.3 and Runde 6.4.14/6.4.24–25 were classified there as paywalled/uncertified. Their full spatial-norm and unrestricted injectivity/semidiscreteness arguments were not reopened or newly certified. The corrected slice estimates were checked from the stated representation-independence input, not from inaccessible book pages.
- The previous report's unread classification and measured-relation inputs remain unread in this incremental review, including its CFW catalogue-page issue and its unsuccessful legal retrievals of Connes–Woods, Araki–Woods and Connes–Takesaki. Unchanged source checks and limitations are carried from `packages/VonNeumannAlgebras/reports/PRREVIEW-VonNeumannAlgebras~8.md`; this review makes no new claim to have read their proofs.
- Hiai's Theorem 6.5 states the required generality, but its displayed proof deliberately treats a simpler von Neumann inclusion. The original Tomiyama source and Peterson comparison cover the explicitly identified unital cases. Reading those proofs is not a verification of every step of the general nonunital theorem's future formal proof.
- No source access is outstanding for the changed passages. The first Tomiyama fetch needed a publisher licence classification; the successful J-STAGE fetch resolved it. No already-uncertified work was requested again and no source manifest was edited.
- Open heads without a supplied checkout, including the older competing VonNeumannAlgebras proposal discussed in prior rounds, were not inspected for current declarations. No duplicate-name finding is inferred from old evidence.

## Source issues

- **Error** in peterson at Corollary 4.1.3, printed p. 56 (peterson line 2182): the source says a positive functional has a unique positive unitization extension; it should be the unique positive extension preserving its norm; affects a stated result.
- **Error** in peterson at Proposition 4.1.4, printed p. 56 (peterson line 2185): the source says every spectral value is attained by a state for arbitrary C*-algebras; it should be qualified by unitality, or formulated on the unitization; affects a stated result.
- **Misprint** in anantharaman-popa at the paragraph preceding Proposition 4.1.6, printed p. 61 (anantharaman-popa line 2778): the source says a tracial state's projection values on Mₙ are 0,1,…,n; it should be 0,1/n,…,1; affects nothing.

Witnesses for these source issues: for A=c₀ and φ=0, both F(c,a)=0 and F(c,a)=c are positive unitization extensions, but only the first preserves norm zero. For xₙ=1/(n+1) in c₀, 0 is spectral whereas every state has φ(x)=Σwₙ/(n+1)>0. For M₂, a tracial state gives τ(I)=1 and τ(e₁₁)=1/2. The roadmap does not adopt those erroneous assertions: it retains norm-one states, needs only nonzero-positive separation, and uses normalized trace throughout. The three Peterson CP-source errors recorded in review 8 belong to unchanged source passages and are not claimed as newly inspected here.
