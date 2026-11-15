<!-- from CBirkbeck, https://github.com/TauCetiProject/TauCetiRoadmapJobs/pull/17003#issuecomment-6901187284 -->
Red team round 2 pass b (claude) of 092ba81

Verdict: needs_changes

**For the human reviewers:** this review raises 5 questions that a human decides (the scope of the roadmap, or a licence). They are in the section of that name at the end and do not change the verdict.

1. **F01** (P2) §0.6: the two new targets on geometric normality have no route, and the proofs at their locators need results that no target, supplier or pin provides

   **Location.** `packages/NashBlowups/README.md:552-557` (the bullets
   *isGeometricallyNormal_of_isTranscendentalSeparable* and *isNormal_tensorProduct_of_isGeometricallyNormal*) and
   `:606-607`: "*Needs:* for the definition and its bullets, Mathlib `Algebra.TensorProduct`, `IsIntegrallyClosed`,
   `Algebra.IsTranscendentalSeparable` and Tau Ceti `isNormalScheme_Spec_iff_forall_localization`".

   **Claim.** The two bullets follow from the four inputs of the `*Needs:*` line; "No gap is recorded: every input
   above is stated by its owner" (`:366`).

   **Witness.** stacksAlgebra lines 21496–21503 use 033C for smooth maps and 033G; lines 21525–21527 use Nagata
   finiteness. The pin has 033C for étale maps only (`TauCeti/RingTheory/Etale/Normal.lean`) and 033G for domains only
   (`TauCeti/RingTheory/Flat/IntegrallyClosed.lean:42`).

   **Repair.** The only consumer is the theorem of §0.6, which needs the tensor bullet for `A = k'` only. State that
   case with a route through the pins, and derive the separable bullet from it.

   - Replace the tensor bullet (`:555-557`) by:

     > *isNormal_tensorProduct_of_isTranscendentalSeparable*: for a separable field extension `k'/k` in the sense of
     > the Conventions and a `k`-algebra `B` that is a normal ring, `k' ⊗_k B` is a normal ring; no finiteness or
     > Noetherian hypothesis on `B` or `k'` (the case `A = k'` of stacksAlgebra, Lemma 10.165.5, tag 06DF, line 21516).
     > Route: `k'` is the directed union of its finitely generated subextensions `k_i`, each finite separable over
     > `k(t_1, …, t_n)` for a separating transcendence basis. The ring `k(t) ⊗_k B` is a localisation of
     > `B[t_1, …, t_n]`, whose local rings are localisations of the rings `B_q[t_1, …, t_n]`, integrally closed domains
     > by Tau Ceti's instance `TauCeti.MvPolynomial.isIntegrallyClosed`. The ring `k_i ⊗_k B` is étale over
     > `k(t) ⊗_k B`, as a base change of `k(t) → k_i` (`Algebra.FormallyEtale.of_isSeparable`), so its local rings are
     > integrally closed domains (Tau Ceti's
     > `TauCeti.Algebra.Etale.isDomain_localization_atPrime_of_localization_under` and
     > `isIntegrallyClosed_localization_atPrime_of_localization_under`). Finally `k' ⊗_k B` is the directed colimit of
     > the `k_i ⊗_k B`, and a directed colimit of normal rings is normal, its local ring at a prime being the colimit of
     > the local rings (stacksAlgebra, Lemma 10.37.17, tag 037D, line 4015).

   - Separable bullet (`:552-554`): append "Route: the tensor bullet below with `B = K`, a field."
   - Theorem route (`:582-586`): replace "`k'` is geometrically normal over `k`
     (*isGeometricallyNormal_of_isTranscendentalSeparable*); … (*isNormal_tensorProduct_of_isGeometricallyNormal*)" by
     "for every affine open `V` of `W` the ring `Γ(V, O_W)` is normal (…), so `k' ⊗_k Γ(V, O_W)` is normal
     (*isNormal_tensorProduct_of_isTranscendentalSeparable*)".
   - Second Check (`:567-568`): replace "and in the tensor bullet (with `B = A`, a normal ring) "geometrically normal"
     cannot be weakened to "normal"" by "and in the tensor bullet (with `k' = B = A`) separability cannot be dropped".
   - `*Needs:*` (`:606-609`), Layer 0 Dependencies (`:697-698`), Scope (`:42-44`) and From Tau Ceti: add
     `TauCeti.MvPolynomial.isIntegrallyClosed` (`TauCeti/RingTheory/MvPolynomial/IntegrallyClosed.lean`) and the two
     declarations of `TauCeti/RingTheory/Etale/Normal.lean`; From Mathlib already has
     `Algebra.FormallyEtale.of_isSeparable`.

   Tested on the instances of the Checks. `ℚ(i) ⊗_ℚ ℚ(i)`: `n = 0`, étale over the field `ℚ(i)`, local rings fields,
   `ℚ(i) × ℚ(i)`. `k' = k(s)`, `B = K`: `n = 1`, a localisation of `K[s]`. `k' = 𝔽_p(t)(t^{1/p})`: no separating
   transcendence basis, the route does not apply, and `k' ⊗_k k'` is not reduced. `ℚ̄ ⊗_ℚ ℚ̄`: colimit of the
   `L ⊗_ℚ ℚ̄ ≅ ℚ̄^{[L:ℚ]}`. `B = 0`: `0`.

   If the general statement of 06DF is kept instead, its inputs have to be owned: 033C for smooth maps, 033G for rings
   that are not domains, and the finiteness of the integral closure of a domain of finite type over a field, each as a
   target here or a named supplier section.

