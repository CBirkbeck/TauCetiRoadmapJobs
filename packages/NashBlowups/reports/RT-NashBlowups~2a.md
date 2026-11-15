<!-- from CBirkbeck, https://github.com/TauCetiProject/TauCetiRoadmapJobs/pull/17003#issuecomment-6901138349 -->
Red team round 2 pass a (claude) of 092ba81

Verdict: needs_changes

**For the human reviewers:** this review raises 4 questions that a human decides (the scope of the roadmap, or a licence). They are in the section of that name at the end and do not change the verdict.

1. **F01** (P3) the corollary of §2.5 does not carry its hypothesis

   **Location.** `packages/NashBlowups/README.md:962`: "Corollary *nashBlowupHom_isIso_of_smooth*: if `X` is smooth
   then `ν` is an isomorphism (§0.3)."

   **Claim.** A named target whose only stated hypothesis is smoothness.

   **Witness.** `README.md:916-917` (§2.3, third Check): `X = 𝔸²_k ⊔ 𝔸¹_k`, `d = 2`, smooth, `X* = 𝔸² ≠ X`. The
   other statements of the same fact carry the hypothesis: `:868` ("smooth of relative dimension `d`"), `:1592`
   ("in the Setting with this `d` and smooth").

   **Repair.** Replace the line by: "Corollary *nashBlowupHom_isIso_of_smooth*: if `X → Spec k` is smooth of
   relative dimension `d` (in particular if `X` is in the Setting and smooth, §0.3), then `ν` is an isomorphism."
   Tested: `𝔸² ⊔ 𝔸¹` with `d = 2` is not smooth of relative dimension `2`, so it is excluded; for `X` smooth of
   relative dimension `d`, `X_sm^{(d)} = X`, `σ_X` is a section of the separated `Gr_d(Ω_{X/k}) → X`, a closed
   immersion with image `≅ X`, so `ν` is an isomorphism, with no further hypothesis.

2. **F02** (P3) the contract for `IsModification.Witness` adds a clause the supplier does not state

   **Location.** `packages/NashBlowups/README.md:331-332`: "§4.11 `IsModification.Witness`: for a modification `φ`
   …, a chosen dense open of the target over which `φ` is an isomorphism and whose preimage is dense."

   **Claim.** SchemeAndStackFoundations §4.11 states the density of the preimage as part of the witness.

   **Witness.** `TauCetiRoadmap/SchemeAndStackFoundations/README.md:6838-6839` (main): "a **chosen dense open**
   `U ⊆ S` over which `φ` is an isomorphism (`IsModification.Witness φ U`)"; no clause on the preimage. A dense
   open over which `φ` is an isomorphism need not have dense preimage.

   **Repair.** `:331-332` → "§4.11 `IsModification.Witness`: for a modification `φ` (Tau Ceti's `IsModification`), a
   chosen dense open of the target over which `φ` is an isomorphism." §2.2 already proves the density itself
   ("`ν⁻¹(X_sm)` is dense in `X*`", `:885`), so nothing else changes. Tested on §2.2: `U = X_sm` is dense, `ν` is an
   isomorphism over it, and the density of `ν⁻¹(X_sm)` is the support statement of §1.2.

Two new findings, both P3 (0 P1, 0 P2). All eight round-1 findings are repaired at this head and no repair
introduced an error. Every line of `packages/NashBlowups/README.md` (1702 lines) and of
`packages/NashBlowups/Suggested.lean` (94 lines) was read. No Lean was run in this pass (the brief gives no Lean
command); the elaborated types supplied with the job were compared with the README statements.

## Round 1: verification of the repairs

