# Review of GlobalQuadraticForms (pull request #1215 at 693a416)

**Verdict:** accepted

This is a full review. The folder `TauCetiRoadmap/GlobalQuadraticForms/` has not changed since the previous review, which read the same head. I re-read every passage of `README.md` and `Suggested.lean` against the pinned Mathlib and Tau Ceti, against the cited roadmaps, and against `milne-cft`.

I found no defect, so this report lists no finding.

## Previous findings

- The previous review (`~37`, same head) recorded **no finding**, so there is nothing to repair.
- The repairs it confirmed from earlier rounds still hold at this head:
  - **Conflicting revision #1200.** The description says "#1200 also revises GlobalQuadraticForms. It is rebased onto this revision and keeps only what this head does not already carry". The generated merge-order block reads "`GlobalQuadraticForms`: **this pull request** → #1200". `roadmaps overlaps` still reports the conflict, and the order is stated.
  - **Edit to `Completed/LocalGaloisGroups/Suggested.lean`.** The description still declares it: "That file imports ClassFieldTheory's `Suggested.lean` and uses `cyclotomicCharacter_artinMap`, so it has to follow this revision."
  - **Real-place Check of 4.1.** README lines 559–567 are unchanged. I recomputed them in rows T3–T4 below.

## Verified sound

### Gate, dependency check and elaboration

- **Gate.** The worker's gate at 693a416 reports "Every check passed", including `build=0`.
  - My rerun of `gate … --base origin/main` fails only on `outside-folder=5`.
  - The five files are `TauCetiRoadmap/ClassFieldTheory/{README.md,Suggested.lean}` and `TauCetiRoadmap/QuadraticFormInvariants/{NativeCompletion.md,README.md,Suggested.lean}`, all in folders this brief names as the pull request's own.
  - Every other count is 0, including `set_option`, `sorry-data`, `statement-hygiene`, `imports`, `stray-files`, `readme-ids-missing`, `layer-ids`, `target-ids` and `depcheck`.
- **Dependency check.** The output is exactly `depcheck: 235 roadmaps, 2268 edges, 0 problem(s)`, with no UPWARD, CYCLE or `moved:` line.
  - `origin/main:TauCetiRoadmap/GlobalQuadraticForms/README.md` is a blob, so this roadmap is on main.
  - The README names no roadmap supplier ("There is no roadmap supplier"). Every input is a Mathlib or Tau Ceti declaration.
- **Elaboration.** `lake env lean TauCetiRoadmap/GlobalQuadraticForms/Suggested.lean` exits 0. Its only warnings are 8 × "declaration uses `sorry`", at lines 53, 70, 78, 86, 95, 113, 122 and 135.
- **Signatures.** I appended `#check @…` for all 8 declarations to a scratch copy and elaborated it.
  - The elaborated types are identical, character for character, to `signatures.md`.
  - No section binder is lost. `[FiniteDimensional K V]` and `[FiniteDimensional K W]` appear wherever `V` or `W` occur.
  - `K`, `V` and `W` sit in independent universes `u`, `v` and `w`, as the README's Conventions say.
- **One-tactic probe.** On a scratch copy I replaced each `sorry` with `first | rfl | (simp; done) | infer_instance | decide | exact?`. None of the 8 declarations closes; each ends with "`exact?` could not close the goal". There is no padding.

### Library declarations resolved at the pins

- **Every backticked name.** I put `#check @` on 175 backticked Lean names of the README in a scratch file that imports Mathlib and 69 Tau Ceti modules. The 175 exclude this roadmap's 8 own names and placeholders such as `K_v`. 166 elaborate. The other 9 are unqualified short names used in prose (`IsLocallyIsotropic`, `adicCompletionCongr`, `mem_range_ideleNormMap_iff`, …), and their qualified forms resolve.
- **Mathlib file paths.** All 23 file paths that "From Mathlib" gives exist and contain the named declaration. Examples:
  - `QuadraticMap.Nondegenerate` (`Radical.lean:115`: `radical_eq_bot` and `rank_rad_polar_le`, as the README describes);
  - `equivalent_weightedSumSquares_units_of_nondegenerate'` (`IsometryEquiv.lean:177`, hypothesis `SeparatingLeft`);
  - `injective_iff_map_eq_zero` (additive form of `Algebra/Group/Hom/Basic.lean:181`);
  - `InfinitePlace.comap_embedding_of_isReal`, whose statement is `(w.comap f).embedding = w.embedding.comp f`.
