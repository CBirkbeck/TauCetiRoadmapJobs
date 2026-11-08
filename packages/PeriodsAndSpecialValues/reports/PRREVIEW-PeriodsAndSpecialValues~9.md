# Review of PeriodsAndSpecialValues (pull request #1496 at 8f85555)

**Verdict:** accepted

:robot: Independent AI incremental re-review of the 10 changed lines since c45d237. All 10 are in `TauCetiRoadmap/PeriodsAndSpecialValues/Suggested.lean`: they add the module-system header and the two section closers. The README and `metadata.toml` are byte-identical to c45d237, and nothing outside the folder changed. The gate passes with the targeted build, and the previous report's only finding is repaired. This review changes no pull-request file.

## Findings

None.

## Previous findings

- R01 — repaired: `Suggested.lean:1–3` now read `module`, a blank line, `public import Mathlib`. Line 42 `@[expose] public section` comes before line 44 `noncomputable section`, and the `end`s at lines 243 and 245 close both. The gate with `--build` reports `build=0 … OK`.

## Verified sound

**Scope.**
- The head is `8f85555cf01c55083218b9cb3d9a78064ebcbb15` and the worktree is clean.
- `git diff --stat c45d237 HEAD` lists one file: `Suggested.lean`, with 9 insertions and 1 deletion.
- `git diff --stat origin/main...HEAD` outside the folder is empty.
- README and `metadata.toml` are byte-identical to c45d237 (`git diff --quiet` succeeds).
- The pins in `.lake/packages` match `lake-manifest.json`: Mathlib `1b1ccf4b`, Tau Ceti `2fd255d9`. The toolchain is `leanprover/lean4:v4.36.0-rc2`.

**The changed lines (the R01 repair).**
- **Section nesting.**
  - Two anonymous sections are opened, at line 42 (`@[expose] public section`) and line 44 (`noncomputable section`).
  - The namespace is opened at line 46 and closed at line 241. The `end` at line 243 closes the noncomputable section and the `end` at line 245 closes the public section.
  - This nesting is balanced, and the file elaborates without an "unclosed section" or "invalid 'end'" error.
- **Match with main.** On main (`eaf17b1`), 5 `Suggested.lean` files use exactly this header: `module` / `public import Mathlib` / `@[expose] public section`. Two more use plain `public section`.
- **Exposure.** `@[expose]` makes the bodies of the definitions available to downstream proofs, for example the recursion of `hoffmanDim` and the encodings `mzvEncode`/`mzvDecode`. The file has no `private` declarations and no `instance`s whose visibility could change.
- **Gate scanners.** The gate's `imports` and `no-import-mathlib` rules accept `public import Mathlib` (both report 0).

**Gate.** Running `gate … PeriodsAndSpecialValues --base origin/main --build` exits 0 and prints:

```text
gate PeriodsAndSpecialValues: set_option=0 blob=0 latex=0 tex=0 prnum=0 sorry-data=0 sorry-examples=0 residue=0 private-paths=0 imports=0 mathlib-subimports=0 no-import-mathlib=0 lean-lines=0 statement-hygiene=0 forbidden=0 dropped=0 readme-ids-missing=0 empty-sections=0 round-labels=0 long-fences=0 layer-ids=0 target-ids=0 depcheck=0 metadata=0 stray-files=0 dirty=0 outside-folder=0 source-material=0 build=0 OK
```

**Elaboration.**
- `lake env lean` on `Suggested.lean` exits 0. It prints exactly 13 diagnostics, all "declaration uses `sorry`", at lines 69, 74, 91, 101, 120, 125, 150, 155, 191, 196, 210, 227 and 234. There are no other diagnostics.
- **Signatures.** A scratch copy with `#check @name` appended for all 38 declarations elaborates. All 38 elaborated types are identical, after whitespace normalisation, to the worker's signature list. No binder was lost, and no statement changed under the module system.
- **Padding probe.** A scratch copy replaces each `sorry` with `first | rfl | simp | infer_instance | norm_num`. It gives 13 "unsolved goals" errors, one for each theorem, at lines 70, 76, 92, 105, 121, 127, 151, 157, 192, 198, 213, 229 and 238. None of the 13 theorems is padding.

**Dependency check.** The output is exactly:

```text
depcheck: 242 roadmaps, 2452 edges, 0 problem(s)
```

