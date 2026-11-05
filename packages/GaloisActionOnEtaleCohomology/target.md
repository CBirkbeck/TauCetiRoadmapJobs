Verdict: design
Name: GaloisActionOnEtaleCohomology
Base: none
Owner: none

## Scope

The roadmap owns the action of an absolute Galois group on the étale cohomology of a geometric
fibre, in both settings the target names, together with the rules that make the action usable:
functoriality, discreteness, continuity of the adic version, the twisting dictionary, and the
identification of the action with the module structure that sheaf theory on the base field
already carries.

**Setting (rigid side).** `K` is a complete non-archimedean field (a nontrivial rank-one
valuation, any characteristic) with valuation ring `𝒪_K`, algebraic closure `K̄`, Galois group
`G_K = Gal(K̄/K)` with the Krull topology, and `C` the completion of `K̄`. A rigid `K`-space is an
adic space locally of finite type over `Spa(K, 𝒪_K)` (huber1994, Sections 1–3; huber1996,
Chapter 1); `X_L` is its base change to a complete extension `L` of `K` and `pr : X_C → X` the
projection. Rigid `K`-spaces are locally strongly sheafy, so the étale site and its base change
are those of `AdicEtaleGeometry`, layer A1 and A2, and the sheaf theory is that of
`ClassicalAdicEtaleCohomology`, Layer 1.

**Setting (scheme side).** `X` is a scheme over a field `k` with separable closure `k^sep` and
geometric fibre `X_{k^sep}`; `G_k = Gal(k^sep/k)`.

**Owned here.**

- The group `G_K` as the group of continuous `K`-automorphisms of `C`: unique continuous
  extension of each `σ`, preservation of `𝒪_C`, and the identification of the two groups
  (Final target 2). Algebraic closedness of `C` is imported, not reproved (see Suppliers).
- The automorphism `σ_X := id_X ×_{Spa K} Spa(σ) : X_C → X_C`, the canonical isomorphism
  `c_σ : σ_X^{-1} ℱ_C ≅ ℱ_C` for `ℱ_C = pr^{-1} ℱ`, and the action `ρ(σ) := c_σ ∘ σ_X^*` on
  `H^i_et(X_C, ℱ_C)`, as a left action by `Λ`-linear automorphisms for sheaves of `Λ`-modules
  (Final target 2). The same construction on `H^i_et(X_{k^sep}, ℱ)` for a scheme over a field,
  and its agreement with the actions the library already has (Final target 1).
- Functoriality: equivariance of pullbacks along morphisms of rigid `K`-spaces, of maps induced by
  morphisms of sheaves, of connecting maps of long exact sequences and of cup products; restriction
  of the action to `G_L` along a finite extension `L/K` inside `K̄`; independence of the choice of
  `K̄` up to the conjugation it induces (Final target 2).
- Discreteness: for `X` quasi-compact quasi-separated and `ℱ` torsion, the colimit description
  of `H^i(X_C, ℱ_C)` over finite extensions, the openness of stabilisers, and the resulting
  discrete `G_K`-module; the identification of the `E_2` term of the Hochschild–Serre sequence
  that `ClassicalAdicEtaleCohomology` §1.3 supplies (Final target 3).
- The dictionary: under the equivalence of abelian sheaves on `Spa(K, 𝒪_K)_et` with discrete
  `G_K`-modules (`ClassicalAdicEtaleCohomology` §1.1 and §1.3), `R^i f_* ℱ` corresponds to
  `H^i(X_C, ℱ_C)` with the action `ρ`; hence every morphism of sheaves on `Spa(K, 𝒪_K)_et` between
  higher direct images induces a `ρ`-equivariant map. This is the content of "Galois-equivariant
  map" used by the trace and duality statements of other roadmaps (Final target 4).
- The `ℓ`-adic groups `H^i(X_C, ℤ_ℓ(j)) := lim_n H^i(X_C, ℤ/ℓ^n(j))` with the inverse-limit
  topology, the continuity of `ρ`, the `ℚ_ℓ`-version, with `ℓ = p` allowed when `char K = 0`
  (Final target 5).
