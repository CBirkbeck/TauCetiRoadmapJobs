# GATE-HilbertModules~2: answers to human review of `HeisenbergImprimitivity`

The repairs are in commit `d1c6fc9f`, on top of `18b9874`, and are not pushed. It changes two files: `TauCetiRoadmap/HilbertModules/HeisenbergImprimitivity/README.md` (rewritten in layered form, 696 lines) and `TauCetiRoadmap/HilbertModules/HeisenbergImprimitivity/Suggested.lean` (rewritten, 134 lines). The review is a single comment by CBirkbeck with findings F01–F10, numbered here H01–H10. The sub-points of F07 are answered inside H07.

## H01 (CBirkbeck) — applied differently
The twisted group C*-algebra `C*(L,c)` of a discrete abelian group with a normalised 2-cocycle is now a target of this roadmap (README §3.1). It is stated with its ℓ¹ algebra, its universal and regular completions, the faithful trace `τ(f)=f(0)`, the gauge action, the fact that a nonzero gauge-invariant ideal is everything, and full = reduced. Inverse-closedness of its rapid subalgebra is a target in §5.1. The Schrödinger family and its cocycle laws are a target in §1.1.

Every citation of D1.CentralTwists, D1.TwistedBorel and D2.CentralTwists is deleted. OperatorAlgebraDynamics (on main) is cited only for D1 scalar integrated forms and for these D2 facts: the discrete expectation, and that for amenable groups the trivial representation is weakly contained in λ (main README lines 143–200).

Where this differs from the suggested repair: full = reduced is proved by twisted Fell absorption (`V⊗λ ≅ multiple of λ_c`, plus amenability of L from AmenableGroups Layer 6) instead of the circle-extension `K=𝕋×_cL`. Fell absorption needs no central-projection or sector argument. The Schrödinger family keeps arbitrary locally compact abelian M, because the cocycle calculus costs nothing more.

## H02 (CBirkbeck) — applied
`Suggested.lean` now states four headline theorems on the Euclidean phase space, using Mathlib carriers (`SchwartzMap`, `IsZLattice`, `ZLattice.covolume`, `Real.fourierChar`):
- `poisson_summation`: for every ℤ-lattice L in `ℝ^k×ℝ^k`, not only `Pℤ^(2k)`.
- `fundamental_identity`.
- `exists_parsevalFrame`: smooth finite frames for every lattice.
- `parsevalFrame_trace`: `Σ_j‖g_j‖₂²=covolume`, which is `dim_A𝓔=c_E` (Rieffel Theorem 3.4).

The module docstring now has the required form. It names what is not statable at the pins and what each lacks: the general finite-type versions (no Schwartz–Bruhat space), and positivity, the imprimitivity bimodule, `B≅K_A(𝓔)`, fullness and the module trace formula (no `C*(L,c)` and no Hilbert-module completion). `SchwartzBruhat` is deleted, since no stated headline needs it.

## H03 (CBirkbeck) — applied
Lines 5–10 (three `Mathlib.*` and three unused `TauCeti.*` imports) are now the single line `import Mathlib`. The gate reports `imports=0 mathlib-subimports=0 no-import-mathlib=0`.

## H04 (CBirkbeck) — applied
The new file `TauCetiRoadmap/HilbertModules/HeisenbergImprimitivity/metadata.toml` contains the single line `topic = "math.OA"`. Operator Algebras is the primary class of the headline theorems: Morita equivalence of twisted group C*-algebras and Parseval frames of Hilbert C*-modules (rieffel88 is itself an operator-algebras paper). The gate now reports `metadata=0`. The README no longer has the `../README.md`, `../../…` relative links, which dangled on main. The parent is named by roadmap and section only (HilbertModules H1–H3).

This placement conflicts with `.github/scripts/check_roadmap_topics.py` at this head. That script counts as roadmaps only the directories directly under `TauCetiRoadmap/` that contain a `README.md`. `TauCetiRoadmap/HilbertModules/` has no README on this branch, so the script rejects the new file as "only a roadmap directory carries a metadata.toml". It rejects a parent-level `TauCetiRoadmap/HilbertModules/metadata.toml` the same way; I tried that and reverted it. That CI check passes only once the parent HilbertModules roadmap, with its own README and `metadata.toml`, is on main. At that point the child file should be deleted, because a sub-roadmap inherits its parent's topic. A human needs to decide how the two checks are reconciled.

