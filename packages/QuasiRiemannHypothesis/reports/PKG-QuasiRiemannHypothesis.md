# PKG-QuasiRiemannHypothesis: roadmap package

Files written: `packages/QuasiRiemannHypothesis/README.md` (2350 lines),
`packages/QuasiRiemannHypothesis/Suggested.lean` (182 lines),
`packages/QuasiRiemannHypothesis/metadata.toml` (`topic = "math.NT"`, as on main for
ZerosOfLFunctions and LFunctions). `packages/QuasiRiemannHypothesis/sources.toml` is unchanged: the
package cites no work that the manifest lacks, and every `cited_for` list already covers the sections
that cite the work (the `Suggested.lean` docstrings cite `openai2026quasiRH` for 1.1, 5.5, 10.7, 11.1,
11.3, `liu2026improved` for 10.7, `lamzourilisound2015` for 11.2 and `tao2015` for 11.3, all already
recorded). `design/plan.json` is unchanged: `gaps` stays `[]` (every supplier section the README
consumes states what is consumed; see "Supplier gaps"). No `needs-references.toml` was written: every
cited text is in the cache.

The README is the accepted design written out in the roadmap form, with the duplication removals and
the one generality correction listed below. Every target, Check and worked example of the design is
kept; no layer, section or target id changed. The four P3 findings of the review that accepted the
design are present at their places (§3.1 rescaling to `Ω − k`, the §8.4 locator clause on
`kubota1968` p. 265, the §11.3 Check on the route of `bimsissac2017`, the single consumer
AnalyticNumberTheoryPartIII, Part II).

## Headline theorems

The roadmap's end theorems, and the general theorem the summary names besides them:

| Headline | Section | Status |
| --- | --- | --- |
| The `11/12` half-plane for every finite-order Hecke `L`-function of `ℚ(√−3)`, at every presentation | 10.7 | stated: `zeroFreeRightOf_heckeLFunctionC` |
| The `11/12` half-plane for every Dirichlet `L`-function at every level | 10.7 | stated: `zeroFreeRightOf_LFunction` |
| `ζ(s) ≠ 0` for `Re s > 11/12`, `s ≠ 1` | 10.7 | stated: `riemannZeta_ne_zero_of_eleven_twelfths_lt_re` |
| The zero strip `1/12 ≤ Re ρ ≤ 11/12` for primitive Dirichlet characters | 11.1 | stated: `re_mem_Icc_of_LFunction_eq_zero` |
| The same strip for the primitive Hecke characters of `ℚ(√−3)` | 11.1 | stated: `re_mem_Icc_of_heckeLFunctionC` |
| Least character value `≤ C_θ (log q)^(1/(1−θ))` under a zero-free half-plane `Re s > θ` | 11.2 | stated: `exists_ne_zero_ne_one_le_log_rpow` |
| Its Hecke analogue over any number field, in `log N𝔪₀ + 2` | 11.2 | stated: `exists_prime_ne_zero_ne_one_le_log_rpow` |
| Least quadratic nonresidue `n(p) ≤ C (log p)^12` | 11.3 | stated: `exists_jacobiSym_eq_neg_one_le_log_pow` |
| Vinogradov's conjecture `n(p) ≪_δ p^δ` | 11.3 | stated: `exists_jacobiSym_eq_neg_one_le_rpow` |
| Transfer of a zero-free half-plane from the Hecke family of an abelian field to all Dirichlet `L`-functions | 5.5 | stated: `zeroFreeRightOf_LFunction_of_isAbelianGalois` |

The one definition the statements need is `ZeroFreeRightOf` (1.1), a predicate with a real body on
Mathlib's `meromorphicOrderAt`. The least nonresidue is not redefined: SieveMethodsAndPrimePatterns
§2.9 owns `SieveApplications.leastNonresidue`, and the Lean statements of 11.3 say "some `n ≥ 1`
below the bound has `jacobiSym n p = −1`", which is equivalent; the README says so at 11.3.

Not headlines, and README targets (the module docstring says so): the continuation principle, the
zero abscissa and the late choice of height (1.2–1.4), the probe and its estimates (Layer 10), the
zero detector (Layer 7), and the large sieves of Layer 6, which are supplier results of the roadmap.
Not statable at the pins, named in the docstring with what is missing: Layer 8 (Kubota's Eisenstein
series on `ℍ³` with a unitary character, their theta residues, Patterson's cubic theta function and
its expansions) lacks hyperbolic `3`-space with the isometric `SL₂(ℂ)` action and its Laplacian,
automorphic functions with a character on it, and the `K`-Bessel function (Tau Ceti has a Riemannian
upper half-space and `besselI`, neither of which carries these); Layer 9 needs Layer 8's theta
function; the large sieve for `n`-th order characters (6.4) would also need the Fisher–Friedberg
characters, a construction with chosen generators.

