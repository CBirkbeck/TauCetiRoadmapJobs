# FIX-PKG-MordellLawrenceVenkateshPartII~9: repair report

The review `REV-PKG-MordellLawrenceVenkateshPartII~8` has seven findings: one P2 and six P3. I checked
each against the cached LS text, the roadmap's own sections and the supplier roadmaps. All seven are
correct.

- F01, F03, F04, F05 and F06 are applied.
- F02 and F07 are applied differently. In each case the suggested wording was slightly inaccurate; the
  reasons are in their sections.
- The pattern searches found three more places that dropped the smoothness of a model (F01) and two
  more dependency lists that the F02 repair made incomplete.

Files changed:

- `packages/MordellLawrenceVenkateshPartII/README.md`
- `packages/MordellLawrenceVenkateshPartII/Suggested.lean`: one docstring only. No signature changed.

`metadata.toml`, `sources.toml` and `design/plan.json` are unchanged, and no gap was added.

## REV-PKG-MordellLawrenceVenkateshPartII~8/F01 (P2) — applied

**Verified.** LS Theorem 7.3 (LS lines 3260–3261) and LS Theorem 8.17 (LS lines 3814–3815) both take a
smooth model over `ℤ[1/S]`. §0.1 defines a system only on a smooth model.

**Old → new.** §§4.5 and 6.1: "Let `𝒳` be of finite type over `ℤ[S⁻¹]` with smooth geometrically
connected generic fibre" → "Let `𝒳` be smooth of finite type over `ℤ[S⁻¹]` with geometrically connected
generic fibre".

**Pattern.** The same omission was in three other places, all repaired:

- Conventions, "Arithmetic models": "with a model over `ℤ[S⁻¹]`" → "with a smooth model over `ℤ[S⁻¹]`".
- §1.7: "with `X` smooth over ℚ and with an integral model" is replaced by the LS §5.5 setting (LS lines
  2207–2212, p. 48):
  - an abelian scheme `𝒜` over `O_K[S⁻¹]` extending `A`;
  - a smooth model `𝒳` of `X` over `ℤ[S′⁻¹]`;
  - the family extending to a closed subscheme of `𝒳_(O_K[S⁻¹]) ×_(O_K[S⁻¹]) 𝒜`, smooth (hence proper)
    over `𝒳_(O_K[S⁻¹])`.

  The construction in §1.7 produces a Hodge–Deligne system, which §0.1 defines only on a smooth model.
- §10.4: "spread out over a finite localization" → "spread out to a smooth model over a finite
  localization". §10.5 feeds this model into §6.1, so the model must be smooth. Smoothness spreads out by
  SchemeAndStackFoundations §0.9 (its list of properties that descend includes "smooth").

§7.6 already said "smooth of finite type". The Checks of §§4.5 and 6.1 are unchanged: "Enlarging `S`
enlarges the set of integral points" still holds, because a smooth model stays smooth after base change
to `ℤ[S′⁻¹]` for `S′ ⊇ S`.

## REV-PKG-MordellLawrenceVenkateshPartII~8/F02 (P3) — applied differently

**Verified.** §5.4 named neither `G` nor "the faithful representation". The hypotheses are in LS Lemma
8.7 (LS lines 3465–3468) and LS Lemma 8.1 (LS lines 3338–3341).

**Old → new.** The hypothesis sentence of §5.4 now reads as follows:

- `G` is an algebraic group over `ℚ_p` with reductive identity component (§2.3) and a fixed faithful
  representation `G → GL_N`;
- `ρ` is continuous and crystalline at `p`;
- there are a finite set `Σ` and an integer `w` such that, for every prime `ℓ ∉ Σ` with `ℓ ≠ p`, `ρ` is
  unramified at `ℓ` and the geometric Frobenius at `ℓ` has a characteristic polynomial with algebraic
  coefficients whose roots are Weil `ℓ`-numbers of weight `w` (DeligneWeightsAndPurity §0.1);
- the image of `ρ` lies in `P(ℚ_p)` for a Richardson parabolic `P` defined over `ℚ_p`.

**Why differently.**

- *Purity outside a finite set.* The suggested text asks for purity "at every unramified prime
  `ℓ ≠ p`". That is stronger than LS Lemma 8.1, which only asks for it outside a finite set. The roadmap
  keeps the source's generality.
