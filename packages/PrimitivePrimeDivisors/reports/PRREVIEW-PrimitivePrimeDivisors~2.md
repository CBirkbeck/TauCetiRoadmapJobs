# Review of PrimitivePrimeDivisors (pull request #1773 at f8370a1)

**Verdict:** needs changes

The mathematics is sound: every one of the eleven Lean statements and every formula of the README survived the adversarial pass (table below). What blocks acceptance is the gate (the build fails on the four `Mathlib.<submodule>` imports) and two Tau Ceti citations that do not exist at the pinned library. Everything else is form: the README is a milestone sketch in P0–P3 blocks rather than a roadmap in house shape, with no locators, no per-definition Checks and no supplier contracts.

## R01 (P1) — Gate build fails: four `Mathlib.<submodule>` imports

Location: `TauCetiRoadmap/PrimitivePrimeDivisors/Suggested.lean` lines 1–4 (`import Mathlib.Algebra.Polynomial.Homogenize`, …, `import Mathlib.FieldTheory.Finite.Basic`).

Claim: the worker's gate at f8370a1 reports `build=4 FAIL`, plus `imports=1`, `mathlib-subimports=4`, `no-import-mathlib=1`. The four build lines are Lake's module-system warnings ("imports `Mathlib.Algebra.Polynomial.Homogenize` from package `mathlib`, which is designed for use with the module system"), one per submodule import; the gate counts them as build problems.

Witness: `scratch gate` output as quoted; the same four files elaborate without any warning under a single `import Mathlib` (my probe files `Probe.lean` and `Witness.lean`, which redeclare `homogeneousCyclotomic` under `import Mathlib`, elaborated cleanly at the pin).

Repair: replace lines 1–4 by the single line `import Mathlib`. No `TauCeti.*` module is used, so nothing else is imported. This also clears the `imports`, `mathlib-subimports` and `no-import-mathlib` rules.

## R02 (P2) — Tau Ceti declarations cited that do not exist at the pin

Location: `TauCetiRoadmap/PrimitivePrimeDivisors/README.md` lines 20–24: "Native [`Polynomial/Homogenize`](…TauCeti/blob/d7dad378…/TauCeti/Algebra/Polynomial/Homogenize.lean) supplies `eval_homogenize_natDegree_of_card_roots` … and the existing `TauCeti/Data/ZMod/OrderOf.lean` API for order comparisons."

Claim: neither file exists at the pinned Tau Ceti. The pull request's `lake-manifest.json` and main's both pin Tau Ceti at `358314d4` (2026-10-07). At that commit `TauCeti/Algebra/Polynomial/` has no `Homogenize.lean` and `TauCeti/Data/ZMod/` has no `OrderOf.lean`; `grep -r eval_homogenize_natDegree_of_card_roots` over the pinned tree returns nothing, and `#check @Polynomial.eval_homogenize_natDegree_of_card_roots` under `import Mathlib` is an unknown constant. The commit the README links, `d7dad378` (2026-10-30), is a descendant of the pin, not an ancestor: both files appear there, with `eval_homogenize_natDegree_of_card_roots` at line 107 and `orderOf_natCast_dvd_orderOf_natCast` at line 59. The roadmap therefore depends on library material that is ahead of what it is tested against, and P0's bound route ("the root-product formula") rests on it.

Witness: `.lake/packages/TauCeti` at `358314d4`: `ls TauCeti/Algebra/Polynomial` lists `AlgebraMap.lean … Thom.lean`, no `Homogenize.lean`; `ls TauCeti/Data/ZMod` lists `BinaryQuadraticForm.lean … ValMinAbs.lean`, no `OrderOf.lean`.