## What the README could not support

Nothing was cut. Two source-side facts are recorded as the design recorded them: `openai2026quasiRH`
is an unrefereed preprint (Scope), and the cached text of its Lemma 6.2 proof is an OCR in which the
separation `min(1, 1/r₊)/Y` cannot be read reliably; the README states the separation that the
argument needs and pins it against `min(1, r₊)/Y` by a Check (Layer 6 Examples, §10.2).

## Notions moved down from later roadmaps

None. Every supplier the README names is on main (LFunctions, ZerosOfLFunctions, ExplicitZetaBounds,
ClassicalArithmeticCompletion, ClassFieldTheory, ThetaSeries, SieveMethodsAndPrimePatterns,
AnalyticNumberTheoryPartI, II and III, AutomorphicFormsOnReductiveGroups, GlobalNumberFields under
`Completed/`) or earlier in the merge order (CharacterSumsOverFiniteFields, MaassForms,
BianchiModularForms, AutomorphicSpectralTheory).

## Duplication sweep and removals

Checked by object against main, the 451 open roadmap pull requests at their heads (`roadmaps grep`
over their README and Lean files), and the pinned Mathlib and Tau Ceti.

Removed here and cited instead:

1. **The ideal count of `ℤ[ω]`** (§3.5: the number of nonzero ideals of norm at most `H` is
   `πH/(3√3) + O(√H + 1)`) was an owned target. It is at the pins: Tau Ceti
   `TauCeti.GlobalNumberFields.isBigO_rayClassIdealCountingFunction_sub`
   (`NumberTheory/NumberField/Global/RayClass/Count/Asymptotic.lean`, line 96: the ray-class count is
   `rayClassIdealMainTerm 𝔪 · x + O(x^(1 − 1/[K : ℚ]))` as `x → ∞`), at the modulus `(1)` of `F`
   (class number one, so one class), with `rayClassIdealMainTerm` the residue of `ζ_K` divided by
   the order of the ray class group times the Euler factors at the primes of `𝔪`
   (`RayClass/MainTerm.lean`, line 56), and Mathlib `NumberField.ideal.tendsto_norm_le_div_atTop`
   (`NumberTheory/NumberField/Ideal/Asymptotics.lean`, line 152) for the residue
   `2^(r₁)(2π)^(r₂) h R/(w √|d_K|)`. §3.5 now says the count is consumed, its title drops "and the
   ideal count", the Scope's Layer 3 bullet drops it, and the supplier contracts, the Layer 3
   Dependencies and §7.1's bound cite the two declarations. The pinned statement is asymptotic; the
   form "for `H ≥ 0`" adds only that the count is bounded for bounded `H`.
2. **`|g(χ)| = √q` for a Gauss sum over a finite field** was consumed from CharacterSumsOverFiniteFields
   §§1.1–1.2. It is at the pin: Tau Ceti `TauCeti.norm_gaussSum` (`NumberTheory/GaussSum/Basic.lean`,
   line 65; hypotheses `χ ≠ 1`, `ψ` primitive). §4.1 and the Layer 4 Dependencies cite it.
3. **`g(χ) g(χ⁻¹) = χ(−1) q`** was consumed from CharacterSumsOverFiniteFields §1.2. It follows from
   Mathlib `gaussSum_mul_gaussSum_eq_card` (`NumberTheory/GaussSum.lean`, line 200) and
   `gaussSum_mulShift` (line 76) at `a = −1`; §4.3 says so and cites them.
4. CharacterSumsOverFiniteFields Layer 2 (Jacobi sums) was listed as a supplier but no target uses it;
   the contract now names §§1.4–1.5 (used in Checks) and §3.4 (the duplication formula, used in
   §4.3).

Added to the contracts (used by the existing text, now cited at the pin): Tau Ceti
`Ideal.powerResidueSymbolIdeal_intCast_three` (`Cyclotomic/Three/RationalResidue.lean`, line 47: the
cubic symbol of coprime rational integers is `1`, used in the §§2.5 and 8.1 Checks),
`TauCeti.ClassFieldTheory.kroneckerWeber` (`ClassFields/KroneckerWeber.lean`, line 178, for
`[IsAbelianGalois ℚ E]`), Mathlib `IsAbelianGalois`, `riemannZeta_one`, `DirichletCharacter.IsPrimitive`.

