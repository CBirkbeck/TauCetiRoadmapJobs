# Review of ClassicalArithmeticCompletion (pull request #1409 at a00d041)

**Verdict:** accepted

🤖 Independent AI review: an incremental re-review of the 40 lines changed since aa03308. The AI never approves or merges. "Accepted" means this roadmap folder is ready for a human's final approval.

- **What changed:** §7.12a again constructs the standard trace characters, their conductors, the self-dual measures and local Fourier inversion. The scope, the supplier contracts and §§7.13 and 7.30 again cite §7.12a instead of AnalyticNumberTheoryPartII §5.3g.
  - §7.12a gains a tower bullet stating ψ_(K′) = ψ_K∘Tr_(K′/K), with ψ_K defined for every finite K/ℚ_p.
  - The self-dual scaling bullet now names the normalised absolute value.
  - There are two new Checks: one on ℂ, and one with two ramified towers over ℚ₃.
  - Mathlib `Algebra.trace_trace` is now cited in the §7.12a *Needs* line and the Layer 7 dependency list.
- **Gate:** passes (`OK`), with 0 dependency-check problems.
- **Previous findings:** R01 and R02 are both repaired. The repairs introduce no new problem.
- **New findings:** none.
- **Mathematics of the change:** every new sign, volume, trace and character value recomputes (table below). The tower bullet's definition of ψ_K for every finite extension of ℚ_p also settles the earlier remark that §7.13, which works over any finite F/ℚ_p, matched a character defined only at completions of number fields.
- **Elaboration:** `Suggested.lean` is unchanged. It elaborates with only `sorry` warnings.

## Previous findings

- R01 — repaired: `README.md:14067` reads "For a number field F define the additive trace character on its adeles by exp(2πix) on the real component of ℚ, exp(−2πi frac_p(x)) on ℚ_p, and local traces from F." The README has 0 occurrences of "AnalyticNumberTheoryPartII" or "5.3g", and the dependency check prints 0 problems.
- R02 — repaired: the *Needs* line at `README.md:14107` reads "…; Tau Ceti `TauCeti.IsLocalRing.ramificationGroup`; Mathlib `Algebra.trace_trace`; Mathlib Haar measures, Fourier transforms, Schwartz functions and finite Gauss sums." Line `:16764` of the Layer 7 dependency list reads "- Mathlib `Algebra.trace_trace`."

## Verified sound

### Scope

I read head `a00d041a1948f0afe009cecb841ffc3877962be0` and checked:

- every passage of the 40-line diff (`scratch/changes.md`);
- the passages that cite them: §§7.12b and 7.12c, the §7.12a Tate-constant API at `:14096–14105`, §7.13 at `:14161` and `:14201`, §7.30 at `:14604`, `:14606` and `:14626`, and the Layer 7 dependency list;
- the gate, the dependency check, the elaboration, the signatures and the overlap facts.

Other facts about the head:

- `git diff d8a53de a00d041 -- TauCetiRoadmap/ClassicalArithmeticCompletion` touches only `README.md`. Every hunk is in §7.12a (`:14073–14081` and `:14107`) or is the Layer 7 line `:16764`. So every other passage R01 asked to revert (`:28`, `:242`, `:258`, `:14161`, `:14201`, `:14604`, `:14606`, `:14626`) is byte-identical to d8a53de, which the report on d8a53de passed. The subsection "From TauCetiRoadmap.AnalyticNumberTheoryPartII, §5.3g" is gone.
- `git diff --stat origin/main...HEAD -- . ':!TauCetiRoadmap/ClassicalArithmeticCompletion'` is empty, so nothing changes outside the folder.
- The folder holds `README.md`, `Suggested.lean` and `metadata.toml`.
- The pins are Mathlib `1b1ccf4b088b32fa3f23f2de1127433254a81e1e` and Tau Ceti `2fd255d997f47c0b5d834ee416c7015d55444ce5`.

### Gate, build and dependency check

- **Gate (my run):** `set_option=0 blob=0 latex=0 tex=0 prnum=0 sorry-data=0 sorry-examples=0 residue=0 private-paths=0 imports=0 mathlib-subimports=0 no-import-mathlib=0 lean-lines=0 statement-hygiene=0 forbidden=0 dropped=0 readme-ids-missing=0 empty-sections=0 round-labels=0 long-fences=0 layer-ids=0 target-ids=0 depcheck=0 metadata=0 stray-files=0 dirty=0 outside-folder=0 source-material=0 OK`. The worker's run (`scratch/gate.md`) agrees and adds `build=0`.
- **Dependency check**, output verbatim:

  ```text
  depcheck: 239 roadmaps, 2382 edges, 0 problem(s)
  ```

  There is no UPWARD, CYCLE or `moved:` line. The edge count is the d8a53de count that the report on aa03308 obtained on a scratch copy of the d8a53de README. The ClassicalArithmeticCompletion → AnalyticNumberTheoryPartII edge is gone.
