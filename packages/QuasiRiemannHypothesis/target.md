Verdict: design
Name: QuasiRiemannHypothesis
Base: none
Owner: none

# The quasi-Riemann hypothesis: zero-free half-planes `Re s > 11/12` and `Re s > 7/8` for Dirichlet `L`-functions and the finite-order Hecke `L`-functions of `ℚ(√−3)`

## Scope

**Why a new roadmap.** No roadmap on main, no open roadmap pull request, no board package and
neither pinned library states a zero-free half-plane `Re s > θ` with `θ < 1` for `ζ`, for
Dirichlet `L`-functions or for Hecke `L`-functions. The two roadmaps that name the result do so
only to leave it out:

- ExplicitPrimeCounting (main) declines, in its Scope, every bound that assumes `Re s > 7/8`;
- ExplicitMultiplicativeFunctions (#1946) records the preprint as context (key `openai2026quasiRH`)
  and changes no statement.

The zero-free regions that exist are of de la Vallée Poussin shape: ZerosOfLFunctions §§6.2–6.4
and AnalyticNumberTheoryPartIII §10.3. AnalyticNumberTheoryPartI §0.34 (Landau–Siegel exclusion,
also from an OpenAI preprint) is a different theorem with a different proof. The target does not
continue one existing roadmap in that roadmap's own direction. Its proof needs theories that no
roadmap plans: cubic metaplectic theta functions, large sieves over number fields, and zero
detection for Hecke `L`-functions. So it is a new roadmap, not a Part II.

**Status of the source.** The primary source `openai2026quasiRH` is unrefereed and machine-written.
It has 199 pages and is dated 30 September 2026. It sits in the authors' public repository, which
is Apache-2.0, at revision `adc7f12`; neither preprint folder has changed since that revision.
Four facts bear on the design:

- The repository's Lean catalogue (`lean/docs/003.md`) lists comparator statements, with only the
  standard axioms permitted, for the `7/8` half-plane for `riemannZeta`, for every
  `DirichletCharacter.LFunction` (principal pole excluded) and for a finite-order Hecke family
  over `CyclotomicField 3 ℚ`. The Lean library is reported to be large (the `DirichletL` folder
  alone is about 2,900 files). This job did not run it. It is evidence about the statements and
  not a supplier: it is neither pinned nor a roadmap.
- A second, shorter paper, `openai2026quasiRHalt` (5 October 2026, edited by a human, according to
  the repository), proves the `11/12` half-plane by another route. `quanta2026quasiRH` (19 October
  2026) reports three things about the papers:
  - number theorists have set the `7/8` paper aside and study the shorter `11/12` one intensely;
  - Sarnak will not call it a theorem until humans have checked every detail;
  - the `7/8` paper is formally verified in Lean and the `11/12` one not yet.
- `liu2026improved` (arXiv:2610.12234v2, Baiying Liu) varies the parameters `b`, `ℓ` and `κ` of the
  `7/8` argument and reports a slightly larger half-plane, about `Re s > 0.874957`, also
  formalised in Lean. Its Part I (§§1–14) summarises the `7/8` proof, and the design uses it as a
  second account when it reconstructs steps. The headline stays at `7/8`; an improved constant
  would be a later Part II.
- The filed rules for an unrefereed source are kept, as AnalyticNumberTheoryPartI §0.34 kept them.
  Every step is planned from the preprint's own statements, with exact locators. The README lists
  every step the design cannot reconstruct from the text and the cited literature. Such a step
  becomes a target only once it is resolved. Any step that rests on a numerical or machine
  computation becomes a named hypothesis of the theorem that uses it.

**What the roadmap owns.** Each part is stated at the generality the sources support. The
arrangement below follows the dependencies, and the design derives its own layers from the final
targets. Neither preprint's section order is the plan.

1. *Families of Euler products and the continuation principle.* T5, stated for an abstract family
   of meromorphic Euler products, and the late choice of height (`openai2026quasiRH` Lemma 11.1).
2. *Power residue symbols over a number field `K ⊇ μ_n`, at composite moduli.*
   - The fixed-numerator theorem: for nonzero `a`, the map `𝔟 ↦ (a/𝔟)_n` on ideals prime to `na`
     is a ray class character, with conductor supported on the primes above `na`
     (`openai2026quasiRH` Lemma 4.1 is the case `n = 6`, `K = ℚ(ω)`).
   - Over `ℤ[ω]`: cubic reciprocity for coprime composite primary elements; the supplements at
     `λ = √−3` and at `2`; quadratic reciprocity in bicharacter form; the sextic law
     (Lemma 4.4); the unit values (9.2).

   - *Proof of the fixed-numerator theorem.* It is Artin reciprocity for the Kummer extension
     `K(a^{1/n})/K`, through ClassicalArithmeticCompletion §1.34 (Frobenius acts on `n`-th roots
     by the symbol) and ClassFieldTheory Layer 13.
   - *Proof of the reciprocity laws over `ℤ[ω]`.* They are derived from ClassicalArithmeticCompletion
     §1.59 by evaluating the Hilbert symbols at the prime above 3 and at the archimedean place.
3. *Gauss sums of order `n` modulo ideals of `K ⊇ μ_n`.*
   - Twisted multiplicativity, the squarefree identities (4.7), the sign of `γ₂(p)³` fixed by the
     primary normalisation, and the quadratic Gauss sum `Γ(c)` with its bicharacter (Lemmas 4.2
     and 4.3).
   - The local sums at prime powers and the correlations (Lemmas 13.2–13.4), and masked primitive
     Poisson summation (Lemma 17.5).
   - The finite Fourier expansion of a function on a ray class group.
4. *Harmonic analysis on a lattice `Λ ⊂ ℝ^d` with smooth profiles on `(0, ∞)^d`.* Poisson
   summation on cosets of sublattices, the ideal count of `ℤ[ω]`, the Gaussian Mellin weight with
   transform `e^{s²}`, seminorm bounds for Fourier and Mellin kernels, and seminorm propagation
   along a recursion tree (Lemmas 4.5–4.7, 5.3, 5.4, 10.2, 17.3 and Corollary 17.4).
5. *Analytic inputs for Hecke `L`-functions of a number field.*
   - Logarithmic control inside a zero-free disk, uniform in the conductor (Lemma 4.9).
   - The deleted Euler factors (Lemma 4.10).
   - The Möbius function on ideals and the truncated reciprocal polynomials (4.2).
   - The base-change factorisation behind T6, for `K` abelian over `ℚ`.
6. *Large sieves over number fields.* The sextic instance over `ℤ[ω]` is Lemma 9.1. The block
   has four parts:
   - the additive large sieve for `δ`-separated points of `ℝ^d/Λ` (Lemma 6.1);
   - the quadratic large sieve over a number field (`goldmakherlouvel2013` Theorem 1.1). Its
     hypotheses are any number field `k`, a quadratic Hecke family in the sense of that paper's
     Definition 1, and squarefree ideals prime to the auxiliary modulus `c`;
   - the large sieve for `n`-th order characters (`bgl2014` Theorem 1.3). Its hypotheses are:
     - a number field containing `μ_n`, for the range of `n` the paper states. The extracted text
       is ambiguous between `n ≥ 3` and `n > 3`, and a footnote calls the quadratic bounds of
       `goldmakherlouvel2013` better at `n = 2`. The design reads the range from the PDF.
     - the primitive Fisher–Friedberg characters `χ_a` of that paper's Section 2, not the bare
       residue symbols;
     - squarefree ideals prime to `S`.

     The bound is `(MN)^ε(M + N + (MN)^{2/3})`. The instance used is `n = 6`.
   - the cubic large sieve over `ℤ[ω]` (`heathbrown2000` Theorem 2). The preprint applies it in
     (14.6) for Lemma 14.2. It is the `n = 3` case of the previous part if that part's range
     includes `n = 3`; otherwise it is planned as a part of its own.
7. *Zero detection for finite-order Hecke `L`-functions of any number field.* Buffered zero-free
   bins, pointwise dyadic bounds and the two saturated witnesses (Lemmas 8.1 and 8.2,
   Proposition 8.3).
8. *The cubic theta function of `ℚ(ω)` and the completed cubic reflection.* The theta input is
   placed as described under "Placement" below. The reflection itself (Proposition 5.1,
   Lemma 5.2, Corollary 14.1) is this roadmap's.
9. *The probe at `11/12`.* The low side (Proposition 6.3), the Poisson side and the principal
   signal (Lemma 7.1, (7.2), (10.2)), the Part I row envelope (Proposition 9.2), and the high side
   (Definition 10.1, Lemmas 10.3–10.6, Proposition 11.2), giving T1.
10. *The compensated probe at `7/8`.*
    - The prime slots and the compensated low side (Sections 12–15, Proposition 15.3).
    - The local compensation (Proposition 16.1, Lemma 16.2) and the moment inductions
      (Lemmas 17.1, 17.2, 17.6, 18.1–18.3).
    - The refined row counts (Lemma 19.1, Proposition 19.2), and the endpoint inequality and order
      of choices (Lemmas 20.1 and 20.2, Proposition 20.3), giving T2.
11. *Corollaries.* T3, T4 and T6, and the Checks against AnalyticNumberTheoryPartI §0.34.

**Placement of the inputs that no roadmap plans.** This placement is a decision, not a suggestion.
The filed inputs are labelled (U1)–(U8).

- (U3) composite Gauss sums, (U4) explicit reciprocity, (U5) zero detection, (U6) the smaller
  analytic items, (U7) the least-nonresidue implication and (U8) the preprint's own arguments are
  sections of this roadmap, in the general form stated above.
- (U2) large sieves over number fields and (U1) the cubic theta function are each a block of this
  roadmap with no dependence on blocks 8–11. They are kept separate so that they could be moved
  into roadmaps of their own without changing a statement.
  - The design's first task is to size both blocks. It records the size in the README.
  - If a human files either as a target before the design starts (suggested names
    `NumberFieldLargeSieves` and `KubotaCoversAndThetaFunctions`), the design consumes it instead.
- (U1) in general form is the `n`-fold Kubota cover of `GL₂` (and of `SL₂`) over a number field
  `K ⊇ μ_n`, which is totally imaginary when `n ≥ 3` (`kubota1969` §§1–3):
  - Kubota's symbol and cocycle;
  - Eisenstein series on the cover, with their continuation and functional equations
    (`kubota1969` §§5–6);
  - the theta function as a residue.

  The explicit Fourier coefficients are planned only where they are theorems: through cubic Gauss
  sums for `n = 3` (Patterson), and through quadratic Gauss sums for the classical `n = 2`. For
  `GL₂` with `n ≥ 4` the coefficients of the theta function are not known in general (the
  Kazhdan–Patterson uniqueness results cover `GL_r` with `r ∈ {n − 1, n}`). So the filed phrase
  "Fourier coefficients through `n`-th order Gauss sums" must not become a general-`n` target.
  - The instance consumed is the cubic theta function of `ℚ(ω)`, automorphic for
    `Γ₂ = ⟨SL₂(ℤ), Γ₁(3)⟩`, with its expansions at the three cusps.
  - The design settles whether those expansions follow from Patterson's theorem and the
    automorphy, or need further steps of `dunnradziwill2024` §5.
  - The hyperbolic three-space, the Bianchi groups and the `K`-Bessel function are consumed (see
    Suppliers). Continuation of Eisenstein series on a nonlinear cover is not supplied by
    AutomorphicSpectralTheory (linear groups only) or by MetaplecticAutomorphicForms (double
    covers of symplectic groups only), so it belongs to the (U1) block.

**Boundaries (not owned here).**

- Dirichlet and finite-order Hecke `L`-functions, their continuation and functional equations, the
  Euler correction for imprimitive characters and nonvanishing on `Re s = 1`: LFunctions Layers
  4, 5 and 7, read through Mathlib `DirichletCharacter.LFunction` and Tau Ceti
  `TauCeti.LFunctions.heckeLFunctionC`.
- Strip bounds, zero counts in unit windows, the prime ideal theorem, counting in a ray class and
  abelian Chebotarev: ZerosOfLFunctions §§3.4, 4.4–4.5, 8.5, 8.7 and 8.8. The Thorner–Zaman
  theorem is not a new input, because only a fixed abelian extension is needed.
- The `n`-th power residue symbol at primes and ideals, Euler's criterion, Hilbert symbols,
  the product formula, the general power reciprocity law, prime cubic reciprocity, the supplement
  at `1 − ω` and primary Eisenstein integers: ClassicalArithmeticCompletion Layer 1 and Tau Ceti
  `Ideal.powerResidueSymbolIdeal`. Gauss and Jacobi sums at primes: CharacterSumsOverFiniteFields
  Layers 1–2.
- The large sieves over `ℚ`: SieveMethodsAndPrimePatterns §§2.2, 2.3, 2.7 and 2.9, and
  AnalyticNumberTheoryPartII §5.29. These are templates, not restated.
- The definition of the least quadratic nonresidue: SieveMethodsAndPrimePatterns §2.9
  (`SieveApplications.leastNonresidue`).
- GRH as a statement: AnalyticNumberTheoryPartI §1.6.
- The uniform exclusion of Landau–Siegel zeros: AnalyticNumberTheoryPartI §0.34. Here it is only a
  Check that T2 implies the bound with the explicit constant `(log 3)/8`.
- Every consequence for prime counting:
  - `ψ(x) − x ≪ x^{7/8+ε}`;
  - power savings in ray classes and in abelian Chebotarev over `ℚ(√−3)`;
  - `N(σ, T, χ) = 0` for `σ > 7/8`.

  These belong to later Part IIs of their owners (see Consumers). The preprint does not draw them.
- The algorithmic clause of Corollary 1.2 (deterministic square roots modulo `p`) is prose only,
  with no target.

**Changes from the filed wording.**

1. *T4 is generalised to a conditional theorem.* The general statement is planned: let `χ` be a
   nonprincipal Dirichlet character modulo `q` with no zero of `L(s, χ)` in `Re s > θ`, `θ < 1`.
   Then the least `n` with `χ(n) ∉ {0, 1}` is at most `C_θ (log q)^{A_θ}`. It is proved by the
   smoothed explicit formula and the zero counts of ZerosOfLFunctions §§4.4–4.5, the
   quasi-Riemann version of Ankeny's argument.
   - The design is expected to obtain any `A_θ > 1/(1 − θ)`; it fixes the exponent it proves.
   - The instance `θ = 7/8` with the quadratic character modulo `p` gives Corollary 1.2.
   - The route through `bimsissac2017` (Conjecture 6.3 and Theorem 6.7) becomes a Check. Its
     hypothesis must first be compared with the paper (filed item U7). The same argument also gives
     the Hecke analogue (the least norm of a prime ideal with `η(𝔭) ≠ 1`), and the design states
     it if no new input is needed.
2. *T6 is generalised from `ℚ(√−3)` to an abelian number field `K`.* For a Dirichlet character
   `χ`, `L_K(s, χ ∘ N_{K/ℚ})` equals `∏_ψ L(s, χψ)`, over the Dirichlet characters `ψ` of `K`, up to
   Euler factors at the primes dividing `q d_K`. This gives the transfer. For a non-abelian `K` the
   second factor is an Artin `L`-function whose holomorphy is not known, so abelian is the natural
   limit. The value `L(1, χ₋₃) = π/(3√3)` becomes a Check: only `L(1, χ) ≠ 0` is needed (Mathlib
   `DirichletCharacter.LFunction_apply_one_ne_zero`).
3. *T3 also covers the primitive Hecke characters of `ℚ(√−3)`.* Their functional equation
   (LFunctions Layer 5) gives the same strip.
4. *Zeros are counted by meromorphic order.* "No zero" means `meromorphicOrderAt L s ≤ 0`, as in
   ZerosOfLFunctions' Suggested.lean. The pole at `s = 1` is then allowed without a special clause,
   and a function with no continuation (which the totalised carrier makes `0`) cannot satisfy the
   statement vacuously. For `ζ` and `DirichletCharacter.LFunction` the filed form "`≠ 0`, with
   `(χ, s) ≠ (1, 1)`" is equivalent and may be used.
5. *Kept as filed:*
   - the abstract form of T5;
   - the general `n` in (U2)–(U4);
   - the zero detector for an arbitrary number field;
   - the lattice form of Layer D;
   - Part I (`11/12`) as the first milestone.

   (U1) is generalised only as far as the theory exists (see Placement).

**Conventions the design fixes.**

- *Primary elements.* The preprint calls `c` primary when `c ≡ 1 mod 3`.
  ClassicalArithmeticCompletion §1.12 and Tau Ceti `IsPrimaryEisenstein` use `≡ 2 mod 3`. The two
  agree for the cubic symbol and differ for the quadratic and sextic symbols, so the design fixes
  one convention and proves the translation.
- *The additive character and measure on `ℚ(ω)`.* These are `e(z) = exp(2πi Tr(z/λ))` and the
  self-dual measure, for which `ℤ[ω]` has covolume one.
- *The model of the field.* Choose `CyclotomicField 3 ℚ` or a quadratic field of discriminant
  `−3`, together with its `RayClassCharacter`/`Modulus` carriers.
- *The Suggested.lean imports.* `Suggested.lean` imports `Mathlib` once, together with the Tau Ceti
  modules of these carriers.

## Final targets

Locators are to `openai2026quasiRH` (section, statement and equation numbers of the
revision `adc7f12` text) unless another key is named. Every statement is to be written in the
design's own words.

**T1 (the `11/12` half-plane; Theorem 3.1).**

- *Hecke characters of `ℚ(√−3)`.* Let `F = ℚ(√−3)` and let `η` be a ray class character of `F`
  for any modulus, primitive or not. Then the continued `L`-function of `η` (Tau Ceti
  `heckeLFunctionC η` at the presentation modulus) has no zero with `Re s > 11/12`.
- *Dirichlet characters.* For every `q ≥ 1` and every Dirichlet character `χ` modulo `q`,
  including the character modulo 1 whose `L`-function is `ζ`, `L(s, χ)` has no zero with
  `Re s > 11/12`.
- In both cases the pole at `s = 1` of a character induced from the trivial one is allowed, and
  nothing is asserted on `Re s = 11/12`.
- *Proof.* T5 with `σ₀ = 11/12` and `C(s) = s − 2/3` (so `C(σ₀) = 1/4`), and the balanced high and
  low estimates (Propositions 6.3 and 11.2, the latter with saving `1/4800`). These give the
  statement for primitive Hecke characters of `F`; T6 gives the rest.
- *Alternative route.* `openai2026quasiRHalt` (49 pages) proves T1 differently. T2 uses only the
  statement `β* ≤ 11/12` (through `κ = 2β* − 1 ≤ 5/6` in (12.1)), so any complete proof of T1
  serves.
  - *How it argues.* A mean-square bound for sextic-twisted Möbius sums over `ℤ[ω]` (its
    Proposition 3.1, proved by the recursion of its Propositions 5.1–5.2) gives
    `Σ μ(n)ν(n)W(N n/D) ≪ D^{11/12+ε}` after amplification by primes. A Littlewood-type Mellin
    argument then excludes zeros (its Section 3).
  - *What it needs.* Its inputs are:
    - the cubic theta function, in the normalisation of `dunnradziwill2024` §5.1 with
      `patterson1977` Theorem 8.1 and `yoshimoto1987`;
    - the quadratic large sieve of `goldmakherlouvel2013` (Theorem 1.1, Corollary 1.2);
    - two Poisson identities (its Lemma 7.2 and Section 4).
  - *What it does not use.* It states no zero detector. It says it avoids the extra
    `(MN)^{2/3}` term of `bgl2014` Theorem 1.3. It uses no continuation principle with an `H_η`.
  - *For the design.* The design compares the two routes for the `11/12` milestone. The criteria
    are the inputs each needs (the second route would postpone (U5), the `n`-th order large sieve
    and T5 to the `7/8` stage), what the `7/8` stage can reuse, and expert attention (Scope). The
    design records its choice. The general form of the Möbius-sum criterion is: a bound
    `≪ D^{θ+ε}` for the smoothed `μ·η` sums of an Euler product rules out zeros in `Re s > θ`.
    It is a sibling of T5 and is stated for the same abstract family if that route is taken.

**T2 (the `7/8` half-plane; Theorem 1.1).**

- The statement of T1 holds with `7/8` in place of `11/12`.
- *Instances.*
  - Every zero of `ζ` with `0 < Re s < 1` has `Re s ≤ 7/8`.
  - No Dirichlet `L`-function has a real zero in `(7/8, 1)`.
- *Proof.* T5 with `σ₀ = 7/8` and `C(s) = s − 11/16` (`C(σ₀) = 3/16`), the compensated low
  estimate (Proposition 15.3), and the order of choices (Proposition 20.3). T1 enters through the
  parameter ranges of Lemma 18.1, Lemma 20.2 and Proposition 20.3.
- *Check (Landau–Siegel).* For a real primitive `χ` of conductor `q ≥ 3`, every real zero `β`
  satisfies `(1 − β) log q ≥ (log 3)/8`. This is consistent with AnalyticNumberTheoryPartI §0.34,
  which keeps its own proof.

**T3 (the zero strip; first step of the proof of Corollary 1.2).** Let `χ` be a primitive
Dirichlet character (including the character modulo 1), or a primitive finite-order Hecke
character of `F`. Every zero `ρ` of its `L`-function with `Re ρ > 0` satisfies
`1/8 ≤ Re ρ ≤ 7/8`. The proof is T2 and the functional equation (`ρ ↦ 1 − ρ̄` on the dual
character): Mathlib's completed Dirichlet `L`-function, and LFunctions Layer 5 for `F`. The
hypothesis `Re ρ > 0` removes exactly the trivial zeros (Mathlib
`DirichletCharacter.LFunction_eq_zero_iff_of_re_nonpos` for the Dirichlet case).

**T4 (least nonresidues; Corollary 1.2).**

- *(a) General conditional theorem.* For `θ ∈ [1/2, 1)` there are `C_θ` and `A_θ` with the
  following property. If `χ` is a nonprincipal Dirichlet character modulo `q ≥ 2` and `L(s, χ)`
  has no zero with `Re s > θ`, then some positive `n ≤ C_θ (log q)^{A_θ}` has `χ(n) ∉ {0, 1}`.
- *(b) Instance.* There are absolute constants `A, C > 0` such that
  `n(p) ≤ C (log p)^A` for every odd prime `p`. Here `n(p)` is
  `SieveApplications.leastNonresidue p`, and the instance is (a) with `θ = 7/8` and T2.
- *(c) Corollary.* For every `δ > 0`, `n(p) ≪_δ p^δ`. This is Vinogradov's conjecture in the form
  of `tao2015` Conjecture 1.1.
- *Check (the preprint's route).* `bimsissac2017` (arXiv v1, which has the same numbering as the
  preprint's citation) states its Conjecture 6.3 for the characters of `𝔽_p^*`: every nontrivial
  zero lies in `1/2 − ϵ < Re s < 1/2 + ϵ`. Its Theorem 6.7 gives `n(p, r) = O((log p)^{4/(1−2ϵ)})`.
  - With `ϵ = 7/16`, T3 supplies the hypothesis and the exponent is `32`, as the preprint says.
  - T3 covers the nonprincipal characters modulo `p`.
  - The proof of Theorem 6.7 also uses the principal character, through `ψ(x)` (their Lemma 6.6(2)).
    That character must be read as `ζ`, which T3 covers as the character modulo 1. The principal
    character modulo `p` itself has zeros on `Re s = 0` from the factor `1 − p^{−s}`.
  - (a) gives a better exponent: any `A > 1/(1 − θ)`, so about `8` at `θ = 7/8`. This is why (a),
    not the Check, is the planned route.
- The algorithmic clause is prose only.

**T5 (the continuation principle; Proposition 2.1, β* from (2.1)).** The setting is an abstract
family `{L_η}` of functions meromorphic on `Re s > 1/2` and given by Euler products absolutely
convergent on `Re s > 1`. For each `η` and each finite set `S`, the deleted function `L^S_η`
differs from `L_η` by a factor that is holomorphic and zero-free on `Re s > 0`. Let `β*` be the
supremum of `1/2` and of the real parts of the zeros of the family in `1/2 ≤ Re s ≤ 1`.

The hypotheses are the following.

- Fix `σ₀ ∈ (1/2, 1)` with `Δ₀ = β* − σ₀ > 0`, and `C(s) = s + c` with `c` real.
- Let `ω ∈ (0, Δ₀)` and `σ > 0` be independent of `η`.
- For every `η` there are a finite set `S` and a function `H_η`, holomorphic on `Re s > σ₀`, with
  `|H_η − 1| ≤ 1/2` there.
- For every `η` there is a function `J_η(Z)` of large real `Z` with `|J_η(Z)| ≪_η Z^{C(σ₀)+ω}` and
  `|J_η(Z) − f_η(Z)| ≪_η Z^{C(β*)−σ}`. Here `f_η(Z)` is `(2πi)^{−1}` times the integral over
  `Re s = 2` of `Z^{C(s)} e^{(s−5/6)²} H_η(s)/L^S_η(s)`.
- The constants, thresholds, `S` and `H_η` may depend on `η`.

Then `β* ≤ σ₀`. The finite-order Hecke family of `F` is the instance used twice:
`(σ₀, C) = (11/12, s − 2/3)` and `(7/8, s − 11/16)`. The companion is the late choice of height,
Lemma 11.1: a comparison with error `Z^{C(β*)−m}(1 + T₁)^{A_η} + Z^{B_η}T₁^{−N}` for every `N`, at
`T₁ = Z^τ`, yields the saving `m/2` once `τ` and `N` are chosen after `η`. The proof uses only
Mellin and Fourier analysis on vertical lines, the identity theorem and the lower bound
`|H_η| ≥ 1/2`.

**T6 (the transfer to Dirichlet `L`-functions; Proposition 11.3, (11.2)).** Let `K` be a number
field abelian over `ℚ` and `σ₀ ∈ [1/2, 1)`. Suppose every primitive finite-order Hecke
`L`-function of `K` has no zero in `Re s > σ₀`, poles allowed. Then:

- every finite-order Hecke `L`-function of `K`, at any presentation, has none;
- every Dirichlet `L`-function has none.

The inputs are three:

- the factorisation `L_K(s, χ ∘ N) = ∏_ψ L(s, χψ)` up to Euler factors at the primes dividing
  `q d_K`;
- the deleted Euler factors do not vanish on `Re s > 0`;
- `L(1, χ) ≠ 0` for nonprincipal `χ`.

The instance is `K = ℚ(√−3)`, where the product is `L(s, χ)L(s, χχ₋₃)` and `d_K = −3`. The value
`L(1, χ₋₃) = π/(3√3)` that the preprint quotes is a Check (the class number formula for
`ℚ(√−3)`, with `h = 1` and `w = 6`), not an input.

**Intermediate targets.** These are the preprint's own results. Each becomes a target with its
exact hypotheses and locator, once the design has reconstructed it.

- *The reflection.*
  - The completed cubic reflection, Proposition 5.1, with Lemma 5.2.
  - The marked reflection, Corollary 14.1.
- *Large sieves and zero detection.*
  - The sextic large sieve, Lemma 9.1.
  - The quadratic reduction, Lemma 5.5, and the quadratic–cubic norm, Lemma 14.2.
  - The two saturated witnesses, Proposition 8.3.
- *The `11/12` stage.*
  - The balanced low estimate, Proposition 6.3: `I_η(Z^{1/2}, Z^{1/2}, Z) ≪ Z^{1/4+ϵ}`, with an
    exponent independent of `η`.
  - The complete local identity, Lemma 7.1, and the positivity (7.2).
  - The Part I row envelope, Proposition 9.2, with `R(δ) = min{1, max{1 − δ/2, 4/3 − δ}}`.
  - The balanced high estimate, Proposition 11.2.
- *The `7/8` stage.*
  - The compensated low estimate, Proposition 15.3 (`Z^{3/16+ϵ}`).
  - The marked inverse moment, Lemma 17.1.
  - Sixth-power amplification, Lemma 17.6.
  - The fourth moment with short prime factors, Lemma 18.1.
  - The refined row counts, Proposition 19.2.
  - The endpoint inequality, Lemma 20.2: `−E* ≥ 49/440640` on `0 ≤ δ ≤ 5/6`, `0 ≤ x ≤ 1/2`, proved
    by the polynomial identity (20.9).
  - The order of choices, Proposition 20.3.
- *The rational inequalities.* The filed first reading found no machine computation: the saving
  `1/4800`, the margin table of Section 11, Lemma 20.2, and the margins of §20.5 and
  Proposition 20.3 are closed-form rational inequalities. The design confirms this line by line.
  Any inequality it cannot verify by hand becomes a named hypothesis.

## Suppliers

All are on main unless a pull request is named. Merge-order lines are those of
`merge-order/ORDER.txt`. This roadmap goes after the latest of them, AnalyticNumberTheoryPartIII
(line 295).

| Roadmap | Sections | Used for |
| --- | --- | --- |
| GlobalNumberFields (Completed) | Layers 2, 9 | ray class groups, Hecke and ray class characters, conductors, primitivity |
| LFunctions (line 30) | Layers 4, 5, 7 | Dirichlet and finite-order Hecke `L`-functions, continuation, functional equation with root number of modulus one, Euler correction, nonvanishing on `Re s = 1` |
| ZerosOfLFunctions (line 52) | §§3.4, 4.4–4.5, 6.4, 8.5, 8.7, 8.8 | strip bound (E2), zero counts (T4, J), prime ideal theorem, ray-class prime counts (Lemma 13.1, (9.11)), abelian Chebotarev (nontriviality of `χ_•(u)`, Section 10.1) |
| AnalyticNumberTheoryPartI (line 54) | §§1.6, 1.7, 2.3a, 2.7, 2.18a, 2.21, 2.25; §0.34 as pattern and Check | GRH predicate shape, Hecke continuation, quadratic factorisation, Artin induction (T6 route), convexity comparison for (E2) |
| AnalyticNumberTheoryPartII (line 55) | §5.29 | the template for the quadratic large sieve |
| SieveMethodsAndPrimePatterns (line 62) | §§2.2, 2.3, 2.7, 2.9 | additive and character large sieves over `ℚ` as templates, `SieveApplications.leastNonresidue` (T4) |
| AnalyticNumberTheoryPartIII (line 295) | §§8.1–8.3, Layer 9, §10.3 | rectangle residues, Borel–Carathéodory, Landau's local lemma (for (E3)), Mellin smoothing |
| ClassicalArithmeticCompletion | §§1.12, 1.23, 1.33, 1.34, 1.38, 1.41, 1.52, 1.59, 1.60, 1.70, 1.72, 1.75 | primary Eisenstein integers, `n`-th power residue symbol, Euler's criterion, Hilbert symbols, product formula, general power reciprocity, cubic Gauss sum at primes, cubic reciprocity and its supplement |
| ClassFieldTheory | Layers 5, 11, 13 | local Hilbert symbol, Artin reciprocity, ray class fields (the ray-group statement of B1) |
| ThetaSeries | Layer 1 | Poisson summation for a full-rank lattice with its dual |
| CharacterSumsOverFiniteFields (#1712, line 171) | Layers 1–2 (incl. §1.5), Layer 7 | Gauss and Jacobi sums at primes, small orders; composite moduli over `ℤ` as a template |
| MetaplecticAutomorphicForms (#1063, line 162) | conventions only | adelic covering-group conventions reused by the (U1) block where they apply |
| BianchiModularForms (#1719, line 211) | Layer 0, §§2.1, 2.4 | Bianchi congruence groups, cusps, slash action and Fourier–Bessel expansions on `ℍ³` (the (U1) block) |
| AutomorphicFormsOnReductiveGroups (line 66) | §4.5 | the `K`-Bessel function and Maass-form expansions |
| AutomorphicSpectralTheory (#925, line 104) | §§1.15a–1.15c | the continuation route for Eisenstein series, adapted by the (U1) block to the Kubota cover |

**From the libraries.**

- Mathlib: `riemannZeta`, `DirichletCharacter.LFunction`,
  `DirichletCharacter.LFunction_ne_zero_of_one_le_re`,
  `DirichletCharacter.LFunction_apply_one_ne_zero`,
  `DirichletCharacter.LFunction_eq_zero_iff_of_re_nonpos`, `mellin`/`mellinInv`, `jacobiSym`,
  `meromorphicOrderAt`.
- Tau Ceti:
  - `TauCeti.LFunctions.heckeLFunctionC`, `heckeLFunctionC_eq_primitive` and
    `PrimitiveRayClassCharacter`;
  - `RayClassCharacter.eulerCorrection` and `eulerCorrection_ne_zero`;
  - `Ideal.powerResidueSymbol`, `Ideal.powerResidueSymbolIdeal` and
    `IsPrimaryEisenstein.cubic_reciprocity` (prime moduli only).

## Consumers

Each consumer comes later in the merge order, as a Part II of its owner where the owner is on main
or earlier.

- *A Part II of ExplicitPrimeCounting.* The conditional bounds under `Re s > 7/8` that its Scope and
  §3.6 decline, with the unrefereed status visible through the dependency.
- *A Part II of AnalyticNumberTheoryPartI or AnalyticNumberTheoryPartIII.* Unconditional
  `ψ(x) − x ≪ x^{7/8+ε}` and its fixed-modulus analogue, by the §1.9 argument.
- *A Part II of ZerosOfLFunctions.* Over `ℚ(√−3)`: power savings in ray-class prime counts and
  abelian Chebotarev (§§8.7–8.8), and removal of the exceptional-zero alternative (§6.4) to the
  right of `7/8`.
- *SieveMethodsAndPrimePatterns §2.9 and its successors.* The bound on `n(p)`.
- *ExplicitMultiplicativeFunctions (#1946).* Qualitative power savings, `M(x) = O(x^{7/8+ε})`.
- *The (U1)–(U3) blocks.* Their consumers outside this roadmap:
  - the distribution of cubic Gauss sums (Heath-Brown–Patterson; `dunnradziwill2024`);
  - nonvanishing in cubic Hecke families;
  - moments of `n`-th order twists (`bgl2014`);
  - quadratic and sextic Hecke families over imaginary quadratic fields (`gaozhao2020`,
    `gaozhao2024`).

## Sources

Recorded in `packages/QuasiRiemannHypothesis/sources.toml`. Every work in the table was fetched
through the sources service from a legal open copy and read. Locators of works read as arXiv
versions are those versions' numbering.
No text is missing, so there is no `needs-references.toml`.

| Key | Work | Status | Used for |
| --- | --- | --- | --- |
| `openai2026quasiRH` | OpenAI, *The Quasi-Riemann Hypothesis: A Zero-Free Half-Plane Re s > 7/8*, preprint dated 30 September 2026, repository `openai/math` (Apache-2.0) at revision `adc7f12`; unrefereed; text recognised by OCR | certified (author-page) | T1–T6 and every intermediate target |
| `openai2026quasiRHalt` | OpenAI, *The Quasi-Riemann Hypothesis*, preprint dated 5 October 2026 (alternate proof of the `11/12` half-plane), same revision; unrefereed | certified (author-page) | T1, route comparison |
| `liu2026improved` | B. Liu, *Improved zero-free half-planes for the quasi-Riemann hypothesis*, arXiv:2610.12234v2 | certified | Scope (status), second account of the `7/8` proof |
| `dunnradziwill2024` | A. Dunn, M. Radziwiłł, *Bias in cubic Gauss sums: Patterson's conjecture*, Ann. of Math. 200 (2024); read as arXiv:2109.07463v3 | certified | (U1) block: §5, Lemma 5.3, Appendix A; (1.4)–(1.5) for the cubic laws |
| `patterson1977` | S. J. Patterson, *A cubic analogue of the theta series*, J. Reine Angew. Math. 296 (1977), 125–161 (GDZ) | certified (GDZ scan, OCR) | (U1) block: Theorem 8.1, §§7–8 |
| `kubota1969` | T. Kubota, *On automorphic functions and the reciprocity law in a number field*, Lectures in Mathematics, Kyoto University 2 (1969) (Kyoto University repository) | certified (institutional) | (U1) block: §§1–3 (the cover), §§5–6 (Eisenstein series) |
| `kazhdanpatterson1984` | D. A. Kazhdan, S. J. Patterson, *Metaplectic forms*, Publ. Math. IHÉS 59 (1984), 35–142 (Numdam) | certified | (U1) generality limit: Introduction p. 36 and §I.3 (unique Whittaker models only for `r ∈ {n − 1, n}`) |
| `yoshimoto1987` | A. Yoshimoto, *On the cubic theta function*, Nagoya Math. J. 105 (1987), 153–167 | certified (publisher-open) | T1 alternative route; (U1) block |
| `goldmakherlouvel2013` | L. Goldmakher, B. Louvel, *A quadratic large sieve inequality over number fields*, Math. Proc. Cambridge Philos. Soc. 154 (2013); read as arXiv:1112.1642v2 | certified | (U2) block: Definition 1, Theorem 1.1, Corollary 1.2 |
| `bgl2014` | V. Blomer, L. Goldmakher, B. Louvel, *L-functions with n-th-order twists*, IMRN 2014; read as arXiv:1112.1650v1 | certified | (U2) block: Theorem 1.3, §2 (the characters `χ_a`), §3 (Lemmas 3.1–3.5) |
| `heathbrown2000` | D. R. Heath-Brown, *Kummer's conjecture for cubic Gauss sums*, Israel J. Math. 120 (2000); read from the Oxford University Research Archive copy | certified (institutional) | (U2) block: Theorem 2, the cubic large sieve over `ℤ[ω]`, used in (14.6) for Lemma 14.2 |
| `baierbansal2018` | S. Baier, A. Bansal, *The large sieve with power moduli for ℤ[i]*, IJNT 14 (2018); read as arXiv:1802.08964v2 | certified | (U2) block: §3, Theorem 3 (additive large sieve by Poisson) |
| `gaozhao2020` | P. Gao, L. Zhao, *Moments of quadratic Hecke L-functions of imaginary quadratic number fields*, J. Number Theory 209 (2020); read as arXiv:1707.00091v3 | certified | (1.1): the functional equation over `ℚ(√−3)`, compared with LFunctions Layer 5 |
| `gaozhao2024` | P. Gao, L. Zhao, *Moments and one level density of sextic Hecke L-functions*, Funct. Approx. 70 (2024); read as arXiv:2201.01885v2 | certified | Lemma 2.9: the sextic large sieve over `ℤ[ω]`, compared with Lemma 9.1 |
| `maynardpratt2024` | J. Maynard, K. Pratt, *Half-isolated zeros and zero-density estimates*, IMRN 2024; read as arXiv:2206.11729v2 | certified | (U5): Appendix C |
| `guthmaynard2026` | L. Guth, J. Maynard, *New large value estimates for Dirichlet polynomials*, Ann. of Math. 203 (2026); read as arXiv:2405.20552v2 | certified | (U5): §13.1 |
| `thornerzaman2019` | J. Thorner, A. Zaman, *A unified and improved Chebotarev density theorem*, Algebra Number Theory 13 (2019); read as arXiv:1803.02823v3 | certified | context for Lemma 13.1; ZerosOfLFunctions §§8.7–8.8 supply it |
| `bimsissac2017` | V. Bhargava, G. Ivanyos, R. Mittal, N. Saxena, *Irreducibility and deterministic r-th root finding over finite fields*, ISSAC 2017; read as arXiv:1702.00558v1 | certified | T4 Check: Conjecture 6.3, Lemma 6.6, Theorem 6.7 |
| `lamzourilisound2015` | Y. Lamzouri, X. Li, K. Soundararajan, *Conditional bounds for the least quadratic non-residue and related problems*, Math. Comp. 84 (2015); read as arXiv:1309.3595v3 | certified | T4(a): the smoothed explicit-formula template |
| `tao2015` | T. Tao, *The Elliott–Halberstam conjecture implies the Vinogradov least quadratic nonresidue conjecture*, Algebra Number Theory 9 (2015); read as arXiv:1410.7073v3 | certified | T4(c): Conjecture 1.1 (statement only) |
| `quanta2026quasiRH` | Quanta Magazine, *AI Proved the Quasi-Riemann Hypothesis. What Happens Now?*, 19 October 2026 | certified (publisher-open) | Scope (status of the source): context only |
| `bcss2025` | K. Billington, M. Cheng, J. Schettler, A. I. Suriajaya, *The average number of Goldbach representations and zero-free regions of the Riemann zeta-function*, IJNT 21 (2025); read as arXiv:2306.09102v2 | certified | Scope: the term "quasi-Riemann hypothesis" |
| `milnecft2020` | J. S. Milne, *Class Field Theory*, course notes v4.03 (2020), author's site | certified | (U4): Chapter VI §1, Chapter VIII (5.3) and (5.5) |

**Not cited.** The filed list also had the following works:

- Heath-Brown 1995 (Acta Arith.) and Huxley 1968 (Mathematika). They are only templates.
  AnalyticNumberTheoryPartII §5.29 owns the quadratic large sieve over `ℚ`, and
  `baierbansal2018` and the preprint's Lemma 6.1 cover the additive large sieve.
- Galbraith's book, which concerns the algorithm only and has no target.

The design adds any of them if a step needs it.

## Risks

1. **Correctness of an unrefereed, machine-written proof.** The headline is far beyond the
   published state of the art. Three things mitigate the risk:
   - the reported Lean verification of the three final statements;
   - expert study of the `11/12` paper, under way (`quanta2026quasiRH`);
   - a refinement by a human author (`liu2026improved`), which re-derives the argument's parameter
     system and reports its own Lean formalisation.

   None of these is a referee's report, and this job did not run the Lean proof. The roadmap
   therefore keeps the unrefereed-source rules (Scope). Each preprint-specific step is a target
   only once reconstructed. The general blocks (power reciprocity at composite moduli, Gauss sums
   modulo ideals, number-field large sieves, zero detection, the Kubota cover) keep their value
   whatever happens to the headline.
2. **Size.** The source has 199 pages. The two moment inductions take 66 pages and the reflection
   21. The supplier theory below it is of roadmap size: the Kubota cover with its Eisenstein
   series and theta function over `ℍ³`, and the `n`-th order large sieve.
   - If the README exceeds what one roadmap can hold, the split points are fixed now: the `11/12`
     milestone (blocks 1–9 and 11 without T2) is this roadmap.
   - The `7/8` stage then becomes `QuasiRiemannHypothesisPartII`, and the (U1)/(U2) blocks become
     supplier roadmaps (Placement).
3. **The cubic theta input.** The theta input rests on three texts: `patterson1977` Theorem 8.1
   (a 1977 scan, read by OCR, so formulas must be checked against the scan), and
   `dunnradziwill2024` §5 with Appendix A. It consists of:
   - the three cusp expansions, with `k ≥ −4`;
   - the bound `|d(μ)| ≤ 27 · 3^{k/6}|b|`;
   - the coefficient at infinity, without coprimality between `n` and `b`.

   The preprint uses the expansions as Dunn–Radziwiłł record them. Whether they follow from
   Patterson's theorem and the automorphy alone is the design's first open question in the (U1)
   block. Continuation of Eisenstein series on the cubic cover is supplied by no roadmap.
   `kubota1969` §§5–6 gives Kubota's route, and AutomorphicSpectralTheory §§1.15a–1.15c gives the
   linear-group route the block adapts.
4. **Generality limits that must not be overstated.** Three limits apply:
   - theta coefficients through Gauss sums only for `n ∈ {2, 3}` on `GL₂`;
   - the exact field and family hypotheses of `bgl2014` Theorem 1.3 and of `goldmakherlouvel2013`
     Definition 1, which the design copies from the papers and does not widen;
   - T6 only for abelian `K`.
5. **Texts read only in a substitute version.** The design reconstructs or lists any step that
   depends on the version not read:
   - `heathbrown2000` is read from the copy in Oxford's repository. That record does not say
     whether the copy is the accepted manuscript or the published version, so the design checks
     that Theorem 2 matches the journal statement before relying on its constants.
   - The ISSAC version of `bimsissac2017` was not read; its arXiv v1 was.

   The OCR texts (both OpenAI preprints, `patterson1977`) may garble formulas. Every constant
   taken from them is checked against the PDF.
6. **Numbering.** Locators are to revision `adc7f12` of the repository, which is the only revision.
   A later revision may renumber, and the README pins the revision. The second paper and
   `liu2026improved` have their own numbering.
7. **Carriers.** `heckeLFunctionC` is `0` when no continuation exists, and its value at a pole is
   `0`. Statements must therefore use meromorphic order, or exclude the pole explicitly, or they
   become false (at `s = 1`) or vacuous.
