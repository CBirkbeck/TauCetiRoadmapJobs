# Review of SpecialFunctionsJacobiElliptic (pull request #3075 at 1c67be0)

**Verdict:** accepted

**Summary.** Accepted: the previous round had no finding, and its small correction and its format note are both repaired. The sketch of Landen's transformation (4.4) now says correctly that the two roots `k′` give `λ(2τ) = k₁²` and `1/k₁²`, equal only at `k² = 2`, and the new Check at `k = √2` was recomputed and agrees. There is one format note (a lost indentation in 4.5), not blocking; the questions left to the human reviewers are unchanged.

## N01 — The last line of the modulus-form bullet of 4.5 lost its indentation

In 4.5 (line 547), the continuation "`k = 0` and within its hyperbolic row at `k = 1`." starts in column 0 while the rest of the bullet is indented by two spaces. It still renders as part of the bullet; indenting it keeps the source readable.

## Previous findings

- none: the previous report (of `fb11859`) had no finding. Its two other remarks:
- C01 — repaired: "the two roots `k′` give `k₁` and `1/k₁` and correspond to two values of `τ` with the same `λ` and with `λ(2τ) = k₁²` and `1/k₁²`, which differ except at `k² = 2` (`k′ = ±i`, `k₁ = ∓i`)"; a Check at `k = √2` added.
- N01 — repaired: 4.4 "identities within the circular row of 3.4 at `k = 0` and within its hyperbolic row at `k² = 1`"; 4.5 the same with `k = 1`.

## Verified sound

Values from a double-precision recomputation: the functions of a complex modulus as theta quotients at a `τ` with `λ(τ) = k²` (checked to `10⁻¹⁰` in each case; `τ = −1.5 + 0.5i` for `k² = 2`, `τ = 1 + i` for `k² = −1`), the rows `sin, cos, 1` and `tanh, sech, sech` at `k = 0` and `k² = 1`; `u = 0.37 + 0.21i`.

| Statement | Instances | Values on each side | Result |
|---|---|---|---|
| 4.4 sketch: the roots `±k′` give `k₁` and `1/k₁` | algebra; `k = 0.6`, `0.5 + 0.3i`, `1.3 + 0.4i` | `(1 + k′)/(1 − k′) = 1/k₁`; `k₁²` = `0.0123457` and `81`; `−0.0065495 + 0.0049451i` and `−97.2451 − 73.4236i`; `−0.309853 − 0.056727i` and `−3.12268 + 0.57169i`; products `1` | holds |
| 4.4 sketch: two `τ` with the same `λ`, `λ(2τ) = k₁²` and `1/k₁²` | `τ = 0.3 + 0.8i` and `τ/(1 − 2τ)` | both `λ = 0.7660029 + 0.4097863i`; `k′ = ±(0.5940902 − 0.3448856i)`; `λ(2τ) = −0.0278242 + 0.1029613i` and `−2.4460388 − 9.0513711i`, product `1`; `k(2τ) = (1 − k′)/(1 + k′)` each | holds |
| 4.4 sketch: "differ except at `k² = 2`" | algebra; `τ = −1.5 + 0.5i`, `0.7 + 0.1i` | `k₁⁴ = 1`, `k₁ ≠ ±1` ⇔ `k₁ = ±i` ⇔ `k′ = ∓i` ⇔ `k² = 2`; there `λ = 2`, `k′ = −i` and `+i`, `λ(2τ) = −1` for both | holds |
| 4.4 new Check at `k = √2` | `k′ = i`, `−i` | `k₁ = −i`, `i`; `k₁² = −1`; `w = u/(1 ∓ i) = 0.08 + 0.29i`, `0.29 − 0.08i` (exact); `sn(u, √2) = 0.3662614021 + 0.1736905930i`; residuals of the three laws `≤ 6.3 · 10⁻¹⁶` | holds |
| 4.4 at `k = 0` and `k² = 1`: "within" one row | `k′ = 1`, `k₁ = 0`, `w = u`; `k′ = 0`, `k₁ = 1`, `w = u/2` | `k = 0`: `sin u = sin u`, `cos u = cos u`, both sides circular; `k² = 1`: both sides hyperbolic, residuals `≤ 3.4 · 10⁻¹⁶` | holds |
| 4.5 at `k = 0` and `k = 1`: "within" one row | `k₂ = 0`, `k₂′ = 1`, `w = u/2`; `k₂ = ±1`, `k₂′ = 0`, `w = u` | `k = 0`: `sin u − 2 sin w cos w = 7.9 · 10⁻¹⁷` (laws 2, 3 excluded); `k = 1`: residuals `≤ 5.6 · 10⁻¹⁷` for both roots `k^{1/2}` | holds |

The rows for the untouched statements stand as in the previous review, of `fb11859`.

- Source locators checked against the text: none this round; the change adds and alters no locator, and the locators of 4.4 and 4.5 (DLMF 22.7.1–22.7.8, §22.17(ii)) stand as read in the previous review.
- Library declarations opened at the pin: none; the change touches no Lean statement and no library name.
- Cross-roadmap citations resolved: none added by the change; the citation resolver lists nothing as found nowhere.
- Dependency check: `depcheck: 101 roadmaps, 1129 edges, 0 problem(s)`; no UPWARD or CYCLE line; no change outside the folder.
- Elaboration: `Suggested.lean` (unchanged since `2e8dbd8`) elaborates with 33 `sorry` warnings and the output of its `#check` lines, no error and no other warning.
- Pull request text: title and description read against this head; the change adds no layer, supplier or declaration, and no sentence of the description is contradicted (33 `sorry`, the suppliers and the imports as stated).

Overlap check: read SpecialFunctionsTheta, EllipticIntegrals, SpecialFunctionsLame; SpecialFunctionsLame consumes 2.1–2.3, 3.4, 3.5, 4.1, 7.1 of this roadmap and owns none of its objects; theta quotients and `λ`: SpecialFunctionsTheta; real `sn, cn, dn` and the real Legendre relation: EllipticIntegrals; nothing has two owners (as in the previous review; the change touches no ownership, and no open pull request changes this roadmap or drops an id it cites).

Source independence: changed passages only; 4 passages (two sketch sentences, one Check, one bullet clause), none citing a source or carrying a source's wording, so none was set beside a source text this round; largest share DLMF, as in the previous review (Lawden not readable); no layer added, removed or reordered, so the contents were not compared again.

Research link: the complex-modulus theory is that of Walker (2003), which DLMF §22.17(ii) cites for it; the README's consumers are Lamé functions and ellipsoidal harmonics (Whittaker–Watson Ch. XXIII), cnoidal-wave solutions of KdV and NLS, and conformal maps by `sn` (DLMF §22.18(ii)). Rests on the README and DLMF.

## Not verifiable

- Lawden 1989, Armitage–Eberlein 2006, Magnus–Oberhettinger–Soni 1966 at the locators of 4.4 and 4.5: paywalled books; no legal copy found.
- The README's agreement to `3 · 10⁻³¹` in the new Check was recomputed only to double precision (`≤ 6.3 · 10⁻¹⁶`).

Automatic checks set aside as false positives: a section comment of `Suggested.lean` with no declaration under it, which holds the `#check` lines that pin library declarations, as the rules allow.

## Source issues

- none

## For the human reviewers

- Not tested: nine of eleven cited texts, among them Lawden (36 of about 170 locators), could not be read; wording and arrangement were compared only with DLMF Chapter 22 and Whittaker–Watson Ch. XXII.
- Licence: the description says the author's lean-DLMF project formalized much of DLMF Chapter 22; `Suggested.lean` was not compared with that repository.
