# PORT-KatoEulerSystems

Branch `roadmap/kato-euler-systems`, head commit `aad344d` (one commit on top of main `a0ad405`),
message `KatoEulerSystems: roadmap (README, Suggested.lean, metadata)`. Files added:
`TauCetiRoadmap/KatoEulerSystems/README.md` (3120 lines), `TauCetiRoadmap/KatoEulerSystems/Suggested.lean`
(105 lines), `TauCetiRoadmap/KatoEulerSystems/metadata.toml` (`topic = "math.NT"`, the form of
`TauCetiRoadmap/ModularCurves/metadata.toml`). Nothing outside the folder was touched.

## Build

`lake build TauCetiRoadmap.KatoEulerSystems.Suggested`:

    Build completed successfully (9267 jobs).

Warnings: 3, all `declaration uses sorry` (lines 51, 68, 92: the three theorems). No other
warning. The file uses the module system in the form of `TauCetiRoadmap/CoboundaryExpansion/Suggested.lean`
on main: `module`, `public import Mathlib` followed by the three `public import TauCeti.*` lines, and
`@[expose] public section` before the namespace, which makes the four declarations visible to
importers (checked, see Elaborated signatures). Without `@[expose] public section` the module-system
build silences the import advisory but hides every declaration from a `#check` in an importing file.

## Gate

    gate KatoEulerSystems: set_option=0 blob=0 latex=0 tex=0 prnum=0 sorry-data=0 sorry-examples=0 residue=0 private-paths=0 imports=0 mathlib-subimports=0 no-import-mathlib=0 lean-lines=0 forbidden=0 dropped=0 readme-ids-missing=0 empty-sections=0 round-labels=0 long-fences=0 layer-ids=0 target-ids=0 depcheck=0 metadata=0 stray-files=0 dirty=0 outside-folder=0 source-material=0 OK

Dependency direction (`gate --depcheck … --movable`):

    depcheck: 207 roadmaps, 1699 edges, 0 problem(s)

No UPWARD, CYCLE or `moved:` line. Citation resolver on the ported README: no cross-roadmap
citation and no Lean name found nowhere (the worker's lead `ClassicalAlgebraic.finiteTrace` is a
planned name of `EtaleCohomologyFoundations` §0.8 on main, README line 582 there, and the resolver
now finds it).

## Draft pull request body

Kato's Euler system for a newform, from the finite-level modular zeta classes of PadicFamilies §4.0
to the arithmetic applications. The roadmap builds the remaining identities of Siegel units and
Beilinson elements (rational auxiliary independence, two-coordinate distribution, the analytic
product with its Bernoulli exponent and integral descent, the degeneracy product), the norm relations
of the Beilinson elements in their étale Chern and real-regulator realizations, the conductor Euler
system of a newform in the Euler-system carrier with the Kato/Nakamura Hecke and twist dictionary,
the full-level zeta classes, Kato's Eisenstein series with their periods and critical values, the
operator-valued zeta function and Beilinson's real regulator formula, the admissible coefficient
places (Momose's algebra and Loeffler's group of pairs), the nonvanishing of twisted critical values,
the passage from Kato's Euler-system hypotheses to Rubin's, the module structure of Iwasawa
cohomology, finite support over the full cyclotomic algebra including p = 2, the twist–localization
square, Kato's canonical rational zeta morphism with the finite index of the smoothed integral span
and its critical interpolation, Nakamura's twist-one morphism and the parabolic full-level
characterisation, Perrin-Riou's map for de Rham representations in Kato's normalisation, the scalar
regulator and its equality with the analytic p-adic L-function at non-critical slope, and the
elliptic applications: finite generation of E(ℚ_∞) and of the points over every m-power cyclotomic
tower, the ordinary and multiplicative cyclotomic divisibilities, absence of finite submodules,
control, the rank-zero upper bound for the p-primary Tate–Shafarevich group, Kato's finiteness of
Bloch–Kato Selmer groups of newforms over abelian fields with the modular abelian-variety corollaries,
and his Tamagawa bound. We want it because it is the Euler-system half of the cyclotomic main
conjecture for modular forms and the source of every rank-zero and Iwasawa-theoretic statement about
elliptic curves over ℚ that does not go through Heegner points; ModularIwasawaMainConjectures,
RankZeroOneBSDPartII, HeegnerPointEulerSystems and CMRankZeroConverse consume it by name.

