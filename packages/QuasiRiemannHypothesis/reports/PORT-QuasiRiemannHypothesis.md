# PORT-QuasiRiemannHypothesis

- **Branch:** `roadmap/quasi-riemann-hypothesis`, from `4cc6616` (main).
- **Head commit:** `a0f54a308cb451b34cdc5c14f04dc8336bdd346b` — "QuasiRiemannHypothesis: roadmap (README, Suggested.lean, metadata)".
- **Files:** `TauCetiRoadmap/QuasiRiemannHypothesis/README.md`, `TauCetiRoadmap/QuasiRiemannHypothesis/Suggested.lean`, `TauCetiRoadmap/QuasiRiemannHypothesis/metadata.toml` (`topic = "math.NT"`, the same form as `TauCetiRoadmap/ZerosOfLFunctions/metadata.toml`). Nothing outside the folder changed.

## Build

`lake build TauCetiRoadmap.QuasiRiemannHypothesis.Suggested`:

    Build completed successfully (18488 jobs).

10 warnings, all `declaration uses 'sorry'` (lines 81, 95, 104, 111, 123, 133, 145, 157, 171, 179). No other warning and no error.

## Gate

    gate QuasiRiemannHypothesis: set_option=0 blob=0 latex=0 tex=0 prnum=0 sorry-data=0 sorry-examples=0 residue=0 private-paths=0 imports=0 mathlib-subimports=0 no-import-mathlib=0 lean-lines=0 statement-hygiene=0 forbidden=0 dropped=0 readme-ids-missing=0 empty-sections=0 round-labels=0 long-fences=0 layer-ids=0 target-ids=0 depcheck=0 metadata=0 stray-files=0 dirty=0 outside-folder=0 source-material=0 OK

## Dependency check

    depcheck: 260 roadmaps, 2601 edges, 0 problem(s)

No UPWARD, CYCLE or `moved:` line. The roadmap is at line 296 of the merge order. Every supplier it names is earlier in the order or on main.

## Draft pull request body

This roadmap proves that no Dirichlet `L`-function, including the Riemann zeta function, and no finite-order Hecke `L`-function of `ℚ(√−3)` vanishes in the half-plane `Re s > 11/12`; the pole at `s = 1` is allowed. Its consequences are the zero strip `1/12 ≤ Re ρ ≤ 11/12` for primitive characters, the bound `n(p) ≤ C (log p)^12` for the least quadratic nonresidue, and with it Vinogradov's conjecture `n(p) ≪_δ p^δ`. The route is the cubic-theta method of the 2026 preprints. Kubota's cubic theta function and a quadratic large sieve bound a smoothed average of cubic Gauss sums. Poisson summation compares that average with a Mellin integral carrying `1/L` of a target Hecke character. Zero detection and a sextic large sieve control the remaining rows. An abstract continuation principle then turns the two estimates into a zero-free half-plane, and a base-change factorization moves it from the Hecke family of `ℚ(√−3)` to every Dirichlet `L`-function.

Along the way the roadmap builds library material in its own generality, none of which is planned elsewhere:
- a germ-level predicate for zero-free half-planes, with the continuation principle for families of Euler products;
- power residue symbols as ray class characters over every number field containing `μ_n`;
- cubic and sextic reciprocity at composite moduli of `ℤ[ω]`, with Gauss sums modulo ideals;
- uniform analytic bounds and zero detection for the finite-order Hecke `L`-functions of any number field;
- large sieves over number fields: additive, quadratic (Goldmakher–Louvel) and `n`-th order (Blomer–Goldmakher–Louvel);
- Kubota's character with Eisenstein series and theta residues on `ℍ³`, and Patterson's cubic theta function;
- the transfer of zero-free half-planes from an abelian field to Dirichlet `L`-functions.

`Suggested.lean` states the ten headline theorems against the pinned Mathlib and Tau Ceti, over Tau Ceti's `heckeLFunctionC` and Mathlib's `DirichletCharacter.LFunction`.

## Roadmaps this one depends on that are still pull requests

CharacterSumsOverFiniteFields (§§1.4, 1.5, 3.4), BianchiModularForms (§§0.3, 0.4), MaassForms (§§7.1, 7.3), AutomorphicSpectralTheory (§§0.15, 0.16, 1.15a). All four are earlier than this roadmap in the merge order. I resolved each cited section at its open head. AutomorphicSpectralTheory has no checkout in the brief's list, so I read it with `roadmaps show`. No citation depends on numbering that only an open revision defines; the overlap file lists none, and the four roadmaps are new folders, not revisions.

