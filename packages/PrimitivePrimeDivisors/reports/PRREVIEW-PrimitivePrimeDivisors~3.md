# Review of PrimitivePrimeDivisors (pull request #1773 at 3b2a3c3)

**Verdict:** accepted

Three P3 notes, no blocking finding. The gate passes at this head (every rule 0, `build=0 OK`), the dependency check reports no problem, every one of the eight Lean statements and every formula of the README survived the adversarial pass (table below), and all 87 Mathlib names the README cites resolve at the pin. The repair of the previous review is complete: each of its eight findings is checked below.

## Repair of the previous review (f8370a1 → 3b2a3c3)

- **R01 (build, `Mathlib.<submodule>` imports)** — repaired. `Suggested.lean` lines 1–3 are now `module` / `public import Mathlib`; the gate at 3b2a3c3 reports `imports=0 mathlib-subimports=0 no-import-mathlib=0 build=0`.
- **R02 (Tau Ceti files that do not exist at the pin)** — repaired. README line 140: "**From Tau Ceti.** Nothing: no `TauCeti.*` module is consumed". The commit-hash link, `eval_homogenize_natDegree_of_card_roots` and `TauCeti/Data/ZMod/OrderOf.lean` are gone (grep empty); §0.1 and §0.4 take the suggested `eval_homogenize` route over ℝ.
- **R03 (not in house form)** — repaired. Summary, layer table, Scope and ownership, Conventions (7 items), Exact supplier contracts, How to read the build, Layers 0–3 with `### k.n` prose subsections, a `*Needs:*` line on each of the 15 targets, `**Checks.**` lists (6 for the definition, 3–6 per theorem subsection), `### Examples` and `### Dependencies` per layer, Downstream consumers, References.
- **R04 (no locators)** — repaired. Every target carries a theorem-and-page locator into Birkhoff–Vandiver 1904, Roitman 1997 or Avcı (arXiv 2011.06136v2); `sources.toml` records the three texts as certified and Zsigmondy 1892 as uncertified. The page numbers of four Birkhoff–Vandiver theorems are off by one (R01 below).
- **R05 (process text, pull-request number, phantom name)** — repaired. `prnum=0`; the Mathlib pull-request and Zulip paragraph is gone; `Nat.exists_prime_orderOf_div_eq` appears nowhere. One remnant: a `## Provenance` section with a link into an external Lean repository (R03 below, P3).
- **R06 (docstrings)** — repaired. Module docstring in the "target signatures" form, lines 5–14; every declaration has a docstring with its source.
- **R07 (API declarations in the acceptance test)** — repaired. The seven API declarations are deleted; the file states one definition and seven theorems, and the valuation headline `padicValInt_homogeneousCyclotomic_of_not_primitive` the previous review named as the only Layer 1 candidate is now stated (line 32).
- **R08 (generality of the product formula; unused `0 < b`)** — repaired. `pow_sub_pow_eq_prod` is gone from the Lean; README §0.2 states the factorization for all `a b : ℤ` and `n > 0`; §0.1 states positivity for `0 ≤ b < a` and says explicitly that `0 < b` is not needed (line 190).

## R01 (P3) — Four Birkhoff–Vandiver locators are one page late

Location: `TauCetiRoadmap/PrimitivePrimeDivisors/README.md` line 8 ("Theorems I–IV, pp. 174–177"), line 10 and line 472 ("Theorem V, p. 178"), lines 297, 314, 232 ("Theorem I, p. 174"), line 413 ("Theorem III, p. 175"), lines 341, 350 ("Theorem IV, p. 177"), line 643; `Suggested.lean` lines 31 and 43 (same two locators).

Claim: in the printed paper Theorem I is enunciated on p. 173, Theorems II and III on p. 174, Theorem IV on p. 176 and Theorem V on p. 177; the README and the two docstrings give 174, 175, 177 and 178. The content cited at those pages (the congruence `a ≡ bm` on p. 174, the "not by `p²` for `n > 2`" clause on p. 177, the inequalities on p. 178, the `n' = 1` case on p. 179) is at the right page; only the theorem statements are mislocated.

Witness: BV1904 line 241 (Theorem I) is on the page whose footer is "(173)" (line 254); line 269–270 (Theorems II, III) under the header "174" (line 256); line 333 (Theorem IV) under "176" (line 318); line 375 (Theorem V) under "177" (line 352).

Repair: write "Theorem I, p. 173", "Theorem III, p. 174 (proof pp. 174–175)", "Theorem IV, p. 176 (proof pp. 176–177)", "Theorem V, p. 177 (proof pp. 177–179)" at those places, and "Theorems I–V, pp. 173–177" on lines 8 and 643.

