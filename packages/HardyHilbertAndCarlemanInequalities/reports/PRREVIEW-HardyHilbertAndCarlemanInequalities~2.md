# Review of HardyHilbertAndCarlemanInequalities (pull request #3056 at 9e8362a)

**Verdict:** accepted

**Summary.** Accepted: this incremental re-review of the 148 lines changed since `b63a396` finds that all three earlier findings and all three earlier small corrections are repaired, and that the repairs introduce no new defect. The reversed series inequality of §2.1 is now true and its constant sharp by direct computation, the non-strict weighted Hardy inequalities are targets of §2.2 with Lean statements, and the Schur-test sentence of §1.2 names a kernel whose row and column integrals are `k`. There is one format note and no small correction. As before, none of the six cited books could be read legally, so no locator is checked against its text; that remains for the human reviewers.

## N01 — One sentence of *Scope and ownership* speaks of future library work

Lines 695–697 say that "later library work on real interpolation may supply them in the form with the measure `dt/t`, which is not used here". The sentence predicts rather than states; it would read timelessly as "the form with the measure `dt/t` used in real interpolation is not stated here", or could be dropped.

## Previous findings

- R01 — repaired: §2.1 now reads `∑'ₙ ((aₙ + aₙ₊₁ + ⋯)/(n + 1))^p > (p/(1 − p))^p ∑ aₙ^p`, the term `n = 0` weighted by `1 + 1/(1 − p)`; it follows from `hardy_reverse_lt` by the step-function route given, and the constant is sharp.
- R02 — repaired: `hardy_rpow_weight_le` and `hardy_tail_rpow_weight_le` are targets of §2.2 and declared in `Suggested.lean`; §2.3 cites them; *Scope* names only `TauCeti.le_mul_exp_of_le_add_mul_integral`, present at the pin (`TauCeti/Analysis/ODE/Gronwall.lean`, line 59).
- R03 — repaired: the route of §1.2 uses `L(x, y) = K(x, y) x^(1/q) y^(1/p)` with the measure `dx/x`; both integrals equal `k`, and the test's constant `A^(p − 1) B` is `k^p`.
- C01 — repaired: the Check quotes `3.1931` and `3.4868` for the series and `2.6831`, `3.1575` for the finite sections (recomputed, all four agree).
- C02 — repaired: Layer 2 has the Check of `hardy_deriv_le` at `p = 2` (constant `4`; `F = x e^(-x)` gives `1/2 ≤ 1`), and the supplier contract points to it.
- C03 — repaired: the description says the non-strict forms are targets of §2.2 and names the Grönwall declaration of the pin.

## Verified sound

| Statement | Instances tried | Values computed | Result | Change |
|---|---|---|---|---|
| 2.2 `hardy_rpow_weight_le` | `f = 0`; right side `⊤`; `f = 1_{(0,1)}`, `p = 2`, `ε = 0`; formal power `t^(-a)` | `0 ≤ 0`; trivial; `2 ≤ 4`; critical `a = ε + 1/p` gives `(1 − 1/p − ε)^(-p)` | sound; not closed by `simp` or `rfl` | none |
| 2.2 `hardy_tail_rpow_weight_le` | `f = 1_{(0,1)}`, `p = 2`, `ε = 1`; formal power `t^(-a)` | `1/3 ≤ 4/3`; critical `a − 1 = ε − 1 + 1/p` | sound; not closed by `simp` or `rfl` | none |
| 2.2 route for the non-strict forms | right side `0`, `⊤`, finite nonzero | constant is finite and positive, so right side `0` forces `f = 0` a.e.; otherwise hypotheses of the strict forms hold | sound | none |
| 2.1 reversed series inequality (Theorem 338) | step function in `hardy_reverse_lt`; `a = e₀`, `p = 3/4`; `aₙ = (n + 1)^(-1/p − δ)` | `(0,1)` gives `S^p/(1 − p)`, cells at most `(Rₙ/(n + 1))^p`; `5 > 2.2795`; ratios `3.264`, `2.776`, `2.708` at `δ = 0.5, 0.1, 0.02`, limit `2.2795` | true, constant sharp | none |
| 2.1 negative controls | no factor, `a = e₀`, `p = 3/4`; no divisor, `p = 1/4` | `1 < 2.2795`, and `p/(1 − p) > 1` iff `p > 1/2`; `(1/3)^(1/4) = 0.7598 < 1` | true | none |
| 1.2 Schur-test sentence | general `K`; Hardy kernel `p = 2` | `∫ L dx/x = ∫ K(t,1) t^(-1/p) dt = k`, `∫ L dy/y = ∫ K(1,t) t^(-1/q) dt = k`; both `2`; `k^(p−1) k = k^p` | sound | none |
| 3.3 route for `hilbert_two_exponents` | exponent count with `λ = 1/p' + 1/q'` | `(Bₘ/m)^q Bₘ^(p'−q) m^(q−p'λ) = (m^(-λ) Bₘ)^(p')`; `(p' − q)/q' + q − p'λ = q/q − 1 = 0`; total `(q/(q−1))^q B^(p'/q)` | sound | none |
| Layer 2 Check of `tsum_hardy_sharp` | `N = 10³`, `10⁵` | series `3.19308`, `3.48682`; sections `2.68310`, `3.15750` | agrees | none |
| Layer 2 Check of `hardy_deriv_le` | `F = x e^(-x)`, `p = 2` | `∫ e^(-2x) = 1/2`; `4 (1/2 − 1/2 + 1/4) = 1` | agrees | none |
| Grönwall contract | statement at the pin; `bihari` with `w(s) = s`, `f = K` | pin: `φ t ≤ c + K ∫ₐᵗ φ ⟹ φ t ≤ c exp(K(t − a))`; `bihari`: `log(max(u,k)/k) ≤ K t` | matches | none |