- Galois equivariance of the comparison `H^i(X_{K̄}, ℱ) ≅ H^i(X_C, ℱ) ≅ H^i((X^an)_C, ℱ^an)` for
  a proper `K`-scheme and torsion `ℱ`; the isomorphisms themselves are supplied (Final target 6).
- The packaging of finiteness as representations: for `X` proper, the torsion, `ℤ_ℓ` and `ℚ_ℓ`
  groups are finite, finitely generated and finite-dimensional continuous `G_K`-representations,
  for `ℓ ≠ p` from the supplied finiteness and for `ℓ = p` (`char K = 0`, `X` smooth) from
  Scholze's theorem, which is cited (Final target 7).
- Equivariant twisting and the sign convention pinned on `H^0(Spa(C, 𝒪_C), μ_p)` (Final target 8).

**Not owned here.**

- The étale sites of adic spaces, their base change, geometric points and the Galois category of
  finite étale covers (`AdicEtaleGeometry`).
- Sheaf theory, the sheaf/discrete-module equivalence over `Spa(K, 𝒪_K)`, the stalk formula for
  higher direct images along strict localisations, Tate twists on `X_et`, the proper algebraic
  comparison and the smooth trace (`ClassicalAdicEtaleCohomology` §§1.1, 1.3, 1.4, 1.5, 8.2, 9.7).
- The scheme-side continuous action on adic cohomology with descent data, finite Tate twists,
  proper and smooth base change and the continuous-representation carrier
  (`EtaleCohomologyFoundations` §§F.0.3, F.2–F.3, F.4.0, F.4.6, F.10.2). This roadmap only proves
  that the explicit action agrees with that one.
- Continuous cohomology of profinite groups and discrete modules (`ProfiniteCohomology`).
- Finiteness of `ℓ ≠ p` cohomology (`ClassicalAdicEtaleCohomology` §§6.2–6.4 and §8.2);
  Scholze's `ℓ = p` finiteness is cited, not proved.
- Poincaré duality, the `p`-adic trace and the almost-mathematics behind it
  (`ClassicalAdicEtaleCohomologyPartII` Layer 5 consumes this roadmap for the meaning of
  "Galois-equivariant"; it is later in the merge order).
- Weights, local monodromy, nearby cycles, period rings and comparison theorems (consumers).