There is no UPWARD, CYCLE or moved line. Merge-order positions: MotivesAndAlgebraicCycles 78, ArithmeticKTheory 133, MotivicEtaleKTheory 134, BorelRegulators 300, PeriodsAndSpecialValues 319. The changed lines add no `*Needs:*` edge and no supplier citation.

**Citations and overlaps, rerun at this head.**
- `roadmaps resolve` on the README finds no cross-roadmap citation and no Lean name that is unresolved.
- `roadmaps overlaps PeriodsAndSpecialValues` finds:
  - no other open pull request that changes this roadmap;
  - no id this README cites that an open pull request drops;
  - no id that only an open revision defines.
- The diff adds no object and renames no declaration, so ownership against the closest open roadmaps is unchanged since `…~8.md`. Those roadmaps are NoncommutativeAndEquivariantIwasawa, BorelRegulators, KatoEulerSystems, Polylogarithms and PadicHodgeRegulators.
- The namespace `TauCetiRoadmap.PeriodsAndSpecialValues` is unchanged, so no fully qualified name collides with another roadmap's.

**Headline theorems.** All the headlines statable at the pins are stated, and their statements are unchanged:
- PS.7.1: `legendre_substitution`, `legendre_midpoint_error`
- PS.8.7: `quartic_symmetric_square`
- PS.8.11: `quarticMirror_integral`
- PS.8.15: `dworkSigma0_summable`, `dworkSigma2_summable`
- PS.9.1: `mzv_summable_iff`
- PS.9.15: `mzv_allTwo`
- PS.9.4: `mzv_stuffle`, `mzv_shuffle`
- PS.9.17: `zagier_evaluation`
- PS.9.23: `numerical_spanning`, `mzv_span_finrank_le`

The headlines of PS.0–PS.6, PS.7 (period conjecture), geometric PS.8 and motivic PS.9 are still named in the module docstring (lines 18–30) as not statable, each with its missing carrier.

**Seeded sample.** Both sampled passages are outside the diff and byte-identical: `README.md:1956` “Fixed-fibre projective map” and `README.md:1969` “Residue coordinates and the small prime”.
- **Park.** The anchors were reopened. Printed page = PDF page + 419: page 2 of the text carries header page 421, and page 23 carries 442.
  - Definition 3.1 at Park line 667 is on PDF page 14, printed p. 433, as cited.
  - Definition 4.8 at Park line 1173 is on printed p. 442, and Theorem 4.11 at Park line 1233 on p. 443. Both fall within the cited pp. 442–445.
  - Corollary 4.12 at Park line 1345 is on p. 445, as cited.
  - Proposition 5.2 at Park line 1568 is on p. 449, as cited.
- **SH.** Lemma 4.8, on the s-relations, is at SH line 271.
- **SG.** Lemma 5.6 at SG line 1082 assumes p > dim V, which matches the README's statement that it excludes p = 3 for the threefold.
- The README flags no locator as unverified.

### Computed adversarial table