The other suppliers are on main: LFunctions, ZerosOfLFunctions, ExplicitZetaBounds, ClassicalArithmeticCompletion, ClassFieldTheory, ThetaSeries, AutomorphicFormsOnReductiveGroups, SieveMethodsAndPrimePatterns, AnalyticNumberTheoryPartI and AnalyticNumberTheoryPartIII. Completed/GlobalNumberFields is reached through Tau Ceti.

## What moved from the Lean to the README

Nothing. The package's `Suggested.lean` already had the required form: one real-bodied definition (`ZeroFreeRightOf`, the order predicate the headlines need) and ten headline theorems. It has no sorry'd data, no `set_option`, no padding and no section variables. Its imports are `import Mathlib` and `import TauCeti.NumberTheory.LFunctions.Hecke.Basic`, a module that exists at the pin. The module docstring names what is not statable at the pins and why (Layer 8 and Layer 9: no `ℍ³` with its `SL₂(ℂ)` action and Laplacian, no automorphic functions with a character, no `K`-Bessel function; §6.4: no Fisher–Friedberg characters).

The only Lean change: the three `/-! ## Layer k: … -/` section comments now carry the README's exact layer titles (Layers 1, 5 and 10).

**Signature check.** I appended `#check @…` for all 11 declarations to the module and built it once with the brief's `lake build` command, then restored the file. Each elaborated type matches its README statement in generality and hypotheses (§§1.1, 5.5, 10.7, 11.1, 11.2, 11.3). No binder is lost (the file has no `variable` block), and nothing changed as a result.

**Headlines.** All end theorems of the Summary are stated:
- the `11/12` half-plane: Hecke, Dirichlet and `ζ`;
- the zero strip: Dirichlet and Hecke;
- the conditional least-value bound: Dirichlet and Hecke;
- the least nonresidue bound and Vinogradov's conjecture;
- the transfer of §5.5.

No statable headline is missing.

## Supplier replacements and duplication removals

**No restatement removed.** No target of the package is proved at the pins or owned by another roadmap.

**Supplier citations added**, each grepped at the pin:
- Tau Ceti `TauCeti.LFunctions.meromorphicNFOn_heckeLFunctionC` and `TauCeti.LFunctions.analyticOnNhd_heckeLFunctionC` (`TauCeti/NumberTheory/LFunctions/Hecke/Basic.lean`, lines 84 and 89). They replace the vague sentence "the continuation itself is a theorem of LFunctions Layer 5, not of the pin". The supplier contract now says which facts the pin gives (normal form on the plane, holomorphy on `Re s > 1`) and which LFunctions Layer 5 gives (agreement with the series, i.e. existence of a continuation).
- Mathlib `AddChar.complexBasis` (`Mathlib/Analysis/Fourier/FiniteAbelian/PontryaginDuality.lean`, line 129): the characters of a finite abelian group form a basis of its complex functions. It is cited in §4.6, in the Mathlib contract and in the Layer 4 Dependencies as the existence half of the finite Fourier expansion. The coefficient formula and the `ℓ¹` bound remain targets, since Mathlib states neither.

**Supplier contracts.** The combined heading "From TauCetiRoadmap.BianchiModularForms, MaassForms and AutomorphicFormsOnReductiveGroups" is now one heading per supplier, each saying where it is used. The `K_ν` contract now gives the integral definition of AutomorphicFormsOnReductiveGroups §4.5.

**Library names checked at the pin.** All 45 Mathlib names were grepped in `.lake/packages/mathlib`, and all 43 Tau Ceti names (41 cited by the package and the 2 added) in `.lake/packages/TauCeti` with their namespaces; every one exists. Examples:
- `Complex.borelCaratheodory`: `Mathlib/Analysis/Complex/BorelCaratheodory.lean:109`;
- `NumberField.Ideal.tendsto_norm_le_div_atTop`: `…/NumberField/Ideal/Asymptotics.lean:152`;
- `CommGroup.sum_inv_mul_monoidHom_apply_eq_ite`: Tau Ceti `GroupTheory/FiniteAbelian/CharacterOrthogonality.lean:184`, in namespace `CommGroup`;
- `TauCeti.ClassFieldTheory.kroneckerWeber`: `…/ClassFields/KroneckerWeber.lean:178`;
- `Ideal.powerResidueSymbolIdeal_intCast_three`: `…/Cyclotomic/Three/RationalResidue.lean:47`.

`roadmaps resolve` on the ported README reports no cross-roadmap citation and no Lean name found nowhere. The earlier lead `SieveApplications.leastNonresidue` resolves to SieveMethodsAndPrimePatterns §2.9 on main, line 2457.

