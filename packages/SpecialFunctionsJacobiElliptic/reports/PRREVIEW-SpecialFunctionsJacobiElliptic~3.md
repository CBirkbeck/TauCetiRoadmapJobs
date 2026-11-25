# Review of SpecialFunctionsJacobiElliptic (pull request #3075 at fb11859)

**Verdict:** accepted

**Summary.** Accepted: the one finding of the previous round is repaired. The modulus forms of Landen's and Gauss's transformations (4.4, 4.5) now exclude `k = 0` for the laws whose right sides were `0/0`, 4.4 gives a form of the third law that holds there too, and the new Checks at `k = 0` and `k = 1` were recomputed and agree. There is one small correction (a clause of the 4.4 proof sketch fails at `k² = 2`) and one format note, neither blocking; the questions left to the human reviewers are unchanged.

## C01 — In the sketch of 4.4, the two roots `k′` do not always give different `λ(2τ)`: at `k² = 2` both give `λ(2τ) = −1`

The sentence "for `k² ∉ {0, 1}` the two roots `k′` correspond to two values of `τ` with the same `λ` but different `λ(2τ)`" (line 514; the clause is unchanged from the head the previous review read) fails at one modulus. The two roots give `k₁` and `1/k₁`, so the values `k₁²` of `λ(2τ)` differ unless `k₁⁴ = 1`; `k₁ = ±1` is excluded, and `k₁ = ±i` occurs exactly at `k′ = ∓i`, `k² = 2`. Computed at `k = √2`: `k′ = i` gives `k₁ = −i`, `k′ = −i` gives `k₁ = i`, and `k₁² = −1` in both cases; the three laws hold for both roots there (residuals `≤ 7 · 10⁻¹⁶` at `u = 0.37 + 0.21i`), with different `w = u/(1 + k₁)`.

Nothing stated depends on the clause: 3.2 and 3.4 apply to each root whether or not the two values of `λ(2τ)` differ. The smallest change is "with the same `λ` and with `λ(2τ) = k₁²` and `1/k₁²`" or "but, except at `k² = 2`, different `λ(2τ)`".

## N01 — "identities between the circular and the hyperbolic rows of 3.4" reads as if a law related the two rows

In the sketch of 4.4 (line 516), and in the same words in 4.5: at `k = 0` both sides of each law are circular (`k₁ = 0`, `k₂ = 0`), and at `k² = 1` both are hyperbolic (`k₁ = 1`, `k₂ = 1`). "identities within the circular row at `k = 0` and within the hyperbolic row at `k² = 1`" would say it.

## Previous findings

- R01 — repaired: 4.4 "and `k ≠ 0` for the third law … the form `dn(u, k) = (1 − k₁ sn²)/(1 + k₁ sn²)` … holds there too"; 4.5 "and `k ≠ 0` for the second and third laws (there `k₂ = 0`)"; Checks added for both.

## Verified sound

Values from a double-precision recomputation: the functions of a complex modulus as theta quotients at a `τ` with `λ(τ) = k²` (checked to `10⁻¹⁰` in each case), the rows `sin, cos, 1` and `tanh, sech, sech` at `k = 0` and `k² = 1`; `u = 0.37 + 0.21i`.