The rows for the untouched statements stand as in the previous review, of `b63a396`.

- Source locators checked against the text: 0 (no cited book could be read legally; the changed locators are Theorem 338 with the footnote on p. 253, Theorem 13, p. 254 and Balinsky–Evans–Lewis (1.2.1), (1.2.2)).
- Library declarations opened at the pin: 3 (`TauCeti/Analysis/ODE/Gronwall.lean` line 59; `TauCeti/MeasureTheory/Integral/SchurTest.lean` lines 74 and 132).
- Duplication by object: no Hardy inequality in the pinned Mathlib or Tau Ceti (theorems named after Hardy are Hardy spaces and Hardy's `Z`-function only); no other roadmap, open or on main, states the weighted inequalities of §2.2.
- Cross-roadmap citations in the changed passages: 1 (UnboundedOperators §4.8), present on main.
- Dependency check: `depcheck: 129 roadmaps, 1436 edges, 0 problem(s)`; no UPWARD or CYCLE line.
- Elaboration: no error, 45 `sorry` warnings and no other warning; the `#check` of the Grönwall declaration resolves. The file has no `variable` block; the two new elaborated signatures equal their README statements.
- Automatic checks: all passed; none set aside. No file changed outside the folder.
- Pull request text: read against this head; counts (48 declarations, 45 with `sorry`, 3 definitions, five imports) and the ownership paragraph agree with it.

Overlap check: read MeansMajorizationAndDiscreteInequalities, DiracScatteringAndNonlinearFourierTransform, Isoperimetry; nothing shared.

Source independence: changed passages only; 0 passages compared with 0 sources, because none of the six cited books could be read; largest share Hardy–Littlewood–Pólya, 51 of 103 source mentions in the layers at the previous head; its contents page was not read. The change adds, removes and reorders no layer.

Research link: Layer 5 is the Muckenhoupt criterion for weighted Hardy operators as cited from Edmunds–Evans (2004) and Balinsky–Evans–Lewis (2015); §2.3 supplies the Hardy inequality that UnboundedOperators §4.8 uses for Sturm–Liouville operators. This rests on the README's references and its section on downstream consumers, not on a source text.

## Not verifiable

- Hardy–Littlewood–Pólya, *Inequalities*: Theorem 338 (p. 252) and the footnote on p. 253, Theorem 13, the argument on p. 254, and the other locators of 1.1–1.4, 2.1, 2.2, 3.1–3.3, 4.1, 4.2; no legal copy found.
- Balinsky–Evans–Lewis, Theorem 1.2.1 with (1.2.1) and (1.2.2), p. 3 (the new non-strict targets of 2.2), and the locators of 2.3, 5.1, 5.2; Edmunds–Evans (5.1, 5.2): paywalled publisher.
- Garling (2.1, 3.1, 4.1), Mitrinović (6.1), Pachpatte (6.2): no legal copy found.
- The wording and arrangement comparison with the sources, for the same reason.

## Source issues

- none

## For the human reviewers

- **Not tested.** Hardy–Littlewood–Pólya has the largest share of the locators (51 of 103 mentions); neither its text nor its contents page could be read, so wording, arrangement and every locator are unchecked against it and the other five books.
- **Licence.** The README's section "Prior formalization" names the author's repository lean-CKMA (Apache 2.0, commit f4bd822) as the starting point for §§2.1, 3.1, 3.2 and 4.1; `Suggested.lean` was not compared with that repository.
- **Scope.** The headline results are classical (the main source is from 1934); the README connects them to current work only through the two monographs on Hardy operators (2004, 2015) and the consumer UnboundedOperators §4.8.