Kept variants, each with its one-clause difference in Scope: §3.2's pointwise Mellin bound against
AnalyticNumberTheoryPartIII §9.2 (one compactly supported bump, constant depending on the bump; here
explicit seminorms, uniform over families, Schwartz decay at `∞` allowed); §5.4's base-change
factorization against LFunctions Layer 4 (which factors `ζ_K` over quadratic and cyclotomic `K`; here
the twist by `χ ∘ N_{K/ℚ}` over every abelian `K`).

Searched and found owned nowhere else: Kubota's character and Eisenstein series with a Kubota
character, Patterson's cubic theta function (MetaplecticAutomorphicForms and its Part II treat the
Weil representation and double covers, with no `n`-fold cover, power residue symbol or `ℍ³`), the
quadratic, cubic, sextic and `n`-th order large sieves over number fields, Gauss sums modulo ideals for
powers of the power residue symbol, the quadratic four-term formula, the zero-free half-plane
predicate and the transfer (ExplicitMultiplicativeFunctions and ExplicitPrimeCounting mention the
`7/8` half-plane only as a result they do not plan), zero detection by Dirichlet polynomials, the
zero strip, and the least character value outside `{0, 1}`. The closest roadmaps of the overlap
report were read for scope: ExplicitNumberFields (explicit ideal counts with constants; it takes the
existential count from Tau Ceti, as this roadmap now does), CongruenceSpectralGap, CharacterSumsOverFiniteFields,
BianchiModularForms, ExplicitMultiplicativeFunctions, ZerosOfLFunctions, LFunctions and
AnalyticNumberTheoryPartIII: no object is owned twice.

Ownership against open pull requests was checked through the `roadmaps grep` and `roadmaps show`
tools over the open heads.

## Generality correction

§5.5, the transfer: the design stated it for `σ₀ ∈ [1/2, 1)`. The route uses only `σ₀ ≥ 0` (the
deleted Euler factors vanish only on `Re s = 0`), and the statement is true for every `σ₀ ≥ 0`, so
the README and `Suggested.lean` state it for `σ₀ ≥ 0`. The Check "`σ₀ = 1` is excluded from the
hypothesis range" became two Checks: at `σ₀ = 1` the conclusion is Mathlib's, and for `σ₀ < 1/2`
the hypothesis fails at the zero `1/2 + 14.1347…i` of `ζ`, which divides `ζ_K`, so the content lies in
`1/2 ≤ σ₀ < 1`.

At 10.7 the `ζ` corollary is stated with `s ≠ 1`, so that no junk value is read; the README says so.

## Elaboration

`lake env lean packages/QuasiRiemannHypothesis/Suggested.lean`, run from the content checkout at the
pins (Mathlib and Tau Ceti of its `lake-manifest.json`; the one Tau Ceti import,
`TauCeti.NumberTheory.LFunctions.Hecke.Basic`, was already built): exit 0, **10 warnings, all
"declaration uses `sorry`"** (lines 79, 93, 102, 109, 121, 131, 143, 155, 169, 177), no other
message. The header is `module`, then `import Mathlib` and the one `TauCeti.*` import; no
`set_option`, no sorry'd data.

`#check` pass: a scratch copy of the file with `#check @name` for all eleven declarations (and
`#print ZeroFreeRightOf`) was elaborated once with `pp.funBinderTypes` and `pp.numericTypes`. Each
elaborated type was compared with its README statement: every binder is in the declaration's own
signature (the file has no `variable` block); `Real.log ↑q ^ (1 / (1 − θ))` parses as
`(log q)^(1/(1−θ))`; `χ ↑n` reads `n` in `ZMod q`; `11 / 12` is real; `jacobiSym (↑n) p` takes `n` in
`ℤ`. Nothing changed as a result. A first variant with `@[expose] public section` was dropped: with
the plain `import Mathlib` the brief requires, it produced "imported privately" errors.

The package gate, run on a scratch copy of the folder laid out as `TauCetiRoadmap/QuasiRiemannHypothesis/`
(with `metadata.toml`), reported 0 on every check (set_option, sorry-data, imports,
readme-ids-missing, statement-hygiene, round-labels, long-fences, layer-ids, target-ids, depcheck,
metadata, private-paths, …) except `git`, because the scratch copy is not a repository.

## Dependency check

    tauceti-roadmap … gate --depcheck packages/QuasiRiemannHypothesis/README.md --name QuasiRiemannHypothesis --order merge-order/ORDER.txt --movable --content <content checkout>
    depcheck: 261 roadmaps, 2606 edges, 0 problem(s)

