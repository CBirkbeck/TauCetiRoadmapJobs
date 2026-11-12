# Review of SpectralSequencesAndConvergence (design, round 4)

**Verdict:** needs changes

Files reviewed: `packages/SpectralSequencesAndConvergence/design/README.md`,
`packages/SpectralSequencesAndConvergence/design/plan.json`,
`packages/SpectralSequencesAndConvergence/sources.toml`. Previous review: round 3 (two findings, both
P3) and its repair report (one applied, one applied differently, four further `*Needs:*` lines
repaired by the pattern pass). Two findings this round: one P2 (blocking), one P3. Maintainer notes:
none. No `Suggested.lean` exists at the design stage, so elaboration, the `#check` comparison and the
one-tactic probe are not available (this lane does not elaborate).

## R01 (P2) — 5.2's "if and only if" is false for the convergence structure of 3.2

Location: `packages/SpectralSequencesAndConvergence/design/README.md` line 998–1000, "The spectral
sequence converges weakly at `(p, n − p)` if and only if the classical inclusions (24.6.1) and
(24.6.2) are equalities"; `design/plan.json` target 5.2, statement ("weak convergence at (p, n−p) iff
equality in Stacks (24.6.1) and (24.6.2)").

Claim: weak convergence (3.2) at a position holds exactly when the two inclusions are equalities.

Witness: 3.2's weak convergence is a structure carrying arbitrary isomorphisms `β`; Stacks' is
equality "via Lemma 24.6" (stacks-012K line 3135, 3146–3147). In `ModuleCat ℤ` take
`K^{−1} = ℤ`, `K^0 = ℤ^(ℕ) ⊕ ℤ`, `d(x) = (0, x)`, `F^p K^0 = K^0` for `p ≤ 0` and `0` for `p ≥ 1`,
`F^p K^{−1} = 0` for all `p` (the non-exhaustive complex of 4.3 plus `ℤ^(ℕ)` in degree `0`). Then
`E_1^{0,0} = E_∞^{0,0} = ℤ^(ℕ) ⊕ ℤ` and every other first-page object is `0`; `H^0(K) = ℤ^(ℕ)` with
`F^0 = H^0`, `F^1 = 0`, `H^n(K) = 0` for `n ≠ 0`. So `gr^0 H^0 = ℤ^(ℕ) ≅ ℤ^(ℕ) ⊕ ℤ = E_∞^{0,0}`
and `gr^s H^n = 0 = E_∞` elsewhere: a weak (indeed strong, the filtrations being finite) convergence
structure in `I = ℤ` exists. Yet (24.6.2) at `p = 0`, `n = 0` is strict: the left side is `0`
(`F^p K^{−1} = 0`), the right side is `im d ∩ F^0 K^0 = 0 ⊕ ℤ`; in 4.3's terms `B_∞ = 0 ≠ Bᵗ`.
The "only if" half fails. "Converges weakly at a position" is also not a notion 3.2 defines (it is
defined for a set of total degrees).

