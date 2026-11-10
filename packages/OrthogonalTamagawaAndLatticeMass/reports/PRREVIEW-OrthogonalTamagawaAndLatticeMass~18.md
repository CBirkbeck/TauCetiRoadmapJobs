# Review of OrthogonalTamagawaAndLatticeMass (pull request #1222 at 493e3ac)

**Verdict:** needs changes

This is an incremental re-review of the 4 changed lines since `de8efdc`. The diff changes only README lines 146 and 610, narrowing Milne §24i from pp.535–537 to pp.535–536. That repairs R03 of the previous review, and the rewritten pull-request description repairs R02. R01 of the previous review is not repaired: the branch still pins Tau Ceti `a91d3aa`. It is held below as the only finding, and it re-raises H01.

## R01 (P2) — The branch pins Tau Ceti `a91d3aa`; at main's `2fd255d9`, which the README is written against, `Suggested.lean` restates three native declarations

Re-raised: H01

**Location.**
- `lake-manifest.json` line 8 pins Tau Ceti `a91d3aafa8cd…`, and line 18 pins Mathlib `6b7abb3c…`. Main pins `2fd255d9…` and `1b1ccf4b…`.
- `TauCetiRoadmap/OrthogonalTamagawaAndLatticeMass/README.md` line 28: "every Tau Ceti declaration cited in the layers, are those of Tau Ceti at `2fd255d9`, with Mathlib at `1b1ccf4b`".
- `TauCetiRoadmap/OrthogonalTamagawaAndLatticeMass/Suggested.lean` defines `SameGenus` (line 107), `genusMass` (line 114) and `localDensity` (line 121).

**Claim.** The README and the acceptance test are written against the libraries that the pull request pins and that it will merge onto.

**Witness.**
- At `2fd255d9`, `git grep` finds native versions of all three:
  - `TauCeti/NumberTheory/IntegralLattice/Genus.lean` 77, `def SameGenus`;
  - `Mass.lean` 91, `def mass`;
  - `LocalDensity/Basic.lean` 546, `def localDensity`.
- At `a91d3aa` the same search finds none of them.
- On `493e3ac`, CI's `build` check is SUCCESS and GitHub reports the pull request MERGEABLE.

**Why H01's reason fails.** The repair report says: "Not actionable in this package: the folder needs no change, and no folder-only change can repair it. The finding is correct."
- **"The folder needs no change" is false.** The pull request's own description, in its paragraph "Required before merge", deletes the three definitions. It restates `genusMass_eq`, `genusMass_eq_rank_two`, `evenUnimodularMass_eq` and the four class counts on the native `mass`, `Matrix.localDensity`, `classNumber` and `e8PowLattice k`. It also edits Scope, Conventions, §0.0, §1.3, §3.1 and Layer 4. The folder therefore does need a change, and that change is waiting on the merge.
- **"No folder-only change can repair it" is about who can act.** It does not show that the defect is absent, and the report concedes the finding is correct. If the pull request merged unchanged, main would carry three restatements of native Tau Ceti declarations.
- **The finding cannot be dropped.** An acceptance would mark this head ready for a human's final approval. The step belongs to a worker or a human, so the board should park the roadmap for one.

**Repair.**
1. **Worker or human.** Merge `origin/main` into the branch, moving the pins to Tau Ceti `2fd255d9` and Mathlib `1b1ccf4b`. GitHub reports no conflict.
2. **Author, after the merge, inside the folder.** Commit the restatement that the description's "Required before merge" paragraph sets out:
   - delete `SameGenus`, `genusMass`, `localDensity` and the definitions that serve only them;
   - state `genusMass_eq` and `genusMass_eq_rank_two` with `TauCeti.IntegralLattice.mass` of `nativeLattice G` on the left, and Euler factors from `Matrix.localDensity` of the image of `G` over `ℤ_[p]`;
   - state `evenUnimodularMass_eq` and the four class counts on `TauCeti.IntegralLattice.e8PowLattice k`, with `TauCeti.IntegralLattice.classNumber`;
   - make the matching README edits.