Repair: remove the commit-hash link and the two citations. For the bounds, cite Mathlib at the pin instead: `Polynomial.eval_homogenize` (`Mathlib/Algebra/Polynomial/Homogenize.lean` line 227; over a semifield, `p.natDegree ≤ n`, `x 1 ≠ 0`: `eval x (p.homogenize n) = p.eval (x 0 / x 1) * x 1 ^ n`) applied over ℝ with `x = ![a, b]`, which gives `Φ_n(a,b) = b^φ(n) · Φ_n(a/b)` and lets `Polynomial.sub_one_pow_totient_lt_cyclotomic_eval`, `cyclotomic_eval_lt_add_one_pow_totient` and `cyclotomic_eval_le_add_one_pow_totient` (`Cyclotomic/Eval.lean` lines 170, 222, 285) transport directly; the root-product form is then not needed. For order comparisons cite Mathlib's `ZMod.orderOf_dvd_card_sub_one` (`FieldTheory/Finite/Basic.lean` line 625) and `orderOf_dvd_iff_pow_eq_one`, and state any further lemma (order of `a/b` as a natural cast, order under `ZMod p → ZMod q` transport) as a P1 target of this roadmap. If a later Tau Ceti pin supplies the two files, the citation can return then, by declaration name and without a commit hash.

## R03 (P3) — README is not in TauCetiRoadmap form

Location: `README.md` throughout: headings `## Starting points and ownership`, `## Milestones` (a table), `### P0`–`### P3`, `## Checks`, `## References and provenance`.

Claim: the shape the repository's README section prescribes is missing in every part: no opening `**Summary.**` paragraph; no `## Scope and ownership` (ownership is mixed into a section that is mostly process); no `## Conventions` content beyond the main-theorem hypotheses (universe/coefficient conventions for `homogeneousCyclotomic` are there, but under P0); no `## Exact supplier contracts` (the Mathlib declarations consumed are scattered as names in prose: `padicValNat.pow_sub_pow`, `pow_two_sub_pow`, `isRoot_cyclotomic_prime_pow_mul_iff_of_charP`, `orderOf_dvd_iff_pow_eq_one`, `MulEquiv.orderOf_eq`, all of which do exist at the pin); no `## How to read the build`; layers are `### P0`–`### P3` under a milestone table rather than `## Layer k:` with `### k.n` subsections; no `*Needs:*` line on any target; the one definition (`homogeneousCyclotomic`) has no API bullet list and no `**Checks.**` list (the global `## Checks` lists eight instances of the main theorem, none about the definition); no `### Examples` or `### Dependencies` per layer; no `## Downstream consumers` (the Summary names finite-group orders as the application, but no roadmap is named); references under a non-standard heading.

Witness: compare `TauCetiRoadmap/AbhyankarLemma/README.md` on main (headings at lines 37, 105, 130–132, 149 `*Needs:*`, 153 `**Checks.**`, 455 `## References`).

Repair: rewrite in that shape. Keep the four layers (P0 → Layer 0 "homogeneous cyclotomic arithmetic", P1 → Layer 1, P2 → Layer 2, P3 → Layer 3) and the existing statements; add a `*Needs:*` line per target; give `homogeneousCyclotomic` its API bullets and at least three Checks that pin the convention, for instance: `Φ_1(5,2) = 3` and `Φ_1(2,5) = −3` (variable 0 is the base `a`; the swapped model gives `−3`), `Φ_2(5,2) = 7`, `Φ_0(5,2) = 1`, `Φ_6(2,1) = 3` (the exceptional value) — all four of the first group elaborate by `simp` at the pin from `homogenize_X`, `homogenize_one`, `homogenize_sub`, `cyclotomic_one`. Add Checks for the valuation formulas (the instances in the table below are ready to use). Name the downstream consumers (whichever roadmap consumes the order criteria; if none exists yet, say so in one sentence).

## R04 (P3) — No target carries a locator; the two primary sources have no page numbers

Location: `README.md` lines 74–164 (every target of P0–P3) and lines 177–180 (Zsigmondy 1892 and Bang 1886 listed with volume and page range only).

Claim: the house rule is "every theorem its exact hypotheses and a locator". Not one of the roughly twenty-five stated results (positivity, the product formula, the expansion identities, the three evaluation bounds, the order criterion, the nonprimitive-divisor description, the valuation formulas, the lifting-the-exponent cases, the `Φ_n > P(n)` estimate, the exceptions and their converses, the exponent-one case, the order-`2n` corollary) is tied to a theorem number or page of any source. The seeded sample of fifteen locators is therefore empty: there was nothing to sample.