Repair: replace the sentence by "The comparison of 4.3, which presents `gr^p H^n(K)` as a
subquotient of `E_∞^{p,n−p}`, is an isomorphism if and only if the classical inclusions (24.6.1) and
(24.6.2) are equalities at `(p, n − p)`. When this holds at every position of total degree in `I`,
these comparisons are the `β` of a weak convergence structure in `I` (3.2)." Add a fourth Check with
the complex above: "abstract isomorphisms `E_∞ ≅ gr` exist at every position, but the comparison at
`(0, 0)` is the projection `ℤ^(ℕ) ⊕ ℤ ↠ ℤ^(ℕ)` with kernel `ℤ`; the criterion is about the
comparison, not about the existence of some `β`." Change plan 5.2's statement in the same way and
add the test. Tested on the refuting instance: the comparison at `(0, 0)` is not an isomorphism and
(24.6.2) is strict, so both sides of the repaired equivalence are false; on the `×2` complex both
sides are true (5.2's first Check). The pattern was searched in the rest of the design: 4.3's first
Check, 4.4's third Check and 5.4's second Check conclude "weak convergence fails" on the complex with
`E_∞^{0,0} = ℤ`, `gr^0 H^0 = 0`, where no isomorphism of any kind exists, and 4.4, 4.5, 5.3 state
convergence "through the isomorphisms of 4.3"; none needs a change.

## R02 (P3) — the module-category instances are cited at a generality the pin does not have

Location: `packages/SpectralSequencesAndConvergence/design/README.md` line 187–188, "with the
module-category instances `AB5`, `AB4Star` and `EnoughProjectives` for `ModuleCat R`"; line 1254,
"`ModuleCat R` (for `Small R`) has lim-acyclic epimorphic towers and `CountableAB4Star`"; plan 7.2 api
`moduleCat_instance`.

Claim: the three instances exist for `ModuleCat R` under `Small R`.

Witness: at the pin, `Mathlib/Algebra/Category/ModuleCat/AB.lean` line 28–40 has `AB5` and `AB4Star`
only for `ModuleCat.{u} R` with `R : Type u`; `Small.{v} R` appears only for `HasSeparator` (line 51)
and for `EnoughProjectives` (`ModuleCat/Projective.lean` line 60). For `R = ℤ` and `ModuleCat.{1} ℤ`
there is no `AB4Star` instance.

Repair: in the Mathlib contract write "`AB5` and `AB4Star` for `ModuleCat.{u} R` with `R : Type u`,
and `EnoughProjectives` for `ModuleCat.{v} R` under `Small.{v} R`"; in 7.2 write "`ModuleCat.{u} R`
for a ring `R : Type u` has lim-acyclic epimorphic towers and `CountableAB4Star`" (plan api
likewise). Tested on `R = ℤ`, `u = 0`: `AB4Star (ModuleCat.{0} ℤ)` (AB.lean 38) gives
`CountableAB4Star` by the instance at `GrothendieckAxioms/Basic.lean` line 129, and
`EnoughProjectives` holds since `Small.{0} ℤ`.

## The two repairs of round 3

| Id | Status | Repaired passage (at most 40 words) and check |
|---|---|---|
| F01 (P3) | repaired | 2.1 line 463: "A bidegree assignment transports along isomorphisms of spectral sequences." 6.1 line 1100–1102: "If `(fil, deg, e)` is a bidegree assignment (2.1) for `E`, then `(fil, deg, e − k)` is one for the page shift of `E` by `k`". 6.1 `*Needs:*` has "2.1 for the bidegree-assignment bullet"; plan 6.1 has `target:2.1`, api `pageShift_bidegreeAssignment`, test `shift_offset_sign`; Layer 6 Dependencies list Layer 2. |
| F02 (P3) | repaired (differently) | 7.2 line 1255–1258: "The cycle tower `r ↦ Z_r(pq)` of 1.2 at a position whose first-page object … is Artinian … is eventually constant, hence Mittag–Leffler. Its `lim¹` vanishes by 7.1". `*Needs:*` has "1.2 and Mathlib `IsArtinianObject` for the cycle-tower bullet"; plan 7.2 has `target:1.2`. The sentence pointing to 7.4 is gone; 7.4's third Check (finite length) is the special case. |

