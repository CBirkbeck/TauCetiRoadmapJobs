# FIX-PKG-MotivicStructuresInModuliOfCurves~5

This round repairs the two findings of `REV-PKG-MotivicStructuresInModuliOfCurves~4` on `packages/MotivicStructuresInModuliOfCurves`. Only `README.md` changed. `Suggested.lean`, `metadata.toml`, `sources.toml` and `design/plan.json` are unchanged, and no gap was added or removed. No section number changed, so no id that another roadmap cites moved.

## F01 (P2) — applied

Changed: six BFP sieve tables (§§8.9–8.11, 8.14; 84 entries) → per section, in prose:
- per-term polynomiality, cited to BFP;
- the `S₀` and unmarked rules;
- one table of quotients `N^•_{n,≤3}/#Aut(Q^•)` (`N^•_{λ,≤3}` in §8.14) at the precision §§8.13 and 9.5 use.

Layer 8 opening reworded.

**Verification.** I put bfp lines 774, 795–806, 876–877, 887–898, 935–937, 949–962, 1461–1474, 1503–1514 and 1537–1548 beside the old tables. The entries, their order and their mixed factored/expanded forms are BFP's. The consumers (§9.5 and its route, §9.9, §8.13) use only the per-type sums over `d ≤ 3`, divided by `#Aut(Q^•)`, at the precisions `o(q^{(9+n)/2})` (`n ≤ 2`) and `B q⁶ + o(q⁶)` (`n = 3`). So the finding holds, and the suggested repair keeps everything the build needs.

**What is stated now.** Section numbers and headings are unchanged, so the `*Needs:*` lines of §§9.5 and 9.9 stand.
- Opening of Layer 8: defines `S_d(C)` and `S₀(C) = #V(𝔽_q)`. The smooth count is `Σ_{d≥0} S_d` when the sieve applies (bfp lines 664–678). Also defines the truncation `N^•_{n,≤3}` and the falling factorial `(x)_n`, with `(x)_0 = 1`.
- §8.9:
  - `S₀(C^con_n) = (q² + q)_n q^{15−n}`.
  - Unmarked: `S₁ = q¹² s₁(X)`; `S₂ = q⁹(s₂(X) − (q + 1)s₂(𝔸¹)) = q¹²`, where the ruling pairs are excluded because a fibre singular at two points of a ruling contains the vertex (bfp lines 782–786); and `S₃ = 0`.
  - Divisibility by `#Aut(Q_con) = q⁴(q − 1)²(q + 1)` in `ℤ[q]`, with the exact quotients `q⁸`, `q⁹ + q⁸ − q⁷`, … .
- §8.10:
  - `S_d(C^nsp_0) = s_d(Q_nsp)p_{15−3d}` and `S₀(C^nsp_n) = (q² + 1)_n p_{15−n}`.
  - The quotients `½(q⁹ − q⁶)`, … , up to `o(q^{(9+n)/2})`, or up to `c q⁶ + o(q⁶)` for `n = 3`.
- §8.11:
  - The same rules with `s_d(Q_spl)` and `((q + 1)²)_n`. Collinear triples on a ruling contribute a multiple of `s₃(ℙ¹) = 0`.
  - The marked terms are polynomial up to `o(q⁶)`.
  - Four quotients.
- §8.14:
  - `S₀(C^•_λ) = m^•_λ e^•_{15−|λ|}`, with the nine configuration counts (ordered conjugate pairs and triples).
  - `S₂(C^nsp_{(3)}) = 0`, with its reason.
  - A 3 × 3 quotient table.
  - The tail bounds.

Every individual term is cited to BFP Propositions 8.1–8.2, 8.4–8.7 and 11.2–11.4 by locator, as the review asked.