- *Geometric Frobenius.* The statement now names geometric Frobenius. With arithmetic Frobenius,
  `ℚ_p(−1)` would have weight −2 and predict de Rham degree −1, but its jump is +1. This agrees with
  §5.4's own `ℚ_p(−1)` Check and with the Conventions.

**Consequences in the README.**

- §5.4's *Needs:* line gains §2.3 and DeligneWeightsAndPurity §0.1.
- The DeligneWeightsAndPurity supplier contract now says "Consumed in Layers 0, 1, 5, 7 and 9".
- The Layer 5 Dependencies line gains DeligneWeightsAndPurity §0.1.

Every Check of §5.4 was recomputed (see the adversarial pass); none changes.

## REV-PKG-MordellLawrenceVenkateshPartII~8/F03 (P3) — applied

**Verified.** The witness `3(x₀² + x₁² + x₂²)` with `S = {2}` fails `HasGoodReductionOutside`, although it
defines the same rational point as `x₀² + x₁² + x₂²`, which is an integral point. I proved the failure in
Lean on a scratch copy.

**Old → new.**

- §9.1 statement: "an integral form represents a `ℤ[S⁻¹]`-point exactly when …" → "an integral form
  whose coefficients generate the unit ideal of `ℤ[S⁻¹]` is the coordinate vector of a `ℤ[S⁻¹]`-point
  exactly when …". It adds that every such point has such a coordinate vector, unique up to a unit, and
  that a form satisfying the predicate has such coefficients.
- The API bullet is reworded the same way.
- A new Check records the witness and explains why §9.3 is unaffected.
- The docstring of `HasGoodReductionOutside` is reworded in the same terms.

**Why the added clause is true.** If `F` has good reduction outside `S`, then for every prime `p ∉ S`
the reduction of `F` modulo `p` is nonzero, because `IsSmoothHypersurface 0` is false. So the gcd of the
coefficients of `F` is a product of primes in `S`, which is a unit of `ℤ[S⁻¹]`.

## REV-PKG-MordellLawrenceVenkateshPartII~8/F04 (P3) — applied

**Verified.** The LS page markers are: p. 42 at LS line 1895, p. 43 at 1940, p. 75 at 3393, p. 76 at
3442.

**Old → new.**

1. §0.6: "pp. 42–43" → "p. 42". Definition 5.6 and the paragraph after it are LS lines 1916–1925.
2. §5.1: "LS, Definition 8.4, pp. 74–75" → "LS, the paragraph before Definition 8.4, pp. 74–75" (LS lines
   3382–3396).
3. §5.3: "LS, Definition 8.4 and Example 8.6, pp. 74–76" → "LS, Definition 8.4, Remark 8.5 and Example
   8.6, pp. 75–76". I added Remark 8.5 (LS line 3412) because it is where LS proves "balanced ⇒ weakly
   balanced ⇒ semibalanced", which §5.3 asks to prove.

**Pattern.** The other "pp. 42–43" locator, at §0.4 ("Example 5.8 and Remark 5.9"), is correct: Example
5.8 starts at LS line 1935 (p. 42) and Remark 5.9 is at LS line 1950 (p. 43).

## REV-PKG-MordellLawrenceVenkateshPartII~8/F05 (P3) — applied

**Old → new.**

- §4.1: drops §0.6. Its statement concerns a closed subgroup of `H^I`, and its route is Goursat's lemma.
- §5.9: drops §§2.5 and 5.1–5.2. It uses only roots, standard parabolics and the Weyl group.
- §7.8: drops §2.7. It uses no adjoint profile and no `T`.

The layer Dependencies lines still list these layers, because other sections in the same layers use
them.

**Pattern.** I listed all 79 *Needs:* lines next to their section titles and read the statements of
the doubtful ones (§§4.2, 5.10, 5.12, 7.6, 8.4). In each of those, every section listed is used by the
statement or its route; for example, §7.6 uses §2.7's adjoint profile in its hypotheses. This was not a
line-by-line proof of all 79, but it found no other line like the three above.

## REV-PKG-MordellLawrenceVenkateshPartII~8/F06 (P3) — applied

**Old → new.** "ClassicalAdicEtaleCohomology §8.2 (proper algebraic comparison, Huber's Theorem 3.7.2)" →
"ClassicalAdicEtaleCohomology §8.2 (proper algebraic comparison)".

**Pattern.** I searched the README for every numbered Theorem, Proposition, Lemma, Corollary,
Definition, Remark and Example. Apart from Huber, each one is a locator into LS, LV, Serre or
Batyrev–Cox, all of which are recorded in `sources.toml`.