- **Tau Ceti file paths.** All 29 Tau Ceti file paths I spot-checked exist, including `RepresentationTheory/Homological/ContCohomology/Nonabelian/Basic.lean` (`TauCeti.NonabelianH1`).
- **Statements compared with the README's descriptions.** Each of the following matches what the README says of it:
  - `finrank_le_index_range_ideleClassNormMap` takes `(K L : Type)` with `[IsGalois K L] [IsCyclic Gal(L/K)]`;
  - `exists_sq_sub_mul_sq_iff_forall_completion` takes `{K : Type}` and a nonsquare `d`;
  - `ideleClassNormMap_surjective_of_forall_range_normUnits_eq_top` takes `K : Type u_1`, `L : Type u_2` and a finite `S`;
  - `exists_fieldUnit_isSquare_div_at_places`;
  - `exists_hilbertSymbol_eq_ite`, with `b` nonsquare on `S`, negative on `T`, and `#S + #T` even;
  - `exists_pair_hilbertSymbol_eq_ite` and `hilbertSymbol_productFormula`;
  - `IsLocalRealization.exists_locallyRepresents_prod`, whose conclusion contains `∃ Q hQ, Q.globalInvariants hQ = I`;
  - `IsAdmissible.exists_isLocalRealization`, `isAdmissible_ofLocalForms` and `isLocalRealization_ofLocalForms`;
  - `locally_formClass_eq_nsmul_hyperbolicClass_iff`, `globalToLocal` (`WittLocalization.lean:167`) and `globalToLocal_wittClass_formClass`;
  - `wittClass_eq_zero_iff`, `RegularFormClass.add_neg_one_mul` (`x + ⟨-1⟩x = rank • H`) and `RegularFormClass.wittDecomposition`;
  - `not_anisotropic_iff_discr_eq_neg_one_of_finrank_eq_two`, `discr_atFinitePlace` and `exists_apply_ne_zero_locallyRepresentsScalar_neg`;
  - `IsRepresentedBy.exists_equivalent_prod`;
  - `not_anisotropic_of_isLocallyIsotropic_quaternary` (`Quaternary.lean:137`, ternary hypothesis over every `L : Type u`);
  - `not_anisotropic_of_isLocallyIsotropic_of_five_le_finrank` (`HigherRank.lean:87`, induction hypothesis on `presentedForm` over `K`);
  - `exists_anisotropic_and_not_anisotropic_away_from_realPlace` (`DefiniteObstruction.lean:68`, rank `n + 1` with `4 ≤ n`, that is, rank at least five, as the README says);
  - `IsAdmissible` (`Invariants.lean:178`), whose seven fields are exactly the clauses listed at README lines 271–273;
  - `localHasse` (`LocalField/QuadraticForm/Hasse.lean:93`, product over `i < j`).
- **The eight `Type`-only inputs.** Exactly these cited declarations elaborate with `{K : Type}` or `(K : Type)`: the eight the README lists as `Type`-only, plus the worked example `Sqrt5.exists_admissible_rank_three`. The README's "eight" is exact.
- **`Invertible 2` for the Witt ring.** `globalToLocal` has no `Invertible 2` binder: it is declared after `end InfinitePlace`, so the instance comes from `invertibleTwo`, as Conventions says.

### Duplication against the pins

None of the 8 headlines, nor 4.3 or the binary and ternary cases of 5.1, is at the pinned Tau Ceti:
- grep finds no `hasseMinkowski` and no injectivity statement about `globalToLocal`;
- no global square theorem: the nearest is `ideleHilbertCharacter_eq_one_iff`, `IdeleCharacter.lean:202`, a different statement;
- no `LocallyRepresentsScalar` form of the quadratic norm theorem: `HasseNorm/Quadratic.lean` has only the coordinate form;
- no locally-isotropic binary or ternary theorem.

All `library-matches.md` leads are unrelated Mathlib lemmas.

### Cross-roadmap citations and ownership