- **Elaboration:** `lake env lean TauCetiRoadmap/ClassicalArithmeticCompletion/Suggested.lean` exits 0. It prints 45 warnings, all `declaration uses 'sorry'`, and 0 errors. The only other output is the two `#check` lines that pin `pow_card_eq_one'` and `pow_ne_of_irreducible_X_pow_sub_C`.
- **Signatures:** I copied `scratch/signatures/SignatureCheck.lean` into a scratch file and dropped the two spurious entries `#check @targets` and `#check @group`, which come from docstring words.
  - I elaborated it once with the 71 `#check @` lines for the declarations: exit 0, 0 errors.
  - `Suggested.lean` is byte-identical to aa03308 and d8a53de (`git diff --stat` empty). The README–Lean comparison of the earlier reports therefore stands: 0 lost binders, no retyped declaration, and nothing changed.

### Headline theorems and padding

No declaration was added, removed or retyped, so the headline list and the one-tactic padding probe of the earlier reports stand.

- **Stated.** The module docstring (`Suggested.lean:15–22`) lists:
  - compatible CRT and power residues;
  - Lucas and Ward strong divisibility, Christol and Cobham;
  - rectangular Smith forms and cokernels, Perron and Capelli;
  - Jacobi triple products, four squares, Markoff descent, three squares, Egyptian fractions and Ramanujan–Nagell;
  - negative Pell, factor-base generation and class-number/unit completeness;
  - Smyth, explicit and asymptotic Dobrowolski, the smallest Pisot number, Salem-field generators, Schinzel–Zassenhaus, Dubinin and Bertrandias;
  - reduced-norm existence, local Noether, Hilbert–Speiser, strong approximation and tame determinant descent.
- **Named as not statable.** The docstring (`:25–40`) names, each with its missing carrier:
  - higher reciprocity;
  - §§5.1b, 5.1c and 5.16a(i)–(ii);
  - §§7.115–7.123;
  - §§7.12a–7.12c.
- **Effect of the diff.** The diff adds API facts to §7.12a, not headlines. Its docstring item, "Tate's local functional equation … lack[s] the local zeta-integral/epsilon-constant constructions", is still accurate: neither pin has a local zeta integral or epsilon constant.

### Library declarations opened at the pins

- `Algebra.trace_trace`, `Mathlib/RingTheory/Trace/Defs.lean:137`, in `namespace Algebra` (opened at `:63`). It states `trace R S (trace S T x) = trace R T x` under `[IsScalarTower R S T] [Module.Free R S] [Module.Finite R S] [Module.Free S T] [Module.Finite S T]`.
  - For finite extensions of local fields, freeness is the instance `Module.Free.of_divisionRing` (`Mathlib/LinearAlgebra/Basis/VectorSpace.lean:156`), and finiteness is the hypothesis.
  - The same holds for ℝ ⊂ ℂ.
  - The lemma is exactly the input that the §7.12a tower bullet names.
- **No duplicate of the restored §7.12a objects at the pins:**
  - Mathlib `AddChar.traceChar` (`Mathlib/NumberTheory/AddCharacter/Trace.lean:56`) is the trace character of a `ZMod n`-algebra.
  - Tau Ceti's `WeightSpace.principalChar` (`TauCeti/NumberTheory/Padics/WeightSpace.lean:122`) and Mathlib's `Padics/AddChar` are ℤ_p-characters with values in p-adic rings.
  - A grep of both pins for a standard additive character or a self-dual measure on a local field finds none.

### Adversarial computations: changed statements