2. **F02** (P3) §1.5: the density hypothesis of *nashModification.baseChange* follows from flatness, and the Check says it is needed

   **Location.** `packages/NashBlowups/README.md:825-826`: "for a flat morphism `g : X' → X` from a reduced locally
   Noetherian scheme such that `g⁻¹(U)` is dense in `X'`", and `:835-836`: "(not flat, and `g⁻¹(U) = ∅`) … flatness and
   density are needed."

   **Claim.** Density of `g⁻¹(U)` is an independent hypothesis, and the third Check shows that it cannot be dropped.

   **Witness.** Generalisations lift along a flat `g`, so a generic point of `X'` maps to a generic point of `X`, which
   lies in the dense open `U`; `X'` is locally Noetherian, so `g⁻¹(U)` is dense. §2.6 (`:987-988`) uses this argument.
   The Check's `g` is not flat.

   **Repair.** `:825-826` → "for a flat morphism `g : X' → X` from a reduced locally Noetherian scheme (then `g⁻¹(U)` is
   dense in `X'`: a flat morphism sends the generic points of the irreducible components of `X'` to generic points of
   `X`, which lie in `U`)". `:835-836` → "… (not flat; here `g⁻¹(U) = ∅` is not dense) … flatness is needed." Tested:
   `g` the inclusion of `U`, flat, `g⁻¹(U) = U`; `g : {0} → 𝔸²`, not flat, `g⁻¹(U) = ∅`, fibre product `ℙ¹ ≠ ∅`.

3. **F03** (P3) §0.1: the construction uses two pinned Tau Ceti declarations that the supplier contracts and the `*Needs:*` line do not name

   **Location.** `packages/NashBlowups/README.md:393-394`: "Construct it from `Scheme.relativeDifferentialsHomEquiv`
   applied to the pushforward derivation and the pullback–pushforward adjunction", `:402-403` (the affine bullet) and
   `:415-416` (`*Needs:*`).

   **Claim.** The pushforward derivation and the identification of `Ω_{Spec A/R}` with the sheaf of `Ω[A⁄R]` are to be
   built, or are covered by the declarations listed.

   **Witness.** `TauCeti.AlgebraicGeometry.pushforwardDerivation`
   (`TauCeti/AlgebraicGeometry/Modules/Differentials/Restriction.lean:40`: for `f : X ⟶ Y` over `Spec R`, a derivation
   of `M` gives one of the pushforward) and `TauCeti.AlgebraicGeometry.relativeDifferentialsSpecIso`
   (`…/Differentials/Spec.lean:268`). Neither name occurs in the README.

   **Repair.** `:393-394` → "Construct it from `Scheme.relativeDifferentialsHomEquiv` applied to Tau Ceti's
   `pushforwardDerivation` of the universal derivation of `X` and the pullback–pushforward adjunction." `:402-403` →
   "… it is the sheaf of the Kähler map `B ⊗_A Ω[A⁄R] → Ω[B⁄R]`, under Tau Ceti's `relativeDifferentialsSpecIso`."
   From Tau Ceti, first bullet, add: "`TauCeti.AlgebraicGeometry.pushforwardDerivation` (`…/Differentials/Restriction.lean`)
   and `relativeDifferentialsSpecIso` (`…/Differentials/Spec.lean`: `Ω_{Spec A/R}` is the sheaf of `Ω[A⁄R]`, `da ↦ D a`)";
   add both to the `*Needs:*` lines of §0.1 and §0.2. Tested on the first Check of §0.1: `h = x`, `f*h = t²`, the
   pushforward derivation gives `d(t²) = 2t dt`.

