# GATE-AutomorphicPadicLFunctionsPartII~1: answers to human review

Reviewed head: `1fce826`. Repairs are in commit `93bdf3a` on the pull-request branch (not pushed). One review comment (CBirkbeck, 2026-10-25T20:46:59Z) made four distinct points, H01–H04.

## H01 (CBirkbeck) — applied

Old §2.6 ("Comparison with the de Rham polylogarithm", which named no polylogarithm construction and no de Rham vanishing theorem) has been replaced by three targets owned here. §2.6 (README line 435) is the de Rham cohomology of the completed logarithm coefficient over a characteristic-zero field: the finite-level transition maps are zero below degree 2d, RΓ_dR(A,P̂♮)≃k[−2d] with every lim and lim¹ accounted for, H^i_dR(A,Γ;P̂♮)≃H^(i−2d)(Γ,k) (so it vanishes in degree 2d−1), and the de Rham support/residue-to-trace sequence along a Γ-stable étale torsion subscheme D, with the trace normalized through the Hodge edge map. §2.7 (line 466) defines pol_Γ(h) as the unique class with residue h. §2.8 (line 490) states that the edge map commutes with the localization boundary and sends EK♮_Γ(h) to pol_Γ(h).

The review's diagnosis checks out against the sources. AbelianSchemesAndArithmeticModuliPartII P3.3, at the head of its open pull request, supplies only Log^(1)≃P♮^(1) and hence Log≃P̂♮. Its P2.8 explicitly leaves the connection variant aside. KS-v4 Remark 2.37 (KS-v4 line 1266) says only "it can be shown", and Remark 2.16 (KS-v4 line 800) cites Scheider for the vanishing.

The repair has five further parts:
- §3.6 now cites §§2.7–2.8.
- The scope bullet (line 13) and the AbelianSchemesAndArithmeticModuliPartII contract record where P3.3 and P2.8 stop.
- The ComplexComparisonPartII contract adds C5.2, which supplies the de Rham complex of an integrable connection.
- The `Suggested.lean` docstring lists the new targets as not statable. The pinned Mathlib and Tau Ceti have no algebraic de Rham cohomology with coefficients: a grep for de Rham/connection carriers found only `RingTheory/Perfectoid/BDeRham.lean`.
- HK-2018 and Sch-2014 are added to the References.

## H02 (CBirkbeck) — applied

The supplier contract (line 68) used to say that CM §1.3 "uses the trace-dual ideal with inverse different". It now lists exactly what §1.3 supplies, checked against `cmPeriodPairings` at the CM head `0c6c6e2`: the period pairing ω_A×H₁→ℂ^Σ, the conjugate de Rham pairing, their naturality and the lattice aΛ. It also says that the trace-dual Betti structure and its comparison are §5.1 targets here.

§5.1 (line 758) now states these as targets:
- the A4.3 de Rham duality, normalized by c₁^dR of the Poincaré bundle, restricts to a perfect Betti pairing ⟨·,·⟩_top onto 2πiℤ that is O_L-balanced;
- ξ_a∨:a⁻¹d_L⁻¹≃H₁(A∨(ℂ),ℤ), defined by ⟨ξ_a(x),ξ_a∨(y)⟩_top=2πi·Tr(xy), is an O_L-linear isomorphism, with the trace dual taken from Mathlib `FractionalIdeal.dual_eq_mul_inv` and `coeIdeal_differentIdeal` (`Mathlib/RingTheory/DedekindDomain/Different.lean:356`, `:532`);
- Ω∨=2πi q/barΩ, with the conjugation and inverse different kept.

The old proof route ("use the imported CM period pairing and its trace-dual description") has been replaced by a route through AbelianSchemesAndArithmeticModuli A2.2/A4.3/A5.1/A5.3 and ComplexComparisonPartII C5.1. That supplier now has its own contract section (line 70).

Pattern repairs:
- §4.3 no longer asserts the Ω∨ conversion, which would have been a forward reference to Layer 5.
- §5.8 used an O_K-linear polarization that no supplier provided. It now cites CM §2.1, which owns CM-compatible polarizations with Rosati involution equal to conjugation.

## H03 (CBirkbeck) — applied

§5.9, line 926: "fix τ:E→ℂ" → "let τ:E→ℂ be the restriction of the fixed embedding of algebraic numbers into ℂ, the embedding through which χ, its infinity type β−α, the CM type Σ and the periods Ω₀ are realized". A sentence now states that another embedding replaces χ by a Galois-conjugate character with transported type, CM type and periods. A negative-control Check was added: for χ((λ))=λ⁻⁴ on ℚ(i), the conjugate embedding gives type −4barσ, which has α=0 on Σ and is not critical for Σ. This matches KS-v4 line 2549 ("our fixed embedding τ"). No other free embedding parameter occurs in the README; every other use reads through "the chosen embeddings" of the Conventions.

