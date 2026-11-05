# Review of BorelRegulators (pull request #1461 at 44ba194)

**Verdict:** accepted

Incremental re-review of the 21 lines changed since 0faed68 (the head the previous review read): the MotivicEtaleKTheory supplier subsection, the From Tau Ceti paragraph, §3.2 and `exists_divisionAlgebra_split_at_infinity`. The gate passes on my own run, the dependency check reports no problem, the changed statement elaborates and is not padding, and the two repairs are correct. No principle is violated by the change: no shortcut, no re-planned roadmap, no upward or cyclic supply, no copied passage, no algorithm, no sorry'd data, no `set_option`, no edit outside the folder. One P3 of the previous report remains open because its repair lives in the package manifest, which this pull request does not carry.

## R01 (P3) — borel1980 is cited with line locators but has no manifest entry

Location: `TauCetiRoadmap/BorelRegulators/README.md` lines 27, 508, 572, 601 (locators of the form "borel1980 line 29–43") and the References entry at line 859; `packages/BorelRegulators/sources.toml`.

Claim: every cited work is recorded in the manifest.

Witness: `packages/BorelRegulators/sources.toml` has seven entries (weil1961, borel1977, borel1974, burgos2002, beilinson1985, poonen2017, deligne_goncharov2005) and none with id borel1980 or the Numdam item ASNSP_1980_4_7_2_373_0. The pull request's diff outside the roadmap folder is empty, so nothing at this head could have added it.

Repair (unchanged from the previous report, its R02): record borel1980 at the package through the sources service, `sources fetch --id borel1980 --locator-scheme page --locator "p.373, items 1–3" --cited-for "Conventions, 4.3, 4.6, 5.1" "https://www.numdam.org/item/ASNSP_1980_4_7_2_373_0/"`. The README does not change. Author's and operator's choice; it does not block.

## Previous findings

- R01 — repaired: the MotivicEtaleKTheory subsection now ends "The contract gap:universal-deligne … is met by §§3.3–3.4 and 7.1 there together with §§6.0a and 6.1 here … The contract gap:infinitesimal-classifying-comparison … is owned by §6.0b here and asks nothing of MotivicEtaleKTheory." Each claim checked: §6.0a states the calibration against CharacteristicClasses C6, the conjugation compatibility, the finite-étale Deligne trace with its transfer law and the Adams intertwining ψᵃ ↔ aⁿ (its fourth interface bullet); §6.1 assembles the embeddingwise model Dₙ(F) with restriction and trace equal to R and T of §1.2; §6.0b defines B⁽¹⁾·G and the three comparisons with CE*, W and CE*(·,ℝ(n−1)). MotivicEtaleKTheory at head 1470 has §§3.3 (line 397), 3.4 (420), 4.1 (452), 4.2 (473), 7.1 (650), 7.4 (701), and its consumer line 731 assigns exactly the calibration, conjugation/transfer interfaces, infinitesimal comparison and arithmetic theorems to BorelRegulators. The sentence asks nothing new of the supplier, so no `What MotivicEtaleKTheory must provide` line is needed and the two plan slugs are now documented as discharged. No new problem introduced.
- R02 — not repaired: the manifest is on the board package, not in this pull request; carried as R01 above (P3, non-blocking).
- R03 — repaired: the Lean statement now reads "Module.finrank F D = a ^ 2 ∧ (∀ σ : F →+* ℝ, letI : Algebra F ℝ := σ.toAlgebra TauCeti.Algebra.IsSplittingField F D ℝ)"; the docstring and §3.2 explain the omission, citing `TauCeti.Algebra.isSplittingField_of_isSepClosed`, and §3.2 gains two Checks. The new citation resolves (below) and the elaborated type matches `scratch/signatures.md`. No new problem introduced.

## Verified sound

**Gate and build.** Rerun by me at 44ba194: every scanner 0, `depcheck=0`, `stray-files=0`, `outside-folder=0`, build OK. Dependency check run separately: `depcheck: 204 roadmaps, 1392 edges, 0 problem(s)`, no UPWARD or CYCLE line. BorelRegulators is at line 277 of the merge order; the suppliers the changed passages name are earlier (ArithmeticKTheory 120, MotivicEtaleKTheory 121) or on main (ClassFieldTheory, SemisimpleAlgebras). `git diff --stat origin/main...HEAD` outside the folder is empty; the folder holds only `README.md`, `Suggested.lean`, `metadata.toml`.