Round 2. One P2 and two P3 findings (S01–S03). No statement of `packages/NashBlowups/README.md` or of
`packages/NashBlowups/Suggested.lean` was found false. All eight round-1 findings are repaired; one of the repairs
(the new targets of §0.6) leaves the defect it repaired one level lower, which is S01.

## Round 1: finding by finding

| Finding | Status | Witness at this head |
|---|---|---|
| 1b/F01 (P2), §0.6 route used a notion and two lemmas nobody supplied | repaired, but see S01 | `README.md:547-557`: "Define *Algebra.IsGeometricallyNormal* …", bullets *isGeometricallyNormal_of_isTranscendentalSeparable* (0C30, line 21510) and *isNormal_tensorProduct_of_isGeometricallyNormal* (06DF, line 21516); route `:582-586` cites them; four Checks `:561-576`. Locators read: stacksAlgebra lines 3976, 21470, 21504, 21510, 21516 agree. |
| 1a/F01 (P3), reduced image credited to Mathlib | repaired | `README.md:120-122`: "… of a quasi-compact morphism from a reduced scheme; it is reduced (Tau Ceti's `AlgebraicGeometry.Scheme.Hom.isReduced_image`) …"; contract `:225-228`; §1.2 `:753-755`, Needs `:773-774`. Pin: `TauCeti/AlgebraicGeometry/SchemeTheoreticImage/Basic.lean:78`, `[IsReduced X]` under the file's `[QuasiCompact f]`. |
| 1a/F02 (P3), `J_f` as a Fitting ideal | repaired | `README.md:1108-1112`: "`J_f` is the Fitting ideal `Fitt_{n−1}(Ω_{X/k})` …"; contract `:229-234`; Scope `:96-97`. Pin: `TauCeti/RingTheory/Kaehler/Hypersurface.lean:184`, `[Fintype ι] [Nonempty ι]`, index `Fintype.card ι - 1`; recomputed below. |
| 1a/F03 (P3), §1.5 hypotheses | repaired; residue in S02 | `README.md:819`: "in the situation of §1.2 (`X` reduced and locally Noetherian, `U` dense)"; `:825`. stacksNormalization lines 421 and 2198 read: both ask for a quasi-compact morphism. |
| 1a/F04 = 1b/F03 (P3), "Seidenberg" | repaired | `README.md:37` "the stability of the minimal primes over a derivation-stable ideal"; heading `:1208`; locator `:1211-1212` "recorded there as folklore, line 55". hamann2003 lines 54–57 read. `grep -i seidenberg`: no occurrence in the README or the Lean file. |
| 1a/F05 (P3), background keys | repaired | `README.md:94-95` (hironaka1983, spivakovsky1990), `:111` (ega1, §9.7), `:1004` (semple1954, pp. 24–49), `:1677` (teissier1982), References `:1697-1702`; each key now occurs twice. `sources.toml:39` reads "the universal property of the Nash modification (lines 153-162)". |
| 1b/F02 (P3), §1.1 route through a pointwise notion | repaired | `README.md:715-723`: the prime-avoidance route, ending in Tau Ceti's `Smooth.geometricallyReduced` (`TauCeti/AlgebraicGeometry/Morphisms/Smooth/GeometricallyReduced.lean`, instance read). Recomputed: cusp `g = x`; node `g = x + y`; `k[y]/(y^p − t)`: `I = 0`, no `g`. |

No repair introduced a false statement. The repairs changed 186 lines of the README and no line of
`Suggested.lean` (diff of the two heads read).

## The adversarial pass

### `Suggested.lean`: every declaration

Elaborated types from the job's signature file (no Lean command is given to this pass, so `#check @name` was not
run again; the file is byte-identical to the one the signatures were taken from, and the repair report records a
fresh elaboration with identical types). No `variable` or `include` line exists in the file; every binder is in
the declaration's own signature.

