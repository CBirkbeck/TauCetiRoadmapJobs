# Review of ClassFieldTheory (pull request #1215 at 41af5ec)

**Verdict:** needs changes

This is an incremental re-review of the 43 changed lines since d587e53. Only `README.md` changed in the folder. `Suggested.lean` and `Completed/LocalGaloisGroups/Suggested.lean` are byte-identical to d587e53.

The two folder findings of the previous review are repaired:
- the Scope sentence about open targets;
- the former-section table, which the overlap check now reads.

The two findings about the pull-request description are not repaired, and they are carried below. Both are P3, so nothing is blocking. Each repair is an edit to the description, and nothing in the folder needs to change.

## R01 (P3) — The merge order against #617 and #1411 is still not stated

Carried from the previous R03, and not repaired. `scratch/pull-request.md` is unchanged, and the description still names neither pull request.

**Location.** The pull-request description, "ClassFieldTheory: correct hypotheses, conductors and lifting".

**Claim.** Two other open pull requests change this roadmap, and both heads conflict with this one in `TauCetiRoadmap/ClassFieldTheory/README.md` and `Suggested.lean`. They also declare fully qualified names that this head declares, in the same namespace `TauCetiRoadmap.ClassFieldTheory`:
- #1411's `Suggested.lean` declares `localAbsoluteUpperRamificationGroup` (line 525), `cyclotomicCharacter_artinMap` (line 583) and `isPrincipal_map_hilbertClassField` (line 688);
- #617's `Suggested.lean` declares `cyclotomicCharacter_artinMap` (line 272) and `isPrincipal_map_hilbertClassField` (line 350).

**Witness.** `roadmaps overlaps ClassFieldTheory` (index of 2026-11-09T20:46Z) reports both conflicts:
- "#1215 and #1411 conflict in … `TauCetiRoadmap/ClassFieldTheory/README.md`, `TauCetiRoadmap/ClassFieldTheory/Suggested.lean`";
- the same files for #617.

**Repair.** Add a merge-order paragraph to the description:
- this pull request merges first;
- #617 and #1411 rebase on it and keep only the ClassFieldTheory edits this head lacks;
- #1411's `map_unitFiltration_normResidue` and `map_artinMap_unitFiltration` give way to this head's `normResidue_map_unitFiltration` and `map_artinMap_unitFiltration_eq_upper`.

README line 301 already maps the only one of those names that another roadmap cites. Nothing in the folder changes.

## R02 (P3) — The edit to `Completed/LocalGaloisGroups/Suggested.lean` is outside the folders this pull request declares

Carried from the previous R04, and not repaired.

**Location.** `Completed/LocalGaloisGroups/Suggested.lean`, which has 62 insertions and 50 deletions against main:
- line 12 is `import TauCetiRoadmap.ClassFieldTheory.Suggested`;
- line 345 applies `ClassFieldTheory.cyclotomicCharacter_artinMap p F u hu σ hσ`.

**Claim.** The edit is needed, because that file imports this roadmap's `Suggested.lean` and uses a declaration this head changed. But the brief names only GlobalQuadraticForms and QuadraticFormInvariants as this pull request's other folders.

**Witness.** `git diff --stat origin/main...HEAD -- . ':!TauCetiRoadmap/ClassFieldTheory' ':!TauCetiRoadmap/GlobalQuadraticForms' ':!TauCetiRoadmap/QuadraticFormInvariants'` prints `Completed/LocalGaloisGroups/Suggested.lean | 112`.

**Repair.** In the description:
- name `Completed/LocalGaloisGroups` as a folder of this pull request;
- add one sentence saying that the edit re-points that file to Tau Ceti's names and to the open target `cyclotomicCharacter_artinMap`.

## Previous findings

- R01 — repaired: lines 72–76: "The **open targets** close the items that have them. The open headline theorems among them are the theorems stated in `Suggested.lean`. The comparison … (item 9, Layer 13) is an open target too, … stated in this README only."
- R02 — repaired: lines 255–279: the header is "| Former section | Where it is now |", with one row each for §2.1 … §2.7, §4, §4 Layer k, "Layer 0, item 4" and §5.1 … §5.8. The overlap check now lists no dropped id that another roadmap cites.
- R03 — not repaired: the description in `scratch/pull-request.md` is unchanged and names neither #617 nor #1411. Carried as R01.
- R04 — not repaired: `Completed/LocalGaloisGroups/Suggested.lean | 112` is still in the diff outside the declared folders, and the description does not mention it. Carried as R02.

## Verified sound