**Cross-roadmap sections**, each resolved now on main or at the open head, and each says what it is cited for:
- LFunctions Layers 0 and 4–8 (`heckeData`, `grossencharacterData`, `gaussSum`, `gaussSum_mul`, `norm_gaussSum`, entirety, the functional equation, Layer 7 nonvanishing);
- ZerosOfLFunctions §§1.6, 3.1, 4.4, 4.5, 8.4–8.6 and Layer 9 (GRH as a predicate);
- ExplicitZetaBounds §3.2 (hypotheses and bound as quoted);
- ClassicalArithmeticCompletion §§1.12, 1.23, 1.33, 1.34, 1.38, 1.43, 1.52, 1.72, 1.75. §1.72 is prime-to-prime with different norms, §1.74 is prime-to-integer, so the composite law of §2.5 here is new;
- ClassFieldTheory Layer 11 and §13.1;
- ThetaSeries Layer 1 (1A);
- AutomorphicFormsOnReductiveGroups §4.5;
- SieveMethodsAndPrimePatterns §§2.2, 2.3, 2.7, 2.9;
- AnalyticNumberTheoryPartI §§0.34, 1.6, 2.42 (the abelian Dedekind factorization bullet);
- AnalyticNumberTheoryPartII §5.29;
- AnalyticNumberTheoryPartIII §§8.2, 9.2;
- Completed/GlobalNumberFields Layers 2 and 9;
- at open heads: CharacterSumsOverFiniteFields §§1.4, 1.5 and 3.4 (the Hasse–Davenport product formula, whose `m = 2` case is the duplication formula "for every `χ`"), BianchiModularForms §§0.3–0.4, MaassForms §§7.1, 7.3, and AutomorphicSpectralTheory §§0.15, 0.16, 1.15a–1.15c.

**Duplication sweep by object** (`roadmaps grep` over main and the open heads, and grep over the board packages):
- **No other owner:**
  - the Kubota character, cubic theta function and Patterson's converse theorem;
  - Fisher–Friedberg characters and Goldmakher–Louvel Hecke families;
  - zero-free half-planes and the quasi-Riemann hypothesis;
  - power residue symbols as Hecke characters;
  - sextic reciprocity;
  - zero detection by Dirichlet polynomials.
- **MetaplecticAutomorphicForms and its Part II** (both earlier in the order) own the metaplectic double cover and the Weil representation only. "Kubota", "n-fold", "cubic" and "ℍ³" occur nowhere in them, so Layer 8 does not overlap.
- **The least nonresidue:**
  - SieveMethodsAndPrimePatterns §2.9 owns the definition and Linnik's theorem; it is cited.
  - ExplicitNumberFields and ExplicitCharacterSumsAndSieves name the Lamzouri–Li–Soundararajan and Burgess-type bounds only as outside their scope.
  - ExplicitPrimeCounting says the `7/8` half-plane bounds are stated nowhere in it.
  - So §11.2–§11.3 have no second owner.
- **Kept variants**, each already saying in one clause how it differs: §5.2 (the ExplicitZetaBounds §3.2 instance at the Hecke records, with the pole cleared), §3.5 (ThetaSeries 1A at `b𝓞`), §4.1 (Gauss sums of powers of the power residue symbol, which are not residue characters of Hecke characters), §6.2 at `k = ℚ` (implied by AnalyticNumberTheoryPartII §5.29), §8.4 for a Kubota character (outside AutomorphicSpectralTheory §1.15a).

**Ownership.** No construction of this roadmap is owned by a roadmap I can read. No declaration of `Suggested.lean` reuses a fully qualified name of another roadmap.

**Not checked:** the board packages AnalyticNumberTheory and LawrenceVenkateshMethod are under review, and their READMEs are not in the board checkout (they live at their own heads). I did not fetch them.

## README fixes made as an upstream reviewer

1. **§4.4.** The API of `Γ(c)` and `τ` was written as one run-on sentence. It is now bullets:
   - the reciprocity form and the closed form;
   - dependence on `c mod 4`, invariance under squares, modulus one;
   - the square-class group, with a new clause: `(𝓞/4)ˣ ≅ 𝔽₄ˣ × (1 + 2𝓞)/(1 + 4𝓞)` has the squares `{1, ω, ω²}`, so the group has order `4`;
   - the bicharacter formula.

   I recomputed the content. The closed form and the reciprocity form `½ Σ_{y mod 2} e(−cy²/4)` agree with the brute-force sums on 12 and 11 moduli.
