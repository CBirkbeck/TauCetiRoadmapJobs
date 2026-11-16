# Roadmap: the quasi-Riemann hypothesis — a zero-free half-plane `Re s > 11/12` for Dirichlet and Hecke L-functions

**Summary.** This roadmap proves that every Dirichlet `L`-function, the Riemann zeta function
included, and every finite-order Hecke `L`-function of `F = ℚ(√−3)` has no zero in the half-plane
`Re s > 11/12`, the pole at `s = 1` of a character induced from the trivial one being allowed. The
argument is the first stage of the cubic-theta method of `openai2026quasiRH` (its Part I): a
smoothed average of cubic Gauss sums is bounded directly through the automorphy of Kubota's cubic
theta function and a quadratic large sieve, and is compared, after Poisson summation, with a Mellin
integral containing the reciprocal of the target `L`-function; zero detection and a sextic large
sieve control the remaining rows, and an abstract continuation principle turns the two estimates
into the half-plane. On the way the roadmap builds the general library the argument needs: zero-free
half-planes and the continuation principle for an abstract family of Euler products; power residue
symbols as ray class characters over any number field containing `μ_n`, reciprocity and Gauss sums
at composite moduli of `ℤ[ω]`; smooth Mellin and Fourier kernels; uniform analytic bounds and zero
detection for the finite-order Hecke `L`-functions of any number field; large sieves over number
fields (additive, quadratic and `n`-th order); Kubota's character, Eisenstein series with a
unitary character on `ℍ³` and their theta residues, with Patterson's cubic theta function of `ℚ(ω)`;
and the transfer of half-planes from the Hecke `L`-functions of an abelian field to all Dirichlet
`L`-functions. The end theorems are the `11/12` half-plane, the zero strip `1/12 ≤ Re ρ ≤ 11/12`
for primitive characters, the conditional bound `(log q)^(1/(1−θ))` for the least character value
different from `0` and `1` under a zero-free half-plane `Re s > θ`, and its instance: the least
quadratic nonresidue modulo an odd prime `p` is at most `C (log p)^12`, which proves Vinogradov's
conjecture `n(p) ≪_δ p^δ`.

Suggested home: `TauCeti/NumberTheory/QuasiRiemann/`, divided into `ZeroFree/`, `PowerResidue/`,
`GaussSum/`, `SmoothProfile/`, `HeckeAnalytic/`, `LargeSieve/`, `ZeroDetection/`, `Kubota/`,
`CubicReflection/`, `Probe/` and `Consequences/`. The roadmap's `Suggested.lean` states the
headline theorems against the pinned libraries; it is not the roadmap.

## Scope and ownership

**Status of the source.** The primary source `openai2026quasiRH` is an unrefereed, machine-written
preprint of 199 pages, dated 30 September 2026, in the authors' public repository at revision
`adc7f12`; its locators are those of that revision. It is restated here statement by statement in
this roadmap's own words, with exact locators; `liu2026improved` Part I (§§3–6) is a second,
human-written account of the same `11/12` argument and is cited beside it. A second proof of the
`11/12` half-plane, `openai2026quasiRHalt`, reaches the same statement by a mean square of
sextic-twisted Möbius sums (its Proposition 3.1 and Section 3); it uses Layers 2–4, 6 (§6.2) and 8
of this roadmap and none of Layers 7, 9 and 10. The route of `openai2026quasiRH` is the one
planned, because its later stage (the `7/8` half-plane) is built from Layers 1, 5, 7, 9 and 10.
No step of the planned route rests on a numerical or machine computation: every numerical
constant in Layer 10 is a closed-form rational inequality stated with the target that uses it.

### Owned here

- the germ-level predicate *zero-free right of `σ`*, the zero abscissa `β*` of a family, the
  continuation principle for an abstract family of Euler products and the late choice of height
  (Layer 1);
- the fixed-numerator theorem over every number field containing `μ_n`, the primary
  normalization `c ≡ 1 (mod 3)` of `ℤ[ω]` and its translation to Tau Ceti's, the sextic symbol at
  composite moduli, cubic reciprocity for coprime composite primary elements and its supplements
  (Layer 2);
- smooth norm profiles, their seminorms and separation norms, the Gaussian Mellin weight, finite
  seminorm bounds for Fourier and Mellin kernels, the self-dual normalization of `ℤ[ω]`, Poisson
  summation on its cosets and its ideal count (Layer 3);
- Gauss sums modulo ideals of a number field containing `μ_n` and their twisted
  multiplicativity, the prime Gauss identities of `ℤ[ω]`, the quadratic four-term formula, sextic
  reciprocity with its finite phase, the squarefree Gauss identities and finite Fourier expansions
  on ray class groups (Layer 4);
- deleted Euler factors, strip growth uniform in the conductor and logarithmic control in a
  zero-free disc for the finite-order Hecke `L`-functions of any number field, the norm-composed
  characters of an abelian field, the base-change factorization and the transfer of zero-free
  half-planes to Dirichlet `L`-functions (Layer 5);
- large sieves over number fields: the additive large sieve on a torus `ℝ^d/Λ`, the quadratic large
  sieve over a number field, the Fisher–Friedberg characters and the large sieve for `n`-th order
  characters, and its cubic and sextic residue-symbol forms over `ℤ[ω]` (Layer 6);
- zero detection for finite-order Hecke `L`-functions: buffered zero-free bins, pointwise dyadic
  bounds and two saturated witnesses (Layer 7);
- the Kubota character on congruence subgroups of `SL₂(𝓞_K)` for a totally imaginary `K ⊇ μ_n`,
  automorphic functions on `ℍ³` with a unitary character, their Eisenstein series, continuation
  and functional equations, the theta functions as residues, the Gauss-sum Dirichlet series of the
  Kubota Eisenstein coefficients, Patterson's converse theorem and the cubic theta function of
  `ℚ(ω)` with its expansions at three cusps (Layer 8);
- the completed cubic reflection and the unmarked reflected energy (Layer 9);
- the probe at `11/12` and the `11/12` half-plane (Layer 10);
- the zero strip, the conditional bound for least character values and the least quadratic
  nonresidue (Layer 11).

**Size of the two supplier blocks.** Layer 6 has five sections resting on three papers
(`goldmakherlouvel2013`, about 30 pages; `bgl2014` §§2–3 and Appendix II, about 12 pages;
`openai2026quasiRH` Lemmas 6.1 and 9.1, about 8 pages). Layer 8 has seven sections resting on
`kubota1969` §§1–3, 5–6 (about 50 pages), `kubota1968` (13 pages), `patterson1977` (38 pages) and
`dunnradziwill2024` §5 with Appendix A. Each is of the size of a roadmap of its own and uses no
later layer, so either can become a separate roadmap without changing a statement.

### Consumed, not redefined

- Dirichlet `L`-functions and their completions and functional equations: Mathlib
  `DirichletCharacter.LFunction`, `DirichletCharacter.completedLFunction`; the finite-order Hecke
  `L`-function of a presented ray class character, its primitive comparison and Euler correction:
  Tau Ceti `TauCeti.LFunctions.heckeLFunctionC`, `PrimitiveRayClassCharacter`,
  `RayClassCharacter.eulerCorrection`; their continuation, functional equation with root number of
  modulus one and nonvanishing on `Re s = 1`: [LFunctions](../LFunctions/README.md) Layers 4, 5
  and 7.
- Strip bounds, local zero counts, the Weil explicit formula for the two families and the prime
  ideal theorem: [ZerosOfLFunctions](../ZerosOfLFunctions/README.md) §§3.4, 4.4–4.5, 8.4–8.6.
- The `n`-th power residue symbol at primes and ideals, the Frobenius action on `n`-th roots, the
  general power reciprocity law with its Hilbert symbols, prime cubic reciprocity and the
  supplement at `1 − ω`: [ClassicalArithmeticCompletion](../ClassicalArithmeticCompletion/README.md)
  §§1.12, 1.23, 1.33, 1.34, 1.59, 1.72, 1.75, as Tau Ceti realizes them
  (`Ideal.powerResidueSymbol`, `Ideal.powerResidueSymbolIdeal`,
  `TauCeti.IsPrimaryEisenstein.cubic_reciprocity`).
- Global Artin reciprocity and ray class fields: [ClassFieldTheory](../ClassFieldTheory/README.md)
  Layers 11 and 13. Moduli, ray class groups and characters, conductors: Tau Ceti
  `TauCeti.GlobalNumberFields` ([GlobalNumberFields](../../Completed/GlobalNumberFields/README.md)
  Layers 2 and 9).
- Gauss sums over a finite ring: Mathlib `gaussSum`; Gauss and Jacobi sums at primes:
  CharacterSumsOverFiniteFields Layer 1.
- Poisson summation for a full-rank lattice: [ThetaSeries](../ThetaSeries/README.md) Layer 1 (1A).
- Bianchi groups, the hyperbolic quotient and cusps: BianchiModularForms §§0.3–0.4; the Laplacian
  on `ℍ³`: MaassForms §7.1; the `K`-Bessel function:
  [AutomorphicFormsOnReductiveGroups](../AutomorphicFormsOnReductiveGroups/README.md) §4.5;
  analytic Fredholm continuation: AutomorphicSpectralTheory §0.16.
- The least quadratic nonresidue `SieveApplications.leastNonresidue`:
  [SieveMethodsAndPrimePatterns](../SieveMethodsAndPrimePatterns/README.md) §2.9.
- Carathéodory's derivative inequality: [AnalyticNumberTheoryPartIII](../AnalyticNumberTheoryPartIII/README.md)
  §8.2.

### Not owned here

- The `7/8` half-plane, the compensated probe and its two moment inductions
  (`openai2026quasiRH` Sections 12–20), the local sums at prime powers and finite correlations
  (its Lemmas 13.2–13.4), masked primitive Poisson summation (its Lemma 17.5), the
  quadratic–cubic norm estimate (its Lemma 14.2), the strip `1/8 ≤ Re ρ ≤ 7/8` and the
  Landau–Siegel constant `(log 3)/8`: QuasiRiemannHypothesisPartII, which takes Layers 1–10 here
  as its base.
- Uniform exclusion of Landau–Siegel zeros with its own proof and constant:
  [AnalyticNumberTheoryPartI](../AnalyticNumberTheoryPartI/README.md) §0.34, which keeps its
  statement; §10.7 here implies a stronger bound and is not its supplier.
- The generalized Riemann hypothesis as a predicate: ZerosOfLFunctions Layer 9 and
  AnalyticNumberTheoryPartI §1.6.
- Large sieves over `ℚ`: SieveMethodsAndPrimePatterns §§2.2, 2.3, 2.7, 2.9 and
  AnalyticNumberTheoryPartII §5.29, which keep their statements; §§6.1–6.2 here are the
  number-field generalizations, and at `K = ℚ` §6.2 is implied by AnalyticNumberTheoryPartII §5.29.
- Theta functions and Eisenstein series on `(ℍ³)^r` for totally imaginary fields of degree `2r > 2`:
  their continuation is Langlands' general theory of Eisenstein series of Hilbert type, which no
  roadmap plans; this roadmap states the Kubota character for every totally imaginary `K ⊇ μ_n`
  and the analysis on `ℍ³` (imaginary quadratic `K`), which is all the cubic theta function needs.
- Consequences for the counting of primes (`ψ(x) − x ≪ x^(11/12+ε)`, power savings in ray classes
  and abelian Chebotarev over `F`, `N(σ, T, χ) = 0` for `σ > 11/12`): Part IIs of
  ExplicitPrimeCounting, AnalyticNumberTheoryPartIII and ZerosOfLFunctions (Downstream consumers).
- Deterministic square roots modulo `p`: the algorithmic clause of `openai2026quasiRH`
  Corollary 1.2 is background for §11.3, not a target.

## Conventions

- **The field.** `F` is a number field with `[IsCyclotomicExtension {3} ℚ F]`, `𝓞 = 𝓞 F = ℤ[ω]`
  with `ω` its primitive cube root of unity (`IsCyclotomicExtension.zeta_spec`), embedded in `ℂ` by
  the embedding `ι` with `ι ω = e^(2πi/3)`. Put `λ = 1 + 2ω = ω − ω²`, so `λ² = −3` and `(λ)` is the
  prime above `3` and the different of `𝓞`. For `a ∈ 𝓞` write `q_a = |a|² = N(a)` and, for
  `a ≠ 0`, `α(a) = a/|a|`; `q_𝔞` is also the norm of an ideal. `F` is totally complex, so every
  modulus of `F` has empty infinite part and a finite-order Hecke character of `F` is a ray class
  character `TauCeti.GlobalNumberFields.RayClassCharacter 𝔪` of some modulus.
- **Primary elements.** An element `c ∈ 𝓞` is *primary* when `c ≡ 1 (mod 3)`. Every ideal prime
  to `3` has exactly one primary generator, and primary elements form a multiplicative monoid.
  Tau Ceti's `TauCeti.IsPrimaryEisenstein` uses `c ≡ 2 (mod 3)`, which is not closed under
  products; `c` is primary exactly when `−c` satisfies `IsPrimaryEisenstein` (§2.3). Witness: the
  prime of norm `7` has primary generator `1 + 3ω` and `IsPrimaryEisenstein` associate `−1 − 3ω`.
  The two conventions give the same cubic symbol, and different quadratic and sextic symbols of
  the generator as a numerator: the sextic symbol of `−1` at that prime is `(−1)^((7−1)/6) = −1`.
- **Excluded primes.** `S` is a finite set of primes of `𝓞` containing `(2)` and `(λ)` and the
  primes of the defining moduli of the fixed characters of the statement at hand; a prime or ideal
  is *good* when it avoids `S`. Ideal sums run over good ideals, represented by primary generators.
- **Symbols.** For primary `c` prime to `6` the sextic symbol is `χ_c(a) = (a/c)_6`, Tau Ceti's
  `Ideal.powerResidueSymbolIdeal (span {c}) 6` at the class of `a`, read in `ℂ` through `ι`;
  `χ_1 = 1` identically, also at `a = 0`. Every power `χ_c^j`, `j ∈ ℤ`, means the usual power at
  `a` prime to `c` and `0` otherwise: `χ_c^6` is the indicator of `(a, c) = 1`, not the constant
  `1`. `χ_c²` is the cubic symbol `(·/c)_3` and `χ_c³` the quadratic symbol `(·/c)_2`.
  `χ_•(m)` denotes the function `𝔫 ↦ χ_n(m)` of the primary generator `n` of `𝔫`.
- **Additive character and measure.** `e(z) = exp(2πi Tr_{F/ℚ}(z/λ))`, which on `ℂ` is
  `exp(4πi Im z/√3)`; `ě(z) = exp(2πi(z + z̄)) = e(λz)` is the character of `dunnradziwill2024` and
  `patterson1977`. The measure `dμ = (2/√3) dx dy` makes `𝓞` self-dual for `(x, y) ↦ e(xy)`, with
  covolume `1` (§4.4). The Fourier transform on `ℂ` is `f̂(y) = ∫ f(x) e(−xy) dμ(x)`.
- **Gauss sums.** For primary squarefree `c` prime to `6` and `j ∈ ℤ`,
  `γ_j(c) = q_c^(−1/2) Σ_{x mod c} χ_c(x)^j e(x/c)`, with `γ_j(1) = 1`.
- **Zeros.** A function `f : ℂ → ℂ` has a zero at `ρ` when `0 < meromorphicOrderAt f ρ`; "no zero
  in `Re s > σ`, poles allowed" is §1.1's predicate. The value of a meromorphic function at a pole
  is junk and is never read: Tau Ceti's `heckeLFunctionC` is in normal form and is `0` when no
  continuation exists, so a value-based statement would be false at `s = 1` or vacuous.
- **Mellin and Fourier transforms.** `MW(s) = ∫₀^∞ W(y) y^s dy/y` is Mathlib's `mellin W s`;
  a norm twist `y^(iw)` translates it: `M[W(y) y^(iw)](s) = MW(s + iw)`.
- **Uniformity.** Uniformity is a quantifier order. "Independent of the target" means the number
  is chosen before the target character; implied constants and lower thresholds written `≪_η`
  may depend on the target and on its fixed arithmetic data (the presentations of the fixed
  characters, their moduli, `S`).
- **Smooth.** "Smooth" is `ContDiff ℝ ∞`; an *annular* function on `(0, ∞)^d` is smooth with support
  in a fixed compact subset of `(0, ∞)^d`.

## Exact supplier contracts

### From Mathlib

- `meromorphicOrderAt`, `meromorphicOrderAt_mul`, `meromorphicOrderAt_ne_top_iff` and
  `MeromorphicNFOn`: order is a germ invariant with values in `WithTop ℤ`, additive on products of
  meromorphic functions, `⊤` exactly on the germ of `0`. No regularity is read off a value.
- `riemannZeta`, `riemannZeta_ne_zero_of_one_le_re`; `DirichletCharacter.LFunction`,
  `DirichletCharacter.differentiableAt_LFunction` (analytic off `s = 1`, and at `1` for `χ ≠ 1`),
  `DirichletCharacter.LFunction_modOne_eq` (level one is `ζ`), `DirichletCharacter.LFunction_changeLevel`
  (imprimitive versus primitive, with the finite Euler correction),
  `DirichletCharacter.LFunction_ne_zero_of_one_le_re`, `DirichletCharacter.LFunction_apply_one_ne_zero`,
  `DirichletCharacter.LFunction_eq_zero_iff_of_re_nonpos` (the trivial zeros of a primitive
  character), `DirichletCharacter.completedLFunction`, `DirichletCharacter.gammaFactor` and
  `DirichletCharacter.IsPrimitive.completedLFunction_one_sub` (the functional equation
  `Λ(1 − s, χ) = ε(χ) Λ(s, χ⁻¹)`).
- `mellin`, `mellinInv`, `mellinInv_mellin_eq` (Mellin inversion under `MellinConvergent`).
- `gaussSum` over a finite commutative ring with `gaussSum_mulShift` and
  `gaussSum_mul_gaussSum_eq_card` (over a finite field).
- `Complex.borelCaratheodory`; `Complex.HadamardThreeLines.norm_le_interp_of_mem_verticalClosedStrip'`
  (Hadamard's three-lines theorem, which gives the three-circles inequality through the exponential
  map).
- Kummer theory `autAdjoinRootXPowSubCEquiv` (`FieldTheory/KummerExtension.lean`): for `μ_n ⊆ K`
  the Galois group of `X^n − a` embeds in `μ_n`; `AlgHom.IsArithFrobAt`.
- `IsCyclotomicExtension.zeta_spec`, `Ideal.absNorm`, `UniqueFactorizationMonoid.normalizedFactors`,
  `jacobiSym`, `ZLattice.covolume`, `SchwartzMap`, `Real.fourierIntegral`.

### From Tau Ceti

- `TauCeti.LFunctions.heckeLFunctionC` (the canonical continuation of the series of a ray class
  character at its presentation modulus, `0` if none exists, in meromorphic normal form),
  `TauCeti.LFunctions.heckeLFunctionC_eventuallyEq_primitive` (the presented function has the
  germ of the primitive one times the Euler correction at every point),
  `TauCeti.LFunctions.PrimitiveRayClassCharacter` with `.of`, `.conductor`, `.character`;
  `TauCeti.GlobalNumberFields.RayClassCharacter.eulerCorrection` with
  `differentiable_eulerCorrection` and `eulerCorrection_ne_zero` (no zero on `Re s > 0`).
  The continuation itself is a theorem of LFunctions Layer 5, not of the pin.