## R02 (P3) — The symmetry item of §0.1 rests on a palindromic-coefficient claim with no supplier and no locator

Location: `README.md` lines 182–183: "Symmetry: `Φ_n(b,a) = Φ_n(a,b)` for `n ≥ 2` (the coefficient sequence of `Φ_n` is palindromic for `n ≥ 2`), and `Φ_1(b,a) = −Φ_1(a,b)`."

Claim: the parenthesis is the whole proof and is neither a Mathlib declaration nor a located statement. Mathlib at the pin has no reciprocity lemma for `cyclotomic`: grep of `RingTheory/Polynomial/Cyclotomic/` and `RingTheory/RootsOfUnity/` for `reverse`, `mirror`, `reflect`, `palindrom` is empty, and neither `Algebra/Polynomial/Reverse.lean` nor `Mirror.lean` mentions `cyclotomic`. The `*Needs:*` line of §0.1 (lines 194–196) lists nothing for it. The statement is true (for `n ≥ 2` the primitive `n`-th roots of unity are closed under inversion, so `X^φ(n) Φ_n(1/X) = Φ_n(X)`), so this is a locator-and-route note, not a mathematical defect.

Witness: the instances `Φ_2(5,2) = Φ_2(2,5) = 7`, `Φ_6(2,1) = Φ_6(1,2) = 3`, `Φ_1(2,5) = −3 = −Φ_1(5,2)` all agree with the claim; the Mathlib greps above return nothing.

Repair: state the palindromic property as its own sentence of §0.1 with a route ("the map `ζ ↦ ζ⁻¹` permutes the primitive `n`-th roots of unity, so `Φ_n` equals its reverse, `Polynomial.reverse`, for `n ≥ 2`; `n = 1` is `X − 1`") and a locator into a standard text, and add it to the `*Needs:*` line as a Layer 0 target.

## R03 (P3) — `## Provenance` is outside the house shape and links external code

Location: `README.md` lines 631–637 ("## Provenance … The repository https://github.com/AxiomMath/CFSG (Lean 4, Mathlib) proves … in `CFSG/LinearAlgebra/SL2MinimalFaithfulZsigmondy.lean` and … `CFSG/Timmesfeld/Orders/Bang.lean`") and line 52 ("(see [Provenance](#provenance))").

Claim: the house shape ends with Downstream consumers, optionally Worked examples, and References; a section that maps targets to files of another project's Lean source is neither a mathematical reference nor timeless (file paths in a third-party repository move). The previous review suggested one timeless sentence in Scope; that sentence is there (lines 50–54, "Relation to earlier formalizations") and already carries the information.

Witness: `grep -n http README.md` returns only line 634; no roadmap on main has a `## Provenance` section.

Repair: delete lines 631–637 and the parenthesis on line 52; the Scope paragraph stays.

## Verified sound

**Gate and dependency check.** Worker's gate at 3b2a3c3: every rule 0, `build=0 OK`. Depcheck run by me on this head with `--movable` against the merge-order candidate (PrimitivePrimeDivisors at line 374 of 374): `depcheck: 205 roadmaps, 1652 edges, 0 problem(s)`; no UPWARD, CYCLE or `moved:` line. The README has no cross-roadmap citation and no `*Needs:*` entry outside Mathlib and its own sections, so the supplier graph is Mathlib only. The pull request changes nothing outside the folder (`git diff --stat origin/main...HEAD -- . ':!TauCetiRoadmap/PrimitivePrimeDivisors'` is empty). The folder holds `README.md`, `Suggested.lean`, `metadata.toml` only.

**Ownership.** `roadmaps grep -i zsigmondy`, `homogeneousCyclotomic`, `cyclotomic₂`, `exists_prime_orderOf` and `-i 'primitive prime divisor'` over main and the 440 open pull requests at their heads: only this folder, except ArithmeticDynamics (README lines 7713, 8343), where "primitive prime divisor" is the dynamical notion for orbits of a polynomial, a different object. Mathlib `f6090c7` and Tau Ceti `358314d4`: `grep -rli "zsigmondy\|cyclotomic₂\|primitive prime divisor"` is empty. The board's package index lists nothing related. This roadmap is the owner of `Φ_n(a,b)`, the order criterion and the Bang–Zsigmondy theorem; its Scope paragraph says so and names what it leaves out (large Zsigmondy primes, Lucas–Lehmer sequences, orders of groups of Lie type).

**Sources: the seeded sample.** All fifteen sampled targets (0.1–0.4, 1.1–1.4, 2.1–2.4, 3.1–3.3) were checked at their locators in the three cached texts; page maps: BV1904 printed page = file page + 171; ROITMAN1997 printed page = file page + 1912; AVCI2020 printed page = file page.

