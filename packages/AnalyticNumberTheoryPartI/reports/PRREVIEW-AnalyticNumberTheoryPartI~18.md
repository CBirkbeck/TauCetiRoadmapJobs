# Review of AnalyticNumberTheoryPartI (pull request #3027 at 71bbefa)

**Verdict:** accepted

**Summary.** This is an incremental re-review of the 48 lines changed since `8d0b573`, and the previous finding is repaired. `Suggested.lean` now states the Deuring–Heilbronn repulsion and Linnik's theorem with the hypotheses of §§1.7a–1.7b, and both elaborate. The new sub-targets hold as stated, and their Bombieri locators are correct:
- §1.7a(i), Turán's power-sum lemma;
- §1.7a(ii), the density estimate with the exceptional factor;
- the rewritten zero-free-region step of §1.7b.

The review is accepted with three small corrections and one format note, none blocking. One correction is new: Théorème 11 is not §1.7's large-sieve input. The other two corrections and the format note are carried over from untouched text. One licence question is left for the human reviewers.

## C01 — §1.7a(ii)'s *Needs:* line calls Bombieri's Théorème 11 "the large-sieve input of §1.7", which it is not

An implementer who builds §1.7's large sieve will not have the inequality that §1.7a(ii) needs. Bombieri proves Théorème 20, the Montgomery half of §1.7's route, from Théorème 10, the hybrid large sieve (p. 82, `bombieri1987` line 2825). The proof of Théorème 14 uses Théorème 11 instead (p. 50, line 1580).

Théorème 11 is a different inequality. It weights each modulus by `log(Q/q)` and needs `a_n=0` whenever `n` has a prime factor `≤Q`. Bombieri derives it on p. 31 from Théorème 8, the Bombieri–Davenport form on p. 24.

The end of the *Needs:* line (README line 1065) would be right as: "the large sieve inequality for characters with the weights `log(Q/q)`, for coefficients supported on integers without prime factors `≤Q` ([99][R99], §5, Théorème 11, from Théorème 8, p. 24)". By the README's rule that a source's external input remains a target, it is then a target of §1.7a(ii). The primitive-character large sieve of SieveMethodsAndPrimePatterns §2.3 cannot supply it: that inequality is unweighted, and that roadmap comes later in the merge order.

## C02 — Untouched text: §§0.1, 0.17 and 0.18 claim effective constants from the zero-free region that §§1.4e, 1.7a and 1.7b treat as existential

This is carried from the previous review (its C04) and is unchanged at this head. §1.7b (line 1071) drops effectivity because the constant of ZerosOfLFunctions 6.3–6.4 "is existential". Yet three sections claim effective constants on routes through the same region:
- §0.1 (lines 58 and 77);
- §0.17 (line 457);
- §0.18 (line 471).

Either of two changes would make the README apply one standard: name the source of an effective region constant in §0.1's supplier comparison, or drop "effective" in those three places.

## C03 — Untouched text: §2.3a writes the algebraic character with the opposite sign of the norm power

This is carried from the previous review (its C05) and is unchanged at this head. In §2.3a (line 1355), `χ₀=χ₀,u|·|^σ` with `σ` LFunctions Layer 6's ideal-side shift gives the completion at `s+σ`. That contradicts the same bullet's `Λ_H(χ₀,u,s+t−σ)`. LFunctions' convention table makes `idealShift` the negative of the idelic shift. Writing `|·|^(−σ)`, or saying that the norm is the ideal norm, would fix it. §2.42a already uses the right sign and refers readers to this bullet.

## N01 — §§0.6 and 0.18 cite Iwaniec–Kowalski by name instead of as [117]

This is carried from the previous review and is unchanged (lines 150 and 481).

## Previous findings

- R01 — repaired: `Suggested.lean` lines 486 and 502 declare `deuring_heilbronn_repulsion` and `exists_prime_modEq_le` with the hypotheses of §§1.7a–1.7b, plus `ρ ≠ 1` for the principal pole; the module docstring lists both.
- C01 — repaired: "**§1.7a(i) Turán's power-sum lemma.**" and "**§1.7a(ii) The density estimate with the exceptional factor.**" are labelled, with locators. §1.7a's *Needs:* now lists both. §1.7a(ii)'s lists §§0.11b, 0.12, 0.34a and Théorème 11 (see C01).
- C02 — repaired: "a zero `β+iγ` with `|γ|≤T` and `1−β<c₂/ℒ` lies in the zero-free region of ZerosOfLFunctions 6.3–6.4 … so it is … `β₁`" (line 1079).
- C03 — repaired: the description now adds "(in AnalyticNumberTheoryPartI §§1.4e, 1.7a and 1.7b without the effectivity of the constants, which the sources prove)".
- C04 — not repaired: "There is an effective absolute `c_star>0`" (line 457), against §1.7b's "whose constant is existential" (line 1071); now C02.
- C05 — not repaired: "written `χ₀=χ₀,u|·|^σ` with `χ₀,u` unitary and `σ` LFunctions Layer 6's ideal-side shift" (line 1355); now C03.
- N01 — not repaired: "Iwaniec–Kowalski Theorem 5.26" (line 150), "Iwaniec–Kowalski Theorem 5.27" (line 481); now N01.