Pattern pass of the repair (2.2 + 1.4, 4.5 + 3.6, 5.2 + 3.2, 5.4 + 3.2): each `*Needs:*` line and the
plan's `target:` list were read and agree. All 31 README `*Needs:*` lines were compared again with
the plan's `target:` prerequisites: they agree, no forward `target:` edge, and every notion a
statement or API bullet uses lies in the transitive closure (spot-checked: 3.4's "reached on page
`r`" via 3.2 → 1.4; 5.3's "bounded" and weak Serre class via 4.4 → 3.4 → 2.2, 2.3; 7.4's "regular
position" via 1.4 → 1.3; 7.5's 3.1 via 7.1). No finding of round 3 was marked not actionable.

## Verified sound

**Principles.** No route-specific shortcut; no re-planned roadmap (DGFloer Layer 1 item 3,
AlgebraicTopology Stage 6 item 0, DerivedModuleAlgebra §S.1, StableHomotopyKTheory §§7.21–7.26 are
instances or suppliers, each with its distinguishing clause); no algorithm, no copied passage, no
Lean at this stage. Declared gaps: none (`plan.json` `gaps = []`). Gate output, verbatim:

    candidate: SpectralSequencesAndConvergence is not in the merge order yet; checked as if placed after StableHomotopyKTheory (the intake inserts it when its design is accepted)
    depcheck: 229 roadmaps, 2058 edges, 0 problem(s)

No UPWARD or CYCLE line. None of the never-cite roadmaps occurs in the README.

**Suppliers resolved this round.** StableHomotopyKTheory at its open head: §7.22 "Exact couples and
their derived couples" (bigraded couple of degrees `a, b, c`, `D′ = im i`, `E′ = ker(jk)/im(jk)`,
`j`-degree `b − a`, page `r ≥ 1` the `E` of the `(r − 1)`-derived couple, `d_r` of degree
`c + b − (r − 1)a`, the tuple couple with `i² = i`), §7.21, §7.23–7.26 present (§7.26 with the same
two Checks as 7.4's first two). It is line 17 of the merge order, so the supply is downward.
DGFloer, AlgebraicTopology, DerivedModuleAlgebra, SchemeAndStackFoundations, ComplexKahlerGeometry,
HeegaardFloer, MorseTheory are folders on main. The three `roadmaps resolve` leads
(`DoubleComplex.eInftyIsoGr`, `DoubleComplex.page_eq_eInfty`, `DoubleComplex.fiveTerm_exact`) are
DerivedModuleAlgebra §S.1's planned names, cited as that roadmap's, not as pinned declarations (as
round 3 found). Overlaps file: no pull request changes this roadmap, no dropped id, no revision-only
id.

**Ownership against open pull requests** (`roadmaps grep` on main and the indexed open heads for
"limit page", "exact couple", "conditional(ly) convergence", "whole-plane"): the only owners of
exact-couple or conditional-convergence constructions are StableHomotopyKTheory §7.22 and §7.26, which
this roadmap cites; the other hits (SchemeKTheoryOperations, ChromaticHomotopyTheory,
PurityForFlatCohomology, MotivesAndAlgebraicCycles, ArithmeticLocallySymmetricSpaces,
DerivedDeRhamCohomology, RefinedTraceMethods, EllipticKTheory) consume exact couples of their own
geometry. No second owner of towers, limit page, convergence structures or abelian-category lim¹.

**Library names at the pins** (opened or located this round). Mathlib:
`CategoryTheory.IsArtinianObject` (`Subobject/ArtinianObject.lean` line 55, with
`WellFoundedLT (Subobject X)` at 57) and `antitone_chain_condition_of_isArtinianObject` (line 69);
`SpectralSequence` (`SpectralSequence/Basic.lean` line 36: `page (r : ℤ)` for `r₀ ≤ r`,
`iso r r′ pq` with `r + 1 = r′`, so the page shift by `k : ℤ` of 6.1 is well-typed), `Hom` 51,
`pageXIsoOfEq` 60, `pageFunctor` 90, the abbreviations 109–133; the `HasSpectralSequence` instances
for `coreE₂Cohomological` on `EInt` (`HasSpectralSequence.lean` line 347), `coreE₂CohomologicalNat`
(410) and `coreE₂HomologicalNat` (453); `isoMapFourδ₁Toδ₀'` and `isoMapFourδ₄Toδ₃'`
(`SpectralObject/EpiMono.lean` 191, 224); `CountableAB4Star` (`GrothendieckAxioms/Basic.lean` 126)
and its instance from `AB4Star` (129); `AB.lean` 28–40 and `Projective.lean` 60 (see R02);
`spectralSequenceFirstPageXIso`, `spectralSequencePageXIso`, `spectralObjectMappingCone`,
`mapHomologicalFunctor`, `IsStrictHom`, `eulerChar`, `homologyEulerChar`, `EulerCharSigns`,
`IsSerreClass`, `isZero₁_of_isFirstQuadrant`, `isZero₂_of_isFirstQuadrant`,
`SpectralSequenceDataCore`, `pageHomologyNatIso`, `spectralSequenceFin`, `isoHomologyπ`,
`isoHomologyι` each found by declaration in the file the README names. Tau Ceti: all 38 names of the
"From Tau Ceti" contract found by declaration in the files named (`isIso_hom_f_of_le` in
`SpectralSequence/Comparison.lean`; `isIso_hom_app_abutment_of_isIso_page` at
`SpectralObject/Comparison.lean` line 121; `towerDifference` at `TowerDifference.lean` 77,
`isLimitConeOfTowerDifference` 122; `AbelianK0.AdditiveInvariant` at `GrothendieckGroup/Abelian.lean`
216; the `Filtered/` names in `SpectralObject.lean`, `Naturality.lean`, `FirstPage.lean`,
`Stabilization.lean`, `Convergence.lean`, `Comparison.lean`, `Exhaustive.lean`; `Bicomplex.lean`;
`Tower/Basic.lean`, `Tower/MittagLeffler.lean`). For the definitions and line numbers not reopened
(the `SpectralObject/` recipes, `Filtration/Basic.lean`, `EulerCharacteristic.lean`), round 3's
record carries the quoted formulas.

**Sources: the seeded sample**, read at the locators in the cached texts (no author-flagged
unverified locator exists).
1.4: stacks-012K 2625–2631 (Definition 20.2, tag 011O: `Z_∞ = ⋂ Z_r`, `B_∞ = ⋃ B_r` when they exist,
`E_∞ = Z_∞/B_∞`); helle-rognes2024 71–77 (Definition 2.3).
3.1: stacks-012K 2349–2368 (Definition 19.1, tag 0121: finite, existence of `⋂` and `⋃`, separated,
exhaustive); helle-rognes2024 81–84 (Definition 2.5).
3.4: stacks-012K 3152–3174 (Lemma 24.11 (2)–(4), tag 012W, with (4) proved at 3169–3174 through
`E_∞ = E_{r′}`); 3175 opens Lemma 24.12, tag 0BDW.
4.1: helle-rognes2024 291–298 (Definition 4.5), 299–303 (Remark 4.6), 334–335 (Remark 4.10).
4.3, 5.2: stacks-012K 3062–3071 (Definition 24.5, tag 012P), 3072–3106 (Lemma 24.6, tag 012Q, with
(24.6.1) at 3093 and (24.6.2) at 3098), 3144–3151 (Lemma 24.10, tag 012V); 3131–3143 (Definition
24.9: weak convergence is equality "via Lemma 24.6", the point of R01).
4.4, 5.3: stacks-012K 3202–3240 (Lemma 24.13, tag 0BK5: `p₀(n)`, `p₁(n)` for every `n`; bounded,
finite filtration, converges; the proof uses `p₀(n + 1)` and `p₁(n − 1)`); 3152–3168 (Lemma 24.11
(1)–(3)).
4.6: weibel1994 5.2.12 uncertified; the Tau Ceti theorem located as above.
6.2: stacks-012K 2687–2703 (Lemma 21.4, tag 011T: `B_{r+1} = g(Ker α^r)`, `Z_{r+1} = f^{−1}(Im α^r)`,
the rule for `d_{r+1}`, and the remark with `B_∞`, `Z_∞`); helle-rognes2024 136–144 (Definition 3.3,
Lemma 3.4, Remark 3.5).
7.1: helle-rognes2024 71–84 (Rlim in Definitions 2.3 and 2.5), 85–93 (Lemma 2.6, the step at 92);
53–55 (the paper works with graded modules over a ring, as the README says).
7.2: stacks-012K 3715–3719 (Definition 31.2, tag 02N0), 3720–3724 (Neeman), 3725–3735 (Lemma 31.3,
tag 02N1, for abelian groups).
7.3: helle-rognes2024 225–229 (the sequence (3.1), citing Boardman 3.4(b)), 213–214 (Lemma 3.15 (c)).
7.4: helle-rognes2024 145–156 (Definitions 3.6, 3.7 citing Boardman 5.10), 71–80, 163–168 (Theorems
3.9 and 3.10, cf. Boardman 8.10 and 8.13), 169–178 (Definition 3.11), 185–247 (Lemmas 3.13–3.15 and
both proofs; the proof of 3.10 ends at 247), 13–25, 943–967 (Example 8.1).
7.5: weibel1994 5.5.10 and eilenberg-moore1962 §7, uncertified.
Also read: stacks-012K 2598–2624 (Definition 20.1 and the towers), 2653–2686 (Definitions 21.1,
21.3, Lemma 21.2). The manifest records every cited work; its locators list the items cited.

**Adversarial table** (sampled targets, repaired passages, headline theorems, the findings' targets;
rows marked † carry over round 3's computed values for text no repair touched).

| Statement | Instances tried | Values computed | Result |
|---|---|---|---|
| 1.4 existence | countable products; coproducts | `S ≤ Z_r` for all `r` iff `S → X → X/Z_r` is `0` for all `r` iff `S ≤ ker(X → ∏ X/Z_r)`; `S ≥ B_r` for all `r` iff `S ≥ im(⨁ B_r → X)` | holds |
| 1.4 functoriality, vanishing | `f : E ⟶ E′`; `E_r(pq) = 0` | `Z_∞ ≤ Z_r ≤ f^{−1}(Z_r′)` and pullback preserves meets: `Z_∞ ≤ f^{−1}(Z_∞′)`; image preserves joins: `f(B_∞) ≤ B_∞′`; `Z_r = B_r` and `B_r ≤ B_∞ ≤ Z_∞ ≤ Z_r` give `E_∞ = 0` | holds |
| 1.4 rebasing (with 1.1) | meet of `Z_r` inside `[B_s, Z_s]` | a lower bound `S` in `Subobject A` has `S ∨ B_s` in the interval and below every `Z_r`, so the interval meet is the meet; dually `S ∧ Z_s` for joins | holds |
| 1.4 third Check | `K^0 = ℤ →id K^1 = ℤ`, `F^p K^1 = ℓ^{p−1}ℤ` (`p ≥ 1`) | `gr^0 K = ℤ` in degree `0` (`F^0K^1/F^1K^1 = 0`), `E_1^{0,0} = ℤ`; `gr^p K = ℤ/ℓ` in degree `1`; `Z_r(0,0) = d^{−1}(F^r K^1) = ℓ^{r−1}ℤ`, `Z_1 = ℤ`; meet `0` | holds |
| 3.1 predicates † and finite ⇒ complete | `ℓ`-adic `ℤ`, `ℤ_ℓ`; constant; zero; `F^b = 0` | `lim ℤ/ℓ^p = ℤ_ℓ ≠ ℤ`; constant: meet `X ≠ 0`; zero: join `0 ≠ X`; tower `X/F^p = X` for `p ≥ b` | holds |
| 3.4 | `ℤ/4` vs `ℤ/2 ⊕ ℤ/2`; all `E_∞ = 0` | finite ⇒ exhaustive, separated, complete; `gr^s = 0` off the image and `≅ E_∞` on it; lengths `2 = 1 + 1`; all `gr = 0` with `F^a = H^n`, `F^b = 0` gives `H^n = 0` | holds |
| 3.5 (headline) | separation; completeness; route (iii) | `E = E′ = 0`, `H^0 = ℤ` constant: `h = 0` not iso; `ℤ → ℤ_ℓ`, `gr^p = ℤ/ℓ` both sides, not onto; exhaustive and exact `ℕ`-colimits: `colim_p F^p/F^{p′} = H/F^{p′}`, then `H = lim_{p′} H/F^{p′}` | holds |
| 4.1 | LES of `q − r + 2 ≤ q ≤ q + 1` and `q ≤ q + 1 ≤ q + r − 1`; `×2` at native `(1, −1)`, `r = 3`; HR dictionary `s = q + 1` | `ker δ = im(H^n(q − r + 2 ≤ q + 1))`, `im δ = ker(H^n(q ≤ q + 1) → H^n(q ≤ q + r − 1))`; `H^0(K/F^1) = ℤ →(×2) H^1(F^1/F^2) = ℤ`, `Z_3 = 0`; HR `H(s − r, s − 1)` with HR page `r` = native `r + 1` gives `i₀ = q + 1 − r` | holds |
| 4.3 cycle side | hypothesis at one `i ≤ q` only | LES of `⊥ ≤ i ≤ q`: `H^{n+1}(⊥ ≤ q) → H^{n+1}(i ≤ q)` mono, so `Z_{q−i+2} = Zᵗ`; for larger `r`, `Zᵗ ≤ Z_r ≤ Z_{q−i+2}` | holds |
| 4.3 boundary side | mono at one `j ≥ q + 1` | `δ : H^{n−1}(j ≤ ⊤) → H^n(⊥ ≤ j)` is `0`, so `H^{n−1}(⊥ ≤ ⊤) ↠ H^{n−1}(j ≤ ⊤)`; for `x ∈ H^{n−1}(q + 1 ≤ ⊤)` lift to `z`, image `z′` factors through `H^{n−1}(q ≤ ⊤)` so `δ z′ = 0`; `x − z′` comes from `w ∈ H^{n−1}(q + 1 ≤ j)`, `δx = δw ∈ B_{j−q+1}` | holds |
| 4.3 Checks | non-exhaustive complex at native `(1, −1)`; 1.4 complex; `×2` at native `(3, −2)`; continuity example | `H^{−1}(K/G_0) = ℤ ↠ E_1^{0,0}`: `Bᵗ = ℤ`, `B_∞ = 0`; `δ : ℤ → H^1(F^1K) = ℤ` is `z ↦ z`, `Zᵗ = 0`; `i = −2` (`H^2(F^2K) = 0`), `j = 0` (`G_0 = K`), `max(2, 3) = 3`, the page where `ℤ` becomes `ℤ/2`; `colim_j H^{n−1}(G_j/G_{q+1}) = ℤ → H^{n−1}(K) = 0` | hold |
| 4.4 (headline) | `a ≤ q < b`; `q ≥ b`; `q < a`; `×2`, degree `1` | `i = a`, `j = b`: `max(q − a + 2, b − q + 1) ≤ b − a + 1`; `j = q + 1`: page `q − a + 2`, `gr^{n−q} = abutFil(q + 1)/abutFil(q) = H^n/H^n = 0`; `H^n(⊥ ≤ q + 1) = 0 = H^{n+1}(⊥ ≤ q)` kills `H^n(q ≤ q + 1)`; `H^1(G_i) = 0` iff `i ≤ −2`, `G_0 = K`: `F^p = H^1` for `p ≤ 2`, `0` for `p ≥ 4` | holds |
| 4.4 third Check | non-exhaustive complex | `G_j = (0 → ℤ)` for `j ≥ 0`: `H^0(G_j) = ℤ → H^0(K) = 0`, not mono | holds |
| 4.6 † | Tau Ceti theorem vs 4.4 | Tau Ceti: vanishing of `H^m(i ≤ ⊤)`, `m ∈ {n − 1, n}`; 4.4: iso in degree `n`, implied through `H^{n−1}(j ≤ ⊤) → H^n(⊥ ≤ j) → H^n(⊥ ≤ ⊤) → H^n(j ≤ ⊤)` | holds; weaker as claimed |
| 5.2 index | `G_t = F^{−t}` | `abutmentFiltration (n − p′ + 1) n = im H^n(F^{p′−n−1} K)`, so classical `p = p′ − n − 1` | holds |
| 5.2 "iff" (R01) | `ℤ^(ℕ)` in degree `0` plus the non-exhaustive complex | `E_∞^{0,0} = ℤ^(ℕ) ⊕ ℤ ≅ ℤ^(ℕ) = gr^0 H^0`, all else `0 = 0`; (24.6.2): `0 ⊊ 0 ⊕ ℤ` | "only if" refuted; restate for the comparison of 4.3 |
| 5.3 (headline) | `a = −p₀`, `b = −p₁`; Stacks 24.13 with `I = ℤ`; 1.4 complex | 4.4's `F^{p′} = H^n` for `p′ ≤ n + 1 + p₁`, i.e. classical `p ≤ p₁`; `0` for `p ≥ p₀`; Stacks' `p₀(n), p₀(n + 1)` give the README's `p₀`, and shrinking `p₁` gives `p₁ ≤ p₀`; `H^1(F^sK) = ℓ^{s−1}ℤ ≠ 0` for `s ≥ 1` | holds |
| 5.3 degreewise finite | finite on `K^{n−1}, K^n, K^{n+1}` | `H^n(F^sK)`, `H^{n+1}(F^sK)` vanish once `F^sK^n = F^sK^{n+1} = 0`; iso once `F^s = K` in the three degrees | holds |
| 6.1 shifted offset (repair) | `k = 1` classical; `k = −1` E₂; `k = 0` | native `r + 1`: `(p, q) → (p + r + 1, q − r)`, `fil = −q − 1` rises by `r`: `e = 1 ↦ 0`; native `r − 1`: `fil = p` rises by `r − 1`: `e = 0 ↦ 1`; `e + k` would give `r − 2` in the first case | holds |
| 6.2 | `r = 0`; Bockstein couple; `D = ℤ/ℓ²` | `Z_1 = k^{−1}(D) = E`, `B_1 = j(0) = 0`; `ker i = 0 = im k`, `ker j = ℓℤ = im i`, `ker k = E = im j`, `B_r = 0`, `Z_r = E`; `i^r : D^{s+r+1,t−r} → D^{s+1,t}` has degree `(−r, r)`; `Z_2 = k^{−1}(ℓℤ/ℓ²) = E`, wrong model `ℤ/ℓ ⊕ 0` | holds |
| 6.3 degrees and Checks | `E(p,q) = H^{p+q}(q ≤ q + 1)`, `D(p,q) = H^{p+q}(⊥ ≤ q + 1)`; `×2` | `k` lands in `H^{n+1}(⊥ ≤ q) = D(p + 2, q − 1)`: `c = (2, −1)`; `d_r`: `(r + 1, −r)`; `A^p = H^1(F^{p−2}K)`: `0` (`p ≥ 4`), `ℤ` (`p = 3`), `ℤ/2` (`p ≤ 2`); `E(1, −1) = ℤ`, `D(1, −1) = H^0(K) = 0`, `k = ×2` injective | holds |
| 7.1 complete ⇒ `lim¹ = 0` | partial sums `σ_n = Σ_{k<n} ι_k π_k` | `((1 − s)σ)_n = −ι_n π_n`; `q_n σ_{n+1} = q_n σ_n` so `qσ` is a cone, lift `c`; `Δc − σ = ιτ`; `ι(1 − s)τ = (1 − s)(Δc − σ) = ι`, so `(1 − s)τ = 1` | holds with countable products |
| 7.1 Checks † | `×ℓ` on `ℤ`; `ℤ_ℓ`; constant | `lim¹ = ℤ_ℓ/ℤ`; `lim¹ = 0`; `lim¹ = 0`, meet `X ≠ 0` | hold |
| 7.2 enough projectives | epimorphic tower `f_n : A_{n+1} ↠ A_n`, `P ↠ ∏ A_n` with components `y_n` | choose `x_0 = 0` and lift `x_{n+1}` with `f_n x_{n+1} = x_n − y_n`: `(1 − s)x` is the epimorphism, so `lim¹ = 0`; lifting `P ↠ A_n` to a compatible family gives `P → lim A → A_n` epi | holds |
| 7.2 Mittag–Leffler | stable images `A′` | `A′_{n+1} ↠ A′_n`, `A/A′` pro-zero; six-term: `lim¹ A′ = 0 → lim¹ A → lim¹(A/A′) = 0` | holds |
| 7.2 cycle tower (repair) | `ℤ/4`; Prüfer group; `ℤ` in the 1.4 complex | at most three values; proper subgroups finite cyclic, chains stabilise (Artinian, infinite length); `ℓ^{r−1}ℤ` never constant, `lim¹ = ℤ_ℓ/ℤ` (`ℤ` is not Artinian) | holds |
| 7.3 | constant; `×ℓ`; route | `Q = ℤ`, `RQ = 0`, terms `0, 0, 0`; `Im^r = ℓ^rℤ`, `Q = 0`, `RQ = ℤ_ℓ/ℤ`, transition `×ℓ` on `ℤ_ℓ/ℤ` bijective (`ℤ_ℓ = ℓℤ_ℓ + ℤ`; `ℓx ∈ ℤ ⇒ x ∈ ℤ[1/ℓ] ∩ ℤ_ℓ = ℤ`): `0 → 0 → ℤ_ℓ/ℤ → ℤ_ℓ/ℤ → 0`; composite-limit sequence `0 → lim¹_s lim_r → lim¹ → lim_s lim¹_r → 0` since `lim²_s = 0` | holds |
| 7.4 (headline) theorems | HR 3.9, 3.10 under `s ↦ −s` | HR: `A_{−∞} = RA_{−∞} = 0`, `RE_∞ = 0` ⇒ weak (with exhaustive), `RF_{−∞} = 0`, `F_{−∞}A_∞ ≅ W`; `A_∞ = 0`, `RE_∞ = 0` ⇒ strong to `A_{−∞}`, `RA_{−∞} ≅ W`. README: the same with `A^{±∞}` swapped | agree |
| 7.4 half-plane criteria | `E_1^{s,·} = 0` in degrees `n − 1, n` for `s < s₀`; in `n − 1, n, n + 1` for `s > s₁` | LES `A^{s+1}_n → A^s_n → E^{s,n−s} → A^{s+1}_{n+1}`: kernel from degree `n − 1`, cokernel into degree `n`, so `i` iso for `s < s₀`, `ker(A^s → A^{−∞}) = 0` for `s ≤ s₀`, `W^n = 0`; for `s > s₁` `i` iso in degrees `n`, `n + 1`: `Im^r A^s` constant once `s + r > s₁`, `Z_{r+1} = k^{−1}(im i^r)` in degree `n + 1` constant, `RE_∞ = 0`, `W^n = 0` | holds |
| 7.4 Example 8.1 | `A^s = ∏_{i ≥ |s|} k` | `E_1^{s,−s} = coker i = k` (`s ≥ 0`), `E_1^{s,−1−s} = ker i = k` (`s < 0`); `d_{2m−1}`: `(−m, m − 1) → (m − 1, 1 − m)`; `k(x) = e_{m−1} ∈ im i^r` iff `r − m + 1 ≤ m − 1`, so `Z_{r+1}` is everything iff `r + 1 ≤ 2m − 1`; `ker ∩ Im^r = ⨁_{i ≥ r−m} k`, `lim¹ = ∏_{i ≥ m} k/⨁_{i ≥ m} k` | holds |
| 7.5 (headline) | route; `ℤ_ℓ`; `ℤ` | complete ⇒ `lim = lim¹ = 0` on `F^sK^m` ⇒ `1 − s` iso on `∏_s F^sK`, exact products ⇒ iso on `∏ H^n(F^sK)`; regular ⇒ `RE_∞ = 0`; `E_1^{p,−p} = 0` for `p < 0`: `W^0 = 0`, strong; `ℤ`: not complete, not strong | holds |
| 2.2 (headline) † | 1.4 complex; first quadrant | `Z_r(0,0) = ℓ^{r−1}ℤ` with degree `1` infinite; `r > max(p, q + 1)` | holds |
| 3.6 (headline) † | Hopf pages; `m = 0` | `H^1 = H^2 = 0`, `H^0 = H^3 = ℤ`; `m = 0` not exact at `H^0` | holds |

**Shape and completeness.** 31 targets in 7 layers, each with its API list, at least three Checks
(3 or 4 per target in the plan), hypotheses in the sentence and a locator; every layer ends with
Examples and Dependencies; Summary, Scope and ownership, Conventions, Exact supplier contracts, How
to read the build, Downstream consumers and References are present. The layers are named by their
mathematics and ordered by their dependency lines (towers, assignments, convergence, spectral
objects, filtered complexes, exact couples, lim¹ and conditional convergence); the README does not
say it follows a source. No LaTeX delimiters, no process words, pull-request numbers, dates or
machine paths; "lemma" occurs only in source labels and in "five-lemma induction".

**Headline theorems for the package stage** (from the Summary): stabilisation (2.2); comparison
(3.5); consequences (3.6); towers and limit page of a spectral object (4.1, 4.3); convergence in a
range of degrees (4.4) and the quadrant cases (4.5); filtered complexes (5.3, 5.4); the exact-couple
identification (6.3); Boardman's theorems (7.4); complete convergence (7.5). As round 3 recorded,
2.2, 3.5, 3.6, 4.4, 4.5, 5.3, 5.4 and the strong-convergence clause of 7.5 are statable at the pins
once the few definitions of Layers 1–3 have real bodies; 6.1–6.3 and 7.4 need StableHomotopyKTheory
§7.22's exact-couple carrier and are to be named in the module docstring as not statable.

## Not verifiable

- weibel1994, boardman1999, eilenberg-moore1962, mccleary2001, massey1952, cartan-eilenberg1956:
  settled as uncertified in the manifest and cited by locator only. Boardman's numbers 3.4(b), 5.10,
  8.10, 8.13 agree with helle-rognes2024's citations (line 153, 163, 166, 226); the numbers 7.1 and
  8.2 of 7.4's half-plane criteria do not occur in helle-rognes2024 (line 13–25 summarises the
  results without numbers) and could not be checked; the mathematics of the criteria is computed in
  the table.
- Elaboration, `#check` comparison and the one-tactic probe: not available (design stage, no
  `Suggested.lean`; this lane does not elaborate).

## Source issues

- none