| Round-1 finding | State at 092ba81 | Witness (repaired passage) |
|---|---|---|
| 1b/F01 (P2) §0.6 route used an unowned notion and two unowned lemmas | repaired | `README.md:547-557`: "Define *Algebra.IsGeometricallyNormal* …", bullets *isGeometricallyNormal_of_isTranscendentalSeparable* and *isNormal_tensorProduct_of_isGeometricallyNormal*; route `:582-586` cites them; *Needs* `:606-609`. Locators checked: stacksAlgebra lines 3976, 21470, 21504, 21510, 21516. |
| 1a/F01 (P3) reducedness of the image credited to Mathlib | repaired | `README.md:120-122`: "of a quasi-compact morphism from a reduced scheme; it is reduced (Tau Ceti's `AlgebraicGeometry.Scheme.Hom.isReduced_image`)". Pin: `TauCeti/AlgebraicGeometry/SchemeTheoreticImage/Basic.lean:78`, `[IsReduced X]`, in a `[QuasiCompact f]` context. Contract `:225-228`, §1.2 `:753-755`, *Needs* `:774`. |
| 1a/F02 (P3) `J_f` is a Fitting ideal by a pinned theorem | repaired | `README.md:1109-1112`: "`J_f` is the Fitting ideal `Fitt_{n−1}(Ω_{X/k})` …"; contract `:229-234`; Scope `:96-98`. Pin: `TauCeti/RingTheory/Kaehler/Hypersurface.lean:184`, `[Fintype ι] [Nonempty ι]`, index `Fintype.card ι - 1`. |
| 1a/F03 (P3) §1.5 without its hypotheses | repaired | `README.md:819`: "in the situation of §1.2 (`X` reduced and locally Noetherian, `U` dense)"; `:825-826`: "in the situation of §1.2, for a flat morphism `g : X' → X` from a reduced locally Noetherian scheme". |
| 1a/F04 = 1b/F03 (P3) "Seidenberg's lemma" | repaired | `README.md:37` "the stability of the minimal primes over a derivation-stable ideal"; heading `:1208`; `:1211-1212` "recorded there as folklore, line 55" (hamann2003 line 55 read). No occurrence of "Seidenberg" remains. |
| 1a/F05 (P3) background keys uncited | repaired | Keys now occur in the body: `hironaka1983`, `spivakovsky1990` `:94-95`; `ega1` `:111`; `semple1954` `:1004`; `teissier1982` `:1677`; References `:1697-1702` with locators; `sources.toml` §2.4 entry reworded. |
| 1b/F02 (P3) §1.1 route through a pointwise notion | repaired | `README.md:715-723`: prime-avoidance route, `A ⊗_k k' → A_g ⊗_k k'` injective, Tau Ceti `Smooth.geometricallyReduced` (pin: `TauCeti/AlgebraicGeometry/Morphisms/Smooth/GeometricallyReduced.lean:56`, namespace `TauCeti.AlgebraicGeometry`). |

New errors introduced by the repairs: none found. Recomputed on the new text: `ℚ(i) ⊗_ℚ ℚ(i) ≅ ℚ(i)²` (normal,
not a domain); `k(τ) ⊗_k k(τ) ≅ k(τ)[y]/((y−τ)^p)` (nilpotent `y−τ`); `x^p + y² + t` irreducible over every `K/k`
(degree `p` odd in `x`, so `−(x^p+t)` is no square in `K(x)`) and `u^p + y²` not normal at the origin; cusp
`Fitt_1 = (2y, 3x²)`; `n = 1`, `f = x_1`: `Fitt_0(0) = (1)`.

## Declarations of `Suggested.lean`

