# FIX-RT-NashBlowups~1: repair of red-team round 1 (passes a and b)

Eight findings in two reviews; a/F04 and b/F03 are the same defect and are settled once. All are
applied. `Suggested.lean` is unchanged: no finding touches its three declarations.

## RT-NashBlowups~1b/F01 (P2) — applied

§0.6's route used geometric normality and two Stacks lemmas that nothing supplied. There is no owner at the
pins (no `geometrically normal` in Mathlib or Tau Ceti) and none in any roadmap (`roadmaps grep` for the
notion and for tags 037Z, 0380, 0C30, 06DF: uses only). So the notion and both lemmas are now targets in §0.6:

- a normal ring (Stacks 00GV, line 3976);
- *Algebra.IsGeometricallyNormal* (037Z(1) and 0380), with three bullets: normality,
  *isGeometricallyNormal_of_isTranscendentalSeparable* (0C30) and
  *isNormal_tensorProduct_of_isGeometricallyNormal* (06DF);
- four Checks.

The route now cites them, and the Needs line, the Layer 0 Dependencies and the Scope are updated.

## RT-NashBlowups~1a/F01 (P3) — applied

Old: Conventions said "Mathlib's scheme-theoretic image of a morphism from a reduced scheme, which is reduced". New:
the morphism is quasi-compact; reducedness comes from Tau Ceti's `AlgebraicGeometry.Scheme.Hom.isReduced_image`
(`SchemeTheoreticImage/Basic.lean:78`, confirmed with `#check`) and the support from Mathlib's
`Scheme.Hom.support_ker`. The declaration is added to From Tau Ceti and to the Scope list. The §1.2 first bullet and
its Needs line now cite it too.

## RT-NashBlowups~1a/F02 (P3) — applied

§3.3 now says `J_f = Fitt_{n−1}(Ω_{X/k}) = Fitt_d(Ω_{X/k})`, which depends only on `X`, citing
`TauCeti.fittingIdeal_kaehlerDifferential_quotient_span_singleton` (`Kaehler/Hypersurface.lean:184`; `n ≥ 1` matches
its `[Nonempty ι]`). `TauCeti.fittingIdeal` and that theorem are added to From Tau Ceti, the §3.3 Needs line and the
Layer 3 Dependencies. The Scope now leaves to Part II only the Fitting-ideal comparison "beyond the hypersurface case
of §3.3".

## RT-NashBlowups~1a/F03 (P3) — applied

Both *nashModification.restrict* and *nashModification.baseChange* now start "in the situation of §1.2" (restrict
also spells out "`X` reduced and locally Noetherian, `U` dense"). Stacks 01R8 (line 421) and 081I (line 2198) both need
`σ_U` quasi-compact, which §1.2 gets from `X` being locally Noetherian. The only consumer is §2.6, which satisfies these
hypotheses: `X` is in the Setting, and `X_{k'}` is reduced and Noetherian with dense `g⁻¹(X_sm)`.

## RT-NashBlowups~1a/F04, RT-NashBlowups~1b/F03 (P3) — applied

hamann2003 calls the lemma folklore (line 55) and never mentions Seidenberg. The Scope wording "Seidenberg's lemma on
derivation-stable ideals" becomes "the stability of the minimal primes over a derivation-stable ideal". The heading
"### 4.3 Seidenberg's lemma" becomes "### 4.3 Minimal primes over a derivation-stable ideal". The locator now adds
"recorded there as folklore, line 55". No statement or Check changes.

## RT-NashBlowups~1a/F05 (P3) — applied

Each background key is now cited where it is used, with its manifest locator:

- Scope: hironaka1983, Section 1; spivakovsky1990, Introduction.
- Conventions, Grassmannian bullet: ega1, §9.7.
- §2.7: semple1954, pp. 24–49.
- Downstream consumers: teissier1982, pp. 314–491.

The References entry gives full data, locators and keys. In `sources.toml`, the nashModificationNotes2024 entry for
§2.4 now reads "the universal property of the Nash modification (lines 153-162)", and the five background entries say
where they are cited.

## RT-NashBlowups~1b/F02 (P3) — applied

The forward half of §1.1(1) used a pointwise notion and 04KS(3), neither available at the pins. It is replaced by the
reviewer's argument. On an affine open `Spec A`, prime avoidance in the reduced Noetherian `A` gives a nonzerodivisor
`g` with `D(g) ⊆ X_sm`. Since `k'` is flat over `k`, `A ⊗ k' ↪ A_g ⊗ k'`, and `A_g ⊗ k'` is reduced by Tau Ceti's
`TauCeti.AlgebraicGeometry.Smooth.geometricallyReduced` (with `smooth_smoothLocus_ι_comp`).