| Statement | Instances and values computed on both sides | Result |
|---|---|---|
| §7.12a, `:14073`: ψ_b multiplies the self-dual measure by \|b\|^(1/2), with \|·\| normalised (on ℂ, b b̄) | **ℂ, b = 2.** ψ_ℂ(2zw) = exp(2πi·(4xu − 4yv)), and \|det diag(4, −4)\|^(1/2) = 4, so 4 dx dy = \|2\|_ℂ^(1/2)·2 dx dy with \|2\|_ℂ = 4. With the ordinary modulus (factor √2, measure 2√2 dx dy), f = e^(−4π\|z\|²) gives f̂(0) = 2√2·(1/4) ≈ 0.707 ≠ f(0) = 1. With 4 dx dy it gives f̂ = f exactly. **ℂ, b = i.** \|i\|_ℂ = 1, the pairing is −2(xv + yu) with \|det\| = 4, and 2 dx dy is unchanged. **ℚ₂, b = 2.** vol(ℤ₂) becomes 2^(−1/2) = \|2\|₂^(1/2). | holds |
| §7.12a, `:14096` versus `:14073`: ε(χ, ψ_b, dx) = χ(b)\|b\|⁻¹ε, and −1/2 with self-dual measures on both sides | At a finite place ν′ = ν + v(b) and c′ = cb, giving the factor χ(b)q^(v(b)) = χ(b)\|b\|⁻¹. Then dx_b = \|b\|^(1/2)dx multiplies ε by \|b\|^(1/2), leaving χ(b)\|b\|^(−1/2). The same normalised \|·\| appears in both bullets. | consistent |
| §7.12a, `:14074`: ψ_(K′) = ψ_K∘Tr_(K′/K), ramified or not | **Ramified tower** ℚ₃ ⊂ ℚ₃(√3) ⊂ ℚ₃(√3, i), x = (1+√3)/9: the traces are 2(1+√3)/9, then 4/9, and directly 4·(1/9) = 4/9. Both routes give ψ = e^(−8πi/9) ≈ −0.940 − 0.342i. **Unramified** ℚ₃ ⊂ ℚ₉ = ℚ₃(i), x = (1+i)/3: Tr = 2/3 and ψ = e^(−4πi/3), with x ∉ O = 𝔇⁻¹. **Wild** ℚ₂ ⊂ ℚ₂(i): x = (1+i)/2 ∈ π⁻²O has Tr = 1 and ψ = 1, while x = (1+i)/4 has Tr = 1/2 and ψ = −1. So the conductor is 𝔇⁻¹ = π⁻²O, matching d = 2 in Check `:14080`. **Archimedean** ℝ ⊂ ℂ, z = 1/8 + i: Tr = 1/4 and ψ_ℂ(z) = i. **Global** ℚ(i)/ℚ at w = (1+i): one place over 2, so Tr_(E/ℚ) = Tr_(E_w/ℚ₂) on E. | holds |
| §7.12a, `:14074`: negative versus positive naming, against §7.12a `:14102`, §7.13 `:14161` and §7.30 `:14606` | §7.13: ψ_F⁻(x) = ψ_F⁺(−x) = exp(−2πi frac_p(Tr x)) = ψ_F(x) for every finite F/ℚ_p. At F = ℚ₃, x = 1/3, both sides are e^(−2πi/3). §7.30 with χ₋₃ (χ(3) = 1): the negative character gives Gauss sum e^(−2πi/3) − e^(−4πi/3) = −i√3, so E₃⁻(1/2) = −i, and the real place contributes i^(n₋) = i, so W = 1. With ψ⁺ at 3, W = −1, which is impossible for a quadratic character. | consistent |
| New Check `:14079` (ℂ, ψ_ℂ(2z)) | 2 dx dy becomes 4 dx dy, factor 2 = 4^(1/2). The ordinary modulus gives √2. The Gaussian values are those of row 1. | holds |
| New Check `:14081` | **First sentence.** Tr_(E/ℚ₃)(1/3) = 2/3, and ψ_ℚ₃(2/3) = e^(−4πi/3) = −0.5 + 0.866i. The extension model gives ψ_ℚ₃(1/3) = e^(−2πi/3) = −0.5 − 0.866i, a different value. Also v_π(1/3) = −2 < −1 = −d, so ψ_E(1/3) ≠ 1 is consistent with conductor π⁻¹O_E, while 1/√3 has Tr = 0 and ψ = 1. **Second sentence.** The diagonal coefficients of x·1, x·√3, x·i and x·√3i are each 1/9, totalling 4/9. ℚ₃(√3, i) has degree 4, because i ∉ ℚ₃ (−1 is not a square mod 3) and ℚ₃(i) ≠ ℚ₃(√3) (unramified versus ramified). | holds |
| *Needs* `:14107` and Layer 7 `:16764`: Mathlib `Algebra.trace_trace` | The declaration is found at the pin with its hypotheses (above), and they hold for every tower in the tower bullet. The list stays alphabetical (`trace_surjective` < `trace_trace`). | holds |
| Scope `:28`, contract `:242`, ownership table `:258`, *Needs* `:14201` and `:14626` | Every reference to the trace characters now points to §7.12a. The anchors `#712a-tate-factors-and-trace-characters`, `#712b-…`, `#712c-…` and `#713-…` resolve to the headings at `:14065`, `:14109`, `:14137` and `:14159`. | consistent |

