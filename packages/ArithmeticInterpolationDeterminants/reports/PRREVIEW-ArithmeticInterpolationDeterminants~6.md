# Review of ArithmeticInterpolationDeterminants (pull request #1905 at e456394)

**Verdict:** accepted

Incremental re-review of the 41 changed lines since `e1cb5e5`. All three findings of the previous review are repaired, the repairs introduce no new problem, the gate passes with every check at `0`, the dependency check reports no problem, and `Suggested.lean` elaborates at the pins with only the fifteen `sorry` warnings. No finding remains, new or carried.

## Previous findings

- R01 — repaired: `Suggested.lean:51–53` states `powerSubstitution_injOn (B : ℕ)` with no `hB`; `README.md:430` says "for every `B`"; `README.md:438–440` says no positivity is assumed and the set is empty at `B = 0`; the Check at `README.md:457–459` is the negative control on the strip `{μ | μ 0 < 1}`.
- R02 — repaired: Summary `README.md:4–6` ("`e ≥ 0`", "the ordinary identity and the ordinary test for `e ≥ 1`"); Scope `README.md:47–51` ("the Hasse identity for every `e ≥ 0` and orders below `p^e`, the ordinary identity for `e ≥ 1`"); Conventions `README.md:199–201` define the Frobenius substitution for every `e ≥ 0`, with `W ↦ X` at `e = 0`.
- R03 — repaired: the Scope bullet `README.md:107–112` names GlobalHolomorphicFunctions §2.5, the Chinese remainder construction for the pairwise coprime powers `(X − a)^(m_a + 1)` at finitely many points of `ℂ`, and makes it the case `K = ℂ` of the quotient comparison of 1.2.

## Verified sound

**The changed passages, one by one.**

- `README.md:4–6`, `47–51`, `199–201` (R02): the three statements now agree with 0.4 (`README.md:462–468`: ordinary identity "for `0 < e`", Hasse identity "for every `e` and every `k < q`"), with 0.6 (`README.md:538`: Hasse test "with any `e ≥ 0`"; `556`: ordinary test "for `0 < e`"), with the Conventions bullet at `README.md:195–197` ("`0 < e` wherever the case `q = 1` is false") and with the Lean (`hasseDeriv_powerSubstitution` and `exists_nonzero_hasse_jet_on_frobenius_graph` carry no `0 < e`; `iterate_derivative_powerSubstitution` and `exists_nonzero_ordinary_jet_on_frobenius_graph` carry `he : 0 < e`). Every remaining `e ≥ 1` / `0 < e` in the README (lines 6, 18, 48, 51, 197, 463, 483, 506, 522, 556–560, 582–587, 1167) is an ordinary-derivative statement or a Check of why the ordinary form needs it.
- `README.md:430`, `438–440`, `457–459` and `Suggested.lean:47–53` (R01): the docstring, the prose and the Check all say the same thing, and the mathematics is right (table below). The Tau Ceti input `injOn_aeval_X_pow` (`TauCeti/RingTheory/MvPolynomial/Kronecker.lean:109`) takes an arbitrary weight `e : σ → ℕ` and an arbitrary support set `T` on which the weight is injective, with no positivity hypothesis, so the route needs none either: the weight `(1, B)` is injective on `{μ | μ 0 < B}` for every `B` (uniqueness of quotient and remainder on division by `B` when `B > 0`; the empty strip when `B = 0`).
- `README.md:107–112` (R03): read against `TauCetiRoadmap/GlobalHolomorphicFunctions/README.md:1170` (heading "2.5 Runge equivalences, pole pushing, and interpolation") and `1198–1203` at the head of its pull request (`9b76a62`): the finite-jet interpolation refinement, for a finite subset of the compact `K ⊂ ℂ` and prescribed jet orders, builds the Hermite polynomial by the Chinese remainder theorem for the pairwise coprime powers `(X − a)^(m_a + 1)`, with `Q = ∏ (z − a)^(m_a + 1)`. The bullet's description is accurate. GlobalHolomorphicFunctions is line 97 of the merge order, this roadmap line 401, and the bullet is a Scope deferral (no `*Needs:*` edge, no supplier-table row), so it creates no dependency; it names the roadmap and its section, not a pull-request number.

