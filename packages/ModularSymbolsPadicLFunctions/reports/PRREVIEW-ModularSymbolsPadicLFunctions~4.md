# Review of ModularSymbolsPadicLFunctions (pull request #968 at 59250ee)

**Verdict:** accepted

Incremental re-review of the 64 lines changed since `9640032`, plus the pull request's title and description. No finding: both findings of the previous review are repaired, the repairs introduce no new problem, and the gate passes.

## Previous findings

- R01 — repaired: main is merged; `lake-manifest.json` pins Tau Ceti `2fd255d9`, Mathlib `1b1ccf4b`; the targeted build completes with two `sorry` warnings; README lines 101, 201 and 225 say "the pinned Tau Ceti library" / "the pinned Mathlib", no hash.
- R02 — repaired: README lines 2243–2250 put `Ψ(c)` at `f ↦ f(−c)`, give `Ψ(0) = δ₀`, `Ψ(1/ℓ) = −ℓ⁻¹·(f ↦ f(−1/ℓ))`; line 2254 reads "first derivatives at the points `−c`"; Checks at lines 2273–2280 pin the point and the sign.

## Verified sound

| Statement (changed or cited by the change) | Instances and values | Result |
|---|---|---|
| §3.4 transport of [BD]'s action to §2.2 by `f ↦ f(−z)` (lines 2243–2245) | BD side, reflected: `(a + cz)^k f((−dz − b)/(a + cz))`; §2.2 side on the reflected `f`: `(a + cz)^k f(−(b + dz)/(a + cz))`; equal for the same `γ`, so the evaluation at `c` becomes the evaluation at `−c`, scalar unchanged | Pass |
| §3.4 `Ψ = Φ − Φ|V_ℓ` (lines 2245–2250) against BD formulas (29), (39) and Theorem 5.8 at `k = −2`, `ψ = τ = 1` | (39) at `u/v = 0/1`: `d^k f(b/d) = y⁻² f(x/y)`; (29): factor `ℓ⁻¹` for `ℓ ∤ y`, `ℓ^{−k−1} = ℓ` for `ℓ | y`; `Ψ(0) = (1 − ℓ⁻¹)δ₀`, `Ψ(1/ℓ) = (1 − ℓ)ℓ⁻²·ev`; ratio `−ℓ⁻¹` | Pass |
| §3.4 hypotheses of BD Theorem 5.8 at these parameters | `k = −2 ≠ −1`; `τψ(−1) = 1 = (−1)^{−2}`; `N/M = ℓ` squarefree; "bad" needs `k = 0`, so `ℓ` is not bad; critical operator `1 − ψ(ℓ)V_ℓ` has `U_ℓ = τ(ℓ)ℓ^{k+1} = ℓ⁻¹`; `U_p = ψ(p) = 1`; `T_q = 1 + q⁻¹`; sign `ψ(−1) = +1` | Pass |
| §3.4 Check at `Γ₀(33)` (lines 2273–2277) | `γ = (−32 3; −363 34)`: `det = −1088 + 1089 = 1`, `363 = 11·33`; cusp `(−32/11 + 3)/(−33 + 34) = 1/11`; at `x = 1/11`: `a + cx = −65`, point `(67/11)/(−65) = −67/715`, factor `65⁻²`; at `x = −1/11`: `a + cx = 1`, point `(3 − 34/11)/1 = −1/11` | Pass |
| §3.4 Check of the `U_ℓ`-eigenvalue at the cusp `0` (lines 2278–2280) | `(1 a; 0 ℓ)`: `γ·0 = a/ℓ`, `(γ·f)(z) = f(a + ℓz)`, at `z = −a/ℓ` gives `f(0)`; sum `1 + (ℓ − 1)(−ℓ⁻¹) = ℓ⁻¹`; wrong sign: `1 + (ℓ − 1)ℓ⁻¹ = 2 − ℓ⁻¹ ≠ ℓ⁻¹`; `ℓ = 11`: `1/11` against `21/11` | Pass |
| §3.4 invariance of `Ψ(0) = δ₀` and the cusp classes | stabiliser of `0`: `(1 0; c 1)`, `ℓp | c`: factor `(1 + c·0)^{−2} = 1`, point `0`; `Γ₀(ℓp)` has 4 cusp classes (denominator gcd `1, ℓ, p, ℓp`), the `p`-integral ones are 2; `a/ℓ`, `a ≢ 0`, has gcd `ℓ` | Pass |
| §1.2 untwisted case against `TauCeti.cuspIntegral_mul_pow_zero_infty_eq_L` (lines 1390–1391) | pinned: `∫_0^{i∞} f z^j dz = j!/(−2πi)^{j+1}·L(f, j + 1)`; reversed and times `2πi`: `(−2πi)·j!/(−2πi)^{j+1} = j!/(−2πi)^j`; `j = 0`: `2πi∫_{i∞}^0 f = L(f, 1)` | Pass |
| `critical_values_algebraic` with `TauCeti.CoefficientField` (Suggested line 100; README lines 1426–1430) | pinned field: `ℚ(a_n, n ≥ 1)`; `char_mem_CoefficientField` gives `ε(u) ∈ K_f`, so it equals the removed `ℚ(a_n, ε)` (which also adjoined `a_0 = 0`); `N = 11, k = 0`: `K_f = ℚ`, target `ℚ(χ)`; `j ≤ k` keeps `k − j` free of truncation | Pass; statement unchanged in content |
| Supplier contract `CuspForm.twist` (lines 239–240) | pinned signature: `Φ : ZMod M → ℂ`, `N * M ∣ L`, `M * M ∣ L`, from `Γ₁(N)` to `Γ₁(L)`; `CuspForm.qExpansion_twist_coeff` gives coefficients `Φ(n)a_n`; `N = 11, m = 3`: `L = 99` | Pass |

