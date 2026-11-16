# PKG-HochschildHomologyAndHKR: package report

Deliverables: `packages/HochschildHomologyAndHKR/README.md` (2331 lines, 8 layers, 37 numbered
targets), `Suggested.lean` (213 lines), `metadata.toml` (`topic = "math.KT"`, as RefinedTraceMethods
on the board and AlgebraicKTheory, SpectralSequencesAndConvergence and HopfologicalAlgebra on main),
`sources.toml` (unchanged: its nine entries and every `cited_for` list already match the sections of
the final README where each key is cited, checked by script). The `gaps` list of `design/plan.json`
is unchanged: its one gap, `smooth-hkr-antisymmetrisation` (supplier RefinedTraceMethods, §1.9), is
the README's only `What <Supplier> must provide (gap:<slug>)` line, in the RefinedTraceMethods
subsection of the supplier contracts.

The accepted design (review ~15: accepted, no finding, conditional on the gap) already had the
upstream shape. The README is the design text with the corrections listed below. Every target,
Check, API bullet and worked example of the design is kept: 37 numbered subsections, each with a
*Needs* line; every definition keeps its API list and at least three Checks; every layer ends with
Examples and Dependencies.

## Headline theorems

| Headline | README | Status at the pins |
|---|---|---|
| Cohomological HKR theorem: `⋀ⁿ_R Der_k(R) ≅ HHⁿ(R,R)`, `D₁ ∧ ⋯ ∧ Dₙ ↦ [D₁ ∪ ⋯ ∪ Dₙ]`, for `R` smooth and `k`-projective | 7.6(2) | **stated**: `cohomological_hkr` |
| HKR duality `HHⁿ(R,M) ≅ Hom_R(Ωⁿ_{R/k}, M)` with the antisymmetrisation formula, every symmetric `M` | 7.6(1) | **stated**: `cohomological_hkr_hom_kaehler` |
| The determinant cocycle represents `n!` times the cup class, every commutative `R` | 7.5, 7.6(3), 8.5 | **stated**: `detCochain_sub_factorial_smul_cupDerivations_mem` |
| `HHⁿ(A,M) ≅ Extⁿ_{Aᵉ}(A,M)` for `k`-projective `A` | 4.4 | **stated** (existence of the `k`-linear isomorphism): `nonempty_linearEquiv_ext` |
| Graded commutativity of `HH^•(A,A)` (from Gerstenhaber's homotopy formula) | 6.2 | **stated**: `cupProduct_graded_comm` |
| `HHₙ(A,M) ≅ Torₙ^{Aᵉ}(M,A)` for `k`-flat `A` | 4.5 | not statable: no Hochschild chain complex with bimodule coefficients at the pins (Tau Ceti's `TauCeti.normalizedHochschildChains` has coefficients `A`; `C_•(A,M)` needs §1.1's simplicial identities), no `Tor` over a noncommutative ring (Mathlib's and Tau Ceti's `Tor` need a commutative ring) |
| `HH₁(R,R) ≅ Ω¹_{R/k}` for every commutative `R` | 3.4 | not statable: same chain complex missing |
| Normalisation theorem over every `k` (homotopy equivalence with the normalised complexes) | 2.1, 2.2 | not statable: `N_•(A,M)`, `N^•(A,M)` with bimodule coefficients are constructions whose differentials need §§1.1–1.2's simplicial identities; the pinned `TauCeti.normalizedHochschildCochainComplex` has dual-bimodule coefficients only |
| Cup product equals the Yoneda product up to the sign `(−1)^{pq}s(p,q)`; the `extMk` description and naturality of the §4.4 isomorphism | 5.4, 4.4 | not statable: the bar resolution as a `ProjectiveResolution` in `ModuleCat Aᵉ` is §4.2's construction, and `s(p,q)` has no closed form at the pins |
| `HH²(A,M)` classifies `k`-split square-zero extensions | 3.6 | not statable: the twisted extension `A ⊕_f M` as a `k`-algebra (associativity is the cocycle identity, §3.5) and the class of a `k`-split extension of a noncommutative algebra are constructions that are theorems; `TauCeti.SquareZeroExtension` is commutative |
| Polynomial algebras over every `k` | 8.4, 8.5 | cohomology half: the instance `R = MvPolynomial (Fin m) k` of `cohomological_hkr` and of the `n!` theorem (`Algebra.Smooth` and `Module.Projective` instances found by `inferInstance` at the pin), so not restated; homology half: chain complex missing |

The module docstring of `Suggested.lean` lists each unstatable headline with what it lacks, and says
that clauses (3)–(5) of §7.6 follow from the stated theorems.

Definitions in `Suggested.lean`, all with real bodies on pinned carriers: `hochschildBimoduleCocycles`
(kernel of `TauCeti.hochschildBimoduleCoboundary`), `hochschildBimoduleCoboundaries` (its image, `⊥` in
degree 0), `hochschildBimoduleCohomology` (the quotient `Zⁿ/Bⁿ`, an `abbrev`), `cupProduct`
(`domCoprod`, `LinearMap.mul'`, `domDomCongr finSumFinEquiv`), `cupDerivations` (`mkPiAlgebra`
composed with the derivations), `detCochain` (`Matrix.detRowAlternating` restricted to `k`). Two
proved `example`s check index conventions: `cupProduct` sends the first `p` arguments to `f`, and
`detCochain D r` is the determinant of the matrix with entries `Dⱼ(rᵢ)` (row `i`).

The pins give `HHⁿ(R,M)` no `R`-module structure (§1.5 adds it). So the two §7.6 statements are
`k`-linear equivalences with prescribed values on generators. Those values determine the maps:
`r · ιMulti D` spans `⋀ⁿ Der` over `k`, and `ιMulti (dr)` spans `⋀ⁿ Ω` over `R`. The README says
this in the Conventions and in §7.6.

## Elaboration

`lake env lean packages/HochschildHomologyAndHKR/Suggested.lean`, run from the content checkout:
exit 0. Exactly **5** `sorry` warnings (lines 106, 136, 173, 187, 204: the five theorems) and **no
other message**. Header: `module`, `import Mathlib`, `import TauCeti.RingTheory.HochschildCohomology.Coboundary`
(the object file exists at the pin; no build was needed). No `set_option`, no `lemma`, no sorry'd data.

Binder audit: a scratch copy of the file with `#check @name` for all 11 declarations was elaborated
once. Every elaborated type carries its hypotheses in its own signature: the bimodule instances,
`SMulCommClass A Aᵐᵒᵖ M` and `Module.Projective k A` on `nonempty_linearEquiv_ext`, `Algebra.Smooth k R`
and `Module.Projective k R` on both HKR theorems, and the symmetric-bimodule instances on
`cohomological_hkr_hom_kaehler`. Each elaborated type was compared with its README statement and
matches. Nothing changed: all binders were written explicitly from the start. A further scratch file
ran `#check` on the Mathlib names newly cited in the contracts (`Semiring.toOppositeModule`,
`MultilinearMap.domCoprod`, `MultilinearMap.domDomCongr`, `finSumFinEquiv`, `finCongr`,
`LinearMap.mul'`, `LinearMap.compMultilinearMap`, `MultilinearMap.mkPiAlgebra`,
`MultilinearMap.compLinearMap`, `Matrix.detRowAlternating`, `MultilinearMap.restrictScalars`,
`LinearMap.pi`, `Submodule.Quotient.mk`, `IsCentralScalar`, `Equiv.Perm.sign`,
`ModuleCat.Algebra.instLinear`, `instModuleTensorProductMop`, `TensorProduct.Algebra.module`,
`CategoryTheory.Abelian.Ext.instModule`): all resolve.

Signature of `nonempty_linearEquiv_ext` (statement-hygiene repair): the two `letI` lines that chose
the `Aᵉ`-module structures on `A` and `M` are gone from the signature. The same Mathlib structures
are now passed by name to `ModuleCat.of`:
`@ModuleCat.of (A ⊗[k] Aᵐᵒᵖ) _ A _ (instModuleTensorProductMop k A)` and
`@ModuleCat.of (A ⊗[k] Aᵐᵒᵖ) _ M _ TensorProduct.Algebra.module`. A scratch file checked that the
former `letI` statement and the new one are definitionally the same proposition (`Iff.rfl`
elaborates), and `#check @nonempty_linearEquiv_ext` shows the same binders as before. The
mathematics, the README and the adversarial-pass row for §4.4 are unchanged.

TeX-residue repair in the README: the Hochschild boundary and coboundary formulas (Conventions,
Ginz05 lines 973–976 and 1055–1062) were each one code span wrapped over two lines, so the gate's
scan saw their `_{` and `^{` as text outside code (10 hits). Each formula is now a single
one-line code span with the same symbols; the gate's scanner finds 0 hits.

## Corrections to the design text

1. **Gap placement.** The design stated the gap in a separate subsection, "Gaps the named suppliers
   must provide". It now sits in the RefinedTraceMethods contract as
   `What RefinedTraceMethods must provide (gap:smooth-hkr-antisymmetrisation): …`, with the instance
   where `π_n ε_n = n!` gives nothing (`𝔽₂[x,y]`, `n = 2`). The separate subsection is deleted, and
   the four *Needs*/Dependencies mentions now use the `gap:` token.
2. **§1.2 carriers.** `Zⁿ(A,M)`, `Bⁿ(A,M)` and `HHⁿ(A,M) = Zⁿ/Bⁿ` are now defined on the pinned
   coboundary, under the Lean names. That `HHⁿ` is the cohomology of the alternating coface complex
   is now an API bullet, together with `Bⁿ ⊆ Zⁿ`. The object is the same; what was the definition is
   now a stated identification, and the reverse.
3. **Conventions.** New bullet on the carriers of `Suggested.lean`: cochains as `(Fin n → A) →ₘₗ[k] M`;
   `A` as a bimodule over itself through `Semiring.toOppositeModule`; a symmetric bimodule through
   `IsCentralScalar R M`, which every `R`-module is in exactly one way; the `k`-structure of `Ext`
   through `ModuleCat.Algebra.instLinear`; and the `k`-linear form of the §7.6 statements.
4. **Mathlib contract.** New bullet for the multilinear-map, determinant and quotient declarations
   the Lean definitions use. The `Ext` bullet now names `CategoryTheory.Abelian.Ext.instModule`.
5. **Lean names and statement forms.** §4.4 (`nonempty_linearEquiv_ext`, with the `Aᵉ`-structures
   used, and the `extMk` description marked as a statement about the bar resolution); §5.1
   (`cupProduct`, its construction, bilinearity as a claim); §6.2 (`cupProduct_graded_comm`, with
   the cocycle form and the `finCongr` reindexing); §7.5 (`detCochain` with its row convention,
   `cupDerivations`, and the `n!` bullet sharpened to the coboundary form with its `n = 0` case);
   §7.6(1), (2) (the Lean forms, the explicit formula of (1), and why multiplicativity follows
   from (2)'s formula); §8.4 (the cohomology half as the polynomial instance of
   `cohomological_hkr`).
6. ***Needs* lines** of §§1.2, 4.4, 5.1, 6.2 and 7.5 now list the Mathlib declarations their
   definitions use, and the §1.2 carriers their statements use.

The adversarial pass found nothing false in the design, so no statement was weakened or deleted.

## What the README could not support

Nothing new. Five works stay cited by locator only, as `sources.toml` already settles them as
uncertified: Loday98, Ger63, Weibel94, CE56 and Mat86. No source was fetched, and
`needs-references.toml` was not written. §6.4(d), and §7.6 through it, rest on the declared gap.
Rechecked at RefinedTraceMethods' head `91f73dc`: §1.9 still has only `π_n ε_n = n!`, the degree-one
case and the characteristic-zero formality. Rechecked at KTheoryFiniteLocalFields' head `0bca594`:
§4.0 still states `HHₙ(A/k) ≃ Ωⁿ_{A/k}` without naming the map. So the gap stands.

## Notions moved down from later roadmaps

None. The suppliers are all on main (DGAInfinity, DerivedModuleAlgebra, IntegralIwasawaTheory,
DerivedDeRhamCohomology, NoncommutativeGeometry, BanachAlgebras, ZigzagPreprojective) or earlier in
the merge order: EulerSystemsAndKolyvaginSystems (line 113), KTheoryFiniteLocalFields (98),
LanglandsParameterStacks (88) and RefinedTraceMethods (351). This roadmap is line 352.

## Duplication sweep and ownership

Removals: none.

- **Pins.** No cup product of classical Hochschild cochains: the only Tau Ceti hits are the
  `A∞`-Hochschild files, which say the cup product is not included, and monoidal cochain cups. No
  polyvector fields, no `HKR`, no Hochschild chain complex with bimodule coefficients, and no
  noncommutative `Tor`: `TauCeti/Algebra/Category/ModuleCat/Monoidal/Tor.lean` is over a `CommRing`.
  Every pinned object the roadmap uses is cited in the contracts, as in the design.
- **Main and all 453 open heads,** searched by object with `roadmaps grep -i --readme-only`.
  `polyvector` and `Hochschild[–-]Kostant[–-]Rosenberg`: no match anywhere. `Hochschild cohomology`:
  BanachAlgebras Layer 6 (bounded), CStarAlgebras, NoncommutativeGeometry N1 (dual coefficients,
  corner restriction) and ZigzagPreprojective Layer 7, all scoped out in Scope and ownership.
  `Gerstenhaber`: DGAInfinity (imported) and RibbonKnots (the Gerstenhaber–Rothaus theorems,
  unrelated). `bar resolution`: group bar resolutions. `Hochschild chain/homology`: RefinedTraceMethods
  and KTheoryFiniteLocalFields (derived chains, imported); CyclicHomologyLieHomologyAndQuasiFreeAlgebras
  (leaves Hochschild chains to KTheoryFiniteLocalFields, states no cochain complex, bar resolution
  or `HH²` classification); SpectralManifolds (shuffle of NoncommutativeGeometry N1 chains);
  AInfCohomology, HabiroCohomologyFoundationsPartII and the prismatic roadmaps (topological
  Hochschild homology). `square-zero extension` together with Hochschild, and cup product together
  with Hochschild: derived and Galois uses only.
- **Board packages.** Hochschild hits are Hochschild–Serre spectral sequences, apart from
  RefinedTraceMethods and RefinedTraceMethodsPartII. The latter is later in the order (line 353) and
  states no classical complex or cohomological HKR. No package or open head cites
  `HochschildHomologyAndHKR`, so Downstream consumers ("no roadmap later in the merge order imports
  this one") stands.

Ownership: this roadmap owns the objects in its Scope section. The search shows no other owner on
main, in an open pull request or on the board. No declaration of `Suggested.lean` has the qualified
name of a declaration in another roadmap.

## Citations

`roadmaps resolve` on the final README (main `51d880d`, 453 open heads, index of
2026-11-16T02:32:16Z) lists no cross-roadmap citation found nowhere and no Lean name found nowhere.
Headings checked by hand:

- On main: DGAInfinity Layers 0, 1 and 8 (lines 263, 293, 520); DerivedModuleAlgebra §0.K.1 (649)
  and §0.5 (1339); NoncommutativeGeometry N1 (479) and N1.Cyclic (582); BanachAlgebras Layer 6
  (1379); ZigzagPreprojective Layer 7 (1047); DerivedDeRhamCohomology Layer 2 (3043); IntegralIwasawaTheory
  §12.6, which owns `exteriorBidual` and `toExteriorBidual` in `TauCeti.StarkSystems`.
- At open heads: RefinedTraceMethods §§1.1, 1.9, 1.10; KTheoryFiniteLocalFields §4.0 (target
  "Cyclic homology foundations"); EulerSystemsAndKolyvaginSystems §6.1 ("This map is an
  isomorphism for finite projective X"); LanglandsParameterStacks §1.17.

The overlaps tool (`roadmaps overlaps`): no open pull request changes this roadmap, no cited id is dropped, and there
is no second copy.

## Adversarial pass

One row per statement written or changed. `E_ij` are matrix units. The design's remaining
statements were recomputed in review ~15. I re-checked the delicate ones (§§3.5, 3.6(a), 7.2, 7.4
and 7.6 Checks) and record them in the last rows.

| Statement | Instances tried, values computed | Result | Change |
|---|---|---|---|
| `hochschildBimoduleCocycles` (§1.2) | `A = M = k`: `δ₀m(a) = am − ma = 0`, `Z⁰ = k`; `δ₁f(a,b) = f(1)ab(1 − 1 + 1) = f(1)ab`, `Z¹ = 0`. `Mat₂(k)`: `Z⁰` = scalars (`E₁₁E₁₂ − E₁₂E₁₁ = E₁₂`). | holds | none |
| `hochschildBimoduleCoboundaries` (§1.2) | `n = 0`: `⊥`. `A = M = k`: `B¹ = im δ₀ = 0`. `Mat₂(ℤ)`: `δ₀E₁₁(E₁₂) = −E₁₂ ≠ 0`. `Bⁿ ⊆ Zⁿ` needs `SMulCommClass` (pinned `δ∘δ = 0`); every theorem carries it, or has it as an instance for `M = A`. | holds | none |
| `hochschildBimoduleCohomology` (§1.2) | `k = ℤ`, `A = M = 𝔽₂`: `δₙ` is multiplication by `Σ_{i=0}^{n+1}(−1)^i` = `0` (n even), `1` (n odd); `HH⁰ = 𝔽₂`, `HH¹ = 0/0`, `HH² = 𝔽₂/𝔽₂ = 0`, matching §3.6 Checks. `k = 0`: every term `0`. | holds | none |
| `nonempty_linearEquiv_ext` (§4.4) | `k = A = M = ℤ`: `HH⁰ = ℤ = Hom(ℤ,ℤ)`, `HH¹ = 0 = Ext¹`. `A = M = k[x]`: resolution `Aᵉ --(x−y)--> Aᵉ`; `Hom(−,A)` has differential `0`, so `Ext⁰ = Ext¹ = k[x]`; `HH⁰ = k[x]` (centre), `HH¹ = Der = k[x]`. `A = 0`: both `0`. Action conventions: `(a ⊗ op b)•m = a m b` for both objects (`TensorProduct.Algebra.module`, `instModuleTensorProductMop`). `k`-structure of `Ext` through `algebraMap k → Aᵉ`, central. | holds | none |
| `cupProduct` (§5.1) | Proved example: value `f(a ∘ castAdd) · g(a ∘ natAdd)`. `p = q = 0`: product of constants. `1 ∪ f`: `Fin 0` part empty, gives `f`. `k[x,y]`: `(∂_x ∪ ∂_y)(x,y) = 1`, `(∂_y ∪ ∂_x)(x,y) = 0`, matching the §5.1 Check. | holds | none |
| `cupProduct_graded_comm` (§6.2) | `(0,0)`, central `x, y`: `yx − xy = 0 ∈ ⊥`. `(1,0)`, derivation `f`, central `y`: `yf(a) − f(a)y = af(y) − f(y)a = δ(f(y))(a)` (from `f(ya) = f(ay)`). `(1,1)`, `k[x]`, `f = g = ∂`: `2∂∪∂ = −δ(∂²)`; at `(x,x)`, `2 = −(0 − 2 + 0)`. `k[x,y]`: `∂_y∪∂_x + ∂_x∪∂_y = −δ(∂_x∂_y)`. Cocycle hypotheses needed: `Mat₂(ℤ)`, `(0,0)`, `f = E₁₂`, `g = E₂₁`: `E₂₂ − E₁₁ ≠ 0`, `B⁰ = 0`. Reindexing: `domDomCongr (finCongr _)` evaluates on the same entries. | holds | none |
| `cupDerivations` (§7.5) | `n = 0`: the constant `1`. `n = 1`: `D`. `k[x,y]`, `(∂_x,∂_y)`: `(x,y) ↦ 1`, `(y,x) ↦ 0`. | holds | none |
| `detCochain` (§7.5) | Proved example: `det(Matrix.of fun i j ↦ Dⱼ(rᵢ))`. `k[x,y]`: `(x,y) ↦ det I₂ = 1`, `(y,x) ↦ −1`. `n = 0`: empty determinant `1`. `(∂,∂)`: `0` (equal columns). | holds | none |
| `detCochain_sub_factorial_smul_cupDerivations_mem` (§7.5) | `n = 0`: `1 − 0!·1 = 0 ∈ ⊥`. `n = 1`: `D − D = 0`. `ℤ[x,y]`, `n = 2`: `det − 2·cup = −(∂_x∪∂_y + ∂_y∪∂_x) = δ(∂_x∂_y)`. `k[x]`, `(∂,∂)`: `0 − 2∂∪∂ = δ(∂²)`, since `δ(∂²)(a,b) = −2∂a∂b`. `𝔽₂[x,y]`: `det = δ(∂_x∂_y)` (mod 2, `−(∂_x a∂_y b + ∂_y a∂_x b) = det`). The non-flat `ℤ`-algebra `𝔽₂[x,y]` is allowed: no flatness enters. | holds | none |
| `cohomological_hkr_hom_kaehler` (§7.6(1)) | `n = 0`: `e[m](1) = m`. `n = 1`, `k[x]`: `e[∂](dx) = 1`. `n = 2`, `k[x,y]`: `f = ∂_x∪∂_y` gives `1 − 0 = 1`; `f = ⟨∂_x,∂_y⟩` gives `1 − (−1) = 2`; `f = δ(∂_x∂_y)` gives `−1 − (−1) = 0`, so the formula is well defined on classes. Symmetry needed: §7.1 Check (`x` acting by `1` on the left, `0` on the right). Smoothness needed: `ℚ[x]/(x²)`, `Ω² = 0`, `HH²(R,R) = R/(2x) = ℚ ≠ 0`. `k`-projectivity is used only by the route (`ℤ[1/2]` satisfies the conclusion): a P3 note, not a finding. | holds | none |
| `cohomological_hkr` (§7.6(2)) | `n = 0`: `Ψ(r) = [r]`, `R ≅ HH⁰ = R`. `n = 1`, `k[x]`: `Ψ(r∂) = [r∂]`, `HH¹ = Der`. `n = 2`, `k[x]`: `⋀² = 0`, `HH² = 0`. `𝔽₂[x,y]`: `Ψ(∂_x∧∂_y) = [∂_x∪∂_y]` pairs to `1`; `ιMulti(∂_x,∂_x) = 0` and `[∂_x∪∂_x] = [−δ(∂_x^{[2]})] = 0`, consistent. `r = 0`: `Ψ(0) = [0]`. | holds | none |
| Convention: symmetric bimodule as `IsCentralScalar R M` (Conventions) | `R`-module `M`: `op r • m := r • m` is the only choice; `IsScalarTower k R M` forces `c • m = algebraMap c • m`. Non-example: `k[x]` acting on `k` by `1` on the left and `0` on the right is not central. | holds | new bullet |
| Convention: `Semiring.toOppositeModule` | `op b • x = x b` (Mathlib `Mul.toSMulMulOpposite`); `(a ⊗ op b)•x = a x b`; `Mat₂`: `(E₁₂ ⊗ op E₂₁)·E₂₂ = E₁₁`. | holds | new bullet |
| §1.2 bullet `HHⁿ` = cohomology of `C^•` | Alternating coface differential = pinned coboundary (design §1.2); cycles `Zⁿ`, boundaries `Bⁿ`; `n = 0`: no incoming differential, `HH⁰ = Z⁰`. | holds | reordered |
| §7.6(2) multiplicativity from the formula | `cupProduct (cup D) (cup D')(a) = Πᵢ Dᵢ(aᵢ) Πⱼ D'ⱼ(a_{p+j}) = cup (Fin.append D D')(a)`; `ιMulti D ∧ ιMulti D' = ιMulti (Fin.append D D')`. | holds | added sentence |
| §8.4 as the instance of `cohomological_hkr` | `Algebra.Smooth k (MvPolynomial (Fin m) k)` and `Module.Projective k (MvPolynomial (Fin m) k)`: `inferInstance` succeeds at the pin. `Der` is free on `∂ᵢ`, `⋀ⁿ` free on `∂_I`, `Ψ(∂_I) = [∪ ∂_I]`. | holds | added sentence |
| Gap line (RefinedTraceMethods §1.9) | `𝔽₂[x,y]`, `n = 2`: `π₂ε₂ = 2 = 0`, so the identity gives nothing; `ε₂(dx∧dy)` pairs to `1`. | holds | moved |
| §3.5 unit, §3.6(a) isomorphism (design, re-checked) | `(1,u)(a,m) = (a, m + ua + f(1,1)a)`, so `u = −f(1,1)`. `s(1) = 1 + i(m₀)`: `2s(1) − s(1)² = 1`, so the unit maps to `1_E`; products: `(s(a)+i(m))(s(a′)+i(m′)) = s(aa′) + i(f_s(a,a′) + am′ + ma′)`. | holds | none |
| §7.2, §7.4, §7.6 Checks (design, re-checked) | `ℚ[x]/(x²)`: `R ⊗_{Rᵉ}` periodic gives `d₁ = 0`, `d₂ = 2x`, so `HH₁ = R/(x)`, `HH₂ = xR`; with `M = ℚ` all differentials vanish, `HH² = ℚ`, `h₂ = 0`. `𝔽₂(u)[a]/(a²−u)`: `Hom` differentials `0` and `2a = 0`, so `HH² = R`; `Der = R∂`, `T² = 0`. | holds | none |

## Dependency check

```text
depcheck: 241 roadmaps, 2256 edges, 0 problem(s)
```

No UPWARD, CYCLE or moved line. HochschildHomologyAndHKR is at line 352 of the merge order,
directly after its last supplier RefinedTraceMethods (351).

## Untrusted text

Nothing read in the design, the reviews, other roadmaps or the sources asked for any action; there
is no suspicious passage to report.
