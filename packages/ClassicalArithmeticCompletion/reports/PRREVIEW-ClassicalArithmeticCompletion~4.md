# Review of ClassicalArithmeticCompletion (pull request #1409 at 121997a)

**Verdict:** needs changes

🤖 Independent AI review. Incremental re-review of 59 changed lines since b5ee574. The merge with main moved the pins to Mathlib `1b1ccf4b` / Tau Ceti `2fd255d9`, and the repair commit repointed the library citations accordingly; every repointed name was opened at the new pin and is right. The previous P3 is repaired. What remains is the gate (the module-system header and three hygiene hits), one supplier contract whose ids the open #617 head drops and whose named declaration is not a pinned one, and three overlap facts. This verdict means the folder is not yet ready for a human's final approval; the AI never approves or merges.

## R01 (P3) — `Suggested.lean` is not in module form at the pinned Mathlib, so the gate's build fails

**Location:** `TauCetiRoadmap/ClassicalArithmeticCompletion/Suggested.lean:1–4`: “import Mathlib / import TauCeti.Algebra.AlgebraicGroup.FunctorOfPoints / …”.

**Claim:** At Mathlib `1b1ccf4b` and Tau Ceti `2fd255d9` every imported file is a module-system file (`FunctorOfPoints.lean:6` and `Mathlib/NumberTheory/FundamentalDiscriminant.lean` begin with `module`). Lake then warns “imports `Mathlib` from package `mathlib`, which is designed for use with the module system”, and the worker's gate counts the warning: `build=2 FAIL`. The file itself elaborates (my `lake env lean` run: exit 0, 45 `sorry` warnings, no error), so this is a header, not a statement, defect; but the gate cannot pass without it and no acceptance is possible while it fails.

**Witness:** `scratch/gate.md` lines 15–16, both naming this file; the same warning repaired at `TauCetiRoadmap/CoboundaryExpansion/Suggested.lean` and in SemisimpleAlgebras #989 (7a39a1dd) by the header below.

**Exact repair:** Replace lines 1–4 by `module`, a blank line, `public import Mathlib`, `public import TauCeti.Algebra.AlgebraicGroup.FunctorOfPoints`, `public import TauCeti.Algebra.AlgebraicGroup.SimplyConnected.Basic`, `public import TauCeti.NumberTheory.NumberField.Global.Adeles.LocallyCompact`; keep the module docstring; put `@[expose] public section` before `namespace TauCetiRoadmap.ClassicalArithmeticCompletion`. The `@[expose]` form is the one to use here because `HasStrongApproximation` and `Points` are `def`s unfolded by later statements. Rebuild and confirm with a scratch importer (`#check @TauCetiRoadmap.ClassicalArithmeticCompletion.Approximation.strongApproximation`) that the theorems stay public.

## R02 (P2) — The LocalFieldsRamification supplier contract cites ids that the open #617 head drops, and names a declaration that is not at the pin

**Location:** `TauCetiRoadmap/ClassicalArithmeticCompletion/README.md:167` and `:175`: “From TauCetiRoadmap.LocalFieldsRamification, layer 2 unramified extensions and frobenius … `#layer-2-unramified-extensions-and-frobenius`”, “layer 3 ramification the tame and wild cases and the filtration”; `:169`: “surjectivity of the norm on integer units `(map_norm_unitFiltration_zero)`”; the same two anchors repeated at `:13784, 14246, 14338, 14792, 15113, 15140, 15161, 15339, 15971, 16653, 16851` and “LocalFieldsRamification Layer 3” at `:14325, 14783, 15123–15127`.