2. **Conventions.** "`c` is primary exactly when `−c` satisfies `IsPrimaryEisenstein` (§2.3)" pointed to the wrong section; it is §2.2.
3. **Unnamed sources.** Three references to "the source" now name it: `β*` is `openai2026quasiRH` (2.1) (`openai2026quasiRH` line 181); the floor `51/100` is `openai2026quasiRH` Lemma 8.1 (`openai2026quasiRH` lines 2518–2520); and "absolute at the source's `a₀`" became "absolute at `a₀ = 51/100`".
4. **Process labels.** "**Checks** (computed against the statement)" (§§5.5, 10.7) became "**Checks.**".
5. **§2.5 Check.** "the case not covered by the prime statement of the pin" now names the declaration and its hypothesis: `TauCeti.IsPrimaryEisenstein.cubic_reciprocity`, stated for primes of different norms.
6. **§11.2 API bullet.** "For a real `χ` and `n` below it, `χ(n) ∈ {0, 1}`" holds for every `χ` by definition, so it carried no information about real `χ`. It now reads: every `n` below it has `χ(n) ∈ {0, 1}`, and for real `χ` the value at *leastNonOne* `χ` is `−1`.
7. The supplier-contract changes listed in the previous section (the Tau Ceti `heckeLFunctionC` facts, the per-supplier headings, `AddChar.complexBasis`, and the tidied Layer 4 Dependencies paragraph).

The accepted review's four findings, all P3, were already applied in the package and are kept: the `NumberField.Ideal` name, the rewordings away from the source, the §10.1 locator and the build paragraph. Its non-blocking remarks needed no change.

## Adversarial mathematics pass

Values were computed by hand or by a floating-point script over `ℤ[ω]`. The script brute-forces residues; the sextic symbol is `x^((N−1)/6)` in `𝔽_N` with `ω ↦ −a/b`.

