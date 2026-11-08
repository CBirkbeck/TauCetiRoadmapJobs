# Review of PCurvature (pull request #1747 at 13eb63f)

**Verdict:** accepted

This is an incremental re-review of the 15 lines that `TauCetiRoadmap/PCurvature/README.md` changed since d070295 (8 insertions, 7 deletions). There are two edits:

- The "Not a target" paragraph after 4.3 (lines 631–643) replaces "`B` squarefree (so `res(B, B′) ≠ 0`)" with "`B` without repeated roots (equivalently `res(B, B′) ≠ 0`)", and reflows the paragraph.
- The Fürnsinn–Pannier References entry (line 773) adds Theorem 2.1.

`Suggested.lean` and `metadata.toml` are unchanged. The pull request changes nothing outside the folder: `git diff --stat origin/main...HEAD` excluding the folder is empty. The other paths listed in the change summary come from the merge of main into the branch, and they are not in the three-dot diff. The pins are unchanged (Mathlib 1b1ccf4b, Tau Ceti 2fd255d9) and equal the content checkout's.

No findings.

## Previous findings

- R01 — repaired: "For `u = A/B` with `A, B ∈ ℤ[x]` coprime, `deg A < deg B` and `B` without repeated roots (equivalently `res(B, B′) ≠ 0`), the equation `y′ = u y` has a nonzero algebraic solution iff …" (lines 631–633). The README's own `u = c/x` example (`B = sx`) and the witness `1/(4x)` now satisfy the hypothesis.
- R02 — repaired: "arXiv:2510.00892, Theorems 1.1–1.3 and 2.1, Propositions 2.2–2.4." (line 773). Every Fürnsinn–Pannier locator in the text is now in the entry: 1.1 (line 573), 1.2 (634, 642), 1.3 (636, 653), 2.1 (639), 2.2 (637, 640) and 2.3 (642).

Neither repair introduced a new problem; the checks are below.

## Verified sound

**Gate, build, elaboration.**
- `gate … --base origin/main --order <candidate> --build`: every check is 0, including `build=0`, and the result is `OK`.
- The same gate with the configured order (no `--order`) reports only `depcheck: NOT IN ORDER: PCurvature (insert it after its last supplier)`. That is the public order not yet listing a roadmap that is still in a pull request, which is not a defect. The worker's gate record for this head has every check at 0.
- `lake env lean TauCetiRoadmap/PCurvature/Suggested.lean` exits 0. It prints 11 `sorry` warnings (lines 71, 97, 109, 114, 119, 138, 160, 167, 174, 200, 224) and nothing else.
- A scratch copy with `#check @` for all 19 declarations elaborates. After whitespace normalisation, all 19 elaborated types are identical to the worker's `signatures.md`, so no section binder is lost. The file is unchanged since the one-tactic probe of the review of d070295, in which all 11 theorems stayed `sorry`.

**Dependency check** (`gate --depcheck … --order <candidate> --movable --content <main>`): `depcheck: 239 roadmaps, 2354 edges, 0 problem(s)`. There is no UPWARD and no CYCLE line. The candidate lists PCurvature at line 41, after DerivedDeRhamCohomology (22), CrystallineCohomology (23) and FormalConnectionsOpers (40). The diff adds no `*Needs:*` line, no supplier citation and no Lean statement.

**Citations, overlaps, ownership.**
- The overlap listing (`roadmaps overlaps PCurvature`): no other pull request changes this roadmap, no cited id is dropped, and no roadmap is close in vocabulary.
- The citation listing (`roadmaps resolve` on the README): no unresolved cross-roadmap citation. Its four Lean leads are all in the supplier contracts, which the diff leaves untouched. Each was resolved again this round:
  - `DerivedDeRham.smoothCartier`: DerivedDeRhamCohomology README line 3907, at the head of its pull request.
  - `SchemeFrobenius.schemeFrobeniusTwist`: SchemeAndStackFoundations §0.29, on main (README line 432). §0.8 is at line 798 and §0.9 at line 848.
  - `Derivation.lie_mulLeft` and `Derivation.mulLeft_mul_mul_mulLeft_inv`: GrothendieckNotesLemmas §3.2, at the head of its pull request (README lines 657–662, `Suggested.lean` line 227). That roadmap names PCurvature only as a consumer (README line 871), so there is no cycle.