| Declaration | Context and binders (elaborated) | README statement | Instances and values | Result |
|---|---|---|---|---|
| `HasLocallyFreeQuotientOfDifferentials` (def, real body) | `(k : Type u) [CommRing k] (X : Scheme) [X.Over (Spec k)] (d : ℕ) : Prop`; no section variables | §0.7, "for a commutative ring `k`" | `X = ∅`: true for all `d` (`E = 0`, rank vacuous). `𝔸¹`: true `d = 0, 1`, false `d = 2` (fibre dimension 1). `k[ε]/(ε²)`, `d = 1`: `Ω ≅ k` in char `≠ 2` (false), free on `dε` in char 2 (true). Cusp over `𝔽_2`: `dx ↦ 0, dy ↦ 1` (true); over `ℚ`: `b = (3t/2)a`, `t ∉ k[[t²,t³]]` (false). Wrong model "`Ω` locally free" excluded by the cusp over `𝔽_2` | agrees |
| `smooth_iff_hasLocallyFreeQuotientOfDifferentials_of_charZero` | `[Field k] [CharZero k] [IsReduced X] [LocallyOfFiniteType (X ↘ Spec k)] (d) (hX : TauCeti.IsPureDimensional d X)` | §4.4 | `∅`: both sides true. Cusp/`ℚ`, `d = 1`: false/false. Node/`ℚ`: `ya + xb = 0` gives `a ∈ (x)`, `b ∈ (y)`: false/false. `ℚ[ε]/(ε²)`, `d = 0`: RHS true, LHS false, excluded by `IsReduced`. `𝔸² ⊔ 𝔸¹`, `d = 2`: LHS true, RHS false, excluded by `hX`. `Spec K`, `K/ℚ` finite, `d = 0`: true/true. Cusp/`𝔽_2`: RHS true, LHS false, excluded by `CharZero` | true as typed; README generality equal |
| `smooth_iff_hasLocallyFreeQuotientOfDifferentials_of_isNormalScheme` | `(p) [Fact p.Prime] [Field k] [CharP k p] [PerfectField k] [IsNormalScheme X] [LocallyOfFiniteType …] (d) (hX)` | §5.4, first statement | Cone `z² = xy`, char 2: `Ω = O dz ⊕ (O dx ⊕ O dy)/(y dx + x dy)`, no surjection onto `O²` (`y ∉ (x)` in `k[y,z]/(z²)`): false/false. `𝔽_2[ε]/(ε²)`, `d = 0`: excluded (not normal). `x^p + y² + t` over `𝔽_p(t)`: RHS true (`dx ↦ 1`), LHS false, excluded by `PerfectField`. Cusp char 2, 3: excluded (not normal). `d = 0`: both true | true as typed; README generality equal |

`TauCeti.IsPureDimensional` at the pin (`TauCeti/Topology/PureDimension.lean:52`):
`∀ Z ∈ irreducibleComponents X, topologicalKrullDim Z = d`, `d : ℕ`; it includes no nonemptiness (the empty space
is pure of every dimension), which both theorems tolerate. `FixedRank X r`
(`TauCeti/AlgebraicGeometry/VectorBundle/FixedRank.lean:71`) is the full subcategory `∀ x, E.rank x = r`. No
binder is lost (the three elaborated types of `scratch/signatures.md` were set beside §§0.7, 4.4, 5.4); nothing
changed since round 1, the file is unchanged.

## The adversarial pass: README targets

