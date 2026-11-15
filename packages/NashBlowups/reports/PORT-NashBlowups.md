# PORT-NashBlowups

- Branch: `roadmap/nash-blowups`, from main at `3ace260`.
- Head commit: `f8bd78516315554946271bfbb78edb51e4bdf131`, message
  `NashBlowups: roadmap (README, Suggested.lean, metadata)`.
- Folder: `TauCetiRoadmap/NashBlowups/{README.md,Suggested.lean,metadata.toml}`; nothing outside it changed
  (`git diff --stat origin/main..HEAD`: 3 files, 1873 insertions, all in the folder).

## Build

`lake build TauCetiRoadmap.NashBlowups.Suggested`:

    Build completed successfully (18386 jobs).

2 warnings, both `declaration uses 'sorry'` (lines 74 and 90, the two theorems); no other warning, no error.

## Gate

    gate NashBlowups: set_option=0 blob=0 latex=0 tex=0 prnum=0 sorry-data=0 sorry-examples=0 residue=0 private-paths=0 imports=0 mathlib-subimports=0 no-import-mathlib=0 lean-lines=0 statement-hygiene=0 forbidden=0 dropped=0 readme-ids-missing=0 empty-sections=0 round-labels=0 long-fences=0 layer-ids=0 target-ids=0 depcheck=0 metadata=0 stray-files=0 dirty=0 outside-folder=0 source-material=0 OK

## Dependency check

    depcheck: 240 roadmaps, 2258 edges, 0 problem(s)

No UPWARD, CYCLE or `moved:` line. `roadmaps resolve` on the ported README: no cross-roadmap citation and no Lean
name found nowhere. `roadmaps overlaps` on the ported README: no other pull request changes this roadmap, no cited id
is dropped by an open pull request, no cited id is defined only by an open revision, no second copy.

## Draft pull request body

This roadmap builds the Nash blowup of a reduced scheme `X` of finite type over an arbitrary field `k`, pure of
dimension `d` with dense smooth locus, intrinsically: first, once and for all, the Nash modification of a
quasi-coherent sheaf of finite type along a dense open where it is locally free (the reduced closure of the
classifying map in the Grassmannian of locally free quotients, with its universal property, Plücker form, locality
and flat base change), and then its specialisation to `Ω_{X/k}`, the Nash blowup `ν : X* → X` with its Nash
cotangent bundle, the normalised Nash blowup `ν̄ : X̄* → X`, and both iterations. Along the way it proves properness
and the modification property, the universal property, locality and compatibility with field extensions (separable
ones, possibly transcendental, for `ν̄`), the Gauss-map description of an embedded variety, and Nobile's theorem that
the Nash blowup is locally the blowup of an ideal, with the Jacobian ideal for a hypersurface. Its headline theorems
are the intrinsic triviality criterion (`ν` is an isomorphism iff `Ω_{X/k}` has a locally free quotient of rank
`d`), Nobile's theorem in characteristic zero and the theorem of Duarte and Núñez-Betancourt for normal `X` over a
perfect field of characteristic `p` (`ν` is an isomorphism iff `X` is smooth), the corresponding criteria for `ν̄`,
and the principle by which a singular `X` reappearing as an open subscheme of an iterate is never resolved, the
form in which the theorem of Castillo, Duarte, Leyton-Álvarez and Liendo (iterated Nash blowups fail to resolve
singularities in dimension at least four) is applied. The two smoothness criteria are proved through their
differential forms, which need no Nash blowup and are stated in `Suggested.lean` against the pinned Mathlib and
Tau Ceti: a reduced (respectively normal) `X`, locally of finite type and pure of dimension `d` over a field of
characteristic zero (respectively a perfect field of characteristic `p`), is smooth iff `Ω_{X/k}` admits a locally
free quotient of rank `d`. To reach them over an arbitrary field rather than an algebraically closed one, the
roadmap develops the commutative algebra the sources leave implicit: the Lie derivative on the Kähler differentials
of any algebra over a field, Seidenberg's lemma on minimal primes over a derivation-stable ideal, coordinates from a
free quotient of the differentials, the `p`-monomial operators and the freeness of the Frobenius pushforward of a
normal local ring, and the normality of base changes along separable extensions of the ground field. The Nash
blowup itself is a README target: its carrier, the Grassmannian of quotients of a quasi-coherent sheaf on a
non-affine base, is AlgebraicModuliForArithmeticGeometry §1.3, and the module docstring of `Suggested.lean` lists
the headline theorems that wait for it.