- The changed paragraph is declared not a target and defines no object, so it raises no new ownership or duplication question.
- Mathlib `Polynomial.resultant`, opened at `Mathlib/RingTheory/Polynomial/Resultant/Basic.lean:131`, with `resultant_zero_left_deg` at line 141, fixes the degenerate value used below: `res(±1, 0) = 1`.

**Sources in the changed passage** (furnsinn-pannier = arXiv:2510.00892v2, 12 Mar 2026). The cache text is flagged image-only, so the cached PDF was read page by page with pdftotext, and printed p. 3 was rendered to an image to read the formulas.
- **Theorem 1.2** (p. 3): `R ∈ ℤ[w]` with `r_n > 0`, and `Δ_R` is the discriminant-resultant of the square-free part. `M = ⌈2.826·r_n³·δ(Δ_R)³⌉` and `N = ⌈6.076·B·M⌉` are ceilings, which the text extraction drops. `σ = (2M+1)N + 2M`. The conclusion is splitting over `ℚ` iff splitting mod every `p ∤ r_n` with `p < σ`. With the ceilings, `R = w + 1`, `B = 1` gives `M = 3`, `N = 19`, `σ = 139`, as line 651 says. Without them it would give `σ ≈ 125.4`.
- **Theorem 1.3** (p. 3): `u = c·a/b`, `a, b` primitive, `Δ_b = |res_x(b, b′)| = |r_n|`, with no degree or simple-pole hypothesis. The README's "with `c = 1`, under the hypotheses of their Proposition 2.2(3)" matches.
- **Theorem 2.1** (p. 5, Rothstein–Trager): `u = a/b` with only simple poles and `deg a < deg b`, and the residues are exactly the roots of `res_x(b, a − w b′)`. For coprime `A, B`, "only simple poles" is "`B` without repeated roots", so the repaired hypothesis is exactly the theorem's.
- **Proposition 2.2** (p. 5): (1) ⇔ (3).
- **Proposition 2.3** (pp. 5–6): (1) ⇔ (4).
- **Katz 1982, §9, as they recall** (p. 2, last paragraph, and p. 3, first lines): a noetherianity argument gives a finite set of primes, and the argument is non-constructive.
- All of these are cited as the README says.

