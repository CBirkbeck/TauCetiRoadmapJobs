# PORT-SchrodingerOperatorsAndSpectralTypes

Port of the accepted package `packages/SchrodingerOperatorsAndSpectralTypes` into
`TauCetiRoadmap/SchrodingerOperatorsAndSpectralTypes/{README.md,Suggested.lean,metadata.toml}`.

- Branch: `roadmap/schrodinger-operators-and-spectral-types`, created from main `51d880d`.
- Head commit: `9710150` — "SchrodingerOperatorsAndSpectralTypes: roadmap (README, Suggested.lean, metadata)".
- Files: exactly the three files of the folder; nothing outside it is touched.

## Build

`lake build TauCetiRoadmap.SchrodingerOperatorsAndSpectralTypes.Suggested` on the committed head:

    Build completed successfully (18552 jobs).

12 warnings, all `declaration uses 'sorry'` (lines 87, 113, 123, 154, 173, 194, 218, 248, 275, 301,
354, 380: one per theorem); no other warning and no error.

## Gate

    gate SchrodingerOperatorsAndSpectralTypes: set_option=0 blob=0 latex=0 tex=0 prnum=0 sorry-data=0 sorry-examples=0 residue=0 private-paths=0 imports=0 mathlib-subimports=0 no-import-mathlib=0 lean-lines=0 statement-hygiene=0 forbidden=0 dropped=0 readme-ids-missing=0 empty-sections=0 round-labels=0 long-fences=0 layer-ids=0 target-ids=0 depcheck=0 metadata=0 stray-files=0 dirty=0 outside-folder=0 source-material=0 OK

## Dependency check

    depcheck: 237 roadmaps, 2238 edges, 0 problem(s)

No UPWARD, CYCLE or `moved:` line. In the merge order this roadmap is at line 225, directly after
QuantumFoundations (224), its latest supplier.

## Draft pull request body