**Claim:** (i) Pull request #617 (kim-em, head 893faab3 of 2026-11-06, later than the previous review) rewrites `Completed/LocalFieldsRamification/README.md`: its layers are now 0 (complements), 1 (lower breaks) and 2 (Hasse–Arf), and the unramified and tame material is listed under “Already in the library” with its exact Tau Ceti declarations (`rev/617 …/README.md:27–60` and `:184–205`). The ids `#layer-2-…` and `#layer-3-…` exist on main (`Completed/LocalFieldsRamification/README.md:576, :724`) and at the merge base, but not at #617's head, so every one of these supplier citations breaks when #617 merges. (ii) The declaration the contract names, `map_norm_unitFiltration_zero`, is not a declaration of the pinned Tau Ceti: it was the completed roadmap's *planned* name (main `Completed/LocalFieldsRamification/README.md:686` “named `map_norm_unitFiltration_zero`”), while the library's theorem is `TauCeti.map_normUnits_unitFiltration` (same README `:700`; pinned `TauCeti/NumberTheory/LocalField/Norm/Unramified/Basic.lean:126`, stated for every filtration step `i`, with `i = 0` the surjectivity of the norm on units). A scan of all 111 “Tau Ceti `…`” names in the README against the pinned tree finds no other miss; this name escapes the scan because it is written in parentheses without the “Tau Ceti” prefix.

**Witness:** `grep -c 'layer-2-unramified' rev/617/Completed/LocalFieldsRamification/README.md` = 0 while main gives 1; `grep -rn map_norm_unitFiltration_zero <pinned TauCeti>` returns nothing, `Norm/Unramified/Basic.lean:126` is `theorem map_normUnits_unitFiltration (i : ℕ) : (unitFiltration L i).map (Algebra.normUnits K) = unitFiltration K i`.

**Exact repair:** Since the content is in the library, cite the pinned declarations rather than README layers, in the two contract subsections and in the `*Needs:*` lines that repeat them: for the unramified material `TauCeti.IsUnramified`, `TauCeti.isUnramified_iff_ramificationIndex_eq_one`, `TauCeti.unramifiedExtension`, `TauCeti.existsUnique_isUnramified_finrank_eq` (`Unramified/Existence.lean:386`), `TauCeti.IsUnramified.existsUnique_algEquiv_residueFieldHom_eq`, `TauCeti.maximalUnramifiedExtension` (`Unramified/Maximal.lean:97`), and `TauCeti.map_normUnits_unitFiltration` at `i = 0` in place of `map_norm_unitFiltration_zero`; for the tame material `TauCeti.IsTamelyRamified` (`LocalField/RamificationIndex.lean:161`), `TauCeti.IsTotallyRamified.exists_pow_eq_uniformizer_of_isTamelyRamified` (`TamelyRamified/Basic.lean:133`), `TauCeti.IsTotallyRamified.exists_pow_eq_uniformizer_and_autEquivRootsOfUnity` (`TamelyRamified/Galois.lean:87`), `TauCeti.isTotallyRamified_iff_exists_eisenstein_generator`, `TauCeti.exists_integerRing_adjoin_eq_top`, `TauCeti.normalizedValuation_norm` (`Norm/Basic.lean:130`), `TauCeti.IsTamelyRamified.tower_bot` (`RamificationIndex.lean:597`) and `TauCeti.tameCharacter` (`UnitFiltration/RamificationGroup.lean:566`). Where a README section must still be cited, cite it as it is at #617's head (its “Already in the library” list, `## Exact supplier contracts`), and say so in the merge-order paragraph of the description. The “Layer 2”/“Layer 3” phrases at `:14325, 14783, 15123–15127` become the declaration names too.

## R03 (P3) — The IntegralLattices B4 citation depends on an open revision the description does not name

**Location:** `README.md:227`: “From TauCetiRoadmap.IntegralLattices, B4 automorphisms … `TauCetiRoadmap/IntegralLattices/README.md#layer-b-binary-lattices-and-quadratic-orders`”; `:7091` repeats it in a `*Needs:*` line.

**Claim:** On main only `Completed/IntegralLattices/README.md` exists (Layers 1–5, no Layer B and no B4). The cited folder and id exist only at the head of #1239 (`rev/1239/TauCetiRoadmap/IntegralLattices/README.md:1031` “## Layer B: binary lattices and quadratic orders”, B4 at `:1409`). A citation only an open revision defines is a dependency, and the description's merge-order paragraph names only #1126.