| Declaration | Layer, context | README | Instances and values | Result |
|---|---|---|---|---|
| `HasLocallyFreeQuotientOfDifferentials (k) [CommRing k] (X : Scheme) [X.Over (Spec k)] (d : ℕ) : Prop` | Layer 0; body `∃ E : FixedRank X d, ∃ q : Ω ⟶ E, Epi q` | §0.7, commutative ring `k`: same | `X = ∅`: `E = 0`, true for all `d`. `𝔸¹`: `d = 0` true, `1` true, `2` false (fibre dimension `1`). Cusp, `d = 1`: `𝔽_2` true (`dx ↦ 0`, `dy ↦ 1`, relation `x²dx`); `𝔽_3` true (`dx ↦ 1`, relation `2y dy`); `ℚ` false (`b = (3t/2)a`). Node: false (`ya + xb = 0`). `k[ε]/(ε²)`, `d = 1`: true iff characteristic `2`. Wrong model "`Ω` locally free": excluded by the cusp over `𝔽_2`. | real body on pinned carriers; used by both theorems |
| `smooth_iff_hasLocallyFreeQuotientOfDifferentials_of_charZero` | Layer 4; `[Field k] [CharZero k] [IsReduced X] [LocallyOfFiniteType _] (hX : IsPureDimensional d X)` | §4.4: same hypotheses | `∅`: true/true. `Spec K`, `K/ℚ` finite, `d = 0`: true/true. Cusp, node over `ℚ`: false/false. `𝔸² ⊔ 𝔸¹`, `d = 2`: smooth, right side false, excluded by `hX` (components of dimension `2` and `1`). `ℚ[ε]/(ε²)`, `d = 0`: right side true, not smooth, excluded by `IsReduced`. Cusp over `𝔽_2`: excluded by `CharZero`. Route steps 1–5 recomputed (below). | true as typed |
| `smooth_iff_hasLocallyFreeQuotientOfDifferentials_of_isNormalScheme` | Layer 5; `[Fact p.Prime] [CharP k p] [PerfectField k] [IsNormalScheme X] [LocallyOfFiniteType _] (hX)` | §5.4, first statement: same | `∅`: true/true. `d = 0`: `X` a disjoint union of spectra of finite separable extensions, true/true. Cone `z² = xy`, `p = 2`: singular; `ya₁ = −xb₁` with `a₁` a unit forces `y ∈ (x)`, false in `k[y, z]/(z²)`: false/false. `𝔽_2[ε]/(ε²)`: not normal. `x^p + y² + t` over `𝔽_p(t)`: right side true, not smooth, excluded by `PerfectField`. | true as typed |

Pinned definitions quoted: `TauCeti.IsPureDimensional d X := ∀ Z ∈ irreducibleComponents X, topologicalKrullDim Z = d`
(`TauCeti/Topology/PureDimension.lean:52`; vacuous on `∅`, no nonemptiness, no finiteness);
`FixedRank X r := (isConstantRank X r).FullSubcategory` (`TauCeti/AlgebraicGeometry/VectorBundle/FixedRank.lean:71`;
rank `r` at every point, vacuous on `∅`).

### README statements