## H04 (CBirkbeck) — answered

The point concerns the pull-request description, which is outside the roadmap files and is left to the worker. The roadmap itself cites suppliers by roadmap and section only. The observation is correct at the pull-request level: the merge chain is #1543 → #1405 → #1050. It does not reach the consumed interface. In AbelianSchemesAndArithmeticModuliPartII at head `fe15b14`, LieGroupoidsPoisson G0.1 is consumed only by B2.10 (its README lines 1425 and 1455), and this roadmap consumes only P0–P4. The worker should state in the description that #1405's own prerequisite #1050 enters transitively.

## Build and gate

- `lake build TauCetiRoadmap.AutomorphicPadicLFunctionsPartII.Suggested`: Build completed successfully (8976 jobs). The only warnings are the two `declaration uses 'sorry'` warnings, at lines 67 and 90.
- Gate summary line: `gate AutomorphicPadicLFunctionsPartII: set_option=0 blob=0 latex=0 tex=0 prnum=0 sorry-data=0 sorry-examples=0 residue=0 private-paths=0 imports=0 mathlib-subimports=0 no-import-mathlib=0 lean-lines=0 forbidden=0 dropped=0 readme-ids-missing=0 empty-sections=0 round-labels=0 long-fences=0 layer-ids=0 target-ids=0 depcheck=0 metadata=0 dirty=0 outside-folder=0 source-material=0 OK`
- Depcheck (`--movable`): `depcheck: 55 roadmaps, 635 edges, 0 problem(s)`. There are no UPWARD, CYCLE or moved lines. The added suppliers, AbelianSchemesAndArithmeticModuli and CM §2.1, are earlier in the merge order.
- `roadmaps resolve` on the edited README: no cross-roadmap citation and no Lean name found nowhere.

## Signatures

`Suggested.lean` changed only in its module docstring. The four declarations (`hermitianPairing`, `kroneckerTerm`, `kronecker_meromorphic_continuation`, `kronecker_functional_equation`) are textually unchanged. I compared the elaborated types in the job's signatures file, produced from this file's declarations, with README §§3.3–3.4: all binders are present (`[DiscreteTopology Λ]`, `[IsZLattice ℝ Λ]`, `0<d`, `0<h i`, and the dual-lattice hypothesis `hΛd`), and the generality matches. I could not run a fresh `#check` pass: the brief gives no command for it, and the Lean language server was not set up for this worktree. I did not run any other Lean command.

## Ownership and sources

- **De Rham logarithm vanishing and polylogarithm class:** owned here. I searched by object (`logarithm sheaf`, `polylogarithm class`, `de Rham … polylog`, `RΓ_dR(A,Log)`, `Huber–Kings`) on main and in all 367 open roadmap pull requests with `roadmaps grep`. The only hit is AbelianSchemesAndArithmeticModuliPartII P3.3 (Log≃P̂♮), which stops before cohomology.
- **2πi-normalized Betti duality of A and A∨:** owned here. There is no hit in AbelianSchemesAndArithmeticModuli A4.3/A5.x, CM §1.3 or ComplexComparisonPartII C5. The "dual torus" hits are about reductive groups.
- **Trace dual of a fractional ideal:** Mathlib owns it (`FractionalIdeal.dual`, `Different.lean:229`), and the README now cites it.
- **New sources:** two works read through the sources service from arXiv (open-repository) are cited in README §§2.6–2.7 and listed in its References:
  - HK-2018 (Huber–Kings, arXiv:1505.04574v1, sha256 `1b52283678d1fd90b740fdd3297f9b6c4a8544b681416123a269d0bccb6948d5`; locators use the v1 numbering, as the References entry says);
  - Sch-2014 (Scheider, arXiv:1408.3819v1, sha256 `fb28995c453611c637fa9da78b3ba5cb8a153b2c13afba31933f3e8bee0515af`).

  This job may not edit `sources.toml`, so the worker must add both entries (cited_for §§2.6–2.7). No text was missing, and no `needs-references.toml` was written.
- The review text contained no instructions beyond mathematical claims; nothing suspicious to quote.

## Adversarial pass on the added and changed statements