**Gate, order and build.**
- The worker's gate and my rerun (`gate … --base origin/main`) both report `OK` with `0` on every check.
- Dependency check (the command of the brief, with `--movable`): `depcheck: 236 roadmaps, 2261 edges, 0 problem(s)`, no UPWARD, CYCLE or `moved:` line.
- `git diff --stat origin/main...HEAD` outside the folder is empty.
- `lake env lean` on `Suggested.lean` at the pins: exit `0`, 15 lines of output, all `declaration uses sorry`, no error.
- Signatures: `scratch/signatures.md` elaborates `powerSubstitution_injOn` as `∀ {R} [CommRing R] (B : ℕ), Set.InjOn ⇑(powerSubstitution B) {f | MvPolynomial.degreeOf 0 f < B}`, which is the README statement at `README.md:430–431`; no section binder is lost in any of the 18 declarations (the previous review's `#check` pass, unchanged by a dropped explicit hypothesis).
- One-tactic probe on the changed statement, in a scratch copy with the Tau Ceti Kronecker module imported: `first | (simp_all; done) | exact?` fails (`exact?` finds nothing), and a direct `exact MvPolynomial.injOn_aeval_X_pow …` does not unify (the Tau Ceti map is `aeval fun s ↦ X ^ e s` on `restrictSupport R T`, ours is `aeval (if i = 0 then X else X ^ B)` on `{f | degreeOf 0 f < B}`). The `B = 0` instance alone closes by `intro f hf; simp at hf`, which is the vacuity the README now states. Not padding.

**Adversarial table.** Rows for the untouched statements are carried from the previous report (of `e1cb5e5`), whose computations they cite; the changed statement and the two changed conventions get new rows.

| Statement | Instances | Values computed (each side) | Result | Change |
| --- | --- | --- | --- | --- |
| `powerSubstitution_injOn` (changed: `hB` dropped) | `B = 0`, the set `{f | degreeOf 0 f < 0}`; `B = 0`, `W` and `1`; `B = 2`, `Z²` and `W`; `B = 2`, `Z + W` and `Z + ZW` | `degreeOf 0 f ≥ 0` for every `f`, so the set is empty and `InjOn` holds (closed by `simp` in the probe); `powerSubstitution 0 W = X⁰ = 1 = powerSubstitution 0 1`, both of `Z`-degree `0 < 1`, so injectivity fails on `{μ | μ 0 < 1}` but that strip is not the statement's; `Z² ↦ X²`, `W ↦ X²`, `Z²` has `Z`-degree `2 ≥ 2` so is outside the set; `X + X² ≠ X + X³` | true for every `B`; the Check is a correct negative control | none |
| Conventions: Frobenius substitution at `e = 0` (changed) | `p` any, `e = 0`, `q = 1`, `F = ZW`, `a = 3` | `powerSubstitution 1 (ZW) = X · X¹ = X²`; graph point `(3, 3¹) = (3, 3)`; `eval 3 X² = 9 = eval ![3, 3] (ZW)` | the `e = 0` substitution is `W ↦ X` as stated | none |
| Summary/Scope exponent ranges (changed) | Hasse identity at `e = 0`: `q = 1`, `k < 1`; ordinary identity at `e = 0`: `F = W` | only `k = 0`: `D^[0] (F(X, X)) = F(X, X) = powerSubstitution 1 (∂_Z^[0] F)`, trivially true; `D X = 1 ≠ 0 = powerSubstitution 1 (∂_Z W)` | Hasse for `e ≥ 0`, ordinary for `e ≥ 1`, as written | none |
| Scope bullet GlobalHolomorphicFunctions §2.5 as `K = ℂ` of 1.2 (changed) | one node `a = 0`, `m_0 + 1 = 2` | `ℂ[X] ⧸ (X²)` has basis `1, X`; the jets `(f(0), D^[1] f (0)) = (c₀, c₁)` of `f = c₀ + c₁ X + X² g` depend only on the class mod `X²`, matching 1.2's quotient comparison `degreeLT ≃ K[X] ⧸ (∏ (X − a_i)^(m_i))` | consistent | none |
| `powerSubstitution` (def) | as in the review of `e1cb5e5` | `X + X²`; `X + X³`; `X⁵ + X⁷`, `7 ≤ 8`; `27 = eval ![3, 9] (ZW)` | sound | none |
| `iterate_derivative_powerSubstitution` | as in the review of `e1cb5e5` | `D X³ = X² = φ(W)`; `D X² = 0`; `e = 0`: `D X = 1 ≠ 0` | sound, `0 < e` needed | none |
| `hasseDeriv_powerSubstitution` | as in the review of `e1cb5e5` | `C(i + qj, k) ≡ C(i, k) (mod p)` for `k < q`, 0 violations over eight `(p, e)`; `k = q`: `1 ≠ 0` | sound | none |
| `exists_nonzero_hasse_jet_on_frobenius_graph` | as in the review of `e1cb5e5` | 0 violations in 2,022 brute-force instances over `𝔽_p`; the 0.6 Checks | sound | none |
| `exists_nonzero_ordinary_jet_on_frobenius_graph` | as in the review of `e1cb5e5` | 0 violations in 1,362 instances; `e = 0` and `m ≥ p` controls fail as stated | sound | none |
| `hermiteJet`, `hermiteJet_bijective`, `all_jets_vanish_iff_dvd` | as in the review of `e1cb5e5` | `(c₀, c₀ + c₁)` Lagrange values; `X^p` ordinary jets `0`, Hasse jet `1`; `X² ∤ X`, `X(X − 1) ∣ X² − X` | sound | none |
| `det_confluentVandermonde`, 1.3 symmetries | as in the review of `e1cb5e5` | 11 listed instances and 400 random draws, 0 violations; `625/16 = 625/16` | sound | none |
| `det_mem_prod_row_ideals`, 2.1, 2.2 | as in the review of `e1cb5e5` | `6 ∈ 6ℤ`; `−1 ∉ 6ℤ`; 300 random, 0 violations; `det = −1` vs coordinate determinants `0`, `1` | sound | none |
| 3.2, `det_gram_matrix_smul`, 3.3 complex form | as in the review of `e1cb5e5` | minor `1 = 1`; `16 = 4² · 1`; 300 random, 0 violations; `(det U)² = −1` wrong for `U = [[i]]` | sound | none |
| `derivative_prod_mem_ideal_pow`, `pderiv_prod_mem_ideal_pow` | as in the review of `e1cb5e5` | 630 random, 0 violations; `X³`, `J = (3)`: ordinary `6 ∈ (3)`, Hasse `1 ∉ (3)`; `σ = Fin 3`: `14 ∉ (0)²` | sound | none |
| `abv_det_le_factorial_prod`, 4.2, `norm_hasseDeriv_eval_le`, 4.3, Layer 4 Examples | as in the review of `e1cb5e5` | 400 random, 0 violations; `4 ≤ 6` max over `±1` `3 × 3`; `20 ≤ 21`, coarse `1200`; `3 ≤ 3`; `B = (1,1,1)`, `1 ≤ 6` | sound | none |
| 0.1, 0.2, 0.5, 5.1, 5.2 | as in the review of `e1cb5e5` | ranks `6`, `6`; `(0, 1, 2)`; `8`, `4 ∣ 8`; `4 ∤ 2`; `8 ∤ 12`; `−9` | sound | none |

**Sources.** The diff adds no locator. The seeded sample (0.2, 0.3, 0.4, 0.5, 1.1, 1.2, 1.3, 2.1, 2.2, 3.3, 3.4, 4.1, 4.3, 5.1, 5.2) was read at every locator in the previous review against IK, P, M, W, Treil and Laurent in the sources cache and found supported; the locators of 0.3 and 0.4, the only sampled targets the diff touches, are unchanged (`README.md:441–443`, `483–487`) and the changed sentences (injectivity for every `B`; `e ≥ 0`) are the roadmap's own extensions, which the README already marks as such (P's Kronecker substitution is for `d ≥ 1`; IK Lemma 11.17 is for `q` a prime power with a field of `q` elements, `k < q`).

**Duplication and ownership.** The pins are unchanged (Tau Ceti `2fd255d9`, Mathlib `1b1ccf4b`), the diff adds no object, and the Scope bullet turns the one second builder of a Hermite polynomial on an open head into a listed deferral. `scratch/overlaps.md`: no other open pull request changes this roadmap, no id dropped in either direction, no id only an open revision defines. `scratch/citations.md`: the one lead, `Polynomial.hasseDeriv_expand_mul`, is GrothendieckNotesLemmas §1.4's own name, as the previous review resolved.

**Remarks on untouched text** (not findings): none new.

## Not verifiable

- None. Every text the diff touches is in the sources cache; GlobalHolomorphicFunctions was read at the head of its pull request.

## Source issues

- none