**Witness:** `scratch/overlaps.md` line 17; `grep -c "Layer B" content/Completed/IntegralLattices/README.md` = 0.

**Exact repair:** Add #1239 (IntegralLattices) to the description's merge-order paragraph (“#1239 (IntegralLattices) and #1126 (AnalyticNumberTheoryPartI) → this PR”). No folder change is needed.

## R04 (P3) — Two residue ids this pull request drops are cited by an open roadmap, with no old → new line

**Location:** main `TauCetiRoadmap/ClassicalArithmeticCompletion/README.md:14391` “`<a id="layer-7-topic-4"></a>`” and `:16144` “`<a id="layer-7-topic-72"></a>`”, both absent from this head (the head keeps `### 7.4 Orders in finite-dimensional algebras` at `:13809` and `### 7.72 Ideles and lattice gluing for an arithmetic order` at `:15589`).

**Claim:** `HilbertModularVarietiesAndShimuraCurves` at the head of #1005 cites `../ClassicalArithmeticCompletion/README.md#layer-7-topic-4` (`:2377`) and `#layer-7-topic-72` (`:2424`). Removing the anchors is right (the gate flags `<a id=` as residue), but the brief asks for the old → new numbering so that the citing roadmap can follow.

**Witness:** `roadmaps grep --fixed 'layer-7-topic-4'` lists #1005 line 2377 and main's anchor only; no `layer-7-topic` string remains in this head.

**Exact repair:** Add two lines to `## Scope and ownership` (one per moved id): “layer-7-topic-4 → §7.4 (`#74-orders-in-finite-dimensional-algebras`)” and “layer-7-topic-72 → §7.72 (`#772-ideles-and-lattice-gluing-for-an-arithmetic-order`)”, the ids this head already uses (`:15750`).

## R05 (P3) — `[Fintype F]` beside `[Field F]` in `exists_pow_eq_iff_pow_eq_one`

**Location:** `Suggested.lean:70–73`: “theorem exists_pow_eq_iff_pow_eq_one {F : Type*} [Field F] [Fintype F] (n : ℕ) … a ^ ((Fintype.card F - 1) / (Fintype.card F - 1).gcd n) = 1”.

**Claim:** Gate `statement-hygiene` hit (`scratch/gate.md:9`): a finite field is stated with `[Finite F]`.

**Witness:** gate line 70.

**Exact repair:** `[Finite F]` and `Nat.card F` for both occurrences of `Fintype.card F`. On F₇, n = 2, a = 2: exponent 6/gcd(6,2) = 3 and 2³ = 1, with 3³ = 6 ≠ 1 for the non-square 3, as before.

## R06 (P3) — `[Fintype F]` beside `[Field F]` in `card_nonzero_pow_roots`

**Location:** `Suggested.lean:77–79`: “theorem card_nonzero_pow_roots {F : Type*} [Field F] [Fintype F] … = (Fintype.card F - 1).gcd n”.

**Claim:** Gate `statement-hygiene` hit (`scratch/gate.md:10`).

**Witness:** gate line 77.

**Exact repair:** `[Finite F]` and `Nat.card F`; the conclusion already uses `Nat.card` on the left. F₇, n = 3, a = 1: 3 roots = gcd(6, 3).

## R07 (P3) — `[Fintype K]` beside `[Field K]` in `christol`

**Location:** `Suggested.lean:136`: “theorem christol {K : Type*} [Field K] [Fintype K] {p : ℕ} [Fact p.Prime] [CharP K p] (a : ℕ → K)”.

**Claim:** Gate `statement-hygiene` hit (`scratch/gate.md:11`); the statement never uses the cardinality.

**Witness:** gate line 136.

**Exact repair:** `[Finite K]`. Nothing else in the statement changes.

## Previous findings

- R01 — repaired: README:857 now reads “Multiplication by a nonzero rational square preserves the squarefree part (§1.28): `ratSquarefreePart (u · t^2) = ratSquarefreePart u` for nonzero u and t”; no `ratSquarefreePart_mul_sq` remains in the folder (grep: 0 hits), and the pinned trees have no such name.