| Statement | Instances tried | Values computed | Result | Change |
|---|---|---|---|---|
| §0.1 `c_f` | `t ↦ (t², t³)` in characteristic 0 and 2; closed point of `𝔸¹` | `2t dt`, `3t² dt`; `0`, `t² dt`; `k·dx → 0` | sound | S03 (citation only) |
| §0.2 `b_{g'}` | `k(s)/k` on `Spec k`; `K = k[y]/(y^p − t)`, `k' = k(τ)`; `ℤ → 𝔽_2` | `0 → 0`; `Ω_{B/k}` free on `dτ, du`, `c(dy) = dτ + du`, `b(dy) = du`; `dT ↦ dT` | sound | none |
| §0.3 `X_sm^{(d)}` | `𝔸² ⊔ 𝔸¹`; cusp over `ℚ`; `k[ε]/(ε²)` | `(2) = 𝔸²`, `(1) = 𝔸¹`; complement of the origin; fibre rank `1`, locus `∅` | sound | none |
| §0.4 closed immersion of Grassmannians | `O² → O`, `r = 1, 2`; `p = id` | section `[1 : 0]`; `∅ ⊂ S`; identity | sound | none |
| §0.5 smooth iff regular at closed points | cusp; `Spec k(t^{1/p})` over `𝔽_p(t)`; `∅` | embedding dimension `2`; regular, not smooth; both true | sound | none |
| §0.6 definition and bullets | `ℚ(i)/ℚ`; `k(τ)/𝔽_p(t)`; `k[x, y]/(x^p + y² + t)`; `k(s)`; `A = 0` | `K(i)` or `K × K`; nilpotent `y − τ`; `y² + (x^p + t)` irreducible over every `K` (odd degree in `x`, so `−(x^p + t)` is no square), not normal over `k(τ)`; localisation of `K[s]`; `0` | statements sound | S01 (route and inputs) |
| §0.6 theorem | `Spec ℚ(i)`, `k' = ℚ(i)`; `C`, `k' = k(τ)`; `Spec ℚ̄`, `k' = ℚ̄` | two points; `(−s²)^p + (s^p)² = 0`, cotangent dimension `2`; absolutely flat | sound | S01 |
| §0.7 bullets | `𝔸²`, `d = 1`; cusp over `𝔽_2`; kernel of a surjection onto `R^d` | kernels `O dy ≠ O dx`, `X_sm^{(1)} = ∅`; `x²c = 0 ⇒ c = 0`; a direct summand, finitely generated, zero at minimal primes | sound | none |
| §1.1 setting | `k[y]/(y^p − t)`; cusp `g = x`; node `g = x + y`; `A = 0` | `X_sm = ∅`, `I = 0`; `3x²` a unit on `D(x)` (characteristic `≠ 3`); avoids `(x)`, `(y)`; `g = 1` | sound | none |
| §1.2 `N(X, F, r, U)` | `F` locally free; `O ⊕ O/(x)` on `𝔸¹`; ideal of the origin of `𝔸²`; `U = ∅` | `X`; `X` with `L_F = O`; `Bl_0 𝔸²`; `∅` | sound; `σ_U` quasi-compact as `U → X` is and `Gr → X` is separated | none |
| §1.3 lift | `Spec k →` origin, `(a, b) ↦ b`; `Bl_p X`, `r ≥ 2` and `r = 1` | point of `N` is `(a, b) ↦ a`, no factorisation; `q = h`; `Bl = X` | sound | none |
| §1.5 base change | inclusion of `U`; `{0} → 𝔸²`; any flat `g` | `U`; `ℙ¹` against `∅`; generic points to generic points, `g⁻¹(U)` dense | sound | S02 |
| §2.1 `X*` | cusp, characteristic `0`, `≥ 5`; node; `Spec k` | `ν*Ω = k[t]dx ⊕ k[t]e/(t³e)`, `e = 2dy − 3t dx`; lines at `[1 : 0]`, `[0 : 1]`; `X` | sound | none |
| §2.2 modification | `y² = x²z`, characteristic `≠ 2` | `df = u(−2v², 2v, −u)`; chart `u = vw`: `[−2v : 2 : −w]`; chart `v = us`: `[−2us² : 2s : −1]` with `x = u`; fibre `(u, v²)` | sound | none |
| §2.4 *isIso_lift_iff* | one line of `𝔸¹ ⊔ 𝔸¹`; `Bl_0 𝔸² → 𝔸²` | closed immersion, not surjective; classifying map `π`, not a closed immersion | sound | none |
| §2.5 triviality | cusp in characteristic 2, 3, 0 | `x²dx`; `2y dy`; `−3t⁴a + 2t³b = 0`, `b = (3t/2)a`, `t ∉ k[[t², t³]]` | sound; agrees with §3.3 and §3.1 | none |
| §2.6, §2.7 | cusp over `ℚ(i)`; cusp, characteristic 2, `d = 2` | `𝔸¹_{ℚ(i)}`; `X_sm^{(2)} = ∅`, `X^{(1)} = ∅` | sound | none |
| §3.1 Gauss map | `y = 2x`; cusp in characteristic 0, 5, 3, 2 | `[1 : 2]`; `[1 : 3t/2]`, `3/2 = 4`; `[1 : 0]`; `[0 : 1]` | sound | none |
| §3.2 blowup | cusp `I = (y, x²)`; `𝔸¹`, `dx ↦ x`; `I = 0` | charts `k[t², t³][x²/y] = k[t]`, `k[t², t³][y/x²] = k[t, t⁻¹]`; `V(I) ∩ X_sm ≠ ∅` yet `ν_I⁻¹(X_sm ∖ V(I))` dense; `∅` | sound | none |
| §3.3 hypersurface | cusp; node; `x^p − y^q`; `n = 0`; `n = 1`, `f = x_1`; pinned Fitting theorem | `(2y, 3x²)`; `(x, y)`; `(q y^{q−1})`; `J = 0`, `∅ ≠ Spec k`; `(1)`; `finrank − (card − 1) = 1`, `1 × 1` minors | sound | none |
| §4.1–4.3 | cusp, characteristic 3; `k[x]_{(x^p − t)}`; `k[x]/(x²)`, `∂x = x`; `𝔽_p[x]`, `(x^p)` | `ker q = R dy/(y dy)`; `q(dm) ⊆ m`; `L(x dx) = 2x dx = 0`; `(x)` not stable | sound | none |
| §4.4 route | contraction to `k[X_1, …, X_d]`; `M_P` at a minimal prime | stable proper ideal in characteristic 0 is `0`; `trdeg κ(P) ≥ d` forces `P` minimal, `M_P ≠ 0` against `T_P = 0` | sound | none |
| §5.1 operators | `p = 2`; `p = 3`; cusp in characteristic 3 | `φ_0 = id − x∂`; inverse rows `(1, −x, x²)`, `(0, 1, −2x)`, `(0, 0, 1)`, `φ_0(x²) = 0`; valuations `3S`, `3S + 2`, `3S + 4` distinct modulo `3`, none equal to `3` | sound; the formula needs no commutation of the `∂_i` | none |
| §5.2, §5.3 | `k(t)`; `k[s]_{(s)}` over `𝔽_p(t)`; `ρ_Q ∘ ψ_Q` | `1, …, t^{p−1}`; `[K : K^p] = p²` against rank `p`; `σ_Q(r_γ^p) = r_γ` | sound; inputs of step 4 read at the pin (`LinearMap.bijective_of_depth`) | none |
| §6.1–6.4 | cusp, characteristic 2; `y² = x²z`, characteristic 2; `C_{k'}` | `X* = X`, `X̄* = 𝔸¹`; `df = x² dz`; `s ↦ (−s² − τ, s^p)` | sound | none |
| §7.1–7.3 | `m = 0`; cusp in characteristic 2, `m = 1`; induction on `j` | conclusion fails for the cusp in characteristic 0; no `X^{(i)}` smooth; `Y_{(j+1)m} ⊇ Y_{jm} ⊇ X` | sound; castilloDuarteLeytonLiendo2026 lines 58–67 give the Nash blowup in characteristic 0 only, as §7.3 says | none |
| Conventions, quotient convention | `y = 2x` | `dx ↦ 1`, `dy ↦ 2`: `[1 : 2]`; same in §§0.4, 3.1 and in AlgebraicModuliForArithmeticGeometry §1.3 ("quotient line convention") | consistent | none |