**Generality.** The filed wording is already general on the rigid side; the roadmap keeps `K`
arbitrary (any characteristic, non-discrete valuations allowed) and `X` an arbitrary rigid
`K`-space, with quasi-compactness, quasi-separatedness and torsion coefficients only where
Huber's limit theorems need them. The scheme side is stated for an arbitrary field `k`, not only
for `K`. The special cases `K/ℚ_p` finite (Mathlib's `PadicComplex`), `X` smooth proper, and
`ℓ ≠ p` become Checks.

## Final targets

1. **Scheme-side action and agreement.** For a field `k`, a scheme `X/k` and an abelian sheaf
   `ℱ` on `X_et`, construct `σ_X : X_{k^sep} → X_{k^sep}` over `X` and `ρ(σ) = c_σ ∘ σ_X^*` on
   `H^i(X_{k^sep}, ℱ)`; prove that `ρ` is a left action by group automorphisms, `Λ`-linear for
   sheaves of `Λ`-modules. For `X` quasi-compact quasi-separated prove that under the stalk
   formula for `R^i f_* ℱ` at the geometric point `Spec k^sep → Spec k` (stacks03N1, Tag 03Q9,
   Theorem 53.1) the Galois action on the stalk (stacks03N1, Tag 03QW) is `ρ`; under the
   equivalence of sheaves on `(Spec k)_et` with discrete `G_k`-modules (stacks03N1, Tag 03QQ)
   `R^i f_* ℱ` is `(H^i(X_{k^sep}, ℱ), ρ)`. For coefficient descent data in the sense of
   `EtaleCohomologyFoundations` §F.4.6, prove that `ρ` on finite-level cohomology is the finite
   level of that section's continuous action. (milneLEC, Sections 12 and 17; sga4half, Arcata.)
   Check: for `k` finite, `ρ` of the arithmetic Frobenius is inverse to the geometric Frobenius
   of `EtaleCohomologyFoundations` §F.10.2.

2. **The rigid action.** Let `K`, `K̄`, `C`, `G_K` be as in Scope. Prove: every `σ ∈ G_K`
   extends uniquely to a continuous `K`-automorphism of `C`, the extension preserves `𝒪_C`, and
   `σ ↦ σ̂` is an isomorphism of `G_K` onto the group of continuous `K`-automorphisms of `C`
   (dejongvanderput1996, Section 3.6, page 36). Define `σ_X := id_X ×_{Spa(K,𝒪_K)} Spa(σ̂)` for a
   rigid `K`-space `X`; prove `pr ∘ σ_X = pr`, `(στ)_X = τ_X ∘ σ_X`, and that `σ_X` is an
   automorphism of the adic space `X_C` over `X` but not over `C`. For an abelian sheaf `ℱ` on
   `X_et` construct `c_σ : σ_X^{-1} ℱ_C ≅ ℱ_C` from `pr ∘ σ_X = pr`, define
   `ρ(σ) := c_σ ∘ σ_X^*` on `H^i_et(X_C, ℱ_C)`, and prove: (a) `ρ` is a left action by `Λ`-linear
   automorphisms when `ℱ` is a sheaf of `Λ`-modules; (b) pullbacks along morphisms of rigid
   `K`-spaces, maps induced by morphisms of sheaves on `X_et`, connecting homomorphisms of the
   long exact sequences of short exact sequences of sheaves, and cup products are
   `G_K`-equivariant; (c) for a finite extension `L/K` inside `K̄`, the action of `G_L` on
   `H^i((X_L)_C, ℱ_C)` is the restriction of `ρ` to `G_L` under `(X_L)_C = X_C`; (d) a
   `K`-isomorphism between two algebraic closures transports `ρ` to the conjugate action.
   Checks: `X = Spa(K, 𝒪_K)` and `ℱ = μ_n` give the natural action on `μ_n(C)`; for
   `K/ℚ_p` finite, the extension `σ̂` is `PadicPeriodRings` §1.1's `completedGaloisAction`.

3. **Discreteness and Hochschild–Serre.** For `X` quasi-compact quasi-separated and `ℱ` a
   torsion abelian sheaf, prove that the natural map `colim_L H^i(X_L, ℱ_L) → H^i(X_C, ℱ_C)` over
   finite extensions `L ⊆ K̄` of `K` is an isomorphism, compatible with `ρ` and the finite Galois
   actions, that `G_L` acts trivially on the image of `H^i(X_L, ℱ_L)`, and hence that
   `H^i(X_C, ℱ_C)` is a discrete `G_K`-module (every element has open stabiliser). Identify the
   `E_2` term of the spectral sequence of `ClassicalAdicEtaleCohomology` §1.3 for the
   pro-finite-étale cover `X_C → X` with the continuous cohomology
   `H^j(G_K, H^k(X_C, ℱ_C))` of `ProfiniteCohomology`, Layers 1 and 10, for the module `ρ`
   (dejongvanderput1996, Corollary 3.7.5, page 39; huber1996, Section 2.4; serreGC1997,
   Chapter I, Section 2). Check: for `X = Spa(K, 𝒪_K)` this is Galois cohomology of `K`.

4. **The dictionary and Galois-equivariant maps.** For `f : X → Spa(K, 𝒪_K)` quasi-compact
   quasi-separated and `ℱ` torsion, prove that under the equivalence of
   `ClassicalAdicEtaleCohomology` §1.1 (stalk at the geometric point `Spa(C, 𝒪_C)`) between
   abelian sheaves on `Spa(K, 𝒪_K)_et` and discrete `G_K`-modules, `R^i f_* ℱ` corresponds to
   `(H^i(X_C, ℱ_C), ρ)`, using that section's and §1.5's stalk formula along the strict
   localisation and target 3 (dejongvanderput1996, Theorem 3.7.3, page 38; zavyalov2025,
   Section 5.4, page 78, which uses huber1996, Proposition 2.3.10). Deduce that for sheaves
   `ℱ, 𝒢` and a morphism `R^i f_* ℱ → R^j f_* 𝒢` of sheaves on `Spa(K, 𝒪_K)_et` the induced map
   `H^i(X_C, ℱ_C) → H^j(X_C, 𝒢_C)` is `ρ`-equivariant, and that a morphism `R^i f_* ℱ → Λ` to
   the constant sheaf induces a `G_K`-invariant linear form. Check: the trace
   `t_X : H^{2d}(X_C, ℤ/n(d)) → ℤ/n` of `ClassicalAdicEtaleCohomology` §9.7 (`n` invertible in
   `𝒪_K`, `X` smooth proper of pure dimension `d`) is equivariant for `ρ`; the mod-`p` trace of
   zavyalov2025, Theorem 5.4.2 and Remark 5.4.1, is the same kind of statement.

5. **Adic and rational coefficients.** For `ℓ` invertible in `K` (so any `ℓ` when `char K = 0`,
   including `ℓ = p`) define `H^i(X_C, ℤ_ℓ(j)) := lim_n H^i(X_C, ℤ/ℓ^n(j))` with the
   inverse-limit topology of the discrete finite-level groups and the action `lim_n ρ`; prove
   that the action is continuous, that `H^i(X_C, ℤ_ℓ(j))` is an object of `ProfiniteCohomology`'s
   `TopRep ℤ_ℓ G_K`, that it is a `ContinuousRep` in the sense of `EtaleCohomologyFoundations`
   §F.4.0 whenever it is finite free, and that `H^i(X_C, ℚ_ℓ(j)) := H^i(X_C, ℤ_ℓ(j)) ⊗ ℚ_ℓ`
   carries the induced continuous action. Prove the finite-level functoriality of target 2 in the
   limit. Check: for `ℓ = p = char K` the groups are defined but no finiteness is claimed.

6. **Equivariant comparison for proper schemes.** For a proper `K`-scheme `X` and a torsion
   abelian sheaf `ℱ` on `X_et`, prove that the isomorphisms
   `H^i(X_{K̄}, ℱ) ≅ H^i(X_{C}, ℱ) ≅ H^i((X^an)_C, ℱ^an)` are `G_K`-equivariant for the scheme
   action of target 1 on the left and `ρ` on the right, where the first isomorphism is
   invariance of proper étale cohomology under extension of algebraically closed fields
   (milneLEC, Section 17, page 114; from `EtaleCohomologyFoundations` §§F.2–F.3 proper base
   change) and the second is the proper algebraic comparison of `ClassicalAdicEtaleCohomology`
   §8.2 (berkovich1993, Theorem 7.1.1, page 125, and Corollary 7.5.4, page 147; huber1996,
   Section 3.8; milneLEC, Section 21, page 130). Check: for `X` a proper curve and `ℱ = μ_n`,
   `H^1` is the `n`-torsion of the Jacobian with its Galois action, by Kummer theory on both sides.

7. **Finiteness as representations.** (a) For `X` proper and `n` invertible in `𝒪_K`, the
   groups `H^i(X_C, ℤ/n(j))` are finite and vanish for `i > 2 dim X`; hence `H^i(X_C, ℤ_ℓ(j))`
   is a finitely generated `ℤ_ℓ`-module and `H^i(X_C, ℚ_ℓ(j))` a finite-dimensional continuous
   `G_K`-representation, for `ℓ ≠ p`. Finiteness is imported from
   `ClassicalAdicEtaleCohomology` §§6.2–6.4 (and from target 6 with milneLEC, Section 19,
   page 123, when `X` is algebraisable); the vanishing bound is huber1996, Corollary 2.8.3 (as
   attested by hansenzavyalov2023, proof of Theorem 3.3.2, page 39); the roadmap owns the
   passage to representations. (b) For `char K = 0`, `X` smooth proper and `ℓ = p`, cite
   scholze2013, Theorem 5.1, page 28 (finite-dimensionality of `H^i((X_C)_et, 𝕃)` for
   `𝔽_p`-local systems `𝕃`, vanishing above `2 dim X`), and deduce by dévissage that
   `H^i(X_C, ℤ/p^n(j))` is finite, `H^i(X_C, ℤ_p(j))` finitely generated, and
   `H^i(X_C, ℚ_p(j))` finite-dimensional, all continuous `G_K`-representations. Check: the
   quasi-unipotence of inertia on these groups (hansenzavyalov2023, Theorems 3.3.1 and 3.3.2)
   is a statement about `ρ` and is not claimed here.

8. **Equivariant twisting and the convention.** For `p` invertible in `K` prove the
   `G_K`-equivariant isomorphism `H^i(X_C, 𝔽_p(j)) ≅ H^i(X_C, 𝔽_p) ⊗ μ_p(K̄)^{⊗ j}` for all
   `j ∈ ℤ`, with `μ_p(K̄) = μ_p(C)` carrying `ζ ↦ σ(ζ)`, and its `ℤ/ℓ^n`, `ℤ_ℓ` and `ℚ_ℓ`
   versions, where the right-hand twist is the Tate twist of representations of
   `ArithmeticGaloisRepresentations` §1.2 and the left-hand twist is the sheaf twist of
   `ClassicalAdicEtaleCohomology` §1.4. Pin the convention: `ρ` on
   `H^0(Spa(C, 𝒪_C), μ_p) = μ_p(C)` is `ζ ↦ σ(ζ)`, so a geometric Frobenius over a finite
   residue field acts on `ℤ_ℓ(1)` by `q^{-1}`, matching `EtaleCohomologyFoundations` §F.4.6's
   Check. Check: replacing the primitive root `ζ` by `ζ^u` multiplies the coordinate of a fixed
   element of `𝔽_p(1)` by `u^{-1}` (`EtaleCohomologyFoundations` §F.0.3).

## Suppliers

Earlier in the merge order or on main; the roadmap is inserted after its last supplier,
`PadicDifferentialEquationsAndRigidCohomology` (ORDER position 108), and before
`PadicHodgeTheory` (110).

- `EtaleCohomologyFoundations` (main): §F.0.3 finite Tate twists; §F.1 finite-coefficient
  cohomology; §§F.2–F.3 proper and smooth base change (target 6); §F.4.0 `ContinuousRep`
  carrier (target 5); §F.4.6 the continuous `G_k` action on geometric cohomology with descent
  data (target 1 identifies the explicit action with it); §F.10.2 the Frobenius bridge (Check of
  target 1).
- `AdicEtaleGeometry` (main): layer A1 étale site, geometric points, finite-étale Galois
  category and profinite-étale sites; layer A2 base change of strongly sheafy spaces (target 2).
- `ProfiniteCohomology` (main): Layer 0 discrete modules, Layer 1 `TopRep` and
  `continuousCohomology`, Layer 4 finite-quotient colimit, Layer 10 all degrees (targets 3, 5).
- `PadicPeriodRings` (ORDER 18): §1.1 the Galois action on `ℂ_p` and §2 the general `p`-adic
  field (Check of target 2).
- `ArithmeticGaloisRepresentations` (ORDER 42): §1.1 continuous representations, §1.2 Tate
  twists of representations (targets 5, 8).
- `ClassicalAdicEtaleCohomology` (ORDER 53): §1.1 sheaves of `Λ`-modules and the equivalence
  with discrete Galois modules over `Spa(K, 𝒪_K)`; §1.3 descent and Hochschild–Serre; §1.4
  `μ_n` and twists; §1.5 limits and the stalk formula along strict localisations; §§6.2–6.4
  finiteness for prime-to-residue coefficients; §7.1 extensions of geometric field pairs; §8.2
  proper algebraic comparison; §9.7 the smooth proper trace (targets 3, 4, 6, 7, 8).
- `PadicDifferentialEquationsAndRigidCohomology` (ORDER 108): §RD.0.33, the completion of an
  algebraically closed non-archimedean field is algebraically closed in every characteristic
  (target 2; the `ℚ_p` case is Mathlib's `PadicComplex.isAlgClosed`).
- Mathlib: `PadicComplex`, `UniformSpace.Completion.map`, `Action (TopModuleCat R) G`,
  `continuousCohomology`, `rootsOfUnity`. Mathlib's `Scheme.EllAdicCohomology`
  (`Mathlib/AlgebraicGeometry/Sites/ElladicCohomology.lean`) is pro-étale `ℤ_ℓ`-cohomology of
  a scheme with no Galois action and is not used.

`AInfCohomology` (ORDER 54) is earlier and asserts `G_K`-equivariance of its de Rham
comparison through the dictionary of `ClassicalAdicEtaleCohomology` §1.3; target 4 identifies
that action with `ρ`. It is neither supplier nor consumer.

## Consumers

- `PadicHodgeTheory` (ORDER 110) §2.7: the supplied finiteness and the continuous Galois
  structure on `H^i(X_C, ℤ_p)` (target 7(b)).
- `WeightsInEtaleCohomology` (ORDER 134), §§1.7–1.8 and Layer 2: Galois actions on geometric
  fibres with twists and Frobenius conventions (targets 1, 5, 8).
- `CohomologyComparisons` (ORDER 165) and `CstConjectureForDaggerVarieties` (166): the Galois
  action on `p`-adic étale cohomology entering the comparison isomorphisms (targets 4, 5, 6).
- `PadicHodgeTheoryPartII` (176), `CohomologyComparisonsPartII` (192).
- `ClassicalAdicEtaleCohomologyPartII` (ORDER 209), §§5.3–5.9 and §7.5: the meaning of
  "Galois-equivariant" in mod-`p`, `ℤ_p` and `ℚ_p` Poincaré duality and in field-extension
  invariance (target 4), and zavyalov2025, Theorem 1.1.4, which the target cites.
- `GaloisSectionsPadicPeriodMaps` (ORDER 331) and the modularity roadmaps
  (`EllipticCurveModularityPartII`, `AbelianSurfacesModularity`, `ShimuraVarieties`), through
  `WeightsInEtaleCohomology` and `ArithmeticGaloisRepresentations`.
- Roadmaps that write `H^i(X_C, −)` with a Galois action and currently leave the action
  implicit: `BunGAndNewtonStrata`, `PerfectoidTowers`, `MotivesAndAlgebraicCycles`,
  `PrismaticCohomologyPartIII`.
- Not a consumer at this position: `DiamondEtaleCohomology` (ORDER 75) is earlier and names no
  Galois action; `ArithmeticGaloisRepresentations` (42) is earlier and is a supplier. The
  target's wish that they consume this roadmap would need their Part II.

## Sources

Manifest `packages/GaloisActionOnEtaleCohomology/sources.toml` (11 entries; locators quoted
against the worker's extractions).

- huber1996 — R. Huber, Étale Cohomology of Rigid Analytic Varieties and Adic Spaces, Vieweg
  1996. Proposition 2.3.10 (sheaves on `Spa(K, 𝒪_K)` as continuous representations, as
  attested by zavyalov2025 line 3798–3800), Section 2.4 (limits), Corollary 2.8.3 (vanishing
  above `2 dim X`, attested by hansenzavyalov2023 line 1708–1709), Section 3.8 (comparison with
  schemes), Theorem 7.5.3 (duality, attested by zavyalov2025 line 98). Paywalled: uncertified,
  cited by locator.
- huber1994 — R. Huber, A generalization of formal schemes and rigid analytic varieties,
  Math. Z. 217 (1994), Sections 1–3. Paywalled: uncertified.
- scholze2013 — P. Scholze, p-adic Hodge theory for rigid-analytic varieties, Forum Math. Pi 1
  (2013); arXiv 1205.3463v2 read. Theorem 5.1 (scholze2013 line 1279–1284, page 28).
  Open repository.
- berkovich1993 — V. G. Berkovich, Étale cohomology for non-Archimedean analytic spaces, Publ.
  Math. IHÉS 78 (1993). Theorem 7.1.1 (berkovich1993 line 4584, page 125), Corollary 7.5.4
  (line 5339, page 147). Numdam, open repository.
- dejongvanderput1996 — A. J. de Jong, M. van der Put, Étale cohomology of rigid analytic
  spaces, Doc. Math. 1 (1996). Section 3.6 "Galois action on cohomology" (dejongvanderput1996
  line 1476–1492, page 36), Theorem 3.7.3 (line 1571–1587, page 38), Corollary 3.7.5
  (line 1594–1599, page 39). Publisher open archive (EMS Press); the extraction is OCR.
- zavyalov2025 — B. Zavyalov, Mod-p Poincaré duality in p-adic analytic geometry, Ann. of
  Math. 201 (2025), no. 3, 647–773; arXiv 2111.01830v3 read. Theorem 1.1.4 (zavyalov2025
  line 125–132), Section 5.4 with Remark 5.4.1 and Theorem 5.4.2 (line 3796–3806, page 78 of
  the arXiv version). Open repository; Annals pagination not checked.
- hansenzavyalov2023 — D. Hansen, B. Zavyalov, Arithmetic properties of ℓ-adic étale
  cohomology and nearby cycles of rigid-analytic spaces, arXiv 2301.01800v2. Theorems 3.3.1
  and 3.3.2 (hansenzavyalov2023 line 1684–1705, page 39). Open repository.
- milneLEC — J. S. Milne, Lectures on Étale Cohomology, v2.21 (2013), author page. Section 12
  (page 81), Section 17 (page 114), Section 19 (page 123), Section 21 (page 130)
  (milneLEC line 49–58 for the table of contents; the extraction contains binary bytes and must
  be searched with binary-tolerant tools).
- stacks03N1 — The Stacks Project, chapter Étale Cohomology (Tag 03N1): Theorem 53.1
  (Tag 03Q9, stacks03N1 line 3733), Section 56 Galois action on stalks (Tag 03QW, line 3963),
  Section 59 Cohomology of a point (Tag 03QQ, line 4216). Open.
- sga4half — P. Deligne, Cohomologie étale (SGA 4½), LNM 569, "Arcata". Paywalled:
  uncertified.
- serreGC1997 — J.-P. Serre, Galois Cohomology, Springer 1997, Chapter I, Section 2.
  Paywalled: uncertified.

Milne's Étale Cohomology (Princeton 1980) is not recorded: no legal copy was found and nothing
cited here needs it beyond what milneLEC and stacks03N1 state.

## Risks

- **Huber cannot be read.** The limit theorem of target 3, the dictionary of target 4 and the
  vanishing bound of target 7 rest on huber1996, which is paywalled. The open substitutes cover
  the statements (dejongvanderput1996 for targets 3 and 4 in the Berkovich-style framework,
  berkovich1993 for target 6, hansenzavyalov2023 and zavyalov2025 for the attested locators),
  but the design must translate them to Huber's adic setting itself; if a human supplies a legal
  copy of Huber the design should re-anchor those locators.
- **Agreement with existing actions.** `EtaleCohomologyFoundations` §F.4.6 and
  `EllAdicRealization` (#196, Layer 8) both plan scheme-side continuous Galois actions;
  `AInfCohomology` asserts equivariance through `ClassicalAdicEtaleCohomology` §1.3. The
  roadmap must identify its explicit action with each of them (targets 1 and 4) rather than
  produce a third action; a Suggested.lean that declares a new carrier for these groups would
  be a defect.
- **Distance from the library.** Tau Ceti has no étale site of adic spaces (only
  `PreAdicSpace`), no completed Galois action on `PadicComplex`, and Mathlib's ℓ-adic
  cohomology is pro-étale and scheme-only; the acceptance test can state the targets only
  against the simple definitions it introduces, with the sites and sheaves coming from the
  supplier roadmaps once built.
- **Finiteness for `ℓ ≠ p`.** `ClassicalAdicEtaleCohomology` §§6.2–6.4 state finiteness in the
  nearby-cycle setting over valuation rings; the design must check that the proper rigid case
  it needs follows (formal models) and otherwise cite huber1996 Corollary 2.8.3 as uncertified.
- **Merge position.** Importing algebraic closedness of `C` from
  `PadicDifferentialEquationsAndRigidCohomology` §RD.0.33 places the roadmap at ORDER 109; an
  earlier slot would need another owner of that lemma, and none was found.