| Statement | Instances tried | Values computed | Result |
|---|---|---|---|
| Conventions, quotient convention | line `y = 2x` | `dy = 2dx`: quotient `[1 : 2]`; conormal `dy − 2dx`: `[2 : −1]` | holds |
| §0.1 `c_f` | `t ↦ (t², t³)`, char 0 and 2; identity; closed point | `2t dt, 3t² dt`; `0, t² dt`; `dx`; `k·dx → 0` | holds |
| §0.2 `b_{g'}` iso | `k(s)/k`, `X = Spec k`; `𝔽_p(t)`, `K = k[y]/(y^p − t)`, `k' = k(τ)`; `ℤ → 𝔽_2` | `0 → 0`; `Ω_{X'/k}` free on `dτ, du`, `c(dy) = dτ + du`, `b(dy) = du` generator of rank-one `Ω_{X'/k'}`; identity | holds |
| §0.3 `X_sm^{(d)}` | `𝔸² ⊔ 𝔸¹`; cusp/`ℚ`; `k[ε]/(ε²)` | `(𝔸², 𝔸¹, ∅)` for `d = 2, 1, 0`; complement of origin; fibre rank 1, smooth locus `∅` | holds |
| §0.4 closed immersion `Gr_r(E) → Gr_r(E')` | `O² → O`, `r = 1, 2`, non-Noetherian `S`; `p = id` | section `[1 : 0]`; `∅ ⊂ S`; identity | holds |
| §0.5 smooth iff regular at closed points | cusp; `𝔸ⁿ`; `k(t^{1/p})/𝔽_p(t)` | embedding dimension 2 > 1; regular; regular, not smooth (imperfect) | holds |
| §0.6 definition, two bullets, theorem | see "Round 1" above; `k(s)/k`; `A = 0`; `ℚ̄ ⊗ ℚ̄` | localisation of `K[s]`, normal; zero ring normal; absolutely flat, normal, not Noetherian | holds |
| §0.7 uniqueness, glueing, stalk criterion | `𝔸²`, `d = 1`; cusp/`𝔽_2`; node | kernels `O dy ≠ O dx` (density needed); `x²c = 0 ⇒ c = 0`, kernel `O dx`; no unit among `a ∈ (x)`, `b ∈ (y)` | holds |
| §1.1 setting | `k[y]/(y^p − t)`; `k[ε]/(ε²)`; `𝔸² ⊔ 𝔸¹` | `X_sm = ∅`, ideal `0` in the minimal prime, not geometrically reduced; not reduced; `X_sm ≠ X_sm^{(2)}` | holds |
| §1.2 `N(X, F, r, U)` | `F` locally free; `O ⊕ O/(x)` on `𝔸¹`; ideal of `0 ∈ 𝔸²` | `X`; `X` with `L = O` (fibre of `Gr_1` is `ℙ¹`); `Bl_0 𝔸²` | holds |
| §1.3 lift, uniqueness of `M` | `Spec k → 0` with `(a, b) ↦ b`; `Bl_p X → X`, `r ≥ 2` and `r = 1` | no factorisation (`h⁻¹U = ∅`); `q = h` not iso; `Bl_p X = X` | holds |
| §§1.4, 1.5 | `V ⊆ U`; `U ↪ X`; `{0} ↪ 𝔸²` | `V`; `U`; `ℙ¹ ≠ ∅` (not flat, not dense) | holds |
| §2.1 `X*`, `L` | cusp char 0 or ≥ 5; node; `Spec k`, `d = 0` | `dy = (3t/2)dx`, ring `k[t², t³, 3t/2] = k[t]`, `ν*Ω = k[t]dx ⊕ k[t]/(t³)`; `[1:0]`, `[0:1]`, `𝔸¹ ⊔ 𝔸¹`; `X` | holds |
| §2.2 proper, modification | `y² = x²z`, char ≠ 2 | Gauss map `[2v² : −2v : u]`, base ideal `(u, v)`, closed immersion on both charts (`u, s` and `v, w` recovered), fibre ideal `(u, v²)`: `(vw, v²)` embedded point, `(u)` reduced | holds |
| §2.3 | cusp char 0, 2; `𝔸² ⊔ 𝔸¹`, `d = 2` | `𝔸¹`; `X`; `𝔸²` (not surjective) | holds |
| §2.4 lift, `isIso_lift_iff` | `Bl_0 𝔸² → 𝔸²`; cusp normalisation; `𝔸¹ ⊔ 𝔸¹`, one line | lift `= π`, classifying map not closed; `t ↦ (t², t³, [1 : 3t/2])` closed; closed immersion, not iso (not surjective) | holds |
| §2.5 triviality | cusp char 2, 3, 0 | relation `x² dx`, `2y dy`, `−3x²dx + 2y dy`: quotient exists, exists, none | holds; corollary: S01 |
| §2.6 | cusp/`ℚ`, `ℚ(i)`; `k[y]/(y^p − t)` | `𝔸¹_{ℚ(i)}` both sides; not in the Setting | holds |
| §2.7 iterates | cusp char 0, 2; cusp char 2 with `d = 2`; `𝔸²`, `d = 1` | resolved at `i = 1`; never; `X^{(1)} = ∅`; `∅` | holds |
| §3.1 Gauss map | cusp char 3, 2; `𝔸ⁿ` | `[1 : 0]`, `[0 : 1]` constant, closure `≅ X`; one point | holds |
| §3.2 blowup, presentation | `(x)` on `𝔸¹`; cusp char 0, 2; `I = 0` | `X`; `(t³, t⁴)k[t]`, `t⁴/t³ = t`, `𝔸¹`; `(x²)`, `X`; `Bl = ∅ ≠ X*` | holds; `ν_I⁻¹(X_sm)` dense as `I_ξ = (1)` at generic points |
| §3.3 hypersurface | cusp; node; `x^p − y^q`, char `p`; `n = 0`; `n = 1`, `f = x_1` | `(y, x²)`, `(x²)`, `(y)`; `(x, y)`; `(y^{q−1})`; `J = 0`, `Bl = ∅ ≠ Spec k`; `(1)` | holds |
| §4.1 coordinates | identity on `k[x,y]_{(x,y)}`; cusp char 3; `k[x]_{(x^p − t)}` | `x, y`; `x`, `ker q = R dy/(y dy)`; `d(a(x^p − t)) = (x^p − t)da`, none in `m` | holds |
| §4.2 `L_∂` | `d/dx`; `x d/dx`; `k[x]/(x²)`, `∂x = x` | `L(x dx) = dx`; `L(dx) = dx`; `L(x dx) = 2x dx = 0` | holds |
| §4.3 | `ℚ[x]`, `(x²)`; `ℚ[x,y]`, `(y²)`; `𝔽_p[x]`, `(x^p)` | not stable; `(y)` stable; `(x)` not stable | holds |
| §4.4 steps 1–5 | step 4 on `φ : k[X] → R`, `∂_i ∘ φ = φ ∘ ∂/∂X_i`; cusp/`𝔽_2` | contraction zero, `trdeg κ(P) ≥ d`, `P` minimal, contradiction with `T_P = 0`; fails at step 4 as §4.3 fails | holds |
| §5.1 operators | `d = 1`, `p = 2`; `p = 3` | `φ_0 = id − x∂`, `φ_1 = ∂`; inverse rows `(1, −x, x²), (0, 1, −2x), (0, 0, 1)`, `φ_0(x²) = x² − 2x² + x² = 0` | holds |
| §5.2 | `k(t)`; `t^p`; `d = 0` | `1, …, t^{p−1}`; `d(t^p) = 0`; `K = K^p` | holds |
| §5.3 `ψ` iso | `k[x]_m`; cusp char 3; `𝔽_p(t)[s]_{(s)}` | basis `x^α`; `t³` not in span (exponents `6a + 9b + {0, 2, 4}`); rank `p ≠ p²` | holds |
| §5.4 Nash form | cone char ≠ 2; curve over `𝔽_p(t)` | `J = (x, y, z)`; `ν` iso, not smooth | holds |
| §§6.1–6.4 | cusp char 2; `y² = x²z` char 2; curve `C`, `k' = k(τ)` | `X* ≅ X`, `X̄* = 𝔸¹`; `J = (x²)`, `X* = X`; `s ↦ (−s² − τ, s^p)`: `u^p + y² = −s^{2p} + s^{2p} = 0`, bijective, not iso | holds |
| §§7.1–7.3 | `m = 0`; cusp char 2, `m = 1`; `Y_{jm}` | hypothesis vacuous, conclusion fails (so `m ≥ 1`); no `X^{(i)}` smooth; `Y_{2m} ⊇ Y_m ⊇ X` | holds |