No UPWARD, CYCLE or `moved:` line. `roadmaps resolve` on the README: no cross-roadmap citation and no
Lean name found nowhere.

## Supplier gaps

None. The sections consumed were read at main or at the open heads: LFunctions Layer 5 (`gaussSum`,
`gaussSum_mul`, `norm_gaussSum`, `heckeData`), Layers 6–8; ZerosOfLFunctions §1.6
(`continuedL (heckeData χ) = heckeLFunctionC χ.character`), §3.1, §§4.4–4.5, 8.4–8.6; ExplicitZetaBounds
§3.2 (`norm_continuedL_le_rademacher`); ClassicalArithmeticCompletion §§1.12, 1.23, 1.33, 1.34, 1.38,
1.43, 1.52, 1.72, 1.75; ClassFieldTheory Layer 11 and §13.1; ThetaSeries 1A; SieveMethodsAndPrimePatterns
§2.9 (`SieveApplications.leastNonresidue`); AnalyticNumberTheoryPartIII §8.2; AutomorphicFormsOnReductiveGroups
§4.5 (`K_ν`, its equation and decay); CharacterSumsOverFiniteFields §3.4 (the duplication
`g(χ) g(χη) = χ(4)⁻¹ g(χ²) g(η)`); MaassForms §7.1; BianchiModularForms §§0.3–0.4;
AutomorphicSpectralTheory §§0.15–0.16, 1.15a–1.15c.

## Adversarial pass

Every statement written or changed in this package, with the values computed.

