# PKG-SchrodingerOperatorsAndSpectralTypes: report

Deliverables written: `packages/SchrodingerOperatorsAndSpectralTypes/README.md` (1848 lines),
`packages/SchrodingerOperatorsAndSpectralTypes/Suggested.lean` (352 lines),
`packages/SchrodingerOperatorsAndSpectralTypes/metadata.toml` (`topic = "math.SP"`, arXiv's
spectral-theory category), `packages/SchrodingerOperatorsAndSpectralTypes/sources.toml` (`cited_for`
updated). `design/plan.json` is unchanged: its `gaps` list already holds the two gaps the package
needs (`weyl-criterion`, `spectral-integral-resolvent`), both still open at the supplier (checked
below), and no new gap arose.

The README is the accepted design written out in the upstream shape, with the corrections listed
below. Every target, Check and worked example of the design is kept.

## Headline theorems

All are statable at the pins and all are stated; the module docstring says so.

| Headline (README §) | Status | Lean name |
|---|---|---|
| The type components realise the Lebesgue decomposition (1.2) | stated, for every normalized PVM on `ℝ` | `diag_spectralType_components` |
| `σ_ac` is perfect, characterised by local absolutely continuous mass of a single vector (1.4) | stated, for every normalized PVM | `perfect_acSpectrum_and_mem_iff` |
| Interval criterion `[a, b] ⊆ σ_ac` (1.5) | stated, for every normalized PVM | `Icc_subset_acSpectrum_iff` |
| Min–max principle below the essential spectrum (1.6) | stated | `minMax_principle` |
| Pearson's theorem, existence (1.9) | stated | `pearson_tendsto` |
| Kato–Rosenblum: existence, completeness, `σ_ac(H₁) = σ_ac(H₂)` (1.9) | stated | `katoRosenblum` |
| Kato–Rellich lower bound `γ − max(a/(1−b), a + b|γ|)` and core transfer (2.3) | stated | `katoRellich_lowerBound_hasCore` |
| Gaffney–Chernoff–Strichartz: essential self-adjointness on complete manifolds, closure = maximal operator (3.6) | stated | `gaffney_isSelfAdjoint_closure` |
| `L²` kernel of the Laplacian of a complete manifold (3.7) | stated | `exists_mem_domain_closure_eq_zero_iff` |
| `[1/4, ∞) ⊆ σ_ess(Δ_X)` from a standard cusp end (3.10) | stated | `Ici_quarter_subset_essentialSpectrum` |
| `−Δ + V`, bounded real `V`: essential self-adjointness on `C_c^∞`, domain `H²`, lower bound `ess inf V`, `σ_ess = [0, ∞)` for decaying `V` (4.4) | stated | `schrodinger_isSelfAdjoint_closure` |

