<!-- from CBirkbeck, https://github.com/TauCetiProject/TauCetiRoadmapJobs/pull/16328#issuecomment-6902062648 -->
Review (claude) of e58d86e

Verdict: needs_changes

**For the human reviewers:** this review raises 3 questions that a human decides (the scope of the roadmap, or a licence). They are in the section of that name at the end and do not change the verdict.

1. **F01** (P3) the record of the letter `F` omits two sections where `F = K(μ_n)` is meant

   **Location.** `packages/EllipticCurveModularityImaginaryQuadraticPartII/design/README.md:115–118`:
   "The field `F = K(μ_n)` is meant in the Summary, Layers 2 and 8, §7.5 and Layer 1 outside §1.2; §1.2,
   Layers 4–6 and §7.4 each introduce their own number field `F`".

   **Claim.** The sentence (added by the last repair) lists every place where `F` is the parent's field.

   **Witness.** README line 27 (Scope and ownership: "`cyclotomic_switch_field` of `ζ₅ ∉ F`"), line 39
   ("the descent along `F/K`") and line 335 (How to read the build: "seed for `V_η` over `F`") use
   `F = K(μ_n)`; line 1437 (Downstream consumers) uses the `F` of ModularityAndLanglandsExtensions §2.29.

   **Repair.** Replace "is meant in the Summary, Layers 2 and 8, §7.5 and Layer 1 outside §1.2" by "is
   meant in the Summary, Scope and ownership, How to read the build, Layers 2 and 8, §7.5 and Layer 1
   outside §1.2", and after "their extensions `F'_w`" add "; in Downstream consumers `F` is the field of
   ModularityAndLanglandsExtensions §2.29". Tested on lines 27, 39, 335 and 1437: each is then covered.

The four findings of round 13 are repaired. No statement of the design was found false, vacuous or
missing a hypothesis; every sampled locator is at its line; every supplier citation resolves at the
supplier's current head; the dependency check shows no UPWARD or CYCLE line. One finding remains
(R01, P3, non-blocking), with an exact repair: a repair, whatever its priority, asks for changes, so
the verdict is needs changes on that one finding alone. The declared gap
`acc-torsion-inertial-comparison` is a contract and no finding. This is a design: there is no `Suggested.lean`, and elaboration is
not available (this lane does not elaborate).

## Verified sound

### The round-13 findings

- **F01 (P2, §6.1 followed the source clause by clause): repaired.** README lines 1068–1081 now read
  "Write `F₁` for the CM field reached before the degree condition … By linear disjointness
  `[F₁⁺E:ℚ] = 8[F₁⁺:ℚ]` … so `F'⁺` has at least eight five-adic places, and removing any two of them
  leaves a sum of at least `(3/4)[F'⁺:ℚ]`". Compared with CaptainSude26 lines 582–588: the README gives
  a derivation in formulas with its own intermediate field and tower inequality; the longest common
  run is under six words and is forced ("at least", the fraction). `plan.json` 6.1 carries the same
  derivation.
- **F02 (P3, target name): repaired.** `plan.json` 6.2 is `protected_lifting_at_five`; the old name
  occurs in neither file.
- **F03 (P3, §3.1 locator): repaired.** README lines 603–605: "Lemma 3.1 and its proof, lines 187–192
  … proof of Lemma 3.2, line 224 … proof of Lemma 3.3, line 234". Read at the source: line 187 names
  `e, f, h`; line 191 gives `D(e), D(h), D(f)`; line 224 the trace form; line 234 `M^G = 0`.
- **F04 (P3, letter `E`): repaired.** README lines 108–109: "In §6.1, which names no elliptic curve,
  `E` is a totally real Galois extension of `ℚ` of degree eight, and `E_a`, `E_b`, `E_c` are the
  imaginary quadratic fields so named in ACC23 §6.5.12" (ACC23 line 7163). The companion sentence on
  `F` that the repair added is R01.

The repaired patterns were searched for in the rest of the design: no other passage follows
CaptainSude26 sentence by sentence (comparison below); no other locator points at a line that only
fixes notation; no other undefined compound or stale target name remains in `plan.json` (28 names
read).

### Adversarial table (values computed this round)

Sampled targets, headlines and the changed text. Everything below was recomputed by hand from the
README's statements, not copied from round 13.