## REV-PKG-MordellLawrenceVenkateshPartII~8/F07 (P3) — applied differently

**Verified.** §1.6 takes any `r` invertible on the base, and LS line 2256 says "some finite order `r`".
So `r` need not be prime.

**Old → new.** "The order prime `r` … may differ from the cohomological prime `p`" → "The order `r` is
invertible on the model and need not be prime: for `p = 5`, a character of order 4 is allowed once 2 is
invertible. Since `p` lies below no place of `S`, an `r` invertible on `O_K[S⁻¹]` is automatically prime
to `p`; a character of order `p` would need the places above `p` in `S`, which §0.1 excludes."

**Why differently.** The suggested phrase "unrelated to the cohomological prime `p`" is false. §0.1
requires `p` to lie below no place of `S`. An `r` invertible on `O_K[S⁻¹]` has all its prime factors
below `S`, so it is always prime to `p`. This matches LS line 2213, which takes `r` prime to `p`, and
§1.7, which asks for `χ` of order prime to `p`.

## Checks

**Elaboration.** `lake env lean` on `packages/MordellLawrenceVenkateshPartII/Suggested.lean`, run from
the content checkout: exit 0. The only output is `declaration uses sorry`, at 69:8 and at 109:8. The file
has one import, `import Mathlib`.

**`#check @name`.** I put all six declarations in one scratch file and elaborated it once:

- `eulerian : ℕ → ℕ → ℕ`
- `eulerian_central_mass_le_half : ∀ (n : ℕ), 2 ≤ n → 2 * ∑ q ∈ Finset.range n, eulerian n q ^ 2 ≤ n.factorial ^ 2`
- `HypersurfaceMonomial : ℕ → ℕ → Type`
- `@IsSmoothHypersurface : {k : Type u_1} → [Field k] → {n : ℕ} → MvPolynomial (Fin (n + 1)) k → Prop`
- `@HasGoodReductionOutside : {n : ℕ} → Finset ℕ → MvPolynomial (Fin (n + 1)) ℤ → Prop`
- `integralHypersurfaces_not_zariskiDense`, with the type exactly as written in the file.

No binder is lost, and each type agrees with its README statement. Nothing changed except the docstring
of `HasGoodReductionOutside`.

The same scratch file proves `¬ IsSmoothHypersurface (0 : MvPolynomial (Fin 3) ℚ)`. A second scratch file
proves `¬ HasGoodReductionOutside {2} (3 * (X 0 ^ 2 + X 1 ^ 2 + X 2 ^ 2))`, the F03 witness.

**Dependency check** (the prescribed command):

```text
depcheck: 239 roadmaps, 2276 edges, 0 problem(s)
```

There is no UPWARD, CYCLE or moved line. The only supplier newly cited is DeligneWeightsAndPurity §0.1.
That roadmap was already a supplier and is earlier in the merge order.

**Citations.** `roadmaps resolve` on the README reports no cross-roadmap citation and no Lean name that
it cannot find. The lead `VanishingCycles.lisseDirectImageTransport` from the worker's citations file
was not reported this time.

**Hygiene.** No LaTeX delimiter, machine path, process word, pull-request number or `set_option` was
added. All new citations are LS locators with lines (LS is already in `sources.toml`, and its `cited_for`
already covers §§1.7 and 5.4) or sections of supplier roadmaps.

## Adversarial pass