`isRegularLocalRing_stalk_of_smooth` is now used nowhere, so it is replaced in From Tau Ceti and the Needs line. The
056T and 04KS locators leave the README and the stacksVarieties `cited_for`.

## Other places repaired

The same constructions were searched across the whole roadmap:

- **Reduced images.** The new statement covers §§1.4, 2.3 and 3.1, which rely on §1.2. The `σ_U` and `(id, Φ)` maps
  there are quasi-compact because `X` is Noetherian.
- **§0.6 notions.** Also updated in the Scope paragraph and the Layer 0 Dependencies; the `sources.toml` entry
  `stacksAlgebra` now records 00GV, 037Z and 0380.
- **Fitting ideals.** The only other place was the Scope sentence, now changed.
- **"Seidenberg".** No other occurrence in the README or `Suggested.lean`.

## Checks

**Elaboration.** `lake env lean packages/NashBlowups/Suggested.lean`, run from the content checkout, exits 0. The only
messages are the two expected `declaration uses 'sorry'` warnings (lines 71 and 87); it took 3 s. No `TauCeti.*` import
needed building.

**Signatures.** I put `#check @name` for all three declarations in one scratch copy and elaborated it once. The
elaborated types are identical to those in `scratch/signatures.md`, and each matches its README statement:

- `HasLocallyFreeQuotientOfDifferentials (k) [CommRing k] (X) [X.Over (Spec k)] (d : ℕ) : Prop`;
- the characteristic-zero criterion, with `[Field k] [CharZero k] [IsReduced X] [LocallyOfFiniteType]` and
  `IsPureDimensional d X`;
- the normal criterion, with `[Fact p.Prime] [CharP k p] [PerfectField k] [IsNormalScheme X] [LocallyOfFiniteType]`
  and `IsPureDimensional d X`.

No binder was lost, and nothing changed.

**Newly cited library names.** I checked them with `#check` at the pins:

- `AlgebraicGeometry.Scheme.Hom.isReduced_image` (`[QuasiCompact f] [IsReduced X]`);
- `TauCeti.fittingIdeal`;
- `TauCeti.AlgebraicGeometry.isNormalScheme_iff_openCover`;
- `TauCeti.AlgebraicGeometry.isNormalScheme_Spec_iff_forall_localization`;
- `AlgebraicGeometry.Scheme.Hom.smooth_smoothLocus_ι_comp` (`[LocallyOfFinitePresentation f]`, true for `X` locally
  of finite type over a field);
- `Scheme.Hom.support_ker`;
- `GeometricallyReduced`.

The modules of two names have no object file, so I read them in the pinned source instead:
`TauCeti.AlgebraicGeometry.Smooth.geometricallyReduced` (`Morphisms/Smooth/GeometricallyReduced.lean:56`) and
`TauCeti.fittingIdeal_kaehlerDifferential_quotient_span_singleton` (`RingTheory/Kaehler/Hypersurface.lean:184`).
Neither is imported by `Suggested.lean`, so neither was built.

**Dependency check** (command of the brief):

```
depcheck: 244 roadmaps, 2238 edges, 0 problem(s)
```

There is no UPWARD, CYCLE or `moved:` line, and no supplier was added: the new inputs are Mathlib, the pinned Tau
Ceti, or targets stated here.

**Citation resolver.** `roadmaps resolve packages/NashBlowups/README.md` reports no cross-roadmap citation and no Lean
name found nowhere. Names outside TauCetiRoadmap were not checked by that tool; I checked them myself above.

**Gaps.** None. Every new input is a target here, Mathlib or pinned Tau Ceti, and `design/plan.json` `gaps` stays
empty.

## Adversarial pass on new and changed statements