## Roadmaps this one depends on that are still pull requests

- **AlgebraicModuliForArithmeticGeometry** (new roadmap, earlier in the merge order): §1.3 `coherentGrassmannian`
  (arbitrary base, universal quotient, unique classifying maps, base change, `Gr_1(E) ≅ P(E)`, properness over
  `Spec R` for a finite module, affine points) and `plucker`; §5.4 `ArithmeticModuli.DMNormalization.stack`,
  `ArithmeticModuli.DMNormalization.finite`, `ArithmeticModuli.DMSchematicClosure.stack`. Read at its head through
  `roadmaps show`; every contract bullet of the README matches the text there.
- **DerivedDeRhamCohomology** (new roadmap, earlier in the merge order): §0.23, `p`-bases (the two-sided statement
  in prose, `DerivedDeRham.IsPBasis`, `DerivedDeRham.pBasis_kaehler_basis` in its `Suggested.lean`). Read at its head.

Suppliers on main, checked there: SchemeAndStackFoundations §§0.7, 0.11 (`field_extension_descent`), 0.17, 0.23,
0.30, 4.11 (`IsModification.Witness`), 4.13 (`regularLocus_eq_smoothLocus`); EnhancedDerivedSheaves §E1.6
(`isRegular_of_frobenius_flat`, also present at the heads of both open revisions of that roadmap);
ResolutionOfSingularitiesCharacteristicZero §2.15; DiophantineApproximationAndTranscendence §5.6
(`lieDerivativeOneForm`, `exists_lieDerivativeOneForm`, in the setting of characteristic-zero fields `C ⊆ F`).
The Scope also names, as non-suppliers, ResolutionOfSingularitiesCharacteristicZero §7.8 and AdicSpacesPartIII
§R3.6, both on main.

## What moved from the Lean to the README

Nothing. The package's `Suggested.lean` already had the required form: one predicate with a real body on pinned
carriers (`HasLocallyFreeQuotientOfDifferentials`) and the two statable headline theorems, no padding, no sorry'd
data, no `set_option`, imports `Mathlib` plus four `TauCeti.*` modules, each used and each present at the pin. The
only change is in the module docstring (see "README fixes"). No statable headline is missing: every other headline
(triviality criterion, blowup and hypersurface descriptions, the Nash forms of Nobile and of Duarte and
Núñez-Betancourt, the criteria for `ν̄`, the never-resolves principle) needs `ν : X* → X`, whose construction needs
the Grassmannian of a sheaf on a non-affine base; stating the hypersurface or affine case in its place would be a
weakened substitute, and is not done.

## `#check` pass

One scratch copy of `Suggested.lean` with `#check @name` for its three declarations, elaborated once with
`lake env lean` (a copy rather than an importing file, because the declarations of a `module` file without a
`public section` are not visible to an importer; 33 `module` roadmaps on main have the same form). Elaborated types:

- `HasLocallyFreeQuotientOfDifferentials : (k : Type u_1) → [CommRing k] → (X : Scheme) → [X.Over (Spec ↧k)] → ℕ → Prop`
  (README §0.7: commutative ring `k`, scheme over `Spec k`, `d ∈ ℕ`).
- `smooth_iff_hasLocallyFreeQuotientOfDifferentials_of_charZero : ∀ (k) [Field k] [CharZero k] (X : Scheme) [X.Over (Spec ↧k)] [IsReduced X] [LocallyOfFiniteType (X ↘ Spec ↧k)] (d : ℕ), TauCeti.IsPureDimensional d ↥X → (Smooth (X ↘ Spec ↧k) ↔ HasLocallyFreeQuotientOfDifferentials k X d)`
  (README §4.4, same hypotheses).
- `smooth_iff_hasLocallyFreeQuotientOfDifferentials_of_isNormalScheme : ∀ (p : ℕ) [Fact (Nat.Prime p)] (k) [Field k] [CharP k p] [PerfectField k] (X : Scheme) [X.Over (Spec ↧k)] [IsNormalScheme X] [LocallyOfFiniteType (X ↘ Spec ↧k)] (d : ℕ), TauCeti.IsPureDimensional d ↥X → (Smooth (X ↘ Spec ↧k) ↔ HasLocallyFreeQuotientOfDifferentials k X d)`
  (README §5.4, same hypotheses).