## Verified sound

| # | Statement | Instances | Values on each side | Result |
| --- | --- | --- | --- | --- |
| A | `deuring_heilbronn_repulsion` against §1.7a | elaborated type, clause by clause | `IsQuadratic χ₁ ∧ χ₁≠1` = real nonprincipal; `1/2≤β₁<1`; `2≤analyticOrderAt` = multiple zero; `ℒ≥log(q(|Im ρ|+2))`; `c` before `q` | agree |
| B | same: junk values, range of `ρ` | `ρ=1`; `Re ρ≥1` | `LFunction_apply_one_ne_zero` for `χ≠1`; `LFunction_ne_zero_of_one_le_re` gives `1−Re ρ>0`; `ρ≠1` removes only the principal pole value | holds |
| C | same: "every `ℒ`" | `c=0.1`, `1−β₁=10⁻⁶`, `ℒ=3.879, 5, 10, 20` | `f(ℒ)=0.2619, 0.1981, 0.0921, 0.0426`, decreasing; `f≤0` once `(1−β₁)ℒ≥c` | a larger `ℒ` is weaker; holds |
| D | same: a zero of `ζ` | `q=3`, principal `χ`, `ρ=1/2+14.1347i` | `ℒ=3.8796`; the conclusion holds iff `1−β₁≥(c/ℒ)e^(−ℒ/(2c))` | consistent with §1.7a Check 1 |
| E | `exists_prime_modEq_le` against §1.7b | `q=3, a=1`; all `3≤q≤300`; `q=1` | least `p=7`, so `A≥1.771`; largest `log p/log q=1.829` at `(5,4,19)`; `q=1` would need `p≤1`, excluded by `3≤q` | holds |
| F | §1.7a(i), Turán | Turán's second main theorem with `M=K−1`, `1≤N≤K≤400`; 20000 random families with `z₁` not of largest modulus; roots of unity | `log[2(N/(8e(K+N−1)))^N]+K log 50≥1.526`; 0 failures; `max_k‖Σz^k‖=N` for `N≤6` | true for any labelling |
| G | §1.7a(ii), local zero count | `r=0.3`, 2·10⁵ points of the disc with `Re ρ≤1`; principal `χ` | `min r·Re 1/(1+r+iv−ρ)=0.5≥1/4`; the pole term `Re 1/(r+iv)≤1/r` adds at most 4 zeros | `C(r log T+1)` holds |
| H | §1.7a(ii), its inputs | Bombieri pp. 24, 31, 50, 53, 82 | Théorème 14's proof applies Théorème 11 (p. 50); Théorème 20 applies Théorème 10 (p. 82); p. 53 uses a lower bound for `L(1,χ₁)` | C01 |
| I | §1.7a(ii) against §§0.11b, 0.12 | `−ζ′/ζ(1+η)`; `L(1,χ)` | §0.11b exports `η⁻¹+O(1)` for `0<η≤1`; §0.12's route (line 366) gives `L(1,χ)≥c/√Q` | supports the route |
| J | §1.7b repaired sentence | `3≤q<50`, `T∈{0, 0.5, 1, 10, 10³}` | `(q(T+2))²−q(T+4)≥24`, so `log Q_an(iγ)≤log(q(T+4))<2ℒ` and `1−β<c_Z/log Q_an`; then `1−β<c₁/log q` | holds; the zero is `β₁` |
| K | C02: §§0.1, 0.17, 0.18 against §1.7b | effectivity of the region constant | lines 58, 77, 457, 471 say effective; line 1071 says existential | unchanged |
| L | C03: §2.3a | sign of `σ` | `|·|^σ` gives shift `s+σ`; the same bullet has `s+t−σ` | unchanged |

Rows for statements the change does not touch stand as in the previous review, of `8d0b573`.