`Suggested.lean` states the headlines statable at the pins: Serre's open-image theorem over ℚ on
Tau Ceti's Tate-module representation with non-CM expressed through Tau Ceti's endomorphism ring
(`serre_openImage`), finite generation of the points of an elliptic curve over ℚ over every fixed
m-power cyclotomic tower (`ellipticCyclotomicFiniteGeneration`, Kato Theorem 14.4), and finiteness
of the χ-part of the points over a cyclotomic field when the continued twisted L-function is nonzero
at 1 (`ellipticCharacterPoints_finite`, Kato Corollary 14.3(2); its case m = 1 is finiteness of E(ℚ)
at analytic rank zero), with the one real-bodied definition `ellipticCharacterPart`. The docstring
names every other headline and the carrier it lacks (Iwasawa cohomology, the modular Galois
realisation, D_crys and D_dR, the p^∞-Selmer group, A_f, the topological Galois module E(ℚ̄)).

Models used: Claude Fable 5.1 (port, checks and review pass), on an accepted package whose earlier
rounds were written and reviewed with Claude and Codex.

## Roadmaps this one depends on that are still pull requests

PadicFamilies, ModularCurvesPartII, SchemeKTheoryOperations, K2SymbolsBrauer, Polylogarithms,
AutomorphicGaloisRepresentations, SelmerIwasawaCohomology, ArithmeticGaloisDuality,
EulerSystemsAndKolyvaginSystems, PadicHodgeRegulators, ModularSymbolsPadicLFunctions,
CompletedCohomologyAndLocalGlobalCompatibility, EllipticCurveModularity,
AutomorphicLFunctionsAndLocalFactors, GL2AutomorphicRepresentationsAndTransfer,
HeightsRationalPointsAndObstructions. All are earlier in `ORDER.txt` (positions 34–305 against 317
for this roadmap). On main: ModularCurves, EtaleCohomologyFoundations, ModularForms,
PadicMeasuresIwasawaAlgebras, EllipticCurves. Consumers named under Downstream consumers are later
(AutomorphicCongruences 349, ModularIwasawaMainConjectures 350, HeegnerPointEulerSystems 351,
RankZeroOneBSDPartII 355) or at the design stage (AdelicImagesAndModularCurves, rev/1727, whose
Layer 4 plans the open-image theorem over number fields as the README says).

## What moved from the Lean to the README

Nothing. The package's `Suggested.lean` already satisfies the acceptance-test rule: three headline
theorems, one real-bodied definition the third needs, no API lemmas, no examples, no sorry'd data, no
`set_option`. The only edit to the file is the header: the package's `module` / `public import` lines are kept
and `@[expose] public section` is added before the namespace (see Build). Line numbers of the three
theorems moved from 49/66/90 to 51/68/92.

## Supplier replacements and duplication removals