- `TauCeti.GlobalNumberFields.Modulus`, `RayClassGroup`, `RayClassCharacter`
  (`RayClassGroup 𝔪 →* ℂˣ`), `idealClass`, `RayClassCharacter.conductor`,
  `RayClassCharacter.toMultiplicativeIdealWeight`; orthogonality on ray class groups
  `TauCeti.LFunctions.sum_smul_rayClassCoeff` (`LFunctions/Hecke/Orthogonality.lean`).
- `Ideal.powerResidueSymbol` (prime symbol, trivial by convention when `N P` is not prime to `n`),
  `Ideal.powerResidueSymbolIdeal` (the product over the prime factors, `0` exactly on classes not
  prime to the ideal), `Ideal.powerResidueSymbolIdeal_mul_right`, `Ideal.powerResidueSymbolIdeal_neg`.
- `TauCeti.IsPrimaryEisenstein` (`c ≡ 2 mod 3`),
  `TauCeti.IsPrimaryEisenstein.cubic_reciprocity` (primary primes of different norms) and
  `TauCeti.IsPrimaryEisenstein.cubic_reciprocity_intCast`,
  `Ideal.gaussSum_powerResidueSymbol_three_pow_three_eq` (`g³ = N π · π` at a primary prime).
- `TauCeti.meromorphicContinuation` and `TauCeti.eventuallyEq_of_meromorphic_of_eqOn_halfPlane`.

### From TauCetiRoadmap.LFunctions

Layer 4 (Dirichlet `L`-functions and the quadratic factorization `ζ_K = ζ · L(·, χ_K)` with its
three readings: on `Re s > 1`, as germs, and pointwise away from `1`), Layer 5 (continuation of
`heckeLFunctionC` to a meromorphic function on `ℂ`, entire for a nontrivial primitive character,
the completed function with root number of modulus one and the functional equation
`Λ(χ, s) = W(χ) Λ(χ⁻¹, 1 − s)`), Layer 7 (nonvanishing of `heckeLFunctionC ψ.character` on
`Re s = 1` for primitive `ψ`).

### From TauCetiRoadmap.ZerosOfLFunctions

§3.4 (strip bound for the pole-cleared continued `L`-function in terms of the analytic conductor,
with constants depending on the degree only), §§4.4–4.5 (zeros in unit windows
`≪ log(N𝔣 (|T| + 2))` and the counting functions, uniformly in the conductor), §§8.4 and 8.6 (the
Weil explicit formula for primitive finite-order Hecke characters of any number field, test class
`ContDiff ℝ ∞` with compact support in `(0, ∞)`, zero side summable).

### From TauCetiRoadmap.ClassicalArithmeticCompletion

§1.12 (primary Eisenstein integers, `≡ 2 mod 3`), §1.23 and §1.33 (the symbol at primes and at
ideals prime to `n`), §1.34 (an arithmetic Frobenius acts on `n`-th roots by the symbol), §1.59
(the general power reciprocity law `(a/b)_n (b/a)_n⁻¹ = ∏_{v | n∞} (a, b)_v` for pairwise coprime
`(a)`, `(b)`, `(n)`), §1.72 (cubic reciprocity at primes), §1.75 (Eisenstein's supplement at
`1 − ω`).

### From TauCetiRoadmap.ClassFieldTheory

Layer 11 (global Artin reciprocity: the Artin map of a finite abelian extension factors through
the ray class group of an admissible modulus) and §13.1, as Tau Ceti realizes them (`TauCeti.ClassFieldTheory.rayClassField`,
`TauCeti.ClassFieldTheory.isAdmissibleModulus_iff_le_rayClassField`,
`TauCeti.ClassFieldTheory.IsAdmissibleModulus.mem_support_of_ramified`: a prime in the conductor
ramifies; `TauCeti.ClassFieldTheory.kroneckerWeber`).

### From TauCetiRoadmap.ThetaSeries

Layer 1 (1A): for a full-rank lattice `L` in a finite-dimensional real inner product space, a
Schwartz `f` and a shift `v`, `∑_ℓ f(v + ℓ) = covolume(L)⁻¹ ∑_{m ∈ L^∨} 𝓕f(m) e(⟨v, m⟩)`, with
Mathlib's sign convention.

### From TauCetiRoadmap.CharacterSumsOverFiniteFields

Layer 1 (§§1.1–1.2, 1.4–1.5): Gauss sums over a finite field, `|g(χ)| = √q`, `g(χ)g(χ⁻¹) = χ(−1)q`,
the quadratic and cubic cases; Layer 2 (Jacobi sums, `g(χ)g(ψ) = J(χ, ψ) g(χψ)`).

### From TauCetiRoadmap.BianchiModularForms, MaassForms and AutomorphicFormsOnReductiveGroups

BianchiModularForms §0.3 (discreteness and finite covolume of groups commensurable with
`SL₂(𝓞_K)` acting on `ℍ³` by `(5.1)` of `dunnradziwill2024`) and §0.4 (cusps as `Γ`-orbits on
`ℙ¹(K)`, cusp stabilizers as extensions of a finite group by a rank-two translation lattice).
MaassForms §7.1 (the Laplacian `Δ₃ = −v²(∂_x² + ∂_y² + ∂_v²) + v ∂_v` on `ℍ³`, invariant under
`SL₂(ℂ)`, symmetric for `v⁻³ dx dy dv`, with `Δ₃ v^s = s(2 − s) v^s`).
AutomorphicFormsOnReductiveGroups §4.5 (the `K`-Bessel function `K_ν`, its differential equation
and exponential decay).

### From TauCetiRoadmap.AutomorphicSpectralTheory

§0.15 (weak and strong meromorphic operator families) and §0.16 (analytic Fredholm continuation),
used as functional analysis in §8.4.

### From TauCetiRoadmap.SieveMethodsAndPrimePatterns

§2.9 `SieveApplications.leastNonresidue p`: the least `n ≥ 1` with `jacobiSym n p = −1` for an odd
prime `p`, and `0` otherwise.

### From TauCetiRoadmap.AnalyticNumberTheoryPartIII