**Seeded sample.** The changed paragraph sits in §4.3 (Honda's theorem), a sampled target, and every locator in it is checked above. The 4.3 target statement and its Checks are unchanged, and were verified in the reviews of 43fe6b5 and 9cddff5. The other sampled targets lie outside the diff and are unchanged: 0.1, 0.2, 1.2, 1.3, 1.4, 1.5, 2.0, 2.2, 2.3, 2.4, 3.1, 3.2, 4.1, 4.2.

**The repaired hypothesis, by computation.** The values come from an exact-arithmetic script:
- `res` is a Sylvester determinant over `ℚ`.
- `R(w)` is found by interpolation at `m + 1` points.
- `ψ_p = 0` is tested as `N^p + N_{p−1} ≡ 0` over `𝔽_p`, with `N_{k+1} = N_k′ D − (k+1) N_k D′`.

For `deg B ≥ 1`, `res(B, B′) = ± lc(B)·disc(B)`, so "no repeated root in `ℚ̄`" and "`res(B, B′) ≠ 0`" are equivalent. When `deg B = 0`, coprimality and `deg A < deg B` force `A = 0` and `B = ±1`.

Line 641's "stays squarefree" is about `B̄ ∈ 𝔽_p[x]`, where squarefree and separable agree. It needs no change.

| Statement | Instances | Values each side | Result | Source |
| --- | --- | --- | --- | --- |
| "`B` without repeated roots (equivalently `res(B, B′) ≠ 0`)", lines 632–633, on non-primitive `B` | `A = 1`, `B = 4x` (the earlier witness) | no repeated root; `res(4x, 4) = 4`; `R = 1 − 4w`, so `±R` has leading coefficient `4`; `ψ_3 = ψ_5 = ψ_7 = ψ_11 = ψ_13 = 0`; `p = 2` untested; `y = x^{1/4}` | inside the hypothesis, conclusion holds | this review |
| same | `A = 1`, `B = 9x` | `res = 9`; `R = 1 − 9w`; `ψ_2 = ψ_5 = ψ_7 = ψ_11 = ψ_13 = 0`; `p = 3` untested; `y = x^{1/9}` | holds | this review |
| same, non-algebraic case | `A = 1`, `B = 4x² + 4` | `res = 256`; `R = 256w² + 4`, roots `±i/8` = the residues of `1/(4(x²+1))`; `ψ_3 ≠ 0` with `3 ∤ 256`; `ψ_5 = ψ_13 = 0`; `ψ_7, ψ_11 ≠ 0` | test fails at `3`, no algebraic solution: consistent | this review |
| same, a double root of `R` | `A = 1`, `B = x³ − x` | `res = −4`; `R = 4w³ − 3w + 1 = (w + 1)(2w − 1)²`; residues `−1, ½, ½`; `ψ_p = 0` at `p = 3, …, 13`; `ψ_2 ≠ 0`, with `2 ∣ 4` untested; `y = √(x² − 1)/x` | holds | this review |
| same, the non-algebraic example from the review of d070295 | `A = 1`, `B = 3x² + x + 5` | `res = 177 = 3·59`; `R = 177w² + 3`, roots `1/(6β + 1)` with `(6β + 1)² = −59`; `ψ_2 = ψ_5 = ψ_7 = 0`; `ψ_11, ψ_13 ≠ 0` with `11 ∤ 177` | test fails at `11`: consistent | this review |
| the equivalence, negative side | `B = (x + 1)²`; `B = 4x²` | repeated roots; `res = 0` in both; `R = 1`, `R = 4`; `ψ_p ≠ 0` for `p = 3, …, 13` | excluded by both readings, as Witness 1 says | this review |
| the equivalence, degenerate `deg B = 0` | `A = 0`, `B = ±1` (`u = 0`) | no roots; `res(±1, 0) = (±1)^0 = 1` (`resultant_zero_left_deg`); `ψ_p = 0` everywhere; `y = 1` | holds | this review |
| Theorem 2.1 citation (line 639) | p. 5 hypotheses | simple poles and `deg a < deg b`; residues = roots of `res_x(b, a − w b′)` | matches the repaired hypotheses | this review |
| References entry vs text (line 773) | Fürnsinn–Pannier locators | text: 1.1, 1.2, 1.3, 2.1, 2.2, 2.3; entry: 1.1–1.3, 2.1, 2.2–2.4 | complete | this review |
| `σ = 139` for `R = w + 1` (line 651) | Theorem 1.2 with ceilings, `B = 1` | `M = ⌈2.826⌉ = 3`, `N = ⌈18.228⌉ = 19`, `σ = 7·19 + 6 = 139` | as printed in the README | this review (p. 3 image) |
| Effective Honda, `c = 1`, on `1/(x²+1)` | `A = 1`, `B = x²+1` | `res = 4`; `R = 4w² + 1`; `σ = 12 729 314`; `ψ_3 ≠ 0`; `ψ_5 = ψ_13 = 0` (`ψ_13 = 0` recomputed this round) | consistent | review of d070295 |
| `u = c/x` example (lines 643–646) | `c = ½, ¾, ⅔, −5/6, ¼` | `R = r − sw`; `res = s`; `ψ_p = 0` at the tested `p`; `y = x^c` | holds | review of d070295 |
| `u = 1/(2x)` (lines 646–647) | `A = 1`, `B = 2x` | `res = 2`, `R = 1 − 2w`, `σ = 200 012`; `ψ_3 = ψ_5 = 0` (recomputed this round, also at `7, 11, 13`) | holds | review of d070295 |
| `y′ = y` outside the statement (lines 647–648) | `A = B = 1` | `deg A = deg B = 0`; `ψ_5 = 1 ≠ 0` | accurate | review of d070295 |
| Witness 2 (lines 650–653) | `A = Nx² + Nx + 1`, `B = −(x + 1)` | `R = w + 1`, `res = −1`, `σ = 139`; `ψ_p = 0` for `p ≤ 137`; `ψ_139 ≠ 0` | isolates the degree hypothesis | review of d070295 |
| Printed Theorem 1.3 with `c` free (lines 653–660) | `c` = the product of the primes `≡ 3 (mod 4)` below `σ`; toy model `c = 21` | toy: `ψ_3 = ψ_5 = ψ_7 = 0`, `ψ_11 ≠ 0`; residues `∓ci/2`; `R = 4w² + c²` | refutes the print: accurate | review of d070295 |
| `pPow` body; 3.2 proof and Check 3; 1.2 Check 2; docstrings 2.4, 4.2; K3Surfaces §0.2 consumer | as listed there | as listed there | hold | review of d070295, carrying the reviews of 7ff8fa7 and 9cddff5 |
| 0.1–0.3, 1.1–1.5, 2.0–2.4, 3.1, 4.1–4.4, Conventions 1, 5, 6 | as listed there | as listed there | hold (0.3: Katz's print wrong) | review of d070295, carrying the review of 43fe6b5 |

**Headline theorems** (unchanged by the diff, carried from the review of d070295):
- Stated in `Suggested.lean`: Jacobson's formula (0.1, `add_pow_eq_jacobson`); the restricted structure on `Der_R(A)` and Hochschild's formula (0.3); the rank-one formula (1.4, `rankOne_pCurvature_eq`); rank one in one variable (2.3, `exists_unit_horizontal_iff`, with 2.4 its instance); Kronecker (4.1, `exists_intCast_eq_of_forall_pow_sub_mem`); Honda (4.3, `honda`).
- Named as not statable in the module docstring: Katz's structure theorem (1.2), nilpotence (1.5), Cartier descent (2.1), the easy direction (3.2), the Kummer trivialisation (4.4).
- The effective form after 4.3 is declared not a target.
- No statable headline is absent, and none is forced through a stand-in.

**Declared gaps:** none declared, none needed.

**Remarks on untouched text** (not findings):
- GrothendieckNotesLemmas, whose §3.2 is cited at README lines 125, 254, 339 and 382, is a new roadmap still in a pull request and is not in the candidate merge order. Its citation resolves at that head. The pull request description's "Depends on" list names only CrystallineCohomology.
- The paragraph's text is timeless and has no LaTeX: the gate reports `latex = 0` and `round-labels = 0`.

## Not verifiable

- Honda 1981, Kronecker 1880, Katz 1972 and 1982, Chudnovsky–Chudnovsky 1985, André 1989 and 2004, Beukers–Peters 1984: no legal copies were found in earlier reviews, and none was looked for here because the diff cites none. Katz 1982 §9 enters the changed paragraph only "as they recall", which was checked in furnsinn-pannier (p. 2).

## Source issues

- **Error** in furnsinn-pannier at Theorem 1.3, printed p. 3: the source says that for any primitive `a, b ∈ ℤ[x]`, algebraicity is equivalent to vanishing `p`-curvature at all `p ∤ Δ_b`, `p < σ`; it should assume `deg a < deg b` and `b` without repeated roots: `a = Nx² + Nx + 1`, `b = −x − 1` gives `σ = 139` and vanishing tested curvatures without an algebraic solution; affects a stated result.
- **Error** in furnsinn-pannier at Theorem 1.3, printed p. 3, and its proof, printed p. 6: the source says `c ∈ ℚ` may be pulled out, with `R` and `σ` computed from `a, b`, since `y` is algebraic iff `y^c` is; it should take `c = 1`, because the reduction changes where `p`-curvatures vanish (`c/(x² + 1)`, `c` the product of the primes `≡ 3 (mod 4)` below `σ`); affects a stated result.
