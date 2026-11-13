# PKG-GaloisActionOnEtaleCohomology

Deliverables: `packages/GaloisActionOnEtaleCohomology/README.md` (new, 561 lines), `Suggested.lean` (new, 130 lines), `metadata.toml` (new, `topic = "math.AG"`, the topic of the étale-cohomology roadmaps on main such as EtaleCohomologyFoundations), `sources.toml` (two fields edited, below). `design/plan.json` is unchanged: its single gap `proper-rigid-finiteness` is still the only supplier gap, and the README states it in the ClassicalAdicEtaleCohomology subsection of Exact supplier contracts as `What ClassicalAdicEtaleCohomology must provide (gap:proper-rigid-finiteness): …`, word for word the plan's `needs`.

The README is the accepted design written out in the upstream shape. Every target (0.1–4.4), Check and worked example of the design is kept; Checks were added where noted below, and the corrections are listed.

## Headline theorems

| # | Headline (README) | Status | Lean name / what is missing at the pins |
| --- | --- | --- | --- |
| 1 | `G_K ≅ Aut_cont(C/K)` for every complete non-archimedean `K` of any characteristic: Galois automorphisms extend uniquely, the extension map is a bijection onto continuous `K`-algebra automorphisms compatible with composition, and the action `G_K × C → C` is jointly continuous (§0.2) | **stated** | `TauCetiRoadmap.GaloisActionOnEtaleCohomology.exists_galois_continuousAut_equiv`, using the definitions `SpectralAlgClosure` (type synonym of `AlgebraicClosure K` with Mathlib's `spectralNorm.normedField`/`normedAlgebra`) and `CompletedAlgClosure` (its `UniformSpace.Completion`) |
| 2 | The rigid action `ρ` as a left action by `Λ`-linear automorphisms, with functoriality (§§1.1–1.3) | not statable | the small étale site of an adic space with base change and sheaf cohomology (Tau Ceti has `TauCeti.AdicSpace`, checked with `#check`, but no étale site) |
| 3 | The scheme action (§1.4), its discreteness (§2.2), the scheme dictionary (§2.4) | not statable | the morphism of small étale sites induced by a morphism of schemes. Mathlib's `CategoryTheory.MorphismProperty.Over.pullback` exists (checked), but its continuity for `Scheme.smallEtaleTopology` is absent (no `IsContinuous` instance under `Mathlib/AlgebraicGeometry/Sites`). So there is no exact inverse image with its constant-sheaf comparison, which are the inputs `(pb, c)` of Tau Ceti's `Sheaf.H.pullback`. Supplying them in `Suggested.lean` would need proved site-theoretic instances (sorry'd instances are banned), i.e. SchemeAndStackFoundations §1.10 itself. The dictionary also lacks higher direct images and the field/Galois-module equivalence |
| 4 | Discreteness and dictionary for rigid spaces (§§2.1, 2.3) | not statable | as 2, plus higher direct images and the sheaf/discrete-module equivalence over `Spa(K, 𝒪_K)` |
| 5 | Hochschild–Serre `E_2` identification (§2.5) | not statable | the Leray spectral sequence of a morphism of étale sites |
| 6 | Agreement with the scheme adic action and Frobenius normalisation (§2.6) | not statable | normalised adic systems with descent data and their action (EtaleCohomologyFoundations §§F.4.1, F.4.6), plus 3 |
| 7 | `ℓ`-adic and rational groups as continuous representations (§§3.1–3.3) | not statable | the finite-level groups `H^i(X_C, ℤ/ℓ^n(j))` |
| 8 | Equivariant twisting (§4.1) | not statable | `μ_n` and its twists on adic étale sites |
| 9 | Equivariant proper comparison (§4.2) | not statable | analytification of schemes as adic spaces and Huber's comparison morphism |
| 10 | Finiteness ⇒ finitely generated / finite-dimensional representations, and its instances (§§4.3–4.4) | not statable | the groups of 7 |

The module docstring of `Suggested.lean` names 2–10 with these lacks. The abstract topological statements behind §3.3 (rationalisation of an arbitrary `TauCeti.ContinuousRep`) and §4.3(b) (a tower of finite modules) are statable on free variables. They are not headlines (they mention none of the roadmap's objects), so they are not stated.

## Corrections to the design (each checked)

1. §0.2 uniqueness: the design cited `UniformSpace.Completion.map_unique`, which characterises `Completion.map f` only among *uniformly* continuous maps (signature checked at the pin). Uniqueness among continuous maps is now attributed to `UniformSpace.Completion.ext` (density, Hausdorff target). The accepting review raised this.
2. §0.2 Check on discontinuous automorphisms: the design said `ℂ_p` has discontinuous field automorphisms "as an abstract field it is isomorphic to `ℂ`". That does not produce `ℚ_p`-*linear* ones, which the surjectivity Check needs. Replaced by an explicit construction: swap two algebraically independent `t₁, t₂` (with `|t₁| = 1`, `|t₂| = p⁻¹`) in a transcendence basis of `ℂ_p` over `PadicAlgCl p` and extend. That gives a `ℚ_p`-algebra automorphism that is not isometric, hence not `σ̂`, hence not continuous.
3. Supplier attribution: `Sheaf.H.pullback` and its lemmas are Tau Ceti's (`TauCeti/CategoryTheory/Sites/SheafCohomology/Pullback.lean`, line 69), and the composition lemma is `pullback_comp_apply`, not `pullback_comp`. SchemeAndStackFoundations §2.1 itself says so (its README, line 4101). The design listed them under SchemeAndStackFoundations §2.1.
4. `TopRepEquivActionTop` is `TopRep.TopRepEquivActionTop` (`#check` failed on the bare name and succeeded on the qualified one).
5. Checks added to reach three on §§2.2 and 2.4 (finite levels for `ℚ(2^{1/3})`; failure of the dictionary without quasi-compactness), plus discriminating Checks in §0.2 (composition order), §0.3 (`μ_4` over `ℚ_3`: 4 versus 2), §1.4 (imperfect base field), §2.6 and §4.1 (computed scalars), §4.4 (`d = 0`) and the worked examples (non-Galois cubic character).
6. Scope: the target's claim that AInfCohomology asserts equivariance "through ClassicalAdicEtaleCohomology §1.3" is not what AInfCohomology says. Its §AI.3.1 (`AInf.constant_deRham_comparison`, README line 2087 at its head) asserts `G_K`-equivariance without constructing the action. The sentence now says exactly that.
7. The gap moved from a separate "Gaps against named suppliers" subsection into the ClassicalAdicEtaleCohomology contract, in the required `What … must provide (gap:…)` form.
8. References: Milne §21 is not cited in the body and was dropped from References. `sources.toml`: zavyalov2025's locator no longer lists Theorem 1.1.4 (not cited), and its `version_note` no longer reads as a to-do (it says the Annals pagination was not compared).

## Duplication sweep (by object)

Removals, now cited instead:

- **Compactness of `G_K`.** The design derived it from Mathlib's compactness of Galois groups (`Mathlib/FieldTheory/Galois/Profinite.lean`) plus `separableClosure.isGalois` and the restriction isomorphism. Tau Ceti has the instance `CompactSpace (Field.absoluteGaloisGroup K)` (`TauCeti/FieldTheory/Galois/AbsoluteGaloisGroup/Basic.lean`, line 374). Cited in Conventions, the Tau Ceti contracts and §3.3.
- **Restriction `G_K ≅ Gal(K^sep/K)` as topological groups.** The design asserted it in Conventions. It is `TauCeti.absoluteGaloisGroupRestrictEquiv` (same file, line 340). Cited.

Searched with no other owner found:

- **Density of `K^sep` in the completion.** No density lemma for a separable closure in Mathlib or Tau Ceti.
- **The general completed algebraic closure with Galois extension and `G_K ≅ Aut_cont(C/K)`.** Not at the pins: Tau Ceti's `algebraicExtensionNormedField` is for nonarchimedean local fields only; Mathlib has only `PadicComplex`.
- **Roadmap owners of that object.** PadicPeriodRings §§1.1 and 2 are special cases (finite `K/ℚ_p`; discretely valued mixed characteristic). DiamondsAndVStacks §D6.7 uses continuous extensions inside its v-sheaf quotient, for `K` with `p` topologically nilpotent. Neither identifies `G_K` with all continuous automorphisms in every residue characteristic. Scope states the difference in one clause each. No `Suggested.lean` declaration shares a fully qualified name with a readable roadmap.
- **The explicit Galois action on geometric-fibre cohomology.** Grepped in the roadmaps earlier in the order with the closest vocabulary (ArithmeticGaloisRepresentations, ClassicalAdicEtaleCohomology, AInfCohomology, DiamondEtaleCohomology, DeligneWeightsAndPurity, AdicCoefficientsAndComparisons, LefschetzPencilsAndVanishingCycles) and via `roadmaps grep` over main and the 425 open heads. No second owner: EtaleCohomologyFoundations §F.4.6 is the scheme-side adic action this roadmap identifies with (§2.6). EllAdicRealization, which the target names, is no longer an open roadmap pull request.
- **Library facts used in proofs, consumed rather than restated.** `spectralNorm_*`, `UniformSpace.Completion.*`, `continuousSMul_iff_stabilizer_isOpen`, `Module.Finite.of_quotient_smul_top` and the Mittag–Leffler lemmas.

Notions moved down from later roadmaps: none.

Ownership against open pull requests was checked with `roadmaps grep`/`show` at the indexed heads (425 open pull requests). `roadmaps overlaps` found nothing for this roadmap: no open pull request changes it, drops an id it cites, or defines an id only in a revision.

## What the README could not support

- §4.4(d) for proper rigid spaces with no locally-algebraically-finite-type presentation rests on `gap:proper-rigid-finiteness` (ClassicalAdicEtaleCohomology §9.7), as accepted.
- huber1996, huber1994, sga4half and serreGC1997 are settled `uncertified` and are cited by locator only. zavyalov2025 is cited at arXiv v3 pagination. No new source was needed, nothing was fetched, and no `needs-references.toml` was written.

## Adversarial pass (statements written or changed here)

| Statement | Instances tried | Values computed on each side | Result; change |
| --- | --- | --- | --- |
| Headline `exists_galois_continuousAut_equiv` | `K` algebraically closed (`ℂ_p`); `K = ℚ_p`; `K = 𝔽_p((t))`; `K = ℂ((t))` (residue char 0); wrong models `e σ = (σ⁻¹)^`, `e σ = id` | Closed `K`: `G_K` has 1 element, `C ≅ K`, `C ≃A[K] C` has 1 element (a `K`-endomorphism of `K` is the identity): bijection of singletons. `ℂ((t))`: `G_K ≅ Ẑ`, extensions exist although no prime is topologically nilpotent. `(σ⁻¹)^` gives `e(στ) = e τ ∘ e σ`; with `S₃` elements `s, r` of orders 2, 3, `sr ≠ rs`, so the composition clause fails; `e = id` violates extension at `σ(√3) = −√3` over `ℚ_3`. Group law: Mathlib `(σ * τ) x = σ (τ x)`, matching `e σ ∘ e τ` | Pass. No group instance exists on `≃A[K]` (`inferInstance` failed in scratch), so the law is stated via composition |
| `SpectralAlgClosure`, `CompletedAlgClosure` | `K = ℚ_p`, `x = √p`; non-power-multiplicative norm; `C := K̄` | Spectral `|√p| = p^{-1/2}`; `max(|a|,|b|)` on basis `(1, √p)` gives `1`, excluded since the norm is the spectral norm by definition; `K̄` over `ℚ_p` is incomplete, while `Completion` is complete (`CompleteSpace (CompletedAlgClosure K)` synthesised) | Pass |
| §0.1 density | `p = 2`, `e = 1`: `X² − tX − b`; `K = 𝔽_p((t))`, `b = t` | Derivative `−t ≠ 0` (char 2: `2X − t = −t`), so separable with roots in `K^sep`; root bound `((q+1)|t|)^{1/q} max(|a|,1) → 0`; `(b_s − t^{1/p})^p = b_s^p − t = s b_s`, so `|b_s − t^{1/p}| = |s b_s|^{1/p} → 0` with `|b_s| ≤ max(|s|^{1/(p−1)}, |t|^{1/p})` | Pass |
| §0.2 joint continuity | `σ ∈ σ₀ Fix(K(a))`, `|x − a|, |y − x| < ε` | `|σ̂y − σ̂₀x| ≤ max(|y − a|, |σa − σ₀a|, |a − x|) = max(<ε, 0, <ε)` | Pass |
| §0.2 surjectivity / endomorphisms | `τ` continuous `K`-endomorphism | `τ(a)` is a root of `minpoly_K a`, which has `deg` roots in `K̄` already, so `τ(K̄) ⊆ K̄`; injective endomorphism of an algebraic extension is onto | Pass; added "every continuous endomorphism is an automorphism" |
| §0.2 Check (discontinuous `ℚ_p`-automorphism) | `t₁, t₂` with norms `1, p⁻¹` | Swap gives `|τ(t₁)| = p⁻¹ ≠ 1 = |t₁|`, so not isometric; continuous ones are `σ̂`, isometric | Corrected (item 2 above) |
| §0.2 Check (composition order) | `L = ℚ₂(2^{1/3}, ζ₃)`, `s(α) = α`, `r(α) = αω` | `sr(α) = αω²`, `rs(α) = αω`; for arbitrary order-2 `s`, `sr ≠ rs` are distinct transpositions, which never agree on a root | Pass |
| §0.3 `μ_4` Check | `K = ℚ_3` | `−1` is a non-residue mod 3, so `μ_4(ℚ_3) = {±1}` (order 2), `μ_4(K^sep)` order 4 | Pass |
| §0.3 cyclic Check | `[L:K] = 3`, generator `g` | `σ∘τ₀ = τ₀∘g`; opposite rule gives `τ₀∘g⁻¹ ≠ τ₀∘g` since `g² ≠ 1` | Pass; rephrased |
| §1.4 imperfect Check | `k = 𝔽_p(u)`, `X = Spec k(u^{1/p})` | `T^p − u` irreducible over `k^sep` (else `u^{1/p}` separable and purely inseparable, so in `k`), so `X_{k^sep}` is the field `k^sep(u^{1/p})`, separably closed, with `H⁰ = ℤ`, `H^{>0} = 0`; `X_{k̄} = Spec k̄[T]/(T − u^{1/p})^p` is nonreduced, also `H⁰ = ℤ` | My first draft wrongly called `X_{k^sep}` nonreduced; corrected before submission |
| §1.4 Frobenius Check | `k = 𝔽_q`, `μ_{ℓ^n}` | arithmetic `x ↦ x^q` gives `ζ ↦ ζ^q`, geometric gives `ζ^{q⁻¹}` | Pass |
| §2.2 finite-level Check | `X = Spec ℚ(α)`, `α³ = 2` | `L = ℚ`: `ℤ¹`; `L = ℚ(α)`: `ℚ(α)⊗ℚ(α) ≅ ℚ(α) × ℚ(α,ω)` gives `ℤ²`; `L = ℚ(αω)`: `ℤ²`; `L ⊇ ℚ(α,ω)`: `ℤ³ = H⁰(X_{ℚ̄}, ℤ)` | Pass |
| §2.4 conjugation Check | `k = ℝ`, `X = Spec ℂ`, `μ_4` | `(ζ_id, ζ_conj) ↦ (conj ζ_conj, conj ζ_id)`: `(i,1) ↦ (1,−i)`; swap alone gives `(1,i)` | Pass |
| §2.4 non-qc Check | `X = ⊔_m Spec ℚ`, `μ_{ℓ^m}` on component `m` | stalk `colim_L ∏ μ_{ℓ^m}(L)` = elements with open stabiliser; compatible primitive roots need `ℚ(μ_{ℓ^∞})`, infinite, so they are absent; `H⁰(X_{ℚ̄}) = ∏ μ_{ℓ^m}(ℚ̄)` contains them | Pass |
| §2.5 direction Check | `ℚ₂`, `μ₅` | `H²(G, μ₅) = ℤ/5`; `ℚ₂(ζ₅)/ℚ₂` unramified of degree `ord₅(2) = 4`, so `χ₅` is onto `(ℤ/5)^×`, `χ₅²(Frob) = 4 ≠ 1`, `H⁰(ℤ/5(2)) = 0` | Pass; justification added |
| §2.6 Check | `q = 2`, `ℓ = 7`, `n = 1` | arithmetic `2`, geometric `2⁻¹ = 4`, product `8 ≡ 1 (mod 7)` | Pass |
| §4.1 Checks | `ℙ¹`, `n = 7`, `ℚ₂`; elliptic `E` | `ℤ/7(1)` scalar `1`; `ℤ/7(−1)` scalar `4`; `μ₇` scalar `2`; `4·2 = 8 ≡ 1`. `det H¹(ℤ/7) = χ·χ⁻² = χ⁻¹ ↦ 4`; wrong twist `χ³ ↦ 8 ≡ 1` | Pass |
| §4.4 Check `d = 0` | `ℙ⁰` | only `H⁰ = ℤ_ℓ`, bound `2d = 0` | Pass |
| Worked example (cubic) | `ℚ₂(2^{1/3})` | permutation character on 3 embeddings: `3` at 1, `1` at a transposition (one fixed embedding), `0` at a 3-cycle | Pass |
| Conventions: compactness and restriction | Tau Ceti instance and equivalence | `#check` gives `absoluteGaloisGroupRestrictEquiv : Field.absoluteGaloisGroup K ≃ₜ* AbsoluteGaloisGroup K`, where `AbsoluteGaloisGroup K = Gal(SeparableClosure K/K)`; `CompactSpace` instance at line 374 | Pass; cited instead of derived |
| Supplier claims ("Mathlib lacks …") | group on `≃A[K]`; continuity of `Over.pullback` | `inferInstance : Group (C ≃A[K] C)` fails; no `IsContinuous` for the small étale base change under `Mathlib/AlgebraicGeometry/Sites` (the only instances are for `Scheme.forgetToTop` and `ProEt.forget`) | Pass |
| §2.3 convention-test wording | `G_K` acting through `S₃` | inverse rule `v̄ ↦ v̄∘Spa(σ̂⁻¹)` composes as `σ⁻¹τ⁻¹ = (τσ)⁻¹`: a right action, not a module structure when the quotient is nonabelian | Pass; wording sharpened |

The unchanged design statements were adversarially tested by the accepting review with computed values, and I re-read them in full. I relied on its table for them and recomputed a sample: the `ℤ/4` Tor periodicity, the Artin–Schreier disc, the `∏ ℤ_ℓ` topologies, the Enriques torsion, and the ML surjectivity in §4.3(d).

## Lean

Elaboration (`lake env lean` on `Suggested.lean`, from the content checkout): exactly **1** warning, `declaration uses 'sorry'` at line 118 (the headline). No other messages.

Binder check: a scratch file with the file's declarations and `#check @` for each declaration (`SpectralAlgClosure`, its five instances, `CompletedAlgClosure`, `exists_galois_continuousAut_equiv`) elaborated once. Every instance carries its binders explicitly. The normed instances take `[NontriviallyNormedField K] [CompleteSpace K] [IsUltrametricDist K]`; the field and algebra instances need only `[Field K]`. The headline's elaborated type matches the README statement. Nothing changed.

To `#check` the cited Tau Ceti declarations, I built two missing Tau Ceti object files with the brief's targeted `lake build`: `TauCeti.Topology.Algebra.Module.Nakayama` and `TauCeti.CategoryTheory.Sites.SheafCohomology.Pullback`. `Suggested.lean` itself imports only `Mathlib`. Every Mathlib and Tau Ceti declaration the README names was `#check`ed at the pins. All resolved except bare `TopRepEquivActionTop` (fixed to `TopRep.TopRepEquivActionTop`).

## Dependency check

```text
depcheck: 223 roadmaps, 1971 edges, 0 problem(s)
```

No UPWARD, CYCLE or `moved:` line. The merge order lists GaloisActionOnEtaleCohomology right after its last supplier, PadicDifferentialEquationsAndRigidCohomology. `roadmaps resolve` on the new README: no cross-roadmap citation and no roadmap Lean name found nowhere.

## Untrusted text

No suspicious instructions were found in the design, the reviews, the other roadmaps or the sources.