**Gate, dependency check, build.**
- The worker's gate (`gate.md`) passes every check, with `build=0`.
- I reran the brief's gate command. Every folder check is 0. It reports `outside-folder=5`, and all five files are in `TauCetiRoadmap/GlobalQuadraticForms/` and `TauCetiRoadmap/QuadraticFormInvariants/`, which the brief names as this pull request's own. The Completed edit is R02.
- The dependency check (`--movable`) printed `depcheck: 235 roadmaps, 2262 edges, 0 problem(s)`. There is no UPWARD, CYCLE or `moved:` line.
- `lake env lean TauCetiRoadmap/ClassFieldTheory/Suggested.lean` gives exactly six warnings, all ``declaration uses `sorry` ``, at lines 81, 97, 130, 145, 156 and 170, and nothing else.

**Signatures.**
- I elaborated a scratch copy with `#check @` on all seven declarations. Each elaborated type matches `signatures.md`, character for character.
- The file has no `variable` block, so no binder can be lost.
- The same scratch file pinned what the changed passages name:
  - `ClassGroup.extendedHom` (it needs `Module.IsTorsionFree A B` and domains, which hold for `𝓞 K → 𝓞 E`);
  - `ClassGroup.extendedHom_mk`;
  - `Ideal.map_algebraMap_eq_finsetProd_pow` (for a nonzero maximal `p`, with no Galois hypothesis);
  - `TauCeti.GlobalNumberFields.ideleClassExtension` (for any `Algebra K L` between number fields).

**Changed passage 1: the Scope sentence (lines 69–76).**
- It agrees with the other places that describe `Suggested.lean`:
  - line 61 ("states the open headline theorems");
  - line 711 ("The open headline theorems of this roadmap, stated in `Suggested.lean`");
  - the Suggested module docstring ("The open headline theorems stated below are …").
- It also agrees with item 9 (lines 117–125), which keeps the comparison among the Layer 13 open targets. See the first new row of the table for the count.

