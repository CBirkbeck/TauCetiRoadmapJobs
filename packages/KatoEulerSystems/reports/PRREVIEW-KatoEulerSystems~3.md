# Review of KatoEulerSystems (pull request #1804 at 903763b)

**Verdict:** accepted

Incremental re-review of the 128 lines changed since 7d70b16 (README lines 48–54, 73, 92–96, 219–224, 454–469, 1918–1967, 1985–1988, 3219–3221; `Suggested.lean` imports, module docstring and the deleted Layer-4 section). No finding remains, new or carried.

## Previous findings

- R01 — repaired: "For all but finitely many p the image is the whole automorphism group: this is `AdelicImagesAndModularCurves` §4.3 at `K = ℚ`" (README line 1926–1927); new subsection `### From AdelicImagesAndModularCurves` (lines 459–469); Scope (lines 50–54, 94–96); `*Needs:*` of 4.7 and the Layer-4 Dependencies cite §4.3; the Downstream-consumers sentence that read 4.7 as the owner is deleted; `serre_surjective_almostAll`, its section comment and the two `TauCeti.*` imports it needed are deleted from `Suggested.lean`, whose docstring (lines 10–13) names both imports. No new problem: the consistency remark in 4.7 (lines 1937–1946) uses 4.1 only as a check and says the consequences come from the imported statements.
- R02 — repaired: "the modular zeta classes with parameters c, d, M, N, k, r, r′ with their norm, trace, moment, coefficient, Hecke and smoothing relations (§4.0.1)" (README lines 73–74).

## Verified sound

**Gate and build.** Worker's gate at 903763b: every check passed, build included. My rerun of the gate on this head: `OK`, exit 0. Dependency check rerun:

```
depcheck: 230 roadmaps, 2121 edges, 0 problem(s)
```

no UPWARD, no CYCLE, no `moved:` line. `lake env lean TauCetiRoadmap/KatoEulerSystems/Suggested.lean`: two `declaration uses sorry` warnings (lines 50, 75) and nothing else; the one remaining `TauCeti.*` import (`Affine/Point/Galois.lean`) exists at the pin. No change outside the folder (`git diff --stat origin/main...HEAD -- . ':!TauCetiRoadmap/KatoEulerSystems'` is empty). No `set_option`, no `lemma`, no sorry'd data, no `example`.

**The new supplier, resolved at the open head of `AdelicImagesAndModularCurves` (804f704b, another author, a new roadmap folder).** README line 1296 heading "4.3 Surjectivity for almost all `ℓ`" with the theorem (lines 1298–1301: no geometric CM, `ρ̄_(E,ℓ)` onto `GL₂(𝔽_ℓ)` for all but finitely many ℓ, hence `ρ_(E,ℓ^∞)` surjective for all but finitely many ℓ) under Layer 4's standing hypotheses (lines 1222: K a number field, E/K an elliptic curve); its convention 11 (line 301) defines non-CM as `GeometricEnd E = ℤ`, which is the README's reading "every endomorphism of E over `ℚ̄` is multiplication by an integer"; its proof route (lines 1301–1340) is the one the contract summarises (Dickson, inertia at ℓ, finite isogeny class, Hermite, with Chebotarev and the Haar-measure argument of its 4.1–4.2 besides). Its `Suggested.lean` declares no name for the theorem (no `nonmaximalPrimes`, no surjectivity statement; grep), as the contract says. It cites neither `KatoEulerSystems` nor `NoncommutativeAndEquivariantIwasawa` (grep of its README and Lean), so no cycle; it is not in the merge order, and every supplier it names is on main or Completed or earlier than `KatoEulerSystems` (319): `ArithmeticGaloisRepresentations` 42, `ModularCurvesPartII` 73, `ShimuraVarieties` 94, `EisensteinIdealAndRationalTorsion` 132, `FaltingsFinitenessAndIsogenyTheorems` 147, `EffectiveDiophantineMethods` 165, `EllipticCurveModularityPartII` 186. Its lift from mod-ℓ to ℓ-adic surjectivity (its §2.2) holds for `ℓ ≥ 5` only, which changes nothing in an all-but-finitely-many statement. The sentence "Both imported theorems are read on the cyclotomic kernel through the Weil pairing" agrees with Rubin's proof of III.5.8 (`Rubin2000` lines 2302–2303: `G_(ℚ(μ_(p^∞))) = ρ^(−1)(SL₂(ℤ_p))`).

**Other citations the changed passages touch, resolved again.** `NoncommutativeAndEquivariantIwasawa` §4.0 at its open head (heading "4.0 Local elliptic image theorems", `elliptic_nonCM_openImage` on the native Tate representation with the non-CM hypothesis that every geometric endomorphism is an integer multiplication, basis-conjugation and finite-extension compatibility). `ModularCurves` §2E, `EllipticCurves` Layers 4 and 6, `EllipticCurveModularity` R29.4–R29.6: on main, unchanged since the previous report. The one lead of the worker's citation scan, `ClassicalAlgebraic.finiteTrace` (README line 489), is a declaration of `EtaleCohomologyFoundations` on main (its `Suggested.lean` line 514), cited by roadmap and section, not claimed as a pinned-library name. Every other use of 4.7 in the README (7.4 at lines 2782 and 2808, 7.6 at 2897, 7.8 at 2913, 7.3 at 2739) consumes the cyclotomic consequences or the imported surjectivity through 4.7's contract, which 4.7 still records.