**Elaboration and probe.** `lake env lean` on a scratch copy of `Suggested.lean` extended with `#check @` for all four declarations and the new Tau Ceti lemma: four `declaration uses sorry` warnings and nothing else from the roadmap's own declarations; the four elaborated types agree with `scratch/signatures.md` and with README §§1.3, 3.1, 3.2, 5.1 (hypotheses `NumberField F`, `2 ≤ n`, `Even n`, `IsTotallyReal F`, `1 ≤ a`; no section binder lost). One-tactic probes on the changed theorem: `simp` leaves the goal unsolved (it only reorders the conjuncts), `infer_instance` fails ("type class instance expected"), `exact?` finds only the file's own sorried declaration. `simp` makes no progress on `period_eq_index` and `exists_pos_rat_dedekindZeta_of_isTotallyReal`; `dedekindZeta_continuation_leadingTerm` is unchanged and was decided by reading in the previous report. Nothing is padding. Two control examples: the complex-embedding clause closes with `exact TauCeti.Algebra.isSplittingField_of_isSepClosed F D ℂ` for an arbitrary central division F-algebra D (so the deleted conjunct was indeed automatic at the pin), and the same tactic for ℝ fails with `failed to synthesize IsSepClosed ℝ` (so the kept clause is the one that carries content).

**Library declarations opened at the pins** (Mathlib 6b7abb3c, Tau Ceti a91d3aa): `TauCeti.Algebra.isSplittingField_of_isSepClosed` at TauCeti/Algebra/CentralSimple/Splitting.lean:244, in the section whose variables (line 213) are `[Algebra.IsCentral K A] [IsSimpleRing A] [FiniteDimensional K A]`, with the extra `[IsSepClosed L]`; the README's "a separably closed extension splits every finite-dimensional central simple algebra" is its exact content. `TauCeti.Algebra.IsSplittingField` Splitting.lean:120 (existential matrix size). Mathlib `IsSepClosed.of_isAlgClosed` FieldTheory/IsSepClosed.lean:69 and `Complex.isAlgClosed` Analysis/Complex/Polynomial/Basic.lean:52 give `IsSepClosed ℂ`; `DivisionRing.isSimpleRing` RingTheory/SimpleRing/Basic.lean:51 supplies the simplicity of the existential D. The unchanged declarations of the previous report (28 Mathlib, 15 Tau Ceti) were not reopened.

**Cross-roadmap citations resolved** (the ones the diff touches or that the new sentence names): MotivicEtaleKTheory §§3.3, 3.4, 4.1, 4.2, 7.1, 7.4 at head 1470 and its BorelRegulators consumer line (README line 731); §§6.0a, 6.0b, 6.1 of this README (lines 724, 753, 772) with the content the sentence attributes to them; §3.1 (line 320) and ClassFieldTheory Layer 10 as named by the §3.2 `*Needs:*` line, unchanged from the previous round. The worker's citation check found nothing unresolved and I found nothing.

**Sources at the locators of the changed target.** borel1977 Lemma 2.2, lines 177–195: a central division algebra of dimension n² trivial at infinity for every n > 1, built from n ultrametric places with invariant 1/n each; the README's a ≥ 1 adds the trivial case D = F and chooses two places with ±1/a, an equivalent realization by the same exact sequence. poonen2017 Theorem 1.5.36(i) and (iv), lines 1402–1446 (exact global Brauer sequence; period = index with the Grunwald–Wang local degrees n at nonarchimedean and 2 at real places). The sampled targets 1.1, 1.2, 2.1, 2.2, 3.3, 4.2, 4.4–4.6, 5.1, 5.2, 5.4, 5.5, 6.0a, 6.3 are untouched by the diff; their locators were verified in the previous report and only the §6.0a Burgos locators the disposition sentence relies on were re-opened: burgos2002 lines 3897–3904 (the r−f cone (10.2)–(10.3)) and 4081–4106 (Definitions 10.7–10.8).

**Gaps.** The ten plan slugs: eight are stated as `What <Supplier> must provide (gap:…)` lines (README lines 81, 95, 97, 107, 117, 131, 133, 135), precise and with named suppliers; the two MotivicEtaleKTheory slugs are now stated as discharged (line 159), which matches the supplier's own consumer line. None has supplier `none`.

**Adversarial table.** Rows for untouched statements are carried from the previous report (marked "prev"); new rows carry values computed this round.

