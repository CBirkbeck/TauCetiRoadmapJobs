# PORT-HochschildHomologyAndHKR

## Result

- **Branch:** `roadmap/hochschild-homology-and-hkr`, from `2b9ce21` (main).
- **Head commit:** `72a252e3a20aede52745d6d4d3853771a4c7afa6` (`72a252e3`, "HochschildHomologyAndHKR:
  roadmap (README, Suggested.lean, metadata)"). The commit adds three files, all under
  `TauCetiRoadmap/HochschildHomologyAndHKR/`; nothing outside the folder changes.
- **Build:** `lake build TauCetiRoadmap.HochschildHomologyAndHKR.Suggested` ends with
  `Build completed successfully (18268 jobs).` It prints 8 warnings, all `declaration uses 'sorry'`
  (lines 129, 145, 164, 194, 224, 238, 255 and 275), and no other warning.
- **Gate:** `gate HochschildHomologyAndHKR: set_option=0 blob=0 latex=0 tex=0 prnum=0 sorry-data=0
  sorry-examples=0 residue=0 private-paths=0 imports=0 mathlib-subimports=0 no-import-mathlib=0
  lean-lines=0 statement-hygiene=0 forbidden=0 dropped=0 readme-ids-missing=0 empty-sections=0
  round-labels=0 long-fences=0 layer-ids=0 target-ids=0 depcheck=0 metadata=0 stray-files=0
  dirty=0 outside-folder=0 source-material=0 OK`
- **Dependency check:** `depcheck: 253 roadmaps, 2400 edges, 0 problem(s)`. There is no UPWARD,
  CYCLE or `moved:` line.

## Draft pull request body

Adds the roadmap *Hochschild homology and the Hochschild–Kostant–Rosenberg theorem* (math.KT). It
builds the classical, ungraded Hochschild theory of an associative unital algebra `A` over an
arbitrary commutative ring `k`, with coefficients in an arbitrary `A`-bimodule, on Mathlib's
homological-complex carriers and Tau Ceti's bimodule coboundary. Its content, in order:

- the chain and cochain complexes as the alternating (co)face complexes of a simplicial and a
  cosimplicial module, so that Mathlib's Dold–Kan normalisation gives the normalisation theorem
  over every `k`;
- the low degrees: `HH₀ = M/[A,M]`, `HH⁰ = M^A`, `HH¹` as derivations modulo inner derivations,
  `HH₁(R,R) = Ω¹_{R/k}`, and `HH²` classifying `k`-split square-zero extensions;
- `HHⁿ ≅ Extⁿ` over the enveloping algebra for `k`-projective `A`, and `HHₙ ≅ Torₙ` for `k`-flat
  `A`;
- the cup product, its comparison with the Yoneda product, and its graded commutativity through
  Gerstenhaber's homotopy formula;
- an explicit sign dictionary with DGAInfinity's suspended Hochschild complex.

The end theorems are:

- the cohomological HKR theorem for `R` smooth and projective over any commutative `k`:
  `⋀^•_R Der_k(R) ≅ HH^•(R,R)` as graded `R`-algebras through cup products of derivations, dual
  to `HHⁿ(R,M) ≅ Hom_R(Ωⁿ_{R/k}, M)`, with the determinant cocycle representing `n!` times the
  class, so that the usual normalised HKR map is the isomorphism exactly when `n!` is invertible;
- for polynomial rings over every `k`, `HH_•` and `HH^•` with explicit bases, computed from the
  Koszul bimodule resolution with no smoothness input.

Mathlib has no Hochschild complex of an algebra. The other roadmaps treat Hochschild theory only
for DG and `A∞` algebras (DGAInfinity Layer 8), for derived chains (KTheoryFiniteLocalFields §4.0,
RefinedTraceMethods) or for bounded and continuous variants (BanachAlgebras, NoncommutativeGeometry).
This roadmap supplies the classical complex with bimodule coefficients, and the comparisons that
let those roadmaps read their statements on it.

## Dependencies that are still pull requests

- **EulerSystemsAndKolyvaginSystems** §6.1 (Exterior biduals of Selmer modules): the evaluation
  `⋀^r X → Hom(⋀^r X*, R)` is an isomorphism for finite projective `X`; used in §7.3. Its carrier
  is IntegralIwasawaTheory §12.6, which is on main.
- **KTheoryFiniteLocalFields** §4.0 (target "Cyclic homology foundations"): derived `HH_n(A/k)` and
  the smooth HKR comparison; used in §6.3 and §6.4.
- **RefinedTraceMethods**:
  - §1.1 (target "The cyclic enhancement of supplied derived Hochschild chains") and §1.9 (target
    "The antisymmetrisation map and the HKR projection"); used in §§6.3–6.4.
  - The declared gap `gap:smooth-hkr-antisymmetrisation`, used only in §6.4(d), and in §7.6
    through it.
  - §1.10, cited in a §6.3 Check.

LanglandsParameterStacks §1.17 is also a pull request. It is cited only in "Scope and ownership" and
"Downstream consumers", as the owner of the cotangent-to-Hochschild map; it is not a supplier.

I checked every citation against the head named in the open-PR index:

- RefinedTraceMethods at `91f73dc`: the §1.1 target text, and §§1.9–1.10.
- KTheoryFiniteLocalFields, at its open head: the §4.0 paragraph "Cyclic homology foundations".
- EulerSystemsAndKolyvaginSystems, at its open head: §6.1, "Prove that evaluation is an
  isomorphism for finite projective X".
- LanglandsParameterStacks, at its open head: §1.17.

The roadmaps on main also resolve:

- DGAInfinity Layers 0, 1 and 8;
- DerivedModuleAlgebra §§0.K.1 and 0.5;
- IntegralIwasawaTheory §12.6, which plans `TauCeti.StarkSystems.exteriorBidual` and
  `toExteriorBidual` as targets;
- NoncommutativeGeometry N1 and N1.Cyclic;
- BanachAlgebras Layer 6;
- ZigzagPreprojective Layer 7;
- DerivedDeRhamCohomology Layer 2.

`roadmaps overlaps` lists no dropped id, no second copy and no other pull request that changes this
roadmap. Nothing on main or at an open head cites `HochschildHomologyAndHKR`.

## What moved from the Lean to the README

Nothing. The package's `Suggested.lean` already satisfies the acceptance-test form:

- **What it states:** 8 sorried headline theorems and 5 real-bodied definitions that the headlines
  need: `hochschildBimoduleCocycles`, `hochschildBimoduleCoboundaries`,
  `hochschildBimoduleCohomology`, `cupProduct`, `cupDerivations` and `detCochain`.
- **Example:** one proved `example`, which fixes the argument order of `cupProduct`.
- **Form:** no sorried data, no `set_option`, and one module docstring that names the 4 headline
  groups not statable at the pins and the carrier each lacks.
- **Imports:** `import Mathlib` followed by the three `TauCeti.*` modules it uses. All three exist
  at the pin (`2fd255d`).

The file is copied unchanged.

**Tried and reverted: dropping `module`.** The package file begins with `module` and has no
`public section`. As a result, its declarations are not visible to other files that import the
module. I tried dropping `module` so that `#check` could import them. The build then printed a
second kind of warning ("imports `Mathlib` from package `mathlib`, which is designed for use with
the module system; consider adding `module`"), which the build criterion forbids. Making the
declarations public would need `public import`, which the import rule forbids. So the header is
kept as the package has it. 24 roadmaps on main have the same form.

**Signature check.** I did this with `#check @name` for all 14 declarations, in one scratch copy of
the file with the `#check` lines appended, elaborated once. Every declaration carries its binders in
its own signature (the file has no `variable` block). Each elaborated type matches its README
statement, in hypotheses and generality, so nothing changed. Two points of generality:

- `nonempty_linearEquiv_ext` carries `SMulCommClass A Aᵐᵒᵖ M` and `Module.Projective k A`.
- `cohomological_hkr` and `cohomological_hkr_hom_kaehler` carry `Algebra.Smooth k R` and
  `Module.Projective k R`.

## Supplier replacements, duplication removals and README fixes

**Supplier replacements: none needed.** The citation resolver could not check names outside
TauCetiRoadmap on this host, so I checked every backticked library name of the README myself, about
290 names:

- **One `#check` file.** It imported Mathlib and the 18 built `TauCeti` modules that declare the
  cited names, and was elaborated once.
  - Every Mathlib name resolved. `Algebra.TensorProduct` is a namespace, cited as such.
  - Every Tau Ceti name in a built module resolved.
  - The only failures were short forms (`extMk`, `Ext.comp`, `isoLeftDerivedObj`, …) that the
    README uses after giving the full name.
- **Source reading.** Nine cited Tau Ceti modules have no built `.olean`, so I read the pinned
  sources for their declarations and namespaces:
  - the A∞ algebra, suspension, brace, Gerstenhaber bracket, Hochschild differential and
    `PositiveHochschild` files;
  - `SquareZero/Basic.lean`;
  - `MvPolynomial/RegularSequence.lean` and `KoszulComplex/Regular.lean`;
  - `Graded/Shift.lean`;
  - `Balanced/Unit.lean` and `Balanced/OuterFactors.lean`.

  All cited declarations exist. No package restatement duplicates a pinned declaration. The
  hypotheses quoted in the contracts match the pinned `variable` blocks. For example,
  `TauCeti.SquareZeroExtension.extensionClass_eq_zero_iff` carries
  `[Module Bᵐᵒᵖ M] [IsCentralScalar B M] [Module A M] [IsScalarTower A B M] [IsScalarTower A Bᵐᵒᵖ M]`,
  as the README says.

**README fixes (two, both in "Exact supplier contracts → From Tau Ceti"):**

1. `TauCeti.BalancedTensorProduct.lid`, `rid` and `outerFactors` were attributed to
   `Balanced/Basic.lean`. At the pin, `lid` and `rid` are in
   `TauCeti/LinearAlgebra/TensorProduct/Balanced/Unit.lean`, and `outerFactors` is in
   `.../Balanced/OuterFactors.lean`. The entry now names those files, says what `lid` and `rid`
   are, and records that in `outerFactors` `A` acts on the first factors.
2. `TauCeti.IsDGAlgebra` was attributed to `TauCeti/Algebra/Homology/AInfinity/`. It lives, with
   `TauCeti.IsNonUnitalDGAlgebra`, in `TauCeti/Algebra/Homology/DG/Algebra/Defs.lean`. The entry
   now says so; `toAInfinityAlgebra` stays under `AInfinity/`.

**Duplication sweep: no removals.** I searched by object, using `roadmaps grep` over main and all
open heads plus direct reads, for:

- the cohomological HKR theorem and polyvector fields;
- Hochschild (co)homology, chains and complexes;
- the HH² classification of square-zero extensions;
- the classical cup product and Gerstenhaber's formula;
- `Tor` over a noncommutative ring;
- the Koszul resolution of the diagonal.

Findings:

- The HKR hits are all homological: KTheoryFiniteLocalFields §4.0, RefinedTraceMethods §§1.9–1.10,
  and CyclicHomologyLieHomologyAndQuasiFreeAlgebras and RefinedTraceMethodsPartII, which both cite
  §4.0. The README already records these as owners or kept variants.
- NoncommutativeGeometry N1.Cyclic, on main, owns the complex-scalar case of the §2.1 and §2.2
  comparisons. The README records this as a variant: ours holds over every `k`, and is a homotopy
  equivalence.
- LanglandsParameterStacks §1.17 owns the cotangent-to-`HH²` map. DGAInfinity Layer 8 owns the
  DG/`A∞` theory.
- No roadmap on main or at an open head plans `Tor` over a noncommutative ring. The `Tor` and
  Künneth passages in AlgebraicTopology, CohomologyOfGroups, ArithmeticLocallySymmetricSpaces and
  others are over commutative rings.
- The `ξ_i = x_i ⊗ 1 − 1 ⊗ x_i` in CrystallineCohomology live in a divided-power envelope, which
  is a different object.

No declaration of `Suggested.lean` shares a fully qualified name with a roadmap I can read; the
namespace is `TauCetiRoadmap.HochschildHomologyAndHKR`.

**Upstream-reviewer read.** I read the whole README once more. Apart from the two path fixes, I
found nothing a mathematician would flag as wrong, vacuous or unsourced. The checks I recomputed
are in the table below. Locators into Loday98, Weibel94, CE56, Ger63 and Mat86 are cited by section
only. These sources are recorded `uncertified` in `packages/HochschildHomologyAndHKR/sources.toml`,
and I could not open them.

## Adversarial mathematics pass

| Statement | Instances tried | Values computed | Result |
|---|---|---|---|
| `hochschildBimoduleCocycles`/`Coboundaries`/`Cohomology` (§1.2) | `n = 0`; `A = M = k`; `Mat₂(ℤ)` with `op b • m = bᵀm` | `B⁰ = ⊥`, `Z⁰ =` central elements; on `k` the differential `Cⁿ → Cⁿ⁺¹` is `Σ_{i=0}^{n+1}(−1)^i` = `0,1,0,1,…`, so `HH⁰ = k`, `HHⁿ = 0`; `δ(δm)(a,b) = (bᵀa − abᵀ)m`, at `a = b = E₁₂`, `m = 1` equal to `E₂₂ − E₁₁ ≠ 0` | without `SMulCommClass` `Bⁿ ⊄ Zⁿ`, as the docstring says; every statement adds the instance |
| `exists_homotopyEquiv_normalizedHochschildCochainComplexι` (§2.2) | `A = N = k`; `k = 0` | full pinned complex `k` in each degree, differential `0,1,0,1,…`, `H = k` in degree 0; normalised: degree 0 everything, degree `n ≥ 1` the maps `c·a₀⋯aₙ` with `a₁ = 1` forcing `c = 0`, so `H = k` in degree 0; over `k = 0` all zero | consistent |
| `homology_one_linearEquiv_kaehler` (§3.4) | `R = k`; `k[x]`; `k[x]/(x²)` over `𝔽₂`, `ℚ`; `k = ℤ`, `R = 𝔽_p` | `N₁(k) = 0 = Ω¹`; `b(1⊗x⊗x) = 2x⊗x − 1⊗x²`, so `[1⊗x²] = 2[x⊗x]` and `d(x²) = 2x dx`; `Ω¹ = R dx/(2x dx)`, dimension 2 over `𝔽₂`, 1 over `ℚ`; `Ω¹_{𝔽_p/ℤ} = 0`, `b₂ = 1` | holds; the transposed slot sends `x⊗1 = 0` to `dx ≠ 0`, so it is excluded |
| `nonempty_linearEquiv_ext` (§4.4) | `n = 0`; `A = k = M = ℤ`, `n = 1`; `k = 0` | `HH⁰ = M^A ≅ Hom_{Aᵉ}(A,M) = Ext⁰`; `C¹ = ℤ`, `δ¹ = id`, `Z¹ = 0`, so `HH¹ = 0 = Ext¹_ℤ(ℤ,ℤ)`; all zero | holds |
| `cupProduct` (§5.1) and its `example` | `p = q = 0`; `(∂_x ∪ ∂_y)(x,y)`, `(∂_y ∪ ∂_x)(x,y)`; reversed product on `Mat₂`, `x = E₁₁`, `g = id`, `(E₂₁,E₁₂)` | multiplication of `A`; `1`, `0`; Leibniz defect `E₁₁ − 0 + 0 − E₂₂` | the reversed order is excluded by §5.2 and pinned by the `example` |
| `cupProduct_graded_comm` (§6.2) | `(p,q) = (0,0)`, `(1,0)`, `(1,1)` with `f = g = ∂` on `k[x]` | central `x, y`: `yx − xy = 0 ∈ B⁰ = ⊥`; `y f(a) − f(a) y = a f(y) − f(y) a = δ(f(y))(a)` from `f(ya) = f(ay)`; `δ(∂²)(a,b) = −2∂a∂b`; `−δ(∂^{[2]})(x,x) = −(0 − 1 + 0) = 1 = (∂∪∂)(x,x)` | holds; `finCongr (add_comm p q)` reindexes `f ∪ g` into degree `q + p` |
| `cupDerivations`, `detCochain` (§7.5) | `n = 0, 1, 2`; `k[x,y]` at `(x,y)`, `(y,x)` | empty determinant `1` = empty product; `⟨D⟩ = D`; `det I₂ = 1`, `det [[0,1],[1,0]] = −1`; `∂_x ∪ ∂_y`: `1`, `0` | row `i` is `(D_j(r_i))_j`, as stated |
| `detCochain_sub_factorial_smul_cupDerivations_mem` (§7.5) | `n = 0, 1, 2`; `𝔽₂[x,y]` | `1 − 1 = 0 ∈ ⊥`; `D − D = 0`; `⟨D₁,D₂⟩ − 2D₁∪D₂ = −(D₁∪D₂ + D₂∪D₁) = δ(D₁D₂)`, since `δ(D₁D₂)(a,b) = −(D₁aD₂b + D₂aD₁b)`; over `𝔽₂`, `⟨∂_x,∂_y⟩ = δ(∂_x∂_y)`, which is nonzero with class `0` | holds for every commutative `R` |
| `cohomological_hkr_hom_kaehler` (§7.6(1)) | `n = 0, 1`; `R = k[x]`, `M = R`; `ℤ → ℤ[1/2]`; `k = 0` | `Perm (Fin 0) = {1}`, `e[m](1) = m`, `Hom_R(R,M) = M`; `e[D](dr) = D r`; for `k[x]`, `HH¹ = R·∂ ≅ Hom_R(R dx, R)` and `HH^{≥2} = 0`; for `ℤ[1/2]` (étale, not projective), `Cⁿ = ℤ[1/2]`, `HHⁿ = 0`, `Ω¹ = 0` | holds; the `ιMulti (d ∘ r)` generate `⋀ⁿΩ¹` over `R`, so the values determine `e` |
| `cohomological_hkr` (§7.6(2)) | `n = 0`; `𝔽₂[x,y]`, `n = 2`; `𝔽₂(u)[a]/(a² − u)` | `Ψ(r) = r ∈ HH⁰ = R`; `[∂_x ∪ ∂_y]` pairs to `1` with `1⊗x⊗y − 1⊗y⊗x`, while `[⟨∂_x,∂_y⟩] = 0`; inseparable case: `T² = 0` but `HH²(R,R) = R` (both periodic differentials vanish in characteristic 2) | holds; smoothness needed; the map uses cup products, not the determinant cocycle |
| `homological_hkr_mvPolynomial` (§8.4) | `m = 0`; `n = 0`; `m = 1`, `n = 2`; `m = n = 2` over `𝔽₂`; unsigned chain | `k̄ = 0`, so both sides vanish in positive degree; `e(r₀) = [r₀]`; `b(1⊗X⊗X²) = b(1⊗X²⊗X)`, and their difference is `b(1⊗X⊗X⊗X)`; the class pairs to `1` with `∂₁ ∪ ∂₂` although `πε = 2 = 0`; the unsigned chain has boundary `2(X₁⊗X₂ + X₂⊗X₁ − 1⊗X₁X₂) ≠ 0` | holds; `Fin.cons r₀ (r ∘ σ)` puts `r(σ i)` in slot `i + 1` |
| Conventions, boundary witness | `Mat₂(k)`, `E₁₂ ⊗ E₂₁` | `E₁₂E₂₁ − E₂₁E₁₂ = E₁₁ − E₂₂` | holds |
| §1.2 Check, last sign `−` | `Mat₂(ℤ)`, `m = E₁₁`, `a = E₁₂`, `b = E₂₂` | `δδm = 2(mab − amb) = 2E₁₂` | `≠ 0`, as stated |
| §1.3 Check, non-multiplicative `φ` | `φ(x^j) = 0` for `j ≥ 2` | `map(b(1⊗x⊗x)) = 2x⊗x`, `b(map(1⊗x⊗x)) = 2x⊗x − 1⊗x²` | differ by `1⊗x²` |
| §1.4 Check | `A = ℤ ⊕ (ℤ/2)ε` | `1⊗ε ↦ 1⊗2ε = 0` | not injective |
| §§3.5–3.6 | unit; `f(x,x²) = 1` on `k[x]`; `f = δg` with `g(1) = 1`; change of section | `u = (1, −f(1,1))`; `δf(x,x,x) = 1`, products `(x³,0)` vs `(x³,1)`; `(1,0)(x,0) = (x,x)`; `(a,m) ↦ (a, m + g(a))` gives `f − δg`; a unital section `a ↦ (a,h(a))` needs `f = −δh` | holds |
| §4.5 Check, non-flat `ℤ[x]/(px)` | resolution over `ℤ[x,y]/(px,py)` | `Ann(x − y) = pℤ`, `Ann(p) = (x,y)`; after `𝔽_p ⊗ −` the differentials in degrees 1–3 vanish, so `Tor₂ = 𝔽_p`, while `HH₂ = HH₂(𝔽_p[x],𝔽_p) = 0` | flatness needed |
| §5.2 Check | `Mat₂`, `x = E₁₁`, `m = E₁₂`, `(E₂₁,E₁₁)` | `δx(E₂₁) = E₂₁`, `δm(E₁₁) = E₁₂`, product `E₂₂` | `x ∪ δm` is not a cocycle |
| §6.1 dictionary | `n = 0, 1, 2`; degree count | `[m,Θx] = −Θ(δx)`; `[m,Θf] = Θ(δf)`; `[m,Θf] = −Θ(δf)` at `n = 2`; a word of length `ℓ` has degree `−ℓ`, so a degree-`p` map to `sA` needs `ℓ = p + 1` | sign `(−1)^{n+1}`, and arity `n` ↔ degree `n − 1` |
| §7.2 Check | `ℚ[x]/(x²)`, `M = ℚ` | `HH₁ = R/(x)`, `HH₂ = xR ≅ ℚ`, `HH²(R,ℚ) = ℚ`, `h₂(f)(x e₂) = x f(e₂) = 0` | `h₂ = 0`: the hypothesis on `HH₁` is needed |
| §8.1 change of variables | `m = 1` | `1⊗X − X⊗1 ↦ X − C(X) ↦ X`; `μ(1⊗X − X⊗1) = 0` | multiplication is evaluation at `0` |
| §8.3 Check | `j = 2`, signed and unsigned `ι` | signed: `b′ι(e₁∧e₂) = t₁(1⊗X₂⊗1) − t₂(1⊗X₁⊗1)`; unsigned defect `2(X₂⊗X₁⊗1 + 1⊗X₂⊗X₁ − 1⊗X₁X₂⊗1)` | sign needed when `2 ≠ 0` |
| supplier `kronecker_bijective_of_projective_homology_lt` | elaborated type | needs `∀ n, Projective (X.X n)` and `∀ j < n, Projective (H_j X)` | §7.2 applies it in degree `i ≤ n` |
| supplier `exteriorPower.bijective_pairingDual` | elaborated type | `[Module.Free R M] [Module.Finite R M]` | the free case only, so §7.3 is needed |

No row needed a change.

## Unresolved

- **`gap:smooth-hkr-antisymmetrisation`.** This is the statement that `ε_n : Ω^n_{A/k} → HH_n(A/k)`
  is an isomorphism for every smooth commutative `A` over every commutative `k`. RefinedTraceMethods
  §1.9 at its head still does not provide it: it proves `π_n ε_n = n!` and that `ε₁` is an
  isomorphism, and makes `μ_n` a quasi-isomorphism only when `ℚ ⊆ k`. The gap is declared in the
  house form ("What RefinedTraceMethods must provide (gap:…)") under the supplier contract. It is
  used only by §6.4(d), and by §7.6 through it; the polynomial case (§8.4) avoids it.
- **The Lean declarations are not importable.** They stay invisible to importers because of the
  `module` header (see above). This does not affect the build or the gate.
- **Ownership against open pull requests: checked.** For the open roadmaps outside the sibling
  checkout list (EulerSystemsAndKolyvaginSystems, KTheoryFiniteLocalFields, LanglandsParameterStacks)
  I read them through `roadmaps show`.
- **Suspicious text.** I found none in the package, the reports or the other roadmaps read.


Pull request: #2447 (roadmap/hochschild-homology-and-hkr at 72a252e)
