# PORT-HodgeClassesForJacquetLanglands

- Branch: `roadmap/hodge-classes-for-jacquet-langlands`, from `51d880d` (main).
- Head commit: `11238e8` — `HodgeClassesForJacquetLanglands: roadmap (README, Suggested.lean, metadata)`.
  It adds exactly `TauCetiRoadmap/HodgeClassesForJacquetLanglands/{README.md,Suggested.lean,metadata.toml}`;
  nothing outside the folder changed.

## Build

`lake build TauCetiRoadmap.HodgeClassesForJacquetLanglands.Suggested`:

    Build completed successfully (18239 jobs).

Warnings: 3, all `declaration uses 'sorry'` (lines 76, 87, 101 of `Suggested.lean`). The package's file
also produced the module-system warning "imports `Mathlib` from package `mathlib`, which is designed for
use with the module system; consider adding `module`"; the file now opens with `module`, as the latest
roadmaps on main do, and that warning is gone.

## Gate

    gate HodgeClassesForJacquetLanglands: set_option=0 blob=0 latex=0 tex=0 prnum=0 sorry-data=0 sorry-examples=0 residue=0 private-paths=0 imports=0 mathlib-subimports=0 no-import-mathlib=0 lean-lines=0 statement-hygiene=0 forbidden=0 dropped=0 readme-ids-missing=0 empty-sections=0 round-labels=0 long-fences=0 layer-ids=0 target-ids=0 depcheck=0 metadata=0 stray-files=0 dirty=0 outside-folder=0 source-material=0 OK

Dependency check (`gate --depcheck … --movable`), after all edits:

    depcheck: 246 roadmaps, 2319 edges, 0 problem(s)

No `UPWARD`, `CYCLE` or `moved:` line.

`roadmaps resolve` on the ported README: no cross-roadmap citation and no Lean name found nowhere.

## Draft pull request body

This pull request adds the roadmap *Hodge classes for the Jacquet–Langlands correspondence*. For a
totally real field `F`, two quaternion algebras `B₁, B₂` split at the same set `Σ` of `d < [F : ℚ]`
real places, and a cuspidal representation `π` of `GL₂(𝔸_F)` of even weights with trivial central
character transferring to both, it builds an `L`-rational Hodge class, `L = ℚ(π)`, in
`V₁ ⊗_L V₂(d)` whose correspondence is an isomorphism of `L`-Hodge structures between the
`π`-multiplicity spaces of the two quaternionic Shimura varieties; the weight-two case is a rational
Hodge class on `X₁ × X₂` acting as `H^d(X₁, ℚ)_{π₁} ≃ H^d(X₂, ℚ)_{π₂}`, and under an explicitly stated
degree-`2d` Kottwitz hypothesis the same class is Galois-invariant in every `ℓ`-adic realization at
once (Ichino–Prasanna, Forum Math. Pi 2023, Theorems 1, 3.2 and 12.4). The route is built as reusable
theory: a conjugate-linear Hodge-star operator `L` on `⋀²U` of a four-dimensional Hermitian space
over any field with an endomorphism `σ`, with `L∘L = vol`, the quaternionic skew-Hermitian structure on
`⋀²U` and the exceptional isogeny and isomorphism `PGU_E(U) ≃ PGU_B(⋀²U)°`, and their block restriction
to `U = B₁ ⊥ B₂`; harmonic Schwartz forms on real quadratic spaces with their Fock description and
restriction formulas; quaternionic theta lifts with near-equivalence rigidity and a simultaneous
nonvanishing theorem for all archimedean signs; the purity of the theta Hecke space in Hodge type
`(d,d)`; and a determinant argument descending a complex invertible correspondence to a rational one.
It also owns the cohomology of compact Shimura varieties (and of the definite pairs with
`G(ℝ)/Z(ℝ)` compact) with automorphic coefficient systems as compatible realizations, including
descent along the infinite central kernel of a neat level and normalized traces with rational Haar
measures on the effective groups `G(𝔸_f)/Z(ℚ)⁻`, the Hodge-type criterion for coefficient cohomology of
compact unitary similitude Shimura varieties, and the unramifiedness of de Rham additive characters.
`Suggested.lean` states the three statable headline identities of the exterior construction
(existence and uniqueness of `L`, `L∘L = vol` for Hermitian forms, and `L ∘ ⋀²g = (ν²/det g)·(⋀²g ∘ L)`
for similitudes) and records which end theorems lack carriers at the pins.

