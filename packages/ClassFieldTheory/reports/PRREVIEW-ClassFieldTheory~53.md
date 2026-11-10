# Review of ClassFieldTheory (pull request #1215 at c1d130b)

**Verdict:** needs changes

This is an incremental re-review of 0 changed lines since b5b3cde. The only commit since then, c1d130b, changes `TauCetiRoadmap/GlobalQuadraticForms/README.md` and nothing else. `TauCetiRoadmap/ClassFieldTheory/` and `Completed/LocalGaloisGroups/Suggested.lean` are byte-identical to b5b3cde (`git diff --quiet b5b3cde HEAD`).

The pull-request description is also unchanged, so both previous findings are carried. Both are P3 and nothing is blocking. Both repairs are edits to the description, and nothing in the folder needs to change. The R01 repair is rewritten so that it agrees with the merge order #1411's description already states. The repair the previous round proposed would have contradicted it.

## R01 (P3) — The merge order against #617 and #1411 is still not stated

Carried from the previous R01; not repaired.

**Location.** The pull-request description, "ClassFieldTheory: correct hypotheses, conductors and lifting" (`scratch/pull-request.md`). Neither #617 nor #1411 is named, and no order is stated.

**Claim.** Two other open pull requests change this roadmap and conflict with this head in `TauCetiRoadmap/ClassFieldTheory/README.md` and `Suggested.lean`. They also declare names that this head declares, with the same fully qualified names: all three files put them under `namespace TauCetiRoadmap.ClassFieldTheory`, inside `section`s and not sub-namespaces.
- #617 at cca39ab declares `cyclotomicCharacter_artinMap` (its `Suggested.lean:272`) and `isPrincipal_map_hilbertClassField` (`:350`).
- #1411 at d6e2855 declares `localAbsoluteUpperRamificationGroup` (`:525`), `cyclotomicCharacter_artinMap` (`:583`) and `isPrincipal_map_hilbertClassField` (`:688`).
- #1411 also states the two unit-filtration theorems under different names. Its `map_unitFiltration_normResidue` (`:504`) and `map_artinMap_unitFiltration` (`:541`) are this head's `normResidue_map_unitFiltration` (`Suggested.lean:97`) and `map_artinMap_unitFiltration_eq_upper` (`:130`).

#1411's description already states an order, as quoted in its reviews: "whichever merges first, the others rebase onto it", and #1411's unit-filtration names "survive, and #1215's renamed copies are dropped on rebase". The previous round asked this description to say the opposite, that #1411's names give way. The two descriptions would then contradict each other, so that repair is withdrawn.

**Witness.** `scratch/overlaps.md` (index of 2026-11-09T23:31Z) lists #617 and #1411 as conflicting with #1215 in both files of this folder. The line numbers are from `roadmaps show ClassFieldTheory --pr 617` and `--pr 1411` with `--file Suggested.lean`, against this head's `Suggested.lean`.

**Repair.** Add a merge-order paragraph to the description that agrees with #1411's:

> #617 and #1411 also change ClassFieldTheory. Whichever of the three merges first, the others rebase onto it and keep one copy each of `cyclotomicCharacter_artinMap`, `isPrincipal_map_hilbertClassField` and `localAbsoluteUpperRamificationGroup`. As #1411 states, its `map_unitFiltration_normResidue` and `map_artinMap_unitFiltration` survive. This head's `normResidue_map_unitFiltration` and `map_artinMap_unitFiltration_eq_upper` are dropped on rebase. In the README's table of names used elsewhere, the row for `map_unitFiltration_normResidue` (line 301) is dropped, and the row for `closure_map_artinMap_unitFiltration` (line 302) is re-pointed to `map_artinMap_unitFiltration`.

If the author wants this head's names to survive instead, #1411's description has to change in the same step. Either way, the two descriptions must name the same survivor. Test: the description names #617 and #1411 and states one order, and that order matches #1411's. Nothing in the folder changes. The overlap check also lists conflicts in `QuadraticFormInvariants`, and the same paragraph can cover them.

## R02 (P3) — The edit to `Completed/LocalGaloisGroups/Suggested.lean` is outside the folders this pull request declares

Carried from the previous R02; not repaired.