| Statement | Instances tried | Values computed | Result | Change |
|---|---|---|---|---|
| §§4.5, 6.1 with a smooth model | `𝒳` smooth over `ℤ[1/2]`, `S′ = {2, 3}` | smooth over `ℤ[1/6]` by base change; the integral points over `ℤ[1/2]` lie among those over `ℤ[1/6]` | The "enlarging `S`" Check holds | None beyond F01 |
| §1.7, new setting | LS §5.5 (LS lines 2207–2212) | `𝒜` abelian, so proper; a closed subscheme of `𝒳_(O_K[S⁻¹]) × 𝒜` is proper over `𝒳_(O_K[S⁻¹])`; smooth + proper = §0.5's input | Agrees with LS | — |
| §5.4: elliptic curve `E` | `ρ = H¹(E)` | geometric Frobenius `t² − a_ℓ t + ℓ`, roots of modulus `ℓ^(1/2)`, `w = 1`; de Rham jumps `0, 1`, average `1/2 = w/2` | Sound | — |
| §5.4: Tate twist | `ℚ_p(−1)` | geometric Frobenius `ℓ`, weight 2, jump `+1 = w/2`; with arithmetic Frobenius it would be `ℓ⁻¹`, weight −2, predicting −1 ≠ +1 | The convention is pinned | Named in the statement |
| §5.4: Tate module | `V_pE = H¹(1)` | roots of modulus `ℓ^(−1/2)`, `w = −1`; jumps `0, −1`, average `−1/2` | Sound | — |
| §5.4: finite image | `ρ` with finite image, `w = 0` | roots are roots of unity, so Weil numbers of weight 0 | Sound | — |
| §5.4: purity condition | Every unramified `ℓ ≠ p` against `ℓ ∉ Σ` | LS Lemma 8.1 needs it only outside a finite set | The review's version is too strong | Kept LS's version |
| §9.1: the equivalence | `F₀ = x₀² + x₁² + x₂²`, `S = {2}` | modulo odd `p` the partials `2x_i` vanish together only at 0; content 1; holds on both sides | Sound | — |
| §9.1: non-unit content | `3F₀`, `S = {2}` | content 3 is not a unit of `ℤ[1/2]`; reduction modulo 3 is 0; predicate false (proved in Lean) | Excluded by the added clause | Check added |
| §9.1: unit content | `2F₀`, `S = {2}` | content 2 is a unit; modulo odd `p` the form `2F₀` is smooth; predicate true; it is the same point as `F₀` | "Unique up to a unit" is right | — |
| §9.1: `S = ∅` | `F₀` | modulo 2, `F₀ = (x₀ + x₁ + x₂)²` and every partial vanishes: singular; predicate false | Consistent (no `ℤ`-point) | — |
| §9.1: `S = ∅`, a good conic | `x₀x₁ + x₂²` | modulo 2 the partials `x₁, x₀, 0` and `F = 0` force `x = 0`: smooth; modulo odd `p` smooth | A `ℤ`-point of `Y_(2,2)` | — |
| §9.3 headline | `G` homogeneous of degree `e`, `λ ≠ 0` | `G(λF) = λ^e·G(F)` | Vanishing is scale-invariant; unaffected | — |
| §1.6 Check | `r = 4`, `p = 5`, places above 2 in `S` | 4 is a unit of `O_K[S⁻¹]`; 5 lies below no place of `S` | Allowed, `r` not prime | Check reworded |
| §1.6 Check | `r = p = 5` | needs the places above 5 in `S`, which contradicts §0.1 | `r` is always prime to `p` | Check reworded |
| §5.1 locator | LS lines 3382–3396 | `a_S`, `w_S`, `ι_(GM)`, `γ_P` lie across pp. 74–75 and come before Definition 8.4 (line 3397) | Corrected | F04 |
| §5.3 locator | LS lines 3397–3447 | Definition 8.4 (p. 75), Remark 8.5 (p. 75), Example 8.6 (pp. 75–76) | Corrected | F04 |
| §4.1 *Needs:* | diagonal `H ⊂ H²`, `H²` | Goursat only; no `G_mon` | §0.6 is unused | F05 |
| §5.9 *Needs:* | `SL₂`, `w = s` | the set is `{−α}`; only roots and the Weyl group are used | §§2.5, 5.1–5.2 are unused | F05 |
| §7.8 *Needs:* | `M = 1` | `‖g_1‖² = 19`, `9/19 ≤ 3/4`; no `T` | §2.7 is unused | F05 |

## Ownership and suppliers

No new construction is stated. The one new cross-roadmap citation is DeligneWeightsAndPurity §0.1 (Weil
`q`-numbers of integer weight). I read it at that roadmap's head: it defines `IsWeilNumber` as an
algebraic number with modulus `q^(n/2)` at every complex root of its minimal polynomial. That is exactly
the notion §5.4 uses with `q = ℓ`.

Three further citations are to sections already cited: ReductiveGroups Layer 7 (structure theory: Borel
subgroups, tori, Weyl group), SchemeAndStackFoundations §0.9 (spreading out, smoothness included) and
LS §5.5.

## For the maintainer

- No name that another roadmap cites has changed, and no id was dropped.
- The `HasGoodReductionOutside` docstring is more precise, but its type is unchanged.
- The two licence questions in the review's human section (Serre recorded as `uncertified`, and the host
  of the cached LV copy) were left for the humans, as the brief requires.