**Where this differs from the suggested repair, and why.**
- **Notation.** `N^•_{n,≤3}` replaces the suggested `F^•_n`. The README already uses `F^•` for a filtration (gap contract of HabiroNahmSeries) and `F` for a Casnati–Ekedahl bundle (§6.3). `N^•_n` is §8.6's smooth count, so the truncation reads naturally.
- **Precision for `n = 3` and for the cycle types `(2,1)` and `(3)`.** The review wrote `O(q⁶)`, which is too weak. §9.5 applies WeilConjectures, WC.5, which needs `#M̄_{4,3}(𝔽_q) = P(q) + o(q⁶)` once an unknown coefficient of `q⁶` is absorbed, and an `O(q⁶)` error may oscillate. The statement is therefore `c q⁶ + o(q⁶)` with `c` a constant. This holds because each quotient is a rational function of `q`, plus `o(1)` where BFP truncates. The `q⁶` coefficient merges with `B_•` of §8.13.

**Computed (exact arithmetic over ℚ, Laurent expansion in `q⁻¹`, from the old README entries).**

All 21 quotients agree with the review's tables:
- The four cone quotients and the three twisted cone quotients leave remainder 0.
- The smooth-quadric expansions vanish in the omitted degrees. For example, at `n = 0` the non-split expansion is `½q⁹ − ½q⁶ + ½q + ½ + O(q⁻¹)` and the split one is `½q⁹ − ½q⁶ − ½q − ½ + O(q⁻¹)`; at `n = 1` the non-split coefficient of `q⁵` is 0.

Against the rest of the roadmap and the source:
- **§9.6.** Summing the three quotients and §8.3's `#H_{4,n}` gives §9.6 exactly in degrees `≥ 5`, `≥ 5` and `≥ 6` for `n = 0, 1, 2`. At `n = 3` the difference is `−6q⁶` plus lower terms, which `Σ B_•` absorbs.
- **§§9.2, 9.9.** With §9.2 and the open counts of §9.9 evaluated at a transposition and at a 3-cycle, the difference is zero in degrees `≥ 6` for `(2)`, `(2,1)` and `(3)`.
- **BFP §11.3.** Converting to Schur coefficients reproduces every coefficient BFP prints there for `n = 2` (bfp lines 1576–1581) and `n = 3` (bfp lines 1589–1597) on all three quadrics. This is an independent check of the 21 values.
- **The `S₀` rules.** They reproduce all twelve untwisted `S₀` entries exactly, and the nine twisted ones in degrees `≥ 6` (cone exact).
- **Spot values.** At `q = 2` and `q = 3`, cone `n = 0`: `12288/48 = 256 = 2⁸` and `8503056/1296 = 6561 = 3⁸`. Cone `n = 1` at `q = 3`: `31177872/1296 = 24057 = 3⁹ + 3⁸ − 3⁷`.

**New Checks**, each evaluated:
- §8.9: the `n = 1` factorization `q¹¹(q − 1)²(q + 1)(q² + q − 1)`, and the fact that a single wrong coefficient breaks divisibility.
- §8.10: the unmarked expansion; the wrong marking factor `((q + 1)²)_n`, which shifts the `n = 1` quotient by `q⁹ + q⁸ + ⋯`.
- §8.11: non-split against split at `n = 0`; the `o(1)` determination from `o(q⁶)` data; the `n = 1` regression against §9.6.
- §8.14: the cone and non-split `n = 2` trivial and sign parts, which agree with bfp lines 1576–1579; the `(2)` regression against §9.9.

The three old Checks of each section are kept. The one that mirrored a rule now in the statement (`S_d(C^nsp_0) = s_d p_{15−3d}`) was replaced by a computed one.

**Same pattern elsewhere.** Other tables in the README: §§9.4–9.6 and 9.9 are already in ascending expanded form, with the terms BFP elides written out (the review checked this). The §9.10 table of six alternating traces was in BFP's order and descending form (bfp lines 1629–1634). It is now in ascending powers, with rows ordered by `|λ|` and then lexicographically. I checked that the six polynomials are equal as polynomials (the zero entry is unchanged). No other table exists.

## F02 (P3) — applied

Changed: §12.1 "(§§5.4, 7.7)" → "(§5.4)"; `7.7` deleted from its `*Needs:*` line. New third Check: no genus-seven base pair occurs, the largest genus is six, and the ranges leave exactly the four exceptions.