## Headline theorems and padding

Headlines of the README: the triviality criterion (§2.5); the blowup and hypersurface descriptions (§§3.2, 3.3);
Nobile's theorem (§4.5) and its differential form (§4.4); the theorem of Duarte and Núñez-Betancourt and its
differential form (§5.4); the criteria for `ν̄` (§6.4); the never-resolves principle (§7.3). Stated: the two
differential forms, with the one predicate they need. The module docstring names every other headline and the
missing carrier. Checked at the pin: `Module.Grassmannian.scheme` is over `Spec R`
(`TauCeti/AlgebraicGeometry/Grassmannian/Basic.lean`), its points are given on affine schemes
(`…/Grassmannian/Points.lean`, `schemeHomEquiv`), and `…/Grassmannian/UniversalQuotient.lean` concerns a closed
subscheme for a Hopf algebra, not a quotient sheaf; so no classifying map from the non-affine smooth locus exists
there. One-tactic probe: no declaration is padding; none follows from a library lemma (the library-match leads
were opened, none states either theorem).

## Dependency check

```
depcheck: 243 roadmaps, 2249 edges, 0 problem(s)
```

No UPWARD, CYCLE or `moved:` line. `design/plan.json` has `"gaps": []` and the README declares none.
`git diff --stat origin/main...HEAD` changes only `packages/NashBlowups/`.

## Verified sound

- **Declarations read:** 3 of 3; all 94 lines of `Suggested.lean`. Imports: `import Mathlib` and four `TauCeti.*`
  modules, all used. No `set_option`, `lemma`, sorry'd data or `#` command.
- **Targets read:** all 1702 lines of the README; 48 named `Prove`, `Define` and `Corollary` statements.
- **Locators verified this round:** 83 line locators opened in the 10 cached texts (stacksAlgebra 12, nobile1975 11,
  nashModificationNotes2024 17, stacksNormalization 12, duarteNunezBetancourt2020 8, gonzalezSprinberg1982 7,
  stacksVarieties 5, castilloDuarteLeytonLiendo2026 5, hamann2003 3, alperModuli 3), every locator the repairs
  added or changed among them; none wrong. The others are unchanged since the two round-1 passes verified them.