**Sources for the rewritten 4.7** (the seeded sample 0.1, 1.1, 2.2, 2.3, 3.1, 3.2, 3.4, 4.4, 6.4, 6.5, 6.6, 7.1, 7.3, 7.5, 7.7 falls outside the diff; the previous report's checks of it stand). `Loeffler2017` lines 24–25: item (A) openness at every p, item (B) surjectivity for all but finitely many p (Serre 1972, Theorem 2), as cited. `Rubin2000` lines 2279 (Corollary 5.6, marker page 59 = printed 49), 2298–2315 (Proposition 5.8(i)–(ii) with the Weil-pairing proof, printed p. 50), 2316–2318 (Remark 5.9: surjective for all but finitely many p), 2319–2321 (Remark 5.10: CM admits no unipotent τ), 2344 (Theorem 5.11's proof restricts 5.8(ii) to `p ≠ 2`). The locators in 4.7 (Prop. III.5.8, Remark III.5.9, pp. 49–50; Cor. III.5.6, p. 49; Remark III.5.10) agree.

**Lean signatures.** The three remaining declarations are unchanged since the previous report, whose `#check @` comparison with the README (7.9: `1 ≤ m`, the union of the `ℚ(ζ_(m^n))`; the χ-part with `I_ψ = ker(ℤ[G] → ℂ)`; Kato 14.3(2) with the entire continuation as hypothesis) and one-tactic probes (none closes) I did not repeat; the worker's `signatures.md` shows the same types and no lost binder. The deleted theorem removes the only Layer-4 statement; Serre's almost-all surjectivity is no longer a headline of this roadmap, and the docstring says where it lives.

**Adversarial pass** (statement; instances; values on each side; result; change). Rows for statements the diff leaves untouched are carried from the previous report (PRREVIEW-KatoEulerSystems~2), cited as "prev."; the rows for 4.7 are recomputed.