## Headline theorems and padding

Headlines of the README Summary: the triviality criterion (§2.5), Nobile's theorem (§4.5), the theorem of Duarte
and Núñez-Betancourt (§5.4), the criteria for `ν̄` (§6.4), the never-resolves principle (§7.3), Nobile's blowup
description (§§3.2, 3.3), and the two differential forms (§§4.4, 5.4). The two differential forms are stated in
`Suggested.lean`; the others need `X*`, and the module docstring names each with the missing carrier. The
docstring's library claims hold at the pin: `Module.Grassmannian.scheme` is over `Spec R` with points on affine
schemes only (`TauCeti/AlgebraicGeometry/Grassmannian/Points.lean`, `schemeHomEquiv`), and
`TauCeti/AlgebraicGeometry/RelativeProj/` has `relativeProj` and its twisting sheaf but no classifying map.
Padding: none (one definition with a real body, two theorems, no example, no `#check`).

## Dependency check

```
depcheck: 243 roadmaps, 2249 edges, 0 problem(s)
```

No UPWARD, CYCLE or `moved:` line. `design/plan.json` has `gaps: []` and the README declares none.

## Verified sound

- **Declarations read:** 3 of 3, each against its elaborated type and README statement (table above).
- **Targets read:** 49 named `Prove`/`Define`/`Corollary` statements in 38 subsections with Checks; values in the
  table above.
- **Locators verified in this pass:** 41 line locators in 8 cached texts (stacksAlgebra 12, stacksVarieties 5,
  nashModificationNotes2024 9, duarteNunezBetancourt2020 6, castilloDuarteLeytonLiendo2026 3, nobile1975 4,
  hamann2003 1, gonzalezSprinberg1982 1); all resolve to the statement cited, at the generality the README
  attributes to the source. The remaining locators were not re-read; their text is unchanged since round 1.
