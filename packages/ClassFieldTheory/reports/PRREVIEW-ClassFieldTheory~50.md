# Review of ClassFieldTheory (pull request #1215 at b5b3cde)

**Verdict:** needs changes

This is an incremental re-review of the 6 changed lines since 41af5ec. In this folder only `README.md` changed, at lines 1212 and 1929–1930. `Suggested.lean` and `Completed/LocalGaloisGroups/Suggested.lean` are byte-identical to 41af5ec (`git diff --quiet 41af5ec HEAD`).

The two edits are correct, and they introduce no new problem. The two findings of the previous review are about the pull-request description. The description is unchanged, so both are carried below. Both are P3, and nothing is blocking. Each repair is an edit to the description, and nothing in the folder needs to change.

## R01 (P3) — The merge order against #617 and #1411 is still not stated

Carried from the previous R01, and not repaired. `scratch/pull-request.md` names neither pull request.

**Location.** The pull-request description, "ClassFieldTheory: correct hypotheses, conductors and lifting".

**Claim.** Two other open pull requests change this roadmap, and their heads conflict with this one in `TauCetiRoadmap/ClassFieldTheory/README.md` and `Suggested.lean`. Both also declare fully qualified names that this head declares, in the same namespace `TauCetiRoadmap.ClassFieldTheory`:
- #1411 (head d6e2855) declares `localAbsoluteUpperRamificationGroup` (line 525), `cyclotomicCharacter_artinMap` (line 583) and `isPrincipal_map_hilbertClassField` (line 688);
- #617 (head b22a824) declares `cyclotomicCharacter_artinMap` (line 272) and `isPrincipal_map_hilbertClassField` (line 350).

**Witness.** The overlap check (index of 2026-11-09T22:45Z) lists both pull requests as conflicting with #1215 in `TauCetiRoadmap/ClassFieldTheory/README.md` and `Suggested.lean`. The line numbers above are from `roadmaps show ClassFieldTheory --pr 1411` and `--pr 617`, with `--file Suggested.lean`.

**Repair.** Add a merge-order paragraph to the description:
- this pull request merges first;
- #617 and #1411 rebase on it and keep only the ClassFieldTheory edits this head lacks;
- #1411's `map_unitFiltration_normResidue` and `map_artinMap_unitFiltration` give way to this head's `normResidue_map_unitFiltration` and `map_artinMap_unitFiltration_eq_upper`.

The overlap check also lists conflicts in `IntegralLattices` and `QuadraticFormInvariants`, so the same paragraph can cover those. Nothing in the folder changes.

## R02 (P3) — The edit to `Completed/LocalGaloisGroups/Suggested.lean` is outside the folders this pull request declares

Carried from the previous R02, and not repaired.

**Location.** `Completed/LocalGaloisGroups/Suggested.lean`, unchanged since 41af5ec:
- line 12 is `import TauCetiRoadmap.ClassFieldTheory.Suggested`;
- line 345 applies `ClassFieldTheory.cyclotomicCharacter_artinMap`.

**Claim.** The edit is needed, because that file imports this roadmap's `Suggested.lean` and uses a declaration this head changes. But the brief names only GlobalQuadraticForms and QuadraticFormInvariants as this pull request's other folders, and the description does not mention the edit.

**Witness.** `git diff --stat origin/main...HEAD -- . ':!TauCetiRoadmap/ClassFieldTheory' ':!TauCetiRoadmap/GlobalQuadraticForms' ':!TauCetiRoadmap/QuadraticFormInvariants'` prints `Completed/LocalGaloisGroups/Suggested.lean | 112`.

**Repair.** In the description:
- name `Completed/LocalGaloisGroups` as a folder of this pull request;
- add one sentence saying that the edit re-points that file to Tau Ceti's names and to the open target `cyclotomicCharacter_artinMap`.

## Previous findings

- R01 — not repaired: the description in `scratch/pull-request.md` names neither #617 nor #1411, and states no order. Both heads still conflict and still declare `cyclotomicCharacter_artinMap` and `isPrincipal_map_hilbertClassField`. Carried as R01.
- R02 — not repaired: `Completed/LocalGaloisGroups/Suggested.lean | 112` is still in the diff outside the declared folders, and the description does not mention it. Carried as R02.

## Verified sound