| Statement | Instances tried | Values computed | Result | Change |
|---|---|---|---|---|
| §2.6 finite levels, d=1 | n=0,1,2 | dims (h⁰,h¹,h²)=(1,2,1),(2,3,1),(3,4,1); ranks 1,3,6; alternating sums 0=rank·χ_top(torus) | consistent with Sch-2014 line 1894 and Cor. 1.2.8 (line 2023) | Check added |
| §2.6 zero transition in H⁰ | n=1 vs split connection | δ(1)=id_H≠0 in Hom(H,H) (KS-v4 lines 1219–1226), so the image in H⁰(O_A)=k is 0; the split O_A⊕π*H gives δ=0 and image k | discriminates | Check added |
| §2.6 completed coefficient | i<2d, i=2d, i=2d+1 | pro-zero gives lim=lim¹=0; constant k gives lim k, lim¹ 0; so RΓ≃k[−2d]; d=1: H¹=0, H²=k | true | stated with lim¹ |
| §2.6 equivariant | Γ=1; Γ=μ₂ by [−1], d=1; Γ=ℤ, d=2 | H^i=H^(i−2d)(Γ,k); [−1]^* on H²_dR is +1, so H²=k, H³=H¹(μ₂,k)=0 in char 0; sign action would give H⁰(μ₂,k_sgn)=0; for ℤ: H³=0, H⁴=k, H⁵=k, whereas (H⁵_dR)^Γ=0 | equivariant ≠ invariants | Checks added |
| §2.6 support iso | d=1, E=O_A, one point | Ext¹(O_x,Ω¹)=k[dz/z] maps to principal parts modulo d(principal parts of O); z^(−m)dz=d(z^(1−m)/(1−m)) for m≥2; cokernel k by residue 1 | composite is an isomorphism | stated as "prove" |
| §2.6 residue sequence | d=1, D={e,P,−P}, level 0 and completed | level 0: 0→H¹_dR(A) (dim 2)→H¹_dR(U) (dim 4)→k³→k (sum); completed: H¹_dR(A,P̂♮)=0 makes residue injective | as stated | — |
| Trace normalization | dz/z at 0 | algebraic residue 1, ∮=2πi | pinned; agrees with §3.2 (δ_t·vol=(2πi)^d[t]) and §3.6 Check (local value 2πi·h(t)) | Check added |
| §2.7 pol_Γ(h) | h=(2,−1,−1), (1,1,1), (0,1,−1), h=0, D=∅ | traces 0, 3, 0; (1,1,1) is excluded by the residue theorem; residues at e of the two trace-zero classes are 2 and 0; h=0 gives 0; D=∅ gives k[D]=0 and H^(2d−1)=0 | unique and injective; level-zero ambiguity is 2-dimensional | Checks added; isogeny-functoriality bullet removed (it needed an unlisted finite-étale trace) |
| §2.8 edge map | d=1, d=2; level 0 | degrees 0→1 and 1→3; at level 0, a differential with residues h maps to its de Rham class with the same residues; a 2πi-normalized support map would give 2πi·h≠h | true under the §2.6 normalization | Check added |
| §3.6 reference | Λ=2ℤ+iℤ, d=1 | analytic local value 2πi·h(t) vs algebraic residue h(t): ratio 2πi, the integration factor | consistent | reference repointed to §§2.7–2.8 |
| §5.1 Betti duality | L=ℚ(i), O_L-structure | ⟨ξ(1),ξ∨(1)⟩=2πi·Tr(1)=4πi; Gram matrix of {1,i} against {1/2,−i/2} under 2πi·Tr is 2πi·I₂, so unimodular onto 2πiℤ | perfect | stated |
| §5.1 O_L-linearity of ξ∨ | x=i, y=1, z=i | 2πi·Tr(xzy)=2πi·Tr(−1)=−4πi; with a conjugate action, Tr(x·z̄·y)=Tr(1) gives +4πi | requires the dual action, as stated | — |
| §5.1 trace dual | ℤ[i] | dual(1)=(1/2)ℤ[i], basis 1/2 and −i/2 with Tr pairings (1,0;0,1); [d_L⁻¹:O_L]=N(2)=4 | matches Mathlib `dual_eq_mul_inv` with I=1 | index Check added |
| §5.1 Ω∨=2πiq/barΩ | Ω=2,q=1; Ω=2i,q=−i; ω_A↦uω_A; unconjugated pairing | πi; 2πi(−i)/(−2i)=πi; Ω∨ unchanged; ⟨ω_A,ω_A∨⟩=0 gives 0 | conjugation essential; formula consistent with KS-v4 lines 2269–2278 | Check added |
| §4.3 algebraic basis | ω_A∨=c·ubar | c=⟨barω_A,ω_A∨⟩=q, so ubar=q⁻¹ω_A∨ | true without Layer 5 | forward reference removed |
| §5.8 polarization input | CM §2.1 test_gaussian and test_incompatible_polarization | (ℤ[i],i/2) principal with Rosati = conjugation; H=[[1,1],[1,2]] has a Rosati that leaves ℚ(i)² | CM-compatibility needed | Needs and contract add CM §2.1 |
| §5.9 τ | χ((λ))=λ⁻⁴, E=ℚ(i) | fixed τ: type −4σ, α=4, β=0, critical; conjugate τ: type −4barσ, α=0 on Σ, not critical | τ must be the fixed embedding | wording and Check |
| CM §1.3 contract | `cmPeriodPairings` text at head 0c6c6e2 | lists period pairing, conjugate de Rham pairing, naturality, aΛ; no a⁻¹d_L⁻¹, no 2πi comparison | the review's attribution point is correct | contract rewritten |