| Statement | Instances tried | Values computed | Result | Change |
| --- | --- | --- | --- | --- |
| Conv. field, `λ`, `e(z)` | `λ = 1 + 2ω`; `e(1), e(ω), e(ω/2)`; `Tr(z/λ)` | `λ = i√3`, `λ² = −3`; `Tr(z/λ) = 2 Im z/√3`; `e = 1, 1, −1` | `e(z) = exp(4πi Im z/√3)`; `𝓞` self-dual | none |
| Conv. primary | `1 + 3ω` vs `−1 − 3ω`; `−1` | `1 + 3ω ≡ 1`, `−1 − 3ω ≡ 2 (mod 3)`; `(−1)(−1) = 1 ≢ 2` | `≡ 1` closed under products, Tau Ceti's not | §2.3 → §2.2 reference |
| Conv. symbols | `χ_p^6(7)`, `χ_p^6(2)` at `p = 1 + 3ω` | `0`, `1` | sixth power is the coprimality indicator | none |
| 1.1 `ZeroFreeRightOf` | `s − 2`; `0`; `1/(s − 1)`; `s̄`; `ζ` | orders `1` at `2`; `⊤`; `−1` at `1`; junk `0`; `0` on `Re s > 1`, `−1` at `1` | pole allowed, zero function excluded, junk order noted; the pin's `heckeLFunctionC` is in normal form on the plane (`meromorphicNFOn_heckeLFunctionC`), so it is meromorphic everywhere | supplier facts cited |
| 1.2 zero abscissa | `{}`; `{s − 3/4}`; `{s − 1/4}`; `{s − 3/4, 1/(s − 1)}`; family with `0` | `1/2`; `3/4`; `1/2`; `3/4`; `Real.sSup` of an unbounded set `= 0` | hypothesis "zero-free right of `1`" is needed and present | none |
| 1.3 continuation | `E* = min(β* − σ₀ − ω, σ)` | `C(σ₀) + ω = C(β*) − (β* − σ₀ − ω)`; on `Re s = B`, `|e^((B−5/6+it)²)| = e^((B−5/6)² − t²)`; `|H| ≥ 1/2`; `β* − E* ≥ σ₀ + ω > σ₀` | `1/(L D)` continues to `Re s > β* − E*`, against §1.2's third bullet (`β* > σ₀ > 1/2`) | none |
| 1.4 late height | `Z ≥ 1`, `A τ ≤ m/4` | `(1 + Z^τ)^A ≤ 2^A Z^(m/4)`, first term `≤ 2^A Z^(C(β*) − 3m/4)`; `A = 0` any `τ` | saving `m/2` | none |
| 2.1 fixed numerator | `ℚ, n = 2, a = −1, 5`; `F, n = 6, a = −1` | conductors `4∞`, `5`; `(5/3) = (3/5) = −1`; `(−1)^((7−1)/6) = −1`, `(−1)^((13−1)/6) = 1` | real place needed only for `n = 2` | none |
| 2.2 primary | six units mod `3`; `λ`; `a + bω` | units distinct mod `3`; `λ ∣ 3`; `N(a + bω) ≡ 1 (mod 3)` when `a ≡ 1`, `b ≡ 0` | holds | none |
| 2.3 sextic symbol | `p = 1 + 3ω`, `ω ↦ 2` in `𝔽₇` | `χ_p(2) = ω`, `χ_p(3) = −ω²`, `χ_p(−1) = −1`; table `1,2,4,6,5,3 ↦ 1,ω,ω²,−1,−ω,−ω²` | as stated | none |
| 2.4 fixed-numerator families | `S = {(2), (λ)}`, numerators `±1`, `p = 1 + 3ω` | `±1` in the family; `v_p(p) = 1`, `p ∉ S` | a good prime in the numerator lies outside | none |
| 2.5 composite reciprocity, supplements | 42 primary primes of norm `< 200`; `−2 + 3ω` and its conjugate | `(ω/d)_3 = ω^(α₂)`, `(λ/d)_3 = ω^(−α₃)`, `(2/c)_3 = c mod 2`: 0 failures; `t = −7`, `7^6 ≡ 1 (mod 19)` | holds | Check rephrased |
| 3.1 profiles | `w' = x^(iτ) w`; `w_k = w(e^k ·)`; inversion at `x = 1` | `ŵ'(t) = ŵ(t − τ)`; `ŵ_k = e^(ikt) ŵ`; `w_log(0) = (2π)^(−d) ∫ ŵ` | normalization pinned | none |
| 3.2 seminorm bounds | tail bound | `(1 + |t|)^N ≥ T₁^N` on `|t| > T₁`; factor `(2π)^d` | holds | none |
| 3.3 Gaussian weight | `s = 0, 1`; `1/2 + it`; variant | `∫ e^(−u²/4 + su) du = √(4π) e^(s²)`, so `MW_G = e^(s²)`; `1`, `e`; `e^(1/4 − t² + it)`; `√π e^(s²/4)` | as stated | none |
| 3.4 kernel decay | `f = e^(−πx²)`; `1_[0,1]` | `f̂ = f`, `s_0 = 1`; `(1 + |ξ|)² |sinc|` unbounded | as stated | none |
| 3.5 lattice, ideal count | `b𝓞` covolume; `H = 3`; residue | `q_b`; dual `b⁻¹𝓞`; count `2` vs `π/√3 = 1.814`; `2π/(6√3) = π/(3√3)` | as stated | none |
| 4.1 Gauss sums mod ideals | `gaussSum_mulShift` read off; `ℚ, (5), y = 1/5`; `γ_6(1 + 3ω)` | `g(χ, ψ_a) = χ(a)⁻¹ g` so `ι((a/𝔠)_n)^(−j)`; `√5`; `−1/√7` | as stated | none |
| 4.2 twisted multiplicativity | `ℚ, n = 2, a = 3, b = 5` | `(3/5)(5/3) = 1`; `i√3 · √5 = i√15` | as stated | none |
| 4.3 prime Gauss identities | `p = 1 + 3ω, −2 + 3ω, 4 + 3ω, −5 − 3ω, 7 + 9ω` (norms `7, 19, 13, 19, 67`) | `γ_2³ = −α(p)` to `10⁻¹⁴` in all five; `γ_1γ_2 = χ̄_p(4) γ_3 γ_2³` in all five, unbarred value `−0.3273 − 0.9449i ≠ −0.6547 + 0.7559i` at norm `7`; `|γ_j| = 1` for `j = 1..5`, `|γ_6| = 0.378, 0.229, 0.277, 0.229, 0.122` | conjugate forced | none |
| 4.4 `Γ(c)` | `c = 1, −1, λ, −λ, −3, 5, 1 − 6ω, 7 + 3ω, 3 + 2ω, 1 + 3ω, −2 + 3ω, 4 + 3ω` | brute force equals the closed form at every `c`; reciprocity form equal on 11 moduli; `(𝓞/4)ˣ` squares `{1, ω, ω²}` | as stated | rewritten as bullets |
| 4.5 sextic reciprocity, `R`, `G` | all 1680 ordered pairs of distinct norms and 42 conjugate pairs among 42 primes; square classes | `χ_b(a) = τ(a, b) χ_a(b)`: 0 failures; `τ((−1)^e λ^f, (−1)^g λ^h) = (−1)^(eh+fg+fh)` on all 16 pairs; `G(v²) = conj(χ_v(4))² = χ_v(4)` | holds | none |
| 4.6 finite Fourier expansion | `ℤ/2` indicator; `n = p`; `p = 1 + 3ω`, `n = −2 + 3ω` | `a_θ = 1/2`, `Σ|a_θ| = 1 ≤ √2`; `0 = 0`; `(−ω²)ω = −1 = τ(λ, λ)` | as stated; Mathlib basis exists, no coefficient formula | `AddChar.complexBasis` cited |
| 5.1 deleted Euler factors | `𝔯 = 𝓞`; `ℚ, (2)`; `σ = −1`; `d` primes over `2` | `2`; zeros `2πik/log 2`; `1 − p`; `D(0) = 2^d = N𝔯` | `σ₀ > 0`, dependence on `K` needed | none |
| 5.2 strip growth | `ℚ, ψ = 1, s = −1/10` | `|ℒ| = 1.2222 · 0.4172 = 0.5099`; `3 (0.9/2π)^0.6 ζ(1.1) = 3 · 0.3116 · 10.5844 = 9.894`; `C_ℚ 3^0.6 = 61.385`; `|1 + s| ≤ 21/10 + |t|` | `C_K = 3 |d_K|^(3/5) ζ(11/10)^d` follows from ExplicitZetaBounds §3.2 at `η = 1/10` | none |
| 5.3 disc bounds | `|(s − 1)/(s + 1)|` on `Re s ≥ 0` | `≤ 1` | `1/ζ_K` bounded by `1/ℒ` | none |
| 5.4 norm-composed, base change | `F, χ mod 7`; `ℚ(i), χ mod 5`; `ℚ(√5)`; `ℚ(√2), α = 1 + 3√2` | `χ(7) = 0`, `χ(4)`; `i`, `χ(9) = −1`; `X = {1, (·/5)}`, `(2/5) = −1`, characters mod `10` trivial on `{1, 9}`: two; `N α = −17`, `χ(17) = −1` | real places needed | none |
| 5.5 transfer (Lean) | `K = ℚ`; `σ₀ < 1/2`; level `4` principal; `χ = χ₋₃` over `F` | trivial factorization; hypothesis false (zero `1/2 + 14.13i` of `ζ` in `ζ_K`); factor zeros on `Re s = 0`; cofactor pole at `1` cancelled only if `L(1, χ₋₃) = 0`, and `L(1, χ₋₃) = π/(3√3)` | true; `0 ≤ σ₀` used by the route | none |
| 6.1 torus large sieve | `J = 1`; `d = 1`, `z_j = j/N`, `Q < N`; non-symmetric `B` | `≍ Q^d`; `N² = N · N`; `B(m, e₂) = 5/4`, phase factor `i` | both terms needed, slot fixed | none |
| 6.2 Hecke families | `ℚ, a = 3, 7`; `3, 5`; `χ_p³` at `p = 1 + 3ω` | conductor of `(21/·)` is `21`, of `(15/·)` is `60`; `χ_p(−1)³ = −1`, conductor `λp` | primitivity only within a class | none |
| 6.3 Fisher–Friedberg | `F, n = 3, 𝔠 = (9)`; `𝔞 = (10)`, `𝔟 = (1 + 3ω)`; `(−2)`, `(7)` | `λ⁴ = 9`; `10² ≡ 2 = ω (mod 7)`; `14 − 5 = 9 ∈ λ³𝓞`, `v_λ(6) = 2`, `v_λ(5 + ω) = v_λ(4 − ω) = 1`, norms `16, 31, 31` | the conjugate is needed in the axiom | none |
| 6.4 `n`-th order sieve | `M = N = 1` | `|λ_𝓞|² ≤ 3|λ_𝓞|²`; `(MN)^(2/3) > M + N` iff `M^(1/2) < N < M²` | consistent | none |
| 6.5 cubic and sextic sieves | `M = N = 1`; `m = n` | `|c₁|²`; `(n/n)_3 = 0` | zero convention kept | none |
| 7.1 detecting polynomials | `r = 0`; `ℚ`, trivial, twist `y^(iv)` | `M_0 = W(1)`; `Σ μ(n) n^(iv − s) = 1/ζ(s − iv)` | sign of the shift pinned | none |
| 7.2 bins | failure chain, `I = ⌈1/ε⌉ + 2` | `M_I > a₀ + (I − 1)ε ≥ a₀ + 1 + ε > 1` | pigeonhole closes; floor `51/100` read at `openai2026quasiRH` line 2520 | locator named |
| 7.3 upper bounds | `ε₀ = ε'/(48 r_max)`, `ε₁ = ε'/8`, `A ≥ 2C` | `12εr + 2ε₁ ≤ ε'/2`; `(24 − 12m)ε + 2ε₁ ≤ 3ε'/4`; `(3 + T₁)^(2C) ≤ 9^C (1 + T₁)^(2C) ≤ 9^C U^(ε'/10)` | holds | none |
| 7.4 lower bounds | floors `51/100`, `1/2 + 10⁻⁶` | `δ > 1/50`, `C''ε'/(2δ) < 25C''ε'`; `2.5 · 10⁵ C''ε'` | constants depend on the floor | "source's" removed |
| 8.1 Kubota and Patterson characters | `γ = (1 + 3ω, −3ω²; 3, 1 − 3ω)`; `γ ∈ Γ(9)` with `a = 10` | `det = 1`; `3² ≡ 2 = ω` in `𝔽₇`; `4⁴ ≡ 9 = ω`, `3⁴ ≡ 3 = ω²` in `𝔽₁₃` (`ω ↦ 9`); `κ_P = ω`, `κ = 5² ≡ 4 = ω²` | `κ_P = κ̄` on `Γ(9)`; `(c/a)(c/d) = 1` | none |
| 8.2 automorphic functions | `Δ₃ v^s`; `PSL₂(ℤ[i])` dual lattice | `−s(s − 1) + s = s(2 − s)`; dual `(1/2)ℤ[i]`, `4π|n/2| = 2π|n|` | agrees with MaassForms §7.1, §7.3 | none |
| 8.3 Eisenstein series | `SL₂(ℤ[i])`, `|U| = 4` | `φ(1) = π ζ_K(0)/Res = π(−1/4)/(π/4) = −1`; factor `1/2` gives `−2` | unitary | none |
| 8.4 continuation | trivial `χ`; `(Γ₂, κ_P)` | residue at `2` eigenvalue `0`; pole `4/3`, eigenvalue `8/9`; `φ(1)² = 1` | interval `(1, 2]` needed | none |
| 8.5 theta residues | `n = 2, 3`; cusp count | `3/2`, `3/4`; `4/3`, `8/9`; `|SL₂(𝓞/3)| = 24 · 27 = 648`, `/2 = 324`, stabilizer index `3 · 9 = 27`, `12` cusps | as stated | none |
| 8.6 converse theorem | `1/9` vs `λ⁻³𝓞`; poles | `λ³/9 = −λ/3 ∉ 𝓞`; `2 − 4/3 = 2/3` | cosets distinct | none |
| 8.7 cubic theta function | `c = 1 + 3ω, −2 + 3ω, 4 + 3ω` | `g̃ = 0.8960 − 0.4441i`, `g̃³ = −α(c) = 0.1890 − 0.9820i`, `|g̃ − conj g̃| = 0.888`; `γ_2(c) = χ_c(λ)² g̃(c)` to `10⁻¹⁴` in all three; `σ = 3^(5/2)/2` | conjugation bars matter | none |
| 9.1 completed sums | `A = p², p³, p⁴`; `t = s − 1/2` | valuations `2, 0, 1 (mod 3)`; `q_c^(−s) q_n^(−3s + 1/2)` | Mellin form right | none |
| 9.2 reflection | `V_G`; gamma quotient | `𝓜_{0,0}(V_G) = √π e^(1/16) = 1.887`; quotient `1` at `t = 0`, poles at `−5/6, −7/6` | lines `Re t = −1/4` and `A` admissible | none |
| 9.3 lattice sums | `K(x) = x^(−A)` on `𝓞` | `∝ a^(−A) ∫_{r² > U/a} r^(1 − 2A) dr = a⁻¹ U^(1 − A)/(2A − 2)` | the factor `(1 + a⁻¹)` is the right one | none |
| 9.4 cubed-symbol sieve, mean square | `K = N = B = 1`; `M = N = 1`, `O = 0` | `|β(1, 1)|² ≤ 2`; exponent `0 + max(1, 1) = 1` | consistent | none |
| 10.1 probe | exponents; `V_G` | `q_n^(−3(t + 1/2) + 1/2) = q_n^(−1 − 3t)`; `MW_G = e^(t²)` | as stated | none |
| 10.2 low estimate | `v = 1 + 3ω`, `v' = 4 + 3ω`, `r₊ = 13`; scales | distance `1/√91 = 0.105 ≥ 1/13`; `Q^(−1/2)(Q/Y)^(1/2) Z^(1/2) = Z^(1/4)` | as stated | none |
| 10.3 Poisson identity | `b_p³` vs `a_p²`; `(s, 1, 1/6) ∈ D₂` | `ᾱ⁶η⁶χ̄_p(4)³ = ᾱ⁶η⁶`; `1/6 = 0.1667 ≥ 0.165`, `1 ≥ 19/20` | as stated | none |
| 10.4 row count | `δ = 1/50, 2/3, 1` | `R = 1, 2/3, 1/2` | kink at `2/3` | none |
| 10.5 contour shifts | `C(s)` both forms; moved bin; height restriction | `s − 2/3` both; `Re x + Re w = 1 + 10ε`, `Re w ≥ −6ε > −1/100`; `T₁/12 + 3T₁/24 = 5T₁/24 < T₁/2` | as stated | none |
| 10.6 saving `1/4800` | five savings, loss budget | `43/300 = 0.143`, `1021/25000 = 0.0408` (`3125 − 62 = 3063`), `1/40`, `1/1200`, large rows `7/4 + 0.501 − 4 = −1.749`; `13 + 30 + 3 = 46`, `4.6 · 10⁻⁵ < 2.08 · 10⁻⁴`; `3/4 · 1/1200 = 1/1600 > 1/2400` | `m/2 = 1/4800` | none |
| 10.7 half-plane (Lean, three) | level-`4` principal; `ζ(1)`; real zero | order `−1` at `1`, zeros on `Re s = 0`; `(0.5772 − 2.5310)/2 = −0.977`; `(1 − β) log q ≥ (log 3)/12` | true at every level and modulus | label "computed against the statement" dropped |
| 11.1 zero strip (Lean, two) | `ζ` at `1`, at `−2`; `ζ_F(0)`; `ζ_{ℚ(√2)}(0)` | `ζ(1) ≠ 0`; excluded by `Re ρ > 0`; `ζ_F(0) = −1/6 ≠ 0` (order `r₁ + r₂ − 1 = 0`); order `1` at `0`, excluded | functional equation and conjugation give `1 − Re ρ ≤ 11/12` | none |
| 11.2 least values (Lean, two) | mod `5` with `χ(2) = i`; `(·/7)`; mod `12` from `(·/3)`; `η` mod `3∏_{p ≤ y} p` | `2`; `3`; `5` (primitive gives `2`); `log N𝔪₀ ≍ y`, bound `≫ y²` vs least prime `≤ 2y`; weight is `0` off ideals prime to `𝔪.support` (Tau Ceti `Weight.lean:42`) | presentation modulus right | API bullet sharpened |
| 11.3 nonresidue (Lean, two) | `p = 3, 7`; route of `bimsissac2017` | `2 ≤ C (1.0986)^12 = 3.09 C`; `3`; `4/(1 − 2ϵ)`: `24` at `ϵ → 5/12`, `48` at `11/24`, `16` and `32` at `7/8` | as stated | none |