**Gate, dependency check, build.**
- The worker's gate (`gate.md`) passes every check, with `build=0`.
- I reran the brief's gate command. Every folder check is 0. It reports `outside-folder=5`, and all five files are in `TauCetiRoadmap/GlobalQuadraticForms/` and `TauCetiRoadmap/QuadraticFormInvariants/`, which the brief names as this pull request's own. The gate does not list the Completed edit, which is R02.
- The dependency check (`--movable`) printed `depcheck: 235 roadmaps, 2266 edges, 0 problem(s)`. There is no UPWARD, CYCLE or `moved:` line.
- `lake env lean TauCetiRoadmap/ClassFieldTheory/Suggested.lean` (about 38 s) gives exactly six warnings, all ``declaration uses `sorry` ``, at lines 81, 97, 130, 145, 156 and 170, and nothing else.
- `Suggested.lean` is byte-identical to 41af5ec. The previous round's `#check @` pass therefore stands: the seven elaborated types match `signatures.md`, and there is no `variable` block.

**Changed passage 1: Layer 7.1 prerequisites (lines 1205–1212).**
- The edit adds "are" to "The absolute Artin map, its normalizations and the conductors have their interface in … and are consumed here". The subject's verb is "have", which does not carry over into the second clause, so "are" was needed.
- I checked every module the sentence names at the pinned Tau Ceti. `TauCeti/NumberTheory/ClassFieldTheory/Local/` contains:
  - `ArtinMap.lean`, `Unramified.lean`, `Cyclotomic.lean` and `GeometricArtinMap.lean`;
  - `ExplicitCyclotomicSymbol/` (`ArtinMap`, `Basic`, `Norm`, `ProductFormula`);
  - `Conductor/` (`Basic`, `UpperNumbering`).
- Twelve other layers say "The interface is in …, and consumed here" (lines 848, 923, 960, 990, 1059, 1153, 1471, 1579, 1650, 1784, 1839, 2161). There "is" carries over, so they need no "are".

**Changed passage 2: Layer 13.1 prerequisites (lines 1924–1933).**
- The edit is the same "are", plus a reflow.
- `TauCeti/NumberTheory/ClassFieldTheory/Global/HasseNorm/` exists (`Basic`, `Quadratic`).
- `ClassFields/` is `TauCeti/NumberTheory/ClassFieldTheory/ClassFields/` (`KroneckerWeber`, `RayClassField`, `RaySubgroup`, `CyclotomicLevel`, `RingClass/`). It is not under `Global/`. The README reads a second path relative to `ClassFieldTheory/` throughout, so this one is consistent:
  - line 1650: `Brauer/Archimedean/` is `ClassFieldTheory/Brauer/Archimedean`;
  - line 1839: `Global/AdmissibleModulus/`;
  - line 2127: `ClassFields/RingClass/`.
- The rest of the sentence is unchanged, and the previous round checked it against lines 2018, 2078 and the headline table.

**Seeded sample.**
- The changed lines fall in two sampled targets, 7.1 and 13.1, and they carry no locator.
- The 7.1 locators are Serre, *Local Fields* (uncertified): see Not verifiable.
- I re-read every 13.1 locator in the cache:
  - Milne CFT V Theorem 3.17 (principal ideal theorem): milne-cft line 7252, PDF page 170, printed p. 161, as cited at README line 2020;
  - VIII Theorem 3.1 (Hasse norm theorem, cyclic `L/K`): milne-cft line 10629;
  - VIII Remark 3.2 (`5²` is a local norm everywhere from `ℚ(√13,√17)` but not a global norm): milne-cft line 10642. Theorem 3.1 and Remark 3.2 are on PDF page 243, which is printed p. 234, as cited at lines 1944 and 1949;
  - V Theorem 3.27 (conductor–discriminant formula): milne-cft line 7423;
  - V Remark 3.28 (`f(ψ) = f(L^{ker ψ}/K)`): milne-cft line 7436;
  - V Example 3.30 (`disc ℚ(ζ_p) = ±p^{p−2}`): milne-cft line 7443;
  - Kopp–Lagarias Theorems 1.1, 1.2 and 1.3: kopp-lagarias lines 128, 160 and 174.
- All of these match the statements at README lines 1941–1949, 2019–2020, 2078–2080, 2114–2116 and 2123.

**Suppliers and overlaps.**
- No supplier citation changed.
- `roadmaps resolve` (`citations.md`) finds no unresolved citation or Lean name.
- `overlaps.md` lists no dropped or revision-only id in either direction.
- The two conflicting pull requests are R01.