- **Checks tested:** every Check bullet of the 38 Checks blocks was read and the values recomputed (table); none
  false, vacuous or a restatement; each definition (§§0.1, 0.3, 0.6, 0.7, 1.2, 2.1, 2.7, 4.2, 6.1, 7.1) has at
  least three.
- **Sibling citations checked (14 sections of 7 roadmaps, each at its current text):** AlgebraicModuliForArithmeticGeometry §1.3
  (`coherentGrassmannian`, `plucker`, base change, `Gr_1(E) ≅ P(E)`, properness over `Spec R`) and §5.4
  (`ArithmeticModuli.DMNormalization.stack`, `.finite`, `ArithmeticModuli.DMSchematicClosure.stack`) at its open
  head; DerivedDeRhamCohomology §0.23 (`DerivedDeRham.IsPBasis`, `DerivedDeRham.pBasis_kaehler_basis`, the
  converse half in the prose) at its open head, which resolves both leads of `scratch/citations.md`;
  SchemeAndStackFoundations §§0.7, 0.11 (`field_extension_descent`, smooth among the seven properties), 0.17,
  0.23, 0.30, 4.11, 4.13 (*regularLocus_eq_smoothLocus*) on main; EnhancedDerivedSheaves §E1.6
  (`isRegular_of_frobenius_flat`, `[CharP R p] [IsNoetherianRing R]`); ResolutionOfSingularitiesCharacteristicZero
  §2.15; DiophantineApproximationAndTranscendence §5.6; AdicSpacesPartIII §R3.6. One deviation: S02.
- **Pinned declarations checked:** 27 Mathlib and 52 Tau Ceti names of the supplier contracts found at the pins in
  the files and namespaces the README gives. Statements read in full: `Algebra.IsTranscendentalSeparable` with its
  two instances, `Scheme.Hom.smoothLocus`, `dense_smoothLocus_of_perfectField`,
  `isIso_of_isClosedImmersion_of_surjective`, `ext_of_isDominant_of_isSeparated`, `IsClosedImmersion.comp_iff`,
  `tfae_universallyInjective`, `Module.Grassmannian`, `normalizationDesc`, the `[Smooth g]` instance of
  `normalizationPullback`; `IsPureDimensional`, `FixedRank`, `IsModification`,
  `fittingIdeal_kaehlerDifferential_quotient_span_singleton`, `powRingHom_finite`, `LinearMap.bijective_of_depth`,
  `isNormalScheme_Spec_iff_forall_localization`, `IsNormalScheme.isDiscreteValuationRing_stalk`,
  `kerCotangentToTensor_bijective_of_formallyEtale`, `isIso_normalizationDesc_iff`,
  `rank_relativeDifferentials_apply`, `smoothOfRelativeDimension_iff_ringKrullDim_stalk_eq`,
  `isPureDimensional_pullback_Spec_map_iff_of_field`, `Smooth.geometricallyReduced`.
- **Ownership:** `roadmaps grep` (main and the 470 open heads) for Nash blowups and modifications, geometric
  normality (the notion, `IsGeometricallyNormal`, tags 0C30, 06DF, 0C3M, 0C3N), tags 01UV, 01V0, 01UZ, 01UX, the
  predicate and both theorem names, `lieDerivative`: no other owner; other roadmaps use "geometrically normal" as
  a hypothesis only. No declaration of `Suggested.lean` shares a fully qualified name with a readable roadmap.
  `scratch/overlaps.md`: no second copy, no dropped id; main has no `NashBlowups` folder.
- **Policy:** the pull request changes only `packages/NashBlowups/`; no pull-request number, process narrative,
  `lemma`, `set_option`, `#eval` or algorithm in the README or the Lean file; imports are `import Mathlib` and
  four `TauCeti.*` modules.
- **Arrangement:** nashModificationNotes2024 has Sections 1–7. Layer 1 ↔ Section 3, Layer 2 ↔ Sections 1–2,
  Layer 4 ↔ Section 2, Layer 5 ↔ Section 5, Layers 0, 3, 6, 7 ↔ none, Sections 4, 6, 7 ↔ none: not one to one
  and not in order. §§1.2, 1.3, 1.4 run parallel to gonzalezSprinberg1982 §§1.1–1.3 (9 of 120 locators); that
  order is forced by the *Needs* lines (§1.3 needs §1.2; §1.4 needs §§1.2, 1.3) and the scope differs (a general
  sheaf `F`, scheme-theoretic images, density hypotheses).