§8.2 (Carathéodory's coefficient inequality and its derivative form), used in §5.3.

## How to read the build

Layer 1 is pure complex analysis and fixes what a zero-free half-plane is and how two estimates
for one average continue a reciprocal across the rightmost zeros. Layers 2–4 are the arithmetic
and harmonic-analytic substrate: symbols at composite moduli of `ℤ[ω]` and their general forms
over fields containing `μ_n` (Layer 2), smooth Mellin and Fourier kernels and the self-dual lattice
`ℤ[ω]` (Layer 3), and Gauss sums modulo ideals with the sextic reciprocity phase (Layer 4, which
uses Poisson summation from Layer 3). Layer 5 supplies the uniform analytic bounds for Hecke
`L`-functions and the transfer from an abelian field to Dirichlet `L`-functions. Layers 6 (large
sieves) and 8 (Kubota's character and theta functions) are self-contained supplier blocks: each
needs only Layers 2–4 and the Hecke functional equation of LFunctions Layer 5, and neither needs
Layers 7 or 9–11. Layer 7 detects zeros of Hecke `L`-functions by large values
of short Dirichlet polynomials and needs Layers 3 and 5. Layer 9 transforms the completed sum of cubic
Gauss coefficients by the cubic theta function and bounds its mean square; it needs Layers 3, 4, 6
and 8. Layer 10 assembles the probe at `11/12`: the direct estimate (Layers 6 and 9), the Poisson
representation with its Euler factors (Layers 3–5), the row count (Layers 6–7) and the contour
estimates, and closes with the `11/12` half-plane through Layer 1 and the transfer of Layer 5.
Layer 11 draws the consequences.

## Layer 1: zero-free half-planes and the continuation principle

### 1.1 Zero-free half-planes

Define *zeroFreeRightOf* `σ f`, for `σ : ℝ` and `f : ℂ → ℂ`, to mean that
`meromorphicOrderAt f s ≤ 0` for every `s` with `σ < Re s`: `f` has no zero there, and poles are
allowed. This is the reading of "no zero in `Re s > σ`, the principal pole allowed" of
`openai2026quasiRH` Theorem 1.1 (p. 4) and of its supremum (2.1) (p. 8).

- For `σ ≤ σ'`, *zeroFreeRightOf* `σ f` implies *zeroFreeRightOf* `σ' f`.
- The predicate depends only on punctured germs: if `f` and `g` agree on a punctured
  neighbourhood of every `s` with `σ < Re s`, then *zeroFreeRightOf* `σ f` holds exactly when
  *zeroFreeRightOf* `σ g` does.
- If `f` is meromorphic at every point of `Re s > σ` and `D` is analytic and nonzero at every such
  point, then `f · D` is zero-free right of `σ` exactly when `f` is; if `f` and `g` are meromorphic
  there and both zero-free right of `σ`, so is `f · g` (`meromorphicOrderAt_mul`).
- At a point where `f` is analytic, `meromorphicOrderAt f s ≤ 0` holds exactly when `f s ≠ 0`.
- For a Dirichlet character `χ` of level `N ≥ 1`, *zeroFreeRightOf* `σ (DirichletCharacter.LFunction χ)`
  holds exactly when every `s` with `σ < Re s` has `LFunction χ s ≠ 0` or `χ = 1 ∧ s = 1`
  (`DirichletCharacter.differentiableAt_LFunction` off the pole, order `−1` at it).
- For a ray class character `χ` of a modulus `𝔪` of a number field and `σ ≥ 0`,
  *zeroFreeRightOf* `σ (heckeLFunctionC χ)` holds exactly when it holds for
  `heckeLFunctionC (PrimitiveRayClassCharacter.of χ).character`, by the germ comparison
  `heckeLFunctionC_eventuallyEq_primitive` and `eulerCorrection_ne_zero` on `Re s > 0`.

**Checks.**

- `s ↦ s − 2` is zero-free right of `2` and not right of `3/2`: its order at `2` is `1`.
- The zero function is zero-free right of no `σ`, its order being `⊤` everywhere; a statement about
  `heckeLFunctionC`, which is `0` when no continuation exists, is therefore never satisfied
  vacuously.
- `s ↦ 1/(s − 1)` is zero-free right of every `σ`: its order at `1` is `−1`, so a principal pole
  is allowed.
- The function equal to `s − 2` off `s = 2` and to `1` at `s = 2` has a nonzero value at `2` and
  order `1` there: it is not zero-free right of `3/2`, while a definition through values would
  accept it.
- `riemannZeta` is zero-free right of `1`: `riemannZeta_ne_zero_of_one_le_re` off `s = 1`, and
  order `−1` at `s = 1`, where Mathlib's value is junk.

### 1.2 The zero abscissa of a family

For a family `L : ι → ℂ → ℂ` define *zeroAbscissa* `L` as the supremum of `1/2` and of the real
parts of the points `ρ` with `1/2 ≤ Re ρ` and `0 < meromorphicOrderAt (L η) ρ` for some `η`
(`openai2026quasiRH` (2.1), p. 8; `liu2026improved` (1.2)). For the family of primitive finite-order
Hecke `L`-functions of `F` it is the number `β*` of the source.

- If every `L η` is zero-free right of `1`, then `1/2 ≤ zeroAbscissa L ≤ 1`.
- Under the same hypothesis, for every `σ ≥ 1/2`: `zeroAbscissa L ≤ σ` holds exactly when every
  `L η` is zero-free right of `σ`.
- Under the same hypothesis, if `zeroAbscissa L > 1/2` then for every `ε > 0` there are `η` and a
  zero `ρ` of `L η` with `zeroAbscissa L − ε < Re ρ ≤ zeroAbscissa L`.
- Replacing each `L η` by `L η · D_η`, with `L η` meromorphic and `D_η` analytic and nonzero on
  `Re s > 0`, does not change the zero abscissa.

**Checks.**

- The empty family has zero abscissa `1/2`.
- The family `{s ↦ s − 3/4}` has zero abscissa `3/4`; the family `{s ↦ s − 1/4}` has `1/2`,
  since a zero left of `1/2` is not counted.
- The family `{s ↦ s − 3/4, s ↦ 1/(s − 1)}` has zero abscissa `3/4`: the pole at `1` is not a zero.
- A family containing the zero function has an unbounded set of real parts, and Mathlib's `sSup`
  returns its junk value `0` there; the hypothesis "zero-free right of `1`" in every statement
  above excludes it. The family `{s ↦ s − 2}` violates that hypothesis and has zero abscissa
  `2 ∉ [1/2, 1]`.

*Needs:* §1.1; Mathlib `sSup`, `meromorphicOrderAt`.

### 1.3 The continuation principle

Let `L : ι → ℂ → ℂ` be a family with every `L η` meromorphic on `Re s > 1/2` and analytic and
nonvanishing on `Re s > 1`; put `β* = zeroAbscissa L`. Fix `σ₀ ∈ (1/2, 1)` and a real `c`, and put
`C(s) = s + c`. Prove that if `σ₀ < β*`, there are no numbers `ω` and `σ` with
`0 < ω < β* − σ₀` and `σ > 0` together with, for every `η`, the following data: a function `D_η`
analytic and nonvanishing on `Re s > 0` (the deleted Euler factors) with `1/(L_η D_η)` bounded on
`Re s ≥ 2`; a function `H_η` holomorphic on `Re s > σ₀` with `|H_η(s) − 1| ≤ 1/2` there; and a
function `J_η` of a real variable such that, for `Z` beyond a threshold depending on `η`,
`|J_η(Z)| ≤ A_η Z^(C(σ₀)+ω)` and `|J_η(Z) − f_η(Z)| ≤ B_η Z^(C(β*)−σ)`, where

```text
f_η(Z) = (2πi)⁻¹ ∫_{Re s = 2} Z^(C(s)) e^((s − 5/6)²) H_η(s) / (L_η(s) D_η(s)) ds.
```

The numbers `ω`, `σ` are independent of `η`; `A_η`, `B_η`, the threshold, `D_η` and `H_η` may
depend on `η`. Equivalently: whenever such data exist, `β* ≤ σ₀`
(`openai2026quasiRH` Proposition 2.1, p. 8; `liu2026improved` Proposition 3.1).

Route: put `E* = min(β* − σ₀ − ω, σ)`, so `|f_η(Z)| ≪_η Z^(C(β*)−E*)` for large `Z`; moving the
line to `Re s = B` gives `|f_η(Z)| ≪_{η,B} Z^(B+c)` for `0 < Z ≤ 1`; the Mellin transform
`F_η(s) = ∫₀^∞ f_η(Z) Z^(−C(s)) dZ/Z` is holomorphic on `Re s > β* − E*`; Fourier inversion on
`Re s = 2` and the identity theorem give `F_η(s) = e^((s−5/6)²) H_η(s)/(L_η D_η)(s)` on `Re s > 1`;
since `|H_η| ≥ 1/2`, `e^(−(s−5/6)²) F_η/H_η` continues `1/(L_η D_η)` holomorphically to
`Re s > β* − E* > σ₀`, which excludes zeros of every `L_η` there; the third bullet of §1.2 supplies
a zero with real part above `β* − E*`.

*Needs:* §§1.1–1.2; Mathlib `mellin`, `mellinInv_mellin_eq`, `Complex.exp`; the identity theorem
for analytic functions; the residue-free contour shift on `2 ≤ Re s ≤ B`
(Tau Ceti's rectangle integrals, as consumed by ZerosOfLFunctions Layer 7).

### 1.4 The late choice of height

Fix `σ₀ ∈ (1/2, 1)`, `β* > σ₀`, `C(s) = s + c`, numbers `m > 0` and `0 < ω < β* − σ₀`, and
`d_min > 0`, all independent of the target `η`. Suppose that for every target there are functions
`J_η`, `f_η` with `|J_η(Z)| ≪_η Z^(C(σ₀)+ω)`, numbers `A_η ≥ 0`, `B_η` and `τ_{0,η} > 0` such
that for every integer `N ≥ 0` and every `τ ∈ (0, min(d_min/100, τ_{0,η})]` there are `K` and a
threshold, both allowed to depend on `η, N, τ`, with

```text
|J_η(Z) − f_η(Z)| ≤ K (Z^(C(β*)−m) (1 + Z^τ)^(A_η) + Z^(B_η − N τ))   for Z beyond the threshold.
```

Prove that `|J_η(Z) − f_η(Z)| ≪_η Z^(C(β*)−m/2)`: choose `τ` with `A_η τ ≤ m/4` and then `N` with
`B_η − Nτ < C(β*) − m/2` (`openai2026quasiRH` Lemma 11.1, p. 82). With §1.3 the saving `m/2` has
the required quantifier order.

*Needs:* nothing beyond real arithmetic.

### Examples

- The two instances of §1.3 are `(σ₀, C) = (11/12, s − 2/3)` with `C(σ₀) = 1/4` (§10.7) and
  `(7/8, s − 11/16)` with `C(σ₀) = 3/16` (the `7/8` stage).
- `riemannZeta` is zero-free right of `1`, and no `σ < 1` is known to Mathlib; §10.7 gives
  `σ = 11/12`.
- The Gaussian factor of §1.3 has `|e^((2 + it − 5/6)²)| = e^((7/6)² − t²)`, integrable in `t`.

### Dependencies

Mathlib `meromorphicOrderAt`, `meromorphicOrderAt_mul`, `mellin`, `mellinInv_mellin_eq`,
`riemannZeta_ne_zero_of_one_le_re`, `DirichletCharacter.differentiableAt_LFunction`; Tau Ceti
`heckeLFunctionC_eventuallyEq_primitive`, `eulerCorrection_ne_zero`.

## Layer 2: power residue symbols as ray class characters, and primary elements of `ℤ[ω]`

### 2.1 The fixed-numerator theorem

Let `K` be a number field with `μ_n ⊆ 𝓞 K` and `ι : K → ℂ` an embedding. For a nonzero `a ∈ 𝓞 K`,
prove that there are a modulus `𝔪` of `K`, whose finite part is divisible only by primes dividing
`n a` and whose infinite part is empty when `n ≥ 3`, and a character
`ψ_a : TauCeti.GlobalNumberFields.RayClassCharacter 𝔪` with
`ψ_a(idealClass 𝔟) = ι((a/𝔟)_n)` for every nonzero integral ideal `𝔟` prime to `n a`, the symbol
being `Ideal.powerResidueSymbolIdeal 𝔟 n` at the class of `a`. No bound on the exponents of `𝔪` is
asserted, and the identification says nothing at ideals meeting `n a`, where the symbol is `0`
(`openai2026quasiRH` Lemma 4.1, p. 11, for `n = 6` and `K = F`; `milnecft2020` Chapter VIII, 5.3
and 5.5, p. 245).

Route: `L = K(a^(1/n))` is the splitting field of `X^n − a`, abelian over `K` with
`Gal(L/K) ↪ μ_n` (Mathlib's Kummer theory), unramified outside `n a` (the discriminant of
`X^n − a` divides `n^n a^(n−1)`). At a prime `𝔭 ∤ n a` an arithmetic Frobenius acts on `a^(1/n)` by
`(a/𝔭)_n` (ClassicalArithmeticCompletion §1.34); the Artin map is multiplicative; global Artin
reciprocity factors it through the ray class group of an admissible modulus, and every prime of
that modulus ramifies in `L` (ClassFieldTheory Layer 11, §13.1). A field containing `μ_n` with
`n ≥ 3` has no real place.

- For nonzero `a, b`: `ψ_(ab) = ψ_a ψ_b` and `ψ_(a c^n) = ψ_a` on ideals prime to `n a b c`.
- `ψ_a` is trivial when `a` is an `n`-th power in `𝓞 K`.

**Checks.**

- `K = ℚ`, `n = 2`, `a = −1`: `ψ` is the character `p ↦ (−1)^((p−1)/2)` of conductor `4∞`; the
  real place is needed, so the clause "empty infinite part" is stated for `n ≥ 3` only.
- `K = ℚ`, `n = 2`, `a = 5`: `ψ(3) = (5/3) = −1 = (3/5)`; the conductor is `5`, prime to `2`
  although `2 ∣ n a`, so the finite part divides a power of `10` without being equal to it.
- `K = F`, `n = 6`, `a = −1`: at the prime of norm `7` the value is `(−1)^((7−1)/6) = −1`, at a
  prime of norm `13` it is `+1`; the prime `(2)` of norm `4` divides `n` and is excluded.
- `a = b^n`: the character is trivial on ideals prime to `n b`; at `𝔟 ∣ b` the symbol is `0`,
  which is not a character value, which is why the identification is restricted.

*Needs:* Tau Ceti `Ideal.powerResidueSymbolIdeal`, `Ideal.powerResidueSymbolIdeal_mul_right`;
ClassicalArithmeticCompletion §§1.33, 1.34; ClassFieldTheory Layer 11 and §13.1
(`TauCeti.ClassFieldTheory.isAdmissibleModulus_iff_le_rayClassField`,
`TauCeti.ClassFieldTheory.IsAdmissibleModulus.mem_support_of_ramified`);
Mathlib `autAdjoinRootXPowSubCEquiv`, `AlgHom.IsArithFrobAt`.

### 2.2 Primary elements of `ℤ[ω]`

Define *IsPrimary* `c` for `c ∈ 𝓞` by `3 ∣ c − 1` (Conventions; `openai2026quasiRH` §4.1, p. 10;
`dunnradziwill2024` (1.4)).

- `c` is primary exactly when `−c` satisfies `TauCeti.IsPrimaryEisenstein`.
- `1` is primary and products of primary elements are primary.
- `a + bω` with `a, b ∈ ℤ` is primary exactly when `a ≡ 1` and `b ≡ 0 (mod 3)`.
- Every element prime to `λ` has exactly one primary unit multiple, so every ideal prime to `3`
  has exactly one primary generator (Tau Ceti's `existsUnique_isPrimaryEisenstein_unit_mul`,
  transported by negation); a primary element has norm `≡ 1 (mod 3)`.

**Checks.**

- `1`, `−2` (norm `4`, the inert prime above `2`) and `1 + 3ω` (norm `7`) are primary; `−1 − 3ω`
  satisfies `IsPrimaryEisenstein` and is not primary.
- Of the six units only `1` is primary: their residues modulo `3` are the six units of `𝓞/3`.
- Tau Ceti's convention is not multiplicative: `−1` satisfies `IsPrimaryEisenstein` while
  `(−1)(−1) = 1` does not; the convention here is.
- `λ = 1 + 2ω` has no primary unit multiple, since `λ ∣ 3`: the hypothesis "prime to `λ`" cannot
  be dropped.

*Needs:* Tau Ceti `TauCeti.IsPrimaryEisenstein`, `IsPrimitiveRoot.existsUnique_isPrimaryEisenstein_unit_mul`,
`IsPrimitiveRoot.isPrimaryEisenstein_add_mul_iff`; ClassicalArithmeticCompletion §§1.12, 1.38.

### 2.3 The sextic symbol at composite moduli

Define the sextic symbol `χ_c(a)` for primary `c` prime to `6` as in Conventions, through
`Ideal.powerResidueSymbolIdeal (span {c}) 6` and `ι`, with the zero extension on nonunits and
`χ_1 = 1` (`openai2026quasiRH` §4.1, p. 11).

- `χ_c(ab) = χ_c(a) χ_c(b)` and `χ_(cd)(a) = χ_c(a) χ_d(a)`; `χ_c(a)` depends on `a mod c` and
  vanishes exactly when `(a, c) ≠ 1`.
- At a primary prime `p`, `χ_p(a)` is the sixth root of unity congruent to `a^((q_p−1)/6)` modulo
  `p`; in particular `χ_p(ζ) = ζ^((q_p−1)/6)` for a sixth root of unity `ζ`.
- `χ_c²` is the cubic symbol `(·/c)_3` and `χ_c³` the quadratic symbol `(·/c)_2`
  (`Ideal.powerResidueSymbol_pow_div` at each prime factor).
- `χ_c` depends only on the ideal `(c)`.

**Checks.**

- At `p = 1 + 3ω` (`q_p = 7`): `𝓞/p ≅ 𝔽₇` with `ω ↦ 2`, so `χ_p(2) = ω` and `χ_p(3) = −ω²`, and
  `χ_p(−1) = −1`.
- `χ_p^6(7) = 0` since `p ∣ 7`, whereas `χ_p^6(2) = 1`: the sixth power is the coprimality
  indicator, not the constant `1`.
- `χ_(p²)(a) = χ_p(a)²`, so `χ_(p²)³ = 1` on units: the quadratic symbol at `p²` detects no
  residues, as for the Jacobi symbol.
- `χ_1(0) = 1`: the empty product, also at `a = 0`.

*Needs:* §2.2; Tau Ceti `Ideal.powerResidueSymbolIdeal`, `Ideal.powerResidueSymbol_pow_div`,
`Ideal.mk_powerResidueSymbol`, `Ideal.powerResidueSymbol_mk_of_pow_eq_one`.

### 2.4 Finite families of fixed-numerator characters over `ℚ(ω)`

Fix `S` and a generator `π_𝔭` of each `𝔭 ∈ S`. Prove that, on primary good `A`, the functions
`A ↦ χ_A(u ∏_{𝔭 ∈ S} π_𝔭^(v_𝔭))` for units `u` and exponents `v_𝔭 ≥ 0` depend only on `u` and the
residues `v_𝔭 mod 6`, number at most `6^(|S|+1)`, and are ray class characters (through §2.1)
with one common modulus supported on `S` (`openai2026quasiRH` Lemma 4.1, second assertion, p. 11).
A numerator containing a moving good prime is not in this family.

*Needs:* §§2.1, 2.3.

### 2.5 Cubic reciprocity at composite moduli and its supplements

Prove that `(a/b)_3 = (b/a)_3` for coprime primary `a, b ∈ 𝓞` prime to `3`, the symbols being
`Ideal.powerResidueSymbolIdeal` at the ideals `(b)` and `(a)` with `n = 3`
(`dunnradziwill2024` (1.4); ClassicalArithmeticCompletion §1.72 at primes). Route: both sides are
multiplicative, so reduce to primary primes `π₁ ≠ π₂`; for different norms apply
`TauCeti.IsPrimaryEisenstein.cubic_reciprocity` to `−π₁`, `−π₂`, `−1` being a cube; for conjugate
primes of one split norm put `t = π + π̄ ∈ ℤ`, prime to `3`, so `π̄ ≡ t (mod π)` and `π ≡ −π̄ (mod t)`,
and `cubic_reciprocity_intCast` with Galois conjugation (`map_powerResidueSymbolIdeal`) shows that
`(π/t)_3` is real, hence `1`, and both symbols equal `1`.

Prove the supplements (`dunnradziwill2024` (1.5); ClassicalArithmeticCompletion §1.75): if
`d ≡ 1 + α₂λ² + α₃λ³ (mod 9)` with `α₂, α₃ ∈ {−1, 0, 1}`, then `(ω/d)_3 = ω^(α₂)` and
`(λ/d)_3 = ω^(−α₃)`; and, for primary `c` prime to `2`, `χ_c(4) = (2/c)_3 = (c/(−2))_3`, a function
of `c mod 2` (`openai2026quasiRH` proof of Lemma 4.4, p. 16).

**Checks.**

- `d = 1 + 3ω`: `d ≡ 1 − λ² + λ³ (mod 9)` (`λ² = −3`, `λ³ = −3 − 6ω`), so `(ω/d)_3 = ω^(−1) = ω²`,
  which is `ω^((7−1)/3)` by Euler's criterion.
- `c = 1 + 3ω`: `c ≡ 1 + ω = −ω² (mod 2)` and `(ω²/(2))_3 = ω^(2·(4−1)/3) = ω²`, so
  `χ_c(4) = ω²`; directly `2^((7−1)/3) = 4 ≡ ω² (mod c)`.
- Conjugate pair `π = −2 + 3ω`, `π̄` (norm `19`): `t = π + π̄ = −7` and `(π̄/π)_3 = (−7/π)_3 = 1`, the
  case not covered by the prime statement of the pin.

*Needs:* §2.2; Tau Ceti `IsPrimaryEisenstein.cubic_reciprocity`,
`IsPrimaryEisenstein.cubic_reciprocity_intCast`, `map_powerResidueSymbolIdeal`;
ClassicalArithmeticCompletion §§1.72, 1.75.

### Examples

- `χ_p` at `p = 1 + 3ω`: values `1, ω, ω², −1, −ω, −ω²` at the residues `1, 2, 4, 6, 5, 3` of `𝔽₇`.
- The fixed-numerator character `𝔟 ↦ (2/𝔟)_3` of `F` is `𝔟 ↦ (c/(−2))_3` on primary generators
  `c`: a function of `c mod 2`, hence, through the primary normalization, a ray class character
  of modulus supported on `{(2), (λ)}`; its value at `(1 + 3ω)` is `ω²`.

### Dependencies

Mathlib Kummer theory and `IsArithFrobAt`; Tau Ceti power residue symbols, `IsPrimaryEisenstein`,
prime cubic reciprocity, ray class characters; ClassicalArithmeticCompletion §§1.12, 1.33, 1.34,
1.38, 1.72, 1.75; ClassFieldTheory Layer 11 and §13.1.

## Layer 3: smooth profiles, Mellin and Fourier kernels, and the lattice `ℤ[ω]`

### 3.1 Smooth norm profiles

Fix `d ≥ 1` and a compact `Ω ⊂ ℝ^d`. A *profile* is a function `w` on `(0, ∞)^d` whose logarithmic
form `w_log(u) = w(e^(u₁), …, e^(u_d))` is smooth with support in `Ω`. Define its seminorms
`p_j(w) = Σ_{|α| ≤ j} sup |∂^α w_log|`, its logarithmic Fourier transform
`ŵ(t) = ∫_{ℝ^d} w_log(u) e^(−i t·u) du`, and its *separation norm*
`‖w‖_{J,sep} = (2π)^(−d) ∫ |ŵ(t)| (1 + |t|)^J dt`; for a finite tuple `w = (w₁, …, w_r)` put
`p(w) = 1 + Σ p(w_i)` (`openai2026quasiRH` §4.3, p. 17).

- Monomial separation: `w(x₁, …, x_d) = (2π)^(−d) ∫ ŵ(t) ∏_j x_j^(i t_j) dt`, so a norm monomial in
  several variables is written as an integral of products of pure twists, with coefficient
  measure common to every row.
- A norm twist translates the transform: for `w'(x) = x^(iτ) w(x)` (`d = 1`), `ŵ'(t) = ŵ(t − τ)` and
  `‖w'‖_{J,sep} ≤ (1 + |τ|)^J ‖w‖_{J,sep}`.
- Rescaling `x ↦ e^k x` multiplies `ŵ` by the unit phase `e^(−ikt)` and leaves `‖·‖_{J,sep}`
  unchanged.

**Checks.**

- At `x = (1, …, 1)` monomial separation reads `w_log(0) = (2π)^(−d) ∫ ŵ`, Fourier inversion; a
  transform without the factor `(2π)^(−d)` is off by `(2π)^d`.
- The zero profile has every seminorm `0`, while `p(w) ≥ 1` for every tuple, so a bound
  `≪ p(w)^k` never collapses to `0`.
- The indicator of `[1, 2]` (`d = 1`) is not a profile: its transform decays only like `1/|t|`, and
  `‖·‖_{1,sep}` diverges.

### 3.2 Smooth calculus

Prove, for integers `J, N ≥ 0`: `‖w‖_{J,sep} ≪_{J,d,Ω} p_{J+d+2}(w)`; on a unit box `I ⊂ ℝ^d` and a
smooth `F` on `I + [−1, 1]^d`, `sup_I |F|² ≪_d Σ_{α ∈ {0,1}^d} ∫_{I+[−1,1]^d} |∂^α F|²`; the tail
bound `∫_{|t| > T₁} |ŵ(t)| (1 + |t|)^J dt ≤ T₁^(−N) ‖w‖_{J+N,sep}` for `T₁ ≥ 1`; the pointwise Mellin
bound `|MW(σ + iT)| ≪_{I,N} (1 + |T|)^(−N) Σ_{j ≤ N} ∫₀^∞ y^σ |(y∂_y)^j W(y)| dy/y` uniformly for
`σ` in a compact `I` and `T ∈ ℝ`, whenever the integrals converge and the boundary terms of `N`
logarithmic integrations by parts vanish (annular `W`, or `W` smooth at `0` and Schwartz at `∞`
with `I ⊂ (0, ∞)`); and the joint bound for a Gaussian in the sum of two heights against two
rapidly decreasing Mellin transforms (`openai2026quasiRH` Lemma 4.5 and (4.9)–(4.12), pp. 17–19).

*Needs:* §3.1; Mathlib `mellin`, integration by parts, the Fourier transform on `ℝ^d`.

### 3.3 The Gaussian Mellin weight

Define `W_G(y) = (2√π)⁻¹ exp(−(log y)²/4)` on `(0, ∞)` (`openai2026quasiRH` Lemma 4.6, p. 19).

- `MW_G(s) = e^(s²)` for every `s ∈ ℂ`.
- For a fixed smooth compactly supported `χ` with `Σ_{k ∈ ℤ} χ(u − k) = 1`, the pieces
  `w_k(x) = W_G(e^k x) χ(log x)` have one fixed compact logarithmic support and
  `Σ_k e^(A|k|) p_j(w_k) < ∞` for every `A ≥ 0` and `j ≥ 0`.
- For fixed `κ > 0`, `A, B, C₀ ≥ 0` and `M > 0`, the part of this decomposition with
  `|k| > κ log Z − C₀`, weighted by `Z^B e^(A|k|)`, is `O(Z^(−M))`.

**Checks.**

- `MW_G(0) = 1`: the total mass `(2√π)⁻¹ ∫ e^(−u²/4) du` is `1`; `MW_G(1) = e`.
- The variant `exp(−(log y)²)` has Mellin transform `√π e^(s²/4)`: the normalization is pinned by
  the value `1` at `s = 0` and the exponent `s²`.
- `W_G` is not annular (it is positive on all of `(0, ∞)`), which is why the decomposition is
  needed before §3.2 applies.

### 3.4 Finite seminorms for Fourier and Mellin kernels

For a Schwartz `f` on `ℝ^d` put `s_j(f) = Σ_{|α|,|β| ≤ j} ‖x^α ∂^β f‖_{L¹}`. Prove
`sup (1 + |ξ|)^A |∂^β f̂(ξ)| ≪_{A,β,d} s_{⌈A⌉+|β|}(f)`, for every fixed nondegenerate linear Fourier
pairing and for radial transforms. For `m` holomorphic on a closed vertical strip with
`|m(σ + it)| ≤ C (1 + |t|)^h` and `K_W(x) = (2πi)⁻¹ ∫_{(σ)} MW(−s) m(s) x^(−s) ds`, prove
`|(x∂_x)^j K_W(x)| ≪ x^(−σ) ∫ |MW(−σ − it)| (1 + |t|)^(h+j) dt`, with an extra factor
`(1 + |w|)^(h+j)` for `W(y) y^(iw)` (`openai2026quasiRH` Lemma 4.7, p. 20).

*Needs:* §§3.1–3.2; Mathlib `SchwartzMap`, `Real.fourierIntegral`, `mellin`.

### 3.5 The self-dual lattice `ℤ[ω]`, Poisson summation on cosets and the ideal count

Prove: `e(z) = exp(4πi Im z/√3)` for `z ∈ ℂ`; the dual of `𝓞` for the pairing `(x, y) ↦ e(xy)` is
`𝓞`, and `𝓞` has covolume `1` for `dμ = (2/√3) dx dy`. For a Schwartz `f` on `ℂ`, nonzero `b ∈ 𝓞`
and `v ∈ 𝓞`, `Σ_{x ∈ v + b𝓞} f(x) = q_b⁻¹ Σ_{y ∈ b⁻¹𝓞} f̂(y) e(vy)`, the specialization of
ThetaSeries Layer 1 (1A) to `L = b𝓞`, `L^∨ = b⁻¹𝓞`. The number of nonzero ideals of norm at most
`H` is `πH/(3√3) + O(√H + 1)` for `H ≥ 0` (`openai2026quasiRH` §4.1, p. 11).

**Checks.**

- `e(1) = e(ω) = 1`, while `e(ω/2) = e^(πi) = −1`: `1/2 ∉ 𝓞^∨`.
- The parallelogram spanned by `1, ω` has area `√3/2`, and `(2/√3)(√3/2) = 1`.
- `H = 3`: the ideals `(1)` and `(λ)`, two against `π/√3 ≈ 1.81`; the constant `π/(3√3)` is the
  residue of `ζ_F` at `1` (`2π h/(w √3)` with `h = 1`, `w = 6`).

### Examples

- `MW_G(1/2 + it) = e^(1/4 − t² + it)`, of modulus `e^(1/4 − t²)`.
- Poisson at `b = 2`, `v = 1`: the coset `1 + 2𝓞` and the dual `(1/2)𝓞`, with factor `q_2⁻¹ = 1/4`.

### Dependencies

Mathlib `mellin`, `SchwartzMap`, `Real.fourierIntegral`, `ZLattice.covolume`; ThetaSeries Layer 1.

## Layer 4: Gauss sums modulo ideals and the sextic reciprocity phase

### 4.1 Gauss sums modulo an ideal

Let `K ⊇ μ_n` with embedding `ι` and different `𝔡`. For a nonzero ideal `𝔠` prime to `n`, `j ∈ ℤ`
and `y ∈ 𝔠⁻¹𝔡⁻¹`, define the additive character `ψ_y(x) = exp(2πi Tr_{K/ℚ}(xy))` of `𝓞/𝔠` and the
Gauss sum `g_j(𝔠, y) = gaussSum (ι ∘ ((·/𝔠)_n)^j) ψ_y`, the power of the multiplicative character
`Ideal.powerResidueSymbolIdeal 𝔠 n` being zero on nonunits (Mathlib's `MulChar` convention, also
for `j ≡ 0`). Over `ℤ[ω]` with `n = 6` and primary squarefree `c` prime to `6`,
`γ_j(c) = q_c^(−1/2) g_j((c), 1/(cλ))` is the normalized sum of Conventions, since
`ψ_(1/(cλ))(x) = e(x/c)` (`openai2026quasiRH` §4.1, p. 11).

- `ψ_y` depends only on `x mod 𝔠` because `Tr(𝔠 · 𝔠⁻¹𝔡⁻¹) ⊆ ℤ`; it is primitive when `y𝔠𝔡` is prime
  to `𝔠`.
- `g_j(𝔠, ay) = ι((a/𝔠)_n)^(−j) g_j(𝔠, y)` for `a` prime to `𝔠` (`gaussSum_mulShift`).
- `g_j(𝓞, y) = 1`: the residue ring has one element, a unit, where the character is `1`.
- At a prime `𝔭` with `ψ_y` primitive: `|g_j(𝔭, y)| = √N𝔭` for `j ≢ 0 (mod n)` and
  `g_j(𝔭, y) = −1` for `j ≡ 0`.
- `conj g_j(𝔠, y) = ι((−1/𝔠)_n)^j g_(−j)(𝔠, y)`.

**Checks.**

- `K = ℚ`, `n = 2`, `𝔠 = (5)`, `y = 1/5`: `g_1 = √5`, the value of CharacterSumsOverFiniteFields
  §1.4 and of LFunctions Layer 5.
- `p = 1 + 3ω`: `γ_6(p) = −1/√7`, not of modulus one; reading `χ_p^6` as the constant `1` would give
  `Σ_x e(x/p) = 0` instead.
- `p = 1 + 3ω`: `γ_3(p)² = χ_p(−1) = −1`, so `γ_3(p) = ±i`; §4.4 pins `γ_3(p) = i`.

### 4.2 Twisted multiplicativity

For coprime `a, b ∈ 𝓞_K` with `(a)`, `(b)` prime to `n`, `j ∈ ℤ` and `h ∈ 𝔡⁻¹`, prove
`g_j((ab), h/(ab)) = ι((b/a)_n^j (a/b)_n^j) g_j((a), h/a) g_j((b), h/b)`: write `x = bu + av` with
`u mod a`, `v mod b` (Chinese remainder theorem). Over `ℤ[ω]`:
`γ_j(ab) = (χ_a(b) χ_b(a))^j γ_j(a) γ_j(b)` (`openai2026quasiRH` proof of Lemma 4.4, p. 16).

**Checks.**

- `K = ℚ`, `n = 2`, `a = 3`, `b = 5`: `(3/5)(5/3) = 1` and `g(15) = g(3) g(5) = i√3 · √5 = i√15`.
- `j = 0`: Ramanujan sums, `g_0(p) g_0(q) = 1 = g_0(pq)` for distinct primes.
- `a = 1`: both sides are `g_j((b), h/b)`.

### 4.3 The prime Gauss identities of `ℤ[ω]`

For a good primary prime `p`, with `H = χ_p` and `P = q_p`, prove `γ_2(p)³ = −α(p)`,
`γ_1(p) γ_2(p) = H̄(4) γ_3(p) γ_2(p)³` (`H̄(4)` the complex conjugate of `H(4)`) and `|γ_j(p)| = 1`
for `j ≢ 0 (mod 6)`
(`openai2026quasiRH` Lemma 4.2, p. 13). Route: the first is
`Ideal.gaussSum_powerResidueSymbol_three_pow_three_eq` (`g³ = N π · π` for the
`IsPrimaryEisenstein` prime `π = −p` and any primitive additive character), normalized; the second
is the Gauss–Jacobi relation `g(A) g(B) = J(A, B) g(AB)` with `J(H, H³) = H(4) J(H, H)`
(CharacterSumsOverFiniteFields Layer 2) and `g(H²) g(H⁴) = P`, which give
`γ_1 = H(4)⁻¹ γ_2² γ_3`.

**Checks.**

- `p = 1 + 3ω`: `γ_2(p)³ = −(1 + 3ω)/√7`, and `7^(3/2) γ_2(p)³ = −7(1 + 3ω) = 7 · (−1 − 3ω)`, Tau
  Ceti's `N π · π` for `π = −1 − 3ω`.
- `γ_2(c)³` equals `g̃(c)³ = μ(c) c/|c|` of `dunnradziwill2024` (1.8): `γ_2(c) = χ_c(λ)² g̃(c)` and
  `χ_c(λ)^6 = 1`.
- `j = 6`: `|γ_6(p)| = 1/√7`, so the restriction `j ≢ 0` is needed.
- The conjugate is forced: at `p = 1 + 3ω`, `χ_p(4) = ω²` and `γ_3(p) = i`, and
  `γ_1(p) γ_2(p) = −α(p) · ω · i ≈ −0.6547 + 0.7559i`, while `−α(p) · ω² · i ≈ −0.3273 − 0.9449i`; at
  `p = −2 + 3ω` (norm `19`, where `2` is a non-residue) the same comparison separates `χ̄_p(4)` from
  `χ_p(2)`.

### 4.4 The quadratic four-term formula

For nonzero `c ∈ 𝓞` prime to `2` define `Γ(c) = |c|⁻¹ Σ_{x mod c} e(x²/c)`. Prove
`Γ(c) = ½ Σ_{y mod 2} e(−cy²/4)`, explicitly `Γ(a + bω) = (1 + i^(−b) + i^a + i^(b−a))/2`; hence `Γ`
depends on `c mod 4`, `Γ(cv²) = Γ(c)` for `v` prime to `2`, `|Γ| = 1`, and on the square-class
representatives `1, −1, λ, −λ` of `(𝓞/4)ˣ/{1, ω, ω²}` it takes the values `1, 1, i, −i`. The
quotient `τ(a, b) = Γ(ab)/(Γ(a)Γ(b))` is a symmetric `{±1}`-valued bicharacter of the square-class
group with `τ((−1)^e λ^f, (−1)^g λ^h) = (−1)^(eh + fg + fh)` (`openai2026quasiRH` Lemma 4.3, p. 14).
Route: Poisson summation on `𝓞` (§3.5) for the Gaussian-damped phase `e(z²/c) e^(−πε|z|²)` and
`ε → 0`.

**Checks.**

- `Γ(1) = 1`; `Γ(λ) = |λ|⁻¹ (1 + 2e(1/λ²)) = (1 + 2ω)/√3 = i`, agreeing with the four-term value
  `(1 + i^(−2) + i + i)/2 = i`.
- `τ(λ, λ) = Γ(−3)/Γ(λ)² = 1/(−1) = −1`; `τ(−1, λ) = Γ(−λ)/(Γ(−1)Γ(λ)) = −i/i = −1`; `τ(−1, −1) = 1`.
- `Γ(1 + 3ω) = (1 + i^(−3) + i + i²)/2 = i`, so `γ_3(1 + 3ω) = i` by §4.5.

### 4.5 Sextic reciprocity and the finite reciprocity phase

For primary `a, b` outside `S` define `R(a, b) = τ(a, b)` (on noncoprime pairs too, by the
bicharacter), and for primary `c` outside `S` define `G(c) = χ̄_c(4) Γ(c)`, with `χ̄_c(4)` the complex
conjugate of the multiplicative extension `χ_c(4)` for nonsquarefree `c`. Prove (`openai2026quasiRH` Lemma 4.4, (4.5)–(4.8),
pp. 15–16):

- sextic reciprocity: `χ_b(a) = R(a, b) χ_a(b)` for coprime primary `a, b` outside `S`;
- `|G| = 1`, `G` factors through the ray class group modulo `12`, `G(1) = 1` and
  `G(vw) = G(v) G(w) R(v, w)`; `G(v²) = χ_v(4)` (`χ̄_v(4)² = χ_v(4)`, its order dividing `3`); at good primes `R(p, p) = γ_3(p)² = χ_p(−1)`, and
  the diagonal `n ↦ R(n, n) = χ_n(−1)` is a ray class character;
- the squarefree Gauss identities: for squarefree primary `c` outside `S`,
  `γ_2(c)³ = μ(c) α(c)`, `γ_1(c) γ_2(c) = μ(c) α(c) G(c)`, `G(c) = χ̄_c(4) γ_3(c)`, `|G(c)| = 1`;
- the zero-preserving identity: writing `0 ≠ m = u ∏_{𝔭 ∈ S} π_𝔭^(v_𝔭) m_good` with `m_good` primary,
  `χ_A(m) = χ_A(u ∏ π_𝔭^(v_𝔭)) R(A, m_good) ∏_{p ∣ m_good} χ_p(A)^(v_p(m))` for every primary good `A`,
  both sides vanishing when `(A, m_good) ≠ 1`.

Route: `Γ(c) = γ_3(c)` for squarefree `c` by counting square roots in residue fields and the
Chinese remainder theorem; twisted multiplicativity (§4.2) at `j = 3` gives
`Γ(pq)/(Γ(p)Γ(q)) = (χ_p(q) χ_q(p))³`, so the quadratic part of sextic reciprocity is `τ`; cubic
reciprocity (§2.5) gives the cubic part; induction on the number of prime factors with §4.3.

**Checks.**

- `a = 1 + 3ω` (norm `7`), `b = −2 + 3ω` (norm `19`): `𝓞/b ≅ 𝔽₁₉` with `ω ↦ 7`, `a ≡ 3` and
  `χ_b(a) = 3³ = 8 ≡ −ω²`; `𝓞/a ≅ 𝔽₇` with `ω ↦ 2`, `b ≡ 4` and `χ_a(b) = ω²`; so
  `χ_b(a)/χ_a(b) = −1`. Both lie in the square class of `λ` modulo `4`, and `τ(λ, λ) = −1`.
- The cubic part agrees: `χ_b(a)² = ω = χ_a(b)²`; the quadratic part is `(−1)(1) = −1`.
- `p = 1 + 3ω`: `R(p, p) = γ_3(p)² = i² = −1 = χ_p(−1)`, and `G(p) = χ̄_p(4) Γ(p) = ω i`; at
  `p = 4 + 3ω` (norm `13`), `Γ(p) = γ_3(p) = 1` and `R(p, p) = 1 = χ_p(−1)`.

### 4.6 Finite Fourier expansions on ray class groups

For a finite abelian group `T` and `Φ : T → ℂ`, prove `Φ = Σ_{θ ∈ T̂} a_θ θ` with
`a_θ = |T|⁻¹ Σ_t Φ(t) θ̄(t)` and `Σ |a_θ| ≤ |T|^(1/2) max |Φ|`; on `T × T` this separates `R(a, b)`
as a finite sum of products of characters, valid on noncoprime primary pairs because `R` is the
bicharacter there; and `χ_n(p) χ_p(n) = R(p, n) 1_{(n,p)=1}` for a good prime `p` and primary `n`
outside `S` (`openai2026quasiRH` §4.2, p. 17).

**Checks.**

- `T = ℤ/2`, `Φ` the indicator of `0`: `a_θ = 1/2` for both characters and `Σ |a_θ| = 1 ≤ √2`.
- `Φ` a character `θ₀`: `a_θ = 1` at `θ₀` and `0` elsewhere.
- `n = p`: `χ_p(p) χ_p(p) = 0` and `1_{(p,p)=1} = 0`, so the coprimality indicator cannot be dropped.

### Examples

- `γ_j(1 + 3ω)` for `j = 1, …, 5`: modulus `1`, with `γ_2³ = −(1 + 3ω)/√7`, `γ_3 = i` and
  `γ_1 γ_2 = −α(1 + 3ω) ω i`.
- The ray class group modulo `(12)` of `F`, which carries `G`, is `(𝓞/12)ˣ/𝓞ˣ` (class number
  one, the six units injecting modulo `3`), of order `|(𝓞/4)ˣ| · |(𝓞/λ²)ˣ|/6 = 12 · 6/6 = 12`.

### Dependencies

Mathlib `gaussSum`, `gaussSum_mulShift`, `gaussSum_mul_gaussSum_eq_card`; Tau Ceti
`Ideal.gaussSum_powerResidueSymbol_three_pow_three_eq`, `Ideal.powerResidueSymbolIdeal`;
CharacterSumsOverFiniteFields Layers 1–2; Layer 2 (§§2.3, 2.5); Layer 3 (§3.5); Tau Ceti
`TauCeti.LFunctions.sum_smul_rayClassCoeff` for orthogonality.

## Layer 5: analytic inputs for Hecke `L`-functions, and the transfer to Dirichlet `L`-functions

Throughout, `K` is a number field of degree `d`, `ψ` a primitive finite-order Hecke character of
`K` (`PrimitiveRayClassCharacter K`) of conductor norm `Q`, `L(s, ψ) = heckeLFunctionC ψ.character`,
and for the trivial character `ℒ(s) = (s − 1) ζ_K(s)/(s + 1)` with its removable value at `1` and
`Q = 1`; for nontrivial `ψ`, `ℒ = L(·, ψ)`.

### 5.1 Deleted Euler factors

For a squarefree integral ideal `𝔯` and complex `a_𝔭` with `|a_𝔭| ≤ 1` (`𝔭 ∣ 𝔯`) put
`D_𝔯(s) = ∏_{𝔭 ∣ 𝔯} (1 − a_𝔭 N𝔭^(−s))`. Prove: for fixed `σ₀ > 0` and `ε > 0`,
`|D_𝔯(s)| + |D_𝔯(s)|⁻¹ ≪_{K,σ₀,ε} N𝔯^ε` on `Re s ≥ σ₀`; for every real `σ`,
`|D_𝔯(σ + it)| ≪_ε N𝔯^((−σ)₊ + ε)` uniformly in `t`; and `|D_𝔯'/D_𝔯(s)| ≪_{σ₀} log(2N𝔯)` on
`Re s ≥ σ₀`. In particular a deletion of norm `N𝔯 ≤ Z^B`, `B` bounded, costs any prescribed
positive power of `Z` on a fixed half-plane `Re s ≥ σ₀ > 0` (`openai2026quasiRH` Lemma 4.10,
p. 23). With `a_𝔭 = χ(𝔭)` this bounds Tau Ceti's `RayClassCharacter.eulerCorrection`.

*Needs:* the bound `ω(𝔯) ≪ log N𝔯/log log N𝔯` for the number of prime factors; Tau Ceti
`eulerCorrection_ne_zero`.

### 5.2 Strip growth uniform in the conductor

Prove `|ℒ(σ + it)| ≪_K (Q (3 + |t|)^d)^(3/5)` for `−1/10 ≤ σ ≤ 11/10` and all `t`, the constant
depending on `K` only (`openai2026quasiRH` Lemma 4.8, p. 21, for `K = F`, where it is stated with the
weaker factor `Q^(3/5) (3 + |t|)²`). Route: ZerosOfLFunctions §3.4 with `δ = 1/10`, whose exponent
`(1/2 + δ)(1 + δ − σ)/(1 + 2δ)` is at most `3/5` on `σ ≥ −1/10`, the analytic conductor of the Hecke
record being `≍_K Q (3 + |t|)^d`, and the clearing polynomial `X − 1` for the trivial character.

*Needs:* ZerosOfLFunctions §3.4; LFunctions Layer 5 (the Hecke records `heckeData`).

### 5.3 Logarithmic control in a zero-free disc

Fix `a ∈ [1/2, 1]` and `0 < ε < 10⁻³`. If `ℒ` has no zero in the open disc of radius `2 − a − 2ε`
about `2 + it`, prove that on the closed disc of radius `2 − a − 6ε` about the same centre,
`|ℒ(s)| + |ℒ(s)|⁻¹ ≪_{K,ε,ε₁} (2Q(3 + |t|)^d)^(ε₁)` for every `ε₁ > 0`, and that on the disc of radius
`2 − a − 8ε`, `|ℒ'/ℒ(s)| ≪_{K,ε} log(2Q(3 + |t|))`. In particular, for `b` at least the zero
abscissa of the primitive finite-order Hecke family of `K` and `ν > 0`, these bounds hold on
`Re s ≥ b + ν` with constants depending on `ν` and `ε₁`; in the principal case the reciprocal bound
passes to `1/ζ_K`, because `|(s − 1)/(s + 1)| ≤ 1` on `Re s ≥ 0` (`openai2026quasiRH` Lemma 4.9,
p. 22, for `K = F`). Route: a holomorphic logarithm `g` of `ℒ` on the zero-free disc, normalized
by the Euler logarithm at the centre; `Re g ≪ log C` from §5.2 and the Euler product right of
`11/10`; Borel–Carathéodory between two radii; Hadamard's three-circles inequality against the
disc of radius `49/100`, where the Euler logarithm is bounded; `exp(C (log C)^θ) ≪_ε C^ε` for
`θ < 1`; Cauchy's estimate for `g'`.

*Needs:* §5.2; Mathlib `Complex.borelCaratheodory`,
`Complex.HadamardThreeLines.norm_le_interp_of_mem_verticalClosedStrip'`; AnalyticNumberTheoryPartIII
§8.2; Layer 1 (§1.2) for the abscissa.

### 5.4 Norm-composed characters and the base-change factorization

Let `K` be abelian over `ℚ`, with group `X(K)` of the primitive Dirichlet characters attached to
`K` by Kronecker–Weber (`[K : ℚ]` of them), and let `χ` be a Dirichlet character modulo `q`.
Define the *norm-composed character* `χ ∘ N_{K/ℚ}`: the ray class character of `K` modulo
`q𝓞_K` times all real places of `K` whose value on an ideal `𝔞` prime to `q` is `χ(N𝔞)`.

- At a prime `𝔭 ∤ q` of residue degree `f` over `p`, the value is `χ(p)^f`.
- `χ₁ ∘ N · χ₂ ∘ N = (χ₁χ₂) ∘ N`, and `1 ∘ N` is the trivial character of that modulus.
- For `K` totally complex the modulus has no infinite part, `N_{F/ℚ}` being positive on `F^×`.

**Checks.**

- `K = F`, `χ` the character modulo `7` of order `3` with `χ(3) = ω`: at the split prime
  `(1 + 3ω)` of norm `7` the value is `χ(7) = 0` (excluded, `7 ∣ q`); at the inert prime `(2)` of norm `4`
  it is `χ(2)² = χ(4)`.
- `K = ℚ(i)`, `χ` modulo `5` with `χ(2) = i`: at the prime `(1 + i)` of norm `2` the value is
  `χ(2) = i`, and at the inert prime `(3)` of norm `9` it is `χ(3)² = χ(9) = χ(4) = −1`.
- `K = ℚ(√2)` (real), `χ` odd: `N(1 + √2) = −1` and `χ(−1) = −1`, so the real places are needed in the
  modulus for `χ ∘ N` to be a ray class character.

Prove the base-change factorization: with `S` the primes dividing `q d_K`,
`L^S_K(s, χ ∘ N) = ∏_{ψ ∈ X(K)} L^S(s, χψ)` on `Re s > 1`, as germs at every point, and pointwise
away from `s = 1`, the superscript deleting the Euler factors at `S` on both sides. Route: at an
unramified `p` with residue degree `f` and `g = [K : ℚ]/f` primes above it, `ψ(p)` runs over the
`f`-th roots of unity, each `g` times, so `∏_ψ (1 − χ(p)ψ(p) p^(−s)) = (1 − χ(p)^f p^(−fs))^g`; then
uniqueness of meromorphic continuation (`TauCeti.eventuallyEq_of_meromorphic_of_eqOn_halfPlane`)
(`openai2026quasiRH` (11.2), p. 85, for `K = F`: `L^S_F(s, χ ∘ N) = L^S(s, χ) L^S(s, χχ₋₃)`).

*Needs:* ClassFieldTheory §13.1 (`TauCeti.ClassFieldTheory.kroneckerWeber`) and the splitting of unramified primes in
cyclotomic fields (LFunctions Layer 4, cyclotomic factorization with level characters); Tau Ceti
`TauCeti.GlobalNumberFields.RayClassCharacter`, `heckeLFunctionC`; Mathlib `DirichletCharacter.LFunction`.

### 5.5 The transfer of zero-free half-planes

Let `K` be abelian over `ℚ` and `σ₀ ∈ [1/2, 1)`. Suppose `heckeLFunctionC ψ.character` is zero-free
right of `σ₀` for every `ψ : PrimitiveRayClassCharacter K`. Prove: (a) `heckeLFunctionC χ` is zero-free
right of `σ₀` for every modulus `𝔪` and every `χ : RayClassCharacter 𝔪`; (b) for every `N ≥ 1` and
every `χ : DirichletCharacter ℂ N`, `DirichletCharacter.LFunction χ` is zero-free right of `σ₀`
(`openai2026quasiRH` Proposition 11.3, p. 84, for `K = F`). Route: (a) is §1.1. For (b), pass to the
primitive character (`DirichletCharacter.LFunction_changeLevel`; the deleted factors vanish only
on `Re s = 0`); at a point `ρ ≠ 1` with `Re ρ > σ₀` every factor of §5.4 is holomorphic, so a zero of
`L(s, χ)` is a zero of `L^S_K(s, χ ∘ N)`, excluded by (a); at `ρ = 1`, `L(1, χ) ≠ 0` for `χ ≠ 1`
(`DirichletCharacter.LFunction_apply_one_ne_zero`) and the trivial character has its pole. For a
non-abelian `K` the cofactor is an Artin `L`-function whose holomorphy is not known, which is why
`K` is abelian.

**Checks** (computed against the statement).

- `q = 1`, `K = F`: `ζ_F(s) = ζ(s) L(s, χ₋₃)`; the pole of `ζ` at `1` is not cancelled because
  `L(1, χ₋₃) = π/(3√3) ≠ 0` (the class number formula with `h = 1`, `w = 6`, `|d| = 3`); only
  `L(1, χ) ≠ 0` enters the proof.
- `χ = χ₋₃`, `K = F`: the cofactor `χχ₋₃` is the principal character modulo `3`, with a pole at `1`;
  a zero of `L(s, χ₋₃)` at `1` would be cancelled, and `L(1, χ₋₃) ≠ 0` excludes it.
- `σ₀ = 1` is excluded from the hypothesis range: the statement for `σ₀ = 1` is Mathlib's
  `DirichletCharacter.LFunction_ne_zero_of_one_le_re`, with `Re s ≥ 1`.

### Examples

- For `F` the norm-composed characters of the Dirichlet characters modulo `q` are ray class
  characters modulo `q𝓞`, and the transfer gives every Dirichlet `L`-function from the Hecke family
  of `F` alone.
- §5.2 at `K = F`, `d = 2`: `|L(σ + it, ψ)| ≪ Q^(3/5) (3 + |t|)^(6/5)` on `−1/10 ≤ σ ≤ 11/10`.

### Dependencies

ZerosOfLFunctions §3.4; LFunctions Layers 4–5; ClassFieldTheory §13.1; AnalyticNumberTheoryPartIII
§8.2; Mathlib Borel–Carathéodory and three-lines; Tau Ceti Hecke `L`-functions and Euler
corrections; Layer 1.

## Layer 6: large sieves over number fields

### 6.1 The additive large sieve on a torus

Let `Λ ⊂ ℝ^d` be a full-rank lattice, `B` a nondegenerate real bilinear pairing with dual lattice
`Λ^∨ = {y : B(Λ, y) ⊆ ℤ}`, `0 < δ ≤ 1`, `Q ≥ 1`, and `z₁, …, z_J ∈ ℝ^d/Λ` with
`min_{n ∈ Λ} |z_j − z_k − n| ≥ δ` for `j ≠ k`. Prove, for complex `a_j`,
`Σ_{m ∈ Λ^∨, |m| ≤ Q} |Σ_j a_j e^(2πi B(m, z_j))|² ≪_{Λ,B,d} (Q^d + δ^(−d)) Σ_j |a_j|²`; a fixed multiple of
`Q` changes only the constant (`openai2026quasiRH` Lemma 6.1, p. 47, for `ℂ/𝓞` with `e(xy)`, where
`q_m ≤ Q` is `|m| ≤ √Q`; `baierbansal2018` §3, Theorem 3, for `ℤ[i]`). Route: a nonnegative
Schwartz majorant `F ≥ 1` on the unit ball whose Fourier transform is supported in a fixed ball
(the square of the transform of a smooth bump of small support), Poisson summation (ThetaSeries
Layer 1), and the count of `δ`-separated lifts in a ball.

**Checks.**

- `J = 1`, `a₁ = 1`: the left side is the number of dual points in the ball, `≍ Q^d`, so the term
  `Q^d` is needed.
- `d = 1`, `Λ = ℤ`, `z_j = j/N` (`δ = 1/N`), `a_j = 1`, `Q < N`: only `m = 0` survives and the left
  side is `N² = N · N`, so the term `δ^(−d)` is needed.
- `J = 0`: both sides are `0`.

### 6.2 Hecke families and the quadratic large sieve over a number field

Let `k` be a number field containing `μ_n` and `𝔠` an integral ideal. Define an *`n`-th order Hecke
family with respect to `𝔠`*: primitive Hecke characters `χ_𝔞` of trivial infinite type indexed by
the squarefree integral ideals `𝔞` prime to `𝔠`, of order dividing `n`, with a finite group `G`, a
homomorphism `[·]` from the ideals prime to `𝔠` to `G` and a map `C : G × G → μ_n` such that
`χ_𝔞(𝔟) = χ_𝔟(𝔞) C([𝔞], [𝔟])` for coprime `𝔞, 𝔟`, and such that `χ_𝔞 χ_𝔟` is primitive modulo `𝔞𝔟`
whenever `𝔞, 𝔟` are coprime with `[𝔞] = [𝔟]` (`goldmakherlouvel2013` Definition 1, p. 1).

- For `d ∣ n` with `d > 1`, `{χ_𝔞^(n/d)}` is a `d`-th order Hecke family.
- The Fisher–Friedberg characters of §6.3 form an `n`-th order Hecke family.
- Over `ℤ[ω]`, the quadratic residue symbols `𝔞 ↦ χ_a(·)³` read at primary generators, extended to
  their primitive inducing characters (conductor `a` or `λa`), form a quadratic Hecke family with
  `G` the square classes modulo `4` and `C = R` of §4.5 (`openai2026quasiRH` §5.4, p. 36).

**Checks.**

- `k = ℚ`, `n = 2`, `𝔠 = (4)`: `χ_a = (a/·)` for odd squarefree `a > 0`, with `G = (ℤ/4)ˣ` and `C`
  the sign `(−1)^((a−1)(b−1)/4)`; for `a = 3`, `b = 7` (one class) `χ₃χ₇ = (21/·)` is primitive
  modulo `21`, while for `a = 3`, `b = 5` (two classes) `(15/·)` has conductor `60`, which is why
  primitivity is required only within a class.
- The trivial family `χ_𝔞 = 1` fails the primitivity axiom at `𝔞 ≠ 𝔟` in one class.
- Over `ℤ[ω]`, `χ_p³` for `p = 1 + 3ω` has `χ_p(−1)³ = −1`, so its primitive inducing character is odd
  at `λ` and the conductor is `λp`, not `p`.

Prove the quadratic large sieve: for a quadratic Hecke family with respect to `𝔠`, `ε > 0`, `M, N ≥ 1`
and complex `λ_𝔟`, `Σ*_{N𝔞 ≤ M} |Σ*_{N𝔟 ≤ N} λ_𝔟 χ_𝔟(𝔞)|² ≪_{k,𝔠,ε} (MN)^ε (M + N) Σ*_{N𝔟 ≤ N} |λ_𝔟|²`,
`Σ*` over squarefree ideals prime to `𝔠`; and for an `n`-th order family with `n ≥ 3` even the same
bound for `χ_𝔟^(n/2)` (`goldmakherlouvel2013` Theorem 1.1 and Corollary 1.2, p. 2). Over `ℤ[ω]`:
`Σ_{a sf, q_a ≤ U} |Σ_{b sf, q_b ≤ V} c_b χ_a(b)³|² ≪_ε (UV)^ε (U + V) Σ |c_b|²` on squarefree primary
good indices (`openai2026quasiRH` (5.26)). At `k = ℚ` this is implied by AnalyticNumberTheoryPartII
§5.29.

*Needs:* Layers 2 and 4 (the reciprocity law of the family); LFunctions Layer 5 (the functional
equation with root numbers, for the Poisson–Voronoi step of `goldmakherlouvel2013` §3); Layer 3
(§3.5) and ThetaSeries Layer 1.

### 6.3 The Fisher–Friedberg characters

Let `K ⊇ μ_n` with `n ≥ 3`. Fix a finite set `S` of finite places containing those above `n` with
`𝓞_S` of class number one, an ideal `𝔠 = ∏_{𝔭 ∈ S} 𝔭^(e_𝔭)` with `e_𝔭` large enough that
`ord_𝔭(a − 1) ≥ e_𝔭` makes `a` an `n`-th power in `K_𝔭`, a set `ℰ` of ideals prime to `S`
representing `R_𝔠 = H_𝔠 ⊗ ℤ/n` built from chosen generators with chosen `m_E ∈ K^×` generating `E` as
`𝓞_S`-ideals, `m_(1) = 1`. For coprime ideals `𝔞, 𝔟` prime to `S` write `𝔞 = (x) E 𝔤^n` with
`x ≡ 1 (mod 𝔠)`, `E ∈ ℰ`, `(𝔤, 𝔟) = 1`, and define `χ_𝔞(𝔟) = (x m_E/𝔟)_n`; `χ_𝔞` is then replaced by
its primitive inducing character (`bgl2014` Appendix II, p. 20, and §2; `goldmakherlouvel2013` §2).

- `χ_𝔞` is well defined, a primitive `n`-th order Hecke character of trivial infinite type, and
  `χ_𝔞 = (a/·)_n` on ideals prime to `𝔠𝔞` when `𝔞 = (a)` with `a ≡ 1 (mod 𝔠)`.
- `χ_𝔞 χ_𝔟 = χ_𝔞𝔟` if `𝔞𝔟` is `n`-th power free, and `χ_(𝔞𝔟^n) = χ_𝔞`; for `𝔞 = 𝔞₁𝔞₂^n` with `𝔞₁`
  `n`-th power free the conductor lies between `𝔞₀` and `𝔠𝔞₀`, `𝔞₀` the squarefree kernel of `𝔞₁`;
  `χ_𝔞(𝔟) χ_𝔟(𝔞)⁻¹` depends only on `[𝔞], [𝔟] ∈ R_𝔠` (`bgl2014` Lemma 2.1, p. 6).
- For squarefree `𝔞`, every prime of `𝔞` divides the conductor, so `χ_𝔞(𝔟) = 0` when `𝔟` meets `𝔞`.

**Checks.**

- `K = F`, `n = 3`, `S = {(λ)}`, `𝔠 = (9) = (λ)⁴`: cubing maps the units `≡ 1 (mod λ²)` of `F_λ` onto
  those `≡ 1 (mod λ⁴)`, so `e_λ = 4` suffices. For `𝔞 = (10)` (`10 ≡ 1 (mod 9)`, squarefree, prime to
  `λ`) and `𝔟 = (1 + 3ω)`: `χ_(10)(𝔟) = (10/𝔟)_3 ≡ 10² ≡ 2 ≡ ω (mod 𝔟)`, so the value is `ω`.
- `𝔞 = 𝔟^n` gives the trivial character: the primitive character inducing `(x m_E/·)_n` on such
  a power is `1`.
- A choice of a different set `ℰ` changes `χ_𝔞` by a character depending only on `[𝔞]`; the large
  sieve of §6.4 is insensitive to this.

### 6.4 The large sieve for `n`-th order characters

For `n ≥ 3`, the Fisher–Friedberg characters of §6.3, `M, N ≥ 1/2`, complex `λ_𝔟` and `ε > 0`, prove
`Σ*_{N𝔞 ≤ M} |Σ*_{N𝔟 ≤ N} λ_𝔟 χ_𝔞(𝔟)|² ≪_{n,K,S,𝔠,ε} (MN)^ε (M + N + (MN)^(2/3)) Σ*_{N𝔟 ≤ N} |λ_𝔟|²`,
`Σ*` over squarefree ideals prime to `S` (`bgl2014` Theorem 1.3, p. 4). Route: the norm recursion
of `bgl2014` §3 (Lemmas 3.1–3.5), with the Poisson–Voronoi formula `bgl2014` Lemma 2.2 for
`χ_𝔟₁^j χ̄_𝔟₂^j` (Lemma 2.3: primitive of conductor `𝔟₁𝔟₂` in a common class), and §6.2 for the even
powers `χ^(n/2)`.

*Needs:* §§6.2–6.3; LFunctions Layer 5 (functional equation and root numbers of primitive finite-order
characters); Layer 3 (§§3.2, 3.5).

### 6.5 Residue-symbol forms over `ℤ[ω]`: the cubic and sextic large sieves

Prove, for complex `c_n` on squarefree primary indices and `ε > 0`:

- the cubic large sieve `Σ*_{q_m ≤ M} |Σ*_{q_n ≤ N} c_n (n/m)_3|² ≪_ε (M + N + (MN)^(2/3)) (MN)^ε Σ* |c_n|²`,
  `Σ*` over squarefree elements of `ℤ[ω]` congruent to `1 (mod 3)` (`heathbrown2000` Theorem 2, p. 3);
- the sextic large sieve `Σ_{k sf, q_k ≤ K} |Σ_{n sf, q_n ≤ D} c_n χ_n(k)^s|² ≪_{S,ε} (KD)^ε (K + D + (KD)^(2/3)) Σ |c_n|²`
  for `s ∈ {−1, 1}`, `k`, `n` squarefree primary good, coefficients independent of `k`, with every
  symbol keeping its zero values; fixed restrictions of the row set, and of the coefficient support by
  extension by zero, are allowed (`openai2026quasiRH` Lemma 9.1, p. 61; `gaozhao2024` Lemma 2.9).

Route: split the rows into the finitely many classes of `R_𝔠` and of the `S`-units modulo `n`-th
powers; within a class the residue symbol with the row as numerator is the Fisher–Friedberg
character times a fixed character of the column (§2.4), absorbed into `c_n`; cubic reciprocity (§2.5)
or sextic reciprocity (§4.5) moves the row to the numerator; then §6.4 with `n = 3` or `n = 6`.

**Checks.**

- `M = N = 1`: one row and one column (`m = n = 1`), symbol `1`, both sides `|c₁|²` up to the constant.
- `(n/m)_3` with `m = n` is `0`: squarefree rows and columns meet only through such zeros, which
  the zero convention keeps.
- The term `(MN)^(2/3)` dominates `M + N` exactly when `M^(1/2) < N < M²`; at `M = N` the bound is
  `N^(4/3+ε)` against the conjectured `N^(1+ε)`.

### Examples

- §6.1 on `ℂ/𝓞`: the fractions `d/s` with `(d, s) = 1`, `q_s ≤ r₊Y`, are `min(1, r₊)/Y`-separated
  (`openai2026quasiRH` Lemma 6.2, p. 47), so their sum over `q_m ≤ Q` is `≪ (Q + Y²)/Y` times the mass.
- §6.5 at `n = 6` contains §6.2 at `j = 3`: `χ_n(k)³` is the quadratic symbol, for which the sharper
  `(K + D)` bound holds.

### Dependencies

Layers 2–4; LFunctions Layer 5; ThetaSeries Layer 1; AnalyticNumberTheoryPartII §5.29 (the case
`k = ℚ`, not a supplier of the general statement).

## Layer 7: zero detection for finite-order Hecke `L`-functions

Throughout, `K` is a number field of degree `d`; a *presentation* `ψ` is a ray class character of a
modulus of `K` with its zero extension, `ψ*` its primitive inducing character, and
`L^orig(s, ψ) = L(s, ψ*) ∏_{𝔭 ∈ E_ψ} (1 − ψ*(𝔭) N𝔭^(−s))` its presented `L`-function
(`heckeLFunctionC`), `E_ψ` the primes of the defining modulus not dividing the conductor.

### 7.1 Detecting polynomials

For a presentation `ψ`, a base `U > 1`, log-lengths `r, m ≥ 0` and profiles `W` (annular, possibly
with a norm twist `x^(iv)`), define the *plain polynomial* `S_m = U^(−m/2) Σ_𝔫 ψ(𝔫) W(N𝔫/U^m)` and the
*inverse polynomial* `M_r = U^(−r/2) Σ_𝔫 μ(𝔫) ψ(𝔫) W(N𝔫/U^r)`, sums over nonzero integral ideals with
the zero extension of `ψ` kept (`openai2026quasiRH` (4.1)–(4.2), p. 12).

- For `c > 1`: `M_r = (2πi)⁻¹ ∫_{(c)} MW(s) U^(r(s − 1/2)) L^orig(s, ψ)⁻¹ ds` and
  `S_m = (2πi)⁻¹ ∫_{(c)} MW(s) U^(m(s − 1/2)) L^orig(s, ψ) ds`.
- `|M_r|, |S_m| ≪_W U^(r/2), U^(m/2)` by the ideal count.
- A norm twist `x^(iv)` in `W` moves the `L`-argument: `M_r` sees `L^orig(s + iv, ψ)⁻¹`.

**Checks.**

- `r = 0` and `W` supported in `(1/2, 2)`: only `𝔫 = 𝓞` contributes and `M_0 = W(1)`.
- `K = ℚ`, `ψ` trivial: `M_r` is the smoothed Möbius sum `U^(−r/2) Σ μ(n) W(n/U^r)`.
- A presentation at a modulus with an extra prime `𝔭` vanishes at `𝔭`, so its `M_r` differs from
  the primitive one by the terms divisible by `𝔭`; the definition uses the presentation.

### 7.2 Buffered zero-free bins

Fix a floor `a₀ ∈ (1/2, 1)` (the source takes `a₀ = 51/100`), `0 < ε < 10⁻³`, `I = ⌈1/ε⌉ + 2` and
`2 ≤ T₁ ≤ U^(1/100)`. Let `𝒳` be a family of nonprincipal presentations of bounded size whose
primitive conductors and deleted radicals have norm `≪ U`. Put
`M_j = max({a₀} ∪ {Re ρ : ψ ∈ 𝒳, L(ρ, ψ*) = 0, Re ρ ≥ a₀, |Im ρ| ≤ 3jT₁})`. Prove: there are
`i ∈ {1, …, I − 1}` and `a ∈ (a₀ + εℤ_{≥0}) ∩ [a₀, 1]` with `a ≤ M_i < a + ε` and `M_{i+1} < a + 2ε`;
if `a > a₀`, some `ψ ∈ 𝒳` has a zero `ρ` with `a ≤ Re ρ < a + ε`, `|Im ρ| ≤ 3iT₁`; for every
`ε₁ > 0`, uniformly in the family, `|L^orig(s, ψ)| + |L^orig(s, ψ)|⁻¹ ≪_{K,ε,ε₁} U^(ε₁)` on
`Re s ≥ a + 6ε`, `|Im s| ≤ (3i + 2)T₁`; on the reflected line
`|L^orig(1 − a − 6ε + it, ψ)| ≪_{K,ε,ε₁} U^(a − 1/2 + 12ε + ε₁) (3 + T₁)^C` for `|t| ≤ (3i + 2)T₁`, `C`
depending on `K`; and there are `O_ε(1)` pairs `(i, a)` (`openai2026quasiRH` Lemma 8.1, p. 56, for
`K = F` and the family `𝒳_u` of §10.4). Route: pigeonhole on the nondecreasing `M_j`; §5.3 on the
zero-free discs of radius `2 − a − 2ε`; §5.1 for the deleted factors; the functional equation
(LFunctions Layer 5) and §5.2 on the reflected line.

*Needs:* §§5.1–5.3; LFunctions Layer 5; Layer 1 (§1.2).

### 7.3 Pointwise dyadic estimates

In the setting of §7.2 with a bin `(i, a)` and `δ = 2a − 1`, fix bounded ranges for `r, m ≥ 0`,
profiles with uniformly bounded seminorms on a fixed annulus and norm twists of height at most
`(3i + 1)T₁`. Prove: for every `ε > 0` there are `ε₀ > 0` and a finite height order `A` such that,
when `(1 + T₁)^A ≤ U^(ε/10)`, `|M_r|² ≪ U^(δr + ε)` and `|S_m|² ≪ U^(δ min(m, 1 − m) + ε)` for
`ψ ∈ 𝒳`, the external tail order being chosen after `T₁` without changing `A`
(`openai2026quasiRH` Lemma 8.2, p. 57). Route: §7.1's Mellin formulas, shifted on the portion of
height at most a fraction of `T₁` to `Re s = a + 6ε` inside the zero-free rectangle, the tails left on
`Re s = 2` and bounded by §3.2 ((4.10)–(4.11)); for `S_m` the better of the direct shift and the
functional equation.

*Needs:* §§7.1–7.2; §3.2.

### 7.4 Two saturated witnesses

In the setting of §7.3 with `a > a₀`, prove: for every `t ∈ [1, 3/2]` and `ε > 0`, after the
preliminary losses are reduced, there are `ψ ∈ 𝒳`, a zero `ρ` as in §7.2, dyadic lengths `U^r`,
`U^m` and polynomials `M_r`, `S_m` of the same presentation `ψ` and the same twist height
(`|v| ≤ cT₁`), with uniformly smooth annular profiles, such that
`r ≤ t + O(1/log U)`, `r + m ≥ t − O(1/log U)`, `t − 1/2 − O(ε) ≤ r`, `0 ≤ m ≤ 1/2 + O(ε)`,
`|M_r S_m|² ≫ U^(δ(r+m) − ε)`, `|M_r|² ≫ U^(δr − ε)` and `|S_m|² ≫ U^(δm − ε)`; the `O(ε)` constants
are absolute and the dyadic pair is one of `O((log U)²)` (`openai2026quasiRH` Proposition 8.3,
p. 59; `liu2026improved` Proposition 5.1). Route: the truncated inverse
`C_ψ(s) = Σ μ(𝔩) ψ(𝔩) V(N𝔩/U^t) N𝔩^(−s)` inserted in `(2πi)⁻¹ ∫_{(2)} Y^z Γ(z) L^orig(ρ + z, ψ) C_ψ(ρ + z) dz`
with `Y` a fixed power of `U`; the residue at `z = 0` vanishes at the zero; the shifted line is small
by §§5.1–5.2; the coefficients of `L C_ψ` cancel up to length `U^t` except at `𝓞`; dyadic splitting
gives the product lower bound, and comparison with §7.3 gives `m ≤ 1/2 + O(ε)` and the individual
lower bounds (`maynardpratt2024` Appendix C; `guthmaynard2026` §13.1).

*Needs:* §§7.1–7.3; §§5.1–5.2; Mathlib `Complex.Gamma`.

### Examples

- With `t = 1` and `δ = 2a − 1 > 1/50` (the floor `51/100`), the witness `M_r` has `r ≥ 1/2 − O(ε)`
  and `|M_r|² ≫ U^(δ/2 − ε)`, a power saving below the trivial size `U^r`.
- At the floor `a = a₀` the bin carries no witness, and its rows are counted by the trivial bound.

### Dependencies

Layer 5 (§§5.1–5.3); Layer 3 (§3.2); Layer 1 (§1.2); LFunctions Layer 5.

## Layer 8: Kubota's character, Eisenstein series on `ℍ³` and theta functions

### 8.1 The Kubota character

Let `K` be a totally imaginary number field containing `μ_n` and `N` a natural number divisible by
`n²`. For `σ = (a b; c d)` in the principal congruence subgroup `Γ(N) = {σ ∈ GL₂(𝓞_K) : σ ≡ 1 (mod N)}`
define `κ(σ) = (c/d)_n` if `c ≠ 0` and `κ(σ) = 1` if `c = 0`. Prove that `κ` is a homomorphism
`Γ(N) → μ_n` (`kubota1969` §3, Propositions 1–2, pp. 24–25). For `K = F`, `n = 3`: on
`Γ₁(3) = {γ ∈ SL₂(𝓞) : γ ≡ I (mod 3)}` the function `κ(γ) = (c/a)_3` (`c ≠ 0`), `κ(γ) = 1`
(`c = 0`), equal to `(b/d)_3` there, is a homomorphism, and it extends to
`Γ₂ = SL₂(ℤ) Γ₁(3)` by `κ = 1` on `SL₂(ℤ)`; `[SL₂(𝓞) : Γ₂] = 27` (`patterson1977` §2, (1.1), pp. 2–5;
`dunnradziwill2024` (5.2)–(5.5)).

- `κ` is trivial on the upper triangular elements of `Γ(N)` and is not trivial on `Γ(N)`.
- `κ` takes every value of `μ_n` on `Γ(N)` (`kubota1969` proof of Proposition 4).
- For `g, g' ∈ SL₂(𝓞)`, `g ≡ g' (mod 3)` implies `Γ₂ g = Γ₂ g'` (`dunnradziwill2024` (5.3)).

**Checks.**

- `γ = (1 + 3ω, −3ω²; 3, 1 − 3ω) ∈ Γ₁(3)`: `(c/a)_3 = (3/(1 + 3ω))_3 ≡ 3² = 9 ≡ 2 ≡ ω` in `𝔽₇`, and
  `(b/d)_3 = (−3ω²/(1 − 3ω))_3` in `𝔽₁₃` (`ω ↦ 9`) is `4⁴ ≡ 9 ≡ ω`; both give `κ(γ) = ω`.
- `κ((1 0; 3 1)) = (3/1)_3 = 1`: the symbol at the unit ideal is `1`.
- `κ(T) = 1` for `T = (1 1; 0 1)`, and `κ((0 −1; 1 0)) = 1` since it lies in `SL₂(ℤ)`; a definition
  by `(c/a)_3` on all of `Γ₂` would be undefined there (`a = 0`).

### 8.2 Automorphic functions on `ℍ³` with a unitary character

Let `Γ ⊂ SL₂(ℂ)` be a discrete group of finite type (cofinite, with every boundary point of a
fundamental domain a cusp) and `χ` a unitary character of `Γ`. A cusp `c` is *essential* for `χ`
when `χ` is trivial on its stabilizer `Γ_c`. Define the automorphic functions of `(Γ, χ)`: smooth
`f` on `ℍ³` with `f(γw) = χ(γ) f(w)` (`kubota1968` §§2–3, pp. 262–264).

- At an essential cusp with `σ_c ∞ = c` and translation lattice of `σ_c⁻¹ Γ_c σ_c` of covolume one, a
  `Δ₃`-eigenfunction `f` with eigenvalue `s(2 − s)` and moderate growth has the expansion
  `f(σ_c w) = α v^s + β v^(2−s) + Σ_{μ ≠ 0} a(μ) v K_{s−1}(4π|μ|v) ě(μz)` over the dual lattice (`α v + β v log v`
  at `s = 1`); at a nonessential cusp the constant term vanishes.
- The growing solutions `v I_{±(s−1)}` are excluded by moderate growth; the coefficients are bounded
  polynomially in `|μ|`.

**Checks.**

- `Γ = SL₂(𝓞)`, `χ = 1`: every cusp is essential, and the constant function has `α = 1`, `s = 0`.
- `Γ₂` with `κ`: `∞` is essential (`κ = 1` on the upper triangular elements of `Γ₂`).
- `Δ₃ (v K_{1/3}(4π|μ|v) ě(μz)) = (8/9) · (v K_{1/3}(4π|μ|v) ě(μz))`: order `s − 1 = 1/3` gives
  `s(2 − s) = 8/9`; the order `1/3` with eigenvalue `1 − 1/9` is the theta eigenvalue of §8.5.

*Needs:* BianchiModularForms §§0.3–0.4; MaassForms §7.1; AutomorphicFormsOnReductiveGroups §4.5.

### 8.3 Eisenstein series at essential cusps

For `(Γ, χ)` as in §8.2 and an essential cusp `κ_i` with `σ_i`, define
`E_i(w, s, χ) = Σ_{σ ∈ Γ_i \ Γ} χ̄(σ) v(σ_i⁻¹ σ w)^s` (`kubota1968` (8), (18), pp. 263, 266; `patterson1977` (3.1)).

- It converges absolutely and locally uniformly for `Re s > 2`, is holomorphic in `s` there,
  satisfies `E_i(γw, s, χ) = χ(γ) E_i(w, s, χ)` and `Δ₃ E_i = s(2 − s) E_i`.
- At an essential cusp `κ_j` its constant term is `δ_ij v^s + φ_ij(s, χ) v^(2−s)`, with
  `φ_ij(s, χ) = (π/(s − 1)) Σ_{(c,d)} χ_ij(c, d) |c|^(−2s)` over the pairs of the double coset
  `σ_i⁻¹ Γ σ_j` with `c ≠ 0`, `d` modulo `c` times the lattice; its nonconstant coefficients are
  Dirichlet series `Σ_{(c,d)} χ_ij(c, d) ě(μd/c) |c|^(−2s)` times `v K_{s−1}(4π|μ|v)` and an explicit
  gamma factor (`kubota1968` (16)–(17), (22)–(25); `kubota1969` (36)–(42), pp. 43–47).

**Checks.**

- `Γ = SL₂(ℤ[i])`, `χ = 1`, `Re s > 2`: the series is `Σ v^s/(|cz + d|² + |c|²v²)^s` over coprime
  pairs up to units, and the constant term at `∞` is `v^s + φ(s) v^(2−s)` with `φ` a ratio of Dedekind
  zeta values of `ℚ(i)`.
- At a nonessential cusp the series would be ill defined: a stabilizer element with `χ ≠ 1`
  changes a term by a nontrivial root of unity.
- `s = 3`: `|v(σw)^3| ≤ v(σw)^3`, the absolutely convergent case.

### 8.4 Continuation and functional equations

For `(Γ, χ)` as in §8.2 with `h` essential cusps, prove: each `E_i(w, s, χ)` continues to a meromorphic
function of `s ∈ ℂ`; with `ℰ = (E_1, …, E_h)` and `Φ(s, χ) = (φ_ij(s, χ))`, `ℰ` and `Φ` are holomorphic on
`Re s ≥ 1` except for finitely many simple poles in `(1, 2]`, the point `2` being a pole exactly when
`χ` is trivial (residue a constant), `Φ(1 + it, χ)` is unitary, `Φ(s, χ) Φ(2 − s, χ) = I` and
`ℰ(w, s, χ) = Φ(s, χ) ℰ(w, 2 − s, χ)`; the residue of `ℰ` at a pole in `(1, 2]` is square integrable on
`Γ \ ℍ³` and a `Δ₃`-eigenfunction with eigenvalue `s(2 − s)` (`kubota1968` §3, p. 265, and §4, (28)–(29), p. 268;
`patterson1977` §3, (3.9)–(3.11), pp. 6–8). Route: the Maass–Selberg relations for truncated
Eisenstein series (`patterson1977` (3.9)–(3.10)) and analytic Fredholm continuation of the resolvent
of the Laplacian on `L²(Γ \ ℍ³, χ)` (AutomorphicSpectralTheory §§0.15–0.16), as in Selberg's method.

**Checks.**

- `χ` trivial: the residue at `s = 2` is constant, eigenvalue `2(2 − 2) = 0`; an interval `(1, 2)` would
  omit it.
- `(Γ₂, κ)`: the pole of interest is at `4/3` (§8.7), inside `(1, 2)`, with eigenvalue `8/9`.
- On `Re s = 1` there is no pole and `|φ_ii(1 + it)| ≤ 1` by unitarity.

*Needs:* §§8.2–8.3; MaassForms §7.1; BianchiModularForms §0.3; AutomorphicSpectralTheory §§0.15–0.16.

### 8.5 Theta functions as residues

Let `K` be imaginary quadratic with `μ_n ⊆ K` (`n ∈ {2, 3, 4, 6}`), `N` with `n² ∣ N` an `n`-th power
in `K`, and `κ` the Kubota character on `Γ = Γ(N) ∩ SL₂(𝓞_K)`. Define the *theta function* of
`(Γ, κ)` as the residue at `s = 1 + 1/n` of the Eisenstein series at `∞`. Prove that the pole is at most
simple and the residue is nonzero, square integrable, automorphic with character `κ`, with
`Δ₃ θ = (1 + 1/n)(1 − 1/n) θ` (`kubota1969` §6, Theorem 6 and (45), pp. 49–50).

- The constant term of `θ` at `∞` is a multiple of `v^(1 − 1/n)`, and its nonconstant terms are
  `v K_(1/n)(4π|μ|v) ě(μz)`.
- `θ` is the residue, up to a nonzero constant, at every essential cusp (`patterson1977` Theorem 8.1
  for `n = 3`).

**Checks.**

- `n = 3`: the pole is at `4/3`, the eigenvalue `(4/3)(2/3) = 8/9`, the Bessel order `1/3`, the
  constant term `σ v^(2/3)`.
- `n = 2`: the pole is at `3/2`, eigenvalue `3/4`, Bessel order `1/2`, where `K_(1/2)` is elementary.
- A pole at `s = 1` would give eigenvalue `1` and the order-zero Bessel function; the residue at
  `1 + 1/n` is not at `1`.

### 8.6 Patterson's converse theorem

Let `M₀ = λ⁻³𝓞`, and `M₁`, `M₂` the shifted lattices of `patterson1977` (7.1), with three coefficient
functions `c_a` on `M_a` related by (7.4). Suppose that the angularly twisted Dirichlet series
`L_a(s, l, b)` of (7.2), completed as `Ξ_a(s, l, b)` by the gamma factors of (7.3), converge in a
half-plane, continue meromorphically to `ℂ`, entire for `l ≠ 0` and with at most simple poles at
`4/3`, `2/3` for `l = 0`, are bounded in vertical strips of finite width, and satisfy the functional
equations (7.5) under `(s, l) ↦ (2 − s, −l)`. Prove that
`f(w) = π r(0, 0) v^(2/3) + Σ_{μ ∈ M₀} c₀(μ) v K_(1/3)(4π|μ|v) ě(μz)` is automorphic under `Γ₂` with
character `κ`, with `r(0, 0) = ω² r(1, −1) = ω r(2, −1)` the residues at `4/3` and the other `r(a, b)`
zero (`patterson1977` Theorem 7.1 and Lemma 7.2, pp. 23–24). Route: the 27 functions `F_j = f ∘ γ_j`
over the coset representatives `γ_j` of `Γ₂ \ SL₂(𝓞)` (Table II) satisfy `F_j(g w) = κ(g_j(g)) F_(k_j(g))(w)`
for the generators `(1 1; 0 1)`, `(ω 0; 0 ω²)` and `(0 −1; 1 0)`; the inversion is the Maass-type
identity of Lemma 7.2.

*Needs:* §§8.1–8.2; Mellin inversion; AutomorphicFormsOnReductiveGroups §4.5.

### 8.7 The cubic theta function of `ℚ(ω)` and its expansions at three cusps

Prove that there is a smooth `θ` on `ℍ³`, automorphic under `Γ₂` with character `κ`, proportional to the
residue at `4/3` of the Eisenstein series at every essential cusp, with expansion at `∞`
`θ(w) = σ v^(2/3) + Σ_{0 ≠ μ ∈ λ⁻³𝓞} τ(μ) v K_(1/3)(4π|μ|v) ě(μz)`, where `σ² = 3⁵/4` and, for primary
`c, d` with `c` squarefree and `g(r, c) = Σ_{x mod c} (x/c)_3 ě(rx/c)`:
`τ(±λ^(3n−4) c d³) = g(λ², c) |d/c| 3^(n/2 + 2)`,
`τ(±ωλ^(3n−4) c d³) = e^(−2πi/9) g(ωλ², c) |d/c| 3^(n/2 + 2)`,
`τ(±ω²λ^(3n−4) c d³) = e^(2πi/9) g(ω²λ², c) |d/c| 3^(n/2 + 2)` for `n ≥ 1`,
`τ(±λ^(3n−3) c d³) = g(1, c) |d/c| 3^(n/2 + 5/2)` for `n ≥ 0`, and `τ(μ) = 0` otherwise
(`patterson1977` Theorem 8.1 and (8.1)–(8.3), pp. 29–30; `dunnradziwill2024` (5.6)–(5.8), where
`σ = 3^(5/2)/2`). Prove the expansions at the cusps `H_j ∞` for `H_j = (1 0; t_j 1)`,
`(t₀, t₁, t₂) = (0, ω², ω)`: `θ(H_j(z, v)) = C_j(v) + Σ_{0 ≠ μ ∈ λ⁻⁴𝓞} d_j(μ) v K_(1/3)(4π|μ|v) ě(μz)` with
`C₀ = σ v^(2/3)`, `C₁ = C₂ = 0` and `d_j` given by `τ`, `τ₁`, `τ₂` (`patterson1977` (8.8)–(8.9) and Table III,
p. 151; `dunnradziwill2024` (5.9), (5.12)–(5.16) and Appendix A, rows 1, 10, 19). The support and size:
`d_j(μ) = 0` unless `μ = uλ^k n b³` with a unit `u`, `k ≥ −4`, `n, b` primary and `n` squarefree, and
then `|d_j(μ)| ≤ 27 · 3^(k/6) |b|`, with no coprimality between `n` and `b`
(`openai2026quasiRH` (5.2), p. 26). Route: Patterson's Dirichlet series of Gauss sums (the Fourier
coefficients of §8.3 for `κ`) with their functional equations (`patterson1977` Theorem 6.1 and
Corollary 5.2) and residues (Theorem 9.1) supply the hypotheses of §8.6; the coefficients at the other
cusps are the entries of the 27-vector built in the proof of §8.6; the bound uses `|g(r, c)| = |c|` for
squarefree primary `c` and `r` prime to `c`.

**Checks.**

- `μ = λ⁻³ c d³` (`n = 0`): `τ(μ) = 3^(5/2) |d| g(1, c)/|c| = 3^(5/2) |d| g̃(c)`, the coefficient
  `d₁(λ⁻³nb³) = 3^(5/2)|b| g̃₃(n)` of `openai2026quasiRH` (5.9); with `k = −3` the bound is
  `27 · 3^(−1/2) |d| = 3^(5/2) |d|`, attained.
- `μ = λ^(3n−4) c d³`: `|τ(μ)| = 3^(n/2+2) |d|`, below `27 · 3^((3n−4)/6) |d| = 3^(n/2 + 7/3) |d|`.
- The cusp coefficients `τ₁`, `τ₂` have modulus `9|d|` at `k = −4`, below `27 · 3^(−2/3) |d| ≈ 12.98 |d|`;
  a bound `27 · 3^(k/6)` without the factor `|b|` fails at `d = 2`.

### Examples

- The coefficient of `θ` at `μ = λ⁻³` (`c = d = 1`): `τ = 3^(5/2) g(1, 1) = 3^(5/2)`.
- `g̃(c)³ = μ(c) c/|c|` (`dunnradziwill2024` (1.8)) and §4.3 agree: `γ_2(c) = χ_c(λ)² g̃(c)`.

### Dependencies

Layer 2 (§§2.3, 2.5), Layer 4 (§§4.1–4.3); BianchiModularForms §§0.3–0.4; MaassForms §7.1;
AutomorphicFormsOnReductiveGroups §4.5; AutomorphicSpectralTheory §§0.15–0.16.

## Layer 9: the completed cubic reflection

### 9.1 The completed theta series

For a finite-order character `Ψ` of primary elements, zero-extended, define
`D(s, Ψ) = Σ_{c sf} γ_2(c) α(c) Ψ(c) q_c^(−s)`, `L₀(s, Ψ) = Σ_n α(n)³ Ψ(n)³ q_n^(−3s+1/2)` and
`T(s, Ψ) = L₀(s, Ψ) D(s, Ψ)`, sums over primary indices prime to the defining modulus, and, for `X > 0`
and a test `V`, the *completed sum* `C_V(X; Ψ) = Σ_{c sf, n} γ_2(c) α(cn³) Ψ(cn³) q_c^(−1/2) q_n^(−1) V(q_c q_n³/X)`,
no coprimality between `c` and `n` being imposed (`openai2026quasiRH` §5.1, p. 25; `liu2026improved`
(4.1)).

- All three series converge absolutely on `Re s > 1`, and
  `C_V(X; Ψ) = (2πi)⁻¹ ∫_{(a)} V̂(s − 1/2) X^(s−1/2) T(s, Ψ) ds` for `a > 1`.
- The character acts on the whole index `cn³`; a primary index `A` is of the form `cn³` exactly when
  every valuation of `A` is `0` or `1` modulo `3`, and then `c`, `n` are unique.

**Checks.**

- `Ψ = 1` and `c = n = 1`: the term is `V(1/X)`.
- `A = p²` is not of the form `cn³`, while `p³ = 1 · p³` and `p⁴ = p · p³` are.
- `T(s, Ψ)` is not `Σ γ_2(A) …` over all `A`: at `A = p³` the coefficient is `α(p)³ Ψ(p)³ q_p^(1/2) q_p^(−3s)`,
  from `L₀`, while `γ_2` is defined only on squarefree indices.

### 9.2 The completed cubic reflection

Fix a finite family `𝒳` of finite-ray characters with conductors supported on `S`, a modulus `𝔈`
with support exactly `S` divisible by each conductor, and `L ∈ 𝓞` with support `S`, `18 ∣ L`, `λ ∣ L`,
such that for every `Ψ₀ ∈ 𝒳` the function `Φ(x) = χ_x(λ)² Ψ₀(x)` on primary `x` prime to `𝔈` (and `0`
elsewhere) is `L`-periodic (possible by §2.5 and ray periodicity). For a finite set `P` of primary good
primes not dividing `L`, exponents `j_p ∈ {0, …, 5}` and `Ψ = Ψ₀ ∏_p χ_p^(j_p)`, prove
(`openai2026quasiRH` Proposition 5.1 and (5.1)–(5.6), pp. 24–27; `liu2026improved` Proposition 4.1):

- `T(s, Ψ)` continues to an entire function of polynomial growth on every vertical strip;
- for `X > 0` and smooth `V` on `(0, ∞)` with `(x∂_x)^j V(x) = O(x^C)` at `0` and `O(x^(−C))` at `∞` for
  all `C, j`: `C_V(X; Ψ)` is a finite sum, over terms `t` indexed by `h₀ mod L` and a set of active
  primes containing every `p` with `j_p ≠ 0` (`O(2^|P|)` terms), of
  `ζ_t Σ_{0 ≠ μ ∈ λ⁻⁴𝓞} d_t(μ) α(μ) ϑ_t(λ⁴μ) q_μ^(−1/2) ∏_{p active} B_p(λ⁴μ) V♯(q_μ X/q_(c_t)²)`, where
  `d_t` is one of the three cusp coefficient functions of §8.7, `ϑ_t` an additive character modulo a
  modulus depending only on `L`, `c_t = c_F ∏_{p active} p` with `c_F` the reduced denominator of
  `λ²h₀/L`, the scalar satisfies `|ζ_t| ≤ 1/81` with the moving-prime dependence (5.3), and
  `B_p(x) = χ_p(x)^(−j_p−2)` (`j_p ≠ 0, 4`), `q_p^(−1/2)(−1 + q_p 1_{p ∣ x})` (`j_p = 4`),
  `q_p^(−1/2) χ_p(x)^(−2)` (`j_p = 0`, `p` active);
- `V♯(x) = (2πi)⁻¹ ∫_{(v)} V̂(−t) ∏_± Γ(1 + t ± 1/6)/Γ(1 − t ± 1/6) ((2π)⁴ x/27)^(−t) dt`, independent of
  `v ≥ 0`, with `|(x∂_x)^j V♯(x)| ≪_{A,j} min{x^(1/4), (1 + x)^(−A)} 𝓜_{A,⌈4A⌉+j+2}(V)` where
  `𝓜_{A,B}(V) = sup_{−A ≤ η ≤ 1/4} ∫ (1 + |u|)^B |V̂(η + iu)| du`, and the integrated form (5.5);
- adding a good prime with exponent `0` as an inactive prime leaves `c_F`, `c_t`, `d_t`, `ϑ_t` and the
  kernel unchanged and multiplies the scalar by `1 − q_p⁻¹`.

Route: express the masks by finite Fourier inversion with the zero extensions kept
(`openai2026quasiRH` (5.11)–(5.12)) as finite sums of translated theta values; move each rational cusp
to one of the three cusps of §8.7 by the automorphy of §8.1; compute the multipliers and local Fourier
factors; compare Mellin transforms with the gamma factor of the theta expansion.

*Needs:* §§8.1, 8.7; §§4.1–4.5; §2.5; §§3.2–3.4; Mathlib `Complex.Gamma`, `mellin`.

### 9.3 Fixed ray sectors, common kernels and lattice tails

Prove: (Lemma 5.2) for a fixed finite family of base characters, the twisted characters
`A ↦ χ_A(m) Ψ_base(A)` of the nonzero elements `m` fall, after fixing the `S`-valuations of `m` modulo
`6`, its unit and the ray class of `m_good`, into finitely many sectors on each of which one pair
`(𝔈, L)` of §9.2 and one choice of `d_t`, `ϑ_t` serve; (Lemma 5.3) the transforms `V♯` of the annular
pieces of a common profile form a uniformly smooth family with seminorms bounded by `𝓜_{A,J}`; (Lemma
5.4) for `A = 𝓞` or `λ⁻⁴𝓞` and `|K(x)| ≤ C_A x^(−A)` on `x ≥ 1` with `A > 1`,
`Σ_{μ ∈ A, a q_μ > U} |K(a q_μ)| ≪_A C_A (1 + a⁻¹) U^(1−A)` for `a > 0`, `U ≥ 1`, and `C_A ≪ 𝓜_{A,⌈4A⌉+2}(V)` for
`K = V♯` (`openai2026quasiRH` Lemmas 5.2–5.4, pp. 34–36).

*Needs:* §9.2; §2.4; §3.2; §3.5.

### 9.4 The quadratic reduction and the unmarked reflected energy

Prove (`openai2026quasiRH` Lemma 5.5, (5.27)–(5.29), p. 37): for squarefree primary good `k` with
`q_k ≤ K`, squarefree primary `n` with `q_n ≍ N`, primary `b` with `q_b ≍ B` (`n`, `b` allowed to meet `S`
away from `λ`) and coefficients `|β(n, b)| ≤ 1` independent of `k`,
`Σ_k |Σ_{n,b} β(n, b) χ_k(nb)³|² ≪_ε (KNB)^ε (K + NB) NB`; the route writes `b = g t²`, `n = cm`, `g = ch`,
uses `χ_k(nb)³ = χ_k(mh)³ 1_{(k, ct) = 1}` and Möbius inversion for the coprimality, then §6.2.

Prove (`openai2026quasiRH` Definition 5.6, Lemmas 5.7–5.8 and (5.39), pp. 38–44; `liu2026improved`
Lemma 4.2): for a fixed finite ray character `ν`, bounded exponents `M, O ≥ 0` and `N`, and every
`ε > 0`, there are finite orders `A, J` with
`Σ_{0 < q_m ≪ Z^M, q_(m_pow) ≍ Z^O} |C_V(Z^N; ν χ_•(m))|² ≪ Z^(O/2 + max(M − O, 2M − O − N) + ε) 𝓜_{A,J}(V)²`, the
sum over nonzero elements `m` with all unit associates and `m_pow` the powerful part; at
`M = N = 1` summed over `O`: `Σ_{q_m ≤ Z} |C_V(Z; ν χ_•(m))|² ≪ Z^(1+ε) 𝓜_{A,J}(V)²`, which applies directly
to the Gaussian test `V_G` of §3.3 (`V̂_G(t) = e^(t²)`).

*Needs:* §§9.2–9.3; §6.2; §3.3.

### Examples

- At `M = N = 1`, `O = 0` the exponent is `0 + max(1, 1) = 1`: the reflected energy has the size of the
  number of rows.
- `V = V_G`: `𝓜_{A,J}(V_G) = sup_{−A ≤ η ≤ 1/4} ∫ (1 + |u|)^J e^(η² − u²) du < ∞` for all `A, J`.

### Dependencies

Layers 2–4, 6 (§6.2) and 8 (§§8.1, 8.7).

## Layer 10: the probe at `11/12` and the `11/12` half-plane

Throughout, `η` is a primitive finite-order Hecke character of `F` (the *target*), `T` a finite ray
group (independent of `η`) through which `R`, `G` and the primary phases of §4.5 factor,
`Θ = ⟨η, T̂⟩`, `S` the excluded set for the family `{ηθ : θ ∈ T̂}` containing every prime of norm at most
a fixed `P₀`, `b*` the squarefree product of the primes of `S` and `ξ` a primitive character modulo
`b*` of order dividing `6`, nonprincipal at each prime of `S`.

### 10.1 The probe

Define, for `X, Y, Z > 0`, fixed nonnegative nonzero annular `W₀, W₁` and `Φ(t) = e^(t²)`, the *probe*
`I_η(X, Y, Z) = Y⁻¹ Σ_v W₁(q_v/Y) χ_v(b*) τ*⁻¹ ξ̄(v) (q_(b*) q_v X)^(−1/2) Σ_{m ≠ 0} ξ(m) q_v^(−1/2) g_(χ_v)(v, −m) W₀(q_m/(q_(b*) q_v X)) (2πi)⁻¹ ∫_{(4)} Z^t Φ(t) T_(m,v,η)(t) dt`,
`v` over primary generators of good ideals, with `τ* = q_(b*)^(−1/2) g_ξ(b*, 1)`,
`Ψ_(m,v,η)(A) = η(A) Ξ(A)⁻¹ R(A, v) χ_A(m)`, `Ξ(A) = ξ(A) χ_A(b*)` and
`T_(m,v,η)(t) = Σ_{c sf, n} γ_2(c) α(cn³) Ψ_(m,v,η)(cn³) G(cn³) q_c^(−1/2−t) q_n^(−1−3t)`
(`openai2026quasiRH` (6.1), p. 46; `liu2026improved` (4.5)).

- Both sums are finite on the support of `W₀, W₁`, and the `t`-integral converges absolutely;
  `m = 0` is excluded by the annular `W₀`.
- `T_(m,v,η)(t) = Σ_θ a_θ T(t + 1/2, Ψ_(m,v,η) θ)` with `G = Σ_θ a_θ θ` (§4.6), so the probe is a
  weighted average of completed sums `C_(V_G)(Z; ·)` (§9.1) with `V_G` the Gaussian of §3.3.

**Checks.**

- `|τ*| = 1` and `|Ξ| ≤ 1`: `ξ` is primitive modulo `b*`, and `χ_A(b*)` is a fixed-numerator character
  (§2.4).
- `ξ(m) = 0` when `m` meets `b*`: every surviving frequency is prime to `S`.
- `V_G = (2πi)⁻¹ ∫_{(4)} Φ(t) x^(−t) dt`, so the `t`-integral is the Mellin form of `C_(V_G)` (§9.1).

### 10.2 The balanced low estimate

Prove the separation `I_η = (Q^(−1/2)/2π) Σ_{σ ∈ T} ∫ Ŵ₀(it₀) Σ_{m ≠ 0} Ω(q_m/Q) ξ(m) (q_m/Q)^(−it₀) A_(m,σ,t₀)(Y) B_(m,σ)(Z) dt₀`
with `Q = q_(b*) XY` (`openai2026quasiRH` (6.2), p. 46); the balanced additive norm
`Σ_{q_m ≤ CQ} |A_(m,σ,t₀)(Y)|² ≪ (Q + Y²)/Y`, uniformly in `t₀`, by §6.1 for the fractions `d/s` with
`(d, s) = 1`, separated by `min(1, r₊)/Y` (Lemma 6.2, p. 47); and the balanced low estimate
`|I_η(Z^(1/2), Z^(1/2), Z)| ≪_{η,ε} Z^(1/4+ε)` for every `ε > 0`, the exponent being independent of `η`
(Proposition 6.3, p. 49; `liu2026improved` (6.1)).

*Needs:* §10.1; §6.1; §9.4; §4.6.

### 10.3 The Poisson representation and the scalar Euler identity

Prove: Poisson summation in `m` (§3.5) at modulus `v b* A` gives the frequency expansion with
coefficients `F_(v,A)(H)` (7.1), vanishing unless `(H, S) = 1`; each remaining frequency is uniquely
`H = u a⁶` with `u` sixth-power-free (unit included) and `a` primary; with `W̃₀(|y|²)` the Fourier transform on `ℂ` (Conventions) of `x ↦ W₀(|x|²)`,
`M(z) = ∫₀^∞ W̃₀(r) r^(z−1) dr`
and `W(X, Y, Z; x, w, z) = X^(1/2−z) Z^(x+z−1) Y^(w−1) Φ(x + z − 1) M(z) Ŵ₁(w)`,
`I_η = (2πi)⁻³ ∫_{(3)} ∫_{(3)} ∫_{(2)} W Σ_u q_u^(−z) ξ̄(u) F_(η,u)(x, w, z) dz dw dx` (7.5); and the complete
local identity: for nonzero sixth-power-free `u` prime to `S`,
`F_(η,u)(x, w, z) = ζ^S_F(6z) L^S(w, χ_•(u)) L^S(x, ηχ_•(u))⁻¹ H_(η,u)(x, w, z)` with
`H_(η,u) = ∏_{p ∉ S} P_p (1 − V_p)(1 − W_p)/(1 − D_p)`, `V_p = q_p^(−6z)`, `W_p = χ_p(u) q_p^(−w)`,
`D_p = η(p) χ_p(u) q_p^(−x)`, the local factors `P_p` given by the six cases of `v_p(u)` in (7.11), and
`H_(η,u)` holomorphic on a neighbourhood of every point of
`D₁ : Re x ≥ 51/100, Re z ≥ 17/50, Re w ≥ −1/100, Re x + Re w ≥ 1 + ε₀` and of
`D₂ : Re x ≥ 7/8, Re z ≥ 33/200, Re w ≥ 19/20`, with `H_(η,u) ≪_ε q_u^ε` uniformly in heights and
`H_(η,1) = 1 + O(P₀^(−4/5))` on `D₂` (`openai2026quasiRH` Lemma 7.1 and (7.3)–(7.15), pp. 50–54;
`liu2026improved` (4.8)–(4.12)). Prove `M(1/6) > 0` (7.2), through
`|y|^(2σ−2) = Γ(1 − σ)⁻¹ ∫₀^∞ t^(−σ) e^(−t|y|²) dt` and Fourier duality, without positivity of `W̃₀`.
Define the principal correction `H_η(s) = H_(η,1)(s, 1, 1/6)` and the constant
`c_S = Ŵ₁(1) M(1/6) (Res_{s=1} ζ^S_F(s))²/6 > 0`, the `1/6` from `Res_{z=1/6} ζ^S_F(6z)`; for `P₀` large
(independently of `η`), `sup_{Re s > 7/8} |H_η(s) − 1| ≤ 1/2` (`liu2026improved` (4.13)–(4.14)).

**Checks.**

- `u = 1`: `χ_•(1) = 1`, so the identity reads `ζ^S_F(6z) ζ^S_F(w)/L^S(x, η) · H_(η,1)`; the poles at `w = 1`
  and `z = 1/6` produce the principal signal with `1/L^S(x, η)`.
- `(s, 1, 1/6) ∈ D₂` for `Re s > 7/8`: `Re z = 1/6 ≥ 33/200 = 0.165` and `Re w = 1 ≥ 19/20`; a residue point
  `z = 1/6` below `33/200` would fail.
- A nontrivial unit `u` or a good prime dividing `u` makes `χ_•(u)` nonprincipal, so the numerator has
  no pole at `w = 1` for `u ≠ 1`.

### 10.4 The row family and the sextic-sieve row envelope

For a nonzero sixth-power-free `u` prime to `S` put `𝒳_u = {ν(·) χ_·(u)^(±1) : ν ∈ Θ}`; a presentation in
`𝒳_u` can be principal only when `u` is supported on `S`, finitely many rows that are treated
separately. Prove (`openai2026quasiRH` Proposition 9.2, p. 67; `liu2026improved` (6.2)): for a bounded
dyad `U = Z^d`, `d_min ≤ d ≤ d_max`, a set `B` of retained rows with `q_u ≍ U` in one bin `(i, a)` of §7.2
for the family `𝒳_u` with `a > 51/100`, and `δ = 2a − 1`: for every `ε > 0`, after reducing the losses of
§7.4, `#B ≪ U^(R(δ) + ε) (1 + T₁)^A` with `R(δ) = min{1, max(1 − δ/2, 4/3 − δ)}` and a finite order `A`
fixed before `T₁ = Z^τ`; the floor bin has `#B ≪ U`, agreeing with `R(1/50) = 1`. Route: §7.4 with `t = 1`
gives `|M_u(D; W)|² ≫ U^(δr − ε)` with `1/2 − O(ε) ≤ r ≤ 1 + O(1/log U)`; fix the part of `u` with
valuations at least `2` and apply the sextic large sieve §6.5 to the squarefree part; compare with the
trivial count by the size of the fixed part.

**Checks.**

- `δ = 1/50`: `max(1 − 1/100, 4/3 − 1/50) = 1.313…`, so `R = 1`, the trivial count.
- `δ = 1`: `max(1/2, 1/3) = 1/2`, so `R(1) = 1/2`.
- `δ = 2/3`: both branches give `2/3`; the kink of `R` is at `δ = 2/3`.

### 10.5 Contour estimates for the high expansion

For the data of `openai2026quasiRH` Definition 10.1 (log-lengths `l_x, l_y > 0`, the analysis height
`T₁ = Z^τ`, the excluded set and the row ranges), prove: the external integrated and trace tails
(Lemma 10.2); the contour transformation for a fixed bin, moving the `x`-line to the buffered rectangle
of §7.2 (Lemma 10.3, for `σ₀ ∈ [7/8, 1)` with `β* > σ₀`, which contains `σ₀ = 11/12`); the bound of a retained
integral by its exponent (Lemma 10.4); the extraction of the principal signal: the residues at `w = 1`
and `z = 1/6` of the row `u = 1` give `c_S f_η(Z)` with the `f_η` of §1.3 for `C(s) = s − 2/3` at
`l_x = l_y = 1/2`, up to the unresidued principal integrals (Lemma 10.5); and the outer row norms,
the small rows `U ≤ Z^(d_min)` and the large rows above the range of §10.4 (Lemma 10.6) (`openai2026quasiRH` §10, pp. 70–82).

*Needs:* §§10.3–10.4; §§7.2–7.3; §§3.2, 3.4; §5.1.

### 10.6 The balanced high estimate

With `J_(I,η)(Z) = I_η(Z^(1/2), Z^(1/2), Z)/c_S`, `C_I(s) = s − 2/3` and `f_(I,η)` the `f_η` of §1.3 for `C_I`,
prove: if `β* > 11/12`, then `|J_(I,η)(Z) − f_(I,η)(Z)| ≪_η Z^(C_I(β*) − 1/4800)` for every target `η`
and large `Z`, the saving being independent of `η` (`openai2026quasiRH` Proposition 11.2, p. 83). Route:
the savings relative to `C_I(β*)` before adjustable losses are `1021/25000` (intermediate rows), `1/40`
(unresidued principal `w`-integral), `1/1200` (remaining principal `z`-integral), `43/300` (small
rows) and more than `1` (large rows, with the fixed line `Re z = v = 4000`); with `m₀ = 1/1200` and the
common loss `E* = 10⁻⁶`, the central losses are at most `46E* < m₀/4`, every saving keeps at least
`3m₀/4 = 1/1600`, and §1.4 with `m = 1/2400` gives `m/2 = 1/4800`.

**Checks** (the closed-form inequalities).

- `46 · 10⁻⁶ = 4.6 · 10⁻⁵ < (1/1200)/4 ≈ 2.08 · 10⁻⁴`.
- `3m₀/4 = 1/1600`, and `1/1600 > 1/2400 = m`.
- The smallest listed saving is `1/1200 < 1/40 < 1021/25000 < 43/300`: the remaining principal
  `z`-integral fixes `m₀`.

### 10.7 The `11/12` half-plane

Prove (`openai2026quasiRH` Theorem 3.1, p. 10; `liu2026improved` Proposition 6.3; `openai2026quasiRHalt`
Theorem 1.1, p. 2): for every modulus `𝔪` of `F` and every `χ : RayClassCharacter 𝔪`,
`heckeLFunctionC χ` is zero-free right of `11/12`; for every `N ≥ 1` and every
`χ : DirichletCharacter ℂ N`, `DirichletCharacter.LFunction χ` is zero-free right of `11/12`; in
particular `riemannZeta s ≠ 0` for `Re s > 11/12`. Route: the primitive family of `F` is zero-free
right of `1` (Euler product and LFunctions Layer 7); suppose its zero abscissa `β*` exceeds `11/12` and
apply §1.3 with `σ₀ = 11/12`, `c = −2/3`, `ω = (β* − 11/12)/2`, `σ = 1/4800`, `J_η = J_(I,η)`, `H_η` of §10.3
and `D_η` the Euler factors at `S`: §10.2 gives `|J_η| ≪ Z^(1/4 + ε)` with `C(11/12) = 1/4` and `ε < ω`, and
§10.6 the comparison. Hence `β* ≤ 11/12`, and §5.5 with `K = F` (abelian, `X(F) = {1, χ₋₃}`) transfers the
half-plane to every presentation and to every Dirichlet `L`-function. A second proof, through the mean
square of sextic-twisted Möbius sums `Σ μ(𝔫) η(𝔫) χ_n(u) W(N𝔫/D)` and Littlewood's criterion, is
`openai2026quasiRHalt` Proposition 3.1 and Section 3.

*Needs:* §§1.2–1.3, 5.5, 10.2, 10.3, 10.6; LFunctions Layers 5 and 7; Tau Ceti `heckeLFunctionC`,
`PrimitiveRayClassCharacter`; Mathlib `DirichletCharacter.LFunction`, `riemannZeta`.

**Checks** (computed against the statement).

- For a real primitive `χ` of conductor `q ≥ 3` and a real zero `β`, `β ≤ 11/12` gives
  `(1 − β) log q ≥ (log 3)/12`, a uniform Landau–Siegel bound; AnalyticNumberTheoryPartI §0.34 keeps its
  own statement.
- The principal character modulo `4`: `L(s, χ₀) = ζ(s)(1 − 2^(−s))` has its pole at `1` (order `−1`) and
  zeros on `Re s = 0`, none right of `11/12`; the statement holds at every level.
- `C_I(11/12) = 11/12 − 8/12 = 1/4`, the exponent of §10.2.

### Examples

- `X = Y = Z^(1/2)`, `Q = q_(b*) Z`: `Q^(−1/2) (Q/Y)^(1/2) Z^(1/2) = Z^(−1/2 + 1/4 + 1/2) = Z^(1/4)` up to constants.
- The principal residue has exponent `X^(1/3) Z^(s − 5/6) = Z^(s − 2/3)` at `X = Z^(1/2)`.

### Dependencies

Layers 1, 3–7 and 9; LFunctions Layers 5 and 7.

## Layer 11: consequences

### 11.1 The zero strip

Let `θ ∈ [1/2, 1)`. Prove: if `DirichletCharacter.LFunction χ` is zero-free right of `θ` for every
primitive `χ`, then every zero `ρ` with `Re ρ > 0` of a primitive Dirichlet `L`-function satisfies
`1 − θ ≤ Re ρ ≤ θ`; and the same for the primitive finite-order Hecke characters of `F`, under the
hypothesis for that family. Route: for `0 < Re ρ < 1` the gamma factor is finite and nonzero, so
`L(ρ, χ) = 0` gives `L(1 − ρ̄, χ) = 0` by the functional equation
(`DirichletCharacter.IsPrimitive.completedLFunction_one_sub`, LFunctions Layer 5 for `F`) and complex
conjugation; `Re ρ ≥ 1` is excluded by `DirichletCharacter.LFunction_ne_zero_of_one_le_re` and
LFunctions Layer 7; `Re ρ > 0` excludes the trivial zeros (`DirichletCharacter.LFunction_eq_zero_iff_of_re_nonpos`).
The instance `θ = 11/12` (§10.7) gives `1/12 ≤ Re ρ ≤ 11/12` (`openai2026quasiRH` proof of Corollary 1.2,
p. 7, at `7/8`).

**Checks.**

- `θ = 1/2` gives `Re ρ = 1/2`: the hypothesis is GRH for the family.
- The principal character modulo `p` is not primitive and has zeros on `Re s = 0` from `1 − p^(−s)`; the
  strip is stated for primitive characters and `Re ρ > 0`.
- `ζ` is the primitive character modulo `1`: its nontrivial zeros satisfy `1/12 ≤ Re ρ ≤ 11/12`.

### 11.2 Least character values under a zero-free half-plane

For a nonprincipal Dirichlet character `χ` modulo `q` define *leastNonOne* `χ` as the least `n ≥ 1` with
`χ(n) ∉ {0, 1}`; it is at most `q`.

- It is unchanged by passing to the primitive character on `n` prime to `q`, and is at least `2`.
- For a real `χ` and `n` below it, `χ(n) ∈ {0, 1}`.
- For the Legendre character modulo an odd prime `p`, it is `SieveApplications.leastNonresidue p`.

**Checks.**

- `χ` the character modulo `5` with `χ(2) = i`: the value is `2`.
- `χ = (·/7)`: `(2/7) = 1`, `(3/7) = −1`, so the value is `3`, the least nonresidue modulo `7`.
- `χ` modulo `12` induced by `(·/3)`: `χ(2) = χ(3) = χ(4) = 0`, `χ(5) = (5/3) = −1`, so the value is `5`;
  reading `0` as a value outside `{0, 1}` would give `2`.

Prove: for every `θ ∈ [1/2, 1)` there is `C_θ` such that for every `q ≥ 2` and every nonprincipal
`χ` modulo `q` whose `L`-function is zero-free right of `θ`, *leastNonOne* `χ ≤ C_θ (log q)^(1/(1−θ))`.
Prove the Hecke analogue: for a number field `K`, `θ ∈ [1/2, 1)` and a nontrivial finite-order Hecke
character `η` of `K` of conductor `𝔣` whose primitive `L`-function is zero-free right of `θ`, some prime
ideal `𝔭` with `η(𝔭) ∉ {0, 1}` has `N𝔭 ≤ C_{K,θ} (log N𝔣 + 2)^(1/(1−θ))`. Route: if `χ(n) ∈ {0, 1}` for
`n ≤ x`, compare the Weil formula (ZerosOfLFunctions §§8.4, 8.6) for `χ*` and for `ζ` (or `ζ_K`) with a
fixed nonnegative test supported in `[1/2, 1]` at scale `x`: the prime sides differ by
`O(log q log x)`, the zero side of `χ*` is `O(x^θ log q)` by the counts of §§4.4–4.5, the archimedean
term is `O(x^(1/2) log x)`, and the `ζ` side is `x φ̃(1)(1 + o(1))` (§8.5); so `x^(1−θ) ≪ log q`
(`lamzourilisound2015` Lemma 2.2 and Theorem 1.1, the case `θ = 1/2`).

*Needs:* ZerosOfLFunctions §§4.4–4.5, 8.4–8.6; Mathlib `DirichletCharacter.LFunction_changeLevel`.

### 11.3 The least quadratic nonresidue

Prove: there is an absolute `C` with `SieveApplications.leastNonresidue p ≤ C (log p)^12` for every odd
prime `p`; and for every `δ > 0`, `SieveApplications.leastNonresidue p ≪_δ p^δ`, Vinogradov's conjecture
in the form of `tao2015` Conjecture 1.1 (`openai2026quasiRH` Corollary 1.2, p. 7, with exponent `32` at
`7/8`). Route: §10.7 and §11.2 with `θ = 11/12` and the Legendre character, whose least value outside
`{0, 1}` is below `p` for large `p` and is then a nonresidue.

**Checks.**

- `θ = 1/2` in §11.2 gives exponent `2`, Ankeny's `O((log q)²)` under GRH.
- The route of `bimsissac2017` (Conjecture 6.3, Theorem 6.7, exponent `4/(1 − 2ϵ)`) needs the open strip
  `1/2 − ϵ < Re ρ < 1/2 + ϵ`; since §11.1 gives the closed strip `[1/12, 11/12]`, it takes `ϵ = 11/24` and
  gives exponent `48`, against `12` here; at `7/8` it takes `ϵ = 7/16` and gives `32`. Its proof also uses
  `ψ(x)`, which must be read through `ζ`, the character modulo `1`.
- `p = 7`: the least nonresidue is `3 ≤ C (log 7)^12` for any `C ≥ 1`.

### Examples

- `θ = 11/12`: `1/(1 − θ) = 12`; `θ = 7/8`: `8`.
- The zero strip at `θ = 11/12` contains the critical line.

### Dependencies

Layers 1, 5 and 10; ZerosOfLFunctions §§4.4–4.5, 8.4–8.6; SieveMethodsAndPrimePatterns §2.9; Mathlib
Dirichlet `L`-functions.

## Downstream consumers

- **QuasiRiemannHypothesisPartII**: the `7/8` half-plane by the compensated probe
  (`openai2026quasiRH` Sections 12–20), consuming Layers 1–10: the continuation principle and the late
  choice of height (§§1.3–1.4), the reflection (§9.2), the sieves (§§6.2, 6.5), the zero detector
  (§§7.2–7.4), the Poisson identity and principal correction (§10.3) and the `11/12` bound itself
  (§10.7), which enters through `κ = 2β* − 1 ≤ 5/6`; then the strip `1/8 ≤ Re ρ ≤ 7/8` (§11.1 at `θ = 7/8`),
  the exponent `8` in §11.3 and the Landau–Siegel constant `(log 3)/8`.
- **ExplicitPrimeCounting, Part II**: conditional bounds under a zero-free half-plane, now unconditional
  at `11/12` through §10.7.
- **AnalyticNumberTheoryPartI or AnalyticNumberTheoryPartIII, Part II**: `ψ(x) − x ≪ x^(11/12+ε)` and its
  fixed-modulus analogue, from §10.7 and the explicit formula.
- **ZerosOfLFunctions, Part II**: over `F`, power savings in ray-class prime counts and abelian
  Chebotarev, and the removal of the exceptional-zero alternative right of `11/12`.
- **SieveMethodsAndPrimePatterns** §2.9 and its successors: the bound on the least quadratic nonresidue
  (§11.3).
- **ExplicitMultiplicativeFunctions**: qualitative power savings `M(x) = O(x^(11/12+ε))`.
- The supplier blocks: Layer 6 (moments of `n`-th order twists, `bgl2014`; quadratic and sextic Hecke
  families over imaginary quadratic fields, `gaozhao2020`, `gaozhao2024`) and Layer 8 (the distribution
  of cubic Gauss sums, `dunnradziwill2024`).

## References

- `openai2026quasiRH` — OpenAI, *The Quasi-Riemann Hypothesis: A Zero-Free Half-Plane Re(s) > 7/8*,
  preprint of 30 September 2026, repository `openai/math` at revision `adc7f12`; §§1–11 (Part I),
  Theorem 3.1, Proposition 2.1, Lemmas 4.1–4.10, Proposition 5.1, Lemmas 5.2–5.8, Lemmas 6.1–6.2,
  Proposition 6.3, Lemma 7.1, Lemmas 8.1–8.2, Proposition 8.3, Lemma 9.1, Proposition 9.2, §10,
  Lemma 11.1, Propositions 11.2–11.3, Corollary 1.2.
- `openai2026quasiRHalt` — OpenAI, *The Quasi-Riemann Hypothesis*, preprint of 5 October 2026, same
  repository; Theorem 1.1, Proposition 3.1 and Section 3.
- `liu2026improved` — B. Liu, *Improved zero-free half-planes for the quasi-Riemann hypothesis*,
  arXiv:2610.12234v2; Part I, §§3–6.
- `kubota1969` — T. Kubota, *On automorphic functions and the reciprocity law in a number field*,
  Lectures in Mathematics, Kyoto University 2 (1969); §§3, 5, 6.
- `kubota1968` — T. Kubota, *Über diskontinuierliche Gruppen Picardschen Typus und zugehörige
  Eisensteinsche Reihen*, Nagoya Math. J. 32 (1968), 259–271; §§2–4.
- `patterson1977` — S. J. Patterson, *A cubic analogue of the theta series*, J. Reine Angew. Math. 296
  (1977), 125–161; §§2–3, 6–9, Table III.
- `dunnradziwill2024` — A. Dunn, M. Radziwiłł, *Bias in cubic Gauss sums: Patterson's conjecture*,
  Ann. of Math. 200 (2024); (1.4)–(1.8), §5.1, Appendix A (arXiv v3 numbering).
- `kazhdanpatterson1984` — D. A. Kazhdan, S. J. Patterson, *Metaplectic forms*, Publ. Math. IHÉS 59
  (1984); Introduction, p. 36 (theta coefficients known only for `GL_r` with `r ∈ {n − 1, n}`).
- `yoshimoto1987` — A. Yoshimoto, *On the cubic theta function*, Nagoya Math. J. 105 (1987).
- `goldmakherlouvel2013` — L. Goldmakher, B. Louvel, *A quadratic large sieve inequality over number
  fields*, Math. Proc. Cambridge Philos. Soc. 154 (2013); Definition 1, Theorem 1.1, Corollary 1.2.
- `bgl2014` — V. Blomer, L. Goldmakher, B. Louvel, *L-functions with n-th-order twists*, IMRN 2014;
  Theorem 1.3, Lemmas 2.1–2.3, §3, Appendix II.
- `heathbrown2000` — D. R. Heath-Brown, *Kummer's conjecture for cubic Gauss sums*, Israel J. Math. 120
  (2000); Theorem 2.
- `baierbansal2018` — S. Baier, A. Bansal, *The large sieve with power moduli for ℤ[i]*, IJNT 14 (2018);
  §3, Theorem 3.
- `gaozhao2024` — P. Gao, L. Zhao, *Moments and one level density of sextic Hecke L-functions of ℚ(ω)*,
  Funct. Approx. 70 (2024); Lemma 2.9.
- `gaozhao2020` — P. Gao, L. Zhao, *Moments of quadratic Hecke L-functions of imaginary quadratic number
  fields*, J. Number Theory 209 (2020); (1.1).
- `maynardpratt2024` — J. Maynard, K. Pratt, *Half-isolated zeros and zero-density estimates*, IMRN 2024;
  Appendix C.
- `guthmaynard2026` — L. Guth, J. Maynard, *New large value estimates for Dirichlet polynomials*, Ann. of
  Math. 203 (2026); §13.1.
- `milnecft2020` — J. S. Milne, *Class Field Theory*, v4.03 (2020); Chapter VIII, 5.3 and 5.5, p. 245.
- `lamzourilisound2015` — Y. Lamzouri, X. Li, K. Soundararajan, *Conditional bounds for the least
  quadratic non-residue and related problems*, Math. Comp. 84 (2015); Lemma 2.2, Theorem 1.1.
- `tao2015` — T. Tao, *The Elliott–Halberstam conjecture implies the Vinogradov least quadratic
  nonresidue conjecture*, Algebra Number Theory 9 (2015); Conjecture 1.1.
- `bimsissac2017` — V. Bhargava, G. Ivanyos, R. Mittal, N. Saxena, *Irreducibility and deterministic r-th
  root finding over finite fields*, ISSAC 2017 (arXiv v1); Conjecture 6.3, Theorem 6.7.
- `thornerzaman2019` — J. Thorner, A. Zaman, *A unified and improved Chebotarev density theorem*, Algebra
  Number Theory 13 (2019); Theorem 1.1 (background: ZerosOfLFunctions §§8.7–8.8 supply what is used).
- `bcss2025` — K. Billington, M. Cheng, J. Schettler, A. I. Suriajaya, *The average number of Goldbach
  representations and zero-free regions of the Riemann zeta-function*, IJNT 21 (2025); §1 (the term).
- `quanta2026quasiRH` — Quanta Magazine, *AI Proved the Quasi-Riemann Hypothesis. What Happens Now?*,
  19 October 2026 (the reception of the two preprints).