**Headlines and padding.** `Suggested.lean` is unchanged, so the previous probe stands: 0 of 36 one-tactic attempts closed a theorem. The headlines are:
- `cyclotomicCharacter_artinMap`;
- `normResidue_map_unitFiltration`;
- `localAbsoluteUpperRamificationGroup` with `map_artinMap_unitFiltration_eq_upper`;
- `isPrincipal_map_hilbertClassField`;
- `count_relDiscr_eq_finsum_abelianConductor_exponent`;
- `abelianConductor_eq_lcm`.

**Remark on untouched text (no change requested).** IntegralIwasawaTheory README line 134 still cites "ClassFieldTheory §§8–11". That means Layers 8–11, and the fix belongs to that roadmap.

**Adversarial pass.** "Arithmetic" means `χ(Art u) = u⁻¹` and that a uniformizer maps to arithmetic Frobenius.
- The first two rows are new in this round and cover the changed passages. No Lean statement changed.
- The other rows are carried from the previous report (PRREVIEW-ClassFieldTheory~48, with values computed at ~45), for statements the diff leaves untouched.

| Statement | Instances | Values computed (each side) | Result | Change |
|---|---|---|---|---|
| 7.1 prerequisites: the interface paths (new) | the 6 modules the sentence names; the wrong model "a `Local/Conductor.lean` file" | 6 of 6 resolve at the pin: 4 files and 2 directories (`ExplicitCyclotomicSymbol/` with 4 files, `Conductor/` with 2). `Conductor` is a directory, and the sentence writes `Conductor/`, so it matches. | holds | none |
| 13.1 prerequisites: the interface paths (new) | `Global/HasseNorm/`; `ClassFields/` read as `Global/ClassFields/` and as `ClassFieldTheory/ClassFields/` | `Global/HasseNorm/` has 2 files. `Global/ClassFields/` does not exist. `ClassFieldTheory/ClassFields/` has 4 files, `KroneckerWeber.lean` among them, and `RingClass/`. The README's other second paths (lines 1650, 1839, 2127) are all relative to `ClassFieldTheory/`, so the second reading is the house one. | holds | none |
| Scope: open headlines are the theorems of `Suggested.lean` (r48) | items 3 and 9 against `Suggested.lean` | `3 + 4 − 1 = 6` theorems, plus 1 def | holds | none |
| Former-section table (r48) | 18 rows; §2.1, §5.1 collisions | 18 → 18 same-titled headings; 2 collisions, both named | holds | none |
| Layer 13 prerequisites: 2 open headline targets and 1 supporting open target (r48) | open targets at lines 1970, 2018, 2078 | `3 − 2 = 1` supporting target | holds | none |
| `cyclotomicCharacter_artinMap` (r45) | `ℚ₃`, `u=4`, `μ₉`; `ℚ₂`, `u=−3`, `μ₁₆`; `μ₈` | `4·7≡1 mod 9`, so `χ=7` against `4`. `13·5≡1 mod 16`, so `χ=5` against `13`. `μ₈` does not separate the conventions. | holds | none |
| same, hypothesis automatic (r45) | `a∈1+pℤ_p`, `X^{ℓ^k}−a` at `1` | `‖f(1)‖ ≤ p⁻¹ < 1 = ‖f′(1)‖²`, so `a` is divisible and its valuation is `0` | holds | none |
| `normResidue_map_unitFiltration` (r45) | `ℚ₂(i)`, `n=0,1,2`; `ℚ₃(ζ₉)`; `𝔽₂((t))`; unramified | `U¹→G` and `U²→1`; orders `6,3,1` on both sides; break at `1`; `G⁰=1` and `U⁰⊆N` | holds | none |
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

These are uncertified or waived in the manifest and are cited by locator only. They are unchanged at this head, and every statement they support was checked mathematically in the table:
- serre-local-fields (uncertified): the 7.1 locators XV §2, Theorem 2 and Corollary 3 to Theorem 1, and IV §§1–3, V, VI §2, IX §8, XI–XIV;
- neukirch-ant (uncertified): V Theorem 6.2 and VI §7;
- nsw (uncertified): (7.1.8)(i), (7.2.5), (7.2.6) and (7.3.1)–(7.3.4);
- artin-tate (waived): V–VIII and XI–XV, including the Chapter XIII citation at line 2019.

Also not verified:
- kopp-lagarias was read as arXiv v3, and I did not compare it with the published numbering.
- I did not elaborate `Completed/LocalGaloisGroups/Suggested.lean`. It is outside this folder and the brief's Lean commands, and it is unchanged since 41af5ec.
- I did not check ownership against open pull requests that the brief lists without files. I checked #617 and #1411 with `roadmaps show` and `roadmaps overlaps`.

## Source issues

- none