| Statement | Instance | Left side | Right side | Result |
|---|---|---|---|---|
| §3.2 / Lean `exists_divisionAlgebra_split_at_infinity` (changed) | a=1 | D=F, finrank 1 = 1² | ℝ⊗_σF = M₁(ℝ) for each real σ | holds; a=0 excluded (no division ring of finrank 0) |
| same | F=ℚ, a=2, D=(−1,3)/ℚ | Hilbert symbols (−1,3)₂=−1, (−1,3)₃=(−1/3)=−1, (−1,3)_∞=+1 | division of dimension 4, ℝ⊗D ≅ M₂(ℝ) | holds |
| same, real clause discriminates | F=ℚ, a=2, Hamilton D=(−1,−1)/ℚ | (−1,−1)_∞=−1, ℝ⊗D=ℍ | not M₂(ℝ) | fails the kept clause, as the new Check says |
| same, deleted ℂ clause vacuous | Hamilton D, σ:ℚ→ℂ | ℂ⊗D ≅ M₂(ℂ) | lemma at Splitting.lean:244 closes it for every central simple D (probe) | the deletion loses nothing |
| same, division clause discriminates | F=ℚ, a=2, D=M₂(ℚ) | finrank 4 = 2², split at ℝ | not a division ring | excluded by `DivisionRing D` |
| same, no real place | F=ℚ(i), a=3 | real clause empty (r₁=0) | invariants 1/3 at (1+i), −1/3 at (3) (3 inert), sum 0 | central division algebra of dimension 9 exists; statement non-vacuous |
| same, hypotheses in scope | elaborated type | `[NumberField F]`, `1 ≤ a` present | matches README "number field F and natural a≥1" | agree (`#check`) |
| §3.2 Check "complex-embedding condition distinguishes nothing" | any central simple D over F | `IsSepClosed ℂ` via `IsAlgClosed ℂ` | lemma hypotheses IsCentral, IsSimpleRing, FiniteDimensional satisfied by a central division algebra | Check true |
| Supplier line 159 disposition | gap:universal-deligne components | character on actual K-groups: MEK §7.1; descent, disjoint unions: MEK §§3.3–3.4; conjugation, transfer, Adams: §6.0a bullets 1, 3, 4; embeddingwise map: §6.1 | MEK line 731 assigns the same split | consistent; nothing new asked of the supplier |
| same | gap:infinitesimal-classifying-comparison | §6.0b defines B⁽¹⁾·G and the three comparisons | MEK line 731: "infinitesimal comparison … remain there" | consistent |
| §1.3 / Lean `dedekindZeta_continuation_leadingTerm` (prev) | F=ℚ, n=2 / 3 / 4 | c = −1/12 / −ζ(3)/(4π²) / 1/120 | q = −1/2 / −1/4 / 3/4 | holds |
| same, general exponent (prev) | n odd / n even | r₁+r₂−Nn / r₂−Nn | d_n−Nn | agree |
| same, order (prev) | n=1 | order r₁+r₂−1 | formula r₁+r₂ | `2 ≤ n` needed and present |
| §5.1 / Lean `exists_pos_rat_dedekindZeta_of_isTotallyReal` (prev) | ℚ(√5), n=2; ℚ n=2,4 | √5·ζ_F(2)/π⁴ = 2/75; 1/6, 1/90 | positive rationals | holds |
| same, negative controls (prev) | ℚ(i) n=2; ℚ n=3 | π²G/6; ζ(3)/π³ | not rational·π^(nN) | `IsTotallyReal`, `Even n` needed and present |
| §3.1 / Lean `period_eq_index` (prev) | trivial class; (1/2,1/2); (1/3,−1/3) | period 1, 2, 3 | index 1, 2, 3 | holds |
| §1.1 d_n and divided coordinates (prev) | ℚ, ℚ(i), ℚ(√5), n=2,3 | 0,1 / 1,1 / 0,2; v(conj σ)=(−1)^(n−1)v(σ) | r₂, r₁+r₂ | agree |
| Conventions δ_F (prev) | ℤ[i] | det[[1,i],[1,−i]] = −2i | square −4 = disc | agree |
| §4.3–§4.5 (prev) | ℚ(i) n=2; (N,j)=(1,1),(1,2),(2,1); K=SO_a^(r₁)×SU_a^(r₂) | δ^(−3) = −i/8; dims 3,8,6, factors 2,9,4; Prim ranks r₁[n even]+r₂ | 4^(−3/2); N−d_n | agree |
| §2.3, §3.5, §3.6 (prev) | q=5 a=22,21; q=2 a=2,3; ℚ(√5) a=2 | 21>20, 20=20; 3/4, 21/32; 5^(3/2) | boundary; (1−2⁻²), (3/4)(7/8); Check | agree |
| §5.2, §5.4 (prev) | ℚ n=3,5; ℚ n=2 | 4π, 2π; R=1 vs ζ*(−1)=−1/12 | 2^(r₁) iff n≡3 mod 4; q=−12 | agree |
| §6.0a–§6.3 (prev) | P₁(1)=0, P₁(i)=i, P₂(1)=1; S∘d_B=d_M∘S; r_Bo=−2r_Be^shared; CE dims 1,1,0 / 1,2,1; Adams 8, 64, 1 | kernel ℝ(n); chain map; (−2)^(d_n); a^(n d_n) | agree |
| §3.1 Check ℚ(ζ₃₂)⁺ (prev) | (ℤ/32)ˣ/{±1} ≅ ℤ/8, 15=31·17 | local degree 8 at 2 | Frob₃₁ = −1 trivial | agree |

**Ownership.** Unchanged objects; the previous report's grep over the open heads stands. No open pull request or roadmap on main states the division-algebra existence theorem in the real-embedding form, and no second `Suggested.lean` declares `exists_divisionAlgebra_split_at_infinity` (worker's citation index of 2026-10-30, 424 open pull requests).

## Not verifiable

- borel1980 item 3 and borel1977's displayed formulas: as in the previous report (OCR gaps); not touched by this change.
- weil1961 (waived) and beilinson1985 (uncertified) are cited by locator only, as the manifest settles.

## Source issues

- none new this round (the previous report's borel1977/borel1980 erratum entry stands).