This repair cannot be tested at the branch pins, because the native declarations are absent there; that absence is the defect.

## Previous findings

- R01 — not repaired: `lake-manifest.json` line 8 still pins Tau Ceti `a91d3aafa8cd3e6bc33dfde0d7677ed0f1625039`. README line 28 names `2fd255d9`. `Suggested.lean` still defines `SameGenus`, `genusMass` and `localDensity` (lines 107, 114 and 121). Held as R01 above.
- R02 — repaired: the title now reads "comparisons, arbitrary masses and class counts". The description says "It states seven headline theorems, each with `sorry`" and places the central-isogeny comparison out of scope. It no longer mentions #1238, #1181 or "16 intentional admissions".
- R03 — repaired: README line 146 ("Milne, *Algebraic Groups* (2022 corrected version), §24i, pp.535–536") and line 610 ("§24i, pp.535–536, for the Clifford construction and simply connected Spin cover").

## Verified sound

### The changed passage: README lines 146 and 610 (seeded target 0.1)

The page range now matches the text:
- `MilneAG` line 22080, printed p.535, opens §24i "The spin groups".
- Lines 22102–22111 define GSpin, the exact sequence with G_m, and the spinor norm.
- Lines 22117–22118 are the break to printed p.536.
- Lines 22119–22133 give the μ₂ sequence and the two-fold cover.
- Lines 22134–22136 say Spin is the simply connected cover, with X(T) = P(Φ).
- Line 22149, on p.536, opens §24j, and p.537 (line 22163 on) is entirely §24j.

The range supports both uses:
- **Line 146** cites Milne only for the positive-rank construction and the central cover. The n = 4 factors, the n = 2 torus and the descent use the ReductiveGroups contracts, not Milne.
- **Line 610** cites it for the Clifford construction and the simply connected cover.

Nothing else in the folder cites Milne; `grep` finds exactly these two lines.

Remark: the board manifest `sources.toml` still records the `MilneAG` locator as "§24i, pp.535–537". That file is outside the folder and not part of the pull request; the worker may align it.

### Description (R02 repair), checked claim by claim against `493e3ac`

- **Folder contents.** The folder holds `README.md`, `Suggested.lean` and `metadata.toml`.
- **Layer 0.**
  - §0.1 is over characteristic ≠ 2, with a μ₂ kernel in positive rank and semisimple, simply connected Spin for n ≥ 3 (README lines 138–144).
  - §0.2 covers the field, its completions and the adeles (line 182).
  - §0.3 has the factorwise noncompactness hypothesis, Eichler's theorem and the rank ≥ 3 half of 4E (lines 201–205).
- **Layer 1.**
  - §1.2 has sₙ = 2^(−⌊n/2⌋) (line 249).
  - §1.4 uses χ_L built from χ_D, not the Kronecker character of Δ (the Check on line 357). It proves h⁺R⁺ = 2hR (line 372) and treats the divergent split case (line 382).
- **Layers 2–4.**
  - §2.1 covers every unramified R/ℤ₂ (line 406).
  - §3.2 evaluates B₂…B₃₈ (line 518).
  - §4.1 proves the Dₙ, E₆ and E₇ orders and transports the E₈ order (lines 542–546).
  - §4.3 proves 2Mₙ ≤ hₙ (line 583).
- **Ownership and suppliers.** They match Scope (lines 7–11) and the supplier contracts (lines 62–100).
- **Library revisions.**
  - The four imported modules (`IntegralLattice/Basic`, `Isometry/Group`, `Even`, `Unimodular`) exist at `2fd255d9`, checked with `git cat-file -e`.
  - `e8PowLattice` is at `TauCeti/LinearAlgebra/IntegralLattice/PosDef/EvenUnimodular.lean` 84.
  - `classNumber` is at `TauCeti/NumberTheory/IntegralLattice/ClassNumber.lean` 144.
  - GitHub reports the pull request MERGEABLE.

### Gate, dependency check, elaboration