None. Every library declaration the README and the Lean cite exists at the pins of this worktree's
manifest (Tau Ceti `358314d`, Mathlib `f6090c7`): `WeierstrassCurve.pointGaloisAction`
(`Affine/Point/Galois.lean:47`), `WeierstrassCurve.tateModuleGaloisRepresentation`
(`TateModule/Galois.lean:71`, a `Representation ℤ_[ℓ]`, so `Units (T →ₗ[ℤ_ℓ] T)` is `GL₂(ℤ_ℓ)` and
finite index means open), the `Ring` instance on `TauCeti.Isogeny.Hom W W` (`Isogeny/Hom/Ring.lean:174`),
`TauCeti.kummerMap` (`Kummer.lean:246`), `WeierstrassCurve.Affine.selmerGroup₂`,
`WeierstrassCurve.LFunction` (`LFunction.lean:79`, built from `localPolynomial` on `W.minimal R`, so
independent of the model), `IsCyclotomicExtension.autEquivPow` (`Gal.lean:77`),
`Polynomial.cyclotomic.irreducible_rat` (`Roots.lean:190`), `AddGroup.FG`, `Representation.asGroupHom`
(`Basic.lean:512`), `ModularForm.eisensteinSeriesMF`, `EisensteinSeries.eisSummand`,
`DirichletCharacter.LFunction`, `ContinuousCohomology.tateShafarevich`. Supplier sections cited from
roadmaps on main were opened: ModularCurves §§0A, 2A, 2D, 2E, 5B (lines 238–1313);
EtaleCohomologyFoundations §0.8 (line 565, finite traces at 582); ModularForms Layers 0, 7, 9 with the
inner-twist sublayer in Layer 9 (line 996); PadicMeasuresIwasawaAlgebras §§4.1–4.6 (lines 2361–2710);
EllipticCurves Layers 1, 4, 4.5b, 6, 7. Citations into open heads were resolved by the resolver
(none missing); the four it checks most often (PadicFamilies §§4.0.1–4.0.3, SelmerIwasawaCohomology,
AutomorphicGaloisRepresentations, EllipticCurveModularity R29.4–R29.6) were confirmed by the accepted
review against the same heads.

Duplication sweep by object (`roadmaps grep` over main and the 446 open heads, patterns: Kato zeta
morphism, Perrin-Riou map / big exponential, Kato's Eisenstein series, E(ℚ_∞) finitely generated,
Serre's open image, Beilinson elements / Siegel units, Rohrlich, Tamagawa bound / [M : z], χ-part,
pseudo-null finite support). Hits are consumers or inputs, not second owners:
CompletedCohomologyAndLocalGlobalCompatibility recalls Nakamura's zeta morphisms as what its
completed-cohomology objects feed; CMRankZeroConverse (rev/1744) consumes KatoEulerSystems §§2.2, 4.4,
4.6, 5.1, 5.3 by name; SatoTateGroups and the others use the open-image theorem as an input;
Siegel units occur only in PadicFamilies §4.0.1 (the owner) and EllipticCurveModularityPartII, whose
head (rev/1491, line 11) now defers to PadicFamilies §§4.0.1–4.0.3 for the theta and Siegel units and
ordered symbols; the χ-parts of EulerSystemsCyclotomicMainConjecture are Greither's unit and
class-module components; the pseudo-null hits on main are PadicMeasuresIwasawaAlgebras §4.1, which
§4.5 extends to the semilocal non-domain at p = 2 and cites. No removal was needed.

Ownership against open pull requests beyond the sibling checkouts the brief lists and the grep index
was not checked.

## The accepted review's non-blocking notes

- F01 (four definitions with fewer than three dedicated Checks): applied. Added a Check that
  `rationalSmoothing` is linear in each argument and depends on c only through c² (0.1: `24g + 24h`;
  `48g − 24g = 24g` against `2g`); that `torsionIndexAction` is a right action (0.2: `(v·σ)·τ = v·(στ)
  = (2/5,1/5)` against `v·(τσ) = (2/5,2/5)`); that both periods `Ω_±` of a nonzero `ω ∈ S(f)` are
  nonzero (3.3, Kato Theorem 16.2); and that the two branches of `archimedeanEisensteinZeta` agree
  by a computed value at `k = 2`, `r = r′ = 1`, `M = N = 5` (both `−1/25`).
- F02 (a finite-coefficient projection called "integral" in 4.6): already repaired in the package
  before the port; the sentence no longer exists, and 4.6 states the diagonal limit under
  corestriction and coefficient reduction.