## H05 (CBirkbeck) — applied
The README is rewritten in the standard shape:
- Summary, Scope and ownership, Conventions, Exact supplier contracts (Mathlib, Tau Ceti, HilbertModules, OperatorAlgebraDynamics, AmenableGroups, NoncommutativeGeometry) and How to read the build;
- Layers 1–6 with `### k.n` subsections, each ending with Examples and Dependencies;
- Downstream consumers and References.

Every subsection has a `*Needs:*` line and a `**Checks.**` list of at least three computed Checks. Claims carry locators of the form `rieffel88 line N`, checked in the cached text: Prop 2.2 line 362, Lemma 2.3 line 381, Prop 2.8 line 447, Prop 2.9 line 460, Poisson formula lines 541–546, Lemma 2.10 line 552, Props 2.11–2.14 lines 570/590/603/620, Thm 2.15 line 639, Lemma 3.1 line 744, Props 3.2–3.3 lines 753/766, `c_Dc_(D^⊥)=1` line 810, Thm 3.4 line 832, spectral invariance lines 919–930, Prop 3.7 line 937. Austad–Enstad 2020 Props 3.5 and 3.7 are cited too (arXiv 1904.10826v2 lines 661 and 693).

The dependency check now has `*Needs:*` lines to extract edges from, and reports no problem (output below).

## H06 (CBirkbeck) — applied
The NoncompactQuantumSymmetry sentence is deleted, and the README no longer cites that roadmap anywhere. It could not have been cited anyway: it is at position 142 of the merge order, after HilbertModules at position 11.

## H07 (CBirkbeck) — applied
- `right_inner_action` and `real_poisson` are deleted. `SchwartzMap.tsum_eq_tsum_fourier` and the `CStarModule Aᵐᵒᵖ` convention now appear in the README's supplier contracts and Conventions.
- `schrodinger_mul`, `cocycle_identity` and `commuting_iff` are deleted; these facts are README §1.1 prose.
- `finiteLeft`, `finiteRight`, `rightCoefficient`, `leftCoefficient`, `Dual`, `Phase`, `evaluation`, `cocycle` and `commutator` are deleted. Every remaining definition (`EuclideanPhase`, `symplecticChar`, `symplecticAnnihilator`, `symplecticFourier`, `schrodinger`, `schrodingerAdjoint`, `l2Inner`, `IsParsevalFrame`) appears in a headline statement.
- The namespace is now `TauCetiRoadmap.HilbertModules.HeisenbergImprimitivity`, and the file has `/-! ## Layer 2 … -/` and `/-! ## Layer 5 … -/` section comments in README order.

## H08 (CBirkbeck) — applied
The following are deleted: the metadata sentence (README lines 8–9), the Zulip link, the Mathlib pull-request numbers #43046 and #37350, the "prototypes" sentence, and the "suggested forms … when built" docstring. The parent relation is now stated in Scope ("a child of HilbertModules"). The compact-support density input is cited by its Tau Ceti name `SchwartzMap.dense_hasCompactSupport`. The `CStarModule Aᵐᵒᵖ` choice is stated in Conventions. The gate reports `prnum=0 round-labels=0`.

## H09 (CBirkbeck) — applied
I took the second option. Scope and ownership now says that the imprimitivity theorem is stated for lattices: there both D and `D^⊥` are discrete, both algebras are unital with finite traces, and Layer 5's frame and dimension theory applies. Rieffel's theorem for an arbitrary closed subgroup (rieffel88 line 639), whose algebras are twisted group C*-algebras of non-discrete groups, is outside this roadmap and belongs to a Part II of it, starting from Layer 2. No roadmap on main or among the open heads owns that case (`roadmaps grep` for twisted group C*-algebras: see Ownership below).

## H10 (CBirkbeck) — applied differently
The `SchwartzBruhat` structure is deleted with its two lemmas, so the issue goes away rather than being patched. No headline needs the structure, since the general S(M) is not statable without a long ad hoc encoding. S(M) for finite-type M, with F a finite abelian group, is a README target (§2.1).

## Build and gate

- `lake build TauCetiRoadmap.HilbertModules.HeisenbergImprimitivity.Suggested`: `Build completed successfully (8976 jobs).` It gives four `declaration uses sorry` warnings, at lines 86, 99, 120 and 129: `poisson_summation`, `fundamental_identity`, `exists_parsevalFrame` and `parsevalFrame_trace`.
- Gate summary line:
  `gate HilbertModules: set_option=0 blob=0 latex=0 tex=0 prnum=0 sorry-data=0 sorry-examples=0 residue=0 private-paths=0 imports=0 mathlib-subimports=0 no-import-mathlib=0 lean-lines=0 forbidden=0 dropped=0 readme-ids-missing=0 empty-sections=0 round-labels=0 long-fences=0 layer-ids=0 target-ids=0 depcheck=0 metadata=0 stray-files=0 dirty=0 outside-folder=0 source-material=0 OK`.
  The only failure is `metadata: …/HeisenbergImprimitivity/metadata.toml missing` (H04).