| Statement | Instances | Values on each side | Result |
|---|---|---|---|
| 4.4 modulus form, three laws (sample) | `k = 0.6`, `0.5 + 0.3i`, `1.3 + 0.4i`, `√2`, `0.3i`; both roots `k′` | residuals: `sn ≤ 5.2 · 10⁻¹⁶`, `cn ≤ 1.3 · 10⁻¹⁵`, `dn ≤ 1.5 · 10⁻¹⁴` (small `k₁`, cancellation) | holds |
| 4.4 third law, form `(1 − k₁ sn²)/(1 + k₁ sn²)` | same ten cases; `k = 0` | residuals `≤ 3.8 · 10⁻¹⁶`; algebra: `dn² − (1 − k₁) = k₁(1 − k₁ sn²)`, `1 + k₁ − dn² = k₁(1 + k₁ sn²)`; at `k = 0` gives `1 = dn(u, 0)` | holds, also at `k = 0` |
| 4.4 at `k = 0`, `k′ = 1` | `k₁ = 0`, `w = u` | laws 1, 2: `sin u = sin u`, `cos u = cos u`; law 3: `1` against `0/0`, now excluded | as the README says |
| 4.4 Check at `k = 1` | `k′ = 0`, `k₁ = 1`, `w = u/2` | `tanh u = 2 tanh w/(1 + tanh² w) = 0.3679786209406 + 0.1853782149758i`; `sech u` and both quotients `= 0.9508436782174 − 0.0717417820215i` | holds |
| 4.4 sketch, "`k₁² ∉ {0, 1}` when `k² ∉ {0, 1}`" (needed for 3.2, 3.4 at `k₁`) | algebra | `k₁ = 0 ⇔ k′ = 1`; `k₁ = 1 ⇔ k′ = 0`; `k₁ = −1` impossible | holds |
| 4.4 sketch, "different `λ(2τ)`" | `k = √2` | `k₁ = −i` and `i`; `k₁² = −1` for both roots | fails at `k² = 2` only; C01 |
| 4.5 modulus form (sample) | `k = ±0.6`, `−3`, `−0.7 + 0.9i`, `0.5 + 0.3i`; both roots `k^{1/2}` | residuals `≤ 1.2 · 10⁻¹⁵` in the three laws | holds |
| 4.5 at `k = 0` | `k₂ = 0`, `k₂′ = 1`, `w = u/2` | law 1: `sin u = 2 sin w cos w = 0.3696183984037 + 0.1972309662682i`; laws 2, 3 have denominator `0`, now excluded; `cos u = 0.9529608247037 − 0.0764986261532i` | as the README says |
| 4.5 Check at `k = 1` | `k₂ = ±1`, `k₂′ = 0`, `w = u` | `tanh = tanh · sech/sech`; `sech = (sech² − 0)/(1 · sech)` twice | holds |
| 4.5 "`k₂² ∉ {0, 1}` when `k² ∉ {0, 1}`" | algebra | `k₂² = 4k/(1 + k)²`; `= 1 ⇔ (1 − k)² = 0`; `= 0 ⇔ k = 0` | holds |

The rows for the untouched statements stand as in the previous review, of `2e8dbd8`.

- Source locators checked against the text: DLMF 22.7.1–22.7.4 and 22.7.5–22.7.8 (the laws of 4.4 and 4.5 as stated), DLMF §22.17(ii) and 22.17.1 (evenness in `k`).
- Library declarations opened at the pin: none new; the change touches no Lean statement and no library name.
- Cross-roadmap citations resolved: none added by the change; SpecialFunctionsTheta 2.4 and 4.4 stand as resolved in the previous review.
- Dependency check: `depcheck: 124 roadmaps, 1403 edges, 0 problem(s)`; no UPWARD or CYCLE line; no change outside the folder.
- Elaboration: `Suggested.lean` (unchanged since `2e8dbd8`) elaborates with 33 `sorry` warnings and the output of its `#check` lines, nothing else.
- Pull request text: title and description read against this head; the change adds no layer, supplier or declaration, and no sentence of the description is contradicted (33 `sorry`, the suppliers and the imports as stated).

Overlap check: read SpecialFunctionsTheta, EllipticIntegrals, SpecialFunctionsLame; SpecialFunctionsLame consumes 2.1–2.3, 3.4, 3.5, 4.1, 7.1 of this roadmap and owns none of its objects; theta quotients and `λ`: SpecialFunctionsTheta; real `sn, cn, dn` and the real Legendre relation: EllipticIntegrals; nothing has two owners (as in the previous review; the change touches no ownership).

Source independence: changed passages only; 6 passages compared with 1 source (DLMF §§22.7, 22.17), none shared; largest share DLMF, as in the previous review (Lawden not readable); no layer added, removed or reordered, so the contents were not compared again.

Research link: the complex-modulus theory is that of Walker (2003), which DLMF §22.17(ii) cites for it; the README's consumers are Lamé functions and ellipsoidal harmonics (Whittaker–Watson Ch. XXIII), cnoidal-wave solutions of KdV and NLS, and conformal maps by `sn` (DLMF §22.18(ii)). Rests on the README and DLMF.

## Not verifiable

- Lawden 1989, Armitage–Eberlein 2006, Magnus–Oberhettinger–Soni 1966 at the locators of 4.4 and 4.5: paywalled books; no legal copy found.
- The README's agreements to `10⁻²⁹` and `10⁻³⁰` were recomputed only to double precision.

Automatic checks set aside as false positives: a section comment of `Suggested.lean` with no declaration under it, which holds the `#check` lines that pin library declarations, as the rules allow.

## Source issues

- none

## For the human reviewers

- Not tested: nine of eleven cited texts, among them Lawden (36 of about 170 locators), could not be read; wording and arrangement were compared only with DLMF Chapter 22 and Whittaker–Watson Ch. XXII.
- Licence: the description says the author's lean-DLMF project formalized much of DLMF Chapter 22; `Suggested.lean` was not compared with that repository.