The file has no section `variable`s; no binder is lost; nothing changed. A second scratch file with `#check @` of
81 library names the README cites (Tau Ceti differentials, stalks, fixed-rank sheaves, smooth locus, local dimension,
depth, normality, étale normality, Serre's criterion, pure dimension, vanishing ideals, exterior powers, Frobenius,
the Grassmannian scheme and its points, and the Mathlib names of the contracts) elaborated with no error on any of
them. Nine Tau Ceti names live in modules with no built object file in the shared cache and were checked at source
level instead, with their namespaces: `TauCeti.AlgebraicGeometry.Smooth.geometricallyReduced`,
`TauCeti.fittingIdeal_kaehlerDifferential_quotient_span_singleton`,
`KaehlerDifferential.kerCotangentToTensor_bijective_of_formallyEtale`,
`AlgebraicGeometry.Scheme.IdealSheafData.{blowupLift, blowup_hom_ext, isIso_blowupToBase_iff, isProper_blowupToBase}`,
`AlgebraicGeometry.Scheme.Hom.isIso_normalizationDesc_iff`, `TauCeti.powRingHom_finite`. A source-level sweep of all
backticked library identifiers of the README (129 names) found every one at the pins.

## Supplier replacements and duplication removals

No replacement and no removal: no target of this roadmap is stated by the pins or by another roadmap. Searched by
object over main and the open heads (`roadmaps grep`), and by reading the sibling heads of
SchemeAndStackFoundationsPartII and DirectSummandsAndBigCohenMacaulay: Nash blowups or modifications, Gauss maps
(only the continued-fraction and dual-variety maps), Seidenberg's lemma and derivation-stable ideals (only
enveloping-algebra ideals for Ado's theorem), Lie derivatives (manifold forms; DiophantineApproximationAndTranscendence
§5.6 for fields), `p`-bases (DerivedDeRhamCohomology §0.23, cited), Frobenius pushforward and Kunz (EnhancedDerivedSheaves
§E1.6, cited), geometric normality (used as a hypothesis only), colimits of normal rings, the Stacks tags of Layer 0,
dense smooth locus, Jacobian and Fitting ideals of differentials (PhiGammaModulesAndIwasawaCohomology blows up a
Fitting ideal of a map of locally free sheaves on rigid spaces, another object), pullback and base-change maps of
scheme differentials, the smooth locus of a fixed dimension, normalisation under field extension. This roadmap is the
owner of what it states; no declaration of `Suggested.lean` has the name of a declaration in another roadmap.

Three objects come close and now carry a one-clause "kept variant" note in Scope and ownership:

- AlgebraicModuliForArithmeticGeometry §1.3 builds `Gr_r(E)` locally as a closed subscheme of the Grassmannian of a
  free sheaf mapping onto `E`; §0.4 states the closed immersion `Gr_r(E) → Gr_r(E')` for an arbitrary surjection,
  globally.
- ResolutionOfSingularitiesCharacteristicZero §7.8 proves, in characteristic zero, that generic reducedness is
  equivalent to density of the smooth locus; §1.1 concerns reduced schemes over an arbitrary field, where the
  condition is geometric reducedness.
- AdicSpacesPartIII §R3.6 has `AlgebraicGeometry.RelativeDifferentialData` (scheme differentials over a base that
  need not be affine) with its affine identification only; §§0.1–0.2 (comparison and base-change maps over an affine
  base) are not planned there.

## README fixes made in the upstream read

1. Scope and ownership: the three kept-variant clauses above (an ownership boundary a reader could not draw before).
2. Exact supplier contracts: "No gap is recorded: every input above is stated by its owner" referred to the board's
   gap mechanism; it now reads "Every input above is stated by the library or roadmap under which it is listed."
3. `Suggested.lean` module docstring: the reason the Nash blowup is not statable said only that the pinned
   Grassmannian is over an affine base, which a reader could answer with "then state it for affine `X`". It now adds
   that the pinned Grassmannian's morphisms are described from affine schemes only
   (`Module.Grassmannian.schemeHomEquiv`), so even for affine `X` the classifying map of the smooth locus, which need
   not be affine, is unavailable (checked at the pin: `TauCeti/AlgebraicGeometry/Grassmannian/Points.lean`; the
   relative `Proj` of `TauCeti/AlgebraicGeometry/RelativeProj/Basic.lean` has no universal property for invertible
   quotients, as the docstring says).