- Direction check (`gate --depcheck … --movable`): `depcheck: 206 roadmaps, 1682 edges, 0 problem(s)`. There are no UPWARD, CYCLE or moved lines.
- `roadmaps resolve` on the new README finds no unresolved cross-roadmap citations and no unresolved Lean names. I checked the Mathlib and Tau Ceti names by hand at the pins: `SchwartzMap.fourierTransformCLM` and `SchwartzMap.integral_sesq_fourier_eq` (`SchwartzSpace/Fourier.lean` lines 51, 261); `ZLattice.covolume` (Covolume.lean 72); `IsZLattice` (ZLattice/Basic.lean 433); `ZSpan.fundamentalDomain` and `ZSpan.isAddFundamentalDomain` (Basic.lean 92, 351); `Real.fourierChar` (Complex/Circle.lean 221); `mFourier`; `hasSum_fourier_series_L2`; `CStarModule`; `WithCStarModule`; `TauCeti.PontryaginDual.continuous_coe_eval_const` (DualEval 29); `SchwartzMap.dense_hasCompactSupport` (Cutoff 211).

**Elaborated signatures.** I appended `#check @name` for all 11 declarations to the file, built it once with the permitted `lake build`, read the types, and then removed the lines. Each elaborated type matches its README statement:
- the three theorems over a lattice carry exactly `[DiscreteTopology ↥L] [IsZLattice ℝ L]`;
- the covolume elaborates as `ZLattice.covolume L MeasureTheory.volume` for the product Lebesgue measure;
- `parsevalFrame_trace` takes `IsParsevalFrame L g` as its only hypothesis.

There is no `variable` block, so no binder can drop out silently.

## Notions moved down and ownership