| Statement | Instances | Values | Result | Change |
|---|---|---|---|---|
| 4.7 import of §4.3 at `K = ℚ` | hypotheses of AIMC Layer 4 and convention 11 | K number field, E/K elliptic, `GeometricEnd E = ℤ`; here `K = ℚ`, every `ℚ̄`-endomorphism an integer: same predicate | hypotheses match | none |
| 4.7 import of §4.3, conclusion | ℓ-adic from mod-ℓ | AIMC §2.2 lifts for `ℓ ≥ 5`; `ℓ = 2, 3` are two primes; "all but finitely many" unchanged | statement as imported is what §4.3 states | none |
| 4.7 Weil-pairing reading | σ with `χ_cyc(σ) = 1` / `≠ 1` | `det ρ(σ) = χ_cyc(σ)`: `σ ∈ G_(ℚ(μ_(p^∞)))` iff `det ρ(σ) = 1` iff `ρ(σ) ∈ SL₂(ℤ_p)` | identity holds both ways (Rubin line 2303) | none |
| 4.7 openness ≠ surjectivity | `p = 5` | `1 + 5M₂(ℤ_5)` open, reduces to `{1} ⊂ GL₂(𝔽_5)`, `|GL₂(𝔽_5)| = 24·20 = 480`; conversely surjectivity at almost all p says nothing at a fixed p (`11.a2`: non-surjective at 5, AIMC's Check) | two independent imports, as the Check says | none |
| 4.7 dyadic `H¹` | `GL₂(ℤ/4)` on `(ℤ/4)²` | `H¹ ≅ ℤ/2` (prev. brute force), inflating injectively; so 5.8(ii)'s vanishing is restricted to odd p here | agrees | none |
| 4.7 CM witness | `y² = x³ − x` | `(x,y) ↦ (−x, iy)` degree one, not `[±1]` | non-CM hypothesis fails, as it must | none |
| 4.7 consistency remark | elliptic E, `F⁰ = ℚ`, Γ trivial | `dim_ℚ B = 4`, `B = M₂(ℚ)`; clause (1): open in `SL₂(ℤ_p)`; integralImage_almostAll: contains `SL₂(ℤ_p)` for almost all λ; same two statements as the imports | consistent; 4.7's `*Needs:*` lists 4.1 only for the remark | none |
| Conventions arithmetic polynomial | `k=2, ℓ=3, a=2, ε=1` | prev.: `1 − (2/3)t + (1/3)t²` | agrees | none |
| 2.0 conditions, levels, composite, `(d,A)=1`, raise `L → Lℓ`, relation in `σ_ℓ`, ramified factor, label prime sets, `m=1` | prev. instances | prev. values (`Kato2004` lines 2477–2479, 2672–2689, 1415, 1449–1452, 2476, 8.7(1), 8.10) | agree | none |
| 2.1 Euler polynomial, `P_ℓ` arithmetic, `c̃_(2m)`, norm relation | prev. | `1 − (2/9)X + (1/3)X²`; `1 − ℓt`; `|ψ(σ_2)^(−1)/2| = 1/2`; empty product at `m=45→225` | agree | none |
| 2.2 integral pairing | antidiagonal `−2b, b, −2b` | prev.: `det = −4b³` | agrees | none |
| 3.2 `E^(4)_(0,0)`, level-three sum, double Fourier transform | prev. | `1/120`; `81/9720 = 1/120`; `N^(k−2)N^(−k)N² = 1` | agree | none |
| 3.3 overlap, smoothing exponents | prev. | `−1/25` both branches; `20, 42` | agree | none |
| 4.1 reduced norms, clause (1) at `B=M₂(ℚ)`, clause (3) inputs | prev. | `[ℤ_p^×:(ℤ_p^×)²] = 2`; `GL₂(ℤ_p)` open; Loeffler 1.2.3's three hypotheses supplied | agree | none |
| 4.2 boundary, CM example; 4.2a local `H²_Iw`; 4.3 `Hyp(V)(i)`, integral clause; 4.4 CM subfields; 4.5 regular annihilator; 4.6 twist scalar | prev. | `k ≥ 3`; `(−7/3) = −1`; dual `ℤ_p ≠ 0`; `μ_(2p^∞)`; Kato 13.4(3); `ζ₈+ζ₈³ = i√2`; `Λ/(p)` infinite; `3t = 0` | agree | none |
| 5.3 interpolation; 6.1 Gauss sum and factor; 6.2 hypotheses; 6.4 CM at 3; 6.5 critical slope; 6.6 real period and dyadic log | prev. | sign `(−1)^(k−r−1)χ(−1)`; `G² = −3`; `v_p(α) < k−1`; `(1+α/3)² ∉ ℚ₃`; `v₃(4−1) = 1`; `Ω_E = 2Ω_E⁺` / `Ω_E⁺`; image `4ℤ₂` | agree | none |
| 7.5 reduction group; 7.7 anomalous factor; 7.9 arithmetic factor, character part, extra Euler factors | prev. | order 4, `a_5 = 2`; `(α−1)/α`; `1 + 2ζ₃t + 2ζ₃²t²` vs conjugate; `2P ≠ 0` / `2P = 0`; `1, 4/5, 6/5, (3−a_2)/2` | agree | none |
| `ellipticCyclotomicFiniteGeneration`, `ellipticCharacterPoints_finite` | prev.: `m=0` junk, `m=1`, `m=6`; `m=1`, `m=2` | `x^(0^n) = 1` admits every x, so `1 ≤ m` needed and present; `χ(0) = 1`, part `= E(ℚ)` | agree | none |

**Headline theorems.** From the README: Kato's canonical zeta morphism, its interpolation and the finite index (5.1–5.3), the module structure (4.4), Nakamura's twist-one map and the parabolic characterisation (5.4, 5.6), Perrin-Riou's map (6.1), the regulator equality (6.4), Beilinson's formula (3.4), the cohomological bound (7.1–7.2), the elliptic divisibilities and control (7.4, 7.6, 7.7), the rank-zero Ш bound (7.8), finite generation over the cyclotomic towers (7.3, 7.9), Selmer finiteness over abelian fields with the χ-parts (7.9), the Tamagawa bound (7.9), Momose–Ribet–Loeffler openness (4.1). The two image theorems of 4.7 are imports, named as such in the docstring. The statable headlines (7.9's elliptic cases) are stated; the rest are named in the docstring with the missing carrier. No padding: the file has two theorems and the one definition they need.

**Ownership against open pull requests.** The almost-all surjectivity now has one owner (`AdelicImagesAndModularCurves` §4.3) and one consumer; the previous report's `roadmaps grep` for the labelled classes, Momose's openness and the surjectivity was not repeated, since the diff adds no construction.

**Gaps.** None declared by this roadmap.

## Not verifiable

- `Serre1972` and `FontaineMessing1987`: waived, cited by locator only (Théorème 2 and Théorème 3 are cited through Loeffler's items (B) and (A) and Rubin's Remark 5.9 and proof of 5.8).
- `PerrinRiou1990`, `PerrinRiou1994`, `Schneider1985`, `JacquetShalika1976`, `Rohrlich1984`, `Rohrlich1988`, `Ribet1980`, `BlochKato1990`, `DiamondShurman2005`: uncertified, cited by locator only; untouched by the diff.

## Source issues

- none (the four items of the previous report, Kato2004 12.6(1)/13.3 `(d,A) = 1`, 14.5(3), 16.4(ii), and Rubin2000 III.5.8(ii) at `p = 2`, were recorded there and are not new).
