# PORT-GaloisActionOnEtaleCohomology

- Branch: `roadmap/galois-action-on-etale-cohomology`, from `45f58db`.
- Head commit: `14c3a342` — `GaloisActionOnEtaleCohomology: roadmap (README, Suggested.lean, metadata)`.
- Files: `TauCetiRoadmap/GaloisActionOnEtaleCohomology/README.md`, `TauCetiRoadmap/GaloisActionOnEtaleCohomology/Suggested.lean`, `TauCetiRoadmap/GaloisActionOnEtaleCohomology/metadata.toml`. Nothing outside the folder changed.

## Build

`lake build TauCetiRoadmap.GaloisActionOnEtaleCohomology.Suggested`:

    warning: TauCetiRoadmap/GaloisActionOnEtaleCohomology/Suggested.lean:120:8: declaration uses `sorry`
    Build completed successfully (18239 jobs).

One warning, the `sorry` of `exists_galois_continuousAut_equiv`. (Without the `module` line, Lake adds a second warning, "imports `Mathlib` … designed for use with the module system". So the file keeps the package's `module` / `import Mathlib` header, a form 22 roadmaps on main also use.)

## Gate

    gate GaloisActionOnEtaleCohomology: set_option=0 blob=0 latex=0 tex=0 prnum=0 sorry-data=0 sorry-examples=0 residue=0 private-paths=0 imports=0 mathlib-subimports=0 no-import-mathlib=0 lean-lines=0 statement-hygiene=0 forbidden=0 dropped=0 readme-ids-missing=0 empty-sections=0 round-labels=0 long-fences=0 layer-ids=0 target-ids=0 depcheck=0 metadata=0 stray-files=0 dirty=0 outside-folder=0 source-material=0 OK

Dependency check (`gate --depcheck … --movable`):

    depcheck: 220 roadmaps, 1955 edges, 0 problem(s)

No UPWARD, CYCLE or `moved:` line. This roadmap is line 121 of `merge-order/ORDER.txt`.

`roadmaps resolve` on the final README found no cross-roadmap citation and no Lean name missing. The tool did not check Lean names outside TauCetiRoadmap ("no pinned Lake packages on this host"), so I checked every Mathlib and Tau Ceti name by hand in this worktree's `.lake/packages` at the manifest pins (Mathlib `1b1ccf4b`, Tau Ceti `2fd255d9`). All exist at the cited file and line.

## Draft pull request body

This roadmap constructs the action of the absolute Galois group on the étale cohomology of geometric fibres, in two settings: rigid spaces over any complete non-archimedean field `K`, of any characteristic, and schemes over any field. It also supplies the rules that make the action usable. Many arithmetic roadmaps write `H^i(X_C, ℤ_ℓ(j))` "with its Galois action" and leave the action implicit. Here it is explicit, `ρ(σ) = c_σ ∘ σ_X^*`. The first step identifies `G_K` with the continuous `K`-automorphisms of the completed algebraic closure `C`, with a jointly continuous action. The roadmap then proves functoriality (pullbacks, sheaf maps, connecting maps, cup products, restriction to open subgroups, change of algebraic closure). It proves discreteness and the dictionary with higher direct images to the base point. It identifies the Hochschild–Serre `E_2` term and shows agreement with the scheme-side adic action and its Frobenius normalisation. Finally it treats the `ℓ`-adic and rational groups as continuous representations, equivariant twisting, the equivariant comparison with analytifications, and the passage from finiteness to finitely generated and finite-dimensional continuous representations. `Suggested.lean` states the first end theorem, `G_K ≅ Aut_cont(C/K)` with joint continuity, against the pinned Mathlib. Its docstring names each other end theorem and the carrier it lacks at the pins (chiefly the étale site of an adic space and the functoriality of small étale sites of schemes).

## Dependencies that are still pull requests

Cited as suppliers, all earlier than this roadmap in the merge order:

- ClassicalAdicEtaleCohomology (§§1.1, 1.3, 1.4, 1.5, 7.1, 8.2, 8.4, 9.7, 10.4, 11.1, 11.2, and the declared gap `gap:proper-rigid-finiteness`);
- ArithmeticGaloisRepresentations (§§1.1, 1.2);
- AInfCohomology (§AI.3.1);
- PadicDifferentialEquationsAndRigidCohomology (§RD.0.33).

Cited only in Scope and in Checks, also earlier in the merge order: PadicPeriodRings (§1.1, §2) and DiamondsAndVStacks (§D6.7).

Suppliers on main: AdicEtaleGeometry, AdicSpacesPartII, AdicSpacesPartIV, SchemeAndStackFoundations, EtaleCohomologyFoundations, EnhancedDerivedSheaves, ProfiniteCohomology.

Open revisions of suppliers on main, checked at their heads: EnhancedDerivedSheaves #1330 and #1630, SchemeAndStackFoundations #1808, EtaleCohomologyFoundations #1891. They keep every cited id (§§0.1–0.4; §§0.23a, 1.10, 2.1, 2.2, 2.15, 2.16; §§F.0.3–F.10.2). #1630 italicises the label `ClassicalDerived.inverseLimits.moduleComparison`, so the README refers to `ClassicalDerived.inverseLimits`, which is backticked in every version. `scratch/overlaps.md`: no other pull request changes this roadmap, no cited id is dropped, and no id is defined only by a revision.

## What moved from the Lean to the README

Nothing. The package's `Suggested.lean` already met the rule: one headline theorem and the two simple definitions it needs (`SpectralAlgClosure`, `CompletedAlgClosure`), real bodies, no padding, no sorry'd data. It is byte-identical in the roadmap.

I also checked for missing headlines. The other end theorems (rigid and scheme actions, discreteness, dictionary, Hochschild–Serre, adic and rational groups, twisting, comparison, packaging) are not statable at the pins:

- Tau Ceti has `TauCeti.AdicSpace` but no étale site.
- Mathlib has `Scheme.smallEtaleTopology` and `MorphismProperty.Over.pullback`. It has no continuity of small-étale base change: the only continuity instances in `Mathlib/AlgebraicGeometry/Sites` are for `AffineEtale`, `ProEt` and the big Zariski site. Mathlib's `Over.pullback` continuity in `CategoryTheory/Sites/Over.lean` is for the big-site slice `J.over X`, not `X.Etale`.
- Neither library has higher direct images or a Galois dictionary.
- `ContinuousAlgEquiv` has no group instance (`Mathlib/Topology/Algebra/Algebra/Equiv.lean`).

The general topology statement of §3.3 (rationalisation of a `TauCeti.ContinuousRep`) is statable, but it is a theorem about an arbitrary module, not a headline, so it stays a README target.

**Signature check.** I appended `#check @…` for all three declarations to the module, built once with the allowed command, and restored the file (the build output is in `scratch/check-signatures.out`):

- `SpectralAlgClosure : (K : Type u_1) → [Field K] → Type u_1`;
- `CompletedAlgClosure` and `exists_galois_continuousAut_equiv` carry `[NontriviallyNormedField K] [CompleteSpace K] [IsUltrametricDist K]`, the hypotheses of Conventions and §0.2.

No binder is lost and nothing changed.

## Supplier replacements and duplication removals

- **DerivedModuleAlgebra §1.T.1 replaced (6 places: Scope imports, the Tau Ceti and remaining-supplier contracts, §3.1 Milnor bullet and *Needs:*, §4.3 (d) and *Needs:*, Layer 3 and Layer 4 Dependencies).** On main, DerivedModuleAlgebra's §1.T.1 is a forwarding label: its Scope says citations of it resolve to the Tau Ceti tower declarations. The README now cites:
  - the Milnor sequence of EnhancedDerivedSheaves §0.3 (`ClassicalDerived.inverseLimits` with its module comparison, all maps of the Milnor sequence identified, and compatibility with group actions through compatible tower maps), which is the derived limit actually used in §3.1;
  - the Tau Ceti declarations directly: `TauCeti.ModuleTower` (`Tower/Basic.lean:78`), `TauCeti.ModuleTower.lim` (`:170`), `TauCeti.ModuleTower.limOne` (`:174`), `TauCeti.ModuleTower.isMittagLeffler_of_surjective` (`Tower/MittagLeffler.lean:104`), `TauCeti.ModuleTower.isMittagLeffler_of_isArtinian` (`:113`, newly cited for "finite terms are Mittag–Leffler") and `TauCeti.ModuleTower.subsingleton_limOne_of_isMittagLeffler` (`:191`).

  DerivedModuleAlgebra is no longer a direct supplier.
- **No duplication removals.** The sweep by object over main and every open head (via `roadmaps grep`, and reading the scopes of the closest roadmaps) found no second owner. The items checked:
  - **The completed algebraic closure of a general complete non-archimedean field and `G_K ≅ Aut_cont(C/K)`.** Only narrower cases exist: PadicPeriodRings §1.1 (finite `K/ℚ_p`), §2 (*PadicFieldCompletion*, `p`-adic fields) and DiamondsAndVStacks §D6.7. These are named in Scope as narrower variants and used as Checks. Tau Ceti has only `ℂ_p` norm and density facts (`TauCeti/NumberTheory/Padics/Complex/Basic.lean`).
  - **Galois actions on `H^i(X_C, −)`.** No construction elsewhere. ClassicalAdicEtaleCohomologyPartII and AInfCohomology state equivariance for an action they do not construct.
  - **The field-point identification `H^n(Spa(K, 𝒪_K), 𝒢) ≅ H^n_cont(G_K, 𝒢_ξ)`.** ClassicalAdicEtaleCohomology §1.1 at its head records it only in a Checks bullet and an example paragraph, not as a target, so this roadmap's §2.5 remains its owner.
  - **Automorphisms of the geometric point and the neighbourhood category over `Spa(K, 𝒪_K)`.** AdicEtaleGeometry A1.7 is general and does not contain them.
  - **The rationalisation topology of §3.3.** Not in ArithmeticGaloisRepresentations §§1.1–1.2 or EtaleCohomologyFoundations §F.4.0.

## Fixes made as an upstream reviewer

1. **Unsourced ownership claim (Scope).** The package said Poincaré duality, the `p`-adic trace and the quasi-unipotence of inertia are "made by their own roadmaps (ClassicalAdicEtaleCohomologyPartII, and the weight and nearby-cycle consumers)". No roadmap on main or at any open head states the quasi-unipotence of inertia on `ℓ`-adic cohomology of rigid spaces (Hansen–Zavyalov): `roadmaps grep 'quasi-unipot'` finds only scheme and `∇`-module versions. The text now gives duality and the trace to ClassicalAdicEtaleCohomologyPartII §§5.3–5.9 (resolved at its head; it is a consumer, not a supplier). It says plainly that quasi-unipotence, weights and local monodromy lie outside this roadmap, matching the target's exclusion of "weights, local monodromy, nearby cycles".
2. **Process wording.** "Statements of the target scope that this roadmap does not plan" referred to the board's target catalogue. It is now "Statements next to this roadmap that it does not plan".
3. **Forwarding citation.** The DerivedModuleAlgebra §1.T.1 citations above were replaced by what they forward to.

No mathematical statement, Check or locator needed correction. The adversarial pass below recomputed every statement and Check and found no failing instance.

## Unresolved

- **Declared supplier gap `gap:proper-rigid-finiteness`.** This is ClassicalAdicEtaleCohomology, extending §§9.7 and 11.1: finiteness of `H^i(X, ℤ/n)` for qcqs rigid spaces over `C` without an algebraic presentation (huber2007, Corollary 5.6). §4.4 (d) depends on it, and the accepted review is conditional on it. No roadmap at any head states it (`roadmaps grep` for huber2007 / Corollary 5.6 finds only unrelated hits). It stays in the house form "What ClassicalAdicEtaleCohomology must provide (gap:…)", which FlagVarieties, IndexTheory and BelyiMaps on main also use.
- **Overlap introduced by a later roadmap.** DeligneWeightsAndPurityPartII (open, merge-order line 375) declares `gap:analytic-comparison-automorphisms` against ClassicalAdicEtaleCohomology. Its content (the proper algebraic–analytic comparison commutes with every continuous `K`-automorphism of `C`) is this roadmap's §4.2 with §0.2, and this roadmap already lists DeligneWeightsAndPurityPartII as a consumer of exactly that. Since it is later in the merge order, the fix belongs to that pull request: cite GaloisActionOnEtaleCohomology §§0.2, 4.2 for the equivariance. Its additional compatibility with cup products and coefficient reductions stays with it. Nothing changed here.
- **Consumers not yet pull requests.** PadicHodgeTheoryPartII and ProetaleCohomologyOfPAdicCurvesAndTowers, named under Downstream consumers, are board packages, not open pull requests (merge-order lines 192 and 267). They are consumers, not dependencies.
- **Scope of the ownership check.** Ownership against open pull requests was checked with `roadmaps grep`, `roadmaps show` and `roadmaps resolve` over main and all open heads, and by reading the scopes of the closest roadmaps (DiamondEtaleCohomology, AdicCoefficientsAndComparisons, ClassicalAdicEtaleCohomologyPartII, ClassicalAdicEtaleCohomology, PadicPeriodRings, DiamondsAndVStacks). Not every listed roadmap was read in full.
- **Uncertified sources.** huber1996, huber1994, sga4half and serreGC1997 are paywalled and uncertified in `sources.toml`. Their locators were not read in this job.
- No suspicious instructions were found in any data read.

## Adversarial mathematics pass

| Statement | Instances tried | Values computed | Result | Change |
|---|---|---|---|---|
| `exists_galois_continuousAut_equiv` (§0.2; Lean) | `K` algebraically closed; `𝔽_p((t))`; `ℚ_2` with `S₃ = Gal(ℚ_2(2^{1/3}, ζ_3)/ℚ_2)`; swap of transcendentals in `ℂ_p`; joint continuity | `K` alg. closed: `G_K = 1`, `Aut_cont(C/K) = {id}`, bijective. `t^{1/p}` unique `p`-th root, so `σ̂` fixed by `σ|_{K^sep}`. `(σ * τ) x = σ(τ x)` in Mathlib's group law (`σ * τ = τ.trans σ`), so `e(στ) = e σ ∘ e τ` is the homomorphism, and `sr(α) = r⁻¹(β) ≠ r(β) = rs(α)` for `β = s(α)`. `|t₁| = 1 → |t₂| = p⁻¹`: not isometric, so not continuous. `|σ̂y − σ̂₀x| ≤ max(|y − a|, 0, |a − x|) < ε` on `σ₀·Fix(K(a)) × B(x, ε)` | true | none |
| `SpectralAlgClosure`, `CompletedAlgClosure` (§0.1) | `ℚ_p` against Mathlib; `ℚ_p(√p)`; `𝔽_p((t))` | Mathlib `PadicAlgCl p := AlgebraicClosure ℚ_[p]` with `spectralNorm.normedField ℚ_[p] _` and `PadicComplex := Completion (PadicAlgCl p)` (`Padics/Complex.lean:54,137`): same carrier and structure. `max(|a|,|b|)` on `ℚ_p(√p)` is submultiplicative with `|√p|² = 1 ≠ p⁻¹`, so not power-multiplicative; spectral `|√p| = p^{−1/2}`. `(b_s − t^{1/p})^p = s b_s` | true | none |
| §0.1 density of `K^sep` | `X^{p^e} − tX − b` | derivative `−t ≠ 0` in char `p`, so separable over `K^sep`, roots in `K^sep`. Mathlib's lemma (`Approximation.lean:52`) is for one normed field with `f` having root `a` and `g` split: apply in `K̄` with `f = X^{p^e} − b`, `g = X^{p^e} − tX − b`, `‖g_i − f_i‖ ≤ |t|`, giving a root `b'` with `|a − b'| < ((p^e+1)|t|)^{1/p^e} max(|a|,1)` | true | none |
| §0.3 automorphisms of `ξ_C`; neighbourhoods `≃ P^op` | `ℚ_3(√3)`; `μ_4` over `ℚ_3`; `𝔽_2((t))`, `α² + α = t⁻¹`; `K(t^{1/2})`; cyclic cubic | one arrow `Spa L → Spa K`, none back; colimit over `P`: `μ_4(K^sep)` order 4; `K` terminal would give `μ_4(ℚ_3) = {±1}`, order 2 (`3 ≡ 3 mod 4`). `(α+1)² + (α+1) = α² + α`. `T² − t = (T − t^{1/2})²`: one embedding. `σ⁻¹∘τ₀ = τ₀∘g⁻¹ ≠ τ₀∘g`; `A(σ)A(τ) = A(τσ)` for `A(σ) = σ⁻¹∘−` (right action) | true | none |
| §1.1 `a^♮` composition, degree zero | `s ↦ s∘a`; `S₃` on `ℤ^{Gal(L/K)}` | `(a∘b)^♮ s = s∘a∘b = b^♮(a^♮ s)`; `b^♮ a^♮ δ_1 = δ_{rs}`, wrong order `δ_{sr}`; `(τσ)_Y = σ_Y∘τ_Y`, `ρ(τσ)δ_1 = ρ(τ)δ_s = δ_{rs}` | true | none |
| §1.1 tensor and cup products | `Λ = ℤ/4`, `M = N = ℤ/2`; `Λ = M_2(𝔽_2)` | periodic resolution `⋯ →·2 ℤ/4 →·2 ℤ/4`; after `⊗ ℤ/2` differentials `0`, `Tor_n = ℤ/2` for all `n ≥ 0`, target unbounded below. `E_12 e_1 = 0`, so `BAv = 0`; `AB = E_11`, `ABv = e_1` | true | none |
| §1.1 finite Galois covers, morphisms of covers | `g ↦ (g⁻¹)^♮`; `ℚ_2`, `n = 5`, Frobenius | `((gh)⁻¹)^♮ = (g⁻¹)^♮ (h⁻¹)^♮`, a left action. Base change: `(σ(ζ_{σ⁻¹τ}))_τ` on the diagonal gives the constant `σ(ζ) = ζ²`; with `(a⁻¹)^♮`: `ζ^{2⁻¹ mod 5} = ζ³` | true | none |
| §1.2 rigid action, permutation module | `X = Spa L`; `ℚ_2(2^{1/3})`; `𝒪_{X_ét}` | `L ⊗ C ≅ ∏_τ C`, `id ⊗ σ̂ : (x_τ) ↦ (σ̂ x_{σ⁻¹τ})`, so `e_{τ'} ↦ e_{στ'}`; component `τ ↦ σ⁻¹τ`, indicator `τ' ↦ στ'`. Rank 3, trace 1 at a transposition; regular rank 6, trace 0. `colim_L L = K^sep ≠ C` | true | none |
| §1.2 `σ_X` not over `Spa C` | `X ≠ ∅`, `σ̂ ≠ id` | `q^#∘σ̂ = q^#` with `q^# : C → 𝒪(X_C)` injective forces `σ̂ = id` | true | none |
| §1.3 (c), (e), (f) | Kummer on `Spa K`; `K(t^{1/p})`; `τ ∈ G_K` | `0 → μ_n(C) → (K^sep)^× → (K^sep)^× → 0` exact for `n` invertible; `G_L = G_K`; `Spa(τ̂⁻¹)∘Spa(σ̂) = Spa(σ̂τ̂⁻¹) = Spa(τ̂⁻¹)∘Spa((τστ⁻¹)^)`; `ρ(τ⁻¹)ρ(τστ⁻¹) = ρ(στ⁻¹) = ρ(σ)ρ(τ⁻¹)`; wrong version `ρ(σ) = ρ(τ²στ⁻²)` | true | none |
| §1.4 scheme action | `ℝ`, `μ_4`; `𝔽_q`, `μ_{ℓ^n}`; `𝔽_p(u)`, `k(u^{1/p})` | `i ↦ −i`; `ζ ↦ ζ^q`; `k^sep[T]/(T^p − u)` a field, purely inseparable over `k^sep`, hence separably closed; `X_{k̄} = Spec k̄[T]/(T − u^{1/p})^p`; `H⁰ = ℤ` on both | true | none |
| §2.1, §2.2 finite levels | `⊔_m Spa K` with `μ_{ℓ^m}`; `Spec ℚ(2^{1/3})` | stabiliser `ker χ_ℓ = G_{K(μ_{ℓ^∞})}`, not open (`ℓ ≠ p`, infinite extension). `H⁰` at `ℚ`, `ℚ(α)`, `ℚ̄`: `ℤ`, `ℤ²` (`T³ − 2 = (T − α)(T² + αT + α²)` over the real field `ℚ(α)`), `ℤ³` | true | none |
| §2.3 dictionary and its third consequence | `⊔_m Spa(ℚ_2(μ_{3^m}))`; `Spa(L_1)`; `μ_n` both conventions | order of 2 mod 3, 9, 27: `2, 6, 18`; `(ℤ/3)²` of order 9, diagonal map `= g_C^*`; `v̄ ↦ v̄∘Spa(σ̂⁻¹)` composes to `(τσ)·`, a right action | true | none |
| §2.4 dictionary for schemes | `ℝ`, `Spec ℂ`, `μ_4`; `⊔_m Spec ℚ(μ_{ℓ^m})` | `(ζ_id, ζ_conj) = (i, 1) ↦ (conj ζ_conj, conj ζ_id) = (1, −i)`; swap alone `(1, i)`; factor sizes `ℓ^{m−1}(ℓ − 1)` | true | none |
| §2.5 field-point identification and Hochschild–Serre | `K = C`; `ℚ_3`, `μ_4`; `ℚ_2`, `μ_5`; `Spa L` | `0 = 0` in positive degrees; order 2 against 4; `Br(ℚ_2)[5] = ℤ/5`; `χ mod 5` onto `(ℤ/5)^×` (order of 2 mod 5 is 4), so `H²(ℤ/5(−1)) = H⁰(ℤ/5(2))^∨ = 0` as `2² = 4 ≢ 1`; Shapiro `H^p(G_L, −)` | true | none |
| §2.6 Frobenius normalisation | `F_{X_{k̄}} = (F_X × id)∘φ_X`; `q = 2`, `ℓ = 7`; `ℙ¹` | `(F_X × id)^* = ρ(φ)⁻¹` as `F_{X_{k̄}}^* = id`; scalars `2` and `4`, `2·4 = 8 ≡ 1 (mod 7)`; on `ℤ/ℓ^n(−1)`: `q⁻¹` and `q` | true | none |
| §3.1 groups, Milnor, topology (Milnor citation repaired) | `ℤ ←ℓ ℤ`; `⊔_m Spa K`; disc with `ℓ = p = char K` | `lim = 0`, `lim¹ = ℤ_ℓ/ℤ`; finite abelian groups are Artinian `ℤ`-modules, so `isMittagLeffler_of_isArtinian` applies; `ℓ ∏ ℤ_ℓ ⊉ ∏_{m>M} ℤ_ℓ`, quotient `∏ ℤ/ℓ` infinite discrete; Artin–Schreier `H¹ = C⟨T⟩/{g^p − g}` infinite | true | citation only |
| §3.2 continuity | `Spa K`, `j = 1`; `ℤ_ℓ^×` on discrete `ℚ_ℓ`; `ℤ_ℓ/ℓ` | finite levels `μ_{ℓ^n}(C)`, stabilisers `G_{K(μ_{ℓ^n})}` open; orbit map not locally constant at 1; `(σ, x) ↦ x` continuous with `ℓ·1 = 0`; `ContinuousRep` needs no topology on `A` (`ContinuousRep.lean:82`) | true | none |
| §3.3 rational topology | `Ω₁ ∩ Ω₂`, `ℓ^{±1}Ω`; `∏ ℤ_ℓ`; `ℤ_ℓ(1)`; indiscrete `ℚ_ℓ`; f.g. `A` | `j⁻¹(ℓ^r(Ω₁∩Ω₂)) = ∩ j⁻¹(ℓ^rΩ_i)`; `j⁻¹(ℓ⁻¹Ω) ⊇ j⁻¹(Ω)` open. `e_m ∈ j⁻¹(ℓΩ)` gives `ℓ⁻¹e_m ∈ Ω ∖ j(A)`; `Ω_{M,k} = {v₁..v_M ∈ ℓ^kℤ_ℓ}` basic, intersection `0`. For `A = ℤ_ℓ^r ⊕ T`: `j⁻¹(ℓ^r j(A)) = ℓ^r A + T` open, `j(A)` basic. Inverse-limit topology has kernels `⊇ ℓ^n H`, so it is coarser than `ℓ`-adic; Hausdorff and compact, hence equal | true | none |
| §4.1 twisting | elliptic curve, `n = 7`, `ℚ_2`; `ℙ¹`; `j = 0`, `n = 1` | `det = χ·χ⁻² = χ⁻¹`: `2⁻¹ ≡ 4`; wrong direction `χ³`: `8 ≡ 1 (mod 7)`; `ℙ¹`: `4·2 ≡ 1`; `n = 1`: zero ring | true | none |
| §4.2 comparison, proper and nonproper | `Spec L`; `ℙ¹`; `𝔾_m`; `𝔸¹`; `𝔽_p((t))`, `n = p` | `Λ^{Hom_K(L,K̄)}` three times; `H²` acted on by `q⁻¹`; `𝒪(𝔾_{m,K^sep})^× = (K^sep)^× × T^ℤ`, `H¹(μ_n) = ℤ/n`, trivial action, `H¹(ℤ/n) = ℤ/n(−1)`; `𝔸¹`: `H¹(μ_n) = 0`; Artin–Schreier `a T^{mp^k} ≡ a^{1/p^k}T^m`, image coefficients in `K̄ ⊊ C`, `cT` with `c ∈ C ∖ K̄` missed | true | none |
| §4.3 packaging (a)–(d) | dévissage; Nakayama hypotheses; disc over `𝔽_2((t))`; Enriques; disc with `ℓ = p` | `H^N(ℤ/ℓ^{n+1}) → H^N(ℤ/ℓ^n) → H^{N+1}(ℤ/ℓ) = 0` surjective; `Module.Finite.of_quotient_smul_top` needs `[CompactSpace R] [CompactSpace M] [T2Space M]`, `I.FG`, nilpotent `I`, `[IsTopologicalAddGroup M] [ContinuousSMul R M]` (`Nakayama.lean:142,164`), all satisfied by `ℤ_ℓ`, `(ℓ)`, `H`; `a_{2s} = a_s²`, `a_{2m+1} = c_m`, `a_{2^k(2m+1)} = c_m → 0`; `ℤ_2^{10} ⊕ ℤ/2`, rational dimension 10 | true | none |
| §4.4 instances | (a)–(d) against suppliers; `ℙ^d`; disc; `⊔_m Spa K` | §9.7 proper smooth, `n` invertible in `𝒪_C`; §8.4 `q > 2d`; §AI.3.1 finite, zero above `2 dim X`; §11.1 locally algebraically of finite type, `B` killed by `n` prime to `char⁺`; §11.2 `cd_ℓ ≤ 2 dim.tr` (heads read). `H^{2m}(ℙ^d) = ℤ_ℓ(−m)`; disc: `ℤ/ℓ` in degree 0 (§10.4); `∏_m ℤ/ℓ` infinite | true, conditional on `gap:proper-rigid-finiteness` | none |
| Layer 4 Examples | `E/ℚ_p`, `ℓ ≠ p` and `ℓ = p` | `det V_ℓ(E) = χ_ℓ`, value `p` at an arithmetic Frobenius lift; `H¹(ℚ_p) = V_p(E)(−1)`, `det = χ·χ⁻² = χ⁻¹` | true | none |
| Conventions: direction and twists | `μ_n` on `Spa C`; Frobenius on `ℤ_ℓ(1)` | `s ↦ s∘Spa(σ̂)` is `T ↦ σ(ζ)`; `ρ(φ)ζ = ζ^p` for `ℓ ≠ p`; `coe_localCyclotomicCharacter` (`Cyclotomic.lean:61`) needs `p.Coprime (ringChar 𝓀[K])`, as stated | true | none |
| Scope: ownership statements | PD, trace, quasi-unipotence | §§5.3–5.9 of ClassicalAdicEtaleCohomologyPartII exist at its head; quasi-unipotence for rigid spaces has no owner | false as written | rewritten (fix 1) |
| Context and generality (Lean) | `#check @…` | binders as README Conventions; README generality "every `K` of Conventions" equals the Lean signature | true | none |


Pull request: #2271 (roadmap/galois-action-on-etale-cohomology at 14c3a34)