Witness: `grep -n "Thm\|Theorem\|Satz\|§\|p\. " README.md` returns only the two reference lines.

Repair: attach a locator to each claim. Zsigmondy 1892 is paywalled (Springer; cite by DOI and page, recorded as uncertified) and no legal copy of Bang 1886 was found, so a readable secondary source with theorem numbers is needed for the proof plan: Birkhoff–Vandiver 1904 (Annals of Mathematics (2) 5, the standard elementary proof of the general two-variable theorem) or Roitman 1997 (Proc. AMS 125, "On Zsigmondy primes", whose exact-exception statement is the one the README states), and for the valuation and lifting-the-exponent facts a textbook (for instance Ribenboim, "The New Book of Prime Number Records"). Whatever is chosen, record it in `sources.toml` and cite by theorem and page at each claim.

## R05 (P3) — Process text, a pull-request number and a phantom declaration name

Location: `README.md` line 10–11 ("Suggested home: …"), lines 28–36 ("[Mathlib PR #28895](…) contains a full two-variable development, including a homogenized `cyclotomic₂` and `Nat.exists_prime_orderOf_div_eq`; it closed without merging. … [Zulip discussion](…) … Coordinate with its author before adapting code, following the repository's porting guidance."), lines 181–186 (Mathlib PR and two GitHub links into Axiom's CFSG Lean files listed as references).

Claim: the gate's `prnum` rule fails on line 28, and the surrounding paragraph is process narrative (a closed pull request, a chat thread, an instruction to coordinate with a person), which the house style excludes. The backticked `Nat.exists_prime_orderOf_div_eq` names a declaration that exists nowhere at the pins (the worker's citation check and my grep of Mathlib and Tau Ceti both return nothing); it is the closed pull request's name, not a library name. Links into another project's Lean source files are not mathematical sources, and the README itself says they are secondary.

Witness: gate line "prnum (1): line 28"; `grep -rn exists_prime_orderOf_div_eq .lake/packages` returns nothing.

Repair: delete lines 28–36 and the two reference bullets at 181–186 (lines 183–186 can become one timeless sentence in Scope, without links or numbers: "earlier formalisations prove the base-two and base-at-least-three specialisations; this roadmap states the general coprime two-variable theorem"). Drop `Nat.exists_prime_orderOf_div_eq`. The "Suggested home" lines are harmless but not house form; move the intended module path into Scope or drop it.

## R06 (P3) — `Suggested.lean` docstring and declaration docstrings are not in house form