**Location.** `Completed/LocalGaloisGroups/Suggested.lean`, unchanged since b5b3cde:
- line 12 is `import TauCetiRoadmap.ClassFieldTheory.Suggested`;
- line 345 applies `ClassFieldTheory.cyclotomicCharacter_artinMap p F u hu σ hσ`.

**Claim.** The edit is needed, because the file imports this roadmap's `Suggested.lean` and uses a declaration this head restates. But the brief names only GlobalQuadraticForms and QuadraticFormInvariants as this pull request's other folders, and the description does not mention the edit. The targeted build (`lake build TauCetiRoadmap.ClassFieldTheory.Suggested`) never compiles that file either.

**Witness.** `git diff --stat origin/main...HEAD`, restricted to paths outside the three declared folders, prints `Completed/LocalGaloisGroups/Suggested.lean | 112` (62 insertions, 50 deletions). The gate does not list the file because its configured outside-folder allowance covers it. `roadmaps list` does show `LocalGaloisGroups` among #1215's folders.

**Repair.** In the description:
- name `Completed/LocalGaloisGroups` as a folder of this pull request;
- add one sentence saying that the edit re-points that file to Tau Ceti's names and to this head's `cyclotomicCharacter_artinMap`.

#1411 did the same for its own edit to this file. Once the board records the folder, the review brief and the targeted build include it. Nothing in `TauCetiRoadmap/ClassFieldTheory/` changes.

## Previous findings

- R01 — not repaired: the description in `scratch/pull-request.md` still names neither #617 nor #1411. #617 (cca39ab) and #1411 (d6e2855) still declare `cyclotomicCharacter_artinMap` and `isPrincipal_map_hilbertClassField` in this namespace. Carried as R01, with a repair that agrees with #1411's order.
- R02 — not repaired: `Completed/LocalGaloisGroups/Suggested.lean | 112` is still changed outside the declared folders, and the description does not mention it. Carried as R02.

## Verified sound

**Gate, dependency check, build.**
- The worker's gate (`scratch/gate.md`) passes every check, with `build=0`.
- I reran `gate … ClassFieldTheory --base origin/main`. Every folder check is 0. It reports `outside-folder=5`, and all five files belong to the pull request's own folders:
  - `TauCetiRoadmap/GlobalQuadraticForms/README.md` and `Suggested.lean`;
  - `TauCetiRoadmap/QuadraticFormInvariants/NativeCompletion.md`, `README.md` and `Suggested.lean`.
- The dependency check (`--movable`), verbatim: `depcheck: 235 roadmaps, 2266 edges, 0 problem(s)`. There is no UPWARD, CYCLE or `moved:` line. ClassFieldTheory is on main, so it consumes only Mathlib, Tau Ceti and roadmaps on main, and the check finds no other edge.
- `lake env lean TauCetiRoadmap/ClassFieldTheory/Suggested.lean` exits 0. Its only output is six ``declaration uses `sorry` `` warnings, at lines 81, 97, 130, 145, 156 and 170.
- `Suggested.lean` is byte-identical to b5b3cde. Its 7 declarations match `scratch/signatures.md` (6 theorems and the def `localAbsoluteUpperRamificationGroup`), and the file has no `variable` block. The earlier `#check @` pass therefore stands, and no binder can have been lost.

**The sibling change since b5b3cde.** The GlobalQuadraticForms diff (its 4.1 Check on the real embedding of `w'.comap σ`, and its 8.2 route through `formClass_atFinitePlace_eq_nsmul_hyperbolicClass`) never mentions this roadmap. Two citations between the roadmaps still resolve at this head:
- This README's consumer line (lines 2210–2211) says that GlobalQuadraticForms §4.2 consumes the first fundamental inequality of Layer 10, and §4.3 the quadratic Hasse norm theorem of Layer 13. Both headings exist in that README: `### 4.2 The global square theorem` (line 580) and `### 4.3 The quadratic Hasse norm adapter` (line 645).
- Both declarations resolve at the pinned Tau Ceti: `finrank_le_index_range_ideleClassNormMap` (`Global/IdeleClass/FirstInequality.lean:108`) and `exists_sq_sub_mul_sq_iff_forall_completion` (`Global/HasseNorm/Quadratic.lean:45`). This README names them at lines 1703 and 1945.