**Changed passage 2: the former-section table (lines 253–279).** I checked every row against main (`TauCetiRoadmap/ClassFieldTheory/README.md` at 3090489) and against the heading at this head:
- §2.1–§2.7 on main (lines 259, 287, 323, 352, 416, 460 and 479: Formations, Class formations, Fundamental classes, Tate's theorem…, The direction of reciprocity, Frobenius convention, Further pinned conventions) are C.1–C.7 here (lines 308, 338, 378, 411, 479, 528 and 551), with the same titles.
- §4 "Build plan" (main line 619) is Layers 0–14 (lines 773–2197). Each main "§4 Layer k" (main lines 642–1872) has the same title as Layer k here. The exception is Layer 0, which is retitled from "audit and complete…" to "the generic Tate-cohomology suppliers".
- Main's Layer 0, item 4 ("Port or prove … only what is genuinely missing", main line 656) is the bullets *The operations* (line 783) through *Primary components* (line 819). The bullets *The Tate–Nakayama theorem* (line 791) and *The theorem of Nakayama and Rim* (line 798) exist.
- §5.1–§5.8 (main lines 1915–2040) are W.1–W.8 (lines 2230–2380), with the same titles.
- The collision sentence is exact. Every layer here has only the subsection k.1, so the former ids that share digits with a subsection are §2.1 (Layer 2's 2.1) and §5.1 (Layer 5's 5.1), and no others. "§4" differs from "4.1".
- I resolved the live citations through the table, and each one lands on matching content:
  - EllipticCurveModularityWild3Adic lines 44 and 77, "§2.6 (arithmetic Frobenius convention)": this is C.6.
  - AnticyclotomicLocalUnits line 27, "`χ_cyc(Art_Φ(u))=N(u)⁻¹` (ClassFieldTheory §2.6)": C.6, line 540, states exactly this. Its "§§2.5–2.6" is C.5–C.6.
  - EndoscopicTransferAndUnitaryTraceComparison lines 90, 209 and 217, "§2.4 and Layer 0, item 4": these are C.4 and the Tate–Nakayama bullet.
  - HeckeStacksAndLocalShtukas lines 223 and 946, "§4 Layer 9": this is Layer 9, the local Weil group.
  - AutomorphicSpectralTheory line 3709, "§4, Layers 11–12": these are Layers 11–12.
- Live `roadmaps overlaps ClassFieldTheory` lists no id that this pull request drops and another roadmap cites, and no cited id that is dropped or that only an open revision defines.

**Changed passage 3: the Layer 13 prerequisites sentence (lines 1924–1933).**
- It names the principal ideal theorem and the conductor–discriminant formula as open headline targets. These match line 2018 ("an open target"), line 2078 ("an open target") and the headline table (lines 718–719).
- It names the comparison as the supporting open target. This matches the target "Extension of ideals, read on ideles" (lines 1970–2016), and step 4 of the principal ideal theorem's route reads that square (line 2055).
- The prerequisites line lists GlobalNumberFields' extension of ideles and the ray class of an idele class, which are the comparison's *Needs*.

**Seeded sample.**
- All fifteen targets, 0.1–14.1, were verified at their locators by the previous review at d587e53. The only change in them is the 13.1 prerequisites sentence, which carries no locator.
- I re-read two 13.1 locators in milne-cft:
  - line 7252 is V Theorem 3.17 (principal ideal theorem), PDF page 170, which is printed p. 161;
  - line 10629 is VIII Theorem 3.1 (Hasse norm theorem, cyclic `L/K`), PDF page 243, which is printed p. 234.

**Suppliers.** No supplier citation changed. `roadmaps resolve` (`citations.md`) finds no unresolved citation or Lean name.

**Headlines and padding.**
- `Suggested.lean` is unchanged, so the previous round's one-tactic probe stands: 0 of 36 attempts closed a theorem.
- The headline list is unchanged:
  - `cyclotomicCharacter_artinMap`;
  - `normResidue_map_unitFiltration`;
  - `localAbsoluteUpperRamificationGroup` with `map_artinMap_unitFiltration_eq_upper`;
  - `isPrincipal_map_hilbertClassField`;
  - `count_relDiscr_eq_finsum_abelianConductor_exponent`;
  - `abelianConductor_eq_lcm`.
- The supporting comparison is correctly absent from `Suggested.lean`. It is a step of a route, not a headline.

**Remarks on untouched text (no change requested).**
- Lines 1928–1930: "have their interface in … and consumed here under Tau Ceti's names" is missing "are" before "consumed".
- IntegralIwasawaTheory (#1306) README line 134 cites "ClassFieldTheory §§8–11". That matches neither a main section (main §8 is the references) nor a row of the table. It means Layers 8–11, and the fix belongs to that roadmap.

**Adversarial pass.** "Arithmetic" means `χ(Art u) = u⁻¹` and that a uniformizer maps to arithmetic Frobenius.
- The first three rows are new in this round and cover the changed passages. No Lean statement changed.
- The other rows are carried from the previous report (PRREVIEW-ClassFieldTheory~45), for statements the diff leaves untouched, with the values computed there.

| Statement | Instances | Values computed (each side) | Result | Change |
|---|---|---|---|---|
| Scope: open headlines are the theorems of `Suggested.lean`; the comparison is README only (new) | the open targets of items 3 and 9 against the declarations of `Suggested.lean`; the wrong model of the old sentence | Item 3 has 3 open theorems: the unit normalization, finite reciprocity and absolute reciprocity. Item 9 has 4: the principal ideal theorem, the comparison, and the product and lcm halves of the conductor–discriminant formula. 7 − 1 (the comparison) = 6, and `Suggested.lean` has 6 theorems (lines 81, 97, 130, 145, 156, 170) and 1 def (line 112). The old sentence claimed 7 = 6. | holds | none |
| Former-section table (new) | the 18 rows; a citation of "§2.1" against Layer 2's 2.1; the live citations §2.4, §2.5, §2.6, §4 Layer 9, §4 | The 18 former ids map to 18 headings with the same titles (main lines 259–2040 against lines 308–2380 here). The subsections here are 0.1–14.1, 15 in all, so exactly 2 former ids share their digits (§2.1, §5.1), and the sentence names both. §2.6 resolves to C.6, whose line 540 states `χ_cyc(Art_K(u)) = N_{K/ℚ_p}(u)⁻¹`, the content AnticyclotomicLocalUnits cites. The overlap check lists 0 dropped cited ids, against 2 (§2.5, §2.6) at d587e53. | holds | none |
| Layer 13 prerequisites: 2 open headline targets and 1 supporting open target (new) | the Layer 13 targets marked open; the headline table | Layer 13 has 3 open items: lines 1970, 2018 and 2078. The headline table (lines 718–719) has 2 rows for Layer 13, with 3 declarations (the formula in two halves). 3 − 2 = 1 supporting target, the comparison, which the route's step 4 reads. | holds | none |
| `cyclotomicCharacter_artinMap` (r45) | `ℚ₃`, `u=4`, `μ₉`; `ℚ₂`, `u=−3`, `μ₁₆`; `μ₈` | `4·7=28≡1 mod 9`, so `χ=7` against geometric `4`. `13·5=65≡1 mod 16`, so `χ=5` against `13`. `3²≡5²≡7²≡1 mod 8`, so `μ₈` does not separate the conventions. | holds | none |
| same, hypothesis automatic (r45) | `a∈1+pℤ_p`, `X^{ℓ^k}−a` at `1` | `‖f(1)‖ ≤ p⁻¹ < 1 = ‖f′(1)‖²`, so `a` is `ℓ^k`-divisible and its discrete valuation vanishes. `v(p)<0` would give `v(1−p)=v(p)≠0`, a contradiction. | holds | none |
| `normResidue_map_unitFiltration` (r45) | `ℚ₂(i)`, `n=0,1,2`; `ℚ₃(ζ₉)`; `𝔽₂((t))`, `y²−y=t⁻¹`; unramified | `ℚ₂(i)`: `i_G(σ)=2`, `G₀=G₁=G`, `G₂=1`. `−1` is not a norm, so `U¹→G`; `1+4ℤ₂⊆N`, so `U²→1`. `ℚ₃(ζ₉)`: upper orders `6,3,1`, and the unit images are `6,3,1`. `𝔽₂((t))`: break at `1`. Unramified: `G⁰=1` and `U⁰⊆N`. | holds | none |
| `localAbsoluteUpperRamificationGroup` (r45) | depth `−1`; `ℚ₂(ζ₈)`; `X³−5` over `ℚ₅` | Depth `−1` gives `G_K`. `ℚ₂(ζ₈)` at depths `0..3` gives `{1,3,5,7},{1,3,5,7},{1,5},{1}`. `X³−5` gives `S₃` with `G⁰=C₃`, and `C₃↦1` in `S₃^ab`, so an abelian-only definition differs. | determines the object | none |
| `map_artinMap_unitFiltration_eq_upper` (r45) | `n=0`; unramified quadratic quotient; `ℚ₂(ζ₈)`; `Kˣ` in place of `U⁰` | `n=0`: both sides are the image of inertia. The unramified quadratic quotient gives `1` on both sides. For `ℚ₂(ζ₈)`, `U¹,U²,U³ ↦ {1,3,5,7},{1,5},{1}`. `Art(Kˣ)` is dense. | holds | none |
| extension of ideals read on ideles (r45) | `ℚ→ℚ(i)` at 2 and 3; `ℚ(√−5)→K(i)`; `ℚ→ℚ(∛2)` at 5; `E=K` | At 2, `e=2` gives `(2)`; without `e` it gives `(1+i)`, of norm `2≠4`. At 3, `e=1` gives `(3)`; the degree model gives `(9)`. For `𝔓=(1+i)`, both paths give the trivial class. `5=𝔭₁𝔭₂`, so `5𝒪_E`; the degree model gives `(125)`. | holds | none |
| `isPrincipal_map_hilbertClassField` (r45) | `ℚ`; `ℚ(√−5)`; `I=⊥,⊤` | `H(ℚ)=ℚ`. `x²+5y²=2` has no solution, so `𝔭` is not principal, and `𝔭²=(2)`. `H=K(i)`, and `𝔭𝒪_H=(1+i)`. | holds | none |
| the route's `hT` (r45) | `ℚ(√−5)`; `hT` dropped | `h(ℚ(i,√5))=1`, so `H'=H` and the commutator `1=Gal(H'/H)`. Dropping `hT` would force `Cl_K=1`, against `[𝔭]≠1`. | holds | none |
| `count_relDiscr_eq_finsum_abelianConductor_exponent` (r45) | `ℚ(i)`, `ℚ(ζ₈)`, `ℚ(ζ₅)`, `ℚ(ζ₉)`, `ℚ(√13,√17)` | `2=0+2`; `8=0+2+3+3`; `3=0+1+1+1`; `9=0+1+2·4`; `2=0+1+0+1` | holds | none |
| `abelianConductor_eq_lcm` (r45) | `ℚ(ζ₈)`; `ℚ(√2)`; product and lcm swapped | `(8)∞`; `(8)` with no `∞`; swapping gives `2⁸` against `2³` | holds | none |
| 0.1 Nakayama–Rim (r45) | `ℤ[C₂]`; trivial `ℤ` | `Ĥ⁰=0`; `Ĥ⁰=ℤ/2` | holds | none |
| 2.1 res/cor/inf (r45) | cyclic of degree `4→2→8` | `inv res u=1/2`; `inv cor res u=1/2`; `inf u` gives `2/8=1/4` | holds | none |
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
- serre-local-fields (uncertified): IV §§1–3 with Proposition 14, V §§3 and 6, VI §2, IX §8, XI–XIV and XV §2;
- neukirch-ant (uncertified): V Theorem 6.2 and VI §7;
- nsw (uncertified): (7.1.8)(i), (7.2.5), (7.2.6) and (7.3.1)–(7.3.4);
- artin-tate (waived): V–VIII and XI–XV.

Also not verified:
- kopp-lagarias was read as arXiv v3, and I did not compare it with the published numbering.
- I did not elaborate `Completed/LocalGaloisGroups/Suggested.lean`. It is outside this folder and the brief's Lean commands, and it is unchanged since d587e53.
- I did not check ownership against open pull requests that the brief lists without files. I checked #617 and #1411 with `roadmaps show` and `roadmaps overlaps`.

## Source issues

- none