Location: `Suggested.lean` lines 6–12 ("Primitive prime divisors: suggested interfaces … not exhaustive … suggested forms for selected targets, not a complete checklist"); lines 20–58 (ten `sorry`'d theorems, none with a docstring).

Claim: the module docstring must be "<title>: target signatures", say that the roadmap is `README.md`, that the file states the roadmap's headline theorems against the pinned APIs, and name which headlines are not statable at the pins (here: none; everything is statable). Every declaration needs a docstring stating the mathematics; only the definition has one.

Repair: rewrite the module docstring in that form and add a one-sentence docstring per declaration (for the two Zsigmondy statements, name the two exceptional cases and the source).

## R07 (P3) — Declarations that are API, not headline theorems

Location: `Suggested.lean` lines 16–27 (`homogeneousCyclotomic`, `homogeneousCyclotomic_pos`, `pow_sub_pow_eq_prod`, `sub_pow_totient_lt`) and lines 29–31, 53–58 (`pow_eq_neg_one_iff`, `dvd_pow_sub_one_iff`, `dvd_pow_add_one_iff`).

Claim: `Suggested.lean` is the acceptance test, with definitions only where a headline needs them. The headline theorems here are `exists_prime_dvd_pow_sub_pow`, `exists_prime_dvd_pow_sub_pow_iff`, `exists_prime_orderOf_eq` and `exists_prime_orderOf_two_eq`, all stated on ℕ and `ZMod p`; none mentions `homogeneousCyclotomic`. The definition and its three lemmas are the roadmap's P0 API (positivity, the homogenised form of Mathlib's `prod_cyclotomic_eq_X_pow_sub_one`, the homogenised form of Mathlib's `sub_one_pow_totient_lt_cyclotomic_eval`). The three order lemmas are elementary API a few lines from `orderOf_dvd_iff_pow_eq_one` and the `ZMod` cast lemmas. None closes in one tactic (probed: `simp`, `simp [orderOf_dvd_iff_pow_eq_one]`, `simp [← horder]` and `exact?` on each; `dvd_pow_sub_one_iff` reduces under `simp [orderOf_dvd_iff_pow_eq_one]` to `p ∣ q^k − 1 ↔ (q : ZMod p)^k = 1` and stops), so this is a form note, not padding by the one-tactic test.

Repair: delete the seven declarations from `Suggested.lean`; the README keeps each as a target (and then no README API bullet may carry their backticked names). If the author wants one P0 statement as a headline, the only candidate of theorem weight is the valuation description of `Φ_n(a,b)` (P1), which is not in the file at all.

## R08 (P3) — Generality of `pow_sub_pow_eq_prod`; an unused hypothesis

Location: `Suggested.lean` lines 23–24 (`{a b n : ℕ} (hn : 0 < n) : (a : ℤ)^n − (b : ℤ)^n = ∏ d ∈ n.divisors, homogeneousCyclotomic d a b`) and lines 20–21 (`homogeneousCyclotomic_pos … (hb : 0 < b)`).

Claim: the definition takes `a b : ℤ` and the README's P0 states the product formula for the integer evaluation; the Lean statement quantifies over naturals cast to ℤ, narrower than the README and than the truth (the identity holds for all `a b : ℤ`, being the homogenisation of `X^n − 1 = ∏ Φ_d`; `Polynomial.homogenize_mul` at the pin, line 181, is the tool). Separately, `0 < b` is not needed for `homogeneousCyclotomic_pos`: at `b = 0`, `0 < a`, `n ≥ 1` the value is the leading coefficient times `a^φ(n)`, that is `a^φ(n) > 0` (`Φ_1(a,0) = a`, `Φ_2(a,0) = a`), so `b < a` alone suffices.

Repair: state `pow_sub_pow_eq_prod` for `a b : ℤ`; drop `hb` from `homogeneousCyclotomic_pos` or keep it with the README saying positivity is stated under the standing hypotheses.

## Verified sound

**Gate and dependency check.** Gate at f8370a1: `set_option=0 blob=0 latex=0 tex=0 prnum=1 … imports=1 mathlib-subimports=4 no-import-mathlib=1 … depcheck=0 … build=4 FAIL` (R01, R05). Depcheck, run by me on this head against the merge-order candidate (PrimitivePrimeDivisors at line 372 of 372) with `--movable`: `depcheck: 205 roadmaps, 1644 edges, 0 problem(s)`. No UPWARD or CYCLE line. The README has no cross-roadmap citation and no `*Needs:*` line, so the supplier graph of this roadmap is Mathlib only.

**Ownership.** `roadmaps grep -i zsigmondy` over main and the 439 open pull requests at their heads hits only this folder; `primitive prime divisor|Bang.s theorem|homogeneousCyclotomic|cyclotomic₂` likewise (the other hits are "primitive divisor" in the sense of divisors on surfaces). Mathlib and Tau Ceti at the pins contain no Zsigmondy or two-variable cyclotomic material (`grep -rli "zsigmondy\|cyclotomic₂\|primitive prime divisor"` empty). The board's package index lists no related package. This roadmap is the owner.

**Library declarations opened at the pins** (Mathlib `f6090c70`, Tau Ceti `358314d4`), with `#check` in a scratch file under `import Mathlib`:

- `Polynomial.homogenize` (`Mathlib/Algebra/Polynomial/Homogenize.lean` line 38): `∑ kl ∈ antidiagonal n, monomial (0 ↦ kl.1, 1 ↦ kl.2) (p.coeff kl.1)`, so variable 0 carries the coefficient index. Hence `MvPolynomial.eval ![a,b]` gives `Σ cᵢ aⁱ b^{n−i} = b^n·p(a/b)`: the first slot is the base `a`, as the Lean docstring says.
- `Polynomial.eval_homogenize` (line 227), `homogenize_mul` (181), `homogenize_map` (69), `homogenize_X` (99), `homogenize_one` (108), `homogenize_sub` (217).
- `Polynomial.cyclotomic_zero` (`Cyclotomic/Basic.lean` 278), `natDegree_cyclotomic` (316), `prod_cyclotomic_eq_X_pow_sub_one` (337), `cyclotomic_expand_eq_cyclotomic` and `…_mul` (`Cyclotomic/Expand.lean` 87, 38: `expand p (cyclotomic n) = cyclotomic (n*p)` for `p ∣ n`, `= cyclotomic (n*p) * cyclotomic n` otherwise, matching README lines 89–91), `isRoot_cyclotomic_prime_pow_mul_iff_of_charP` (170).
- `Polynomial.sub_one_pow_totient_lt_cyclotomic_eval` (`Cyclotomic/Eval.lean` 170: `2 ≤ n`, `1 < q`), `cyclotomic_eval_lt_add_one_pow_totient` (222: `3 ≤ n`), `cyclotomic_eval_le_add_one_pow_totient` (285: all `n`), matching the three bounds of README lines 92–94.
- `padicValNat.pow_sub_pow` (`NumberTheory/Multiplicity.lean` 375: `Odd p`, `y < x`, `p ∣ x − y`, `¬p ∣ x`, `n ≠ 0`), `padicValNat.pow_two_sub_pow` (346: `v₂(xⁿ−yⁿ) + 1 = v₂(x+y) + v₂(x−y) + v₂(n)` for even `n`), matching README lines 107–114.
- `orderOf_dvd_iff_pow_eq_one` (`GroupTheory/OrderOfElement.lean` 276), `MulEquiv.orderOf_eq` (376), `ZMod.orderOf_dvd_card_sub_one` (`FieldTheory/Finite/Basic.lean` 625).

**Signatures.** The worker's `signatures.md` lists the elaborated type of each of the 11 declarations with no dropped binder; I compared each with its README statement. All agree in hypotheses and generality except R08. In particular `pow_eq_neg_one_iff` carries `[CommRing K] [IsDomain K]` explicitly, and the two `ZMod` lemmas carry `[Fact p.Prime]`.

**Convention witnesses computed at the pin** (scratch file, `simp` with `cyclotomic_one`, `cyclotomic_two`, `cyclotomic_zero`, `homogenize_X/one/sub/add`): `Φ_1(5,2) = 3`, `Φ_1(2,5) = −3`, `Φ_2(5,2) = 7`, `Φ_0(5,2) = 1`. The swapped-variable model would give `Φ_1(5,2) = −3`; the Lean docstring and these values exclude it. README line 83 (symmetry for `n ≥ 2`, sign for `n = 1`) agrees.

**One-tactic padding probes** on copies of all ten sorried theorems: `simp`, `simp [homogeneousCyclotomic]`, `simp [orderOf_dvd_iff_pow_eq_one]`, `simp [← horder]`, `exact?`: none closed (`exact?` found only the probe's own copies). No padding by the one-tactic test; R07 is a form note.

**Adversarial table.** Each row gives the instances and the values on each side.

| Statement | Instances tried | Values | Result | Change |
| --- | --- | --- | --- | --- |
| `homogeneousCyclotomic` convention | (n,a,b) = (1,5,2), (1,2,5), (2,5,2), (0,5,2) | 3, −3, 7, 1 (elaborated); swapped model gives −3 at (1,5,2) | first slot is `a`; `n=0` gives 1 | Check requested (R03) |
| `homogeneousCyclotomic_pos` | (2,1,1), (2,1,2), (2,1,6), (3,2,6), (a,0,n) | 1, 3, 3, 9−6+4=7, `a^φ(n)` | all > 0; `0<b` unused | R08 note |
| `pow_sub_pow_eq_prod` | n=1; n=2; (2,1,6); b=0, n=2; a=b; n=0 | a−b=Φ_1; (a−b)(a+b); 63 = 1·3·7·3; a² = a·a; 0=0; n=0 would be 0 ≠ 1 (empty product) | true for n>0, hypothesis needed | generality R08 |
| `sub_pow_totient_lt` | (2,1,2), (2,1,6), (3,2,6), (3,1,3), (2,1,4); n=1 | 1<3, 1<3, 1<7, 4<13, 1<5; n=1: a−b < a−b false | `2 ≤ n` necessary | none |
| `pow_eq_neg_one_iff` | ℤ, u=−1, n=2; ℂ, u=i, n=4, k=2,4,6; char 2; ZMod 8, u=3, n=2, k=1 | k odd ↔ 1∣k∧¬2∣k; i²=−1 ↔ 2∣2∧¬4∣2, i⁴=1 ↔ false, i⁶=−1 ↔ 2∣6∧¬4∣6; char 2: u^{2m}=1 ⇒ (u^m−1)²=0 ⇒ no even order, vacuous; ZMod 8: 3 ≠ 7 but RHS true | `IsDomain` necessary and present | none |
| `exists_prime_dvd_pow_sub_pow` | (3,1,3), (2,1,5), (3,2,6), (4,1,2); excluded (2,1,6), (3,1,2), (5,3,2) | 13 ∣ 26, 2 ∤ 13; 31; 665 = 5·7·19 with 5∣3²−2², 19∣3³−2³, 7 primitive; 15: 5 primitive; 63 = 3²·7, 3∣3, 7∣7; 8 = 2³, 2∣2; 16, 2∣2 | exceptions exact | none |
| `exists_prime_dvd_pow_sub_pow_iff` | (2,1,6), (7,1,2), (3,2,2), (3,1,2) | RHS false, LHS false (3∣3, 7∣7); 48 = 2⁴·3, both divide 6; a+b=5, 5 primitive, both true; a+b=4, 8=2³, 2∣2, both false | iff holds both ways | none |
| n=2 converse (README 55, 58) | a+b=2^k, coprime | a,b odd ⇒ 2∣a−b; primes of a+b are {2}; k≥2 since a+b≥3 | no primitive prime | none |
| `exists_prime_orderOf_eq` | (3,3), (3,4), (3,2) | ord₁₃(3)=3 (27≡1, 3,9≢1); 80=2⁴·5, ord₅(3)=4; a=3,n=2: 8=2³, ord₂(3)=1 ≠ 2 | `3 ≤ n` necessary for a=3 | none |
| `exists_prime_orderOf_two_eq` | n=2,3,4,6 | ord₃(2)=2; ord₇(2)=3; ord₅(2)=4; n=6: 63, ord₃(2)=2, ord₇(2)=3, none of order 6 | `n ≠ 6` necessary | none |
| `dvd_pow_sub_one_iff` | (p,q,k)=(7,2,3),(7,2,2),(3,3,0),(3,3,1),(5,1,k) | 7∣7 ↔ 3∣3; 7∤3 ↔ 3∤2; 3∣0 ↔ 0∣0; 3∤2 ↔ 0∤1 (orderOf 0 = 0); 5∣0 ↔ 1∣k | holds also when p ∣ q | none |
| `dvd_pow_add_one_iff` | (5,2,n=4), k=2,4,6; p=2 | 5∣5 ↔ 2∣2∧¬4∣2; 5∤17 ↔ false; 5∣65 ↔ 2∣6∧¬4∣6; ZMod 2: orders 1 and 0 only, even order impossible, vacuous | correct | none |
| README P1 order criterion (line 99) | p=7, a/b=2: k=3,6,2 | 7∣7, 7∣63, 7∤3; ord=3 | correct | none |
| README P1 lifting the exponent (107–110) | p=2,(3,1): k=1,2,4; p=7,(2,1), d=3: k=6, 21 | v₂=1=v₂(2); v₂(8)=3=3+1−1; v₂(80)=4=3+2−1; v₇(63)=1=1+0; 2²¹−1 = 7²·127·337, v₇=2=1+1 | formulas correct | none |
| README P1 `v_p(Φ_n)` (111–113) | (p,n,a,b)=(2,2,3,1),(2,4,3,1),(3,6,2,1),(7,3,2,1),(3,2,2,1),(5,3,2,1) | v₂(4)=2=v₂(a+b); v₂(10)=1; d=2, Φ_6=3, v₃=1; d=3=n, v₇(7)=1=v₇(2³−1); d=2=n, v₃(3)=1; d=4∤3, v₅(7)=0 | all four clauses correct | none |
| README P1 nonprimitive prime = P(n), valuation 1 (105–106) | (2,1,6): 3; (3,1,4): 2; (2,1,12): Φ_12=13 | 3 = P(6), v₃=1; 2 = P(4), v₂(10)=1; 13 primitive, no nonprimitive | correct | none |
| README P2 `Φ_n > P(n)`, n≥3 (120–123) | (2,1,n) for n=3,4,5,6,10,12,18; (3,2,6) | 7>3, 5>2, 31>5, 3=3 (exception), 11>5, 13>3, 57>3; 7>3 | exception exactly (2,1,6) | none |
| README P2 case e=1, m≥2 (130–133) | (b+1,b), p=3, m=2 | ((b+1)³−b³)/(2b+1) = (3b²+3b+1)/(2b+1) > 3 ⇔ 3b²−3b−2 > 0 ⇔ b ≥ 2; b=1 gives 7/3 | exception p=3, (2,1), m=2 → n=6 | none |
| README P2 case e≥2 (128–129) | (2,1), p^{e−1}=2 | base difference 4−1=3 ≥ 3; Φ_{2^e}: A+B ≥ 5 > 2 | correct | none |
| README P0 expansion identities (89–91) | (2,1): n=2,p=2; n=2,p=3 | Φ_4(2,1)=5=Φ_2(4,1); Φ_6·Φ_2=3·3=9=Φ_2(8,1) | correct | none |
| README P0 upper bounds (93–94) | (2,1,3); n=2; n=1 | 7<9; 3=3 (strictness needs n≥3); a−b ≤ a+b | correct | none |
| README exponent one (59–60); P3 order-2n bullet (152–156) | (3,2), (5,2); (2,1), 2n=6 | a−b=1 none; 3 primitive; 3 ∣ 2³+1 = 9 but ord₃(2)=2 ≠ 6 | the warning "do not infer order 2n from the sum" is witnessed | none |

**Headline theorems.** From the README: Bang–Zsigmondy existence (stated, line 33), its exact-exception iff (line 40), the order corollaries for bases ≥ 3 and 2 (lines 47, 50). All are statable at the pins and stated. The two-variable order form of P3's first bullet (`∃ p, p.Prime ∧ ¬p ∣ a*b ∧ orderOf ((a : ZMod p)/b) = n`) is statable and absent; it is a direct reformulation of the iff through P1's criterion, so I record it as a suggestion rather than a finding.

**Cross-roadmap citations resolved:** none exist. **Gaps declared:** none, and none needed (the roadmap's suppliers are Mathlib only once R02 is repaired).

## Not verifiable

- Zsigmondy 1892 (Monatshefte für Mathematik und Physik 3): the sources service resolves it only to a Springer page (DOI prefix 10.1007, paywalled) and records it `uncertified`. Cited in the README without a page or section, so no locator could be checked anyway.
- Bang 1886 (Tidsskrift for Mathematik (5) 4): the service found no legal source, and a web search found none either (the JSTOR scan was not reached). Same remark on locators.
- The seeded sample of fifteen locators is empty: no target in the README carries one (R04).
- Ownership against open pull requests was checked through the roadmap index (439 pull requests); the board's package index lists none related.

## Source issues

- none
