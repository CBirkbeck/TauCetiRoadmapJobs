# FIX-DESIGN-EllipticCurveModularityImaginaryQuadraticPartII~9

Repair of the two P3 findings of REV-DESIGN-EllipticCurveModularityImaginaryQuadraticPartII~8 (design, round 8).
Files edited: `packages/EllipticCurveModularityImaginaryQuadraticPartII/design/README.md` and `design/plan.json`.
`sources.toml` is unchanged. The review's "For the human reviewers" section (scope, licences) was not acted on.

## F01 (P3) — applied

Verified. In §3.3, `q_v` is the residue cardinality and `q` the Tate parameter. `U` is the unipotent matrix in Layers 3 and 6 and the parameter open in Layers 2 and 7. Changes: `E_q`, `v(q)`, `q = ϖ_v⁵` → `E`, `v(q_E)`, `q_E = ϖ_v⁵` (§3.3 Checks, Layer 3 Examples). The `ad⁰` Conventions bullet now says where each `U` occurs.

Pattern repair (same defect elsewhere, all fixed):
- Supplier contracts: ArithmeticGaloisRepresentations §6.3 and EllipticCurves Layer 4 used `q` for the Tate parameter, while the same list uses `q` for the residue cardinality (LocalGaloisDeformationRings §2.6). Both now use `q_E`. The §6.3 parenthetical also gains the hypothesis it lacked: "for `ℓ` prime to the residue characteristic". Without it the claim is false: that roadmap's own Check gives `q = 3³` over `ℚ₃` with `ℓ = 3`.
- `t`: the Conventions define it as the switch parameter (Layers 2, 7, 8), but in Layers 4–5 it is `|T|`. The parent-notation bullet now says so.
- §4.3, first Check: `q − 3[F⁺:ℚ] − 1 + |S|` at `q = 6`, `|S| = 1`. Here `q` (CrystallineLocalGlobalCompatibilityCM's count of Taylor–Wiles primes) collided with the rational prime `q` of the Layer 4 Examples. `|S| = 1` also contradicted §4.3's own `S = T ⊔ P` with `P` nonempty. The count is now stated in words: six primes, `[F⁺:ℚ] = 2`, one framed place. The Check adds that only the formula is compared, because that section needs an imaginary quadratic subfield and `ℚ(ζ₅)` has none (its own fifth Check).
- §2.3 Check: `q = 4` → `q_v = 4`, the residue-cardinality convention.
- §3.2 Check: `N` was not bound. It is now "the norm `N = 1 + D + D²` of `D = Ad(U)`".

Plan tests changed to match: `protected_tate`, `protected_tate_divisible`, `unitary_shift` (§2.3) and `presentation_cyclotomic_five` (§4.3).

Checked and left unchanged, because each is bound in its own sentence: `r ∈ ℤ/3` (§7.1), the odd integer `d ≠ q` (§7.2), `N` as `ρ_A(τ) − 1` (§3.4) and as a level (§4.1–4.2).

## F02 (P3) — applied

Verified. In the CaptainSude26 text the page markers are at lines 257 (page 6) and 304 (page 7), and printed page number 6 is at line 303. Lines 264–289 therefore all lie on p. 6. Change in the References: "§4 setting, pp. 6–7 (lines 264–289)" → "§4 setting, p. 6 (lines 264–289)".

Pattern check: every other page locator in the References was recomputed from the page markers and is correct.
- CaptainSude26: lines 26 (p. 1), 120 (p. 3), 177–263 (pp. 4–6), 291 (p. 6), 410 (p. 9), 503 (p. 10), 538 (p. 11), 604 (p. 12), 634 (p. 13).
- LeHung26: lines 86 (p. 2), 272–355 (pp. 7–9), 357 (p. 9).
- CN23: lines 3849/3872 (pp. 73/74), 4513 (p. 87), 4545/4562/4574 (p. 88).
- ACC23: lines 2309–2346 (pp. 57–58), 7163 (p. 178).
- AKT23: line 3979 (p. 86).

The manifest gives no page for the §4 setting, so it needed no change.

## Checks run

Dependency check (after the edits):

```text
candidate: EllipticCurveModularityImaginaryQuadraticPartII is not in the merge order yet; checked as if placed after EllipticCurveModularityImaginaryQuadratic (the intake inserts it when its design is accepted)
depcheck: 245 roadmaps, 2247 edges, 0 problem(s)
```

No UPWARD or CYCLE line.

- **Citation resolve.** The only leads are the source keys `LeHung26 §4.4`, `OpenAI26 §9.4` and `CaptainSude26 §4`. They are sources, not roadmaps, so these are false positives. No Lean name was reported.
- **Supplier citations re-read for the edited lines.** ArithmeticGaloisRepresentations §6.3 states the Tate curve facts for `ℓ ≠ p`. EllipticCurves Layer 4, on main, has `v(Δ) = v(q)` and `j(q) = 1/q + 744 + ⋯`. CrystallineLocalGlobalCompatibilityCM §9.3 fixes an imaginary quadratic subfield, and its own Check excludes `ℚ(ζ₅)`. LocalGaloisDeformationRings §2.6 is headed "The `q`-tame group".
- **Mechanical scan of letters by layer.**
  - Matrix `U`: Conventions, Layers 3 and 6.
  - Open `U`: Conventions, Layers 2 and 7.
  - Switch parameter `t`: Conventions, supplier contracts (`B_t`), Layers 2, 7 and 8.
  - `t = |T|`: Layers 4–5.
  - `q_E`: supplier contracts and Layer 3 only.
  - `q` alone, after the edits: a rational prime in Layers 1, 4 and 7.
- **Shape.** There are no LaTeX delimiters, and `plan.json` parses.
- **Lean.** There is no `Suggested.lean` at the design stage, so no `#check` comparison was run.

## Adversarial pass (changed statements)

| Statement | Instances | Values computed | Result |
|---|---|---|---|
| §3.3 Check 1 (`p ∤ v(q_E)`) | `p = 5`, `v(q_E) = 1`, `ℓ = 11` | inertia `[[1, t₅(σ)],[0,1]]`, image of order 5, unipotent; `χ₅` trivial on inertia at `11` | protected, as stated |
| §3.3 Check 2 (`p ∣ v(q_E)`) | `q_E = ϖ_v⁵`, `p = 5` | `v(q_E) = 5`, entry `5·t₅(σ) ≡ 0`, inertia trivial mod 5 | unramified, not protected |
| Supplier §6.3 parenthetical | `ℓ = 3`, `q_E = 3³` over `ℚ₃`; `ℓ ≠ p`, `q_E = p^ℓ`; `q_E = p` | `3 ∣ 3` but `μ₃ ⊂ E[3]` ramified; `ℓ ∣ ℓ` unramified; `ℓ ∤ 1` ramified | the hypothesis `ℓ` prime to the residue characteristic is needed and is now stated |
| EllipticCurves Layer 4 parenthetical | `Δ = q_E ∏(1 − q_Eⁿ)²⁴` | the units in the product give `v(Δ) = v(q_E)`; `j = 1/q_E + 744 + 196884 q_E + ⋯` | holds |
| Layer 3 Examples | `ℚ₁₁`, `v(q_E) = 1`, `p = 5` | `11 ≡ 1 mod 5`, `μ₅ ⊂ ℚ₁₁`, inertia `U`, Frobenius `[[1,b],[0,1]]`; `h⁰ = h² = 1`, `h¹ = 2` (§3.5(c)) | holds |
| §3.2 Check (`N = 1 + D + D²`, `𝔽₃`) | `e, h, f` | `(D − 1)² = D² − 2D + 1 ≡ D² + D + 1`; `(D − 1)²f = −2e = e ≠ 0`, `(D − 1)²h = (D − 1)(−2e) = 0`; `(D − 1)ad⁰ = ⟨−2e, h − e⟩ = ⟨e, h⟩` | `H¹ = 0`, as stated |
| §4.3 Check 1 | `F = ℚ(ζ₅)`, `t = 1`, `r = 6` | `g = 6 − 6 − 1 + 1 = 0`; formula of CrystallineLocalGlobalCompatibilityCM §9.3: `6 − 3·2 − 1 + 1 = 0`; `ℚ(ζ₅)` has only `ℚ(√5)` as quadratic subfield | values agree; applicability correctly disclaimed |
| §2.3 Check (`q_v = 4`) | `a = 4` | `T² − 4T + 4 = (T − 2)²`, unitary roots `2/√4 = 1, 1`; `|a| = 2√q_v` allowed since `q_v` is a square | holds |
| Conventions: where `U` occurs | scan of every backticked `U` | matrix: lines in Layers 3, 6; open: Layers 2, 7 | true |
| Conventions: where `t` occurs | scan of every backticked `t` | switch parameter: Layers 2, 7, 8; `|T|`: Layers 4, 5 | true |
| References, §4 setting | CaptainSude26 lines 264, 289 | both after marker 257 (p. 6) and before printed "6" at line 303 | p. 6 |

## Citations and ownership

No new object, target or supplier was added, so no ownership search was needed. Every cross-roadmap citation on an edited line was resolved this round, as listed above. No citation of a later roadmap was added.

## For the maintainer

- No names that other roadmaps cite were changed. No section ids moved. No new supplier gaps.
- The supplier gap `acc-torsion-inertial-comparison` (AutomorphicGaloisRepresentationsPartII AG2.5) is unchanged.
- In `plan.json`, the test statements `protected_tate` and `protected_tate_divisible`, `unitary_shift` and `presentation_cyclotomic_five` were reworded to the new letters. No test was added or removed.