**Seeded sample.** No sampled target lies in changed text, since nothing in the folder changed. I spot-checked three sampled targets against milne-cft. All are where cited:
- **11.1:**
  - V Theorem 5.3 (reciprocity law) is at milne-cft line 8123, printed pp. 178–179. Part (a) is triviality on `K^×`. Part (b), on p. 179, is the isomorphism `C_K/Nm(C_L) ≃ Gal(L/K)` for finite abelian `L/K`.
  - VII Theorem 8.1(a) is at line 10042, printed p. 221.
- **12.1:**
  - V Theorem 5.5 (existence theorem, open subgroups of finite index) is at line 8152, printed p. 179.
  - VII Theorem 9.5 is at line 10287, printed p. 226. Its statement omits "open"; see Source issues. The README states the correct open form.
- **14.1:**
  - VIII Theorem 4.2 (the fundamental exact sequence for `Br`) is at line 10937, printed p. 241.
  - V Example 5.4 (the product formula for the Hilbert symbol) is at line 8142, printed p. 179.
  - The Tau Ceti names resolve at the pin: `hilbertProductFormula` (`Global/Hilbert/Reciprocity.lean:65`), `sum_finiteHilbertInvariantAt_add_sum_infiniteHilbertInvariantAt_eq_zero_iff` (`Global/QuadraticReciprocity.lean:185`) and `TauCeti.hilbertSymbol_productFormula` (`QuadraticForm/Global/ProductFormula.lean:67`).

The previous round re-read every 13.1 locator. The 7.1 locators are serre-local-fields, which is uncertified.

**Suppliers, citations, overlaps.**
- `scratch/citations.md` finds no unresolved cross-roadmap citation or Lean name.
- `scratch/overlaps.md` lists no id dropped by an open pull request, no id defined only by an open revision, and no id this pull request drops that other roadmaps cite.
- The two conflicting pull requests are R01. I resolved their declarations with `roadmaps show` at cca39ab and d6e2855.
- No object or supplier citation changed this round, so I did not repeat the ownership search against the other open roadmaps. The previous rounds' search stands.

**Headlines and padding.** `Suggested.lean` is unchanged, so the previous one-tactic probe stands: none of the 36 attempts closed a theorem. The headlines are:
- `cyclotomicCharacter_artinMap`;
- `normResidue_map_unitFiltration`;
- `localAbsoluteUpperRamificationGroup` with `map_artinMap_unitFiltration_eq_upper`;
- `isPrincipal_map_hilbertClassField`;
- `count_relDiscr_eq_finsum_abelianConductor_exponent`;
- `abelianConductor_eq_lcm`.

**Adversarial pass.** No statement changed. Rows marked (r50) are carried from PRREVIEW-ClassFieldTheory~50, which carried its earlier rows from ~48 and ~45. Rows marked (new) are computed in this round for the spot-checked sampled targets. "Arithmetic" means `χ(Art u) = u⁻¹`, with a uniformizer mapping to arithmetic Frobenius.