## Dependencies that are still pull requests

AnabelianGeometryAndNonabelianChabauty, ArithmeticGaloisRepresentations, AutomorphicBundles,
AutomorphicFormsOnReductiveGroups, AutomorphicLFunctionsAndLocalFactors, AutomorphicSpectralTheory,
ClassicalAdicEtaleCohomology, EndoscopicTransferAndUnitaryTraceComparison,
GL2AutomorphicRepresentationsAndTransfer, GeometryOfNumbersAndQuadraticArithmetic,
MetaplecticAutomorphicForms, MotivesAndAlgebraicCycles, PadicHodgeTheory, SelmerIwasawaCohomology,
ShimuraData, ShimuraVarieties. All are earlier in the merge order (highest: AutomorphicBundles, line 193;
this roadmap is line 307).

On main: AdelicAlgebraicGroups, AlgebraicTopology, ArithmeticLocallySymmetricSpaces, ClassFieldTheory,
ComplexComparisonPartII, ComplexKahlerGeometry, EtaleCohomologyFoundations, PadicPeriodRings,
ReductiveGroups, ReductiveGroupsPartII, RepresentationTheory (SchurWeyl, SpinRepresentations); completed:
GlobalNumberFields, HodgeStructures, OrthogonalSpinGroups (the last named in Scope only). No id this
README cites is defined only by an open revision. The eight declared supplier gaps (`gap:` contracts on
ArithmeticLocallySymmetricSpaces, ComplexKahlerGeometry, GL2AutomorphicRepresentationsAndTransfer (2),
MetaplecticAutomorphicForms (3), PadicHodgeTheory) are kept as accepted.

## What moved from the Lean to the README

Nothing. The package's `Suggested.lean` already had the acceptance-test form: one predicate
(`IsExteriorStar`, a real body on Mathlib carriers) and three headline theorems (§§1.3, 1.4, 1.7), no
padding, no sorry'd data, no `set_option`, single `import Mathlib`. Changes to the file:

- `module` added before `import Mathlib` (removes the module-system build warning).
- Module docstring: each listed headline now carries its README section. Two claims about the pins were
  wrong and are corrected:
  - "affine group schemes of unitary similitudes, their identity components and central quotients are
    absent" — Tau Ceti has isogenies (`TauCeti/Algebra/AlgebraicGroup/Isogeny/`), identity components
    (`Connected/IdentityComponent.lean`) and the centre quotient as an fppf sheaf
    (`Center/Quotient.lean`, no representability); what is absent is unitary and quaternionic
    skew-Hermitian similitude group schemes over `F`. The docstring now says that.
  - "continuous Galois cohomology of number fields with `ℚ_ℓ` coefficients … absent" — Mathlib has
    continuous group cohomology (`Mathlib/RepresentationTheory/Homological/ContCohomology/`, used by
    Tau Ceti's `TauCeti.brauerCohomologyEquiv`). The missing carrier is `B_dR`, hence the de Rham
    condition; the docstring now names that, and lists §9.3 beside §9.4.

`#check @name` for all four declarations, elaborated once (appended to the module and built with the
allowed command, then removed; the committed file has no `#check`): the types are identical to
`scratch/signatures.md`. Every theorem keeps `[FiniteDimensional E U]`, `σ`, `H`, `vol`, `hkl`;
`comp_self` keeps the Hermitian hypothesis and the basis `b`; `map_similitude` keeps `g`, `ν` and the
similitude hypothesis. They agree with §§1.3, 1.4, 1.7 of the README. Nothing changed. (P3 note:
`[FiniteDimensional E U]` is implied by `hkl : 2 + 2 = finrank E U`, since positive `finrank` forces
finiteness; it is harmless and kept.)

Library near-matches: no pinned declaration proves any of the three theorems. The nearest are
Mathlib's bilinear `exteriorPower.hodgeStar` (whose inverse `L` is when `σ = id` and the form is
bijective) and Tau Ceti's `Orientation.barHodgeStar` (the positive definite complexified case); both are
special cases and both are already cited.

## Supplier replacements and duplication removals

No restatement of a pinned or roadmap declaration was found, so nothing was deleted. Changes to the
supplier contracts:

- `TauCeti.symPowerRep`: file added (`TauCeti/RepresentationTheory/ClassicalGroups/SymmetricPower.lean`)
  with what it is (`d`-th symmetric power of the standard representation of `GL n`).
- New supplier AnabelianGeometryAndNonabelianChabauty §4.6 (*The Bloch–Kato subgroups
  `H¹_e ⊆ H¹_f ⊆ H¹_g`*): §9.3 states `H¹_g(K, ℚ_ℓ) = H¹_f(K, ℚ_ℓ)`, and `H¹_g` with its
  de Rham-extension description is defined and owned there (SelmerIwasawaCohomology §4.9 defines only
  `H¹_f`). Cited in Scope, a new `### From TauCetiRoadmap.AnabelianGeometryAndNonabelianChabauty`
  contract, §9.3 and its *Needs:*, and the Layer 9 Dependencies. That roadmap is line 188 of the merge
  order, so the order is unchanged (depcheck above).

Duplication sweep (after the edits, by object, `roadmaps grep` over main and the open heads): the
exterior operator / conjugate-linear star on sesquilinear forms, `PGU`/`GSU` exceptional maps,
Kudla–Millson/Funke–Millson harmonic Schwartz forms and their Fock description, the Jacquet–Langlands
Hodge class, `H¹_g = H¹_f` for trivial coefficients, unipotent-extension triviality, Kottwitz's
degree-`2d` prediction, normalized traces with effective groups and rational Haar measures, Matsushima
decompositions of compact Shimura cohomology with coefficients. No second owner: SiegelModularForms
says Kudla–Millson theory is not its object; the four roadmaps that cite IP23 (MotivesAndAlgebraicCycles,
MetaplecticAutomorphicForms, AutomorphicFormsOnReductiveGroups, ModularityAndLanglandsExtensions) cite
it for inputs this roadmap imports; TorsionCohomologyInfrastructure §3b.2 owns a Zucker/Matsushima
comparison only for the noncompact `U(n,n)` similitude trace identity of Shin; ShimuraVarieties §8.3
(`CanonicalTower.level_map_finite`) gives finiteness and étaleness of level maps but not the effective
degree formula of §0.3; AnabelianGeometryAndNonabelianChabauty §4.6 defines `H¹_g` but does not state
`H¹_g(K, ℚ_p) = H¹_f(K, ℚ_p)`. The closest open roadmaps of `scratch/overlaps.md` were read at their
heads: MetaplecticAutomorphicForms (supplier, cited), AutomorphicLFunctionsAndLocalFactorsPartII
(unitary doubling for arbitrary inducing characters, not the quaternionic doubled residue of
gap:quaternionic-doubling-residue), ExceptionalThetaCorrespondencesForG2 (octonion/G₂ theta, no shared
object), ShimuraData and EndoscopicTransferAndUnitaryTraceComparison (suppliers, cited). Ownership was
checked against the open pull requests through `roadmaps grep`/`roadmaps show`; no declaration of
`Suggested.lean` reuses the qualified name of a declaration in another roadmap.

## README changes