| Statement | Instances tried | Values computed | Result | Change |
| --- | --- | --- | --- | --- |
| `ZeroFreeRightOf` (1.1, now declared) | `s − 2`; `0`; `1/(s − 1)`; `s ↦ s̄`; `s − 2` with value `1` at `2` | orders `1` at `2` (fails right of `3/2`); `⊤` (fails for every `σ`); `−1` at `1` (holds); junk `0` everywhere (holds, not meromorphic); order `1` at `2` (fails, a value reading would accept) | holds; the Lean body is the README's | declared in `Suggested.lean`, backticked in §1.1 |
| §5.5 transfer, `σ₀ ≥ 0` | `σ₀ = 11/12`, `K = F`; `σ₀ = 1`; `σ₀ = 0`; `K = ℚ`; level `4` principal character | `X(F) = {1, χ₋₃}`; Mathlib `LFunction_ne_zero_of_one_le_re`; hypothesis false at `1/2 + 14.1347i` (`ζ` divides `ζ_K`); `X(ℚ) = {1}`, factorization trivial; `1 − 2^(−s) = 0` at `s = 2πi k/log 2`, `Re = 0`, outside `Re s > 0` | true for every `σ₀ ≥ 0`, content for `1/2 ≤ σ₀ < 1` | widened from `[1/2, 1)`; two Checks |
| §5.5, poles of the cofactors | `χ = χ₋₃`, `K = F` | cofactor `χχ₋₃` principal mod `3`, pole at `1` only; `L(1, χ₋₃) = π/(3√3) ≈ 0.6046 ≠ 0` | a zero of `L(s, χ)` at `ρ ≠ 1` is a zero of the product | none |
| 10.7, Hecke | `F`, trivial character at modulus `(1)`; induced at `(2)` | `ζ_F` pole at `1`, order `−1 ≤ 0`; `ζ_F(1 − 2^(−2s))`: factor zeros on `Re s = 0` | holds as an order statement | Lean name added |
| 10.7, `ζ` with `s ≠ 1` | `s = 2`; `s = 0.95`; `s = 1` | `ζ(2) = 1.6449`; `ζ(0.95) ≈ −19.4`; `s = 1` excluded (Mathlib value `(0.5772 − 2.5310)/2 = −0.9769`, junk) | holds; no junk value read | `s ≠ 1` added |
| 11.1, Dirichlet instance | `ζ` at `1/2 + 14.1347i`; `ζ` at `−2`; `ζ` at `1`; even primitive `χ` mod `5` at `0`; `χ₄` at `0` | `1/12 ≤ 0.5 ≤ 11/12`; `Re = −2`, excluded by `Re ρ > 0`; `ζ(1) ≠ 0`, hypothesis false; trivial zero at `0`, excluded; `L(0, χ₄) = 1/2 ≠ 0` | holds; `Re ρ > 0` needed (the even character's zero at `0` would violate `1/12 ≤ Re ρ`) | Lean name added |
| 11.1, Hecke instance over `F` | `ψ = 1`: `ζ_F = ζ L(·, χ₋₃)`; nontrivial `ψ` | zeros of `ζ` on `Re = 1/2`, `1/12 ≤ 1/2`; gamma factor `Γ_ℂ(s)` has no zero, poles at `0, −1, …`, so for `0 < Re ρ < 1`, `L(ρ, ψ) = 0 ⇒ L(1 − ρ̄, ψ) = 0` (conjugation `L(s̄, ψ) = conj L(s, ψ̄)`) | holds through orders | stated in Lean |
| 11.2, Dirichlet | `q = 2`; `q = 3`, `(·/3)`; `q = 12`, `(·/3)` induced; `q = 5`, `χ(2) = i` | no nonprincipal character mod `2` (vacuous); `n = 2` vs `C (log 3)^2 = 1.207 C`; `n = 5` (`χ(2) = χ(3) = χ(4) = 0`) vs `C (log 12)^2 = 6.17 C`; `n = 2` | holds for one `C` per `θ`; the clause `χ(n) ≠ 0` gives `5`, not `2`, at `q = 12` | Lean name added |
| 11.2, route at general `θ` | prime sides of `χ*` and `ζ`; zero side; scale `x` | `Σ_{(n,q)=1} Λ(n)φ(n/x) = xφ̃(1)(1 + o(1)) − O(log q log x)`; zero side `≪ x^θ log q` (unit windows `≪ log(q(|t| + 2))`, `φ̃` rapidly decreasing); so `x^(1−θ) ≪_θ log q` for `x ≥ x₀` | `n ≤ C_θ (log q)^(1/(1−θ))`, `log q ≥ log 2` absorbs `x₀` | none |
| 11.2, Hecke analogue | `K = ℚ(i)`, `𝔪 = (3)`, `η = (·/3) ∘ N`; `K = ℚ`, `𝔪 = 3∏_{p≤y} p`; trivial `η`; `𝔪₀ = (1)`; `𝔭 = ⊥` | `(1 + i)`: `N = 2`, `η = (2/3) = −1`; least `p > y`, `p ≡ 2 (mod 3)`, `≤ 2y`, bound `≫ y²`; excluded by `η ≠ 1` (hypothesis holds at `F` by 10.7); `log 1 + 2 = 2 > 0`; `⊥` is prime in a domain | holds; `𝔭 ≠ ⊥` needed in Lean | Lean name added; README says "nonzero prime ideal" |
| 11.3 | `p = 3`; `p = 7`; `p = 2` | `n = 2`, `jacobiSym 2 3 = −1`, `(log 3)^12 = 3.09`; `n = 3` (residues `1, 2, 4`), `(log 7)^12 ≈ 2950`; `p = 2`: `jacobiSym n 2 ∈ {0, 1}`, no `−1` | holds; `p ≠ 2` needed | Lean names added |
| §3.5 ideal count, now consumed | `H = 3`; `H = 4`; `H = 7`; residue | `2` vs `1.814`; `3` ((1), (λ), (2)) vs `2.418`; `5` (with the two primes of norm `7`) vs `4.232`; `2π h R/(w√3) = 2π/(6√3) = 0.6046 = π/(3√3)` | errors `0.19, 0.58, 0.77 ≤ √H`; the pinned exponent `1 − 1/2` | removed from ownership, cited |
| §4.1, prime case via `TauCeti.norm_gaussSum` | `n = 6`, `𝔭 = (1 + 3ω)`, `j = 1, 3, 6` | `μ_6 ↪ 𝔽₇ˣ`, the symbol is onto `μ_6`, so `χ^j ≠ 1` iff `6 ∤ j`; `|γ_1| = |γ_3| = 1`, `γ_6 = −1/√7` | the hypothesis `χ ≠ 1` of the pinned lemma is `j ≢ 0 (mod n)` | citation changed |
| §4.3, `g(χ) g(χ⁻¹) = χ(−1) q` from Mathlib | quadratic `χ` on `𝔽₅`, `𝔽₇` | `√5 · √5 = 5 = (−1/5)·5`; `(i√7)² = −7 = (−1/7)·7` | holds; `gaussSum_mulShift` at `a = −1` supplies `χ(−1)` | citation changed |
| Scope, kept variants | ANT III §9.2 bump `(x − 1)²(2 − x)²`; LFunctions Layer 4 at `ℚ(i)` | constant depends on the bump there, explicit seminorms here; `ζ_{ℚ(i)} = ζ L(χ₄)` is §5.4 at `χ = 1` | different statements, one clause each | clauses added |

## Suspicious text

None found in the design, the reviews, the other roadmaps read, or the source extractions consulted.