- **Gate.** The worker's gate (`gate.md`) is `OK`. My rerun on `493e3ac` is also `OK`, with every counter 0, including `outside-folder=0`, `stray-files=0`, `statement-hygiene=0`, `readme-ids-missing=0` and `depcheck=0`. `git diff --stat origin/main...HEAD` outside the folder is empty.
- **Dependency check** (`--movable`):

  ```text
  depcheck: 233 roadmaps, 2263 edges, 0 problem(s)
  ```

  There is no UPWARD, CYCLE or `moved:` line. In the merge order this roadmap is at line 149. Its open suppliers come earlier: AdelicAlgebraicGroups at 52, GeometryOfNumbersAndQuadraticArithmetic at 55, ArithmeticStatisticsPartV at 56 and EndoscopicTransferAndUnitaryTraceComparison at 148.
- **Elaboration.** `lake env lean` of `Suggested.lean` at the branch pins printed exactly seven `declaration uses 'sorry'` warnings, at lines 133, 148, 179, 186, 190, 194 and 198, and nothing else. CI's `build` on `493e3ac` is SUCCESS.
- **Binder audit and padding probe.** `Suggested.lean` is byte-identical to `de8efdc` (`git diff --stat de8efdc HEAD` touches only `README.md`), so the previous report's results carry over:
  - `#check @` on all 22 declarations; there is no `variable` or `include` line, so no binder can be lost, and `signatures.md` reports 0 lost binders;
  - all seven theorems resisted the one-tactic probe.

### Ownership and overlaps

`overlaps.md` lists:
- no pull request that changes this roadmap;
- no id dropped by an open pull request;
- no id defined only by an open revision.

The closest open roadmaps in vocabulary are IntegralLattices revisions, LatticePackingsAndPerfectForms, OrthogonalSpinGroups and ThetaSeries. The diff touches no ownership text, so the previous report's ownership analysis stands.

### Adversarial table

Rows 1–27 carry over from the previous review (r17, at `de8efdc`) for statements the diff leaves untouched, with the values computed there. Rows 28–29 are this review's.