- **Checks tested:** the 38 Checks blocks; values in the tables above. Each definition has at least three
  (0.1: 3, 0.3: 3, 0.6: 4, 0.7: 4, 1.2: 3, 2.1: 4, 2.7: 4, 4.2: 3, 6.1: 3, 7.1: 3). One Check overstates (S02).
- **Sibling citations checked:** 17, each at main or at the head the roadmaps tool gives.
  AlgebraicModuliForArithmeticGeometry §1.3 (`coherentGrassmannian` on an arbitrary base, universal quotient,
  base change, `Gr_1(E) ≅ P(E)`, properness over `Spec R`; `plucker`) and §5.4
  (`ArithmeticModuli.DMNormalization.stack`, `.finite`, `ArithmeticModuli.DMSchematicClosure.stack`, flat base
  change, agreement with `Scheme.Hom.image`). SchemeAndStackFoundations §§0.7, 0.11 (`field_extension_descent`,
  smooth among the seven properties), 0.17, 0.23, 0.30, 4.11 (`IsModification.Witness`), 4.13
  (*regularLocus_eq_smoothLocus*, no reducedness asked). EnhancedDerivedSheaves §E1.6
  (`isRegular_of_frobenius_flat`, `[CharP R p] [IsNoetherianRing R]`). DerivedDeRhamCohomology §0.23 (both halves
  in its prose; `DerivedDeRham.IsPBasis`, `DerivedDeRham.pBasis_kaehler_basis` named there, so the two leads of the
  citation resolver are not defects). ResolutionOfSingularitiesCharacteristicZero §2.15.
  DiophantineApproximationAndTranscendence §5.6. AdicSpacesPartIII §R3.6. None is later in the merge order or on the
  never-cite list.
- **Pinned declarations checked:** 76 names of the supplier contracts grepped at the pins, all present in the files
  the README gives (`stalkBaseAlgebra` is `AlgebraicGeometry.Scheme.stalkBaseAlgebra`, `…/Scheme/BaseAlgebra.lean:119`).
  Statements read in full this round: `isReduced_image`, `Smooth.geometricallyReduced`, `fittingIdeal`,
  `fittingIdeal_kaehlerDifferential_quotient_span_singleton`, `isNormalScheme_iff_openCover`,
  `isNormalScheme_Spec_iff_forall_localization`, `isNormalScheme_iff_forall_affineOpens`, `IsPureDimensional`,
  `FixedRank`, `isIso_blowupToBase_iff`, `blowupLift`, `LinearMap.bijective_of_depth`,
  `dense_smoothLocus_of_perfectField`, `isIso_of_isClosedImmersion_of_surjective`,
  `ext_of_isDominant_of_isSeparated`.
- **Ownership:** `roadmaps grep` for Nash blowups and modifications, geometric normality, tags 01UV, 01V0, 01UZ,
  0C3M, 0C3N, the smooth locus of a given dimension and stable minimal primes: uses of the phrase "geometrically
  normal" only, no statement or plan of any of these objects on main or at an open head. No declaration of
  `Suggested.lean` shares a fully qualified name with a roadmap that could be read. The overlap file lists no second
  copy, no dropped id and no other pull request on this folder; main has no `NashBlowups` folder.
- **Policy:** no pull-request number, process narrative or algorithm in the README or the docstrings; every target
  has a locator or a route of its own.
- **Copyright.** Wording: besides the locators, 10 passages set beside 6 sources: §1.2 and §1.3 with
  nashModificationNotes2024 lines 216–229; §2.4 with lines 153–160; §4.4 with lines 182–199 (a different proof);
  §5.3 with lines 408–439 and duarteNunezBetancourt2020 lines 258–303; §4.3 with hamann2003 lines 58–64; §3.2
  with nobile1975 lines 107–117 (a different proof); §2.1 with gonzalezSprinberg1982 lines 85–98; §3.1 with
  castilloDuarteLeytonLiendo2026 lines 13–21; §0.6 with stacksAlgebra lines 21470–21517; the char-`p` docstring of
  `Suggested.lean` with duarteNunezBetancourt2020 lines 256–257. Longest shared run: five words, in the universal
  property ("there is a unique … such that"). Arrangement: nashModificationNotes2024 has Sections 1–7; Layer 1 ↔
  Section 3, Layer 2 ↔ Sections 1–2, Layer 4 ↔ Section 2, Layer 5 ↔ Section 5, Layers 0, 3, 6, 7 ↔ none, Sections 4,
  6, 7 ↔ none: no one-to-one run. Reuse: no table, figure or list taken over.