- F03 (name EllipticCurveModularityPartII §6.0e as an earlier construction of the theta units): not
  applied as worded, because citations are resolved against the roadmap as it is now. At rev/1491
  that roadmap's scope paragraph (line 11) and §6.0e (line 691) say PadicFamilies §§4.0.1–4.0.3 owns
  the normalized theta/Siegel units and ordered symbols and that §6.0e specializes them at weight
  two. There is one owner, PadicFamilies §4.0.1, which the README cites.

The red-team rounds after acceptance (RT~1a/b, RT~2a/b) are recorded as applied in the package's fix
reports; spot checks (the `(α,β) = (a/N, b/N)` torsion section in 0.1, the `m = 1` conductor Check in
2.1, the theta phase count in 0.3, the CM level-63 example in 4.2, the `exp*_(m,1)` twist in 5.1, the
Scope wording on Serre's theorem and the AdelicImagesAndModularCurves consumer line) found them in the
ported text.

## Upstream-reviewer read

The README was read in full once more. Each claim that could be checked by a computation was
recomputed (table below); the three Lean statements were checked against their README paragraphs
(§4.7 and §7.9) and against the sources' hypotheses. No statement was found wrong, vacuous or
unsourced; the only edits are the four Checks above. Two observations recorded for the maintainer,
not defects: (i) CMRankZeroConverse (rev/1744, later in the order) declares a supplier gap asking
this roadmap to extend §§5.1 and 5.3 to coefficient places at which `(f,λ)` is not admissible; the
README deliberately does not claim those places (Kato's 12.8.2 fails at division-algebra places of
Momose's algebra, §4.1), so the request stands as that consumer's open gap.

## Elaborated signatures

`#check @name` for all four declarations was elaborated once from a scratch file importing the built
module (`lake env lean`), after the header change; all four names resolve under the module-system
header and their elaborated types equal those recorded before it. The printed types keep `W.IsElliptic`,
`DecidableEq (AlgebraicClosure ℚ)`, the non-CM hypothesis on `TauCeti.Isogeny.Hom`, `Fact ℓ.Prime` under
the binder, `1 ≤ m`, `NeZero m`, `Field K`, `DecidableEq K`, `Algebra ℚ K`,
`IsCyclotomicExtension {m} ℚ K`, `χ : DirichletCharacter ℂ m`, `Differentiable ℂ F`, the agreement on
`3/2 < s.re` and `F 1 ≠ 0`. They are identical to the worker's `signatures.md` and to the README's
statements in §4.7 and §7.9; nothing changed.

## Adversarial mathematics pass

| Statement | Instances tried | Values computed | Result | Change |
|---|---|---|---|---|
| `serre_openImage`: coefficient ring of the Tate-module representation | pinned definition | `Representation ℤ_[ℓ] (K ≃ₐ[ℚ] K) (TateModule ℓ …)`, so `Units (T →ₗ[ℤ_ℓ] T) = GL₂(ℤ_ℓ)`; a ℤ-linear endomorphism ring of the abstract group `ℤ_ℓ²` would be uncountably larger and the finite-index clause false | correct carrier | none |
| `serre_openImage`: non-CM hypothesis | `y² = x³ − x` | `(x,y) ↦ (−x, iy)` has degree one and is neither `[1]` nor `[−1]`, so `hW` fails and the theorem is silent, as it must be (CM image is a Cartan normaliser, not open) | retained | none |
| `ellipticCyclotomicFiniteGeneration`: the tower field | `m = 1`; `m = 0`; `m = 6` | `x^(1^n) = 1` gives `{1}`, field ℚ, conclusion Mordell–Weil; `m = 0` with `n ≥ 1` gives `x^0 = 1` for all x, adjoin `= ℂ`, `E(ℂ)` not finitely generated, excluded by `1 ≤ m`; `4 ∣ 36` and `9 ∣ 36`, fields nested, adjoin is the union | retained | none |
| `ellipticCyclotomicFiniteGeneration`: singular models | `y² = x³` | `Δ = 0`; nonsingular points `≅ (ℚ,+) ∋ 1/n`, not finitely generated; excluded by `W.IsElliptic` | retained | none |
| `ellipticCharacterPart` | `K = ℚ`, ψ trivial; quadratic K, `ψ(σ) = −1`; `P = 0` | `MonoidAlgebra ℤ {1} = ℤ`, lift is the identity, the only a with `ψ(a) = 0` is 0, membership vacuous: every rational point; `I_ψ = (1 + σ)`, membership `P + σP = 0`; zero point satisfies every condition | correct | none |
| `ellipticCharacterPoints_finite`: `m = 1` | trivial χ mod 1 | `IsCyclotomicExtension {1} ℚ K` forces `K = ℚ`; `ZMod 1` is the zero ring, every element a unit, `χ n = 1`; `LSeries` ignores `n = 0`; series `= L(E,s)`; `F 1 ≠ 0` gives finiteness of `E(ℚ)` (Kato 14.3 at `χ = 1`) | correct | none |
| `ellipticCharacterPoints_finite`: Galois-character convention | `m = 5`, `χ(2) = i` | `autEquivPow` sends `σ : ζ₅ ↦ ζ₅²` to 2, so `σ ↦ i`; with the inverse convention `σ ↦ −i`. Both χ-part and χ̄-part are finite under the hypothesis, since `L(E,χ̄,1) = conj L(E,χ,1)`; the chosen direction is Kato's `σ_a ↔ a` | correct, convention-independent conclusion | none |
| `ellipticCharacterPoints_finite`: imprimitive χ and removed factors | good ℓ, `|α| = √ℓ`; multiplicative; additive | removed factor `(1 − αu/ℓ)(1 − βu/ℓ)` at `s = 1`, `|u| = 1`: `|αu/ℓ| = ℓ^(−1/2) < 1`, nonzero; `1 ∓ 1/ℓ ≠ 0`; `1` | nonvanishing at 1 equivalent to Kato's | none |
| `ellipticCharacterPoints_finite`: convergence and uniqueness of F | `Re s > 3/2` | `|a_n χ(n)| ≤ d(n)√n`, absolute convergence; two entire F agreeing there agree everywhere (identity theorem); the continuation exists by modularity, so the hypotheses are satisfiable | non-vacuous | none |
| Conventions: Frobenius polynomial | `k = 2, ℓ = 3, a = 2, ε = 1` | geometric `1 − 2u + 3u²` with roots α, β, `α+β = 2`, `αβ = 3`; arithmetic eigenvalues `1/α, 1/β`: sum `2/3`, product `1/3`: `1 − (2/3)t + (1/3)t²` | agree | none |
| 2.1 Euler polynomial from the twist | `T = V(f)(k−r)`, `k = 2, r = 1, ℓ = 3` | twist multiplies Frobenius eigenvalues by `ℓ^(k−r)`: linear `ā ℓ^(1−k+k−r) = ā ℓ^(1−r)`, quadratic `ε̄ ℓ^(1−k+2k−2r) = ε̄ ℓ^(k+1−2r)`; `P(t) = 1 − 2t + 3t²`, at `t = X/3`: `1 − (2/3)X + (1/3)X²` | agree with the Checks | none |
| 0.2 right action (new Check) | `v = (1/5,0)`, `σ = [[1,1],[0,1]]`, `τ = diag(2,1)` | `v·σ = (1/5,1/5)`, `·τ = (2/5,1/5)`; `στ = [[2,1],[0,1]]`, `v·στ = (2/5,1/5)`; `τσ = [[2,2],[0,1]]`, `v·τσ = (2/5,2/5)` | consistent | Check added |
| 0.1 smoothing linearity (new Check) | `c = 5, 7` | `25(g+h) − (gc+hc)`; `48g − 24g = 24g = (49−25)g` | consistent | Check added |
| 0.3 Bernoulli exponent | `x = 1/2`; `x = 2/5` | `(1/4 − 1/2 + 1/6)/2 = −1/24`; `(4/25 − 2/5 + 1/6)/2 = −11/300`; linear misprint `−23/300` | agree | none |
| 0.3 phase count | `N = 4`, `(1/2,0)`, `c = 5`; `c = 7` | `2 − 5 + 2 = −1 = 25(−1/24) + 1/24`; `4 − 21/2 + 9/2 = −2 = 49(−1/24) + 1/24` | agree | none |
| 3.2 normalisation | `E^(4)_(0,0)` | `3!·2ζ(4)/(2πi)⁴ = 12π⁴/(90·16π⁴) = 1/120` | agree | none |
| 3.3 zeta-form branches (new Check) | `k = 2, r = r′ = 1, M = N = 5` | `(−1)·1·5^(−1)·5^(−1) = −1/25` and `(−1)·1·5^(−1)·5^(−1) = −1/25` | agree | Check added |
| 6.3 Gauss sum | quadratic χ mod 3 | `ζ₃ − ζ₃² = 2i sin(2π/3) = i√3`; square `−3 = χ(−1)·3` | agree | none |
| 6.4 CM factor | `y² = x³ − x`, `p = 3` | `#Ẽ(𝔽₃) = 4`, `a₃ = 0`, `α² = −3`, `α^(−1) = −α/3`, `(1 + α/3)² = 2/3 + 2α/3 ∉ ℚ₃` | agree | none |
| 6.6 dyadic logarithm | `y² + xy = x³ + 1`, `t = 2u` | `b₂ = 1, b₄ = 0, b₆ = 4, b₈ = 1`, `Δ = −1 − 432 = −433`; `log t = t + t²/2 + t³/3 + …` gives `2u(1+u) + (8/3)u³ + …`, and `u(1+u)` is even, so the image is `4ℤ₂` | agree | none |
| 6.6 real components | `y² = x³ − x`; `y² = x³ + x` | roots `−1, 0, 1`: two components; `x(x² + 1)`: one | agree | none |
| 7.5 universal norms | `y² = x³ + x`, `p = 5` | squares mod 5 `{0,1,4}`; points `∞,(0,0),(2,0),(3,0)`; `a₅ = 2`; `[5] = id` on a group of order 4; full limit order 4, 5-primary limit 0 | agree | none |
| 7.7 anomalous factor | `p = 5`, `X² − X + 5` | unit root `α ≡ 1 mod 5`, `α = 1 + 5t` gives `5(t+1) ≡ 0 mod 25`, `α ≡ 21 mod 25`, `v₅(1 − α^(−1)) = v₅(20/21) = 1` | agree | none |
| 4.5 finite support | `ℤ_p[[T]]/(p,T)`, `/(p)`, `μ = p` | finite; infinite with support at `(p)`; `Λ/(p)` killed by μ with zero localisations away from p yet infinite | hypothesis needed, as stated | none |
| 7.2 bound | lengths `(2,1,1)`, `(2,1,0)` | `2 ≤ 1 + 1`; `2 ≤ 1` false | consistent | none |
| 7.9 Tamagawa index | `z = p^(−1) ∈ O ⊗ ℚ` | `[O : z] = [O : pO]^(−1) < 1 ≤ #H²` forces integrality | consistent | none |

## Unresolved

- Nothing blocking. The consumer gap of CMRankZeroConverse (inadmissible coefficient places) is
  recorded above.
- The accepted review's F03 was not applied as worded, for the reason given; no citation of
  EllipticCurveModularityPartII was added.


Pull request: #1804 (roadmap/kato-euler-systems at aad344d)