## Verified sound

**Scope.** Checked head 121997a5c2cfb162085609ce63e628dfb49477d9: the 59-line diff (`scratch/changes.md`), the previous report's one finding, the passages the diff touches and what cites them, the gate, the elaboration and the overlap facts. `git diff --stat origin/main...HEAD` outside the folder is empty (0 lines), so `lake-manifest.json` equals main's: Mathlib `1b1ccf4b088b32fa3f23f2de1127433254a81e1e`, Tau Ceti `2fd255d997f47c0b5d834ee416c7015d55444ce5`; `.lake/packages` resolves to a directory at exactly those revisions (checked with `git rev-parse HEAD` in both). The previous review read Mathlib `6b7abb3c` / Tau Ceti `a91d3aa`; the pin bump is the substance of this increment.

**Gate and dependency check.** My run of the brief's gate: `set_option=0 … imports=0 … statement-hygiene=3 … residue=0 … readme-ids-missing=0 … depcheck=0 … dirty=0 outside-folder=0 FAIL` (the three hygiene lines are R05–R07; the worker's run adds `build=2`, R01). Dependency check output, verbatim:

```text
depcheck: 240 roadmaps, 2458 edges, 0 problem(s)
```

No UPWARD or CYCLE line. This roadmap is not listed in `ORDER.txt` (nor is IntegralLattices; LocalFieldsRamification is completed), so it is checked as placed after its last supplier, which is not a finding.

**Elaboration.** `lake env lean TauCetiRoadmap/ClassicalArithmeticCompletion/Suggested.lean` from the worktree: exit 0 in 10 s, 45 warnings, all `declaration uses sorry`, no error; `lake env lean` does not emit Lake's module-system warning, which is why the file looks clean here and fails the worker's build count. The worker's `scratch/signatures.md` lists 73 entries of which `targets` and `group` are docstring words (the previous report explains them); the 71 real declarations are unchanged except `HasStrongApproximation`, whose elaborated type is `(F : Type) → [Field F] → [NumberField F] → (H : Type) → [CommRing H] → [HopfAlgebra F H] → Finset (HeightOneSpectrum (𝓞 F)) → Prop`, identical to the previous head: the only change is `TauCeti.AlgHom.mapValue` → `AlgHom.mapValue`, and the pinned `AlgHom.mapValue` (`TauCeti/Algebra/AlgebraicGroup/FunctorOfPoints.lean:143`, in `namespace AlgHom` of a `module` file) is post-composition with `φ` on convolution monoids (`:152` “acts pointwise by post-composition”), the map the definition needs. No theorem statement changed, so the one-tactic padding probe of the previous report is carried, not rerun.

**Renamed library citations, each opened at the new pin.**