| Statement | Instances | Values computed (each side) | Result | Change |
|---|---|---|---|---|
| 11.1 Example, Artin symbols (new) | `ℚ(ζ₅)/ℚ` at `(2)`, `(3)`; the product `(6)` | `ζ↦ζ²`, `ζ↦ζ³`, product `ζ↦ζ⁶=ζ`; `6 ≡ 1 mod 5` and `6 > 0`, so `(6)` is in the ray mod `5∞` and its symbol is trivial | holds | none |
| 12.1 existence, "open finite-index" (new) | `C_ℚ ≅ ℝ_{>0} × ∏ ℤ_p^×`, surjecting onto `∏_{p odd} {±1}` | a discontinuous functional on `𝔽₂^ℕ` has a non-open index-2 kernel. Norm groups are open, so without "open" the statement fails. With "open", the README is right. | holds | none |
| 12.1 ⚠ admissibility (new) | `ℚ(i)/ℚ`, moduli `1`, `(4)`, `(4)∞` | `Cl_1 = 1`, but `Frob_3 ≠ 1` (3 inert); `Cl_(4) = (ℤ/4)ˣ/{±1} = 1`; `Cl_(4)∞ = (ℤ/4)ˣ ≅ ℤ/2` | holds | none |
| 12.1 ⚠ meet needs abelian (new) | two `D₄` octics over a common biquadratic `B` | `Gal = D₄ ×_{V₄} D₄`, order `16`; the commutator subgroup is the diagonal of the centres, order `2`; abelianization order `8` against `[B:ℚ] = 4` | holds | none |
| 14.1 Checks (new) | `(−1,−1)/ℚ`; `p=3`, `q=7` | factors `−1` at `2` and `∞`, product `1`; in `ZMod 2`, `1+1=0`. `7≡1 mod 3` gives `(7/3)=1`; squares mod 7 are `{1,2,4}`, so `(3/7)=−1`; `(−1)^{1·3}=−1` | holds | none |
| 7.1 prerequisites, interface paths (r50) | 6 modules; wrong model `Local/Conductor.lean` | 6 of 6 resolve at the pin (4 files, 2 directories) | holds | none |
| 13.1 prerequisites, interface paths (r50) | `Global/HasseNorm/`; `ClassFields/` under `Global/` and under `ClassFieldTheory/` | 2 files; `Global/ClassFields/` is absent; `ClassFieldTheory/ClassFields/` has 4 files and `RingClass/` | holds | none |
| Scope: open headlines (r48) | items 3 and 9 against `Suggested.lean` | `3 + 4 − 1 = 6` theorems, plus 1 def | holds | none |
| Former-section table (r48) | 18 rows; §2.1, §5.1 collisions | 18 → 18 headings; 2 collisions, both named | holds | none |
| Layer 13 open targets (r48) | lines 1970, 2018, 2078 | `3 − 2 = 1` supporting target | holds | none |
| `cyclotomicCharacter_artinMap` (r45) | `ℚ₃`, `u=4`, `μ₉`; `ℚ₂`, `u=−3`, `μ₁₆`; `μ₈` | `4·7≡1 mod 9`, so `χ=7` against `4`; `13·5=65≡1 mod 16`, so `χ=5` against `13`; `μ₈` does not separate the conventions | holds | none |
| same, hypothesis automatic (r45) | `a∈1+pℤ_p`, `X^{ℓ^k}−a` at `1` | `‖f(1)‖ ≤ p⁻¹ < 1 = ‖f′(1)‖²` | holds | none |
| `normResidue_map_unitFiltration` (r45) | `ℚ₂(i)`, `n=0,1,2`; `ℚ₃(ζ₉)`; `𝔽₂((t))`; unramified | `U¹→G`, `U²→1`; orders `6,3,1` on both sides; break at `1`; `G⁰=1` and `U⁰⊆N` | holds | none |
| `localAbsoluteUpperRamificationGroup` (r45) | depth `−1`; `ℚ₂(ζ₈)`; `X³−5` over `ℚ₅` | `G_K`; `{1,3,5,7},{1,3,5,7},{1,5},{1}`; `C₃↦1` in `S₃^ab` | determines the object | none |
| `map_artinMap_unitFiltration_eq_upper` (r45) | `n=0`; unramified quadratic; `ℚ₂(ζ₈)`; `Kˣ` | inertia = inertia; `1=1`; `{1,3,5,7},{1,5},{1}`; dense, not equal | holds | none |
| extension of ideals read on ideles (r45) | `ℚ→ℚ(i)` at 2 and 3; `ℚ→ℚ(∛2)` at 5 | `(2)` against `(1+i)` (norm `2≠4`); `(3)` against `(9)`; `5𝒪_E` against `(125)` | holds | none |
| `isPrincipal_map_hilbertClassField` (r45) | `ℚ`; `ℚ(√−5)` | `H(ℚ)=ℚ`; `𝔭` not principal, and `𝔭𝒪_H=(1+i)` | holds | none |
| the route's `hT` (r45) | `ℚ(√−5)`; `hT` dropped | `H'=H`; dropping it forces `Cl_K=1`, against `[𝔭]≠1` | holds | none |
| `count_relDiscr_eq_finsum_abelianConductor_exponent` (r45) | `ℚ(i)`, `ℚ(ζ₈)`, `ℚ(ζ₅)`, `ℚ(ζ₉)`, `ℚ(√13,√17)` | `2=0+2`; `8=0+2+3+3`; `3=0+1+1+1`; `9=0+1+2·4`; `2=0+1+0+1` | holds | none |
| `abelianConductor_eq_lcm` (r45) | `ℚ(ζ₈)`; `ℚ(√2)`; product and lcm swapped | `(8)∞`; `(8)`; `2⁸` against `2³` | holds | none |
| 0.1 Nakayama–Rim (r45) | `ℤ[C₂]`; trivial `ℤ` | `Ĥ⁰=0`; `Ĥ⁰=ℤ/2` | holds | none |
| 2.1 res/cor/inf (r45) | cyclic `4→2→8` | `1/2`; `1/2`; `1/4` | holds | none |
| 3.1 Nakayama map (r45) | unramified cubic | `Frob↦[π]`, `Frob²↦[π²]` | holds | none |
| 4.1 quadratic test (r45) | degree 2; `V₄`; trivial layer | one nonzero value; three non-norm cosets; the zero map | holds | none |
| 5.1 Euler characteristic (r45) | `ℚ₂` with `𝔽₂`, `𝔽₃`, `0` | `8=2·2·2`; `3=3·1·1`; `1` | holds | none |
| 6.1 local reciprocity (r45) | `ℚ₉/ℚ₃`; `ℚ₂(ζ₅)` | `4↦1` and `3↦Frob`; `ζ₅↦ζ₅²` against `ζ₅³` | holds | none |
| 7.1 conductor Checks (r45) | `ℚ₂(√2)`, `ℚ₂(ζ₁₂)`, `ℚ_p(μ_p)` | `f=3`; `0+0+2+2=4`; the sum `p−2` against the max `1` | holds | none |
| 8.1 conductor exception (r45) | `ℚ₂`, `n=0,1,2` | `0`; `U¹⟨2⟩=ℚ₂ˣ` gives `0≠1`; `2` | holds | none |
| 9.1 Weil transfer (r45) | `𝔽₂((s))/𝔽₂((t))`, `t=s²` | index `1≠2` | holds | none |
| 10.1 lifting obstruction (r45) | `ℚ(√13,√17)` | `lcm=2<4=#H²(G,C_L)` | holds | none |
| 11.1 global reciprocity (r45) | `ℚ(ζ₅)`, `(2),(3)` | `ζ↦ζ⁶=ζ`, and `6≡1 mod 5` | holds | none |
| 12.1 Kummer index (r45) | `ℚ(ζ₃)`, `p=3` | `#U(S)/U(S)³=9`; `81/9=9` | holds | none |
| 13.1 Checks (r45) | `25`; `(−1,−1)/ℚ(√2)`; `ℤ+2ℤ[i]`; `ℚ(ζ₇+ζ₇⁻¹)` | `25=5²`; `(−1,1)₂=1`; `h=1`, `disc=−16`; `14/9<2` | holds | none |
| 14.1 Hilbert and quadratic reciprocity (r45) | `(−1,−1)/ℚ`; `p=3`, `q=7` | `½+½=0`; `(7/3)=1`, `(3/7)=−1`, `(−1)^{3}=−1` | holds | none |

## Not verifiable

These are uncertified or waived in the manifest and are cited by locator only. They are unchanged at this head, and the statements they support were checked mathematically in the table:
- serre-local-fields (uncertified): the 7.1 locators;
- neukirch-ant (uncertified): V Theorem 6.2 and VI §7;
- nsw (uncertified): (7.1.8)(i), (7.2.5), (7.2.6) and (7.3.1)–(7.3.4);
- artin-tate (waived): V–VIII and XI–XV.

Also not verified:
- I did not elaborate `Completed/LocalGaloisGroups/Suggested.lean`. It lies outside this folder and the brief's Lean commands, and it is unchanged since b5b3cde.
- I did not read #1411's and #617's descriptions myself. #1411's merge-order sentences are quoted from its reviews at d6e2855 (PRREVIEW-ClassFieldTheory~47 and ~51 in this package's reports).
- kopp-lagarias was read as arXiv v3, and I did not compare it with the published numbering.

## Source issues

- **Misprint** in milne-cft at VII Theorem 9.5, printed p. 226: the source says every finite-index subgroup of the idele class group is a norm group; it should say every open finite-index subgroup, as the section's opening (p. 223) and Lemma 9.4 do, and as Exercise V.5.11 shows is necessary; affects nothing.