| Statement | Instances tried | Values computed | Result | Change |
|---|---|---|---|---|
| Conventions/§1.2: image of a qc morphism from a reduced scheme is reduced, support the closure | `σ_U` for the ideal of the origin on `𝔸²`, `U = 𝔸² ∖ 0` | `𝔸²` Noetherian, so `σ_U` is qc; image is `Bl_0 𝔸²`, reduced; support is the closure of `σ_U(U)` | holds; qc stated | qc added |
| §1.1(1) forward route | cusp over `ℚ`; node; `k(t^{1/p})/𝔽_p(t)`; `A = 0` | cusp: `I = (x, y)`, `g = x`, smooth on `D(x)` as `3x²` is a unit. Node: minimal primes `(x)`, `(y)`, `g = x + y`. `k(t^{1/p})`: `X_sm = ∅`, `I = 0 ⊆` minimal prime `0`, no `g` (and not geometrically reduced). `A = 0`: `g = 1` | each case agrees with 056V | route replaced |
| §1.5 restrict, baseChange under §1.2 hypotheses | `V ⊆ U`; `g = U ↪ X`; `g = {0} ↪ 𝔸²`; §2.6 consumer | `π_N⁻¹(V) ≅ V`; `U = U`; `ℙ¹ ≠ ∅` (excluded: not flat, `g⁻¹U = ∅`); `X_{k'}` reduced and Noetherian, `g⁻¹(X_sm)` dense | hypotheses met by the consumer | hypotheses added |
| §3.3 `J_f = Fitt_{n−1}(Ω_{X/k})` | cusp in char 0, 2, 3; node; `n = 1`, `f = x_1`; `f = 0`, `n ≥ 1`; `n = 0` | `df = −3x²dx + 2y dy` gives `(3x², 2y)`, `(x²)`, `(y)`; node `(y, x)`; `Fitt_0(0) = (1)`; `Fitt_{n−1}(Oⁿ) = 0 = J_f`; `n = 0` excluded (`Nonempty ι`, `n ≥ 1`) | agrees with every §3.3 Check | sentence added |
| Scope: Part II only beyond the hypersurface case | hypersurface with `J_f` containing a nonzerodivisor | `0 → O --df--> Oⁿ → Ω → 0` exact, so pd ≤ 1, and §3.3 gives the isomorphism | consistent with "only when pd ≤ 1" | wording |
| §0.6 *Algebra.IsGeometricallyNormal* | `ℚ(i)/ℚ`; `k(t^{1/p})/𝔽_p(t)`; `k[x,y]/(x^p+y²+t)`, `p > 2`; `k(s)/k`; `A = 0`; `A = k` | `K[x]/(x²+1)` is `K(i)` or `K × K`, normal (not a domain for `K ∋ i`); `K[y]/((y−τ)^p)` has nilpotent `y − τ`; `K[u,y]/(u^p+y²)` is a domain for every `K` but not normal for `K = k(τ)` (cotangent dimension 2, normalisation `s ↦ (−s², s^p)`); `S⁻¹K[s]` normal; `0` normal; `K ⊗ k = K` | separable: normal; inseparable: not; geometrically integral yet not geometrically normal | new, 4 Checks |
| §0.6 tensor bullet | `A = B = ℚ(i)`; `A = B = k(τ)` over `𝔽_p(t)`; `B = 0`; `A = k`; `A = B = ℚ̄` | `ℚ(i) × ℚ(i)` normal; non-reduced, so "geometrically normal" cannot be weakened; `0`; `B`; absolutely flat non-Noetherian, normal | holds; no Noetherian hypothesis needed | new |
| §0.6 theorem route | `W = Spec ℚ̄`, `k' = ℚ̄`; `W = ∅`; `k' = k`; curve `C`, `k' = k(τ)` | normal; `∅`; `W`; not separable, conclusion fails as in the existing Check | route inputs all owned | route rewritten |
| §4.3 rename | `ℚ[x]`, `(x²)`; `ℚ[x,y]`, `(y²)`; `𝔽_p[x]`, `(x^p)` | not stable; `(y)` stable; `(x)` not stable | statement unchanged | heading only |

## Ownership

I checked against main, the board's packages and the open heads with `roadmaps grep`:

- **Geometric normality** (the notion, 0C30 and 06DF). Other roadmaps only use the phrase (AdicSpacesPartIII,
  SchemeAndStackFoundations §0.8, ArakelovGeometryAndAbelianHeightsPartII, CrystallineCohomologyPartII,
  StableReductionPartII); none states or plans these. This roadmap is the owner, at the point §0.6 needs them.
- **Declaration names.** No declaration of `Suggested.lean` changed or was added.

## For the maintainer

- **Renamed heading.** §4.3 is now "Minimal primes over a derivation-stable ideal", with its number unchanged. No other
  roadmap cites it, since the folder is not on main.
- **New suggested names** (italic, README only): *Algebra.IsGeometricallyNormal*,
  *isGeometricallyNormal_of_isTranscendentalSeparable* and *isNormal_tensorProduct_of_isGeometricallyNormal*.
- **Supplier contracts.** From Tau Ceti gains:
  - `TauCeti.AlgebraicGeometry.Smooth.geometricallyReduced`;
  - `AlgebraicGeometry.Scheme.Hom.isReduced_image`;
  - `TauCeti.fittingIdeal`;
  - `TauCeti.fittingIdeal_kaehlerDifferential_quotient_span_singleton`;
  - `isNormalScheme_iff_openCover`;
  - `isNormalScheme_Spec_iff_forall_localization`.

  It loses `isRegularLocalRing_stalk_of_smooth`, which is no longer used.
- **Untrusted text.** The review texts contain no instructions beyond findings.
- **Not edited.** `design/plan.json` (no gap) and `metadata.toml`.