| README passage | Pinned declaration, file:line | Agrees with the README's use |
|---|---|---|
| :26, :45 Smith form suppliers | `Matrix.exists_smith_normal_form_of_det_ne_zero` (`TauCeti/LinearAlgebra/Matrix/SmithNormalForm/Int.lean:689`, `A : Matrix (Fin n) (Fin n) ℤ`), `Matrix.smith_normal_form_unique` (:739, `hc_pos : ∀ i, 0 ≤ c i`), `Matrix.invariant_factor_zero_eq_gcd` (:835, `[NeZero n]`); `namespace Matrix` at :81; the old path `SmithNormalForm.lean` no longer exists | Square, nonsingular existence; nonnegative chained uniqueness: yes |
| :26, :43 narrow class group | `NumberField.NarrowClassGroup.toClassGroup_injective_iff_exists_norm_eq_neg_one` (`…/Quadratic/Conjugation/NarrowClassGroup.lean:220`, inside `namespace NumberField` :81 and `NarrowClassGroup` :200), `mkPrincipal_eq_mkPrincipal_gen_of_norm_neg` (:149), both with `hmin : minpoly ℤ θ = X ^ 2 - C d` | The quadratic presentation hypothesis matches |
| :36, Lean :1–4, :675–678 | `AlgHom.mapValue`, `FunctorOfPoints.lean:143`; `Hopf/Map.lean` still exists but defines only `BialgHom.mapValue_mapDomain` (:179) | Import and name are right |
| :38, :470, :1692 fundamental discriminants | `TauCeti.Multiquadratic.fundamentalDiscriminantChar (D : ℤ) (hD : Int.IsFundamentalDiscr D) : DirichletCharacter ℤ D.natAbs` (`…/FundamentalDiscriminant/Character.lean:38`); `Int.isFundamentalDiscr_iff_squarefree` (`Mathlib/NumberTheory/FundamentalDiscriminant.lean:60`: `D % 4 = 1 ∧ Squarefree D` or `D % 4 = 0 ∧ Squarefree (D/4) ∧ D/4 % 4 ∈ {2, 3}`); `Int.IsFundamentalDiscr.existsUnique_finset_primeDiscriminant` (`…/FundamentalDiscriminant/Factorization.lean:255`, `∃! s, (∀ P ∈ s, IsPrimeDiscriminant P) ∧ ∏ P ∈ s, P = D`, declared `_root_`, so the README's root-namespace spelling is right); `TauCeti.Multiquadratic.isFundamentalDiscr_fundamentalDiscriminant` (`OfSquarefree.lean:95`, `Squarefree d → Int.IsFundamentalDiscr (fundamentalDiscriminant d)`); `TauCeti.Multiquadratic.IsFundamentalDiscriminant` no longer exists at the pin (scan) | The description at :470 is Mathlib's; the “transported to Int.IsFundamentalDiscr” clause at :1692 is now an identity transport (harmless, no change needed) |
| :3139, :3148, :3718, :3730, :4132, :4137, :4152 elliptic divisibility sequences | `normEDS_two_three_two (n : ℤ) : normEDS 2 3 2 n = n` (`Mathlib/NumberTheory/EllipticDivisibilitySequence.lean:942`), `IsEllipticNet.normEDS` (:920), `IsDvdSequence.normEDS` (:978); the Tau Ceti names `normEDS_two_three_two_eq_id`, `isDvdSequence_normEDS`, `isEllipticNet_normEDS` are absent at the pin (scan) | Yes; `Nat.IsStrongDvdSequence` is in `namespace Nat` of `Mathlib/Data/Nat/DvdSequence.lean:81` |
| :1711 `TauCeti.legendreSym_mul_sq` | `TauCeti/NumberTheory/LegendreSymbol/SquareClass.lean:27` | unchanged, present |

**Mechanical name scan at the pins.** A script extracted every “Tau Ceti `…`” (111 names) and “Mathlib `…`” (829 names) in the README and matched them, by full name, two-component tail or last component, against every `theorem/def/abbrev/structure/class/instance/inductive/alias` head in the pinned trees (24 239 Tau Ceti files, 275 627 names; 8 696 Mathlib files, 219 287 names): 0 misses. Control probes: `ratSquarefreePart_mul_sq`, `map_norm_unitFiltration_zero`, `normEDS_two_three_two_eq_id`, `isDvdSequence_normEDS`, `IsFundamentalDiscriminant` all absent; `map_normUnits_unitFiltration`, `normEDS_two_three_two`, `existsUnique_finset_primeDiscriminant` present. The scan matches names, not statements; the statements of the names the diff touched are in the table above.

**Other changed passages.** :857 (R01, repaired). :6643 “`0!_D = ⊤` and `1!_D = ⊤`” replaces an advertised `FactorialIdeal.one_eq_top` (no such Lean name anywhere in the folder now). :12388 “stated as the auxiliary proof target of this section” replaces `dyadicPrimeCount`; §6.34 (:12380–12406) does carry that target at :12402 with the exact inequality `π(2x) − π(x) > 3x/(5 log x)` for `x ≥ 41/2`. :16162 “`D_H` identifies with the kernel…” replaces `PositiveUnitKernel.kernel`; no occurrence of any of the four removed names remains (grep: 0). The §1.7 `*Needs:*` line and the Layer 1 and Layer 2 dependency lists were updated consistently with the renamed names (one entry added or removed per rename).

**Seeded sample.** None of the fifteen seeded targets (§§1.13, 1.32, 2.7, 2.48, 2.52, 2.70, 2.72, 3.32, 3.36, 4.2, 4.35, 6.4, 7.3, 7.67, 7.91) falls in the diff or cites a changed passage; following the incremental instruction they were not re-sampled and no source was refetched. The README flags no locator as unverified.

**Overlaps and ownership.** `scratch/overlaps.md`: no other open pull request changes this roadmap; the three remaining items are R02 (ids dropped at #617's head, read at `rev/617/Completed/LocalFieldsRamification/README.md`), R03 (IntegralLattices B4 only at #1239's head, read at `rev/1239/TauCetiRoadmap/IntegralLattices/README.md:1031, :1409`) and R04 (ids dropped here, cited at #1005's head by the roadmaps tool). The closest-vocabulary roadmaps (#1046, #1408, #1335, #1126, #1712) were compared by the previous reports; the diff adds no object, so ownership did not change. Ownership against open pull requests without a supplied checkout (#1005, #1046) was not checked beyond the tool's grep.

**Adversarial computations for the changed statements.**

| Statement/object | Instances and computed values on both sides | Result/change |
|---|---|---|
| §1.7 fundamental-discriminant hypothesis (Mathlib predicate vs squarefree description) | D = 5: 5 % 4 = 1, squarefree, fundamental. D = 12: 12 % 4 = 0, 12/4 = 3 squarefree, 3 % 4 = 3, fundamental. D = −4: Lean `Int.emod` gives −4 % 4 = 0, −4/4 = −1, −1 % 4 = 3, fundamental. D = −3: −3 % 4 = 1, fundamental. D = 9: 9 % 4 = 1 but 3² ∣ 9, not fundamental; D = 4: 4/4 = 1 with 1 % 4 = 1, not fundamental. | The prose description equals the pinned iff, including negative D under Lean's nonnegative remainder. |
| §1.7 prime-discriminant factorisation (`existsUnique_finset_primeDiscriminant`) | D = 12 = (−4)·(−3), s = {−4, −3}; D = −4, s = {−4}; D = 1 (fundamental under the pinned predicate), s = ∅ with empty product 1, matching the conductor-1 case of §1.51. | Unique factorisation as cited. |
| §1.51 `isFundamentalDiscr_fundamentalDiscriminant` | d = 5 ↦ 5; d = 3 ↦ 12; d = −1 ↦ −4; d = 2 ↦ 8; each satisfies the predicate by the row above. d = 12 (not squarefree) is outside the hypothesis: 12 % 4 = 0 so the map gives 48, not fundamental. | Hypothesis `Squarefree d` is necessary and stated. |
| §1.18a line 857 (R01) | u = 2, t = 2/3: u·t² = 8/9, squarefree part 2 on both sides; t = 0 would give 0 ≠ 2, so nonzero t is needed and stated. | Prose repair correct. |
| §2.21 Check `ψₙ(0,0) = n` on E₂,₃,₂; §2.57 `W₀..W₄ = 0, 1, b, c, db` | From the pinned `normEDS_two`, `_three`, `_four`: W₂ = b = 2, W₃ = c = 3, W₄ = d·b = 4; odd step W₅ = W₄W₂³ − W₁W₃³ = 32 − 27 = 5; `normEDS_two_three_two` states `normEDS 2 3 2 n = n`. | Mathlib citation matches the Check. |
| §2.43, §2.57 `IsDvdSequence.normEDS` | W = normEDS 1 (−1) 1 = 0, 1, 1, −1, 1, 2, −1, −3, −5, 7, −4: W₅ = 2 ∣ W₁₀ = −4; W₃ = −1 ∣ W₆ = −1; W₂ = 1 ∣ W₄ = 1. | Divisibility direction of the strong-divisibility route holds. |
| §2.57 `IsEllipticNet.normEDS` (EDS relation) | m = 3, n = 2 on the same W: W₅W₁ = 2; W₄W₂·W₂² − W₃W₁·W₃² = 1 − (−1) = 2. | Relation holds; the citation supports “satisfies the elliptic net relations”. |
| §3.61 `0!_D = ⊤`, `1!_D = ⊤` | Exponent of 𝔪 in n!_D is w_q(n) = Σ_{k≥1} ⌊n/qᵏ⌋ with q = N(𝔪) ≥ 2: n = 0, 1 give 0 for every 𝔪, so both ideals are ⊤. D = ℤ, n = 4: w₂ = 2 + 1 = 3, w₃ = 1, product 8·3 = 24 = 4!. | Wording change preserves the statement. |
| §6.34 auxiliary target π(2x) − π(x) > 3x/(5 log x), x ≥ 41/2 | x = 20.5: primes in (20.5, 41] are 23, 29, 31, 37, 41, five, versus 3·20.5/(5·ln 20.5) = 4.072. x = 41: nine primes in (41, 82], versus 6.624. | The input §6.34 needs is stated in §6.34 itself. |
| §7.44 `HasStrongApproximation` with `AlgHom.mapValue` | Trivial group H = F: `Points F H R` is one point, diagonal dense. G_m/ℚ, adele with x₂ = 2, x_p = 1 elsewhere, U₅ = 1 + 5ℤ₅: the rationals ±2 have residues 2, 3 ≠ 1 mod 5, so density fails (carried instance, now through `mapValue (AlgHom.snd F _ _)`, which is post-composition). | Same predicate, same values. |

**Carried adversarial evidence for untouched statements.** The 35 rows of the previous report's table for the previous increment and its 84 carried rows (compatible CRT through the Fröhlich–Taylor endpoint) are carried from [the previous report][previous] unchanged; the diff touches none of their statements, and their computed values stand as recorded there.

[previous]: packages/ClassicalArithmeticCompletion/reports/PRREVIEW-ClassicalArithmeticCompletion~3.md

| Statement/object | Instances and computed values | Result/provenance |
|---|---|---|
| Compatible CRT; cyclic power range/kernel; finite-field Euler criterion; nonzero root count | m=6,n=9,a=1,b=4 → x=13 mod 18; C₆,d=2 image {0,2,4}; F₇ squares {1,2,4} cubes 1, 3³=6; F₇,n=3,a=1 three roots = gcd(6,3). | Pass; carried from [previous report][previous]. |
| IsRational; lucasU; gcd_lucasU; DFAO/eval; IsAutomatic; kernel; Eilenberg; Christol; Cobham | 1/(1−X): Q=1−X,P=1; P=1,Q=−1 gives 0,1,1,2,3,5,8; gcd(U₆,U₉)=2=U₃; Thue–Morse two kernel sequences; constant 7 one state; bases 2,4 fail independence since 2²=4. | Pass; carried from [previous report][previous]. |
| Ward divisibility; smithDiag; rectangular Smith; Smith cokernel; Perron; Capelli | normEDS(2,3,2)=n, gcd(W₋₆,W₉)=3=|W₃|; 2×3 rows (2,0,0),(0,0,0) cokernel ℤ/2×ℤ; X²−3X+1 bound 2≤3; X⁴+4 factors since −4=−4·1⁴. | Pass; carried from [previous report][previous]. |
| markoffSet; markoffVieta; Markoff descent; three squares; Egyptian; Ramanujan–Nagell; negative Pell; interval completeness; IsFactorBaseBound; Minkowski; PowerResidueIndependent; saturation rows; class number from saturation; h·R residue bounds | (5,13,194) → (5,13,1); 7 and 28 excluded; 5/6=1/2+1/3; x=1,3,5,11,181; d=5 cube of (1+√5)/2 has norm −1; ℚ(√−14) norms ≤2 give order 2 not 4, bound 4.764 includes 3; C₄ n=4 vs n=8 fails at p=2,e=4. | Pass; carried from [previous report][previous]. |
| IsPisot; IsSalem; powers; Schinzel–Zassenhaus; Fekete/transfinite diameter; radialHedgehog; Dubinin; ExteriorLaurentContinuation; Bertrandias; explicit/asymptotic Dobrowolski; Salem generator; Smyth; smallest Pisot | φ other conjugate −0.618; X⁴−3X³+3X²−3X+1 τ≈2.1537; house 2 ≥ 2^{1/4}; K={−1,1} diameter 0; one spike capacity 1/4, two 1/2; d=2 bound 0.99999<φ; plastic 1.3247<φ<2. | Pass; carried from [previous report][previous]. |
| IsReducedNormLaw; unique reduced norm; IsNIBGenerator; HasNIB; tameness at a prime/global/towers; local Noether; Hilbert–Speiser; Gauss period; groupRingDeterminant; tame determinant descent; Points topology; HasStrongApproximation; strong approximation | M₂(F₃) swap det 2 vs regular det 1; ℚ(√5) NIB det −1, ℚ(i) det −2ab; ℤ[i] at (1+i) e=2 wild; F₄/F₂ basis {ω,ω²} lifts; S₃ transposition det −1; 1+3ℤ/9 squaring swaps 4,7; SL₂ diag(t,t⁻¹) unbounded, Hamilton norm-one sphere compact. | Pass; carried from [previous report][previous]. |
| 2.48; 2.53; 3.59; 4.27; 4.101; 7.12b; 7.53; 7.69; 7.93; 7.102; 7.112; 1.64; 5.9; 7.29; 7.118; Fröhlich–Taylor endpoint | z=1: 0.581976707 with B₁=−1/2; 2/5<3/7, 5·3−2·7=1; Jordan block vs I₂ invariant factors; d=6,n=3 box (±3,±1); E=ℚ₃(√3) a_F=1; e₊e₋=0 index 2; ℚ(i) trace ideal 2ℤ; τ*=−1; λ=−1+2i exponent −2; Hadamard error 65 ≤ 162; q=5 quartic g(χ²)²=5; Q₈ dets 1; trivial G classes 0. | Pass; carried from [previous report][previous]. |
| Division polynomials §§2.22, 2.42, 2.43; Jacobi §4.40; four squares §4.102; §6.34 prime estimate; §6.76 trace ratio; §§2.1, 2.6, 2.10, 2.27, 2.46, 2.61, 3.16, 3.19, 4.11, 4.37, 4.118, 5.4, 6.1, 6.2, 7.2, 7.4 | y²+y=x³−x, (0,0), 5P=(1/4,−5/8), ψ₅=2, φ₅=1; a=2 coefficients 1, 5/2, 0, 0, 17/4; counts 8,24,32,24,48,96,64,24,104,144,96,96; x=20.5 five primes vs 4.072; θ²=θ−2 N(1+θ)=4; ℤ[i] HNF corner 2ℤ. | Pass; carried from [previous report][previous]. |

## Not verifiable

No source was needed for this increment: the changed passages repoint library names and reword advertised Lean names, and no seeded target falls in the diff. The source limitations recorded in the previous report (kudla-tate-2004, prr, bach-euler-products-1995, prasolov-polynomials-russian-2003, smyth-1971, silverman-icms-2007, simonson-gersonides-2005, berndt-evans-williams-1998, reiner-maximal-orders-1975, froehlich-taylor-gauss-1980, wall-norms-1974, rosser-schoenfeld-1962, ward-memoir-1948, froehlich-galois-modules-1983, mignotte-irreducible-factors-1988) are unchanged and carried, not reopened. The old-pin history of the name `map_norm_unitFiltration_zero` was not traced in the Tau Ceti git history (the `git grep` at `a91d3aa` was abandoned after two minutes); main's completed README settles that it was a planned name, which is all R02 needs.

## Source issues

- none