| Statement | Instances tried | Values computed on each side | Result | Change |
|---|---|---|---|---|
| Header repair (lines 1–3, 42, 243, 245) | gate `--build`; `lake env lean`; section nesting | build=0; exit 0, 13 sorry warnings and 0 others; 2 sections + 1 namespace opened, 3 closed | R01 repaired | Retain |
| All 38 declarations under the module system | `#check @name` against the worker's list | 38 of 38 identical | no drift, no lost binder | Retain |
| One-tactic probe on the 13 theorems | `first \| rfl \| simp \| infer_instance \| norm_num` | 13 of 13 leave unsolved goals | no padding | Retain |
| `legendre_substitution` | t = 2u/(1+u²) on [0,1]; boundary λ → 0 | dt = 2(1−u²)/(1+u²)² du and √((1−t²)(1−λt²)) = (1−u²)√D/(1+u²)², so the integrand is 2/√D. At λ = 0: π/2 on both sides | correct | Retain |
| `legendre_midpoint_error` | N = 1, λ → 0⁺ | K = π/2 ≈ 1.5708; midpoint 2/(1+1/4) = 1.6; gap 0.0292 ≤ bound 2 | correct | Retain |
| `quartic_symmetric_square` | coefficients of z and z² | A₁ = 24 and 2·(3/64)·256 = 24. A₂ = 8!/2⁴ = 2520, and (2·297/16384 + 9/4096)·256² = 630·4 = 2520 | correct | Retain |
| `quarticMirror_integral` | coefficient of z² in q | g₀ = 0, g₁ = 96·(H₄ − H₁) = 96·13/12 = 104, so q = z + 104z² + … | integral to this order | Retain |
| `dworkSigma0_summable` | p = 2: B_{n+1}·n! = I_{n+1}/(n+1), with I the involution numbers | v₂(I_n) for n = 4,…,16: 1,1,2,3,2,2,3,4,3,3,4,5,4, which is ⌊n/4⌋ plus 0, 0, 1 or 2 according to n mod 4. So v₂(I_n/n) ≥ n/4 − log₂ n − 1 → ∞ | consistent with terms → 0 in ℚ₂ | Retain |
| `mzv_summable_iff` | k = [], [1], [2,1], [1,2] | summable: yes (one term), no (harmonic), yes (= ζ(3)), no. Admissible: yes, no (head 1), yes, no | both sides agree in all four cases | Retain |
| `mzv_allTwo` | m = 0, 1, 2 | 1 = π⁰/1!; ζ(2) = π²/6 = π²/3!; ζ(2,2) = π⁴/120 = π⁴/5! | correct | Retain |
| `mzv_stuffle` | k = l = [2] | stuffles = [2,2], [2,2], [4]; 2·π⁴/120 + π⁴/90 = π⁴/36 = ζ(2)² | correct | Retain |
| `mzv_shuffle` | k = l = [2] (from `…~8.md`) | 01 ш 01 = 2·0101 + 4·0011, giving 2ζ(2,2) + 4ζ(3,1) = π⁴/36 | correct | Retain |
| `zagier_evaluation` | (a,b) = (0,0), (1,0), (0,1) | (0,0): coefficient 1, ζ(3) = ζ(3). (1,0): coefficients −2 for ζ(3)ζ(2) and 9/2 for ζ(5); ζ(2,3) = 4.66618 − 3.95461 = 0.71157, and the direct sum ≈ 0.7115. (0,1): coefficients 3 and −11/2, the known ζ(3,2) | correct | Retain |
| `mzv_span_finrank_le` / `hoffmanDim` | N = 0, 1, 3, 4, 5 | d = 1, 0, 1, 1, 2. N = 0: span ℚ·1, rank 1. N = 1: no admissible index, rank 0. N = 5: all values lie in span{ζ(5), ζ(2)ζ(3)}, so rank ≤ 2 | correct, including both boundary weights | Retain |
| `numerical_spanning` | k = [], [2,1] | Hoffman words of weight 0: [] with value 1. Weight 3: [3], and ζ(2,1) = ζ(3) | correct | Retain |
| Sample: residue coordinates (`README.md:1969`) | R = diag(1,−1,2,−6)·D | R is upper triangular with diagonal (1,1,2,6), so det R = 12. D = diag(1,−1,1/2,−1/6)·R has diagonal (1,−1,1,−1), so det D = 1. v₃(12) = 1, and v_p(12) = 0 for p ≥ 7 | consistent with the prose | Retain |
| Sample: fixed-fibre map (`README.md:1956`) | locators against the printed pages | Def 3.1 p. 433; Def 4.8 p. 442; Thm 4.11 p. 443; Cor 4.12 p. 445; Prop 5.2 p. 449 | all as cited | Retain |

### Carried-forward adversarial evidence

The README passages these rows were computed on are byte-identical at this head, and the Lean statements elaborate to identical types. The rows still hold with their values:
- the 15 rows of `packages/PeriodsAndSpecialValues/reports/PRREVIEW-PeriodsAndSpecialValues~8.md`;
- the 17 rows of `…~7.md`: PS.3.3a, the BorelRegulators §§5.3–5.4 and 6.1–6.2 contracts, the j = 1 exclusion, and the ℚ(i) and ℚ(√5) Checks;
- the rows of `…~6.md`, `…~5.md`, `…~4.md` and `…~2.md` for every README statement of Layers PS.0–PS.9.

## Not verifiable

- This incremental review re-elaborated and re-probed the whole Lean file. For the untouched README targets and their cross-roadmap citations, the mathematical audit is inherited from the earlier reports listed above.
- Some suppliers are still open pull requests: BorelRegulators, MotivesAndAlgebraicCycles and the other suppliers named in the description. Their section numbers were resolved by the citation and overlap tools at their current heads, not on main, and may still move before they merge.
- Two sources are settled and were not requested: BG as uncertified and Tate-legal as waived.

## Source issues

- none