Source independence: 11 passages compared with 7 sources (README §§0.6, 1.1, 1.2, 2.4, 3.2, 4.3, 5.1, 5.3, 7.3
and both theorem docstrings, against stacksAlgebra, stacksVarieties, gonzalezSprinberg1982,
nashModificationNotes2024, nobile1975, hamann2003, duarteNunezBetancourt2020, castilloDuarteLeytonLiendo2026),
none shared beyond theorem statements the mathematics forces (longest run: the hypothesis list of stacksAlgebra
line 21516); largest share nashModificationNotes2024, 23 of 120 locators; contents compared with
nashModificationNotes2024: independent; no table, figure or list taken over.

## Not verifiable

- Elaboration: no Lean command is permitted in this pass; the types of `scratch/signatures.md` were used.
- hironaka1983, spivakovsky1990, semple1954, teissier1982, ega1: uncertified, not read; background only.
- alperModuli "printed p. 62" (`README.md:492`): the cached text has line numbers only.
- The journal data of duarteNunezBetancourt2020 and castilloDuarteLeytonLiendo2026: only the arXiv texts were read.
- DiophantineApproximationAndTranscendence §5.6: the adapter paragraph names no carrier of its own and its
  `Suggested.lean` does not declare `lieDerivativeOneForm`; the README's reading (fields `C ⊆ F`, characteristic
  zero) rests on the words "C-linear" and on the Checks there.
- AlgebraicModuliForArithmeticGeometry and DerivedDeRhamCohomology were read at their open heads, not on main.

## Source issues

- **Misprint** in nashModificationNotes2024 at Theorem 5.1, printed p. 10: the source says the modification of a normal variety is an isomorphism exactly when the variety is singular; it should be nonsingular; affects a stated result.
- **Misprint** in nashModificationNotes2024 at Theorem 6.2, printed p. 13: the source says the normalised modification is an isomorphism exactly when the variety is an isomorphism; it should be when the variety is nonsingular; affects a stated result.
- **Misprint** in nashModificationNotes2024 at Proposition 2.2, printed p. 5: the source says the proposition and its introductory paragraph twice, the second time as Proposition 2.3; it should be stated once; affects nothing.
- **Gap** in nashModificationNotes2024 at Section 2, printed p. 4: the source says every morphism with a rank-d locally free quotient factors uniquely through the modification; it should require a reduced source with dense preimage of the regular locus; affects a stated result.
- **Misprint** in hamann2003 at the proof of Lemma 0.1, printed p. 2: the source says the radical is the annihilator of an element outside it; it should be that the minimal prime is the colon ideal of the radical by that element; affects the proof.
- **Misprint** in nobile1975 at Example 1, printed p. 300: the source says the Jacobian-ideal centre comes from Remark 1; it should be Remark 2; affects nothing.
- **Misprint** in duarteNunezBetancourt2020 at the proof of Theorem 3.10, printed p. 6: the source says the last sum for the corrected derivations with row index k; it should be the index t of the left side; affects nothing.

## For the human reviewers

- **Scope.** The source cited most (23 of 120 locators) is nashModificationNotes2024, an arXiv survey (v1) with no journal reference in `packages/NashBlowups/sources.toml`; the headline theorems also cite the refereed nobile1975 and duarteNunezBetancourt2020.
- **Scope.** The characteristic-`p` headline of `packages/NashBlowups/Suggested.lean` (§5.4, differential form) is stated by no source as a theorem; duarteNunezBetancourt2020 proves it inside the proof of Theorem 3.10 (lines 258–305).
- **Licence.** hamann2003 (arXiv:math/0311006v1), the only locator of §4.3, has no journal reference in `packages/NashBlowups/sources.toml`; it records its Lemma 0.1 as folklore (line 55).
- **Licence.** alperModuli is a dated draft on its author's page (`licence_class = "author-page"`); the README takes one proof step from it by locator (§0.4).

<!-- tauceti-roadmap-review {"agent": "claude", "head": "092ba8107f2bc5bc8de363626dbb45a9ae7a7719", "job": "RT-NashBlowups~2a", "model": "fable", "worker": "chris-x90"} -->