Verified. Base pairs in degree 13 satisfy `2g ≤ 13` (`n ≤ 1`) or `2g − 2 + n ≤ 13` (`n ≥ 2`), so `g ≤ 6`, with ranges `(1, ≤ 13)`, `(2, ≤ 11)`, `(3, ≤ 9)`, `(4, ≤ 7)`, `(5, ≤ 5)`, `(6, ≤ 3)`. Against `c = 10, 10, 11, 11, 7, 5` of §5.4 they leave `(1, 11)`, `(1, 12)`, `(1, 13)` and `(2, 11)`.

Same pattern elsewhere: the other citations of §7.7 are needed and stay.
- §10.4, degree 14: `(7, 0)`, `(7, 1)`, `(7, 2)`.
- §12.2, degree 15: `(7, n ≤ 3)`.
- §12.7, weight fifteen: `2g ≤ 15` admits `g = 7`.

§12.10 (`k ≤ 17` on `M̄_{3,n}`) cites only §§5.3–5.4. Layer 12's Dependencies still need Layer 7 through §§12.2 and 12.7.

## Checks

- **Elaboration.** `lake env lean packages/MotivicStructuresInModuliOfCurves/Suggested.lean`, run from the content checkout: exit 0, no output. The file is unchanged: `import Mathlib`, the module docstring and an empty namespace.
- **`#check @name` comparison.** `Suggested.lean` declares nothing, so there is no name to check. The `and` listed by the elaborated-signature and library-match tools is the English word in the docstring, not a declaration. No README target changed its Lean counterpart, because none has one.
- **Dependency check.** Run with `--movable`:

  ```text
  depcheck: 245 roadmaps, 2242 edges, 0 problem(s)
  ```

  No UPWARD, CYCLE or `moved:` line.
- **Citations.** `roadmaps resolve` on the README: no cross-roadmap citation and no Lean name found nowhere. No supplier citation was added or changed.
- **Style.** No LaTeX delimiters, process words, pull-request numbers or machine paths in the changed text. Every new formula is in Unicode code spans; tables are Markdown tables.

## Adversarial pass on changed statements

