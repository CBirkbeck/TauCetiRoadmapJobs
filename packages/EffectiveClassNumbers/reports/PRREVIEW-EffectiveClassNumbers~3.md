# Review of EffectiveClassNumbers (pull request #1406 at c4fbe83)

**Verdict:** needs changes

Incremental re-review of the 74 lines changed since 840c5f9 (the head r2 read): the README gains the effective power bound and the polynomial cutoff of §4.8, the effective Siegel bound and the rewritten comparison of §4.9, the AnalyticNumberTheoryPartI §0.34 contract and the [LS26] reference; `Suggested.lean` gains the third conjunct of `effective_cutoff` and the renamed Tau Ceti import. The diff outside the folder against `origin/main` is empty (the files `changes.md` lists outside the folder are the merge of main at 3e4123cd, not the pull request's own changes). The new mathematics is correct at every instance tried below; the four findings are the gate's build failure and three locator or wording defects.

## R01 (P1) — The gate's build step fails: `Suggested.lean` lacks the module-system header the pinned Mathlib expects

**Location:** `TauCetiRoadmap/EffectiveClassNumbers/Suggested.lean:1–3`: "import Mathlib / import TauCeti.NumberTheory.BinaryQuadraticForm.Reduced / import TauCeti.AlgebraicGeometry.EllipticCurve.MordellWeil.PointModTorsion.Basic".

**Claim:** The worker's gate at this head reports `build=2 FAIL`; both lines are Lake's warning that the file imports `Mathlib` from a module-system package without `module`. The merge of main at 3e4123cd moved the pins to Mathlib `1b1ccf4b` and Tau Ceti `2fd255d9`, where every roadmap file needs the header. The declarations themselves elaborate (ten `sorry` warnings, nothing else).

**Witness:** `scratch/gate.md` at this head: "warning: TauCetiRoadmap/EffectiveClassNumbers/Suggested.lean: imports `Mathlib` from package `mathlib`, which is designed for use with the module system; consider adding `module`" (twice). The brief counts every gate failure as a finding and allows no acceptance while the gate fails.

**Repair:** Replace lines 1–3 by

```lean
module

public import Mathlib
public import TauCeti.NumberTheory.BinaryQuadraticForm.Reduced
public import TauCeti.AlgebraicGeometry.EllipticCurve.MordellWeil.PointModTorsion.Basic
```

and insert `@[expose] public section` on its own line between the module docstring and `open Filter MeasureTheory`. Tested: a scratch copy with exactly this header elaborated with `lake env lean` in 12 s, exit 0, with the ten `declaration uses 'sorry'` warnings and no other message, and `#check @` printed all 17 declarations with the binders of `scratch/signatures.md` (so nothing became private). `public section` alone, without `@[expose]`, is also expected to work here since no instance unfolds one of the file's own definitions, but the tested form is the one above.

## R02 (P3) — The [LS26] reference has no locator, is not in the manifest, and the effectivity attributed to it is the supplier's claim, not the source's

**Location:** `TauCetiRoadmap/EffectiveClassNumbers/README.md:1174`: "**[LS26]** OpenAI, *Uniform exclusion of Landau–Siegel zeros*, preprint (2026), open repository. Used: Theorem 1 (the uniform logarithmic zero gap), through AnalyticNumberTheoryPartI §§0.34 and 0.9"; cited at lines 1001 and 1017 as "([LS26], Theorem 1)".

**Claim:** Every other reference gives a link or a journal locator; this one gives neither, and `sources.toml` of the package records no key for it (its eleven keys are O85 … COG04). The text is legally readable: the operator's cache holds the 1 October 2026 PDF from the publisher's own repository, and its Theorem 1 (LS26 line 23–25) states the gap (1 − β) log q ≥ c for an absolute constant c > 0, exactly as line 118 restates it. But the paper claims no effectivity: "effective" occurs in it only in "ineffective constant" about Siegel (line 29), and its §6 proves Theorem 1 by contradiction from a sequence with (1 − β) log q → 0 and an upper limit (lines 444–475). The effectively computable c_LS of line 118, and hence the effective c₀ of §4.8, is AnalyticNumberTheoryPartI §0.34's own contract (its §0.34b–c route with the constants A, C₀, K_C and the threshold), which this roadmap is entitled to consume as stated; the README should not let the reader attribute it to [LS26].

**Witness:** AnalyticNumberTheoryPartI README at its open head, reference [109], gives the locator: repository `openai/math`, file `preprints/Uniform-exclusion-of-Landau-Siegel-zeros-October-1-2026/paper.pdf`, 9 pages, with the note that the numbering is that of the 1 October 2026 version and not of the community revision of 26 October 2026. LS26 line 23: "Theorem 1. There is an absolute constant c > 0 such that every real zero β ∈ (0, 1) of every primitive nonprincipal real Dirichlet L-function of conductor q ≥ 3 satisfies (1.1)".

**Repair:** Either drop the direct [LS26] citations at lines 1001 and 1017 and the reference entry, leaving §0.34 as the cited owner (the supplier carries the source), or complete the entry with the repository and file locator, the 1 October 2026 version, and the phrase "an absolute constant; its effective computability is AnalyticNumberTheoryPartI §0.34's contract", and record the work in `sources.toml` with that locator (the service resolves the `raw.githubusercontent.com` form of the URL with licence class author-page). In the second form, line 1003's "it is effective because that roadmap derives it from the uniform exclusion of Landau–Siegel zeros" is accurate as written and needs no change.

## R03 (P3) — §4.9 writes the class-number value with an undefined `u`

**Location:** `TauCetiRoadmap/EffectiveClassNumbers/README.md:1019`: "Through the class-number value L(1, χ_D) = πh/(u√d) (ImaginaryQuadraticClassNumber H2.2), §4.7 becomes a lower bound".

**Claim:** `u` is not defined in this README: the Conventions (line 42) count roots of unity (6, 4, 2) and §4.8 (line 1003, 1011) writes the formula with w, h = w√d·L(1, χ_D)/(2π); the only `u` the README defines is the η-quotient u(z) = (η(z)/η(37z))² of §2.9 (line 683). The sentence survives from the previous head, but the diff rewrote it and §4.8 now fixes the notation beside it.

**Witness:** ImaginaryQuadraticClassNumber README on main, line 63: h(D) = w_D √|D| L(1, χ_D)/(2π), with w_D the unit order. With w = 2u the two readings agree, but u is never introduced here; AnalyticNumberTheoryPartI's own convention line (its line 42, ω_D = |O_Kˣ|/2) shows the half-count needs a definition where it is used.

**Repair:** Write "L(1, χ_D) = 2πh/(w√d)" at line 1019, matching §4.8; the d = 907 Check at line 1023 (3π/√907 with w = 2) is unchanged.

## R04 (P3) — The four AnalyticNumberTheoryPartI link fragments resolve to nothing at the supplier's head

**Location:** `TauCetiRoadmap/EffectiveClassNumbers/README.md:117–120`: "[§0.9](../AnalyticNumberTheoryPartI/README.md#s0-9)", "[§0.34](../AnalyticNumberTheoryPartI/README.md#s0-34)", "[§0.23a](…#s0-23a)", "[§0.33](…#s0-33)".

**Claim:** The supplier's README at its open head contains no `<a id=` anchor (count 0), so `#s0-9`, `#s0-34`, `#s0-23a` and `#s0-33` land at the top of the file. Lines 117–118 are new or rewritten in this diff; 119–120 are carried. The section citations themselves are correct (§0.9 at its line 302, §0.34 at 805, §0.33 at 795, §0.23a inside §0.23 at 612).

**Witness:** `grep -c '<a id=' ` on the supplier's README at its head returns 0; its headings are `### 0.9 Siegel's theorem`, `### 0.34 Uniform exclusion of Landau–Siegel zeros`, `### 0.33 Zero-free zeta strip and logarithmic bounds`, `### 0.23 Finite-order Hadamard factorization` (with §0.23a a bold sub-target inside it).

**Repair:** Use the heading slugs: `#09-siegels-theorem`, `#034-uniform-exclusion-of-landausiegel-zeros`, `#033-zero-free-zeta-strip-and-logarithmic-bounds`, and `#023-finite-order-hadamard-factorization` for §0.23a; or drop the fragments and link the file alone, as the ImaginaryQuadraticClassNumber citation at line 95 does.

## Previous findings

- R01 — repaired: line 123 now reads "This is the rank-two case of R16.0.1's API, that standard and pair factors equal the Weil–Deligne factors, which the scope of R16.0 assigns for the rank-two and rank-three finite-place parameters; R16.0.1's separately stated GL₂×GL₃ comparison is not the instance used here", pointing at the supplier's API line (its line 472, "standard and pair factors equal the WD factors") and scope lines (59–62, "the twisted standard and pair-factor comparisons … for the rank-two and rank-three finite-place parameters") at the open head of GL2AutomorphicRepresentationsAndTransfer; no new problem introduced.

## Verified sound

**The changed passages.** I read every changed line at this head: the Summary and end-theorem paragraph (lines 3 and 5), the scope bullets (lines 18, 23, 26), the Effectivity convention (line 56), the supplier tables (lines 67, 95, 117–118), the R16.0.1 paragraph (line 123), "How to read the build" (line 149), the Layer 4 introduction (line 898), §4.7's first Check (line 995), §4.8 (lines 1001–1013), §4.9 (lines 1017–1025), the Layer 4 Examples and Dependencies (lines 1031, 1036), the reference (line 1174), and in the Lean the import line 3, the docstring lines 13 and 17–21, and `effective_cutoff` (lines 169–184). No process word, pull-request number, LaTeX delimiter or machine path was added; the scanner gate at this head reports every text rule 0 (`gate … OK` without the build field).

**Supplier citations resolved** (AnalyticNumberTheoryPartI is an open pull request adding a new folder, merge-order position 84; ImaginaryQuadraticClassNumber is on main; GL2AutomorphicRepresentationsAndTransfer is open at position 88; this roadmap is at 240). Line numbers are those of each supplier's README at the head read.

| Citation here | Supplier passage | What it states | Agrees? |
|---|---|---|---|
| ANTPI §0.9 `quadratic_LFunction_one_lower_bound` (lines 117, 1001, 1003, 1017) | ANTPI README 302–310; its Suggested.lean 95–99 | effective absolute c > 0 with c/log q ≤ Re L(1, χ) for every primitive, quadratic (`MulChar.IsQuadratic`), nonprincipal χ of conductor q ≥ 3; "no exceptional-zero alternative"; deduced from §0.34 and §0.30a | yes; the Lean hypothesis of `effective_cutoff` is binder-for-binder that theorem's conclusion |
| ANTPI §0.34 `landau_siegel_exclusion` (lines 118, 1005, 1019) | ANTPI README 805–807; Suggested.lean 86–91 | absolute, effectively computable c_LS with (1 − β) log q ≥ c_LS for every real zero β ∈ (0,1), same character class, "the constant includes its threshold" | yes |
| ANTPI §0.9 implies IQCN H2.4's L-bound; the imaginary class-number companion | ANTPI 304, 310, 1330 | "it implies ImaginaryQuadraticClassNumber H2.4's `quadratic_LFunction_siegel`"; the §0.9 Check says the class-number formula "gives h(D) ≥ c√|D|/log|D| effectively"; §2.13: "The imaginary quadratic companion h(D) ≥ c_ε|D|^(1/2−ε) is ImaginaryQuadraticClassNumber H2.4's `imaginary_classNumber_lower_bound` and is not restated" | yes: no section of ANTPI states the imaginary class-number power bound as a target, so §§4.8–4.9 here are its single owner (ANTPI's downstream paragraph, line 3188, says the effective forms of H2.3–H2.4 "are stated here (§§0.1, 0.6, 0.9, 0.18, 0.32)", but none of those sections states a class-number bound; that loose sentence is the supplier's to tighten) |
| IQCN H2.1 χ_D primitive of conductor |D|, χ_D ≠ 1 (lines 1003, 1005) | IQCN README 53–55 | "the native primitive quadratic Dirichlet character of conductor |D|", NeZero instance, χ_D ≠ 1 | yes |
| IQCN H2.2 h(D) = w_D√|D|L(1,χ_D)/(2π) with w = 6, 4, 2 (lines 1003, 1011) | IQCN README 57–63, 31 | the formula at line 63; six, four and two units at line 31 | yes |
| IQCN H2.4 `quadratic_LFunction_siegel`, `imaginary_classNumber_lower_bound` (lines 95, 1019) | IQCN Suggested.lean 56–68 | ∃ c > 0, c·q^(−ε) ≤ Re L(1,χ) over the same character class without the q ≥ 3 threshold; ∃ c > 0, c·|disc L|^(1/2−ε) ≤ h_L for totally complex quadratic L | yes; the effective Siegel bound of §4.9 is the second with c = eηc₀/π |
| Mathlib `MulChar.IsQuadratic` (line 1003) | `Mathlib/NumberTheory/MulChar/Basic.lean:443` at pin 1b1ccf4b | values in {0, 1, −1}; for a character this is χ² = 1 as the README says | yes |
| Mathlib `DirichletCharacter.IsPrimitive` (Lean line 180) | `Mathlib/NumberTheory/DirichletCharacter/Basic.lean:291` | `conductor χ = n` | yes |
| Tau Ceti import line 3 | `.lake/packages/TauCeti/TauCeti/AlgebraicGeometry/EllipticCurve/MordellWeil/PointModTorsion/Basic.lean` at pin 2fd255d9 | exists (the old module name without `.Basic` is gone at this pin) | yes |

**Gate and dependency check.** Worker's gate at this head: every text rule 0, `build=2 FAIL` (R01). My runs:

```text
depcheck: 239 roadmaps, 2363 edges, 0 problem(s)
gate EffectiveClassNumbers: set_option=0 blob=0 latex=0 tex=0 prnum=0 sorry-data=0 sorry-examples=0 residue=0 private-paths=0 imports=0 mathlib-subimports=0 no-import-mathlib=0 lean-lines=0 statement-hygiene=0 forbidden=0 dropped=0 readme-ids-missing=0 empty-sections=0 round-labels=0 long-fences=0 layer-ids=0 target-ids=0 depcheck=0 metadata=0 stray-files=0 dirty=0 outside-folder=0 source-material=0 OK
```

No UPWARD or CYCLE line; no `moved:` line. The new edges (ANTPI §0.34, IQCN H2.1) point to positions 84 and main.

**Elaboration.** One elaboration, of a scratch copy of `Suggested.lean` with the R01 header and seventeen `#check @` lines appended: exit 0 in 12 s, ten `declaration uses 'sorry'` warnings (the ten theorems), no other output; the printed type of `effective_cutoff` is the one in `scratch/signatures.md`, with the third conjunct quantifying `c₀`, then `q`, `[NeZero q]`, `χ`, `3 ≤ q`, `χ.IsPrimitive`, `MulChar.IsQuadratic χ`, `χ ≠ 1`. No section binder is lost (the theorem takes `K`, `[Field K]`, `[NumberField K]`, `hdeg`, `hneg`, `H`, `hH` explicitly). The padding probe is moot for the one changed declaration: a three-conjunct theorem whose third part needs the class-number formula, the conductor of χ_D and the monotonicity argument closes with no single tactic; the other sixteen declarations are byte-identical to the ones r1 probed.

**Headline inventory.** The README's end theorems (line 5) are §1.8, §§2.12–2.13, §§3.6–3.7, §4.7, the §4.8 cutoffs and §5.8: ten statable headlines are in the file, the two unstatable ones (§2.8, §2.11) and §3.1 are named in the docstring, unchanged from r1. The new cutoff is stated with c₀ as a parameter and its defining inequality as hypothesis, which the docstring explains (lines 17–21); that is the honest form, since the supplier's bound is a roadmap target and not a declaration at the pins, and no stand-in replaces it. The effective power bound and the effective Siegel bound of §§4.8–4.9 are prose theorems on the way to the cutoff, not listed end theorems; the cutoff's third conjunct carries their content.

**Declared gap.** `gap:fundamental-reduced-forms-primitive` (supplier ImaginaryQuadraticClassNumber H1.3) is untouched by the diff; the plan's slug and the README's paragraph (line 97) still match.

**Seeded sample.** Of the fifteen sampled targets only 4.9 falls in the changed passages. Its references: G77 §1, p. 219 (cache page 2, lines 27–47): Siegel's H > c(ε)d^(1/2−ε) with an ineffectively computable constant, the expectation H ≫ √d/log d through the Siegel-zero relation, and Stark–Baker's effective class-number-one and -two results on p. 220; O85 Introduction, pp. 309–310 (cache page 2, lines 26–52): Siegel's theorem is not effective and does not solve the class number h problem; Tatuzawa's at-most-one exception; Buell's tables with the largest d = 907 for h = 3. Both support the comparison as rewritten. ImaginaryQuadraticClassNumber H2.2 and H2.4 and AnalyticNumberTheoryPartI §§0.9, 0.34 are resolved in the table above; [LS26] Theorem 1 is read at cache line 23–25 (R02). The other fourteen sampled targets are untouched by the diff and r1's locator table covers them.

### Adversarial table

New rows carry computed values for every changed statement; rows marked (r2) or (r1) carry the previous reports' values for untouched statements.

| Statement | Instances tried | Values computed on the two sides | Result; change |
|---|---|---|---|
| §4.8 power bound h ≥ (c₀/π)√d/log d from h = w√d·L/(2π), w ≥ 2, L ≥ c₀/log d | D = −3 (w = 6, h = 1); D = −4 (w = 4, h = 1); D = −907 (w = 2, h = 3) | √3·L(1,χ₋₃)/π = √3·0.6046/π = 0.3333 ≤ 1; 2·(π/4)/π = 0.5 ≤ 1; √907·0.3130/π = 3.000 = h (w = 2 is the equality case) | keep; the w ≥ 2 Check (line 1011) is right |
| c₀ ≤ L(1,χ₋₃)·log 3 = π log 3/(3√3) < 2/3 | hypothesis at q = 3 | π/(3√3) = 0.60460; × log 3 = 1.09861 gives 0.66422 < 0.66667 | keep (tight by 0.0025) |
| Cutoff: x = √d ≤ a log x, a = 2πH/c₀, gives x ≤ 2a log a | a > 3π = 9.42 > e; x₀ = 2a log a | x₀/log x₀ > a ⟺ 2 log a > log 2 + log a + log log a ⟺ a > 2 log a; a − 2 log a has minimum 2 − 2 log 2 = 0.614 > 0 at a = 2; x/log x increasing on [e, ∞), and x < e ≤ x₀ otherwise | keep; d ≤ (4πH/c₀)² log²(2πH/c₀) follows by squaring |
| Polynomial form d ≤ C H² log²(2H), C = (4π/c₀)²(1 + log(π/c₀)/log 2)² | H ≥ 1 | log(2πH/c₀) = log 2H + log(π/c₀) ≤ log 2H·(1 + log(π/c₀)/log 2) ⟺ log 2 ≤ log 2H ⟺ H ≥ 1, using log(π/c₀) > 0 from c₀ < 2/3 | keep |
| Check: c₀ = 10, H = 1 | (4π/10)²·log²(2π/10) | 1.5791 × (−0.4647)² = 1.5791 × 0.2160 = 0.341 < 163 | keep; the hypothesis excludes c₀ = 10 (0.664 bound) |
| Check: H = 1, c₀ = π log 3/(3√3) | (4π/c₀)²·log²(2π/c₀) | 18.919² = 357.9; log 9.4596 = 2.2470, squared 5.049; product 1807 ≈ 1.8·10³ > 163 | keep |
| §4.9 effective Siegel h ≥ (eηc₀/π)d^(1/2−η) | log d ≤ d^η/(eη): maximum of log x/x^η at x = e^(1/η) equals 1/(eη) | h ≥ (c₀/π)√d·eη/d^η | keep |
| Check: η = 1/2 | ec₀/(2π) with c₀ < 2/3 | 2.71828·0.66667/6.28319 = 0.2885 < 0.29 | keep |
| Check: d = 907, h = 3 | (c₀/π)√907/log 907 | 30.116/6.8101 = 4.4223; /π = 1.4077 ≈ 1.41; 1.41·c₀ < 0.94 < 3; L(1,χ₋₉₀₇) = 3π/√907 = 0.3130 | keep |
| Lean third conjunct: generality and vacuity | hypothesis class vs ANTPI's theorem; satisfiability | binders identical to `quadratic_LFunction_one_lower_bound` (q ≥ 3, primitive, quadratic, ≠ 1, real part); the hypothesis is satisfiable exactly when a uniform L(1,χ) ≫ 1/log q holds, i.e. given §0.34; the implication itself uses the hypothesis only at q = 3 and q = d, so the theorem is unconditional and nonvacuous under the supplier's contract | keep |
| Lean third conjunct: H = 0, d small | `hH : classNumber K = H` with H = 0 | impossible (`NumberField.classNumber_pos`), so a > 3π always; d ≥ 3 gives log d > 0 and no division by zero in √d/log d | keep |
| §4.7 Check (line 995) "uses neither the exclusion nor any lower bound for L(1,χ)" | route of §4.7 | §3.6 and §§4.2–4.6 only (prime products, genus bound t ≤ 1 + log₂ h) | keep |
| R16.0.1 contract formula, kernel of tensor monodromy | split multiplicative p = 5 | factor 125/96 at u = 1; standard L(s,St×St) agrees | keep (r2) |
| Self-pair = ζ_p(u)L_p(Sym² f,u+1) at a good prime | p = 5, a_p = 0, u = 1 | 625/576 both sides | keep (r2) |
| Ramified quadratic twist correction | p = 5 | R_p = 25/36 ≠ 1 | keep (r2) |
| 2.3 parity adapter; twist conductor | reflection signs; E₁₃₉ | orders 0, 2 vs 1, 3; 37·139² = 714877 | keep (r1) |
| 3.1 simple-zero derivative; Gamma strip growth | ζ(2s−1) at s = 1; σ = 1 vs 2 | Ψ′(1) = 2L(Sym²,2)/∏R_p(1); √(1+t²) | keep (r1) |
| 3.3 restored factor at 139 | B = (1+262X²+19321X⁴)⁻¹ | B′/B at 1 ≈ 0.1330372874 | keep (r1) |
| 3.6, 3.7 headlines | d = 3, 4, 23, 139, 907 | θ log d = 1.0986, 1.3863, 3.1355, 4.9345, 6.8101 against 7000h and 55h | keep (r1) |
| 0.6 norm/form identity; 0.7 integrated headline | q = (2,1,3); d = 4, A = 2; d = 23, A = 12 | norms 4, 6 over ideal norm 2; 1 vs 2.3562; 20 vs 45.2815 | keep (r1) |
| 1.3 kernel values; 1.8 technical headline | (0,2,1/2), (1,2,1/2); d = 23, h = 3 | log 2, 2 log 2; C ≥ 1.0452 | keep (r1) |
| 2.4 height matrices; 2.10 CM value; 2.12–2.13 rank three | 3×3 determinants; λ = (3+√−139)/2; L‴/6 | 0.41715, 15.3649; λλ̄ = 37; 18.4294, 1.7318 | keep (r1) |
| 4.4 prime sums; 4.5 constant asymptotic; 4.7–4.8 first two cutoffs | n = 5, 100, 10000; r → 0; d = 907, q = 1/2, H = 1 | S_n = 2.4111, 10.1657, 71.3257; coefficient 4; κ√log 907 ≈ 3.2·10⁻⁹¹ < 3; exp(2⁶⁰⁴) < 2^(2⁶⁰⁵) | keep (r1) |
| 5.1 prime discriminant; 5.2 Hardy normalization; 5.3 three zeros | h = 3; χ₋₃, t = 0; k = 17923, 115147, 123204 | 2^(t−1) | 3 forces t = 1; Z(0) ≈ 0.480868; three sign changes | keep (r1) |
| 5.4 Montgomery–Weinberger headline; 5.6 chain; 5.8 iff | cut points 10⁵², 10¹², 10²⁵⁰⁰; thresholds 43, 67, 163; fundamental d ≤ 907 | closed ranges meet; 4·163³ = 17322988 < 51599563; sixteen discriminants | keep (r1) |

**Duplication and ownership.** The objects added are the effective power bound, the effective Siegel bound and the polynomial cutoff for imaginary quadratic class numbers. By object, at the pins: Mathlib has no lower bound for `DirichletCharacter.LFunction χ 1` and Tau Ceti none for `NumberField.classNumber` of a quadratic field (grep of both trees for files mentioning `classNumber` together with `Real.log` or `rpow`: none in Mathlib; in Tau Ceti only `NumberTheory/NumberField/WorkedExamples/Sqrt5/DedekindZeta.lean`, the ℚ(√5) residue 2 log φ/√5 with class number one, not a bound). On main, ImaginaryQuadraticClassNumber H2.4 states the ineffective power bound; among the open pull requests the closest in vocabulary (`overlaps.md`: AnalyticNumberTheoryPartI #1126, ImaginaryQuadraticClassNumber #1914, GrossZagierAndArithmeticHeights #1487, ComputationalNumberTheory #1408, AnalyticNumberTheoryPartII #1167) only AnalyticNumberTheoryPartI touches it, and its §2.13 leaves the imaginary companion un-restated (table above). #1914 revises an existing roadmap and is not a dependency; this README cites ImaginaryQuadraticClassNumber as it is on main. `overlaps.md` lists no dropped id, no conflicting head and no id only a revision defines. Ownership against the open pull requests was checked through the brief's sibling checkouts and the `roadmaps grep` index; no `Suggested.lean` of a readable roadmap declares a name this file declares.

**Not a finding, recorded.** The effectivity of c₀ in the prose of §§4.8–4.9 and the Summary rests on AnalyticNumberTheoryPartI §0.34's effectively computable c_LS, a stated supplier contract that this review checks for precision, not for truth; the Lean statement does not depend on it (c₀ is a parameter). R02 asks only that the reference not attribute the effectivity to the published source.

## Not verifiable

- **O88** is recorded as waived; cited by locator only, as before.
- **The effective computability of c_LS** is a claim of AnalyticNumberTheoryPartI §0.34 (an open roadmap target); the published [LS26] Theorem 1 asserts an absolute constant and its §6 argues by contradiction (LS26 lines 444–475), so the source alone does not certify it. Whether §0.34's quantitative route delivers it is for that roadmap's review.
- **The GL₂×GL₂ pair-factor compatibility** remains a target of an open supplier roadmap, as in r2.

## Source issues

- none new this round; the three items of r1 (O85 §2.1 reflection misprint, O85 §§4.2–4.3 restored-factor error, GZ83 Rankin L-series error corrected in GZ86 I §5) stand.