Source independence: 10 passages compared with 6 sources, none shared; largest share nashModificationNotes2024, 23 of 120 occurrences of a source key; contents compared with nashModificationNotes2024: independent.

## Not verifiable

- The elaborated types were not recomputed: this pass is given no Lean command. They are taken from the job's
  signature file, which the repair report says it reproduced by elaboration at this head.
- hironaka1983, spivakovsky1990, semple1954, teissier1982, ega1: uncertified, no text; cited as background only.
- alperModuli "printed p. 62" (`README.md:492`): the cached text carries line numbers only.
- The journal data of duarteNunezBetancourt2020 and castilloDuarteLeytonLiendo2026 (`README.md:1684-1688`): only
  the arXiv versions were read.
- Whether SchemeAndStackFoundations §0.20 gives the finiteness of integral closure that the general form of 06DF
  needs (S01, last paragraph): its section was opened only far enough to see that it records Tau Ceti's Japanese
  and Nagata rings.

## Source issues

- **Misprint** in nashModificationNotes2024 at Theorem 5.1, printed p. 10: the source says the modification of a normal variety is an isomorphism exactly when the variety is singular; it should be nonsingular; affects a stated result.
- **Misprint** in nashModificationNotes2024 at Section 1.2, printed p. 3: the source says the closure of the image of the Gauss graph is taken in the Grassmannian; it should be in the product of the variety with the Grassmannian; affects nothing.
- **Misprint** in nashModificationNotes2024 at Proposition 2.2, printed pp. 4–5: the source says the proposition and the paragraph before it twice, the second time as Proposition 2.3; it should be stated once; affects nothing.
- **Error** in nashModificationNotes2024 at Section 5, step (b), printed p. 10: the source says the coefficients of the operators lie in the ground field; it should be in the local ring (for `d = 1`, `p = 2` one coefficient is `−x`); affects the proof.
- **Gap** in nashModificationNotes2024 at Section 2, printed p. 4: the source says every morphism with a rank-`d` locally free quotient factors uniquely through the modification; it should require a reduced source with dense preimage of the regular locus; affects a stated result.
- **Misprint** in nobile1975 at Example 1, printed p. 300, and Example 4, printed p. 305: the source says the Jacobian-ideal description of the centre comes from Remark 1; it should be Remark 2; affects nothing.
- **Misprint** in hamann2003 at the proof of Lemma 0.1, printed p. 2: the source says the radical ideal is the annihilator of an element outside it; it should be that the minimal prime is the colon ideal of the radical by that element; affects the proof.
- **Misprint** in duarteNunezBetancourt2020 at the proof of Theorem 3.10, printed p. 6: the source says the sum for the corrected derivations with two different row indices; it should be one index throughout; affects nothing.
- **Misprint** in stacksAlgebra at Example 10.140.8, tag 00TY: the source says the curve has constant term an undefined letter; it should be the transcendental `t` of the ground field; affects nothing.
- **Misprint** in alperModuli at Exercise 0.3.21: the source says the subfunctor is represented by a closed subscheme of a scheme not introduced; it should be of the base `S`; affects nothing.

## For the human reviewers

- **Scope.** The source cited most (23 of 120 key occurrences) is nashModificationNotes2024, an arXiv survey, version 1, with no journal reference in `packages/NashBlowups/sources.toml`; the headline theorems also cite the refereed nobile1975 and duarteNunezBetancourt2020.
- **Scope.** The characteristic-`p` headline of `Suggested.lean` (§5.4, differential form) is stated by no source as a theorem; duarteNunezBetancourt2020 lines 256–303 state the Nash-blowup form and prove the differential form inside that proof.
- **Licence.** hamann2003 (arXiv:math/0311006v1), the only locator for §4.3, has no journal reference in `packages/NashBlowups/sources.toml`; it presents its Lemma 0.1 as folklore (line 55).
- **Licence.** alperModuli is a dated draft on its author's page (`licence_class = "author-page"`); no licence statement was found in the cached text. The README takes one proof step from it, by locator.
- **Not tested.** hironaka1983, spivakovsky1990, semple1954, teissier1982 and ega1 are uncertified and unread; the largest-share source was read.

<!-- tauceti-roadmap-review {"agent": "claude", "head": "092ba8107f2bc5bc8de363626dbb45a9ae7a7719", "job": "RT-NashBlowups~2b", "model": "fable", "worker": "chris-x26"} -->