Definitions added only to state these (real bodies, native carriers): `IsSpectralMeasureOf` (the
resolvent formula of SA-E05 as a predicate on `(A, P)`), `acSpectrum`, `essentialSpectrum`
(UnboundedOperators UO-C02's formula, restated because a roadmap file cannot import another),
`minMaxValue`, `complexLaplacian`, `cuspRegion`, `IsStandardCuspEnd`. No sorry'd data, no
`set_option`, no `lemma`, no example.

How the carriers missing at the pins were handled, without stand-ins:

- The spectral measure `P_A` of a given operator (SelfAdjointSpectralTheory SA-E01) is not a
  declaration at the pins. 1.2, 1.4 and 1.5 depend only on the projection-valued measure and are
  stated for every `TauCeti.ProjValMeasure ℝ H`, which is their full generality (UO-C03 defines the
  type subspaces for a bare PVM). Pearson and Kato–Rosenblum take a PVM `P` together with
  `IsSpectralMeasureOf A P`, which determines `P` (SA-E44) and is satisfiable (SA-E01), so the
  hypothesis ties the data to the operator and is not vacuous.
- `e^{itA}` is Tau Ceti's unitary `StronglyContinuousGroup` with complex generator `i • A`; Stone's
  theorem `IsSelfAdjoint.existsUnique_isUnitary_complexGenerator_eq_I_smul` is at the pin, so the
  groups exist and are unique.
- Operators on test functions (`Δ₀`, `−Δ + V`) are `LinearPMap`s characterised by domain and
  a.e. action, the pattern UnboundedOperators uses for UO-E06; these properties determine the
  operator.
- Completeness of a Riemannian manifold is metric completeness of Mathlib's `IsRiemannianManifold`
  extended distance (the form Tau Ceti uses), equivalent to completeness of every component.
- A standard cusp end is presented through its universal cover: a local Riemannian isometry
  (Tau Ceti `TauCeti.IsLocalRiemannianIsometry`) from the open part `{y > a}` of Tau Ceti's
  `TauCeti.UpperHalfSpace ℝ` whose fibres are exactly the `w`-translation orbits; the README proves
  the equivalence with the isometry definition.

## Corrections and changes to the design

1. **1.2, 1.4, 1.5 stated for a bare normalized PVM `P`.** The design stated them for `P_A` and
   reached a bare PVM through `A_P = id[P]` and `gap:spectral-integral-resolvent`. 1.2 needs no
   operator at all (UO-C03's subspaces are defined for a bare PVM), so the general statement needs
   no gap. 1.4 now defines `σ_ac(P)` (also `σ_sc(P)`, `σ_pp(P)`) as the support of `P` on the type
   subspace and proves `σ_xx(A) = σ_xx(P_A)` from 1.3; the design's `σ_ac(A) := σ(A_ac)` is kept.
2. **1.5 route.** The design used UO-A06 for "the support of `μ_{P_ac f}` lies in `σ_ac(A)`"; for a
   PVM this is the definition of `σ_ac(P)`. *Needs:* is now 1.2, 1.4.
3. **1.6.** Added the statement without spectral projections: for `c < inf σ_ess`,
   `ran P_A((−∞, c))` is the finite sum of the eigenspaces `ker(A − t)`, `t < c` (finite set of
   isolated eigenvalues of finite multiplicity in the compact `σ(A) ∩ [γ, c]`; `ran P_A({t}) =
   ker(A − t)` from `‖(A − t)f‖² = ∫ (s − t)² dμ_f`), and that "nondecreasing, at most
   `inf σ_ess`, and the counting identity" determine every `μ_n`. Two Checks added: UO-C02's
   essential spectrum against the wrong model "spectrum minus eigenvalues", and the necessity of
   the lower bound (`−diag(n)`).
4. **1.1.** Added the predicate `IsSpectralMeasureOf` with its laws and four Checks (Dirac measures
   at `2` and `3`, the sign of the Stieltjes kernel, the coordinate measure, the zero space), and
   attributed the formula to SA-E05.
5. **3.10.** Added cusp charts and the equivalence with the isometry definition; Check that the
   fibre condition is two-sided (a width-`1` chart is `2`-periodic but not a width-`2` chart).
6. **Conventions.** Added the Stone-group convention with a witness (`A = 2`: `e^{2it}` has
   generator `2i`, while `e^{−2it}` belongs to `−A`), completeness in extended-metric form, and
   operators given on test functions.
7. **Timeless and definite scope.** The section "Motivation for a future roadmap" became a bullet of
   Downstream consumers (what a roadmap on finite-area hyperbolic surfaces takes from Layers 1 and
   3); the scope and "How to read the build" now point there.
8. **Scope.** Added the distinction from OperatorTheory/OperatorIdeals OI-A35–OI-A40 (min–max for
   approximation numbers of bounded operators), and the note that `essentialSpectrum` in
   `Suggested.lean` is UO-C02's object.
9. VariationalMethods' Lean names (`CompactFormPair.…`) were replaced by prose, so that the README
   backticks no Lean name of another roadmap's file.
10. Every Lean declaration is named in the README at its section; paragraphs were reflowed at 100
    columns (a script checked that the non-whitespace text was unchanged by the reflow).

The accepting review (round 11) raised no finding and no non-blocking note to apply; its
"Source issues" item (Teschl's printed denominator in Theorem 6.4) is already in 2.3. Its licence
question about `teschl` is for the human reviewers and is unchanged.

## What the README could not support

Nothing in the design was dropped. Four items rest on texts the manifest records as uncertified
(cited by locator without the text): 3.5 (`gaffney54`, `grigoryan09`), 3.8 (`chavel84`), the
Pearson argument of 1.9 (`pearson78`, `rs3`; its statement is read in `yafaev04`), and 3.6, which
cites `strichartz83` and `chernoff73` beside `bms02`, whose Corollary 2.10 (connected case) is read.
Their statements were checked by computation (table below and the accepted design's table). The
published numbering of the arXiv copies `bms02`, `hm23`, `yafaev04` and `kps26` was not compared
with the journals; the manifest's `version_note`s say so.

## Notions moved down from later roadmaps

None. Every supplier is on main or earlier in the merge order (QuantumFoundations, line 220 of
`merge-order/ORDER.txt`; this roadmap is line 221).

## Duplication sweep and removals

Swept by object in the pinned Mathlib and Tau Ceti and, with `roadmaps grep`, on main and at the
open heads: Gaffney/Strichartz/Chernoff, essential self-adjointness, wave operators,
Kato–Rosenblum/Pearson, min–max and Glazman, absolutely continuous spectrum, quasi-periodic
operators, cusp ends, the complex Laplacian, the spectral-measure predicate, the adjoint of a
closure.

- No target of the design duplicates a pinned declaration or another roadmap's target; nothing
  was removed in this pass (the design had already deleted and cited QuantumFoundations §8.2's
  free Hamiltonian, RiemannianGeometry R5c's closed-manifold theory, VariationalMethods 4.4's
  compact case, UO-C03's subspaces, UO-E06's three-dimensional case).
- Kept out of the Lean statement: the self-adjointness of `A + V` in 2.3 is Tau Ceti's
  `IsSelfAdjoint.add_of_isRelativelyBounded`, so `katoRellich_lowerBound_hasCore` states only the
  lower bound and the cores.
- `essentialSpectrum` repeats UO-C02's formula (UnboundedOperators' own file defines it the same
  way); the README says UO-C02 owns it.
- `IsSpectralMeasureOf` is SA-E05's formula as a predicate. An open revision of
  SelfAdjointSpectralTheory defines the same predicate, with the identical body, as
  `IsSpectralMeasure`; a revision is never a dependency, so the README cites SA-E05 on main and the
  name here differs. When the revision merges, the README can cite its declaration.
- OperatorIdeals OI-A35–OI-A40 (min–max for approximation numbers) is a different object from 1.6;
  recorded in the scope.
- HilbertModules H6 stays a supplier: neither pin has the identity `(closure T)* = T*` (searched for
  adjoint/closure lemmas in Mathlib's and Tau Ceti's `LinearPMap` files).
- "cusp chart" is used in ModularCurvesPartII, ShimuraVarieties and others for algebraic or
  arithmetic formal charts; the term is defined in 3.10 for Riemannian surfaces, and no roadmap
  defines standard cusp ends of an abstract Riemannian surface.

Ownership against open pull requests: checked by object with `roadmaps grep` over the 473 open
heads of the current index (and the 240 listed in the brief), and by reading the closest
roadmaps (UnboundedOperators, SelfAdjointSpectralTheory and its open revision, VariationalMethods,
QuantumFoundations, CongruenceSpectralGap, AutomorphicSpectralTheory, MaassForms,
OperatorIdeals). `roadmaps overlaps` reports no open pull request that changes this roadmap and no
cited id dropped by an open pull request.

## Citations

Cross-roadmap ids re-checked on main (UO-A01–UO-E06, SA-B44–SA-E47, VariationalMethods 4.4/5.1,
RiemannianGeometry R5c and R7.8, ComplexKahlerGeometry K5a, HilbertModules H6,
SmoothBundlesConnections B2.2, PseudodifferentialOperators P1.0, OperatorIdeals OI-A35–OI-A40) and at
the open heads (QuantumFoundations §8.2 and §9.5, CongruenceSpectralGap §0.2 and §0.6,
AutomorphicSpectralTheory §1.16a and §§4.1–4.4, MaassForms §0.1). `roadmaps resolve` on the final
README (main a40f789, 473 open heads): no cross-roadmap citation and no Lean name found nowhere. The
resolver did not check library names on this host, so every backticked Mathlib and Tau Ceti name of
the README was grepped for its declaration at the pins (Mathlib `1b1ccf4`, Tau Ceti `2fd255d`):
all found. Teschl Theorem 3.7 (line 3983–3992, printed p. 96), newly cited in 1.1, was read at the
text.

Supplier gaps, re-checked at the current main: UO-C02 still names Weyl's criterion only as a
locator inside its Fredholm paragraph (no stated item), and UO-A02 states the resolvent of
`id[P]` only for `P = P_A`. Both gaps stand as declared.

## Binder check

All declarations carry their binders in their own signatures (no section `variable`s). A scratch
copy of the file with `#check @name` for all 18 declarations was elaborated once and each
elaborated type compared with its README statement. One change resulted: the Riemannian volume
needs `IsContinuousRiemannianBundle`, which instance search does not derive from
`IsContMDiffRiemannianBundle I ∞`, so the three manifold theorems carry it explicitly. Every other
hypothesis appears as stated (`CompleteSpace H`, `IsSelfAdjoint`, `CompleteSpace M`,
`SecondCountableTopology M`, `I.Boundaryless`, `0 < d`, `MemLp V ⊤`, `a < b`, `b < 1`).

## Adversarial pass

Values computed for every statement written or changed in this pass (the accepted design's table,
recomputed in round 11, covers the unchanged statements).

| Statement | Instances tried | Values computed | Result | Change |
|---|---|---|---|---|
| `IsSpectralMeasureOf` (1.1) | `A = 2` on `ℂ` with `δ₂`, `δ₃`; kernel sign; `M_x` with `P(B) = M_{1_B}`; `ℋ = 0` | `(i − 2)⁻¹ = (−2 − i)/5` vs `(i − 3)⁻¹ = (−3 − i)/10`; `Im (i − 2)⁻¹ = −1/5 = −∫(1+s²)⁻¹ dδ₂`, kernel `(s − z)⁻¹` gives `+1/5`; `⟪f, R(z)f⟫ = ∫|f|²(z − s)⁻¹ ds` | holds exactly for `P_A`; wrong sign would make it unsatisfiable | Checks added |
| `diag_spectralType_components` (1.2) | `M_x ⊕ 1/2`, `f = (1,1)`; Cantor `c`; `√2·1_{[0,1]}`; `ℋ = 0`; pure ac `f` | `Leb|[0,1] + δ_{1/2}`, singular part `δ_{1/2}`, atoms `{1/2}`; singular part `c`, atomless, ac part `0`; `2Leb` vs reversed `4Leb`; all `0`; singular part `0` | correct; decomposition unique by UO-C03 so the "every decomposition" form equals the projection form | restated for bare `P` |
| `acSpectrum`, `σ_xx(A) = σ_xx(P_A)` (1.4) | `M_x` on `L²[0,1]`; `diag(q_n)`; `M_x ⊕ diag(2)` at `t = 2`; zero space | `[0,1]`; `∅` (support of `P` would give `[0,1]`); `2 ∉ σ_ac = [0,1]`, model "vectors with nonzero ac part" gives `2`; `∅`; `σ(A_ac) = [0,1] = σ_ac(P_A)`, `σ(A_pp) = {2} = σ_pp(P_A)` | definition discriminates both wrong models | Check added |
| `perfect_acSpectrum_and_mem_iff` (1.4) | `M_x` on `L²([0,1] ∪ [2,3])` at `t = 1`; isolated point; `ℋ = 0` | `f = 1`: ac mass of `(1 − ε, 1 + ε)` is `ε > 0`; isolated `t` forces `μ_f((t−ε,t+ε)) = μ_f({t}) = 0` for ac `f` (other points covered by countably many null intervals); `∅` perfect, both sides false | correct | none |
| `Icc_subset_acSpectrum_iff` (1.5) | `[0,1] ∪ [2,3]` with `(a,b) = (0,1)`, `(1,2)`; `a = b`; fat Cantor `K` | every `J ⊆ (0,1)` has mass `Leb(J) > 0`; `J = (1.2, 1.8)` has mass `0` and `[1,2] ⊄ σ_ac`; `a = b`, `A = 0`: right side vacuous, `{a} ⊄ ∅`; `K^ess` has empty interior | both directions correct; `a < b` needed | route and *Needs* changed |
| `essentialSpectrum` (UO-C02's) | `0` on `ℂ`; `0` on `ℓ²`; `diag(1/n)`; `diag(0,1)` | `∅`; `{0}`; `{0}`; `∅` | agrees with UO-C02's Checks | Check added |
| `minMax_principle` (1.6) | `diag(1,3,5)`; `0` on `ℂ`; `0` on `ℓ²`; `−1 ⊕ H₀`; `M_x` on `L²[0,1]`; `ℋ = 0`; `−diag(n)` | values `1,3,5,⊤,…`, `c = 4`: count `2` = `dim span(e₁,e₂)`, `c = 1.5`: `1`; `μ = 0, ⊤`, `Σ = ⊤`, `c = 1`: `1 = dim ker A`; all `0`, `Σ = 0`; `−1, 0, 0, …`, `c = −1/2`: `1 = dim ker(A + 1)`; all `0 ≤ Σ = 0`; all `⊤`, count `0`; `μ_n = −∞`, `c = 0`: infinite count vs infinite-dimensional eigenspace sum | correct; lower bound needed (last instance) | Lean form and Checks added |
| `pearson_tendsto` (1.9) | `J = 0`; `H₁ = H₂`, `J = 1`; `M_x`, `M_x + c` | limit `0`; limit `x`; `C = c·1` has every singular value `|c|`, gauge `⊤`, excluded, and `e^{itc}x` diverges | correct; trace class needed | none |
| `katoRosenblum` (1.9) | `V = 0`; `H₁ = 0`, `V = 1` on `ℂ`; `H₁ = diag(1/n²)`, `V = −diag(1/n²)`; `M_x`, rank one `V` | limit `x`, `P₂ = P₁`; ac spaces `0`, `y = 0`; `H₂ = 0`, both ac spaces `0`; `σ_ac(H₂) = ℝ` | correct; completeness `‖e^{itH₂}e^{−itH₁}x − y‖ = ‖x − e^{itH₁}e^{−itH₂}y‖` | none |
| `katoRellich_lowerBound_hasCore` (2.3) | `A = 2, V = −1, a = 1, b = 0`; `A = 2, V = −1, a = 0, b = 1/2`; `A = −1, V = −1/2, a = 0, b = 1/2`; `H₀ + cos x` | bound `2 − max(1,1) = 1 = A + V`; `2 − max(0, 1) = 1 = A + V`; `−1 − max(0, 1/2) = −3/2 = A + V`; `C_c^∞` core | bound sharp in all three; Teschl's printed `b/(a − 1)` would give `a|γ| + b` | none |
| `complexLaplacian` (3.1) | `‖x‖²` on `ℝ^d`; `e^{i⟨k,x⟩}`; circle `e^{inθ}` | `−2d` (library sign `+2d`); `−(−‖k‖²cos + i(−‖k‖²sin)) = ‖k‖²e^{i⟨k,x⟩}`; `n²` | sign as the Conventions | name added |
| `gaffney_isSelfAdjoint_closure` (3.6) | `ℝ`; `(0,1)` (incomplete); `∅`; countable discrete set | domain `H²(ℝ)` = maximal domain; `1 ∈ dom Δ_max ∖ dom Δ_F`, so completeness is needed; `L² = 0`; `Δ₀ = 0`, closure `0` on `ℓ²`, maximal domain everything with `w = 0` | correct | Lean form added |
| `exists_mem_domain_closure_eq_zero_iff` (3.7) | `ℝ`; circle; circle ⊔ `ℝ`; two circles; `∅`; dimension `0` | `{0}` both sides; constants; `ℂ·1_{circle}`; dimension `2` (model "constants" gives `1`); `{0}`; all of `ℓ²` | correct | Lean form added |
| Cusp chart, `IsStandardCuspEnd` (3.10) | `⟨z ↦ z + 1⟩\ℍ`, `ℍ_1`, widths `1`, `2`; scaling `(2x, 2y)`; `⟨z ↦ 2z⟩\ℍ` | width `1` chart; `2`-periodic but identifies `(0,y), (1,y)`, rejected for width `2` (periodicity-only model gives area `2`); scaled chart has width `2`, height `2`, area `1`; no chart (no parabolic deck element) | definition determines the end up to the stated area invariant | definition and Check added |
| `Ici_quarter_subset_essentialSpectrum` (3.10) | `‖u_n‖²`, residual; parabolic cylinder | `w n ‖ψ‖²`, ratio `≤ (2|t|‖ψ′‖/n + ‖ψ″‖/n²)/‖ψ‖ → 0`; zero mode is `1/4 − ∂_s²` on `L²(ℝ, ds)`, `σ = [1/4, ∞)` | consistent | Lean form added |
| `schrodinger_isSelfAdjoint_closure` (4.4) | `V = c`; `V = −1_{[−1,1]}`, `d = 1`; `d = 0`; `u = 1_{[−1,1]}`; Gaussian | `H₀ + c`, bound `c`, decay clause applies only at `c = 0`; `σ_ess = [0,∞)`, eigenvalue `−0.454 ≥ −1`; `ℝ⁰`: `σ_ess = ∅`, excluded by `0 < d`; `(1 + ξ²)𝓕u ∉ L²`, not in `H²`; in `H²` | correct | Lean form added |
| Completeness convention | `ℝ`; `(0,1)`; `ℝ ⊔ ℝ`; `(0,1) ⊔ ℝ` | complete; not; complete with `edist = ∞` across; not | equivalent to componentwise completeness | added |
| Stone-group convention | `A = 2` on `ℂ` | `d/dt e^{2it}|₀ = 2i = i • 2`; `e^{−2it}` has generator `−2i = i • (−2)` | `U(t) = e^{itA}` | witness added |
| 1.6 eigenprojection step | `diag(1,3,5)`, `t = 3` | `‖(A − 3)f‖² = 4|f₁|² + 4|f₃|²` vanishes iff `μ_f` carried by `{3}` iff `f ∈ span(e₂)` | correct | added to route |

## Elaboration

`lake env lean packages/SchrodingerOperatorsAndSpectralTypes/Suggested.lean`, run from the content
checkout: exit 0, exactly 11 warnings, all `declaration uses 'sorry'` (one per theorem), no other
message. The first line is `module`, then the single `import Mathlib` and 11 `TauCeti.*` modules,
all used and all with object files at the pinned Tau Ceti.

## Dependency check

```
depcheck: 244 roadmaps, 2240 edges, 0 problem(s)
```

No UPWARD, CYCLE or moved line: the merge order already places this roadmap right after its last
supplier, QuantumFoundations.

## Sources

No new source was fetched and no `needs-references.toml` was written. `sources.toml`: `cited_for`
of `lp80`, `iwaniec02`, `lp76` now name Downstream consumers (the folded motivation section);
`kps26`, `hm23` add Downstream consumers; `rs2`, `kato57` add Conventions, where they were already
cited. No passage of a source is copied into any file.

## Untrusted text

Nothing read in issues, pull requests, roadmap texts or sources asked for an action; nothing
suspicious to report.