This roadmap develops the spectral theory that Schrödinger operators need and applies it to the
two settings where those operators live: the Laplace–Beltrami operator of a complete Riemannian
manifold and `−Δ + V` on `L²(ℝ^d)`. Its first layer turns the spectral types of an arbitrary
self-adjoint operator into statements about the Lebesgue decomposition of every vector spectral
measure. It defines the absolutely continuous, singular continuous and pure point spectra, shows
that `σ_ac` is a perfect set characterised by local absolutely continuous mass, and proves the
interval criterion for `[a, b] ⊆ σ_ac`. It then proves the min–max principle below the essential
spectrum, the abstract wave operators, Pearson's theorem (with two Hilbert spaces) and the
Kato–Rosenblum theorem. None of this assumes separability. The second layer adds the lower bound
and the core clauses that bounded and Kato–Rellich perturbations preserve. The third layer goes
on every Riemannian manifold from the Laplacian on `C_c^∞` to its minimal and maximal operators and
its Friedrichs extension. It proves the theorem of Gaffney, Chernoff and Strichartz (on a complete
manifold, possibly disconnected and of any dimension, the Laplacian is essentially self-adjoint
with the maximal domain), describes the `L²` kernel and the bottom of the spectrum, treats bounded
potentials, and shows that a hyperbolic cusp end forces `[1/4, ∞) ⊆ σ_ess`. The fourth layer takes
the free Laplacian from QuantumFoundations, identifies its form domain and its essential spectrum
`[0, ∞)`, and proves that `−Δ + V` with a bounded real potential is self-adjoint on `H²(ℝ^d)` in
every dimension `d ≥ 1`. That operator is bounded below by `ess inf V`, essentially self-adjoint on
`C_c^∞` and on Schwartz space, and has essential spectrum `[0, ∞)` when `V` vanishes at infinity.
The roadmap builds on UnboundedOperators' type decomposition, essential spectrum and closed forms
and on SelfAdjointSpectralTheory's spectral measure without restating them. It extends the
three-dimensional `L² + L^∞` case of UnboundedOperators and the congruence-surface case of
CongruenceSpectralGap to the general statements. Its vocabulary (spectral types, wave operators,
the self-adjoint Laplacian of a complete manifold and the cusp threshold) is what scattering
theory, the spectral geometry of noncompact manifolds and the spectral theory of hyperbolic
surfaces consume. `Suggested.lean` states twelve headline theorems against the pinned Mathlib and
Tau Ceti; its docstring names the three clauses that are not statable at the pins (the manifold
`H¹` form domain, the free Laplacian's form domain, and the identification on closed manifolds
with RiemannianGeometry R5c's operator).

## Roadmaps this one depends on that are still pull requests

- **QuantumFoundations** (§8.2, the free Hamiltonian on `H²(ℝⁿ)`; §9.5 in Scope): a supplier of
  Layer 4. Read at its head: §8.2 states self-adjointness, both cores, the Fourier intertwining,
  the spectral-measure density and `σ = σ_ac = [0, ∞)`, `σ_sc = σ_pp = ∅`, as the contract says.
- **AutomorphicSpectralTheory** (§0.8 `hilbert_schmidt_kernel`, a supplier of 4.3; §1.16a and
  §§4.1–4.4 in Scope, Downstream consumers and Layer 3 Examples). Its head is not among the 231
  listed checkouts; I read it with `roadmaps show AutomorphicSpectralTheory` and found §0.8,
  §1.16a and §§4.1–4.4 with the content cited.
- **CongruenceSpectralGap** (§0.2, §0.6): cited in Scope, Layer 3 Examples and Downstream
  consumers. §0.2 states Gaffney's argument on `Γ(N′)\ℍ` and that the kernel is the constants;
  §0.6 states the congruence spectral description.
- **MaassForms** (§0.1): cited only in the Conventions, for the sign of the hyperbolic Laplacian
  (positive convention, `−y²(∂ₓ² + ∂ᵧ²)`), confirmed at its head.

All four are earlier in the merge order (104, 167, 168, 224).

The open revision of OperatorTheory (SelfAdjointSpectralTheory, BanachSpaceTheory, MorseNovikov)
renumbers SelfAdjointSpectralTheory, but its "Former SA numbering" table maps every SA id this
README cites (B44, B45, B85, C12, C14, C15, C19, C25, C28, C39, C44, C52, C54, C86, D02, D12,
D18, D22, E01, E05, E08, E09, E11, E13, E26, E29, E30, E44, E47; C14 and C52 through the range
rows C13–C15 and C52–C53). Its BanachSpaceTheory keeps B4 (Layer 4, with the compact Schmidt
series). So the citations stay valid, and that revision is not a dependency.

## What moved from the Lean to the README

Nothing moved. The package's `Suggested.lean` already has the required form, and I kept it byte
for byte: one module docstring naming the three clauses that are not statable and the carrier
each lacks, 12 headline theorems, and 7 definitions with real bodies, each needed by a headline
(`IsSpectralMeasureOf`, `acSpectrum`, `essentialSpectrum`, `minMaxValue`, `complexLaplacian`,
`cuspRegion`, `IsStandardCuspEnd`). It has no sorry'd data, no `set_option`, no `lemma`, no
example and no padding, and imports `import Mathlib` plus 11 `TauCeti.*` modules, each present
at the pin and used.

No headline was missing. I checked each Summary clause against the file:
- Layer 1: Lebesgue decomposition, `σ_ac`, interval criterion, min–max, Pearson, Kato–Rosenblum.
- Layer 2: lower bound and cores.
- Layer 3: Gaffney, the kernel, bounded potentials, the cusp threshold.
- Layer 4: `−Δ + V` on `ℝ^d`, whose case `V = 0` gives `σ_ess(H₀) = [0, ∞)`.

The 2.1 infimum formula, the two-sided min–max bound of 3.9 and the abstract wave-operator API of
1.7 are corollaries or API, not headlines, and stay README targets.

## Supplier replacements and duplication removals

- **Bounded Kato–Rellich is at the Tau Ceti pin.** `LinearPMap.isSelfAdjoint_perturb_bounded`
  (`TauCeti/Analysis/InnerProductSpace/LinearPMap/Constructions.lean` line 75) proves that `T +ᵥ A`
  is self-adjoint for self-adjoint `A` and bounded self-adjoint `T`. That is SelfAdjointSpectralTheory
  SA-C54, which the open revision also maps to this declaration. Changes:
  - Scope and ownership: the bounded Kato–Rellich theorem moves from "Stated by
    SelfAdjointSpectralTheory" to "Already in the library", under its pin name with SA-C54.
  - The From Tau Ceti contract gains an entry stating the declaration's hypotheses and form.
  - §2.2 names it at the claim.
  - The *Needs:* lines of 1.9 (Kato–Rosenblum), 2.2, 3.9 and 4.4 add it.

  Nothing in the README restated it, so nothing was deleted.
- **No other restatement found.** At the pins there is:
  - no essential spectrum, absolutely continuous spectrum, wave operator, Weyl criterion, form
    domain or square root of an unbounded operator;
  - no spectral measure of an unbounded self-adjoint operator (only matrix spectral measures);
  - no manifold `H¹` space: `TauCeti/Geometry/Manifold/Riemannian/Sobolev.lean` has the Sobolev
    inequality only;
  - no core-transfer or lower-bound clause of Kato–Rellich: `KatoRellich.lean` has
    `surjective_pairShift_add` and `add_of_isRelativelyBounded`, and `GraphCore.lean` has three
    core lemmas, none of them a transfer.
- **Duplication sweep by object** with `roadmaps grep` over main and every open head:
  - Kato–Rosenblum, Glazman, "Friedrichs Laplacian": no hit anywhere.
  - "wave operator": only RelativisticQuantumFieldTheory's Haag–Ruelle wave operators and
    factorizations of the wave operator `□`, which are different objects.
  - Pearson: only statistics roadmaps (χ², Neyman–Pearson).
  - Gaffney: CongruenceSpectralGap §0.2 (the `Γ(N′)\ℍ` case, cited) and SobolevDifferentialForms
    §7.1 (the Gaffney identity for forms on a cube, a different statement).
  - "essentially self-adjoint": UnboundedOperators (Nelson and analytic vectors, UO-E06 on `ℝ³`,
    both cited) and GeometricQuantization (first-order flow operators on half-densities).
    NoncompactQuantumSymmetry, SpectralManifolds, CompactQuantumMetricSpaces,
    RelativisticQuantumFieldTheory and MixedHodgeModules contain no Laplacian on a complete
    manifold.
  - "absolutely continuous spectrum": QuantumFoundations §8.2, CongruenceSpectralGap §0.6 and
    MaassForms, all cited as owners of their special cases.
  - "min–max principle": OperatorIdeals (singular values), RiemannianGeometry R5c and
    VariationalMethods 4.4 (compact case), all cited in Scope as different statements.
  - "Schrödinger operator": RiemannianGeometry R5b/R5c and MinimalSurfaces (compact manifolds;
    R5c cited), and the Heisenberg "Schrödinger representation" operators of HeisenbergImprimitivity
    and MetaplecticAutomorphicFormsPartII, which are a different object.
  - "cusp end": AnalyticNumberTheoryPartI, ConformalMappingPartII, GeometricTopology,
    ModularCurvesPartII, FuchsianOrbifoldsPartII and AutomorphicSpectralTheory use the phrase;
    none defines a cusp chart into an arbitrary Riemannian surface. The pinned
    `TauCeti.Subgroup.CuspDatum.horodisc` is the Fuchsian-group notion that FuchsianOrbifolds
    Layer 3 cites.

  Nothing has two owners. This roadmap owns the general statements: every self-adjoint operator
  and every normalized projection-valued measure in Layer 1, every complete manifold in Layer 3,
  bounded potentials in every `d ≥ 1` in Layer 4. The suppliers own the special cases (UO-E06 on
  `ℝ³`, CongruenceSpectralGap §0.2 on `Γ(N′)\ℍ`, QuantumFoundations §8.2 for `H₀`). No fully
  qualified name of `Suggested.lean` is declared by another roadmap: `essentialSpectrum` is
  defined in UnboundedOperators' namespace there and in this roadmap's namespace here, and the
  README says that UO-C02 owns the object.
- **Ownership against open pull requests** was checked through the brief's tool for all 447 open
  heads (`roadmaps grep`, `roadmaps show`), not only through the 231 listed checkouts.

## Fixes made in the upstream-reviewer reading

- **§3.4, third Check (the form `𝔞`).** It read "`𝔞(iu, iu) = 𝔞(u, u)` and
  `𝔞(u, iv) = i𝔞(u, v)`: the form is conjugate-linear in the first slot". The witness tests the
  second slot and does not show conjugate-linearity in the first. It now computes
  `𝔞(iu, v) = −i𝔞(u, v)` and `𝔞(u, iv) = i𝔞(u, v)`, and names the wrong model it excludes: a form
  linear in the first slot, which gives `i𝔞(u, v)` and is not the form of `Δ₀` under
  `⟪u, Δ₀v⟫ = 𝔞(u, v)`.
- **Supplier precision.** The bounded Kato–Rellich theorem is now cited at the pin (above).

I read the rest of the README end to end and recomputed every Check and route computation listed
in the table below. Nothing else is wrong, vacuous or unsourced. Process words, LaTeX,
pull-request numbers and machine paths: 0 hits (the only "round" is "Round `S²`").

## Signature check (`#check @name`)

I appended `#check @name` for the 19 declarations, 87 pinned library names backticked in the
README and three related pin names to a temporary copy of `Suggested.lean` with 15 more `TauCeti.*`
imports. I elaborated it once with the build command and restored the file; `cmp` shows it is
identical to the package's.

- All 106 `#check`s elaborated, with no error.
- Four further names live in modules with no compiled object at the pin, so I confirmed them at
  their source lines instead:
  - `IsSelfAdjoint.hasCompactResolvent_iff_isCompactOperator_resolvent`, `CompactResolvent.lean`
    line 69;
  - `IsSelfAdjoint.exists_hilbertBasis_forall_apply_eq_smul_of_hasCompactResolvent`,
    `Eigenbasis.lean` line 113;
  - `ContinuousLinearMap.isCompactOperator_of_hilbertSchmidtEnergy_ne_top`, `Columns.lean`
    line 257;
  - `TauCeti.Wkp`, `TauCeti/Analysis/Sobolev/Wkp/Basic.lean`.
- The same copy checked by `rfl` that the Riemannian metric found on `cuspRegion a` is
  `TauCeti.Manifold.instRiemannianBundleOpen (cuspRegion a)`, the restriction of the
  upper half-space's hyperbolic metric (`UpperHalfSpace/Basic.lean` line 343). So
  `IsStandardCuspEnd` really uses `(dx² + dy²)/y²`.
- The 19 elaborated types are identical to the worker's `signatures.md`. Each matches its README
  statement binder for binder:
  - `[CompleteSpace H]` wherever a projection-valued measure or self-adjointness occurs;
  - `[I.Boundaryless]`, `[CompleteSpace M]`, `[SecondCountableTopology M]`,
    `[IsRiemannianManifold I M]`, `[BorelSpace M]` and `IsManifold I ∞ M` on the four manifold
    theorems;
  - `0 < d` and `MemLp V ⊤` in `schrodinger_isSelfAdjoint_closure`, whose domain clause
    elaborates through `Lp.toTemperedDistribution`.

No binder is lost and nothing changed.

## Adversarial pass

Values recomputed in this pass. "README" rows test the prose targets, "Lean" rows the declarations.

| Statement | Instances tried | Values computed on each side | Result | Change |
|---|---|---|---|---|
| `IsSpectralMeasureOf` (1.1, Lean) | `A = 2` on `ℂ`, `z = i`, `P = δ₂`, `δ₃`; `A = i` at `z = 2i` | `(i−2)⁻¹ = (−2−i)/5` both sides for `δ₂`; `δ₃` gives `(−3−i)/10`; for `A = i` the left side is `−i` (Im `−1`), the right side has Im in `[−1/2, 0)` | determines `P`; kernel sign pinned; no `P` for non-self-adjoint `i` | none |
| Laws of `μ_f` (1.1) | `diag(1,2)`, `f = (1,i)`, `g = 3·1_{2}`; `A = 0` on `ℂ²`, `f = h = (1,0)` | `μ_f = δ₁+δ₂`, `g(A)f = (0,3i)`, `μ = 9δ₂ = μ_f.withDensity|g|²` (`|g|` gives `3δ₂`); `μ_{f+h} = 4δ₀ ≠ 2δ₀` | orthogonality hypothesis needed | none |
| `diag_spectralType_components` (1.2, Lean) | arbitrary decomposition; `M_x ⊕ ½`, `f = (1,1)`; `H = 0` | cross terms `|⟪P(B)f_i, P(B)f_j⟫|² ≤ μ_i(B)μ_j(B)` vanish on disjoint carriers (Leb-null countable set; atomless sc gives `μ_sc(S) = 0`); atoms of `μ_f` = atoms of `μ_pp`; example parts `Leb|[0,1]`, `δ_{1/2}`, restriction to atoms `δ_{1/2}` | holds without separability | none |
| Lebesgue orientation (Conventions) | `μ = 2·Leb|[0,1]` | `Leb.withDensity(rnDeriv) = 2·Leb|[0,1]`; reversed `μ.withDensity(...) = 4·Leb|[0,1]` | Mathlib's `singularPart_add_rnDeriv` orientation | none |
| 1.3 reduced restriction | `diag(1,2,3)`, `U = span(e₁,e₃)`; `U = 0`; `U = ℋ` | `σ(A|_U) = {1,3}` (unrestricted model `{1,2,3}`); `∅`; `σ(A)` | holds | none |
| `acSpectrum`, `perfect_acSpectrum_and_mem_iff` (1.4, Lean) | `M_x` on `L²[0,1]`; `diag(q_n)`; `M_x ⊕ diag(2)` at `t = 2`; `H = 0` | `[0,1]`; `∅` (wrong model `σ ∖ σ_p` gives `[0,1]∖ℚ`); `2 ∉ σ_ac` while the vector-with-ac-part model admits it via `f = (1,1)`; `∅` and `Perfect ∅`; an isolated `t` impossible: `μ_f(I_ε∖{t}) > 0` gives a support point `s ≠ t` within `ε`; `⇐` via `g = P(N^c)f`, `N` a Leb-null carrier of the singular part | holds both ways | none |
| Essential closure (1.4) | `[0,1] ∪ {2}`; `ℚ`; `(0,1)` | `[0,1]`; `∅` vs `closure ℚ = ℝ`; `[0,1]` | holds | none |
| `Icc_subset_acSpectrum_iff` (1.5, Lean) | `M_x` on `L²([0,1]∪[2,3])`; `a = b`; fat Cantor `K` | `[0,1] ⊆ σ_ac`, `J = (1.2,1.8)` has mass `0`; `a = b` makes the right side vacuous while `{a} ⊄ σ_ac(0) = ∅` (excluded by `hab`); `K^ess` contains no interval | holds | none |
| `essentialSpectrum` (Lean) | `0` on `ℂ`; `0` on `ℓ²`; `diag(1/n)`; `diag(q_n)` | `∅`; `{0}`; `{0}`; `ℝ`; body equals UnboundedOperators' `spectrum ∖ discreteSpectrum` (its `Suggested.lean` lines 168–178) | same set | none |
| `minMaxValue`, `minMax_principle` (1.6, Lean) | `diag(1,3,5)`; `H = 0`; `0` on `ℓ²`; `−diag(n)`; `−1 ⊕ H₀`; Neumann ≤ Dirichlet on `(0,1)` | `1, 3, 5, ⊤`; at `c = 4` count `2` = `finrank(ker(A−1) ⊕ ker(A−3)) = 2`, at `c = 3` `1 = 1`; zero space: all `⊤`, count `0 = finrank ⊥`; `0` on `ℓ²`: `Σ = 0`, `c < 0`: `0 = 0`; `−diag(n)`: every `μ_n = −∞`, excluded by `hγ`; `μ₁ = −1`, `μ_n = 0`; `(n−1)²π² ≤ n²π²` | holds; below `Σ` the eigenspace sum is finite-dimensional, so no junk `finrank` | none |
| Form-order corollary (1.6) | `diag(1,3) ≤ diag(2,4)`; `N ≤ D` on `(0,1)` | `1 ≤ 2`, `3 ≤ 4`; `μ₁(D) = π² > 0 = μ₁(N)` refutes a common-domain-only order | holds | none |
| 1.7 wave operators, Hardy-space remark | `H₁ = H₂`; `0`, `1` on `ℂ`; `M_x`, `M_x + c`; Hardy space `H²₊` under `e^{−isx}` | `Ω = 1`; `D = 0`; `e^{itc}` diverges; `e^{−isx}e^{2πixξ} = e^{2πix(ξ − s/2π)}` keeps `ξ ≥ 0` iff `s ≤ 0` | holds | none |
| Rosenblum's lemma (1.8) | `M_λ`, `x = m1_{[0,1]}`, rank-one `C`; `x = |λ|^{−1/4}1_{[−1,1]}`; `V = diag((−1)^{n+1}/n²)` | `∫|⟨φ,e^{−itλ}x⟩|²dt = 2πm² = 2πm²‖C‖²_HS` (equality; no-`2π` model fails); truncation error `∫_{|λ|<m^{−4}}|λ|^{−1/2} = 4/m²`; `HS(|V|^{1/2}) = Σ1/n² = π²/6 = ν(V)` | holds | none |
| `pearson_tendsto` (1.9, Lean) | `J = 0`; `J = 1`, `C = V`; inclusion `L²(ℝ) → L²(ℝ)⊕ℂ`, `H₂ = M_x ⊕ 5`; `M_x + c` | limit `0`; hypothesis `⟪(H₁+V)ψ,φ⟫ − ⟪ψ,H₁φ⟫ = ⟪ψ,Vφ⟫`; `C = 0`, `W(t)x = (x,0)`; `C = c·1` has gauge `∞`, excluded; sign `U₂ t (J (U₁ (−t) x)) = e^{itH₂}Je^{−itH₁}x` with generator `i • H` | holds | none |
| `katoRosenblum` (1.9, Lean) | `V = 0`; `diag(1/n²)`, `V = −diag(1/n²)`; `diag(1,2)` | `y = x`; no ac vectors, `∅ = ∅`, `D_± = 0` (no `e^{−it/n²}c_n` converges); `W_± = 0` while `Ω_± = 1` (theorem stated for the compressed operator) | holds | none |
| Weak-vs-strong (1.9 Check) | `M_x`, `2M_x`, `x = 1_{[0,1]}` | `⟪x, e^{itx}x⟫ = (e^{it}−1)/(it) → 0`, norm `1` | not convergent; outside both theorems | none |
| 2.1 bottom of spectrum | `H₀ + c` with Gaussians `e^{−πx²/n²}`; `ℋ = 0`; `M_x`; `2` on `ℂ` | `‖u‖² = n/√2`, `‖u′‖² = π/(n√2)`, quotient `c + π/n²`; junk `inf ∅`; not bounded below; `γ ≤ 2` | holds | none |
| 2.2 bounded perturbation | `diag(0,1) + diag(1,−1)`; `V = c` | `λ₀ = 0 ∈ [−1,1]`; equality `λ₀ + c` | holds | pin name cited |
| `katoRellich_lowerBound_hasCore` (2.3, Lean) | `sup_{s≥γ}|s|/(s−μ)` for `γ ≥ 0`, `γ < 0`, `μ ≶ 0`; scalar `A = λ ≥ γ`, `V = −(a+b|λ|)`; `a = b = 0`; `b = 1` | `max(1,|γ|/d)` in all cases; `a/d + b·max(1,|γ|/d) < 1` iff `d > max(a/(1−b), a+b|γ|)`; `λ − b|λ|` nondecreasing so min `γ − a − b|γ|`; bound `γ`; `H₀ − H₀ = 0` on `H²` not closed | holds; Kato's form | none |
| Resolvent sign (Conventions, 2.3 Check) | `A = 2`, `V = 1`, `μ = 0` | `R_A(0) = −1/2`; `(1 − V R_A(0))A = 3 = A + V`; plus sign gives `1` | pinned | none |
| Laplacian sign (Conventions) | `‖x‖²` on `ℝ^d`; `yˢ` on `ℍ`; `e^{−π‖x‖²}` | `−2d`; `−y²·s(s−1)y^{s−2} = s(1−s)yˢ`, `s = ½+it` gives `¼ + t²`; `Σ∂ⱼ²u = (4π²‖x‖² − 2πd)u` | pinned | none |
| `complexLaplacian`, Green (3.1, Lean) | `e^{inθ}` on the circle; pairing | `2πn² = 2πn²`, unconjugated model gives `0`; `(a−ib)(c+id) = ac+bd + i(ad−bc)` matches the stated pairing | holds | none |
| Initial/maximal operators (3.2–3.3) | `(0,1)`; `e^{−|x|}` on `ℝ`; `χ/|x|` on `ℝ³` | `e^{±x} ∈ ker(Δ_max + 1)`; `−u″ = −u + 2δ₀`; `+4πδ₀` (Mathlib sign `−4πδ₀`) | holds | none |
| Energy form (3.4) | `(0,1)`; `𝔞(iu, v)` | Dirichlet `n²π²`, `n ≥ 1`, Neumann `n ≥ 0`; `𝔞(iu,v) = −i𝔞(u,v)`, `𝔞(u,iv) = i𝔞(u,v)` | holds | Check reworded |
| Cutoffs (3.5) | gradient bound; `(0,1)`; step thresholds | `|∇χ_k| ≤ 2·(1/k + 1/k) = 4/k`; `1 ≤ (4/k)(1/2)` fails for `k > 2`; `1 = ∫_{1/4}^{3/4}φ′ ≤ ½ sup|φ′|` forces `φ′ ≡ 2`, impossible; `1/8`, `7/8` give slope `4/3 < 2` | holds | none |
| `gaffney_isSelfAdjoint_closure` (3.6, Lean) | flat `ℝ^d`; `ℝ⁴∖{0}`; `(0,1)`; dimension `0` | `H₀`; `∫_{|x|<1}|x|^{−4} = ∞` in `ℝ⁴`; `1 ∈ dom Δ_max ∖ dom Δ_F`; counting measure, `Δ = 0` | completeness sufficient, needed for `(0,1)` | none |
| `exists_mem_domain_closure_eq_zero_iff` (3.7, Lean) | `ℝ`; circle; point; `⊔_ℕ S¹`; `M = ∅`; incomplete `(0,1)` | `0`; constants; `ℂ`; `‖Σc_j1_j‖² = 2πΣ|c_j|²`, Hilbert dimension `ℵ₀`, Hamel `2^ℵ₀`; `0 = 0`; `1` locally constant but not in the minimal domain (completeness needed) | holds | none |
| `λ_k`, `λ₁⁺` (3.7) | circle; `ℝ`; point; flat torus `ℝ²/ℤ²`; `⊔ S¹` | `λ₁ = λ₂ = 1` vs R5c `μ₂ = μ₃ = 1`; `λ₁⁺ = 0 = λ₁`; `+∞`; `4π²` ×4; `λ₁⁺ = 1 ≠ 0 = λ₁` | connected finite volume needed | none |
| Compact case (3.8) | `S²`; `N` points; `∅`; circle complexification | `l(l+1)` with multiplicity `2l+1`; `λ_k = 0` for `k < N`, `+∞` after; `σ = ∅`, `λ₀ = +∞`; real span(`cos`,`sin`) and complex span(`e^{±iθ}`) both dimension `2` | holds | none |
| `laplacian_add_potential_isSelfAdjoint_closure` (3.9, Lean) | `V = c`; circle, `V = 1`; `V = 1_{[0,π)}`; one point, `s = 1`; `V = −x⁴` | `σ + c`; `n² + 1`; Rayleigh quotient of `1` is `1/2`, smooth eigenfunction forces `u(0) = 0`, `(1−λ)u′(0) = −λu′(0)`, so `u = 0`; `T = i`, `T* = −i`, `T − T* = 2i = 2i·TT*`, `i + i⁻¹ = 0`; limit circle (unbounded `V` excluded) | holds | pin name cited |
| `cuspRegion`, `IsStandardCuspEnd` (3.10, Lean) | metric instance; width-`2` reading of `⟨z ↦ z+1⟩\ℍ`; scaling `(2x,2y)` | `rfl` to the restricted hyperbolic metric; identifies `(0,y)`, `(1,y)` with `1 ∉ 2ℤ`, rejected; `(d(2x)²+d(2y)²)/(2y)² = (dx²+dy²)/y²`, area `w/a = 1` both ways | definition determines the end | none |
| `Ici_quarter_subset_essentialSpectrum` (3.10, Lean) | `u_n = y^{1/2+it}ψ((log y − n)/n)` | `−y²∂ᵧ²(y^{1/2}f) = y^{1/2}(¼ − ∂_r²)f`; `‖u_n‖² = wn‖ψ‖²`; residual `−e^{itr}(2itψ′/n + ψ″/n²)`; supports `(2^{j+1}, 3·2^j)` disjoint since `3·2^j < 2^{j+2}`; `ψ = 0` gives no unit vector; `y^s ∈ L²` iff `Re s < ½` | holds | none |
| Layer 3 Examples | `Γ(2)`; `Γ₀(2)` elliptic element | index `6`, area `6·π/3 = 2π`; `[[1,−1],[2,−1]]` has det `1`, trace `0`, fixes `(1±i)/2` | holds | none |
| `H²` norm comparison (4.1) | `e^{−πx²}`; `1_{[−1,1]}` | `‖u‖² = 2^{−1/2}`, `‖u″‖² = 3π²/√2 = (4π²)²·3/(16π²√2)`; `𝓕u = sin(2πξ)/(πξ)`, `u″ = δ′_{−1} − δ′_1` | `4π²` pinned | none |
| Free Laplacian (4.2) | spectral density at `d = 1`; form of `e^{−πx²}`; `d = 0` | `e^{−λ/2π}/(2π√λ)`, mass `2^{−1/2}`, equal to QuantumFoundations §8.2's density at `n = 1`; `q = π/√2`, `‖u‖² = 1/√2`; `σ_ess = ∅` at `d = 0` | `d ≥ 1` needed | none |
| Vanishing at infinity, compactness (4.3) | sums; `1_{⋃[n,n+n^{−2}]}`; `V = 1`; resolvent change at `s = 0, 1` | radius `max(1, √(ε^{−2}−1))`; not vanishing; `σ((H₀+1)⁻¹) = [0,1]` uncountable; both sides `i` and `(1+i)/2`, bracket modulus `(s+1)/√(s²+1) ≤ √2`, sign slip gives `2 − i`; pin identity `R(−1) − R(i) = (1+i)R(−1)R(i)` gives the displayed formula | holds | none |
| `schrodinger_isSelfAdjoint_closure` (4.4, Lean) | `V = c`; `d = 1`, `V = −1_{[−1,1]}`; `d = 3`, `V = 1_{B_1}`; `d = 4`, `V = cos x₁` | `σ = [c,∞)`, `c = 1` not vanishing, `σ_ess = [1,∞)`; `k = 0.739`: `k tan k = 0.673`, `κ = √(1−k²) = 0.674`, `E = −0.454 ∈ [−1,0)`; `σ = [0,∞)`; `σ ⊆ [−1,∞)` (UO-E06 needs `d = 3`) | holds | none |
| Quasi-periodic potentials (4.5) | `cos x + cos √2x`; non-symmetric coefficients; non-linear frequencies | `|V| ≤ 2`, infimum `−2` not attained (`√2` irrational); `2i cos x` and `(e^{ix} + e^{2ix})/2` not real | hypotheses needed | none |

## Unresolved

- **The two declared supplier gaps stay as supplier contracts**, as the accepted review's
  conditions say, in the main-branch "What X must provide (gap:…)" form (AdicSpacesPartV,
  YangMillsConnectionsAndCaloricGauge and AlgebraicModuliForArithmeticGeometryPartII use the same
  form):
  - `gap:weyl-criterion`: UnboundedOperators §3.2 cites Weyl's criterion (Lemma 6.17) in its route
    but does not state it.
  - `gap:spectral-integral-resolvent`: UO-A02 proves the resolvent formula only for the spectral
    measure of a given operator.
- **`roadmaps resolve` did not check Lean names outside TauCetiRoadmap** (it reports "no pinned
  Lake packages on this host"). I checked them myself, as above.
- **The accepted review's notes for the human reviewers** concern the licences of `teschl` (author
  page) and of `kato57`, `rosenblum57` and `lp80` (publisher-open copies). They are unchanged and
  out of the port's scope.
- **Suspicious text: none.** I found no instruction-like text in the package, the reports, the
  other roadmaps or the tool output.


Pull request: #2424 (roadmap/schrodinger-operators-and-spectral-types at 9710150)