| Statement | Instances tried | Values computed | Result | Change |
| --- | --- | --- | --- | --- |
| `(x)_n` with `(x)_0 = 1` in the `S₀` rules | `n = 0, 1, 2, 3`, all types | `n = 0` gives `q¹⁵`, `p₁₅`, `p₁₅`; cone `n = 3`: `(q²+q)_3 q¹² = q¹⁸+3q¹⁷−5q¹⁵−q¹⁴+2q¹³` (= bfp line 803); split `n = 3`: `(q+1)²(q²+2q)(q²+2q−1)p₁₂` | all 12 untwisted `S₀` reproduced | none |
| §8.9 unmarked rules | `s₁(X) = −q²−q`, `s₂(X) = q³`, `s₃(X) = 0` | `S₁ = −q¹⁴−q¹³`, `S₂ = q¹²`, `S₃ = 0`; sum `/48` at `q = 2`: `256` | agree with bfp line 774 | none |
| §8.9 divisibility | `n = 0…3`, remainder | remainders 0, 0, 0, 0; `n = 1` sum `= q¹¹(q−1)²(q+1)(q²+q−1)` | exact polynomials | none |
| §8.10 unmarked rule | `s_d(Q_nsp)` from `(1−t)(1−qt)(1+qt)(1−q²t)` | `s₁ = −q²−1`, `s₂ = 0`, `s₃ = q⁴+q²` | agrees with bfp line 870 | none |
| §8.10 quotients | `n = 0`: expansion; `q = 3` | `½q⁹−½q⁶+½q+½+O(q⁻¹)`; exact `37917/4 = 9479.25` against `½(3⁹−3⁶) = 9477` plus `½(3+1) = 2` | stated part correct; next term below `q^{9/2}` | none |
| §8.11 unmarked rule | `s_d(Q_spl)` from `(1−t)(1−qt)²(1−q²t)` | `s₁ = −(q+1)²`, `s₂ = 2(q³+q²+q)`, `s₃ = −(q⁴+2q³+q²)` | agrees with bfp line 929 | none |
| §8.11 precision | marked terms up to `o(q⁶)`, divisor degree 6 | quotient error `o(1)`; split `n = 0` remainder `(−3q⁵−3q⁴+q³+q²)/(2q⁶(1−q⁻²)²)` | inside `o(q^{(9+n)/2})` | none |
| §8.14 `m^•_λ` | `#Q(𝔽_{q^k}) − #Q(𝔽_q)` | cone `(q⁴+q²)−(q²+q) = q⁴−q`; nsp `(q²+1)²−(q²+1) = q⁴+q²`, `(q⁶+1)−(q²+1) = q⁶−q²`; spl `(q²+1)²−(q+1)² = q⁴+q²−2q`, `(q³+1)²−(q+1)² = q⁶+2q³−q²−2q` | nine twisted `S₀` reproduced (smooth in degrees `≥ 6`) | none |
| §8.14 `S₂(C^nsp_{(3)}) = 0` | removing a degree-3 point | `Z^{−1}` times `(1−t³)^{−1}` leaves the `t²` coefficient `s₂(Q_nsp) = 0` | agrees with the old entry 0 and bfp line 1513 | reason stated in the target |
| §8.14 quotients | 9 entries; Schur conversion at `n = 3` | cone `s₃` part `q¹¹+q¹⁰−q⁹−q⁸+q⁷`, `s₂₁` part `q¹⁰−q⁹−3q⁸+2q⁷`, `s₁₃` part `−q⁸+q⁷`; nsp `½(q¹²−q⁸)`, …; split `½(q¹²+2q¹¹+2q¹⁰−4q⁹−3q⁸+2q⁷)`, … | equal to bfp lines 1589–1597 | none |
| Regression `n = 1` (§8.11 Check) | three types plus `#H_{4,1}` | `q¹⁰+2q⁹+2q⁸−q⁷−q⁶` | equals §9.6 in degrees `≥ 5` | none |
| Regression `λ = (2)` (§8.14 Check) | three types plus `#H_{4,(2)} = q⁹−1` | `q¹¹+q¹⁰+2q⁹−2q⁸+q⁵−1` against §9.9 `q¹¹+q¹⁰+2q⁹−2q⁸` | agree in degrees `≥ 6` | none |
| `n = 3` precision form | §9.5 route | total minus §9.6 is `−6q⁶ + …` | constant coefficient absorbed by `B` | `O(q⁶)` → `c q⁶ + o(q⁶)` |
| §12.1 base region | `g = 6, 7`; `n = 0…3` | `2·7 = 14 > 13`; `12 + n ≥ 14`; `(6, ≤ 3)`, `c(6) = 5` | §7.7 unused | Needs edge removed; Check added |
| §9.10 reorder | six polynomials | old and new parsed and compared: equal | same statement | form only |

Context and generality: `Suggested.lean` declares nothing, so no binder can be lost. The README statements keep the generality they had: every finite field, `n ≤ 3`, the three cycle types. The split marked terms are stated at BFP's own precision `o(q⁶)` and not more precisely.

Ownership: the genus-four quadric sieve is owned here (Scope and ownership, §8.4 onward). `roadmaps grep` for "quadric cone", "non-split quadric" and "sieve term", over main and the open heads, finds no other roadmap that plans these counts; the sieve itself stays WeilConjectures, WC.1.

## For the maintainer

- No cited id changed: §§8.9–8.11, 8.14, 9.10 and 12.1 keep their numbers and headings. No other roadmap cites these sections.
- The roadmap introduces the notation `N^•_{n,≤3}` and `N^•_{λ,≤3}` for the truncated sieve sums, defined in the Layer 8 opening.
- No source was fetched and `sources.toml` is unchanged. No text in the review asked for anything outside this package.