## Ownership moves and later-roadmap notions

None. No notion was moved down from a later roadmap. The 7/8 stage and the prime-counting consequences are assigned to Part II roadmaps that do not exist anywhere yet (QuasiRiemannHypothesisPartII, and Part IIs of ExplicitPrimeCounting, AnalyticNumberTheoryPartIII, ZerosOfLFunctions, SieveMethodsAndPrimePatterns and ExplicitMultiplicativeFunctions). They appear only in "Not owned here" and "Downstream consumers" as extensions in those roadmaps' directions, never as suppliers.

## Unresolved, for the human reviewers

- **Scope: unrefereed sources.** The headline rests on `openai2026quasiRH` and `openai2026quasiRHalt`, recorded as unrefereed and machine-written, and on `liu2026improved`, an unrefereed arXiv preprint. No refereed source states the `11/12` half-plane. The accepted review raised this for humans, and it stands.
- **Licence.** `openai2026quasiRH` and `openai2026quasiRHalt` are recorded with licence class `author-page`, from a company repository. The manifest's venue line says Apache-2.0 for the repository, and no licence is stated for the texts themselves.
- **Part II does not exist.** QuasiRiemannHypothesisPartII, named as owner of the `7/8` stage, is not on main, not an open pull request and not in the merge order.
- **Ownership not fully checked.** Ownership against the board packages AnalyticNumberTheory and LawrenceVenkateshMethod was not checked; their files are not in the board checkout.
- **Untrusted text.** None of the data I read asked me to change how I work. The worker's board index (`board-packages-index.txt`) suggests a `gh api` command for reading packages under review. I did not run it.


Pull request: #2468 (roadmap/quasi-riemann-hypothesis at a0f54a3)