- 0.1: BV1904 lines 322–329 (p. 176, `F(n)` defined as the product of `a − ωb` over primitive roots, the "algebraic primitive factor") and AVCI2020 lines 73–86 (Definition 2.4, p. 3, `Φ_n(a,b) = b^φ(n) Φ_n(a/b)`) support the definition. Positivity: ROITMAN1997 lines 33–36 (p. 1913, `Φ_n(a) > 0` for `n > 1` and real `a`).
- 0.2: BV1904 line 323 (p. 176, `V_n = F(1)F(n)F(n')…`) and AVCI2020 lines 91–94 (Corollary 2.6, p. 3) support `a^n − b^n = ∏_{d∣n} Φ_d(a,b)`; BV1904 lines 257–259 (Theorem I's proof, p. 174, "`b` is prime to `p`") supports the coprimality clause.
- 0.3: AVCI2020 lines 101–110 (Lemma 2.9 and Corollary 2.10, p. 4) state exactly the two expansion identities and the iterated form; ROITMAN1997 line 52 (p. 1914) is the `b = 1` quotient form.
- 0.4: AVCI2020 lines 99–100 (Corollary 2.8, p. 4) gives both strict bounds for `n ≥ 3`; the README's lower bound at `n = 2` is Mathlib's `sub_one_pow_totient_lt_cyclotomic_eval` (hypothesis `2 ≤ n`), not Avcı, and the README's route says so. BV1904 lines 390–392 and 405 (p. 178) are the inequalities `a^k − b^k > a^(k−1)` and `< a^k`; lines 430–433 (p. 179) the `n' = 1` geometric-sum case. ROITMAN1997 lines 39–43 and 51–53 (Lemma 1, pp. 1913–1914) is the consecutive-base estimate at `b = 1`.
- 1.1, 1.2: BV1904 lines 241–242 and 257–261 (Theorem I, pp. 173–174: a primitive prime divisor is `≡ 1 (mod n)`, through the order of `m` with `a ≡ bm`); ROITMAN1997 lines 15–18 (p. 1913, Zsigmondy prime defined by `p ∤ a` and order `n`, hence `n ∣ p − 1`).
- 1.3: BV1904 lines 333–334 (Theorem IV, p. 176) and 360–369 (p. 177: the imprimitive prime is the largest prime of `n`, `F(n)` divisible by `p` not `p²` for `n > 2`); ROITMAN1997 lines 63–68 (Proposition 2, p. 1914, including "`q² ∤ Φ_n(a)` unless `q = n = 2`" and "if `n > 2` then `Φ_n(a) = q`"); AVCI2020 lines 132–149 (Lemma 3.1, pp. 4–5).
- 1.4: BV1904 lines 270–273 and 280–298 (Theorem III, pp. 174–175, including the `V₁ = 2M` case); AVCI2020 lines 53–64 (Lemma 2.2, pp. 2–3) and 111–130 (Lemmas 2.11, 2.12, p. 4).
- 2.1: BV1904 lines 377–435 (proof of Theorem V, pp. 177–179); ROITMAN1997 lines 101–107 (proof of Theorem 3, p. 1915: `b^(q−2) < q` forces `q = 3`, `b = 2`, `n = 6`).
- 2.2, 2.3: BV1904 lines 375–376 (Theorem V, p. 177, `n ≠ 2`, single exception `2^6 − 1^6`); ROITMAN1997 lines 89–95 (Theorem 3, p. 1914, exceptions `n = 2, a = 2^s − 1` and `n = 6, a = 2`, "easy to verify"); line 148 (p. 1916, gcd of `a − 1` and `a + 1` at most 2); AVCI2020 lines 18–20 (p. 1, the two-variable statement with exceptions `(2,1,6)` and `n = 2`, `a + b = 2^k`).
- 2.4: Roitman Theorem 3 at `n = 2` as above.
- 3.1, 3.2: ROITMAN1997 lines 15–18 (p. 1913) and Theorem 3; the base-one specializations are Theorem 3 verbatim.
- 3.3: no source makes the `2n` statement; the README derives it from §3.1 and §1.1 (verified in the table). Zsigmondy 1892 p. 283 is uncertified (below).
- Downstream consumers: ROITMAN1997 lines 245–256 (p. 1918, the Wedderburn argument) and 135–141 (Theorem 6, p. 1915).

**Library declarations opened at the pins** (Mathlib `f6090c7`, Tau Ceti `358314d4`), by `#check @name` in one scratch file under `import Mathlib`: all 75 distinct names of the supplier contracts and `*Needs:*` lines elaborate (`Polynomial.cyclotomic_{zero,one,two,three,six,prime,prime_pow_eq_geom_sum,coeff_zero,pos,expand_eq_cyclotomic,expand_eq_cyclotomic_mul}`, `natDegree_cyclotomic`, `prod_cyclotomic_eq_X_pow_sub_one`, `coprime_of_root_cyclotomic`, `orderOf_root_cyclotomic_dvd` (`Cyclotomic/Basic.lean` 584), `isRoot_cyclotomic_prime_pow_mul_iff_of_charP` (`Expand.lean` 170), `sub_one_pow_totient_lt_cyclotomic_eval` (`Eval.lean` 170), `cyclotomic_eval_lt_add_one_pow_totient` (222), `cyclotomic_eval_le_add_one_pow_totient` (285), `sub_one_pow_totient_lt_natAbs_cyclotomic_eval`, `sub_one_lt_natAbs_cyclotomic_eval`, `homogenize` (`Homogenize.lean` 38), `homogenize_{map,mul,finsetProd,X,one,C,add,sub}`, `isHomogeneous_homogenize`, `eval_homogenize` (227), `aeval_homogenize_X_one`, `eval₂_homogenize_of_eq_one`, `map_cyclotomic`, `padicValNat.pow_sub_pow` (`Multiplicity.lean` 375), `pow_two_sub_pow` (346), `pow_add_pow` (384), `Int.emultiplicity_pow_sub_pow`, `Nat.emultiplicity_pow_sub_pow`, `ZMod.pow_card_sub_one_eq_one`, `ZMod.orderOf_dvd_card_sub_one` (`Finite/Basic.lean` 625), `ZMod.orderOf_units_dvd_card_sub_one` (622), `orderOf_dvd_iff_pow_eq_one`, `orderOf_dvd_of_pow_eq_one`, `orderOf_eq_iff` (`OrderOfElement.lean` 228), `orderOf_eq_zero_iff'`, `pow_orderOf_eq_one`, `MulEquiv.orderOf_eq`, `pow_eq_one_iff_modEq` (320), `orderOf_pow'`, `ZMod.natCast_eq_zero_iff`, `ZMod.intCast_zmod_eq_zero_iff_dvd`, `ZMod.natCast_eq_natCast_iff`, `ZMod.unitOfCoprime`, `ZMod.inv`, `ZMod.mul_inv_of_unit` (`ZMod/Basic.lean` 849), `ZMod.inv_coe_unit` (844), `Nat.sum_totient` (`Totient.lean` 163), `Nat.totient_prime`, `Nat.totient_dvd_of_dvd` (355), `Nat.lt_two_pow_self`, `Nat.exists_prime_and_dvd`, `Nat.Prime.eq_one_or_self_of_dvd`, `Nat.Coprime.gcd_eq_one`, `Nat.Prime.two_le`, `IsPrimitiveRoot.eq_orderOf` (`PrimitiveRoots.lean` 216), `mul_self_eq_one_iff` (`Ring/Commute.lean` 192), `padicValInt.of_nat`, `padicValNat.mul`, `padicValNat.pow`, `Int.ModEq`, `Nat.primeFactors`). Hypotheses match the README's descriptions: `padicValNat.pow_sub_pow` carries `Odd p`, `y < x`, `p ∣ x − y`, `¬ p ∣ x`, `n ≠ 0`; `pow_two_sub_pow` carries `Even n`; `isRoot_cyclotomic_prime_pow_mul_iff_of_charP` carries `[IsDomain R] [CharP R p] [NeZero (m : R)]`; `cyclotomic_pos` needs `2 < n`; the three real bounds need `2 ≤ n`, `3 ≤ n`, none; `eval_homogenize` is over a `Semifield` with `natDegree p ≤ n` and `x 1 ≠ 0`.

**Signatures.** The worker's `signatures.md` lists the elaborated type of all 8 declarations, none with a dropped binder; I compared each with its README statement (Summary, §1.3, §2.2, §2.3, §3.1, §3.2, §3.3): hypotheses and generality agree in every case (naturals with `0 < b`, `b < a`, `a.Coprime b`; `3 ≤ n` for the valuation headline; the two exceptions as `h₂`, `h₆` or as `h₁`, `h₃` at the exponent `2n`; `ZMod.inv` in the order form, as Conventions 4 says). No `variable` block exists in the file.

**Convention witnesses at the pin** (elaborated by `simp` from `cyclotomic_one/two/zero` and `homogenize_X/one/add/sub`): `Φ_1(5,2) = 3`, `Φ_1(2,5) = −3`, `Φ_2(5,2) = 7`, `Φ_0(5,2) = 1`. The swapped-variable model gives `−3` at `(5,2)`; README Conventions 3 and the §0.1 Checks state exactly these values.

**One-tactic padding probe** on copies of the seven theorems in a scratch file: `first | simp | simp [homogeneousCyclotomic] | omega | exact?` leaves every goal open (`exact?` fails on all seven; `simp` reduces nothing). No padding; nothing restates a definition or a Check. `homogeneousCyclotomic` has a real body on `Polynomial.cyclotomic`, `homogenize` and `MvPolynomial.eval`, and is the only definition.

**Headline theorems.** From the README (lines 12–15 and §1.3): Bang–Zsigmondy existence, its exact-exception characterization, the two-variable order form, the base-one order corollaries for `a ≥ 3` and `a = 2`, the order-`2n`/sum-of-powers theorem, and the valuation of a nonprimitive prime in `Φ_n(a,b)`. All seven are statable at the pin and stated. The module docstring says every headline is statable, which is correct. Nothing from the README's API bullets or Checks is in the Lean.

**Lean form.** `module` / `public import Mathlib` / `@[expose] public section`, which the gate accepts (`imports=0`, `build=0`); no other import, no `set_option`, no `lemma`, no `#eval`, no sorry'd data, one namespace, layer section comments in README order, a docstring on every declaration, 92 lines.

**Adversarial table.** Each row gives the instances and the values on each side; `Φ_n` is `homogeneousCyclotomic`, `v_p` the valuation, `ord_p(x)` the order of `x` in `ZMod p`.

| Statement | Instances tried | Values | Result | Change |
| --- | --- | --- | --- | --- |
| `homogeneousCyclotomic` convention (Conv. 3, §0.1) | (n,a,b) = (1,5,2), (1,2,5), (2,5,2), (0,5,2), (3,5,2), (6,2,1), (6,3,2) | 3, −3, 7, 1 (elaborated); 25+10+4 = 39; 4−2+1 = 3; 9−6+4 = 7; swapped model −3 at (1,5,2); over-degree model 14, 78 | first slot is `a`; degree exactly `φ(n)` | none |
| §0.1 values at `b = 0`, `a = 0` | (4,3,0), (1,3,0), (1,0,3), (2,0,3), (4,0,3) | 3² = 9, 3, −3, 3, 9 = 3^φ(4) | `Φ_n(0,b) = b^φ(n)` needs `n ≥ 2` and the README says so | none |
| §0.1 positivity for `0 ≤ b < a`, `n ≥ 1` | (1,2,1), (2,1,0)… (6,3,2), (4,3,0), n = 3 via `cyclotomic_pos` | 1, 1, 7, 9; n=1,2 closed forms `a−b`, `a+b` > 0 | holds; `0 < b` not needed | none |
| §0.1 symmetry | (2,5,2)/(2,2,5), (6,2,1)/(6,1,2), (1,5,2)/(1,2,5) | 7 = 7; 3 = 3; 3 = −(−3) | true; route unowned | R02 (P3) |
| §0.1 natAbs/valuation comparison | (3,5,2), p = 3; (2,3,1), p = 2 | `v_3(39) = 1 = padicValInt 3 39`; `v_2(4) = 2` | agree for positive values | none |
| §0.2 factorization | (2,1,6); (2,1,4); (3,2,2); n = 0; a = b | 63 = 1·3·7·3; 15 = 1·3·5; 5 = 1·5; `0 ≠ 1` (empty product) so `0 < n` needed; `Φ_1(a,a) = 0` both sides 0 | correct, hypothesis necessary | none |
| §0.2 prime divisors of `Φ_n` prime to `ab` | (4,1,3): 21 = 3·7; (3,1,1): 2; p ∣ b model (6,2,2) not coprime | 3 ∤ 4, 7 ∤ 4; 2 ∤ 3; `Φ_2(6,2) = 8`, 2 ∣ 2·6: the coprimality hypothesis is used | correct | none |
| §0.2 `Φ_n ∣ (a^n − b^n)/(a^d − b^d)` | (2,1,6), d = 3; d = 2 | 63/7 = 9 = 3·3, Φ_6 = 3 ∣ 9; 63/3 = 21, 3 ∣ 21 | correct | none |
| §0.3 expansion identities | p=2∣n=2: (4,2,1), (4,3,1); p=2∤3: (2,1); p=3∣3: (9,2,1); iterated n = 18 | Φ_4(2,1) = 5 = Φ_2(4,1); 10 = Φ_2(9,1); 3·7 = 21 = Φ_3(4,1) = 16+4+1; Φ_9(2,1) = 73 = Φ_3(8,1) = 64+8+1 (and 511 = 7·73); Φ_18(2,1) = 57 = Φ_6(8,1) = 64−8+1 | correct | none |
| §0.4 three bounds | (2,1,2), (2,1,6), (3,2,6), (3,1,3), n = 1 | 1 < 3 ≤ 3 (equality, so strict needs n ≥ 3); 1 < 3 < 9; 1 < 7 < 25; 4 < 13 < 16; n = 1: `a−b < a−b` false, `a−b ≤ a+b` true | hypotheses exact | none |
| §0.4 geometric-sum bound `Φ_p(a,b) ≥ p` | (3,2,1), (5,2,1), (2,1,1), (3,1,1) | 7 > 3; 31 > 5; 2 = 2 (equality at a = b = 1); 3 > 2 | correct | none |
| §0.4 consecutive-base estimate `Φ_{pm}(a,b) > ((a^p−b^p)/(a+b))^φ(m)` | (2,1), p=3, m=2; (3,2), p=3, m=2; (2,1), p=5, m=2; m = 1, (2,1), p = 3 | 3 > 7/3; 7 > 19/5 = 3.8; Φ_10(2,1) = 11 > 31/3; Φ_3(2,1) = 7 > 7/3 | strict in all cases (m = 1: `a−b < a+b`; m = 2: `a^p+b^p > a^p−b^p`) | none |
| §1.1 order criterion | p=7,(2,1), k=3,6,2; p=5,(3,2), k=2,1; k=0; p=3,(3,1) | 7∣7, 7∣63, 7∤3, ord = 3; 3·2⁻¹ ≡ 4, ord 2, 5∣5, 5∤1; `p ∣ 0` and `ord ∣ 0`; ord_3(0) = 0, `0 ∣ 2` false | correct; `¬ p ∣ ab` needed for "divides `p−1`" | none |
| §1.2 primitivity ↔ order `n` | (3,1,3): 26 = 2·13; (2,1,6): 63; (3,2,6): 665; (2,1,2): 3; n = 1 | ord_13(3) = 3 (3,9,27≡1), ord_2(3) = 1; ord_3(2) = 2, ord_7(2) = 3, none 6; ord_7(5) = 6 (5,4,6,2,3,1), ord_5 = 2, ord_19(3·2⁻¹=11) = 3 (11,121≡7,77≡1); 3 = n+1 sharp; n = 1: p ∣ a−b ↔ ord 1 | both directions | none |
| §1.3 order = prime-to-`p` part of `n` | (2,1,6), p=3; (3,1,4), p=2; (4,1,9), p=3; (3,2,6), p=7 | d = 2 = 6/3; d = 1 = 4/4; Φ_9(4,1) = 4161 = 3·19·73, d = ord_3(4) = 1 = 9/9; d = 6 = 6/1 (e = 0, primitive) | correct | none |
| `padicValInt_homogeneousCyclotomic_of_not_primitive` | (3,1,4,2), (2,1,6,3), (4,1,3,3), (5,2,3,3), (7,4,3,3), (5,3,4,2), (7,1,8,2), (4,1,9,3); vacuous (3,2,6,7); n = 2 controls (3,1,2,2), (7,1,2,2) | v₂(10)=1, 2=P(4); v₃(3)=1, 3=P(6); v₃(21)=1; v₃(39)=1; v₃(93)=1 (93 = 3·31); v₂(34)=1; v₂(2402)=1 (2402 = 2·1201); v₃(4161)=1 (LTE: v₃(4⁹−1) = 1+2 = 3, v₃(4³−1) = 2); 7 ∤ 1,5,19,65,211 so `hk` fails; v₂(4) = 2, v₂(8) = 3 exclude n = 2 | true for n ≥ 3; `3 ≤ n` necessary | none |
| §1.3 dichotomy `Φ_n ∈ {1, P(n)}` ⇒ `= P(n)` | (2,1,6); any n ≥ 2 | Φ_6 = 3 = P(6); `Φ_n > (a−b)^φ(n) ≥ 1` so Φ_n ≥ 2 ≠ 1 | correct | none |
| §1.4 `v_p(a^k − b^k)`, odd `p` | p=3,(4,1): k=3, 2; p=7,(2,1), d=3: k=6, 21; d ∤ k: p=3,(2,1),k=5 | v₃(63) = 2 = 1+1; v₃(15) = 1 = 1+0; v₇(63) = 1 = 1+0; v₇(2²¹−1) = 2 = 1+1 (2²¹−1 = 7²·127·337); v₃(31) = 0 | correct | none |
| §1.4 `v₂`, `(a,b)` odd | (3,1): k = 2, 4, 3; odd-rule-at-2 model | v₂(8) = 3 = v₂(8)+v₂(2)−1; v₂(80) = 4 = 3+2−1; v₂(26) = 1 = v₂(2); wrong model predicts 2 | correct | none |
| §1.4 `v_p(Φ_n)` | p=3,(2,1), d=2: n = 2, 6, 18, 4; p=2,(3,1): n = 1, 2, 4, 8 | 1 = v₃(3); 1; v₃(57) = 1; v₃(5) = 0; v₂(2) = 1 = v₂(a−b); v₂(4) = 2 = v₂(a+b) (exception); v₂(10) = 1; v₂(82) = 1 | all four clauses | none |
| §2.1 `Φ_n(a,b) > P(n)`, n ≥ 3 | (2,1,n), n = 3,4,5,6,10,12,18; (3,2,6), (3,1,6), (4,3,6) | 7>3, 5>2, 31>5, 3 = 3 (exception), 11>5, 13>3, 57>3; 7>3, 7>3, 13>3 | exception exactly (2,1,6) | none |
| §2.1 case `a−b ≥ 2` | p = P(n), n = 6, (3,1); (4,1,3) | Φ_6(3,1) = 7 > 2^φ(6) = 4 ≥ 2^{φ(3)} = 4 ≥ 3; 21 > 4 ≥ 3 | `φ(p) ∣ φ(n)`, `p ≤ 2^(p−1)` | none |
| §2.1 case `a−b = 1`, `e ≥ 2` | (2,1,18): A = 2³ = 8, B = 1 | A − B = 7 ≥ a^p − b^p = 7 ≥ 3; Φ_6(8,1) = 57 > 3 | correct | none |
| §2.1 case `a−b = 1`, `e = 1`, `m ≥ 2` | (2,1), p=3; (2,1), p=5; (3,2), p=3; (4,3), p=3 | (8−1)/3 = 7/3 < 3 (escape, m∣2 ⇒ n = 6); 31/3 > 5 ≥ 2³ = 8? 2^{p−2} = 8 ≥ 5 ✓; 19/5 > 3 = 3^{1}; (64−27)/7 = 37/7 > 4 ≥ 3 | two largest terms sum to `a^(p−2)(a+b)` | none |
| `exists_prime_dvd_pow_sub_pow` | (3,1,3), (2,1,5), (3,2,6), (4,1,2), (3,2,2); excluded (2,1,6), (3,1,2), (5,3,2) | 13 ∣ 26, 2 ∤ 13; 31; 7 primitive in 665 = 5·7·19; 5 primitive in 15; 5 ∣ 5; 63 = 3²·7 with 3∣3, 7∣7; 8 = 2³, 2∣2; 16 = 2⁴, 2∣2 | exceptions exact | none |
| `exists_prime_dvd_pow_sub_pow_iff` | (2,1,6), (7,1,2), (3,2,2), (3,1,3), (3,1,2) | both false (3∣3, 7∣7); 48 = 2⁴·3, 2∣6, 3∣6, a+b = 8, both false; a+b = 5 prime, both true; 13, both true; a+b = 4, both false | iff both ways | none |
| §2.3 `n = 2`, `a+b = 2^k` converse | general: a, b odd coprime | primes of a+b = {2}; 2 ∣ a−b; so no primitive prime; k ≥ 2 since a+b ≥ 3 | correct | none |
| §2.4 exponent one | (3,2), (5,2), (4,1) | a−b = 1 none; 3 primitive for 3; 3 primitive for 3 | iff `1 < a−b` | none |
| `exists_prime_orderOf_div_eq` | (3,2,6), (2,1,2), (4,1,2), (5,2,3); excluded (2,1,6), (3,1,2) | ord_7(3·2⁻¹ = 5) = 6, 7 ∤ 6; ord_3(2) = 2; ord_5(4) = 2; 39 = 3·13, ord_13(5·2⁻¹ = 5·7 = 35 ≡ 9) = 3 (9, 81≡3, 27≡1); none of order 6 at 3, 7; 8 = 2³, ord_2(3) = 1 | correct; `¬ p ∣ ab` makes the inverse the field inverse | none |
| `exists_prime_orderOf_eq` | (3,3), (3,4), (3,6), (4,3); boundary (3,2) | ord_13(3) = 3; ord_5(3) = 4; 728 = 8·7·13, ord_7(3) = 6; ord_7(4) = 3; (3,2): 8 = 2³, ord_2(3) = 1, so `3 ≤ n` needed at a = 3 | correct | none |
| `exists_prime_orderOf_two_eq` | n = 2, 3, 4, 5, 7; n = 6 | ord_3(2) = 2, ord_7(2) = 3, ord_5(2) = 4, ord_31(2) = 5, ord_127(2) = 7; n = 6: 63, orders 2 and 3 only | `n ≠ 6` necessary | none |
| `exists_prime_dvd_pow_add_pow` | (2,1,2), (3,2,3), (2,1,1), (4,1,1); excluded (2,1,3), (3,1,1) | 5 ∣ 5, 5 ∤ 1,3,7; 35 = 5·7, 7 ∤ 1,5,19,65,211, ord_7(5) = 6; 3 ∣ 3, 3 ∤ 1; 5 ∣ 5, 5 ∤ 3; 9 = 3², 3 ∣ 3 = 2²−1; 4 = 2², 2 ∣ 2 | exceptions = those of 2n ∈ {2, 6} | none |
| §3.3 order `2n` ⇒ `p ∣ a^n + b^n` and warning | p = 7, (3,2), n = 3; p = 3, (2,1), n = 3 | (3/2)³ ≡ 5³ = 125 ≡ 6 = −1 (mod 7), 7 ∣ 35; 3 ∣ 9 but ord_3(2) = 2 ≠ 6 | correct; the converse is not claimed | none |
| §3.4 `u^k = −1 ↔ n/2 ∣ k ∧ ¬ n ∣ k` | ℂ, u = i, n = 4, k = 2,4,6; ℤ, u = −1, n = 2; ZMod 8, u = 3; char 2 | i² = −1 (2∣2, 4∤2); i⁴ = 1; i⁶ = −1 (2∣6, 4∤6); (−1)^k = −1 iff k odd; 3² = 1, order 2, 3 ≠ 7 = −1 (not a domain); u^{2m} = 1 ⇒ (u^m − 1)² = 0 ⇒ no even order, vacuous | domain hypothesis necessary and present | none |
| §3.4 `p ∣ q^k − 1 ↔ n ∣ k`, `p ∣ q^k + 1` | (7,2,3): k = 3, 2; (5,2,4): k = 2, 4, 6; (3,3): k = 0, 1 | 7∣7 ↔ 3∣3; 7∤3 ↔ 3∤2; 5∣5 (2∣2, 4∤2), 5∤17, 5∣65; ord_3(0) = 0: 3 ∣ 0 ↔ 0 ∣ 0, 3 ∤ 2 ↔ 0 ∤ 1 | correct, including `p ∣ q` | none |
| Conventions 4 (`ZMod.inv` vs field inverse) | p = 7, b = 2 | `ZMod.inv 7 2 = 4`, 2·4 = 8 ≡ 1 (`mul_inv_of_unit`) | agree at a prime for units | none |

**Checks and worked examples against the theorems.** Every Check of §§0.1–3.4 (41 bullets) and every `### Examples` value was recomputed; each agrees with the theorem of its section and with the other Checks on the same object (values above). The negative controls (`(3,1,2)`, `(7,1,2)` with valuations 2 and 3; `ZMod 8`; `(2,1,6)`; `(3,2)` at exponent one) refute the intended wrong models and no stated theorem.

**Cross-roadmap citations resolved:** none exist. **Gaps declared:** none, and none needed (Mathlib is the only supplier). **Generality:** README and Lean agree on every headline; the README never narrows below the sources (the two-variable coprime form is Avcı's and Birkhoff–Vandiver's; Roitman's is the `b = 1` case and is cited as such). **Invented vocabulary:** none; "primitive prime divisor", "homogeneous cyclotomic value" (Avcı Definition 2.4), `P(n)` are defined in Conventions.

## Not verifiable

- Zsigmondy 1892 (Monatshefte 3, p. 283): recorded `uncertified` in `sources.toml` (Springer, paywalled); cited by its locator alone in the Summary, §2.2 and the Lean docstring, as the manifest allows. Not re-requested.
- Bang 1886 is no longer cited (the README names the theorem "Bang–Zsigmondy" and cites Zsigmondy, Birkhoff–Vandiver, Roitman and Avcı only), so nothing to verify.
- Ownership against open pull requests was checked through the roadmap index of 2026-11-03 (440 pull requests) and the board's package index; both are complete for this purpose.

## Source issues

- **Error** in AVCI2020 at Lemma 2.11, p. 4: the lemma is stated for every prime `p` and gives valuation `1` whenever `n = p^β k` with `β ≥ 1`; at `p = 2`, `(a,b) = (3,1)`, `n = 2` the value `Φ_2(3,1) = 4` has valuation `2`; it should be restricted to odd `p` (Lemma 2.12 on the same page gives the `p = 2` case, with `v₂(a + b)` at `n = 2`); affects nothing here (the README's §1.4 states the `(2,2)` exception and the proof of Lemma 3.1 uses Lemma 2.12 for `p = 2`).