No mathematical statement, hypothesis, Check or locator needed correction; the pass below found none false.

## Adversarial pass

Values computed this round. "Holds" means both sides of every instance agree with the statement; every hypothesis
listed as needed has its separating instance in the row.

| Statement | Instances tried | Values computed | Result | Change |
|---|---|---|---|---|
| Convention: quotients, not subspaces | line `y = 2x` in `𝔸²`; §0.4 Check 1; §3.1 cusp in char 3 and 2 | `Ω ⊗ κ = κ·dx`, `dy = 2dx`: `dx ↦ 1, dy ↦ 2`, `[1 : 2]`, kernel `2dx − dy` gives the conormal `[2 : −1]`; `(a, b) ↦ a` is `[1 : 0]`; `dy = 0` on `X_sm` gives `[1 : 0]`, `dx = 0` gives `[0 : 1]` | consistent in all four places | none |
| Convention: separable extension | `ℚ(u)/ℚ`; `𝔽_p(t)(t^{1/p})/𝔽_p(t)` | `{u}` separating transcendence basis; `t^{1/p}` has no separating basis (`y^p − t` inseparable) | `IsTranscendentalSeparable` includes the first, excludes the second | none |
| Convention: `X_sm^{(d)}`, quotient of rank `d` | `𝔸² ⊔ 𝔸¹`; `∅` | `X_sm^{(2)} = 𝔸²`, `X_sm^{(1)} = 𝔸¹`, `X_sm^{(0)} = ∅`; `E = 0` of constant rank `d` for all `d` | holds | none |
| §0.1 `c_f` | `t ↦ (t², t³)` char 0 and 2; identity of `𝔸¹`; `Spec k → 𝔸¹` | `dx ↦ 2t dt`, `dy ↦ 3t² dt`; char 2 `0`, `t² dt`; `dx ↦ dx`, zero map excluded by `c_f(f*dh) = d(f*h)`; `k·dx → 0` onto, not injective | holds | none |
| §0.2 base change; closed immersions | `Spec k(s)/k`; `K = 𝔽_p(t)[y]/(y^p − t)`, `k' = k(τ)`; `ℤ → 𝔽₂`, `𝔸¹` | `c: 0 → k(s)ds` not iso, `b: 0 → 0` iso; `X' = k'[u]/(u^p)`, `Ω_{X'/k}` free on `dτ, du`, `c(dy) = dτ + du`, `b(dy) = du` iso; identity on `𝔽₂[T]dT` | holds; no flatness or reducedness used | none |
| §0.3 `X_sm^{(d)}` and rank `= dim_x X` | `𝔸² ⊔ 𝔸¹`; cusp/ℚ; `k[ε]/(ε²)` both characteristics | as Convention row; complement of origin; `Ω ⊗ κ = k·dε` (rank 1) with `X_sm = ∅` | holds | none |
| §0.4 `mapOfSurjective` | `S = Spec k[x₁, x₂, …]`, `p(a, b) = a`, `r = 1, 2`; `p = id` | section `[1 : 0]` of `ℙ¹_S`, zero locus of the second coordinate (non-Noetherian `S`); `Gr_2(O) = ∅ ↪ Gr_2(O²) = S`, image empty; identity | holds | Scope clause |
| §0.5 smooth iff regular at closed points | cusp; `𝔸ⁿ`; `Spec k(t^{1/p})` over `𝔽_p(t)`; `∅` | `y² − x³ ∈ m²`, embedding dim `2 > 1`; regular everywhere; a field (regular), `Ω = K dy ≠ 0` (not smooth); vacuous both sides | holds; perfectness needed | none |
| §0.6 `isNormal_directLimit` | `k[x] → k → k → ⋯` (`x ↦ 0`); `ℚ̄ ⊗_ℚ ℚ̄`; zero rings | colimit `k`; colimit of `ℚ̄^{[L:ℚ]}`, absolutely flat, local rings fields; `0` (no primes) | holds; no Noetherian hypothesis | none |
| §0.6 `IsGeometricallyNormal` | `ℚ(i)/ℚ`; `A = 𝔽_p(t)(t^{1/p})`; `A = k[x, y]/(x^p + y² + t)`, `p > 2`; `k(s)`; `A = 0` | `K(i)` or `K × K` (normal, not a domain for `K = ℚ(i)`); `K ⊗ A = K[y]/((y − t^{1/p})^p)` nonreduced; `K[u, y]/(u^p + y²)` a domain, not normal; localisation of `K[s]`; `0` normal | definition determines the notion; geometric reducedness excluded by the third | none |
| §0.6 tensor and separable bullets | `ℚ(i) ⊗ ℚ(i)`; `k(s) ⊗ K`; `k' = B = 𝔽_p(t)(t^{1/p})` | `n = 0`, étale over `ℚ(i)`, `ℚ(i)²`; `n = 1`, localisation of normal `K[s]`; inseparable, nilpotent `y − τ` | holds; separability needed | none |
| §0.6 `isNormalScheme_pullback_…` | `Spec ℚ(i)`, `k' = ℚ(i)`; curve `C: x^p + y² + t`, `k' = k(t^{1/p})`; `k' = k(s)`, `W = 𝔸¹`; `ℚ̄ ⊗ ℚ̄` | two reduced points (normal, not integral); `u^p + y² = 0`, cotangent space at `u = y = 0` of dim 2, normalisation `s ↦ (−s², s^p)`: `−s^{2p} + s^{2p} = 0` (`p` odd); `k(s)[y]` PID; absolutely flat | holds; separability needed, Noetherian not | none |
| §0.7 predicate | `∅`; `𝔸¹`, `d = 0, 1, 2`; `k[ε]/(ε²)`, `d = 1`; cusp/𝔽₂, cusp/ℚ; `𝔸²`, `d = 1`; node | true all `d`; true, true, false (fibre dim `1 < 2`); true iff char 2 (`Ω = k·dε` killed by `ε` otherwise); `d(y² − x³) = x²dx`, `dy ↦ 1` well defined, `x²c = 0 ⇒ c = 0`; `b = (3t/2)a`, no unit; kernels `O dy ≠ O dx`; `ya + xb = 0` forces `a ∈ (x)`, `b ∈ (y)` | "`Ω` locally free" excluded by cusp/𝔽₂; density needed for uniqueness | none |
| §0.7 restriction, smooth, uniqueness, glueing, stalk criterion | `V ⊆ 𝔸¹`; `𝔸ⁿ`, `d = n`; cusp/𝔽₂ | restriction of `dx ↦ 1`; identity of `Ω` rank `n`; every rank-1 quotient kills `dx`, sends `dy` to a unit: one kernel | holds | none |
| Layer 0 Examples, conormal bijectivity | `k[x]_{(x)}`; `R = k`; `k[x₁, x₂, …]_{m}`; `k[x]_{(x^p − t)}` over `𝔽_p(t)` | `x ↦ dx`; `0 → 0`; `x_i ↦ 1 ⊗ dx_i` bases; `d(x^p − t) = 0`, not onto | holds; separability needed | none |
| §1.1 setting (1)–(4) | `𝔽_p(t)[y]/(y^p − t)`; `k[ε]/(ε²)`; `𝔸² ⊔ 𝔸¹`; reduced `X` with dense `X_sm` | field, `Ω = K dy ≠ 0`, `X_sm = ∅`, not geometrically reduced; not reduced; `X_sm ≠ X_sm^{(2)}`; route: `g` outside minimal primes is a nonzerodivisor, `A ⊗ k' ↪ A_g ⊗ k'` reduced | holds both directions; pure dimension needed for (4) | Scope clause (RoS §7.8) |
| §1.2 `nashModification` | `F` locally free; `O ⊕ O/(x)` on `𝔸¹`, `U = D(x)`; ideal of `0 ∈ 𝔸²` | section with closed image, `N ≅ X`; `Proj k[x][A, B]/(xB)`, fibre `ℙ¹`, closure `V(B) ≅ X`, `L = O`; `Proj Rees(m) = Bl_0 𝔸²`, fibre `ℙ¹` | holds; whole Grassmannian excluded | none |
| §1.3 lift | identity; `Spec k →` origin with `(a, b) ↦ b`; `Bl_p X → X`, `r ≥ 2`, `r = 1` | `q = π_N⁻¹`; point `[0 : 1] ∉ V(B)`, `h⁻¹(U) = ∅`; `q = h` not iso; `m_p` invertible, `Bl_p X = X` | holds; density needed | none |
| §1.4 Plücker form | `𝔸¹`, `F = O² ⊕ O/(x)`, `r = 2`, `U = D(x)` | `∧²F = O ⊕ (O/(x))²`; both `N` are `X`, the quotients killing torsion; `∧²(O²) = O = L_{∧²F}` | holds | none |
| §1.5 restrict, flat base change | `V ⊆ U`; `g = U ↪ X`; `{0} ↪ 𝔸²` | `π_N⁻¹(V) ≅ V`; both `U`; `I ⊗ k = k²`, `N({0}, k², 1, ∅) = ∅` against fibre `ℙ¹` | holds; flatness needed | none |
| §2.1 `nashBlowup`, `nashCotangent` | smooth; cusp char 0/≥ 5; node; `Spec k`, `d = 0` | `ν` iso, `L = Ω`; `2t³dy = 3t⁴dx`, `dy = (3t/2)dx`, `e = 2dy − 3t dx`, `t³e = 0`, `ν*Ω = k[t]dx ⊕ k[t]/(t³)`; branches `[1 : 0]`, `[0 : 1]`, `X* = 𝔸¹ ⊔ 𝔸¹`; `X* = X` | holds | none |
| §2.2 proper, modification | cusp char 0; `y² = x²z` char `≠ 2`; smooth rel. dim `d` | finite birational, not iso; `(u, uv, v²)` satisfies `y² = x²z`, fibre ideal `(u, v²) = (vw, v²)` in chart `u = vw` (embedded point), reduced fibre `ℙ¹`; witness `X` | holds | none |
| §2.3 setting preserved | cusp char 0, 2; `𝔸² ⊔ 𝔸¹`, `d = 2` | `𝔸¹`; `X* ≅ X` with dense `X_sm`; `X* = 𝔸²`, `ν` not surjective | holds; pure dimension needed | none |
| §2.4 lift, `isIso_lift_iff` | `Bl_0 𝔸² → 𝔸²`; cusp/ℚ with `𝔸¹`; one line of `𝔸¹ ⊔ 𝔸¹`; `Spec k →` cusp point | lift `π`, classifying map `π` not a closed immersion, both sides false; `k[t², t³, 3t/2] = k[t]`, both true; closed immersion, lift not iso (`π` not surjective); `h⁻¹(X_sm) = ∅` excluded | holds; surjectivity needed | none |
| §2.5 triviality criterion; corollary | cusp char 2, 3, 0; `𝔸² ⊔ 𝔸¹`, `d = 2`; `∅` | `x²dx`: `dy ↦ 1`; `2y dy`: `dx ↦ 1`; `b = (3t/2)a`, `t ∉ k[[t², t³]]`; `X* = 𝔸² ≠ X`; both iso | holds; relative dimension `d` needed in the corollary | none |
| §2.6 restrict, field base change | cusp/ℚ, `k' = ℚ(i)`; `V = X_sm`; `𝔽_p(t)[y]/(y^p − t)` | `𝔸¹_{ℚ(i)}` both sides; `V* = V`; `k'[u]/(u^p)` nonreduced, outside the Setting | holds | none |
| §2.7 `nashIterate`, resolves | smooth; cusp char 0; cusp char 2 with `d = 1` and `d = 2`; `𝔸²`, `d = 1` | `X^{(i)} = X`, `i = 0`; `i = 1`; `X^{(i)} ≅ X` never smooth; `X_sm^{(2)} = ∅`, `X^{(1)} = ∅` smooth; `X^{(1)} = ∅` | holds; meaningful only with `X`'s own `d`, as stated | none |
| §3.1 Gauss map | line `y = 2x`; cusp char 0/≥ 5, 3, 2; `𝔸ⁿ` | `[1 : 2]`; `[1 : 3t/2]` (`3/2 = 4` in `𝔽₅`), closure `≅ 𝔸¹`; constant `[1 : 0]`, `[0 : 1]`, closure the cusp; one point of `Gr_n(kⁿ)` | holds; char `≠ 2, 3` needed for `≅ 𝔸¹` | none |
| §3.2 blowup description; presentation | `𝔸¹`, `dx ↦ x`; cusp char 0, 2; `I = 0`; node | `I` invertible, `Bl = X`; `(y, x²)`, `Bl = 𝔸¹`; `(x²)` principal, `Bl = X`; `Bl_0 = ∅ ≠ X*`; basis `dx + dy` of `Ω ⊗ Q(A) = k(x) × k(y)`, cleared by `x + y`: `dx ↦ x`, `dy ↦ y`, `2xy = 0`, `Bl_{(x,y)} = 𝔸¹ ⊔ 𝔸¹` | holds; iso over `X_sm` needed | none |
| §3.3 hypersurfaces | cusp char 0, 2, 3; node; `x^p − y^q` char `p`, `gcd = 1`; `n = 0`, `f = 0`; `n = 1`, `f = x`; `f = 1` | `(2y, 3x²) = (y, x²)`, `(x²)`, `(y)`; `(x, y)`; `f_x = 0`, `J = (y^{q−1})`, curve `(t^q, t^p)` singular; `J = 0`, `Bl = ∅ ≠ Spec k`; `J = (1)`; `X = ∅` both sides. Sign, `n = 2`: `dx₂ ↦ ∂₁f`, `dx₁ ↦ −∂₂f` | holds; `n ≥ 1` needed | none |
| §4.1 coordinates | `k[x, y]_{(x,y)}`; cusp char 3; `d = 0`; `k[x]_{(x^p − t)}` over `𝔽_p(t)` | `∂/∂x, ∂/∂y`; `∂(y² − x³) = −3x² = 0`, `ker q = R dy/(y dy)`; no coordinates; `d(a(x^p − t)) = (x^p − t)da`, `q(dm) ⊆ m` | holds; separability needed for `x_j ∈ m` | none |
| §4.2 Lie derivative, stable annihilators, agreement | `k[x]`, `d/dx` and `x d/dx`; `∂ = 0`; `k[x]/(x²)`, `∂x = x` | `L(x dx) = dx`, `L(dx) = 0`; `L(dx) = dx ≠ 0`; `0`; `L(x dx) = 2x dx = 0` in `R dx/(x dx)`; `D(a ⊗ b − ab ⊗ 1)` gives `∂a db + a d(∂b)` | holds | none |
| §4.3 Seidenberg | `ℚ[x]`, `(x²)`; `ℚ[x, y]`, `(y²)`, `∂/∂x`; `𝔽_p[x]`, `(x^p)` | `(x²)` not stable; `(y)` stable; `(x^p)` stable, `(x)` not (`∂x = 1`) | holds; `ℚ ⊆ R` needed | none |
| §4.4 `…_of_charZero` (Lean) | `∅`; cusp/ℚ; node/ℚ; `ℚ[ε]/(ε²)`, `d = 0`; `𝔸²_ℚ ⊔ 𝔸¹_ℚ`, `d = 2`; cusp/𝔽₂; `Spec ℚ(u)`, `d = 0`; `Spec K`, `K/ℚ` finite | both true; both false; both false; right true, left false (`IsReduced`); hypothesis fails and right false (pure dimension); right true, left false (`CharZero`); right true (`E = 0`), left false, not of finite type (`LocallyOfFiniteType`); both true | holds; every hypothesis separated by an instance | none |
| §4.5 Nobile | cusp/ℚ; node char 0; cusp char 2 | singular, `ν` not iso; `𝔸¹ ⊔ 𝔸¹ ≠ X`; singular with `ν` iso | holds; char 0 needed | none |
| §5.1 `p`-monomial operators | `d = 1`, `p = 2`; `d = 1`, `p = 3`; `d = 0`; cusp char 3 | `M = [[1, x], [0, 1]]`, `φ₀ = id − x∂`, `φ₁ = ∂`; `M⁻¹ = [[1, −x, x²], [0, 1, −2x], [0, 0, 1]]`, `φ₀(x²) = x² − 2x² + x² = 0`, without `1/α!` diagonal `2`; `φ_∅ = id`; orders of `Σ r_i³ x^i` in classes `0, 2, 1 mod 3`, order `3` unreachable, `y = t³` not in span | holds | none |
| §5.2 generic Frobenius basis | `k(t)`; `d = 0`; `t^p` | `1, t, …, t^{p−1}`, `[K : K^p] = p`; `K = K^p`; `d(t^p) = 0`, not a `p`-basis | holds | none |
| §5.3 Frobenius pushforward free | `k[x₁…x_d]_m`; cusp char 3; `d = 0`; `𝔽_p(t)`, `k[s]_{(s)}` | free on `x^α`; injective, `t³ ∉` image; identity, rank `1 = p⁰`; `[K : K^p] = p²` against rank `p`, `t` not hit; step 3: `ρ(Σ r_α^p x^α) = Σ σ(r_γ^p)e_γ = Σ r_γ e_γ` | holds; normality and perfectness needed | none |
| §5.4 `…_of_isNormalScheme` (Lean) and Nash form | cone `z² = xy`, `p = 2`, `d = 2`; `d = 0`; `𝔽₂[ε]/(ε²)`, `d = 0`; `x^p + y² + t` over `𝔽_p(t)`; cusp char 2, 3; cone char `≠ 2` | `Ω = O dz ⊕ (O dx ⊕ O dy)/(y dx + x dy)`, a unit coordinate forces `y ∈ (x)`, false in `k[y, z]/(z²)`: both false; both true; right true, left false (`IsNormalScheme`); `Ω = (R dx ⊕ R dy)/(2y dy)`, `dx ↦ 1`, regular not smooth (`PerfectField`); free quotient, singular, not normal; `J = (x, y, z)` not invertible | holds; every hypothesis separated | none |
| §6.1 normalised Nash blowup | cusp char 0, 2; node; `y² = x²z` char `≠ 2` and `2` | `𝔸¹`; `X* ≅ X`, `X̄* = 𝔸¹`; `η = id`; `X̄* = X* = Bl_0 𝔸²` (regular) against finite normalisation of `X`; partials `(0, 0, x²)`, `J = (x²)`, `X* = X` | holds | none |
| §6.2 lift | `Z = X̄*`; cusp char 2, `Z = 𝔸¹`; `Spec κ(x) → X_sm`, `d ≥ 1` and `d = 0` | identity; `𝔸¹ ≅ X̄*`; generic point not mapped to generic point / `Spec k` identity | holds | none |
| §6.3 restrict, separable base change | `V = X_sm`; cusp/ℚ, `ℚ(i)` and `ℚ(u)`; curve `C`, `k' = k(t^{1/p})` | `V`; `𝔸¹_{ℚ(i)}`, `𝔸¹_{ℚ(u)}` (not of finite type, only the general route); `s ↦ (−s² − t^{1/p}, s^p)` bijective, not iso | holds; separability needed | none |
| §6.4 criteria for `ν̄`, corollaries | cusp char 2; smooth rel. dim `d`; curve `C` over `𝔽_p(t)` | `ν` iso, not normal, `ν̄` not iso; both iso; `ν̄` iso, not smooth. Route: `s = η ∘ ν̄⁻¹` with `ν ∘ s = id` | holds; perfectness needed in the corollary | none |
| §7.1 normalised iteration, stabilisation | cusp char 0, 2 | `Y₁ = 𝔸¹`; `Y₀` cusp, `Y₁ = 𝔸¹`, `X^{(1)}` cusp: three values, normality from `i = 1` | holds | none |
| §7.2 open subschemes propagate | `U = Z = W`; cusp char 2; `U = W_sm` | identity; `X^{(j)} ⊇ X`; iterates of `U` are `U` | holds | none |
| §7.3 never-resolves | `m = 0`; smooth `X`; cusp char 2, `m = 1` | hypothesis trivial, conclusion false for cusp/ℚ; hypothesis fails; no `X^{(i)}` smooth, `Y₁ = 𝔸¹` has no open `≅` cusp | holds; `m ≥ 1` needed | none |
| Context of the Lean file | `#check @` of all three | no section `variable`; each standing hypothesis (`IsReduced`, `CharZero`, `PerfectField`, `CharP`, `IsNormalScheme`, `LocallyOfFiniteType`, `IsPureDimensional`) in the signature | as README | none |

Unused hypotheses: none found; each hypothesis of the two theorems has a separating instance in the table.

## Unresolved

- Two suppliers are still pull requests (AlgebraicModuliForArithmeticGeometry, DerivedDeRhamCohomology), both earlier
  in the merge order; the roadmap waits for them only at merge time.
- The questions the package reviews left for human reviewers stand and are not this job's to settle: the scope of the
  differential smoothness criteria over arbitrary (not algebraically closed) fields, resting on the README's routes;
  the licence class of `alperModuli` (an author-page draft, one proof step in §0.4); `nashModificationNotes2024` and
  `hamann2003` being arXiv preprints without journal versions.
- Nine Tau Ceti modules cited by the README have no built object file in the shared cache, so their names were
  checked at source level rather than elaborated (listed under `#check` pass).
- Ownership against open pull requests was checked through `roadmaps grep` over all open heads and by reading the
  sibling heads named above.
- No suspicious instruction was found in any untrusted text read (package files, reviews, other roadmaps).


Pull request: #2413 (roadmap/nash-blowups at f8bd785)