The rows for untouched statements stand as in the previous review, of `9640032`.

- Gate rerun on this head: every text scanner 0, `depcheck=0`, `outside-folder=0`, `stray-files=0`, OK; the worker's gate has `build=0`. `lake build TauCetiRoadmap.ModularSymbolsPadicLFunctions.Suggested`: "Build completed successfully", warnings: `sorry` at lines 75 and 100 and Mathlib's module-system notice. `lake env lean` on `Suggested.lean`: the two `sorry` warnings only.
- Dependency check output: `depcheck: 247 roadmaps, 2248 edges, 0 problem(s)`; no UPWARD, CYCLE or `moved:` line.
- `#check @critical_values_algebraic` on a scratch copy: the elaborated type carries `[NeZero N]`, `[NeZero m]`, `χ.IsPrimitive`, `j ≤ k` and `TauCeti.CoefficientField f`, as README lines 1426–1430 state; nothing changed. One-tactic probe (`simp`, `rfl`, `infer_instance`, `exact?`) on both theorems: neither closes.
- Library declarations opened at the pins: `TauCeti.CoefficientField` (`NumberTheory/ModularForms/Newforms/Fields.lean:48`), `TauCeti.char_mem_CoefficientField` (same file, line 131), `TauCeti.cuspIntegral_mul_pow_zero_infty_eq_L` (`NumberTheory/ModularForms/LFunction/Period.lean:71`), `CuspForm.twist` (`NumberTheory/ModularForms/Twist/Basic.lean:212`), `CuspForm.qExpansion_twist_coeff` (same file, line 314). After the change of pins, 61 library names cited in README lines 101–119 and 201–247 were searched at the new pins: all are declared there.
- Source locators read: BD lines 471–479 (`V_t`), 621 (the action), 885–890 (formula (29)), 903–905 (bad primes), 1338–1353, 1446–1469 (formula (39), p. 34), 1483–1498 (Theorem 5.8, p. 34), 1526–1550. Of the seeded sample, only §3.4 and §1.2 fall in the changed passages.
- Pull request text: the title, the summary block and the prose were read against this head and the folder's change (a new folder of three files, 50 headings, 6 declarations). The "Validation" sentence now holds as written (build at main's pins, two `sorry` theorems, the Mathlib notice). The removal of `coefficientField` is a repair inside an added file that the description never named; no sentence is contradicted.
- Outside-folder diff against the base: empty. No Lean name of `Suggested.lean` is declared by another roadmap (search of all open heads and main).
- Remark: with `CuspForm.twist` at the pins the twisted Mellin identity of §1.2 could now be written with `ModularForm.L`; it is a supporting identity, the headline is the algebraicity, and the docstring states the `L`-value side.

Overlap check: read PadicFamilies, KatoEulerSystems, ModularIwasawaMainConjectures, EllipticCurvePeriodsAndModularParametrizations, AutomorphicGaloisRepresentations, ModularForms, NoncongruenceModularForms; Hom-side symbols, period lines, single-weight distribution modules and the critical-slope functions: this roadmap (the first four cite it by section); the coefficient field of a newform and Dirichlet twists of cusp forms: ModularForms and the pinned Tau Ceti, now cited and no longer defined here; families: PadicFamilies.

Source independence: changed passages only; 5 changed passages compared with 1 source (BD lines 885–890, 1338–1353, 1446–1469, 1483–1498, 1526–1547) and with 2 pinned docstrings, none shared (the new prose restates formulas in the roadmap's own convention); largest share [PS], 66 of about 153 locators as counted in the previous review, the diff adding one [BD] locator; contents not compared again (the diff adds, removes and reorders no layer).

## Not verifiable

- [Pollack SS], [PS critical], [Kisin], [Rubin], [Shokurov] Theorem 4.3(a) and the one-dimensionality hypothesis of §3.4 (ii): as in the previous reviews; not reopened, since no changed passage cites them.

## Source issues

- **Gap** in BD at Proposition 5.9, arXiv p. 35: the proof treats the normal Eisenstein case and leaves the exceptional `E_{2,ℓ}` case to the reader; it should give the boundary symbol with values at `0` and `1/ℓ` explicitly; affects nothing.

## For the human reviewers

- none