- **Twisted group C*-algebras `C*(L,c)`.** These are moved down from OperatorAlgebraDynamics #1137, which revises a roadmap on main and so is not a dependency, into README §3.1. The rapid subalgebra's inverse-closedness is moved down from SmoothBanachRepresentations SB8 into README §5.1. SmoothBanachRepresentations has the same author as this pull request and is not in the merge order.
- **Citations deleted.** The AlgebraicKTheory A0/A7 citation (position 12, later) is deleted. So are the VonNeumannAlgebras V11 and BanachAlgebras A7 citations: the duals of the finite-type factors are explicit, and Layer 1 needs only Mathlib's `PontryaginDual` and Haar measure.
- **Ownership grep.** `roadmaps grep` for twisted group C*-algebras finds two other places:
  - OperatorKTheory #866 cites the same D1/D2.CentralTwists sections, so it inherits the gap of H01.
  - CompactQuantumMetricSpaces (#1155, §6.0) builds `C*(ℤ^d,σ)` itself. It is at position 198 of the merge order, after HilbertModules (position 11), so it cannot supply this roadmap. Its ℤ^d case is a special case of README §3.1, which it could import. That is a matter for that pull request.
- **Lattice Poisson summation.** No other owner was found for Poisson summation on a general lattice in phase space, at either the open heads or main. Mathlib has only the one-dimensional theorem (`PoissonSummation.lean` lines 99, 216).

## Sources

- `rieffel88` (manifest, certified) was used for every Rieffel locator.
- `austad-enstad20` (arXiv:1904.10826v2, open repository) was fetched through the sources service and read at Propositions 3.5 and 3.7, lines 661 and 693. It is not yet in `packages/HilbertModules/sources.toml`, and this job may not edit that file. The worker should add the entry: id `austad-enstad20`, `locator_scheme = "theorem"`, `locator = "Proposition 3.7"`, cited for README §4.1 and §5.2.
- No text was missing, so no `needs-references.toml` was written.

## Adversarial pass

Conventions: `⟨·,·⟩` is linear in the second variable, `e(r)=exp(2πir)`, `π_(m,s)ξ(t)=e(s⬝t)ξ(t+m)`, `σ((m,s),(n,u))=e(u⬝m−s⬝n)`, and `θ(a)=Σ_n e^(−πan²)`.

| Statement | Instances tried | Values computed on each side | Result | Change |
|---|---|---|---|---|
| `π_xπ_y=β(x,y)π_(x+y)` (§1.1) | ℝ: x=(1,0), y=(0,1/2) and y=(0,1/4) | LHS `e((t+1)/2)ξ(t+1)=−π_(x+y)ξ`; β=−1. At y=(0,1/4) β=i; the `ξ(t−m)` convention gives −i | holds, conventions separated | Check rewritten with the 1/4 witness |
| `π_x^*=conj β(x,−x)π_(−x)` | ℝ, x=(1,1/2); x=(1,1/4) | At 1/2, with or without conj both give −1, so it did not discriminate. At 1/4: `i·e(−t/4)ξ(t−1)` on both sides; without conj −i | holds | witness changed from 1/2 to 1/4 |
| σ alternating, nondegenerate, 2-torsion | ℤ/2: σ((1,χ₀),(0,χ₁)) | χ₁(1)·conj χ₀(0)=−1 | holds | notation fixed |
| `L^⊥` for `aℤ×bℤ` (§1.2) | a≠b | `(1/b)ℤ×(1/a)ℤ`; the swapped factors are wrong when a≠b | holds | Check |
| `L^⊥=L` non-lattice | `ℝ×{0}` | σ=e(um)=1 ∀m ⇒ u=0 | Lagrangian, not discrete | old garbled Check replaced |
| `c_Lc_(L^⊥)=1` (§1.3) | `aℤ×bℤ`; finite F with D=0, D=G; ℤ/2 counting on F̂ | ab·(1/(ab))=1; `|F|²/(|D||D^⊥|)=1`; with mass 1 on F̂ the product is 4 at ℤ/2 | holds; normalisation pinned | Check |
| `L^⊥=J⁻¹P^(−T)ℤ^(2k)` | P=[[2,1],[0,1]] | covol(L^⊥)=1/2, c_L=2 | holds | Check notes that it pins `P^(−T)`, not the sign of J |
| Matrix coefficient in S(G) (§2.2) | Gaussian g; `1_[0,1)` | `|⟨g,π_(m,s)g⟩|=e^(−π(m²+s²)/2)`; `|⟨1_[0,1),π_(0,s)1_[0,1)⟩|≤1/(π|s|)` | Schwartz / not Schwartz | Check |
| Orthogonality (§2.3) | g Gaussian, e=0 | `∫|⟨π_xg,g⟩|²=∫e^(−π(m²+s²))=1=⟨g,g⟩²` | holds in converted form `⟨ω,ξ⟩⟨η,ζ⟩` | formula re-derived from rieffel88 line 552 (old draft had wrong slots) |
| Four-vector identity | ℝ, general ξ,η,ζ,ω | Both sides `∫dm e(um)∫conj η(r+m)ξ(r)conj ω(r+n)ζ(r+n+m)dr` | holds | none |
| Poisson (§2.3, `poisson_summation`) | ℤ×ℤ Gaussian; ℤ×2ℤ Gaussian; ℤ/2 with D=G; k=0 | `θ(1)²=θ(1)²`; `θ(1)θ(4)=(1/2)θ(1/4)θ(1)` by `θ(1/4)=2θ(4)`; `ΣF=2·(1/2)ΣF`; F(0)=F(0) | holds; without `c⁻¹` off by 2 | Checks |
| `F_sF(e)=(𝓕F)(−Je)` | σ(x,e)=e(⟨x,Je⟩), Je=(u,−n) | ⟨x,Je⟩=m⬝u−s⬝n | holds | §2.4 sentence corrected (old text was garbled) |
| `fundamental_identity` | ℤ×2ℤ, ξ=η=ζ=g, paired with g | LHS θ(1)θ(4); RHS (1/2)θ(1/4)θ(1). With π_e for π_e^*, factor `(−1)^(2nu)` makes the RHS smaller | holds; adjoint necessary | Check |
| Twisted algebra involution (Conventions) | δ_x | `δ_x^*δ_x=δ_0`, and `δ_xδ_x^*=δ_0` using `c(x,−x)=c(−x,x)` (cocycle at a=x,b=−x,d=x) | holds | none |
| `C*(L,c)` examples (§3.1) | c≡1, ℤ; (ℤ/2)²; ℤ², e(θnm′) | C(𝕋); `δ_(1,0)δ_(0,1)=−δ_(0,1)δ_(1,0)`, M₂(ℂ); `U₂U₁=e(θ)U₁U₂` (N6's multiplier); reversed cocycle gives −θ | holds | Checks |
| Full = reduced (route) | L finite; ℤ | Fell absorption plus amenability; for L finite every rep is a summand of λ_c^⊕ | holds | route changed (H01) |
| Gauge-invariant ideals | L=ℤ, c≡1: C(𝕋) | rotation-invariant closed ideals are 0 and C(𝕋) | holds; fullness ≠ simplicity | Check §4.2 |
| Right action anti-rep (§3.2) | ℝ, x=(1,0), y=(0,1/4) | correct coefficient conj β(x,y)=−i; with π_e, β(y,x)=1 | holds | Check rewritten (old "wrong algebra" was imprecise: β^op is cohomologous to conj β) |
| Left pairing factor c_D | ℤ/2, D=G, ξ=δ_0 | `_B⟨δ_0,δ_0⟩=(1/2)(δ_(0,χ₀)+δ_(0,χ₁))` acts as the projection onto δ_0; without c_D, twice it | holds | Check |
| Positivity and traces (§3.3) | ℤ/2, D=0; ℝ Gaussian | `⟨δ_0,δ_0⟩_A` acts as `1+π_(0,χ₁)`=2P≥0, τ_A=1=‖δ_0‖²; `_B⟨δ_0,δ_0⟩=2=c_D‖δ_0‖²`; `⟨g,_B⟨g,g⟩g⟩=θ(1)²>0` | holds | old garbled Checks replaced |
| ‖ξ‖₂≤‖ξ‖_A, injectivity (§4.1) | D=G finite; ℤ/2 D=0; M=ℤ, D=ℤ×{1} with non-faithful state | equality; √2>1 (strict); `|Σξ(t)|²=0` for δ_0−δ_1 versus τ-norm 2 | holds; faithfulness needed | Checks replaced; dropped an unsourced claim that `1_[0,1)∈𝓔` |
| `B≅K_A(𝓔)` (§4.2) | F with D=0; F with D=G | ℂ=K_{M_N}(ℂ^N) row; M_N=K_ℂ(ℂ^N) column | holds | Checks |
| Frame existence (§5.1, `exists_parsevalFrame`) | k=1, L=(1/2)ℤ×ℤ, g supported in [0,1] with Σ_n\|g(t+n/2)\|²=1; L=ℤ×ℤ; k=0 | Parseval holds by Parseval on unit intervals; `1_[0,1)` is an ONB but not Schwartz; n=1, g=1 | holds; single window not asserted | Checks |
| Trace formula (`parsevalFrame_trace`, §5.2) | the 5.1 window; ℤ/2 D=0 and D=G; index-two sublattice; ℝ, D=2ℤ×(1/3)ℤ | ‖g‖²=1/2=covol; τ(p)=1/2 and 2; Σ doubles, covol doubles; c_E=3/2 ⇒ n≥2 since τ(p)≤n | holds; `1/covol` gives 2 | Checks |
| Rephasing (§5.3) | u(m,s)=e(m⬝s) | δu=e(−m⬝u′−n⬝s), β′=e(−n⬝s)=conj β(y,x), σ′=σ | holds | old garbled Check replaced |
| Fourier intertwiner | ℝ, x=(1,0) and (0,u) | `F₊π_(1,0)ξ(s)=e(−s)F₊ξ(s)`=π′_(0,ev_(−1)); `F₊π_(0,u)ξ(s)=F₊ξ(s+u)` | holds; ev_m has the wrong sign | Check |
| Dilation | a>0 | `Uπ_(m,s)U⁻¹=π_(am,s/a)`, det diag(a,1/a)=1 | holds | Check |
| Finite family (§6.1) | ℤ/3, D=⟨(1,χ)⟩; non-product lattice in ℝ×ℤ/2 | isotropic, c_D=1, dim=1; c_D=2, `D^⊥={((n,[2n]),(u,χ₁^(2u)))}`, covol 1/2 | holds | the old placeholder Check is replaced by this computed one |
| ℤ²→ℝ×ℤ/q embedding (§6.2) | q=1; q=2,a=b=c=d=1; a=0 | parameter ab, covol \|ab\|; 3/2, covol 2; φ(0,q)=0 | holds; ab≠0 needed | Check made explicit |
| Two-torus dictionary (§6.3) | θ=1/2; σ check; θ=0; sign of χ_m | c_E=1/2; σ=e(−jn+ml)=1; φ not injective; `χ_m=e(mt)` turns U₂ into U₂^* | holds | Checks |
| Context of Lean statements | all four theorems | No `variable` block; lattice binders explicit; covolume for `volume` on `(Fin k→ℝ)²` | holds | none |
| k=0 degenerate (Lean) | phase space a point | L={0}, covolume 1, `L^⊥={0}`; Poisson F(0)=F(0); frame n=1, g=1, Σ\|g\|²=1 | holds | Checks |

A note on the parent: HilbertModules (#861) line 469 refers to "HeisenbergImprimitivity H6". That content is now Layer 6 (§6.3) of this README, with the same numbering.