### Citations, overlaps and ownership

- **Citations.** `scratch/citations.md` lists no cross-roadmap citation found nowhere. The diff adds no backticked name of this roadmap's own; it adds one Mathlib name, which is found at the pin (above).
- **Overlaps.** `scratch/overlaps.md` lists:
  - no other open pull request changing this roadmap;
  - no dropped id that it cites;
  - no id that only an open revision defines;
  - no dropped id of its own that others cite.
- **Moved down (recorded as the brief requires).** The scalar standard trace characters, their conductors, the self-dual measures, the local Schwartz–Bruhat spaces and local Fourier inversion are again §7.12a targets. They were moved down from AnalyticNumberTheoryPartII §5.3g, since this roadmap is on main and that one is not.
- **Ownership against open pull requests.** Two open drafts still name AnalyticNumberTheoryPartII §5.3g as the single owner of the same scalar character. I read both through the roadmaps tool.
  - AnalyticNumberTheoryPartII (#1167 at `c0e5090`), `README.md:7` ("This part is their single owner") and `:681`.
  - AutomorphicLFunctionsAndLocalFactors (#924 at `330bb72`), `README.md:11` and `:19`.
  - The single owner must be the earliest roadmap. This roadmap is on main, and a roadmap on main may not cite either draft (that was R01). So the citation belongs in those two pull requests: each should cite ClassicalArithmeticCompletion §7.12a for the case V = F_v, B(x, y) = xy and keep its general pairings.
  - That edit belongs to those pull requests, as the report on aa03308 said. It is not a repair of this folder, and this folder already declares the ownership (`:242`, `:258`).
- **Checkouts.** No checkout of #1167 or #924 was supplied. Ownership against the other open pull requests was not checked beyond the roadmaps tool.

### Seeded sample

None of the fifteen seeded targets falls in the diff or cites a changed passage. A scratch scan of each section for `7.12a`, `7.13`, `7.30`, "trace character", "self-dual", `trace_trace`, `5.3g` and `AnalyticNumberTheoryPartII` found 0 hits in all fifteen. Following the incremental instruction, I did not reopen their locators. I recomputed each statement:

| Target (line) | Instances and values | Result |
|---|---|---|
| 1.62 (`:1953`) | m = 3, π primary of norm 7: Φ(π) = 7π̄ = ππ̄² and π^γ = π·σ₂⁻¹(π)² = ππ̄², so ε = 1. \|Φ\|² = 49·7 = 343 = \|Nπ\|³. | holds |
| 2.11 (`:2819`) | mediant(1/3, 1/2) = 2/5, with bc − ad = 3 − 2 = 1, in lowest terms. mediant(1/3, 2/3) = 3/6 = 1/2, so the denominator is 2. mediant(−1/2, −1/3) = −2/5 ∈ (−0.5, −0.333). | holds |
| 2.28 (`:3311`) | (X−2)(X−3)(X−5) = X³ − 10X² + 31X − 30. The closed form 2ʰ + 3ʰ − 5ʰ gives 1, 0, −12, −90, and the recurrence gives u₃ = −120 + 30 = −90. For the control ofMonic X², δ₁ ≠ g(1)·0¹ = 0. | holds |
| 2.38 (`:3578`) | The overlap has length ⌊2B/3⌋ − ⌈B/3⌉ + 1. For B = 3k, 3k+1, 3k+2 this is k+1, k, k+1, at least ⌊B/3⌋ = k each time. B = 7 gives [10, 11] and B = 8 gives [11, 13], as in the Checks. For B < 6 no p_x exists. | holds |
| 3.2 (`:4971`) | X² − X − 1 (roots 1.618 and −0.618) is irreducible. X² − 2X is excluded by f(0) = 0. (X−2)² has two outer roots counted with multiplicity. X² + 1 has two roots of modulus 1, so the hypothesis fails. | holds |
| 4.47 (`:8411`) | d = 2: ε³ = 7 + 5√2 and ε⁵ = 41 + 29√2, with 41² − 2·29² = −1. ε⁻¹ = −1 + √2 gives k = −1, which is odd. d = 3 is excluded, since −1 is not a square mod 3. | holds |
| 6.14 (`:11903`) | T = 1 + 2Y − 2Y² + 4Y³ − 10Y⁴. In T², the Y² coefficient is −4 + 4 = 0 and the Y³ coefficient is 8 − 8 = 0. Also C(1/2, 2)·16 = −2. | holds |
| 6.28 (`:12265`) | a = 3 gives φ². a = 4 gives 2 + √3, whose conjugate 2 − √3 = θ⁻¹ has modulus < 1. a = 2 gives θ = 1, which is not Pisot. | holds |
| 6.34 (`:12390`) | y = 13: 28561 > 243(log 13)⁵ = 26977.4, x = 100.03 and 3x/(5 log x) = 13.03 > 13. y = 10 gives 9.79 < 10. At x = 41/2 there are five primes (23–41) against a bound of 4.07. For α = 0, F = X¹³ fails. | holds |
| 6.42 (`:12600`) | For u = log(\|z\|/r)/log(R/r), ∫\|∇u\|² = 2π/log(R/r). R = 2, r = 1 gives 2π/log 2 ≈ 9.06. Scaling both radii by 3 changes nothing, and the value tends to ∞ as R ↓ r. | holds |
| 7.49 (`:15065`) | ℤ[2i] has Gram matrix diag(2, −8), so r = −16. Then i = (8/16)·2i lies in (1/16)(ℤ + ℤ·2i). The overorders are ℤ + fℤi with f \| 2. | holds |
| 7.99 (`:16166`) | G = 1: there are no symplectic characters, Det U(ℤ) is all unit ideles, and D_H = 0 = Cl(ℤ). | holds |
| 7.119 (`:16623`) | G = 1: y_p(1) = −1 and τ_p(1) = 1, giving Det(−1). For C₂ × C₃, e = (1+s)/2 has e² = e and e ∉ ℤ₂[C₂]. | holds |
| 7.122 (`:16701`) | The 2-dimensional representation of Q₈ has indicator −1. S₃ and D₄ are realisable over ℝ (indicator 1). Abelian groups have only 1-dimensional representations. | holds |
| 7.123 (`:16724`) | rank_ℤ 𝓞_M = \|Γ\|[N:ℚ], so the free rank is [N:ℚ]. The cubic subfield of ℚ(ζ₇) is tame and has a normal integral basis, which agrees with Hilbert–Speiser. | holds |

### Carried adversarial evidence for untouched statements

The diff changes no other README target and no Lean type. All other rows therefore carry unchanged from the earlier reports in `packages/ClassicalArithmeticCompletion/reports/`:

- the headline rows of the full review `PRREVIEW-ClassicalArithmeticCompletion~1.md`, and of `~2.md` for the headlines added there (for example, Jacobi 4.40 and four squares 4.102);
- the increments of `~3.md` to `~6.md`;
- the rows of `~7.md` for the contract, the conductor, the volumes, the archimedean measure and §§7.13 and 7.30. Those rows recompute unchanged against the restored §7.12a: x = 1/3 gives product 1, vol(O) = N(𝔇)^(−1/2) is 3^(−1/2) for ℚ₃(√3) and 1/2 for ℚ₂(i), and the measure on ℂ is 2 dx dy.

### Remarks on untouched or out-of-folder text (no change requested)

- **Pull-request description.** Its depends-on block still lists "#1167 AnalyticNumberTheoryPartII", which the README no longer cites (0 hits). Dropping that entry lets this pull request merge without waiting for #1167. Its Dependencies and Merge-order paragraphs name AnalyticNumberTheoryPartI (#1126), which the README does not cite either (0 hits), as the report on aa03308 noted.
- **Scope paragraph, `:28`.** It names §§7.12a–7.12c for the Tate, Deligne–Langlands and Artin equations, but not the trace characters and self-dual measures. Those appear only in the contract (`:242`) and the ownership table (`:258`). This is the d8a53de wording, which R01 asked to restore.
- **§2.11 Checks.** The fourth Check repeats the first three.

## Not verifiable

None.

- The changed passages add no locator.
- The §7.12a locator (Deligne §3.1–§3.11, pp. 524–532; Kudla §3, pp. 120–125, and §4, pp. 127–129) is the d8a53de locator that the earlier reports passed. I did not reopen it.
- No seeded target falls in the diff.

## Source issues

- none