| Statement | Instances | Values computed | Result |
|---|---|---|---|
| §6.1 degree step (changed) | `F₁⁺ = ℚ(√5)`, `E = ℚ(√31,√59,√71)` | `F₁⁺E ⊗_{F₁⁺} (F₁⁺)_u ≅ E ⊗_ℚ (F₁⁺)_u ≅ (F₁⁺)_u⁸`; `[F₁⁺E:ℚ] = 16`; local degree `2 = 16/8`; tower: `[F'⁺_{w'}:ℚ₅] ≤ [F'⁺:F₁⁺E]·[F₁⁺E:ℚ]/8`; `16 − 2 − 2 = 12 > 8`; in general `d − 2d/8 = 3d/4 > d/2` | holds |
| §6.1, disjointness dropped | `E ⊇ F₁⁺` | `[F₁⁺E:ℚ] = 8 ≠ 8[F₁⁺:ℚ]` | hypothesis used |
| §6.1 Check, `q = 11` | `p_b = 109`, `p_c = 2617` | `2617` has no prime factor `≤ 47` (`√2617 < 52`); `2617 = 6·436 + 1`; `109 = 99 + 10 ≡ −1`, `2617 = 2618 − 1 ≡ −1 mod 11`; `−4·(−1) = 4`, a square | holds; matches ACC23 lines 7174–7177 |
| §1.1(a) | `K = ℚ(i)`, `S = {20}`; `S = ∅`, `{1,2}`; `K = ℚ(√−3)`, `S = {4}`; `K = ℚ(2^(1/3))`, `S = {3}` | `{a mod 20 : a ≡ 1 mod 4} ≅ (ℤ/5)ˣ`, order 4; `L = K`; `L = ℚ(ζ₁₂)`; in `S₃` two transpositions give a 3-cycle | true for CM `K`; control fails |
| §1.1(b) | `ℚ(i) ⊂ ℚ(i,√5) ⊂ ℚ(i,√3,√5)`; `ℚ(√5) ⊂ ℚ(ζ₂₀)` | seven quadratic subfields `d = −1, ±3, ±5, ±15`; no `√2`; no cyclic quartic quotient of `(ℤ/2)³`; roots of unity `μ₁₂` | true; `K' ⊇ K` needed |
| §1.2(a), converse | `1 ⊕ 1` over `𝔽₃`, `ℚ ⊂ ℚ(ζ₃)` | over `ℚ`: `q = 2`, ratio `1 ≠ 2 = 2⁻¹`; over `ℚ(ζ₃)`: split `q ≡ 1 mod 3`, ratio `1 = q` | descent holds, converse fails |
| §1.2(b) | `G_{F(ζ_ℓ)} ⊆ G_{K(ζ_ℓ)}` | irreducible on the subgroup implies irreducible on the group | holds |
| §2.4 | `y² = x³ − x`, `y² = x³ + 1` over `ℚ(ζ₈)`; `y² = x³ − x` over `ℚ(√−3)` | quadratic subfields of `ℚ(ζ₈)`: `ℚ(i), ℚ(√2), ℚ(√−2)`; `ℚ(ζ₈, ζ₃) = ℚ(ζ₂₄)`; `i ∉ ℚ(√−3)` | sum, induction, induction |
| Theorem 2.5 (headline) | `ℚ(i)`, `K₆₀`, `ℚ(ζ₅)` | `{a mod 60 : a ≡ ±1 mod 15, a ≡ 1 mod 4} = {1, 29}`; `29 ≡ 4 mod 5`, `29 ≡ 2 mod 3`: `ζ₅ ∉ K₆₀`, `K₆₀(ζ₃) = ℚ(ζ₆₀)` | applies, applies, excluded |
| §3.1 | `X = [[x,y],[z,−x]]`, `U`, `Uᵀ`; `diag(2,3)`; char 2 | `UX − XU = [[z,−2x],[0,−z]]`; `UᵀX − XUᵀ = [[−y,0],[2x,y]]`; `UhU⁻¹ = [[1,−2],[0,−1]] = h − 2e`; `UfU⁻¹ = [[1,−1],[1,−1]] = f + h − e`; Gram determinant `−2`; `2·3⁻¹ = 4 = 3·2⁻¹` in `𝔽₅`; `tr 1 = 0` in char 2 | invariants vanish iff `2 ∈ k^×` |
| §3.2 | `p = 5, 3, 7` | `Σ_{j<5}(1+N)^j = 5 + 10N + 10N²`, zero mod 5; `(D−1)M = k e ⊕ k h`; quotient spanned by `f`; index `120/5 = 24`; mod 3: `3 + 3N + N² = N² ≠ 0`, kernel `= k e ⊕ k h =` image, `H¹ = 0`; mod 7: `7 + 21N + 35N² = 0`, `H¹` one-dimensional | bijective at five only |
| §3.3 definition | image of unipotents; `M = [[0,−1],[1,−1]]`, `Φ = [[4,1],[0,1]]` | a finite group of elements of order `1` or `p` is a `p`-group, so it factors through `ℤ_p(1)`; `M² = [[−1,1],[−1,0]]`, `M³ = 1`; `Φ² = 1`; `ΦMΦ = [[4,1],[4,0]] = M² = M¹¹` | separates protected from non-unipotent |
| §3.4 | `N = ρ(τ) − 1`; `q_v = 11`; first-order lifts | `(1,2)` entry of `tr(N)N = det N` gives `tr N = 0`, then `det N = 0`; `φE₁₂ = qE₁₂φ` gives `c = 0`, `a = qδ`; `q(1+q)²δ² = (1+q)²ψ(φ)`; `11·144 = 1584`; `(1+εf)U` has trace `2 + ε`; `(1+εh)U` has trace `2`, determinant `1 − ε² = 1`; parameters `a, b − 1, z − [z̄]`: three | equivalences and dimension hold |
| §3.5 | `q_v ≡ 1`, `q_v ≡ 2 mod 5`; `p ≥ 5` in (d) | `M^(I_v) = k e`, `φ` scales `e` by `q_v`; `3 − (3 − h⁰) = h⁰`; `#H¹(M) = #H⁰(M)·#H⁰(M(1))`, annihilator of order `#H⁰(M(1))`; cocycles: `ξ(τ) ∈ M`, `ξ(φ) ∈ k e` (dimension 4), coboundaries 2, `H¹` of dimension 2; `C(p,3) ≡ 0 mod p` needs `p ≥ 5` | holds; `p ≥ 5` used in (d) |
| §4.3 | `(d,t,r) = (2,1,6)`, `(2,3,10)` | `6 − 6 − 1 + 1 = 0`; `10 − 6 − 1 + 3 = 6`; `1 + 9 + 4 = 14`; `14 + 6 = 20 = 10 + 12 − 2`; `1 + 11 + 10 = 22` | deficit `2 = d` |
| §5.1 | five-adic degrees of `F⁺` | each a multiple of 4 and `≥ 8`; `d > 16 + d/2` gives `d > 32`; `d = 36`: `a + a' < 18` forces all degrees `8`, `8 ∤ 36`; `d = 40`: `(8,8,24)` gives `24 > 20` and `8 < 20`; five eights give `24 > 20` | least `d = 40` |
| §5.2, §5.4 | `d = 40`, `t = 10`, `R = ∅` | `1 + 10·(3 + 8) = 111 = 1 + 30 + 80`; `g ≥ 0` iff `r ≥ 120 + 1 − 10 = 111`; `dim R_∞ = 111 + 40 − 40 = 111`; `dim S_∞ = 151`; deficit `40 = l₀` | holds |
| Theorem 6.2 (headline), image | `ζ₅ ∈ F`, (4) false | scalars of determinant one are `±1`; `SL₂(𝔽₅)` perfect, no subgroup of index 2 | image `SL₂(𝔽₅)` |
| Theorem 6.2, first Check | `𝔽₅`-valued; `μγ`, `μ² = 2`, `γ = diag(1,2)` over `𝔽₂₅` | `det(2g) = 4·(−1) = 1`, indices `60 ≠ 120`: (4) holds; `det(μγ) = 4`, `(μγ)² = diag(2,8) = diag(2,3)`, order `240`, projective order `120 = 2·60`: (4) fails with `ζ₅ ∉ F` | hypothesis `ζ₅ ∈ F` is needed as stated |
| §7.3 | `v(q_A) = 3, 15`; non-split | inertia `[[1,3],[0,1]]`, nontrivial; `15 ≡ 0`: trivial; twist multiplies Frobenius by `−1`, inertia unchanged | protected iff `5 ∤ v(q_A)` |
| §7.4 | `Σ = ∅`; `w ∈ Σ` above 2; trivial completion below `w` | parent's `switch_five` read at its head: no hypothesis `ζ₅ ∉ F`, Tate places above 2 and 3, `L ∩ F_avoid = F`; `L_{w'} = F_w·(L⁺)_{u'} = F_w` | reduces to the parent; Σ splits |
| §7.5 | transvections with coefficient `3`; `q` split in the normal closure | powers of `[[1,3],[0,1]]` give all `[[1,x],[0,1]]`; with the lower ones, order `120`; `v ≠ v^c`; `q ≥ 7` avoids `2, 3, 5` | hypotheses of 6.2 met |
| Theorem 8.1 (headline) | `ℚ(ζ₅)`, `ℚ(ζ₁₅)`, `ℚ(ζ₂₀)`, `K₆₀`, `ℚ(i,√5)` | `ζ₅ ∈ K`: yes, yes, yes, no, no | the two branches are exhaustive |

For §§2.1–2.3, 4.1, 4.2, 5.3, 7.1, 7.2, which no repair touched, round 13's rows carry computed
values; I reread each statement against them and recomputed §4.1 (`H¹(A, M^G) = 0`, inertia in
`SL₂(𝔽₅) × {1}`) and §4.2 (`Ad diag(2,3)` has eigenvalues `4, 1, 4`).

### Sources: the seeded sample

No locator is flagged unverified. All eight manifest texts are in the cache; nothing was fetched and
the manifest is unchanged. CaptainSude26 was read in full (lines 1–720).

| Target | Read at | Result |
|---|---|---|
| 1.1 | MilneCM lines 292–300 (page marker p. 10 at line 265); LeHung26 line 357 | Corollary 1.5 and Remark 1.6 as cited |
| 1.2 | LeHung26 lines 308–321 | supports the two properties over `K`; the descent statement is the roadmap's own |
| 2.4 | OpenAI26 lines 1192–1215 (pp. 27–28); LeHung26 lines 364–366; CaptainSude26 lines 676–683 | supported |
| 2.5 | LeHung26 lines 86–88, 342–355, 357 | supported, with the source's conditionality recorded in the README |
| 3.1 | CaptainSude26 lines 187–192, 224, 234 | supported |
| 3.2 | CaptainSude26 lines 231–241 | supported |
| 3.4 | CaptainSude26 lines 184–220 | supported for `μ₅ ⊂ F_v`, `ρ̄(φ) = 1`; the general form is computed above |
| 3.5 | CaptainSude26 lines 187–226 | supported |
| 4.3 | CaptainSude26 lines 416–444 (`g` at line 439) | supported |
| 5.1 | CaptainSude26 lines 264–289; CN23 lines 4226–4260 (pp. 81–82) | supported |
| 5.4 | CaptainSude26 lines 410–498 (dimensions at 480–481); CN23 line 4261 | supported |
| 6.2 | CaptainSude26 lines 264–498, `μ₅ ⊂ F` at line 267; CN23 lines 3849–3872 (pp. 73–74) | supported |
| 7.3 | CaptainSude26 lines 533–536 | supported |
| 7.4 | CaptainSude26 lines 538–603; CN23 line 4574 (pp. 88–89); CHT08 line 5723 (p. 116) | supported |
| 8.1 | CaptainSude26 lines 26–33, 671–683; LeHung26 lines 125–128 | supported |

Also read: ACC23 lines 2309–2312, 2344–2356 (pp. 57–58), 7160–7182 (p. 178); AKT23 line 3979 (p. 86);
CN23 line 4513 (p. 87).

### Library, suppliers, order

- Pins `1b1ccf4b…` (Mathlib) and `2fd255d9…` (Tau Ceti) from `lake-manifest.json`. Opened at the pins:
  `NumberField.IsCMField` (`Mathlib/NumberTheory/NumberField/CMField.lean:70`),
  `IsCyclotomicExtension.Rat.isCMField` (:564, hypothesis `∃ n ∈ S, 2 < n`),
  `NumberField.isTotallyComplex_of_algebra` (`…/InfinitePlace/TotallyRealComplex.lean:229`),
  `IsCyclotomicExtension` (`Mathlib/NumberTheory/Cyclotomic/Basic.lean:74`),
  `Matrix.SpecialLinearGroup.toGL` (`…/GeneralLinearGroup/Defs.lean:369`),
  `Matrix.SL2.commutator_eq_top` (`…/SpecialLinearGroup.lean:804`),
  `Rep.FiniteCyclicGroup.groupCohomologyIsoOdd` (`…/GroupCohomology/FiniteCyclic.lean:114`),
  `groupCohomology.map` (`…/GroupCohomology/Functoriality.lean:141`),
  `TauCeti.ClassFieldTheory.eulerCharacteristic_mixed` (`…/EulerCharacteristic/Theorem.lean:98`),
  `TauCeti.ClassFieldTheory.tateDualityPairing_perfect_mixed` (`…/Duality/Perfect.lean`). Neither
  library has `adZeroRep` or a decomposed-genericity predicate.
- Cross-roadmap citations, resolved now at each supplier's open head or on main: all 41 names cited
  from the parent exist there, in the sections cited (`switch_five`, `solvable_preparation`,
  `hilbert_local_selection`, `seed_modular`, `auxiliary_local_types` in §0.3;
  `potentiallySemistableCM` §5.2; `cm_modularity` §5.3); the 72 cited section and layer headings of
  the 16 other suppliers at open heads exist under the cited numbers, as do the 7 cited on main
  (EllipticCurves Layers 4 and 5; ClassFieldTheory Layers 5 and 11; SchemeAndStackFoundations §§4.13
  and 4.18; Chebotarev Layer 10, under `Completed/`). Statements read
  against their use: the parent's `switch_five` and `hilbert_local_selection`;
  PotentialAutomorphyInfrastructure §§2.1, 2.3(1)–(2), 2.5; MordellLawrenceVenkatesh §1.3;
  AutomorphicGaloisRepresentationsPartII AG2.7; ArithmeticGaloisRepresentations §§6.3, 7.2, 7.7, 7.9;
  LocalGaloisDeformationRings §§2.15, 2.16, 2.21; GlobalGaloisDeformations §§3.6, 5.6;
  NeronModelsAndSemistableAbelianVarieties §§3.1, 3.12. No roadmap of the never-cite list is cited.
- The citation resolver's four leads: three are source keys followed by a section; the fourth,
  `ResidualImage.adZeroRep`, is a declaration of ArithmeticGaloisRepresentations §7.9 (its line 5249),
  attributed to it. None is a defect.
- Gap `acc-torsion-inertial-comparison`: same slug in `plan.json` (`gaps`; supplier
  AutomorphicGaloisRepresentationsPartII, section AG2.5; needed by 5.3) and in the README (Supplier
  obligations, §5.3, Layer 5 Dependencies). Its hypotheses and conclusion agree with ACC23 lines
  2309–2355. AG2.5 at its head still does not state the theorem (no match for it in that README).
  Precise, minimal, declared.
- Dependency check:

```text
candidate: EllipticCurveModularityImaginaryQuadraticPartII is not in the merge order yet; checked as if placed after EllipticCurveModularityImaginaryQuadratic (the intake inserts it when its design is accepted)
depcheck: 240 roadmaps, 2272 edges, 0 problem(s)
```

No UPWARD or CYCLE line.

### Duplication and overlap

`scratch/overlaps.md` lists no other pull request changing this roadmap, no dropped id and no id
defined only by a revision; main has no folder of this name. The board index lists AnalyticNumberTheory
and LawrenceVenkateshMethod, both unrelated. Searches of main and every open head, by object:
"protected place" and "unipotent-inertia" (no match); a width-three or `I₃` degeneration (two
unrelated matches); ACC Theorem 3.1.1 (cited by PotentialAutomorphyInfrastructure as AG2.5, stated
nowhere: the gap); cyclotomic extensions of CM fields (EllipticCurveModularityTotallyReal owns
`realCyclotomic_isCMField` over a totally real base and names this roadmap for CM bases).

Overlap check: read EllipticCurveModularityImaginaryQuadratic, EllipticCurveModularityTotallyReal, PotentialAutomorphyInfrastructurePartII, CrystallineLocalGlobalCompatibilityCM, OrdinaryAutomorphicFormsAndModularityLiftingPartII (the lists on main and by results are empty); nothing shared.

### Shape, headlines and policy

Summary, Scope and ownership, Conventions, Exact supplier contracts, How to read the build, eight
layers each ending in Examples and Dependencies, Downstream consumers, References. Three definitions
(3.3, 5.1, 5.2) with API bullets and 4, 4, 3 Checks; 24 theorems and one example target, each theorem
with hypotheses, a locator and a *Needs* line; `plan.json` parses with 28 targets, each with at least
three tests except the example (two). Headlines: Theorems 2.5, 6.2, 8.1; none is statable at the pins
and the *Lean* paragraph names the missing carriers. The README attributes no backticked Lean name to
this roadmap. A pattern search for LaTeX delimiters, pull-request numbers, machine paths, process
words, `set_option` and `lemma` found nothing but "Lemma" in source locators. Layers are named by
their mathematics; Layers 1–2 are independent of 3–7; the order 3 → 8 is forced (4.1 needs 3.2 and
3.5; 5.4 needs 4.2 and 4.3; 6.1 needs 5.1; 7.5 needs 6.2; 8.1 needs 7.5).

### Copyright and arrangement

Wording: 17 passages were put beside their sources (the fifteen sampled targets, the changed §6.1
passage and the Supplier obligations). The shared runs are statements that can be written one way
(clause (4) of CN23 Theorem 5.2, the conclusion of ACC23 Theorem 3.1.1). Arrangement: CaptainSude26
has Sections 2–6. Its Section 2 is the parent's and is imported; its Section 6 with LeHung26 §4 is
Layer 2, placed first; its Section 3 is split across Layers 3 and 4; Layer 6 states a lifting theorem
for an arbitrary representation that no section of the source states, using a preparation taken from
inside the proof of its Proposition 5.2; Layer 1 is added. No one-to-one run. Reuse: no table, figure
or data taken over.

Source independence: 17 passages compared with 6 sources, none shared; largest share CaptainSude26, 24 of 60 locators in the layers; contents compared with CaptainSude26: independent.

## Not verifiable

- Lean elaboration, the one-tactic probe and the `#check` comparison: not available in this lane, and a
  design has no Lean file.
- The global patching argument of CaptainSude26 (lines 315–408, 445–498) beyond its hypotheses, counts
  and local computations: no refereed source states it, and it was not re-proved here.
- The geometric inputs of the parent, on which LeHung26 Theorem 1.1 is conditional (line 86): read as
  supplier statements only.

## Source issues

- **Error** in CaptainSude26 at Notation, printed p. 2 (lines 63–66): the source says its condition, ratio outside `{1, q, q⁻¹}`, agrees with CN Definition 2.1.27; it should say it is stronger, since LeHung26 (line 282) records only the ratio `q` as excluded; affects nothing.
- **Misprint** in CaptainSude26 at Lemma 5.1, printed p. 11 (line 528): the source writes the unit series as `h(s)`, the letter of the cubic `y² = h(x)` (line 71); it should use another letter; affects nothing.

## For the human reviewers

- **Scope.** Theorems 6.2 and 8.1 rest on CaptainSude26 (pseudonymous, unrefereed) and Theorem 2.5 on LeHung26 (discussion draft, conditional on the parent's geometric inputs, line 86); the parent rests on OpenAI26. No refereed source states these theorems.
- **Licence.** CaptainSude26: the repository has no licence file (`sources.toml`, `version_note`); it is cited by locator only. OpenAI26: `licence_class = "author-page"` for a company repository, no licence recorded.
- **Licence.** MilneCM is recorded as `open-repository`; the host is the author's own page. LeHung26 is recorded as `open-repository` on a host named Hexagon, with CC BY 4.0 in its `version_note`.

<!-- tauceti-roadmap-review {"agent": "claude", "head": "e58d86e93449e73edba370137ba011607a05f977", "job": "REV-DESIGN-EllipticCurveModularityImaginaryQuadraticPartII~14", "model": "fable", "worker": "chris-x55"} -->