1. Shape: the `## Notes on the source` section (no roadmap on main has such a section) is folded into
   `## References` as readings listed under the [IP23] entry, with no content lost; the phrase "each
   checked against the surrounding argument" is dropped. Two references were ambiguous between IP23's
   numbering and this roadmap's: "the pairing of §8.2" (IP23 §8.2, pp. 49–50) now says so and points to
   §4.1 here, and "as in §2.5" is now "(§2.5)"; the Proposition A.1(i) reading now points to §7.2, where
   it is used. A sentence fixes the convention (a section with a page is IP23's, a parenthesized one
   this roadmap's).
2. Generality (§1.3 API bullet and Scope): `L` is the inverse of Mathlib's `exteriorPower.hodgeStar`
   for every bijective bilinear form, not only symmetric ones: Mathlib characterizes `⋆` by
   `B₂(⋆x, y) = vol(x ∧ y)` (`exteriorPower_hodgeStar_eq_wedgePairing`), so `B₂(⋆(Lu), y) = vol(Lu ∧ y)
   = B₂(u, y)`. Symmetry is kept only where it is needed, for the Mathlib-documented identity
   `Δ • ⋆(⋆x) = (−1)^{kl} x` (§1.4's Check `1 + E₁₂` shows that `L∘L` fails without it).
3. §9.3 / §9.4: `H¹_g` cited to its owner (above); §9.4's `W` is now a *continuous* representation, and
   the global `H¹_g(k, ℚ_ℓ)` in its proof route is defined in place (classes unramified almost everywhere
   and de Rham above `ℓ`).
4. Supplier contract for `TauCeti.symPowerRep` completed with its file.

Upstream-reviewer read of the whole README: besides 1–4, nothing a mathematician would flag as wrong,
vacuous or unsourced was found; the values behind that verdict are in the table below.

## Adversarial mathematics pass

Computed values come from two exact-arithmetic scripts over `ℚ(i)` and `ℤ[√2]` (Fractions, no floating
point except the two complex spot values of §§2.1, 3.3) kept in the job scratch directory
(`adv/exterior.py`, `adv/arith.py`, outputs `*.out`), and from hand computation where marked.
`c = d_U(e₁₂₃₄)`, `⋀²` basis `e₁₂, e₁₃, e₁₄, e₂₃, e₂₄, e₃₄`.

| Statement | Instances tried | Values computed | Result | Change |
| --- | --- | --- | --- | --- |
| Conventions: Hermitian forms conjugate-linear in slot 1 | Lean type `U →ₛₗ[σ] U →ₗ[E] E` | first slot `σ`-semilinear | agrees | none |
| Conventions: sign normalization `c = −1` | `diag(2,3,5,7)` | `L`: `−6e₃₄, 10e₂₄, −14e₂₃, −15e₁₄, 21e₁₃, −35e₁₂` (script) | §1.3 list correct | none |
| Conventions: Tate twist | `V₁ ⊗ V₂(d)` | weight `d + d − 2d = 0`; `V₁ ≃ V₁^∨(−d)`: `−d + 2d = d` | consistent | none |
| Conventions: theta normalization vs MetaplecticAutomorphicForms §3.35 | its text at head | there `θ(π)|G° = A_q₁(k−2,0,0)` (`π`-isotypic); here `θ(D^∨) = A_q₁` | dualization consistent | none |
| Conventions: rational Haar volumes | `K̄′ ⊂ K̄` of index 3 | `[K̄ : K̄∩K̄′]/[K̄′ : K̄∩K̄′] = 3/1` | rational | none |
| Conventions: undivided pairing | `ℓ = 2` | `⟨v², w²⟩ = 2⟨v,w⟩²` (divided: `⟨v,w⟩²`); `e^ℓ/ℓ!` cancels `ℓ!` | correct | none |
| §0.1 data | `k_v = 3`; `k_v = 2`; `d = n` | `(2−3)/2 = −1/2 ∉ ℤ`; `τ_k = Nrd⁰ Sym⁰ = 1`; IP23 Thm 3.2 needs `d < n` | Checks correct | none |
| §0.1 `L` totally real | trivial central character | `π ≅ π^∨ ≅ π̄` for every conjugate | real eigenvalues for every embedding | none |
| §0.2 definite case | `B = (−1,−1)_ℚ`, `V = Nrd⁻¹⊗Sym²` | `#O^× = 24`, image `12` (A₄, irreducible on `ℝ³`) ⇒ `V^{O^×} = 0`; constant sheaf would give `3` | negative control correct | none |
| §0.2 central directions | `T = Res_{ℚ(√2)/ℚ}𝔾_m`, `K(3)` | `#(O/3)^× = 8`, `ord(ε) = 8` ⇒ `#Sh = 1`; unit `−ε⁴` translates `log|a| − log|b|` by `2·4 log ε = 8 log ε` ⇒ circle `(1,1)` vs point `(1,0)` | correct | none |
| §0.2 `π₀` vs `G(ℚ)₊` | same `T` | `#⟨ε²⟩ mod 3 = 4` ⇒ index 2 (two points) vs one | correct | none |
| §0.2 fibre condition not automatic | `F = ℚ(∛2)`, `u = ∛2 − 1` | min. poly. `x³+3x²+3x−1`, `N(u) = 1`, infinite order, `σ₁(u)^m ≠ 1` | negative control correct | none |
| §0.2 mixed weights | `T = Res_{ℚ(i)/ℚ}𝔾_m`, `h(z) = z`, `ρ = 1 ⊕ N` | `w(r) = r⁻¹`; `N∘h(z) = z z̄` ⇒ type `(−1,−1)`, weights `0, −2` | not pure, summands pure | none |
| §0.3 degree formula | `K(9) ⊂ K(3)` of `ℤ[√2]` | `#(O/9)^× = 72`, `ord ε = 24`, `ε¹² ≡ −1 (9)` ⇒ `#Sh = 3`; `−ε⁴ ≡ 1 (3)`, order `3` mod 9 ⇒ degree `9/3 = 3`; `f_*f^* = 3·(1/3) = 1` (Haar: `1/3`) | correct | none |
| §0.3 rationality control | `𝔾_m × 𝔾_m → 𝔾_m`, `K(3)` | `Ẑ^×/{±1}K(3) = 1` point; volumes `1,1` ⇒ `f_*(1) = 1`; `√2` relative factor ⇒ `√2 ∉ ℚ` | correct | none |
| §0.3 non-surjective map | diagonal of a Shimura curve | dim 1 → dim 2, not étale onto components | only pullback | none |
| §0.4 division reduction | `Ram(B₁) = {∞₂,𝔭}`, `Ram(B₂) = {∞₂,𝔮}`; `S = ∅` | invariants `½+½ = 0` at `∞₂`, `½` at `𝔭, 𝔮` ⇒ `Ram(B) = {𝔭,𝔮}`; `S = ∅` ⇒ `B₁ ≅ B₂` | correct | none |
| §0.5 rationality obstruction | `Q₈`; `χ₃∘det` | FS `(2·2 + 6·(−2))/8 = −1` (script); `χ₃(−1) = −1`, `diag(−1,1) ∈ K₁(3^r)` | Checks correct | none |
| §0.5 rank/degree/weight | `d = 0, 1, 2` | rank `1, 2, 4`; degree `d`; weight `d + 0` | `2^d`, degree `d` (IP23 prints `2d`) | none |
| §0.6 sign lines | `d = 2`, weights `(2,2)` and `(2,4)` | `(2,0),(1,1),(1,1),(0,2)`; `(3,−1),(2,0),(0,2),(−1,3)` | correct | none |
| §0.7 correspondence | `B₁ = B₂`, diagonal | identity; weight `0` | correct | none |
| §1.1 volume | `diag(1,1,1,1)`, `c=−1`; `diag(1,2,1,−5)`, `c=−1, −2`; `diag(i,1,1,1)`; rank 0, `σ(t)=t²`, `d_U(a)=ta` | `1`; `−10`, `−5/2`; `i` (not in `ℚ`); `t⁻³` vs `σ(vol) = t⁻⁶` | Checks correct | none |
| §1.2 `N(det g) = νⁿ` | 3 Cayley similitudes of random Hermitian forms over `ℚ(i)`, `ν = 5` | `N(det g) = 625 = ν⁴` each; `det g ≠ ν²` (e.g. `(922680+512635i)/42221`) | correct | none |
| §1.3 `existsUnique_isExteriorStar` (Lean) | `H = 0`; any `H` | `L = 0` (script); uniqueness from `instIsPerfPairWedgePairing` | true for every `σ`, `H` | none |
| §1.3 vs Tau Ceti `barHodgeStar` | unit form on `ℂ⁴`, `c = ±1` | `c=1`: `L(e₁₂) = e₃₄`, `L(ie₁₂) = −ie₃₄`; `c=−1`: `−e₃₄`, `ie₃₄` (script) | `L = ±barHodgeStar` | none |
| §1.3 vs Mathlib `hodgeStar` | `σ = id`, bijective `B`, symmetric or not | `B₂(⋆(Lu),y) = vol(Lu∧y) = B₂(u,y)` | `L = ⋆⁻¹` for every bijective `B` | bullet generalized |
| §1.4 `comp_self` (Lean) | 4 random non-diagonal Hermitian `A`, `c ∈ {2, 1+i, −1+2i, −1+2i}`; `diag(1,1,0,0)`, `c=2`; `H = 0` | `vol = 239/4, −58, 15, 64/5`, `L∘L = vol·id` on 12 vectors each; `0`; `0` (script) | true, degenerate included | none |
| §1.4 symmetry needed | `σ = id`, Gram `1 + E₁₂`, `c = −1` | `det = 1`, `L L e₁₂ = e₁₂`, `L L e₁₃ = e₂₃`, `L L e₂₃ = −e₁₃ + e₂₃` (script) | negative control correct | none |
| §1.4 antisymmetric forms | standard symplectic; rows `(0,1,2,3),…` | `L∘L = 1·id`, `det = 1`; `L∘L = 64·id`, `det = 64 = Pf² = 8²` (script) | correct | none |
| §1.5 skew identities | 2 random Hermitian, `J = 93, 360`, 36 pairs each; `diag(i,1,1,1)` | both identities hold; `L e₁₂ = −ie₃₄`, `L e₃₄ = −e₁₂`, `b = −1` vs `1` (script) | correct; Hermitian needed | none |
| §1.6 quaternionic module | `x(αj)` vs `x(jσ(α))`; `d′_U = αd_U`; zero form | both `L(x)σ(α)`; `j′ = jα⁻¹ = σ(α)⁻¹j`, `j′² = J/N(α)`; `J = 0` not a quaternion algebra | consistent with `normMulEquiv` (`z = σ(α)⁻¹`, `N(z) = N(α)⁻¹`) | none |
| §1.7 `map_similitude` (Lean) | 3 Cayley similitudes (`ν = 5`, `c = 3−i`); non-Hermitian form, `g = (1+2i)·id`, `c = 3`; scalar `t`; `g = −1` | holds with `ν²/det g`, fails with its conjugate; factor `−7/25 + 24i/25`, holds; `ν = t²`, `det = t⁴`; `⋀²(−1) = 1` (script/hand) | true for every sesquilinear `H` | none |
| §1.8 projective map | `g ↦ gα` | `ν²/det` gains `(σ(α)/α)²`; `β ↦ βα⁻²` | well defined | none |
| §2.1 plane groups | `β = (1+2i)+j·i`, `α = 2−i`, `J = −3`; `diag(a₁,a₂)` | `Nrd β = 8`, mult. `8/5`, det `24/25+32i/25` (script); `L₁e₁ = −a₁e₂`, `L₁e₂ = a₂e₁`, `L₁² = −a₁a₂` | correct | none |
| §2.2 decomposition | `diag(1,2,1,−5)` | `L(e₁₂) = −2e₃₄`, `L(e₃₄) = 5e₁₂` (script): exchanges `⋀²U₁, ⋀²U₂`; dims `4 + 2 = 6` | correct | none |
| §2.3 block isogeny | dimensions | `5+5−1−1 = 8 = 7+2−1` | correct | none |
| §2.4 block image | `([b₁,α₁],[b₂,α₂])` | `det(g₁)α₁α₂ = Nrd(b₁)α₁⁻²α₁α₂ = Nrd(b₁)α₁⁻¹α₂` | correct | none |
| §2.5 block groups | `(t,t⁻¹)`; `α` on `W₀` | multiplier `t²t⁻² = 1`; `N(α)` | correct | none |
| §2.6 tensor model | `J₁ = −2`, `J₂ = 5` | `e₁₃↦e₂₄`, `e₂₃↦−2e₁₄`, `e₁₄↦5e₂₃`, `e₂₄↦−10e₁₃`; vol `−10`; `W`-form `diag(1,2,−5,−10)` (script) | correct | none |
| §2.7 three-plus-one | dimensions | `dim_E W = 3`, `B`-rank 3 | correct | none |
| §2.8 diagram | both composites | `[[b₁,b₂], Nrd(b₁)α₁⁻¹α₂]` | commute | none |
| §3.1 signatures | `Σ` / not `Σ` | `(4,2) = (2,2)+(2,0)`; `(0,6) = (0,4)+(0,2)` | correct | none |
| §3.2 split torus map | central `(z,z,N z)` | `(N(z)², N(z)², N(z)²)` | central | none |
| §3.3 real torus map | `y = (1,1,1,−1)`, `(1,1,i,i)`, `(−1,1,i,i)` | `(−1,−1,−1)`, `(1,1,−1)`, `(−1,−1,1)` (script) | Checks correct; common sign | none |
| §3.4 weight lattice maps | `[−4,4]³` both directions; `(2,0,0)`, `(0,0,2)`, `(1,0,0)` | round trips identity; `(1,−1,1,−1)`, `(1,1,−1,−1)`, `(½,−½,½,−½)` (script) | correct; odd sum excluded | none |
| §3.5 `A_q₁` cohomology | `k = 2, 3, 4` | `(1+t²)² = 1+2t²+t⁴` ⇒ `1,2,1`, total `4 = χ(ℙ¹×ℙ¹)` | correct | none |
| §4.1 harmonic tensors | `ℝ²`, `ℓ = 2` | `ℋ² = ⟨e₁²−e₂², e₁e₂⟩`, `(e₁+ie₂)² ∈ ℋ²`, `e₁² ∉` | correct | none |
| §4.2 Fock comparison | `φ₀`; `w = x₁+ix₂`; `z₁²` | `(x+(2π)⁻¹∂)φ₀ = 0`; op`(wᴺφ₀) = 2wᴺ⁺¹φ₀` ⇒ `ι(wᴺφ₀) = (z₁+iz₂)ᴺ/(4πi)ᴺ`; `ι⁻¹(z₁²) = (2πi)²(4x₁² − π⁻¹)φ₀` (hand) | correct | none |
| §4.3 normalization | FM06 constant; `q = 2`; `p = 0` reading | ratio `2^{−q/2} = 1/2`; empty index set gives `0` vs `φ′₀ = 1`; `K′`-weights `+3`, `−3` | correct | none |
| §4.4 restriction | `r(e₁²)` in signature `(2,2)` | contraction of `Q = e₁²+e₂²−e₅²−e₆²` is `4` ⇒ `e₁² − Q/4` | correct | none |
| §4.5 noncompact formula | `ℓ = 0` | pairings `1, −1, εi, εi` ⇒ `(z₁+εiz₂)²` ⇒ `(x₁+εix₂)²φ₀` (hand) | correct | none |
| §4.6 compact formula | `ℓ = 1`, `x = e₁` | `(−1)·(−1)` signs cancel; value `e^{−π}` for `ℓ = 0,1,2` | no `(−1)^ℓ` | none |
| §5.1 dimensions | `d` split places | quaternionic `2d`, unitary `4d` | correct | none |
| §5.2 component torus | `Z → T` | `[t²,1] ~ [t,t]` mod `(t,t⁻¹)`; kernel `([±1,1],1)` | correct | none |
| §5.3 character class | `j(s)` | `η(s⁻²·s) = η(s⁻¹) = 1` | correct | none |
| §5.4 coefficient weight | `k = 4` | `(2,0,0) ↦ (1,−1,1,−1)`, reorder `(1,3,2,4)` ⇒ `(1,1,−1,−1)` (script) | correct | none |
| §6.1 toric lift | central character | `η|_{𝔸^×}ξ_E`; `[𝔸^× : F^×N] = 2` | correct | none |
| §6.2 product lift | `Ram(B₁) = {∞,2}`, `Ram(B₂) = {∞,3}` | `Ram(B) = {2,3}`, split at `∞` | correct | none |
| §6.3 doubling point | Siegel parabolic of a form of `O(12)` | `dim N = (66−36)/2 = 15 = dim ⋀²(6)`, `δ_P = |Nrd|⁵`; exponent at `3/2`: `1` (vs `13/2`); `b/a = ζ(4)ζ(6)ζ(8)/(ζ(3)ζ(1)ζ(−1))` | correct | none |
| §§6.4–6.5 rigidity | anisotropy | a real place with `(0,6)` ⇒ `F`-anisotropic | hypothesis holds for `d < n` | none |
| §7.1 sign vectors | `F` real quadratic | `2² = 4` vectors; positive norms ≠ norm subgroup | correct | none |
| §7.2 central character | `m = 3` | `ξ_E³·ξ_E = 1` | trivial | none |
| §7.3 averaging | `K′ ⊂ K` | volume-one average `= [K:K′]⁻¹ Σ` translates | rational | none |
| §7.4 see-saw, `d = 0` control | `3` in `ℚ₃(i)` | unramified, odd valuation ⇒ not a norm | §3.32a does not apply | none |
| §7.5 sign vectors | even `k_v` | `ε^{k_v} = 1` | independent of `ε` | none |
| §7.7 auxiliary character | `χ_v` of order 2 | `η|_{E¹} = χ² = 1` ⇒ factors through norm | rejected, as stated | none |
| §§7.8–7.9 weights | Gaussian `m = 2`; products | `±1`; `k_v+1`, `−(k_v+1)` | correct | none |
| §8.1 parameter | `As⁺(BC σ)` | `Sym²σ ⊕ (∧²σ ⊗ ξ_E)`, `∧²σ = ξ_E` ⇒ `ζ_F` factor, pole at `1` | correct | none |
| §§8.2–8.3 modules, `δ` | `I₂,₂`, block swap | dims `1,2,1`; `δ* I₂,₂ δ = −I₂,₂`, `δ² = 1` | correct | none |
| §8.6 Hodge criterion | `w = (23)`; `w = 1` | `½(k−2,−k,k,−k+2)`, `τ_Z = α⁻²` ⇒ `k′ = k−1`, type `(k−1,k−1)`; `τ_Z = α^{2k−4}` ⇒ `(0,2k)` | correct | none |
| §8.7 shift | `k = 4` | `(3,3) → (1,1)`; extremes `(2−k,k+2)`, total `4` | correct | none |
| §8.8 purity | `d = 2` | type `(2,2)` | correct | none |
| §9.1 dual group | `θ₄`; `F = ℚ(√2)`; scalar `1+i` | `J₄² = −1`, `θ₄` maps `E₁₂ ↔ E₃₄`, fixes `E₂₃` (script); `34` vs `33`; `N(det) = 16 = ν⁴`, wrong model `1/16` | correct | none |
| §9.2 lowest line | `W₋₁ = ρ_E|·|^{1/2}` | `⋀²W₋₁ ⊗ |·|⁻² = |·|⁻¹`; `d = 1`: line in 6-dim | `ℚ_ℓ(−d)` | none |
| §9.3 de Rham characters | `log χ`; unramified `c`; `v ∤ ℓ` | ramified, not de Rham; crystalline; `𝒪_v^×` pro-`p` × finite ⇒ no `ℚ_ℓ` homs | correct | `H¹_g` owner cited |
| §9.4 unipotent extensions | `k = ℚ`; mod-`ℓ` lattice | no unramified extension of `ℚ` ⇒ `0`; `ℓ | h` gives counterexample | correct | "continuous" added |
| §9.5 conditional triviality | structure | §0.2 de Rham + §9.4 | route consistent | none |
| §10.1 auxiliary weights | `k_v = 2` | weight `3` | correct | none |
| §10.2 embedding criterion | `B = (−1,−1)_ℚ`, `E = ℚ(√2)`, `ℚ(i)` | `∞` split ⇒ invariant `½`; `2·½ = 0` at `∞`, `2` | correct | none |
| §10.3 restriction | `c = 0`; `√2` control | `0`; `√2·I ∉ M(ℚ)` | correct | none |
| §10.6 determinant descent | `diag(x₁c₁,x₂c₂)`; average of `(i)` | `x₁x₂c₁c₂`; `(i + (−i))/2 = 0` | correct | none |
| §§10.7–10.8 `d = 0` | rank one, trivial cocharacter | type `(0,0)`, trivial Galois action | immediate | none |
| §10.9 multiplicity spaces | Iwahori vs spherical | `2·2 = 4`, `2·1 = 2`, both multiplicity spaces `2` | correct | none |

Context of the Lean statements: confirmed by the elaborated `#check @` types above (no section
variables; every binder is in the signature).

## Unresolved

- Not verifiable here: the supplier contracts and the eight `gap:` requests were checked for existence
  and statement at the heads, not as proofs; the three Lean theorems are checked by exact computation on
  the instances above and the arguments recorded, not by a Lean proof.
- The README keeps the eight `What <Supplier> must provide (gap:…)` contracts accepted at review; they
  are requests to MetaplecticAutomorphicForms (3), GL2AutomorphicRepresentationsAndTransfer (2),
  ArithmeticLocallySymmetricSpaces, ComplexKahlerGeometry and PadicHodgeTheory, which those roadmaps do
  not yet state.
- About 40 README lines exceed 104 characters, as in the package; nothing checks line length.
- No passage in the package, the reports or the roadmaps read was suspicious (no embedded instructions).


Pull request: #2436 (roadmap/hodge-classes-for-jacquet-langlands at 11238e8)
