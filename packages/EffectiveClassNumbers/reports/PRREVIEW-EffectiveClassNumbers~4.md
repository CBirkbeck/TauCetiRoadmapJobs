# Review of EffectiveClassNumbers (pull request #1406 at 0ad24b4)

**Verdict:** needs changes

This is an incremental re-review of the 22 lines changed since c4fbe83. All four findings of the previous report are repaired, and the repairs introduce nothing new. The gate passes at this head, including the build. Two P3 citation defects remain, both in passages this diff does not touch, and both predate it. The first came from the citation tool's lead for this round (`scratch/citations.md`). The second came from a sweep of every backticked name in the README that I ran because of that lead. Neither affects `Suggested.lean`.

## R01 (P3) — §0.1 cites a Tau Ceti predicate that is not at the pin, and restates a pinned theorem as a target

**Location:** `TauCetiRoadmap/EffectiveClassNumbers/README.md:173`: "disc K satisfies both `TauCeti.Multiquadratic.IsFundamentalDiscriminant` and `Int.IsFundamentalDiscr`, and is different from 1. … pass from its integer predicate to Mathlib's by ImaginaryQuadraticClassNumber H2.1's predicate comparison". The same name occurs at lines 34, 81, 854 and 860. Line 173's *Needs:* cites `isFundamentalDiscriminant_fundamentalDiscriminant`. Line 13 claims this field-level theorem for this roadmap.

**Claim:** At the Tau Ceti pin 2fd255d9 neither name exists. Tau Ceti now uses Mathlib's `Int.IsFundamentalDiscr` directly, and it already proves the target:

- `TauCeti.Multiquadratic.isFundamentalDiscr_discr` (`TauCeti/NumberTheory/Multiquadratic/Quadratic/Discriminant.lean:65`): for every number field K with `Module.finrank ℚ K = 2`, `Int.IsFundamentalDiscr (NumberField.discr K)`.
- `NumberField.abs_discr_gt_two` (`Mathlib/NumberTheory/NumberField/Discriminant/Basic.lean:275`) gives 2 < |disc K| when the degree is above 1, so disc K ≠ 1.

So the "field-discriminant comparison" is a pinned theorem plus a pinned inequality. There is only one predicate at the pin, so the step through ImaginaryQuadraticClassNumber H2.1's predicate comparison is empty. The Checks at lines 184 and 860 test a predicate that does not exist. The names were valid at an earlier pin: earlier red-team reports elaborated `TauCeti.Multiquadratic.IsFundamentalDiscriminant`. The pin bump merged at 3e4123cd removed them.

**Witness:** a grep of `TauCeti/` at the pin for `IsFundamentalDiscriminant` and `isFundamentalDiscriminant_fundamentalDiscriminant` finds 0 declarations. `TauCeti/NumberTheory/Multiquadratic/FundamentalDiscriminant/OfSquarefree.lean:95` has `isFundamentalDiscr_fundamentalDiscriminant (hd : Squarefree d) : Int.IsFundamentalDiscr (fundamentalDiscriminant d)`.

**Repair:**

- **Line 173.** Rewrite the paragraph as consumption, not a target: "**The discriminant is fundamental.** For a degree-two number field K, disc K satisfies Mathlib's `Int.IsFundamentalDiscr` by Tau Ceti `TauCeti.Multiquadratic.isFundamentalDiscr_discr`, and disc K ≠ 1 by Mathlib `NumberField.abs_discr_gt_two`; together these are the field-discriminant comparison used below." Drop H2.1's predicate comparison from the route and from *Needs:*. This keeps the later citations of "the field-discriminant comparison of §0.1" valid (lines 177, 856, 1141).
- **Line 13.** Move the field-level theorem from what this roadmap owns to what it consumes, citing `TauCeti.Multiquadratic.isFundamentalDiscr_discr`.
- **Lines 34 and 81.** Replace `TauCeti.Multiquadratic.IsFundamentalDiscriminant` with `Int.IsFundamentalDiscr`. Add `TauCeti.Multiquadratic.isFundamentalDiscr_discr` and `TauCeti.Multiquadratic.isFundamentalDiscr_fundamentalDiscriminant` to the line-81 row.
- **Line 184.** Change "fail both fundamental-discriminant predicates" to "fail `Int.IsFundamentalDiscr`".
- **Lines 854 and 860.** Use `Int.IsFundamentalDiscr`. It is decidable through Tau Ceti's `Int.decidablePredIsFundamentalDiscr` (`TauCeti/NumberTheory/FundamentalDiscriminant.lean:34`).