- Previous findings: R01 and C01–C03 are repaired; C04, C05 and N01 are in untouched text and are carried as C02, C03 and N01.
- Elaboration: `lake env lean` on `Suggested.lean` exits 0 with 64 warnings, all `declaration uses sorry` (62 before, 2 new). The elaborated types of the two new theorems were compared with §§1.7a–1.7b: every binder is in their own signatures and none is lost.
- One-tactic probe: not run. The two new declarations are Linnik's theorem and the repulsion, and the pin has only Dirichlet's theorem without a bound (`Nat.forall_exists_prime_gt_and_modEq`, `Mathlib/NumberTheory/LSeries/PrimesInAP.lean:463`).
- Gate, run by hand: every check is 0 except the one for files outside the folder (114, all in this pull request's own folders). Dependency check: `depcheck: 132 roadmaps, 1468 edges, 0 problem(s)`, with no UPWARD, CYCLE or moved line.
- 9 Bombieri locators read:
  - p. 24, Théorème 8;
  - p. 31, Théorème 11;
  - p. 39, the Landau–Page lemma;
  - p. 40, Théorème 14;
  - pp. 41–54, its proof (Q.E.D. on p. 54);
  - p. 42, Turán's lemma and the local zero count;
  - p. 50, where Théorème 11 is applied;
  - p. 53, the bound for `L(1,χ₁)`;
  - p. 82, where Théorème 10 is applied in the proof of Théorème 20.
- Library declarations opened at the pin:
  - `MulChar.IsQuadratic` (`Mathlib/NumberTheory/MulChar/Basic.lean:443`);
  - `DirichletCharacter.LFunction_ne_zero_of_one_le_re` and `DirichletCharacter.LFunction_apply_one_ne_zero` (`Mathlib/NumberTheory/LSeries/Nonvanishing.lean:404, 412`);
  - `Nat.forall_exists_prime_gt_and_modEq` (`Mathlib/NumberTheory/LSeries/PrimesInAP.lean:463`).
- Citations resolved:
  - ZerosOfLFunctions 6.3, 6.4 and (4d), at this head and on `main` (line 1368 there);
  - this README's §§0.11b (line 246), 0.12 (line 366), 0.17, 0.30 and 0.34a (line 778);
  - RieszSums 1.7b's *Corollary of* (lines 636–637), and its `Suggested.lean` lines 95 and 135, which sit in its own namespace, so no fully qualified name clashes.
- Seeded sample: only §0.11 touches the change, through §0.11b, whose export was checked against §1.7a(ii)'s use. The other 14 targets lie outside the change and its dependents.

Overlap check: read ZerosOfLFunctions (6.3–6.4, at this head and on `main`), RieszSumsOverPrimesAndExceptionalZeros, SieveMethodsAndPrimePatterns, and ExplicitNumberFields (searched for Turán's lemma and Deuring–Heilbronn). The open heads of LiCoefficientsArithmeticFormula, LFunctions, ClassicalArithmeticCompletion and ArtinRepresentations were read only through the overlap tool, which reports nothing dropped or shared. Ownership:
- Deuring–Heilbronn and Linnik are owned here (§§1.7a–1.7b); RieszSums 1.7b states them as corollaries of these sections and restates them in its own namespace.
- Turán's lemma has no other owner; §2.9's power-sum lemma is Zaman's Fejér-weighted variant.
- The large sieve of SieveMethodsAndPrimePatterns §2.3 is a different, unweighted inequality.

Source independence: changed passages only; 6 passages compared with 1 source (`bombieri1987`): the statement of §1.7a(i) and its attribution, the statement, input list and local-zero-count route of §1.7a(ii), the docstring of `deuring_heilbronn_repulsion` against Théorème 16, and the new sentence of §1.7b. Nothing is shared beyond the formulas the mathematics forces. The largest share of the changed passages' literature locators is Bombieri [99], 7 of 7. Contents were not compared, since no layer is added, removed or reordered.

Research link: §§1.7a–1.7b are the Deuring–Heilbronn repulsion and Linnik's least-prime theorem (Linnik 1944; Knapowski 1962; Gallagher 1970; Bombieri, Astérisque 18, §6). §1.4e is the conductor-uniform character PNT (Iwaniec–Kowalski, Theorem 5.27, as used by Bennett–Siksek 2020). The central theorem is the uniform exclusion of Landau–Siegel zeros ([109], 2026). Based on the README and `bombieri1987`.

## Not verifiable

- Bombieri p. 42, the right side of Turán's lemma: the OCR is illegible there. The hypotheses were read; the bound `(|z₁|/50)^k` was checked mathematically (row F), not against the page.
- §0.11 (seeded): Koukoulopoulos, Theorem 3.4(a), p. 40, has no legal open copy. Only §0.11b, which the change cites, was checked, against its use.
- The texts listed in the previous review (Iwaniec–Kowalski, Linnik, Knapowski, Gallagher, Bach, Belabas–Diaz y Diaz–Friedman, Davenport, Jutila) stand as there.

Automatic checks set aside as false positives: the check for files outside the roadmap folder, run by hand at this head, lists 114 files. All are in roadmap folders that this pull request adds or revises, and the diff from the merge base outside those folders is empty.

## Source issues

- none

## For the human reviewers

- Licence: the sources service has no licence class for the publisher pages of Math. Comp. (Bach 1990 and Belabas–Diaz y Diaz–Friedman 2008, both cited by §2.42a) or of Math. Scand. (Jutila 1977, cited by §1.7). Whether these pages are open archives is for you to settle.