- **Citations of this roadmap's ids.** Every citation of this roadmap's ids, by roadmaps on main and at the open heads, resolves at this head:
  - ClassFieldTheory §4.2 and §4.3 (this head);
  - IntegralLattices `hasseMinkowski_equivalent`, `equivalent_of_locallyEquivalent` (named in 8.4) and §7.3 (main and #617);
  - GL2AutomorphicRepresentationsAndTransfer and QuaternionArithmetic §4.4 `exists_hilbertSymbol_eq_neg_one_iff_pair` (in the section map);
  - K3Surfaces and K3SurfacesAndSymplecticBoundedness §5.5;
  - LatticePackingsAndPerfectForms §6.1;
  - GeometryOfNumbersAndQuadraticArithmeticPartII §4.4 and §§8.1–8.3;
  - Layers 3–8 as cited by MetaplecticAutomorphicForms, AdelicAlgebraicGroups and GeometryOfNumbersAndQuadraticArithmetic;
  - ClassicalArithmeticCompletion's Layer 4 anchor (heading unchanged; its symbol and product formula are in the section map).
- **Dropped Lean names.** Lean names that main's `Suggested.lean` declared and this head drops are not cited anywhere, except `exists_hilbertSymbol_eq_neg_one_iff_pair`, which the section map resolves. I checked these names: `isSquare_of_isSquare_unitAtFinitePlace`, `globalInvariants_isAdmissible`, `hilbertSymbol_localized_productFormula`, `finite_hilbertSymbol_ne_one`, `localHasse_pair`, `discr_correctionPlanes` and `equivalent_of_globalInvariants_eq`.
- **Downstream consumers.**
  - "Orthogonal and Spin Groups consumes 4.3 and 6.1" is true of its open revision #1181. Its README lines 83–84 and 350 cite 4.3 and 6.1, with anchors that exist here, though `Completed/OrthogonalSpinGroups/README.md` on main does not.
  - The Orthogonal Tamagawa bullet matches main's `Completed/OrthogonalSpinGroups/README.md` lines 925–966.
- **Ownership.** A search for Hasse–Minkowski, the global square theorem, global-to-local Witt maps and 72:1 finds no second owner:
  - QuadraticFormInvariants at this head (README lines 90–93) and ClassFieldTheory (line 203) assign Hasse–Minkowski to this roadmap;
  - QuadraticFormInvariantsPartII (#1834) states none of these;
  - GeometryOfNumbersAndQuadraticArithmeticPartII (#1691) consumes §§8.1–8.3.

  No `Suggested.lean` elsewhere declares a `TauCetiRoadmap.GlobalQuadraticForms.*` name, apart from #1200, which revises this same folder.
- **Edit outside the folders.**
  - `Completed/LocalGaloisGroups/Suggested.lean` (62+/50−) is outside the folders this brief names. The pull request lists it among its folders, the gate does not flag it, and the description declares it.
  - The edit is forced: `artinMap`, `kummerEquiv_mixed` and `h2FpEquivZMod_of_mu` are declared in main's ClassFieldTheory `Suggested.lean` (2, 1 and 1 matches) and in none at this head.
  - No repair is open, so I raise no finding. I did not build that file, since that command is outside this brief.

### Headline theorems

- **Stated in `Suggested.lean`:** 4.2, 5.5, 6.1, 6.2, 6.3, 7.3, 8.1 and 8.3. The four end theorems of the Summary are among them.
- **Not stated separately:** 8.4, the reverse direction of 6.3, is named as such in the docstring. 8.2 is a corollary of 6.3 in its form version, and its Witt-class version is 8.3. The docstring does not name it, but the Summary does not list it among the end theorems either. This is a remark; no change is asked.

### Sources: seeded sample

All `milne-cft` locators are correct. The printed page equals the PDF page minus 9.

| # | README claim | `milne-cft` | Page | Statement supports the target |
|---|---|---|---|---|
| L1 | 4.2: Thm 1.1 with `n = 2`, p. 229 | line 10384 (footer `229` at 10411) | 229 ✓ | Needs a primitive `n`-th root of 1, which is `-1` for `n = 2`; "all but finitely many primes" ✓ |
| L2 | 4.2 Check: Ex. 1.3, p. 229 | line 10397 | 229 ✓ | `16` is an 8th power in `ℝ` and in `ℚ_p` for odd `p`, not in `ℚ` ✓ |
| L3 | 4.3, 5.1: Thm 3.1, p. 234 | line 10629 (head `234` at 10604) | 234 ✓ | Cyclic `L/K`; local norm everywhere implies global norm ✓ |
| L4 | References: Thm 3.5, p. 235 | line 10686 | 235 ✓ | (b) for nondegenerate forms ✓ |
| L5 | 5.1: Prop. 3.7(b),(c), p. 236 | line 10698 (head `236` at 10693) | 236 ✓ | (b) squares, (c) norms from `k[√a]` ✓ |
| L6 | 5.1: proof of 3.5(b), p. 237 | lines 10772–10778 | 237 ✓ | `n = 2` via 3.7(b) and Thm 1.1 ✓. For `n = 3` the source names Thm 1.1 where Thm 3.1 is meant; the README correctly cites 3.1 (see Source issues) |
| L7 | 8.2: Prop. 6.2, p. 251 | line 11574 | 251 ✓ | Isometric nondegenerate subspaces have isometric complements ✓ |
| L8 | 6.3, 7.4, 8.2–8.4: Thm 6.3, p. 252 | line 11619 (head `252` at 11607) | 252 ✓ | Local equivalence everywhere implies equivalence, for all forms. The README restricts to regular forms, its standing convention; the proof reduces to them ("we may suppose … nondegenerate") |
| L9 | 7.2, 7.4: Thm 6.10, Prop. 6.11, p. 255 | lines 11745, 11758 | 255 ✓ | Classification by `(n, d, S)`; the only constraints are `n = 1` and `n = 2` with `d = -1` ✓ |
| L10 | 7.2: real remarks before Thm 6.12, p. 256 | lines 11781–11790 (head `256` at 11780) | 256 ✓ | `d` and `S` determine `t` only in rank at most three ✓ |
| L11 | 7.4: `S = ε·(-1, d)` | Remark 6.6, line 11677 | 253 | Same factor on both sides at equal rank and discriminant ✓ |

Further certified support for sampled targets that cite only the uncertified O'Meara:
- 6.1 is Milne Cor. 3.6 (`milne-cft` line 10694, p. 236), for `c ∈ Kˣ` and nondegenerate `q`.
- 4.1, item 3 (71:19a) has the hypotheses of Milne Lemma 6.13 (`milne-cft` line 11812, p. 256): `T` even, `b` a nonsquare at each place of `T`.
- 7.3's `IsAdmissible` matches Milne Thm 6.12 as restated (`milne-cft` lines 11799–11807, p. 256) after the conversion `ε = S·(-1, d)`; see row X4.

### Adversarial table

Every row was computed for this report. "Both" means the two sides of the iff or of the implication.

| # | Statement | Instance | Values computed (left / right) | Result |
|---|---|---|---|---|
| C1 | Plain vs signed discriminant | `H = ⟨1,-1⟩`, `⟨1,1⟩` | plain `[-1]`, `[1]`; signed `(-1)^1·d` gives `[1]`, `[-1]` | Conventions distinguished |
| C2 | Hasse convention `i < j` | `H` over `ℝ` | `i<j`: `(1,-1) = 1`; `i≤j`: `(1,1)(1,-1)(-1,-1) = -1` | Distinguished |
| C3 | Real Hasse sign `(-1)^C(q,2)` | `q = 0…4` | `1, 1, -1, -1, 1`; with `d = [1]`, signatures `(4,0)` and `(0,4)` both give `1` | Rank-four non-determination ✓ |
| C4 | Symbol `(-1,3)` over `ℚ` | `ℚ₃`, `ℚ₂`, `ℝ` | `(-1/3) = -1`; `ε(-1)ε(3) = 1`, so `-1`; `ℝ`: `1` | Two places, even ✓ |
| C5 | Zero record | Zero form | rank `0`, `d = [1]`, `s = 1`, `p = 0`; `one_le_rank` fails | Realized, not admissible ✓ |
| T1 | 4.1 finite places | `ℚ(i)`, `σ` conjugation, `2+i` | mod `(2-i)`: `i ↦ 2`, `2+i ↦ 4 = 2²` in `𝔽₅`; `v_(2+i)(2+i) = 1`; `σ(2+i) = 2-i ↦ 4` mod `(2+i)` | Correspondence follows `σ` ✓ |
| T2 | 4.1 local forms | `⟨1,-(2+i)⟩` at `(2-i)` | isotropic; image `⟨1,-(2-i)⟩` at `(2+i)` isotropic; same coefficients at `(2-i)`: `v = 1`, anisotropic | Lands at `σv` ✓ |
| T3 | 4.1 real places | `ℚ(√5)`, `σθ = 1-θ`, `w'`: `θ ↦ 1.618` | embedding of `w'.comap σ`: `θ ↦ 1 - 1.618 = -0.618`; absolute value `0.618` | The other real place ✓ |
| T4 | 4.1 indices | `Q = ⟨1,θ,θ⟩` | `σQ = ⟨1,1-θ,1-θ⟩` at `w'`: `1`; `Q` at `w'.comap σ`: `1`; `Q` at `w'`: `3` | Follows `σ` ✓ |
| T5 | 4.1 (71:19a) | `ℚ`, `b = -1`, `S = {3}`, `T = {∞}`, `a = -3` | `ℝ`: `-1`; `3`: `(-1/3) = -1`; `2`: `-3 ≡ 1 mod 4`, so `1`; product `1` | Holds ✓ |
| T6 | 4.1 (71:19a), negative | `S = {5}` | `-1 = 2²` in `ℚ₅`, so `(a,-1)_5 = 1` for every `a` | Nonsquare hypothesis needed ✓ |
| T7 | 4.1 (71:19) | `S = {2}`, `T = {∞}`; then `S = {3}`, `T = ∅` | `(-1,-1) = -1` exactly at `2` and `∞`; odd count is excluded by the product formula | Parity needed ✓ |
| G1 | 4.2 (Lean, line 53) | `ℚ`, `a = 4`, `S = ∅` | `2² = 4` locally and globally | Both true |
| G2 | 4.2 | `ℚ`, `a = -1` | nonsquare at every `p ≡ 3 mod 4`, so no finite `S` works | Hypothesis fails, conclusion fails ✓ |
| G3 | 4.2 | `ℚ(√5)`, `a = θ`, norm `-1` | above `11`: `√5 ≡ 4` gives `θ ≡ 30 ≡ 8` (nonsquare mod 11); `√5 ≡ 7` gives `θ ≡ 4` (square); `θ < 0` at one real place | Infinitely many nonsquare places, as 4.2 forces ✓ |
| G4 | 4.2, exponent | `16`, 8th powers | `x⁸-16 = (x²-2)(x²+2)(x²+2x+2)(x²-2x+2)`; `v₂(16) = 4` | 8th-power analogue false, exceptional set `{2}` ✓ |
| G5 | 4.2 route | `E = K(√a)` | surjective norm gives index `1`; `2 ≤ 1` is false | Contradiction ✓ |
| G6 | Cyclic hypothesis | `ℚ(∛2, ζ₃)` | `Gal = S₃`, abelianization of order `2`; index `2 < 6` | Needed ✓ |
| H1 | 4.3 | `d = -1`, `a = 5` | `1² + 2²` | Both true |
| H2 | 4.3 | `d = -1`, `a = 3` | `(-1,3)_3 = -1` | Both false |
| H3 | 4.3 | `d = 5`, `a = 2` | `(5,2)_5 = (2/5) = -1` | Both false |
| H4 | 4.3, real clause | `d = 2`, `a = -1`; `d = -1`, `a = -1` | `1 - 2 = -1`; `x² + y² = -1` has no real solution | Real clause genuine ✓ |
| B1 | 5.1 binary | `⟨1,-2⟩` | `-det = 2`, nonsquare in `ℚ₃` | Both false |
| B2 | 5.1 binary | `⟨2,-8⟩` | `-det = 16 = 4²`; `2·2² - 8 = 0` | Both true |
| B3 | 5.1 ternary | `⟨1,1,-2⟩` | `d = -1`, `a = 2 = 1² + 1²` | Both true |
| B4 | 5.1 ternary | `⟨1,-2,-3⟩` | `d = 2`, `a = 3`; `(2,3)_3 = (2/3) = -1`; descent mod 3 | Both false |
| B5 | 5.1 Check | `⟨1,1,1⟩` | anisotropic exactly where `(-1,-1) = -1`: `2`, `∞` | Even ✓ |
| I1 | 5.5 (Lean, line 70) | Rank 0 | `Anisotropic` holds (only `x = 0`); localizations are on zero spaces | Both false |
| I2 | 5.5 | `⟨a⟩`, `a ≠ 0` | anisotropic over every field | Both false |
| I3 | 5.5 | `⟨1,1,1,-7⟩` | `7 ≡ -1 mod 8` is not a sum of three squares in `ℚ₂` | Both false |
| I4 | 5.5 | `⟨1,1,1,1,1⟩` | definite at `ℝ`; isotropic at every `p` | Both false; Tau Ceti witness has rank `n + 1 ≥ 5` ✓ |
| I5 | 5.5, `hQ` | `⟨1,0⟩` | radical vector `(0,1)` | Not regular; both true; `hQ` is used by the route ✓ |
| I6 | 5.5 route | `U = ⟨1,1⟩`, `W = ⟨1,-1,1⟩` | `x = 0` gives `b = 0`; `x = (1,0)` gives `b = 1`, `W(0,1,0) = -1` | `U(x) ≠ 0` needed ✓ |
| R1 | 6.1 (Lean, line 78) | `⟨1,1⟩`, `a = 3` | `(-1,3)_3 = -1` | Both false |
| R2 | 6.1 | `⟨1,1⟩`, `a = -1` | `(-1,-1)_2 = -1`; fails at `ℝ` | Both false |
| R3 | 6.1 | `⟨1,2⟩`, `a = 3` | `1 + 2·1 = 3` | Both true |
| R4 | 6.1 | Zero space, `a ≠ 0` | `Q 0 = 0 ≠ a` | Both false |
| P1 | 6.2 (Lean, line 86) | `⟨1,1⟩` into `⟨1,1,1,1⟩` | inclusion of the first two coordinates | Both true |
| P2 | 6.2 | `⟨3⟩` into `⟨1,1⟩` | obstruction at `ℚ₃` | Both false |
| P3 | 6.2 Check | `⟨c⟩` into `H` | `((1+c)² - (1-c)²)/4 = c` | Both true |
| P4 | 6.2 | Zero form into any `R` | zero map, injective | Both true |
| P5 | 6.2 | `rank Q > rank R` | no injective linear map | Both false |
| E1 | 6.3 (Lean, line 95) | `⟨1,1,-3⟩` vs `⟨1,1,-1⟩` | `[-3] ≠ [-1]`; isotropy at `ℚ₃` differs | Both false |
| E2 | 6.3 | `⟨1,1⟩` vs `⟨5,5⟩` | `5 = 1² + 2²`; `(5,-1)_5 = (-1/5) = 1`; `5 ≡ 1 mod 4` | Both true |
| E3 | 6.3 | `⟨1⟩` vs `⟨-1⟩` | signatures `(1,0)`, `(0,1)` | Both false |
| X1 | 7.2 | `ℚ`, rank 3, `d = [1]`, `R = ⟨1,1,1⟩`, `s_2 = -1` | product `(-1)·1 = -1` | Hypotheses fail ✓ |
| X2 | 7.2 | `⟨-1,-1,-1⟩` | `s_2 = (-1,-1)³ = -1`; real `(-1)^3 = -1`; product `1` | Realizes itself ✓ |
| X3 | 7.2, correction planes | `P = ⟨1,-b⟩`, `P' = ⟨a,-ab⟩` | `d`: `-b`, `-a²b ≡ -b`; `s`: `1`, `(a,-a)(a,b) = (a,b)` | Flips exactly where `(a,b) = -1` ✓ |
| X4 | 7.2/7.3 vs Milne Thm 6.12 | `ε = S·(-1,d)` | `n = 1`: `ε = 1`; `n = 2`, `d = -1`: `ε = (-1,-1)² = 1`; real: `(-1)^(t(t+1)/2 + t) = (-1)^C(t,2)` | Equal to `IsAdmissible` ✓ |
| A1 | 7.3 (Lean, line 113) | Record of `⟨1⟩` | `(1,[1],1,1)` | Admissible, realized |
| A2 | 7.3 | `ℚ`, `(2,[1],s_2 = -1,p = 0)` | real `d = 2•[-1] = [1]`; real Hasse `-1`; product `1`; `d_2 = [1] ≠ [-1]` | Admissible; `⟨-1,-1⟩` realizes it ✓ |
| A3 | 7.3 | Rank-0 record | `one_le_rank` fails | Excluded ✓ |
| A4 | 7.3 | Rank 1, `s = -1` at two places | product `1`; rank-one clause fails | Not admissible ✓ |
| A5 | 7.3 | Rank 2, `d = [-1]`, `s = -1` at two places | rank-two clause fails | Not admissible ✓ |
| A6 | 7.3 worked example | `ℚ(√5)`, `⟨1,θ,θ⟩` | `d = θ² = [1]`; `s_(2) = (θ,-1)_(2) = -1` by the product formula (real: `1`, `-1`); `p = 3, 1`; product `(-1)·1·(-1) = 1` | Admissible ✓ |
| U1 | 7.4/8.1 (Lean, line 122) | `⟨1,1,-1⟩` vs `⟨1,2,-2⟩` | `d = [-1] = [-4]`; `s = 1`, `(2,-2) = 1`; `p = 2` | Equal records, isometric ✓ |
| U2 | 8.1 | `⟨1,1⟩` vs `⟨2,2⟩` | `2 = 2² - 2·1²`; `(x+y)² + (x-y)² = 2x² + 2y²` | Equal records, isometric ✓ |
| U3 | 8.1 | Two zero forms; zero form vs `⟨1⟩` | ranks `0, 0`; `0 ≠ 1` | Both directions ✓ |
| W1 | 8.2 | `⟨1,-1,2,-2⟩` | `d = [4] = 2•[-1]`; `s = (-1,2)(-1,-2) = (-1,-1) = (-1,-1)^C(2,2)`; `p = 2` | Locally, hence globally, hyperbolic ✓ |
| W2 | 8.2, negative | `⟨1,1,-3,-3⟩` | `d = [9] = 2•[-1]`, yet `s = (-3,-1)`: at `3` it is `-1`, against `(-1,-1)_3 = 1` | Not hyperbolic ✓ |
| W3 | 8.2 Check | `⟨1,1⟩` | `[1] ≠ [-1]`; anisotropic at `ℝ` | Not hyperbolic ✓ |
| K1 | 8.3 (Lean, line 135) | `⟨1,1⟩` | real component has signature `2` | Nonzero image ✓ |
| K2 | 8.3 | `⟨1⟩` | odd dimension | Nonzero at every finite `v` ✓ |
| K3 | 8.3 Example | `⟨1,1,-3⟩ ⊥ ⟨-1,-1,1⟩` | the two ternary forms are not isometric at `ℚ₃` | Nonzero ✓ |
| K4 | 8.3, complex places | `W(ℂ) = ℤ/2` | a zero finite component forces even dimension | Nothing added ✓ |
| Q1 | 8.4 | Reverse of 6.3 | Milne Thm 6.3 (L8); IntegralLattices cites it as `equivalent_of_locallyEquivalent` (main README line 477) | Consistent ✓ |

## Not verifiable

- **O'Meara**, *Introduction to Quadratic Forms* (`omeara`) is settled as uncertified (paywalled). Its numbers 58:7, 65:15, 66:1, 66:3, 66:4, 66:5, 71:19, 71:19a and 72:1 could not be read. Certified Milne locators confirm the statements of 4.2, 4.3, 5.1, 6.1, 6.3, 7.2–7.4 and 8.1–8.4, and the hypotheses of 71:19a (Lemma 6.13).
- **Serre**, *A Course in Arithmetic* (`serre`) is settled as uncertified. Its four locators in References, including Ch. III §2.2 Theorem 3 for the product formula over `ℚ`, could not be checked. It is cited only as a companion source.
- **`Completed/LocalGaloisGroups/Suggested.lean`** was not built, because that command is outside this brief.

## Source issues

- **Misprint** in milne-cft at VIII, proof of Theorem 3.5(b), p. 237: the source says the cases of three and four variables follow from Proposition 3.7(c),(d) and Theorem 1.1 (local nth powers); it should be Theorem 3.1, the Hasse norm theorem, since 3.7(c),(d) reduce isotropy to norms; affects the proof.
- **Misprint** in milne-cft at VIII, proof of Theorem 3.5(b), p. 237: the induction hypothesis for five or more variables is called Theorem 3.1b; it should be Theorem 3.5(b) in one variable fewer; affects nothing.
- **Misprint** in milne-cft at VIII, remarks before Theorem 6.12, p. 256: the rank of a real form is written r, the letter p. 252 uses for the positive index ("determine t when r ≤ 3", "0 ≤ t ≤ r"); it should be the rank n; affects nothing.