**Tested on the refuting instances** (Mathlib's predicate, `Mathlib/NumberTheory/FundamentalDiscriminant.lean:41`):

| D | Value of `Int.IsFundamentalDiscr D` | Why |
|---|---|---|
| −5077 | false | −5077 = 4·(−1270) + 3, so D % 4 = 3 and the first conjunct fails (§3.5 and its Check) |
| −243 | false | D % 4 = 1, but 3² divides 243 (line 184 Check) |
| −4 | true | the only x with −4 = 4x is −1, and ¬4 ∣ −1, −1 % 4 = 3 ≠ 1 |
| −3 | true | — |
| 1 | true | excluded by `abs_discr_gt_two` |

So the repaired §0.1 gives exactly the facts §§0.1, 3.5 and 5.7 use.

## R02 (P3) — The R29.4 contract names a declaration that EllipticCurveModularity does not have

**Location:** `TauCetiRoadmap/EffectiveClassNumbers/README.md:144`: "R29.4's coefficient contract is `IsNewformOf.localPolynomial_eq`, `localPolynomial_completion_eq_padic` and `IsNewformOf.coeff_eq`, including multiplicativity and the good/bad prime-power recurrences."

**Claim:** `localPolynomial_completion_eq_padic` occurs in no roadmap except this README: not on main, not at any open head (`roadmaps grep --fixed`), and not at the pins. EllipticCurveModularity is open at merge-order position 166, before this roadmap at 247. At its head, Layer R29.4, subsection "The bad factors and all Dirichlet coefficients" states the needed transport in prose without a name. The transport says that `(E.baseChange (v.adicCompletion ℚ)).localPolynomial (v.adicCompletionIntegers ℚ)` equals `(E.baseChange ℚ_[ℓ]).localPolynomial ℤ_[ℓ]`. Its `Suggested.lean` declares only `IsNewformOf.localPolynomial_eq` and `IsNewformOf.coeff_eq` (`roadmaps show` lines 123 and 129). The contract is real, but the backticked name claims a declaration that does not exist. The name was introduced in 177f6852 and is untouched by this diff.

**Witness:** EllipticCurveModularity README at its open head, `roadmaps show` lines 1396–1399: "Prove the completion-to-p-adic transport here: for E/ℚ elliptic, `v : HeightOneSpectrum (𝓞 ℚ)` and `ℓ = Rat.HeightOneSpectrum.primesEquiv v`, prove" the displayed equality. No name is given.

**Repair:** Replace the middle item with "the completion-to-ℚ_ℓ transport of `localPolynomial` (R29.4, 'The bad factors and all Dirichlet coefficients')". The rest of line 144 stands: minimality and reduction preserved under the completion equivalence is what R29.4 states at its lines 1404–1408. With that wording, every backticked name on line 144 resolves at the supplier head.

## Previous findings

- R01 — repaired: `Suggested.lean` lines 1–5 now read "module / public import Mathlib / public import TauCeti.NumberTheory.BinaryQuadraticForm.Reduced / public import TauCeti.AlgebraicGeometry.EllipticCurve.MordellWeil.PointModTorsion.Basic", and line 39 is `@[expose] public section`. The gate reports build=0.
- R02 — repaired: line 1174 gives repository `openai/math`, the paper's file path, the 1 October 2026 version and 9 pages, "Used: Theorem 1, p. 1", and "the effective computability of that constant is AnalyticNumberTheoryPartI §0.34's contract, not a statement of the paper". The manifest records LS26.
- R03 — repaired: line 1019 reads "Through the class-number value L(1, χ_D) = 2πh/(w√d) (ImaginaryQuadraticClassNumber H2.2), §4.7 becomes a lower bound for L(1, χ_D)". This matches §4.8's w.
- R04 — repaired: lines 117–120 link `#09-siegels-theorem`, `#034-uniform-exclusion-of-landausiegel-zeros`, `#023-finite-order-hadamard-factorization` and `#033-zero-free-zeta-strip-and-logarithmic-bounds`. All four are slugs of the supplier's headings at its head.

## Verified sound

### The changed passages

I read every changed line at this head:

- the four supplier-table rows of the AnalyticNumberTheoryPartI subsection (`README.md:117–120`);
- §4.9's comparison (line 1019);
- the [LS26] reference (line 1174);
- the module header of `Suggested.lean` (lines 1–5 and 39).

No process word, pull-request number, LaTeX delimiter or machine path was added. The diff outside the folder against `origin/main` is empty, and `lake-manifest.json` is unchanged since c4fbe83.

### Repair of R04: link fragments, computed

I computed GitHub heading slugs for all 182 headings of the AnalyticNumberTheoryPartI README at its open head (#1126). The rule: lower-case, drop every character that is not a letter, digit, space, `-` or `_`, then turn spaces into `-`.

| Heading (line in `roadmaps show`) | Slug computed | Fragment at line | Unique? |
|---|---|---|---|
| `### 0.9 Siegel's theorem` (302) | `09-siegels-theorem` | 117 | yes |
| `### 0.34 Uniform exclusion of Landau–Siegel zeros` (805); the en dash is dropped | `034-uniform-exclusion-of-landausiegel-zeros` | 118 | yes |
| `### 0.23 Finite-order Hadamard factorization` (612), which contains **§0.23a** at 626 and runs to 636 | `023-finite-order-hadamard-factorization` | 119 | yes |
| `### 0.33 Zero-free zeta strip and logarithmic bounds` (795) | `033-zero-free-zeta-strip-and-logarithmic-bounds` | 120 | yes |

I also resolved the README's nine other cross-roadmap fragments, none of them changed:

- eight to AutomorphicLFunctionsAndLocalFactors at its head (#924), `#al323…` to `#al542…`: all present;
- one to GL2AutomorphicRepresentationsAndTransfer at its head (#931), `#r1601-the-finite-place-local-langlands-interface`: present.

### Supplier contracts on the changed rows, re-read at AnalyticNumberTheoryPartI's head (line numbers from `roadmaps show`)

- **§0.9 `quadratic_LFunction_one_lower_bound`** (line 303): an effective absolute c > 0 with L(1,χ) ≥ c/log q for every primitive real nonprincipal χ of conductor q ≥ 3. Its Check gives c ≤ (π/(3√3))·log 3. This agrees with line 117 and with §4.8's c₀ < 2/3.
- **§0.34 `landau_siegel_exclusion`** (line 806): an absolute, effectively computable c_LS with (1 − β) log q ≥ c_LS for every real zero β ∈ (0,1), q ≥ 3, with the threshold included. This agrees with line 118.
- **§0.23a** (lines 626 and 633) names `gammaRemainder.slit_logGamma` and `gammaRemainder.stieltjes_integral` with `.compact_domination`. These are two of the citation tool's three leads: they are supplier target names, not pin declarations, and they resolve.
- **§0.33** (line 796): |1/ζ(s)| ≤ C log(|Im s|+2) on the region Z next to Re s = 1. This agrees with line 120.

### Repair of R02: [LS26] at its locator

- The cached text has 9 pages (header line 1; page markers up to `=== page 9 ===`).
- Theorem 1 is on page 1, LS26 lines 23–25: an absolute constant c > 0 with (1−β) log q ≥ c for every real zero in (0,1) of every primitive nonprincipal real L-function of conductor q ≥ 3.
- The paper uses "effective" only in "ineffective constant" about Siegel (LS26 line 29), so the README's new sentence attributes effectivity correctly to §0.34.
- In the package manifest, key `LS26` has locator "Theorem 1, p. 1 (1 October 2026 version)", status `certified`, licence class `author-page`, and a sha256 that matches the cached text. It is cited for 4.8 and 4.9.

### Gate, dependency check and elaboration

My runs at this head:

```text
gate EffectiveClassNumbers: set_option=0 blob=0 latex=0 tex=0 prnum=0 sorry-data=0 sorry-examples=0 residue=0 private-paths=0 imports=0 mathlib-subimports=0 no-import-mathlib=0 lean-lines=0 statement-hygiene=0 forbidden=0 dropped=0 readme-ids-missing=0 empty-sections=0 round-labels=0 long-fences=0 layer-ids=0 target-ids=0 depcheck=0 metadata=0 stray-files=0 dirty=0 outside-folder=0 source-material=0 OK
depcheck: 239 roadmaps, 2426 edges, 0 problem(s)
```

- The worker's gate at this head adds `build=0`.
- The dependency check shows no UPWARD, CYCLE or `moved:` line. In the merge order, AnalyticNumberTheoryPartI is at 90, GL2AutomorphicRepresentationsAndTransfer at 94, EllipticCurveModularity at 166 and this roadmap at 247. ImaginaryQuadraticClassNumber is on main.
- **Elaboration:** a scratch copy of `Suggested.lean` with `#check @` for all 17 declarations ran under `lake env lean`: exit 0 in 7.7 s. It gave ten "declaration uses `sorry`" warnings (the ten theorems at lines 61, 80, 127, 134, 143, 150, 166, 177, 193, 206) and no other message.
- **Signatures:** I compared the 17 elaborated types with `scratch/signatures.md` after normalising whitespace: 17 of 17 are identical. The `module` / `@[expose] public section` header made nothing private and dropped no binder.
- **Header form:** this is the form five roadmaps on main use.
- **Headlines and padding:** no statement changed, so the headline inventory and padding probe of earlier rounds stand. Ten statable headlines are stated. §2.8, §2.11 and §3.1 are named in the docstring as not statable.

### Sweep of backticked names

I ran this sweep because of the citation lead. I extracted the 126 backticked Lean-like names of the README, reduced them to 110 last components, and grepped them as whole words over the pinned Mathlib and Tau Ceti. Twenty were not found at the pins:

- eight are this roadmap's own declarations, all present in `Suggested.lean`;
- `EffectiveClassNumbers` is the namespace;
- four are ImaginaryQuadraticClassNumber's on main (`Suggested.lean` lines 44, 51, 56, 63);
- four are AnalyticNumberTheoryPartI's at its head (§§0.9, 0.34, 0.23a);
- the remaining three are R01's two names and R02's name.

### Declared gap

`gap:fundamental-reduced-forms-primitive` is untouched by the diff. Line 97 of the README proves the primitivity it asks for directly: D/ℓ² must again be 0 or 1 mod 4, which contradicts squarefreeness. So H1.3 is applied to the full pinned set with no further supplier declaration. That is a valid discharge and not a finding.

### Seeded sample

None of the fifteen sampled targets (0.3, 0.5, 1.4, 1.6, 2.4, 2.5, 2.8, 3.2, 3.3, 3.4, 3.7, 4.4, 4.6, 5.2, 5.5) falls in the changed passages. The supplier rows for §3.1 changed only their link fragments, not their contracts. Following the incremental brief, I did not re-read these locators this round. The first review verified 1.4, 2.8, 4.4, 4.6 and 5.2 at their locators (O85 line 275; GZ86 lines 183 and 274; Tau Ceti PrimeIdealTheorem; GZ86 line 340; MW74 line 348).

### Adversarial table

New rows carry values computed this round. Rows marked (r3), (r2) or (r1) carry the values of that report for statements this diff leaves untouched.

| Statement | Instances tried | Values computed on the two sides | Result; change |
|---|---|---|---|
| §4.9 class-number value L(1,χ_D) = 2πh/(w√d) (changed) | D = −3 (h = 1, w = 6); D = −4 (h = 1, w = 4); D = −907 (h = 3, w = 2) | 2π/(6√3) = 0.604600 = π/(3√3); 2π/(4·2) = 0.785398 = π/4; 6π/(2√907) = 0.312945 = 3π/√907 | keep; it agrees with line 1003's h = w√d·L/(2π) and with the d = 907 Check at line 1023 |
| The same with the most plausible wrong model, πh/(w√d) (u read as w) | D = −907, D = −3 | 0.156472 against 0.312945; 0.302300 against 0.604600 (half each time) | the d = 907 Check (≈ 0.313) excludes it; no change |
| Supplier rows 117–120: slugs (changed) | 182 supplier headings; duplicates suffixed `-1`, `-2` | the four slugs above, each at one heading; §0.23a inside 612–636 | keep |
| Row 117 against §0.9 at q = 3 | c ≤ L(1,χ₋₃)·log 3 | 0.604600 × 1.098612 = 0.664216 < 2/3 = 0.666667 | keep |
| [LS26] locator (changed) | page of Theorem 1; page count | page marker 1 at line 4, theorem at lines 23–25; last marker `=== page 9 ===` at line 489 | keep |
| `Suggested.lean` header (changed): elaboration and binders | 17 `#check @` | exit 0; 10 sorry warnings; 17/17 types equal to `signatures.md` | keep |
| R01: §0.1 against `isFundamentalDiscr_discr` + `abs_discr_gt_two` | D = −5077, −243, −4, −3, 1 (Mathlib predicate) | −5077 % 4 = 3 → false; −243 % 4 = 1 but 9 ∣ 243 → false; −4 → true; −3 → true; 1 → true, excluded by 2 < |disc K| | repair as R01 |
| R02: R29.4 transport | name search; supplier prose | 0 hits outside this README; supplier statement at lines 1396–1399 has no name | repair as R02 |
| §4.8 power bound h ≥ (c₀/π)√d/log d | D = −3, −4, −907 | 0.3333 ≤ 1; 0.5 ≤ 1; 3.000 = h | keep (r3) |
| c₀ ≤ π log 3/(3√3) < 2/3 | q = 3 | 0.66422 < 0.66667 | keep (r3) |
| Cutoff x ≤ 2a log a with a = 2πH/c₀; polynomial form for H ≥ 1 | a > 3π; H ≥ 1 | a − 2 log a ≥ 0.614 > 0; log 2 ≤ log 2H | keep (r3) |
| Cutoff Checks | c₀ = 10, H = 1; H = 1, c₀ = π log 3/(3√3) | 0.341 < 163; 1807 > 163 | keep (r3) |
| §4.9 effective Siegel bound; η = 1/2 Check | log d ≤ d^η/(eη); ec₀/(2π) | maximum 1/(eη); 0.2885 < 0.29 | keep (r3) |
| §4.9 Check d = 907 | (c₀/π)√907/log 907 | 1.4077·c₀ < 0.94 < 3 | keep (r3) |
| Lean `effective_cutoff` third conjunct | binders; H = 0 | identical to §0.9's binders; H = 0 is impossible by `classNumber_pos` | keep (r3) |
| R16.0.1 contract formula; self-pair; ramified twist | p = 5 | 125/96; 625/576 on both sides; R_p = 25/36 | keep (r2) |
| 2.3 parity; 3.1 derivative and strip; 3.3 factor at 139 | E₁₃₉; σ = 1, 2; B′/B | 37·139² = 714877; √(1+t²); 0.1330372874 | keep (r1) |
| 3.6, 3.7 headlines | d = 3, 4, 23, 139, 907 | θ log d = 1.0986, 1.3863, 3.1355, 4.9345, 6.8101 | keep (r1) |
| 0.6, 0.7; 1.3, 1.8 | q = (2,1,3); d = 4, 23; kernels | 4, 6 over 2; 1 vs 2.3562, 20 vs 45.2815; log 2, 2 log 2; C ≥ 1.0452 | keep (r1) |
| 2.4, 2.10, 2.12–2.13 | 3×3 height determinants; λ = (3+√−139)/2; L‴/6 | 0.41715, 15.3649; λλ̄ = 37; 18.4294, 1.7318 | keep (r1) |
| 4.4–4.8 | n = 5, 100, 10000; d = 907, q = 1/2 | S_n = 2.4111, 10.1657, 71.3257; κ√log 907 ≈ 3.2·10⁻⁹¹ < 3 | keep (r1) |
| 5.1–5.8 | h = 3; χ₋₃ at t = 0; k = 17923, 115147, 123204; d ≤ 907 | t = 1; Z(0) ≈ 0.480868; three sign changes; sixteen discriminants | keep (r1) |

### Duplication and ownership

The diff adds no object; it changes links, notation, a reference and the module header. `overlaps.md` lists no other open pull request changing this roadmap, no dropped id and no id that only a revision defines. R01 is the one duplication found: a pinned Tau Ceti theorem restated as a target. Ownership against the open pull requests was checked through the brief's sibling checkouts and the `roadmaps grep` index.

## Not verifiable

- **O88** is recorded as waived; it is cited by locator only, as before.
- **The effective computability of c_LS** is AnalyticNumberTheoryPartI §0.34's claim, a target of an open roadmap. The README now attributes it there and not to [LS26].
- **The GL₂×GL₂ pair-factor compatibility** remains a target of an open supplier roadmap, as in r2.

## Source issues

- none