| # | Statement | Instances | Values on each side | Result | Change |
| --- | --- | --- | --- | --- | --- |
| 1 | 0.0 Checks (r17) | diag(1,2), A=[[1,1],[0,1]]; empty | AᵀGA=[[1,1],[1,3]]; \|O\|=4, \|SO\|=2; empty: det 1, one automorphism | True | none |
| 2 | 0.1 rank four (r17) | x²+y²+z²+w²; x²+y²+z²+2w² | d=1, a square: two factors; d=2: one Res factor | True | none |
| 3 | 0.1 rank two (r17) | ax²+by² | (e₁e₂)²=−ab=−det C | True | none |
| 4 | 0.1a orders (r17) | xy, x²+xy+y² over 𝔽₂; f=4; z²+xy | 2; 6; 6 and 10; 6 | True | none |
| 5 | 0.2 transpose (r17) | C=diag(1,4), M=[[0,1/2],[2,0]] | MCMᵀ=diag(1,4); MᵀCM=diag(16,1/4) | True | none |
| 6 | 0.3 factor hypothesis (r17) | AA.4.2 | factorwise noncompactness; a definite norm-one factor fails it | Consistent | none |
| 7 | 1.1 proper weights (r17) | A₂; [[4,1],[1,6]] | 1/6=2·(1/12); 3/2=2·(3/4) | True | none |
| 8 | 1.2 gauge (r17) | n=3, 4 | V₃=8π², s₃V₃=4π²; V₄=16π⁴ | True | none |
| 9 | Densities (r17) | ⟨1⟩, ⟨2⟩, U, [[1,1],[1,2]] at 2; ⟨1⟩ at 3 | 4; 8; 4; 8; 2 | Match the Checks | none |
| 10 | Densities (r17) | I₂ at 2; I₃ at 2 and 3 | 8; 12; 16/9 | Match | none |
| 11 | Densities (r17) | diag(1,3), A₂, [[4,1],[1,6]], diag(1,5) | at 2: 4, 12, 4, 8; at the odd bad prime: 12, 12, 92, 20 | Match | none |
| 12 | Cho Thm 5.2 (r17) | ⟨1⟩, ⟨2⟩, U, E₈ | α₂ = 4, 8, 4, 42525/128 | Match | none |
| 13 | `genusMass_eq` (r17) | I₃ | 1/48; numeric 0.0208333327 | True | none |
| 14 | `genusMass_eq` (r17) | E₈ | 1/696729600 | True | none |
| 15 | `3 ≤ n` (r17) | ⟨1⟩ | right side 1 against mass 1/2 | Needed | none |
| 16 | `genusMass_eq_rank_two` (r17) | I₂, A₂, [[4,1],[1,6]], diag(1,3), diag(1,5) | 0.1250066, 0.0833372, 0.7500620, 0.2500116, 0.2500132 against 1/8, 1/12, 3/4, 1/4, 1/4 | True | none |
| 17 | 1.4 identities (r17) | A₂; −23; diag(1,3); diag(1,5) | 1/24; 1/184; 1/8; 1/40 | True | none |
| 18 | 1.4c narrow (r17) | D=5; D=12 | h⁺/h=1, R⁺/R=2; h⁺/h=2, R⁺/R=1 | True | none |
| 19 | 2.1 kernels (r17) | rank 2 over 𝔽₄ | 4 | True | none |
| 20 | 2.3 bad factors (r17) | A₂, −23, E₈ | 6, 6; 2, 46; 42525/256 | True | none |
| 21 | `bernoulliFullMass` (r17) | m=0, 4, 8 | 0; 1/696729600; 691/277667181515243520000 | True | none |
| 22 | BG proper mass (r17) | E₈ | 1/348364800 = 2M₈ | True | none |
| 23 | `rank16_classNumber` (r17) | 2·696729600², 2¹⁵·16! | reciprocal sum = M₁₆ | True | none |
| 24 | `rank24_classNumber` (r17) | 23 factors × Weyl orders, plus Leech | Σ = M₂₄ exactly | True | none |
| 25 | 4.2 Checks (r17) | A₁²⁴; 24!; D₄⁶ with 384 | 3.067% of M₂₄; 0.96933·M₂₄; 0.99885·M₂₄ | True | none |
| 26 | 4.1 Weyl orders (r17) | D₄; E₆; E₇; E₈ | 192; 51840; 2903040; 696729600 | True | none |
| 27 | rank-32/40 bounds (r17) | 2M₃₂, 2M₄₀ | 80618465.871; 8.786·10⁵¹ | True | none |
| 28 | Milne §24i locator (changed lines 146, 610) | page markers of `MilneAG` | §24i starts p.535 (22080); §24j starts p.536 (22149); p.537 starts at 22163, inside §24j; the construction and cover are at 22102–22136 | pp.535–536 exact; pp.535–537 overshot | R03 repaired |
| 29 | R01 pin | the three Gram definitions | `a91d3aa`: `git grep` finds none; `2fd255d9`: `Genus.lean` 77, `Mass.lean` 91, `LocalDensity/Basic.lean` 546 | Defect | R01 |

### Headline inventory

- **Stated.** `genusMass_eq`, `genusMass_eq_rank_two`, `evenUnimodularMass_eq`, `rank16_classNumber`, `rank24_classNumber`, `rank32_classNumber_lower_bound` and `rank40_classNumber_lower_bound`.
- **Named in the module docstring as not statable.** §0.1, §0.1a, the measure identities of §§1.2–1.3, §§2.1–2.2 and §0.3. This is unchanged since r17.

## Not verifiable

- **O'Meara, *Introduction to Quadratic Forms*, 104:4–5 (§0.3).** The manifest records it as uncertified and settled; it is cited by its locator.
- **Elaboration at main's pins.** This review's Lean commands run only at the branch pins. That `Suggested.lean` builds at `2fd255d9`/`1b1ccf4b`, and R01's post-merge form, rest on CI's SUCCESS `build` and the description.
- **α₂₃ of [[4,1],[1,6]] (= 92).** The previous review did not brute-force it, and neither did this one; it is carried from r17.

## Source issues

- none
