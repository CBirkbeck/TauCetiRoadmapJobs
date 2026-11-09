# Review of GlobalQuadraticForms (pull request #1215 at 93570aa)

**Verdict:** needs changes

Three P3 findings, none blocking. The mathematics of the eight headline statements checks out on
every instance computed below. `Suggested.lean` elaborates with exactly eight `sorry` warnings.
The dependency check is clean.

## R01 (P3) — #1200 still changes this folder and conflicts with this head; no order is stated

**Location.** The pull request description (it does not mention #1200), and
`TauCetiRoadmap/GlobalQuadraticForms/README.md` and `Suggested.lean`.

**Claim.** Two open pull requests revise this folder in different ways. Whichever merges second
conflicts. If #1200 merges first, it brings back the declaration this head dropped and the
componentwise 8.3 statement that this head replaced.

**Witness.** `git merge-tree --write-tree HEAD a6625dc` (the head of #1200) reports CONFLICT in
`README.md` and `Suggested.lean`. At `a6625dc`, `Suggested.lean:132` still declares
`equivalent_of_locallyEquivalent`, and `:147` still writes 8.3 out componentwise.

**Repair.** State one order in this pull request's description. For example: this pull request
supersedes #1200's revision of GlobalQuadraticForms, and #1200 is closed or rebased onto this
branch so that it no longer touches the folder. The reverse order also works. Keep pull request
numbers out of the README. Afterwards, `roadmaps overlaps GlobalQuadraticForms` must list no
conflicting head that changes this folder.

## R02 (P3) — 4.1 promises universe transports of four Tau Ceti inputs that no target consumes or states

**Location.** `README.md:153–154`: "Section 4.1 carries the last seven of these to number fields
in every universe". The same claim appears at `:22–24`, `:96–98`, `:354–356` and `:412–417`.

**Claim.** Only three of the seven inputs appear in a *Needs:* line:

- `exists_sq_sub_mul_sq_iff_forall_completion` (4.3, `:518`);
- `IsLocalRealization.exists_locallyRepresents_prod` (7.2, `:774`);
- `isAdmissible_globalInvariants` (7.3, `:811`).

The other four occur only in the section map, the list of `Type`-only inputs and the supplier
contract: `hilbertSymbol_productFormula`, `globalInvariants_hasseProduct_eq_one`,
`exists_hilbertSymbol_eq_ite` and `exists_pair_hilbertSymbol_eq_ite` (`:68–75`, `:150–153`,
`:243`, `:251–254`). So their transported forms are promised but never stated.

Meanwhile the section map (`:68–75`) sends the old 4.4 citations to the `Type`-only declarations.
On main those statements took any `K : Type u`.

**Witness.** `#check` at the pin shows `∀ {K : Type} [Field K] [NumberField K] …` for all four.
Main's `Suggested.lean:263` declares 4.4 under `variable {K : Type u}`. Running
`grep -n hilbertSymbol_productFormula README.md` finds only lines 68, 150 and 251.

**Repair.** Choose one of two options:

- (a) Wherever "seven" appears, name instead the three inputs a target consumes. In the 4.4 lines
  of the section map, add that the four Tau Ceti declarations are stated for `K : Type`.
- (b) Add to 4.1 named transported statements, for `K : Type u`, of:
  - the localized product formula;
  - the Hasse product of a form;
  - the two sign prescriptions.

  Then point the 4.4 lines of the section map at them.

Either way, QuaternionArithmetic's citation "GlobalQuadraticForms §4.4
`exists_hilbertSymbol_eq_neg_one_iff_pair`" then resolves to a statement whose universe is
stated.

## R03 (P3) — *Needs:* lines of 6.2, 6.3 and 8.3 omit inputs their routes use; one Mathlib gloss does not match the pin

**Location and claim.**

- **6.3 (`:719–720`).** The route applies 6.2, whose hypothesis is `LocallyRepresents`, to
  locally equivalent forms. The bridge `QuadraticForm.LocallyEquivalent.locallyRepresents`
  (`TauCeti/NumberTheory/QuadraticForm/Global/Predicates.lean:243`) is not listed.
- **6.2 (`:698–700`).** The step "represent it by `R` with 6.1" needs `R` to locally represent
  `c`. That uses `QuadraticForm.LocallyRepresentsScalar.of_represents` (`Predicates.lean:189`)
  and `QuadraticForm.LocallyRepresents.locallyRepresentsScalar` (`Predicates.lean:257`). Neither
  is listed.
- **8.3 (`:913–914`).** The route ("a class in the kernel is the class of an anisotropic form
  whose localizations are hyperbolic") uses three declarations, none of them listed:
  - `TauCeti.wittClass_surjective` (`TauCeti/LinearAlgebra/QuadraticForm/Witt/Ring.lean:371`);
  - `TauCeti.WittRing.globalToLocal_wittClass_formClass` (`TauCeti/NumberTheory/QuadraticForm/Global/WittLocalization.lean:188`);
  - `TauCeti.wittClass_eq_zero_iff` (`Witt/Ring.lean:364`).

  The listed `TauCeti.WittRing.globalToLocal_eq_zero_iff` is not used by the route.
- **`:194–195`.** `NumberField.InfinitePlace.comap_embedding_of_isReal` is glossed as "the
  pulled-back real embedding is the composite".

**Witness.** At the pin, `Mathlib/NumberTheory/NumberField/InfinitePlace/Ramification.lean:90`
concludes `(w.comap f).embedding = w.embedding.comp f`, assuming `(w.comap f).IsReal`. That is a
statement about the complex embedding, not `embedding_of_isReal`. Each missing name above was
resolved by `#check` at the pin in this review.

**Repair.**

- Add the named declarations to the 6.2, 6.3 and 8.3 *Needs:* lines.
- In 8.3, drop `globalToLocal_eq_zero_iff`, or name the alternative route that uses it.
- Reword the gloss: "when the pulled-back place is real, its complex embedding is the composite;
  the statement for `embedding_of_isReal` follows".

## Verified sound

### What was run

- **Worker's gate.** `gate.md` reports every check at 0 and the build OK.
- **My gate rerun** (`tauceti-roadmap gate … GlobalQuadraticForms --base origin/main`).
  - Every GlobalQuadraticForms-specific check is 0.
  - `outside-folder` lists only the `ClassFieldTheory` and `QuadraticFormInvariants` files. The
    brief names those folders as this pull request's own.
  - The one other outside file, `Completed/LocalGaloisGroups/Suggested.lean` (from commit
    `1abcd32c`), is on the project's configured outside-folder allow list. It is not a finding.
- **Dependency check** (`gate --depcheck … --movable`): `depcheck: 235 roadmaps, 2257 edges, 0
  problem(s)`. There are no UPWARD or CYCLE lines. The README declares no roadmap supplier. Every
  input is a Mathlib or Tau Ceti declaration at the pins, and the merge order does not list
  GlobalQuadraticForms.
- **Elaboration.** `lake env lean TauCetiRoadmap/GlobalQuadraticForms/Suggested.lean` gives
  exactly 8 "declaration uses `sorry`" warnings and no errors.
- **Signatures.** I checked the `#check @` signatures of all 8 declarations against the README.
  - `K : Type u`; `V : Type v` and `W : Type w` are independent.
  - `[FiniteDimensional K _]` and `hQ`/`hR` sit in each signature; no section binder is lost.
  - The generality matches the README Conventions (`:96–101`).
- **Padding probe.** I ran
  `first | rfl | simp | infer_instance | decide | (constructor <;> simp) | exact fun _ => by simp_all`
  on a scratch copy. It closes none of the 8 statements. Three of them reduce to the unfolded
  local predicates and stop there.
- **Headlines.** The README's end theorems and headlines are 4.2, 5.5, 6.1, 6.2, 6.3, 7.3, 8.1
  and 8.3. All eight are stated. 7.2 and 8.2 are steps whose content the stated 7.3 and 8.3
  carry (with `IsLocalRealization.equivalent_atFinitePlace`/`…atRealPlace` and
  `TauCeti.wittClass_eq_zero_iff`). The module docstring names the headlines correctly.
- **Duplication.** The pinned Mathlib has no Hasse–Minkowski, Hilbert symbol or Witt ring. Tau
  Ceti has only the conditional steps:
  - `TauCeti/NumberTheory/QuadraticForm/Global/WittLocalization.lean:40` says injectivity "this file does not prove";
  - `Quaternary.lean` and `HigherRank.lean` assume the lower ranks;
  - `Existence.lean` stops at one global representation.

  No open head owns these objects. Class Field Theory README `:198–204`, Quadratic Form
  Invariants README `:87–91` and Global Number Fields README `:64–69` all name
  GlobalQuadraticForms as the owner. Nobody else owns 4.1's number-field transport.
- **Library names.** 129 qualified backticked names resolve by `#check` at the pins. One of them,
  `RegularFormClass.localHasse`, resolves only with its `TauCeti.` prefix, which the README gives
  at `:298`.
- **The eight `Type`-only inputs.** The universe audit confirms exactly eight `K : Type` inputs:
  - `finrank_le_index_range_ideleClassNormMap`;
  - `exists_sq_sub_mul_sq_iff_forall_completion`;
  - `exists_locallyRepresents_prod`;
  - `hilbertSymbol_productFormula`;
  - `globalInvariants_hasseProduct_eq_one`;
  - `isAdmissible_globalInvariants`;
  - `exists_hilbertSymbol_eq_ite`;
  - `exists_pair_hilbertSymbol_eq_ite`.

  Every other cited input is universe-polymorphic.

### Library declarations opened at the pin

**Mathlib:**
- `QuadraticMap.Nondegenerate` (`LinearAlgebra/QuadraticForm/Radical.lean:115`; radical `⊥` and
  polar kernel of rank ≤ 1);
- `radical` (`:35`) and `radical_eq_ker_polarBilin` (`:126`);
- `equivalent_weightedSumSquares_units_of_nondegenerate'` (`LinearAlgebra/QuadraticForm/IsometryEquiv.lean:177`);
- `InfinitePlace.comap` (`NumberTheory/NumberField/InfinitePlace/Ramification.lean:45`),
  `isReal_comap_iff` (`:82`) and `comap_embedding_of_isReal` (`:90`);
- `HeightOneSpectrum.equivOfRingEquiv` (`RingTheory/DedekindDomain/Ideal/Lemmas.lean:592`);
- `RingOfIntegers.mapRingEquiv` (`NumberTheory/NumberField/Basic.lean:193`);
- `IntermediateField.adjoinRootEquivAdjoin` (`FieldTheory/IntermediateField/Adjoin/Basic.lean:423`);
- `Field.exists_primitive_element` (`FieldTheory/PrimitiveElement.lean:209`);
- `invertibleTwo` (`Algebra/CharP/Invertible.lean:125`);
- `IdeleGroup` and `IdeleClassGroup` (`NumberTheory/NumberField/AdeleRing.lean:104`, `:130`).

**Tau Ceti** (`Global/` means `TauCeti/NumberTheory/QuadraticForm/Global/`):
- `Global/Predicates.lean:51, 66, 85, 147` (the four predicates use real `baseChange`
  localizations at every finite and real place) and `:243, 257`;
- `Global/Localization.lean:43, 67, 90, 96`;
- `Global/Invariants.lean:90` (the record) and `:178` (`IsAdmissible`, with the clauses as the
  README states them);
- `Global/FormInvariants.lean:77, 165`;
- `Global/WittLocalization.lean:167, 203`;
- `TauCeti/LinearAlgebra/QuadraticForm/Witt/Ring.lean:218, 364, 371`;
- `TauCeti/LinearAlgebra/QuadraticForm/Representation.lean:46` (`Represents` allows `v = 0`) and `:49`
  (`IsRepresentedBy` is an injective isometry);
- `TauCeti/NumberTheory/NumberField/Global/Ideles/Norm/Range.lean:115`;
- `Global/DefiniteObstruction.lean:68` (`Fin (n + 1)` with `4 ≤ n`, so rank ≥ 5 as the 5.5
  Check says);
- `Quaternary` and `HigherRank`: their hypotheses ask for the lower-rank case only on
  `presentedForm p`, the quaternary one over every `L` in `K`'s universe, as 5.1 and 5.5 say;
- `TauCeti/RingTheory/DedekindDomain/Ideal/Basic.lean:279`.

### Cross-roadmap citations resolved

**On main:**
- OrthogonalSpinGroups (`Completed/OrthogonalSpinGroups/README.md:925–966`): its consumer
  contract imports `GlobalQuadraticForms.hasseMinkowski_equivalent` and assigns the `H¹`
  translation to OrthogonalTamagawaAndLatticeMass. Its anchors `#43-…`, `#61-…`, `#63-…` and
  `#84-…` match headings here.
- ClassicalArithmeticCompletion: its 4.4 citations (`README.md:165, 589, 591, 783, 793`) are
  covered by the section map, and its anchor `#layer-4-global-square-norm-and-approximation-lemmas`
  matches.
- IntegralLattices (`README.md:2229`) cites `hasseMinkowski_equivalent`.
- GlobalNumberFields (`Completed/GlobalNumberFields/README.md:157–166`): its
  `weakApproximation_denseRange` export is cited here.

**In this pull request's own folders:**
- ClassFieldTheory README `:198–204` and `:2079–2080`;
- QuadraticFormInvariants README `:84–91` and `:2684–2690`.

**At open heads:**
- #1063: Layer 3 (section map).
- #931 and #1722: §4.4 `exists_hilbertSymbol_eq_neg_one_iff_pair` (alias line `:73`).
- #1722 and #1285: §5.5.
- #851: Layers 5 and 6.
- #792: layer 5.
- #1691: §4.4 and §§8.1–8.3.
- #617 and #1411: IntegralLattices' `equivalent_of_locallyEquivalent` (alias line `:927`).

**Dropped ids.** No roadmap cites the dropped ids (old 4.1, 4.5, 5.2–5.4, 7.1, Layer 9) or the
dropped Lean names of main's `Suggested.lean`, except those the section map and alias lines
cover.

### Locators checked (seeded sample, milne-cft)

| Locator | Lines | Result |
|---|---|---|
| VIII Thm 1.1, p. 229 (4.2, 5.1) | 10384–10386 | needs a primitive `n`-th root of 1, automatic for `n = 2`; "all but finitely many primes" ✓ |
| VIII Ex. 1.3, p. 229 (4.2 Check) | 10397–10405 | ✓ |
| VIII Thm 3.1, p. 234 (4.3) | 10629–10631 | cyclic `L/K`, norm everywhere ⇒ global norm ✓ |
| VIII Thm 3.5, p. 235 (5.5) | 10686–10689 | ✓ |
| VIII Prop 3.7(b),(c), p. 236 (5.1) | 10698–10702 | ✓ |
| VIII proof of 3.5(b), p. 237 (5.1, 5.5) | 10772–10804 | ✓, with the misprints and gap below; README 5.1 correctly cites Thm 3.1 for `n = 3` |
| VIII Prop 6.2, p. 251 (8.2) | 11574–11575 | ✓ |
| VIII Thm 6.3, p. 252 (7.4, 8.2–8.4) | 11619–11628 | ✓ |
| VIII Rem 6.6, p. 253 (Conventions, 7.4) | 11677–11691 | `S = ε·(−1, d)`, product over `i ≤ j` ✓ |
| VIII Thm 6.10 and Prop 6.11, p. 255 (7.2) | 11745–11763 | ✓ |
| VIII p. 256 remarks (7.2) | 11781–11790 | `d`, `S` fix `t` only for rank ≤ 3 ✓ |

4.1 cites no source; it is plumbing. 6.1–6.3, 7.3 and 8.1 cite O'Meara only (see Not
verifiable).

### Adversarial table

| Statement | Instances tried | Values computed (each side) | Result |
|---|---|---|---|
| Conventions: plain vs signed discriminant | `H = ⟨1,−1⟩`, `⟨1,1⟩` | `H`: plain `[−1]`, signed `(−1)^1·[−1] = [1]`; `⟨1,1⟩`: plain `[1]`, signed `[−1]` | Check holds; it discriminates the two conventions |
| Conventions: Hasse sign `i<j` vs `i≤j` | `H` over `ℝ` | `i<j`: `(1,−1)_ℝ = 1`; `i≤j`: `(1,1)(1,−1)(−1,−1) = −1`; Milne `S = ε·(−1,d) = 1·(−1,−1) = −1` | consistent with Tau Ceti `localHasse` (`i<j`) |
| Conventions: real Hasse `(−1)^(q(q−1)/2)` | `q = 0,2,3,4` | `C(q,2) = 0,1,3,6` → `+1,−1,−1,+1`; Tau Ceti `realHasse = (−1)^(q.choose 2)`; `⟨−1,−1⟩`: `(−1,−1)_ℝ = −1` | agree |
| Conventions: product formula Check | `(−1,3)` over `ℚ` | `ℚ₃`: `(−1/3) = −1`; `ℚ₂`: `ε(−1)ε(3) = 1` → `−1`; `ℝ`: `+1` (3 > 0) | two places, even ✓ |
| 4.1 transport | conjugation on `ℚ(i)`, `𝔭 = (2+i)` | mod `(2−i)`: `i ≡ 2`, `2+i ≡ 4 = 2²` → square in `K_𝔭̄`; `v_𝔭(2+i) = 1` → nonsquare in `K_𝔭`; mod `(2+i)`: `2−i ≡ 4` → square in `K_𝔭` | a place-fixing transport predicts `2−i` square in `K_𝔭̄`: false (valuation 1); the Check refutes the wrong model |
| 4.1 transport, degenerate | `σ = id`, zero form | record `(0,[1],1,0)`; `1 ≤ n` fails on both sides | not admissible either side ✓ |
| 4.2 `isSquare_of_isSquare_unitAtFinitePlace_of_notMem` | `K = ℚ`: `a = 4, S = ∅`; `a = −1`; `a = −4` | `4 = 2²`, both sides true; `−1 ≡ 2` nonsquare mod 3 → hypothesis false; `−4` same at `p = 3` | true; no archimedean hypothesis needed |
| 4.2, exponent 8 control | `16` | `ℚ₃`: `x²+2` has root `1` mod 3 → `x⁸ = (−2)⁴ = 16`; `ℚ₅`: `(x+1)²+1` root `1`; `ℚ`: `16^(1/8) = √2 ∉ ℚ` | analogue false; Thm 1.1 hypothesis `ζ₂ = −1 ∈ K` makes `n = 2` exception-free ✓ |
| 4.3 adapter | `(d,a) = (−1,5), (−1,3), (2,−1), (−1,−1)` | `5 = 1+4` (both true); `(−1,3)_3 = −1` (both false); `1−2 = −1` (both true); `x²+y² = −1` fails at `ℝ` | ✓; `d = 1` excluded (supplier needs `¬IsSquare d`) |
| 5.1 binary | `⟨1,1⟩` over `ℚ` and `ℚ(i)` | `ℚ₃`: `[1] ≠ [−1]` (2 nonsquare mod 3) → anisotropic, both false; `ℚ(i)`: `[−1] = [i²]` → `(1,i)` isotropic, both true | ✓ |
| 5.1 ternary | `⟨1,1,−3⟩`, `⟨1,1,−2⟩`, `⟨1,1,1⟩` | `d = −1, a = 3`: `(−1,3)_v = −1` at `v = 2,3` → both false; `(1,1,1) ↦ 0` → both true; `(−1,−1)_v = −1` exactly at `{2,∞}` | ✓; even count as reciprocity requires |
| 5.5 `hasseMinkowski_isotropic` | `V = 0`; `⟨a⟩`; `H`; `⟨1,1,1,1,1⟩/ℚ`; degenerate `⟨1,0⟩` | `V = 0`: `Anisotropic` holds (LHS false), zero space anisotropic at every `v` (RHS false); `⟨a⟩`: false/false; `H`: true/true; rank 5: anisotropic at `ℝ` → false/false; `⟨1,0⟩`: radical vector `(0,1)` → true/true | iff holds in each; `hQ` is a route hypothesis, as the README's Check says |
| 6.1 `represents_iff_locallyRepresents` | `⟨1,1⟩` with `a = 3, −1`; `H`, `a = 7`; `V = 0`, `a = 1`; `a = 0` | `3`: false/false; `−1`: false/false (`ℝ`, `ℚ₂`); `7 = 4²−3²`: true/true; `Q 0 = 0 ≠ 1`: false/false; `a = 0`: `Represents` true at `x = 0`, local true | ✓; `ha` is needed only by the route, not by truth |
| 6.2 `represented_iff_locallyRepresented` | `⟨3⟩ → H`; `⟨3⟩ → ⟨1,1⟩`; rank 3 into rank 2; `V = 0` | `((1+3)/2, (1−3)/2) = (2,−1)`: `4−1 = 3`, true/true; false/false; injectivity impossible and `finrank_le` → false/false; zero map injective → true/true | ✓ |
| 6.3 `hasseMinkowski_equivalent` | `H` vs `⟨2,−2⟩`; `⟨1⟩` vs `⟨−1⟩`; `⟨1,1,−3⟩` vs `⟨1,1,−1⟩` | `[−4] = [−1]`, both isotropic → hyperbolic, true/true; `ℝ` signatures `(1,0)≠(0,1)`: false/false; `[−3]/[−1] = [3]` nonsquare in `ℚ₃`: false/false | ✓ (finding R03 concerns only its *Needs:*) |
| 7.2 (72:1) | `⟨−1,−1,−1⟩/ℚ`; `R = ⟨1,1,1⟩` with `s₂ = −1` alone; real rank 4, `d = [1]` | `s₂ = (−1,−1)₂³ = −1`, `q = 3`: `(−1)^3 = −1`, product `+1`, so hypotheses hold and the form realizes itself; product `(−1)·1 = −1`, so the family is excluded; signatures `(4,0),(0,4)`: `C(0,2)=0`, `C(4,2)=6` → `+1,+1`; `(2,2)`: `−1` | ✓; the record must carry `p_w` (Milne p. 256) |
| 7.3 `exists_globalForm_of_isAdmissible` | rank 1, `s = −1` at `{3,5}`; `ℚ(√5)` record | product `(−1)²·1 = 1`, but the rank-one clause fails, so not admissible, and rank-one forms have `s = 1`; real Hasse `1` and `(−1)^C(2,2) = −1`, product `(−1)·1·(−1) = 1`; `⟨1,θ,θ⟩`: `s_v = (θ,−1)_v`, `θ` a unit, so `1` at odd `v`, `−1` at the real place where `θ < 0`, hence `−1` at `(2)` | ✓ both directions |
| 7.4 / 8.1 `equivalent_iff_globalInvariants_eq` | `⟨1,1⟩` vs `⟨2,2⟩`; `⟨1,1,−1⟩` vs `⟨1,2,−2⟩`; `⟨1,1,−3⟩` vs `⟨1,1,−1⟩`; two zero forms | `[4] = [1]`, `(2,2) = 1` since `2 = 2²−2·1²`, `p = 2`: equal records, and `(x+y)²+(x−y)² = 2x²+2y²`; `[−4] = [−1]`, `(2,−2) = 1` since `−2 = 0²−2·1²`, `p = 2`: equal and isometric; `[−3] ≠ [−1]`: false/false; rank 0: true/true | ✓; Milne `i≤j` differs by `(−1,d)_v` on both sides, as 7.4 says |
| 8.2 hyperbolicity | `⟨1,−1,2,−2⟩`; `⟨1,1⟩`; odd rank | `2H`: true/true; positive definite at `ℝ`: false/false; odd `finrank ≠ 2m`: never | ✓ |
| 8.3 `injective_wittRing_baseChange_places` | classes of `⟨1⟩`, `⟨1,1⟩`, `H` | `dimMod2 = 1`, so nonzero at every `K_v`; real signature `2 ≠ 0`; `H ↦ 0` | consistent with injectivity; `W(ℂ) = ℤ/2` is seen by `dimMod2` at a finite place |
| 8.4 | reverse direction of 6.3 | `(hasseMinkowski_equivalent Q hQ R hR).2`; main's consumers cite only `hasseMinkowski_equivalent` | no separate declaration needed ✓ |
| First-inequality input (4.2) | `Subgroup.index` junk; `ℚ(∛2,ζ₃)/ℚ` | infinite index gives `0`, but `finrank ≥ 1` forces finite index; degree `6`, norm index `|S₃^ab| = 2 < 6` | cyclic hypothesis needed, as the README says ✓ |
| `IsAdmissible` subtraction junk | `p_w > n` | `realNegativeIndex = n − p = 0` only outside admissibility (`p_w ≤ n` is a clause); records of forms have `p ≤ n` | no junk reaches 7.3 or 8.1 ✓ |

## Not verifiable

- **`omeara`** (O'Meara, *Introduction to Quadratic Forms*). The manifest marks it uncertified
  (paywalled), and I did not read it. The locators are 58:7, 65:15, 66:1, 66:3, 66:4, 66:5,
  71:19, 71:19a and 72:1. 6.2 rests on O'Meara alone. milne-cft offers certified locators for
  other targets that today cite only O'Meara; using them is optional:
  - 5.5: VIII Thm 3.5(b), p. 235, lines 10686–10689;
  - 6.1: VIII Cor. 3.6, p. 236, lines 10694–10696;
  - 7.2/7.3: VIII Thm 6.12, p. 256, lines 11792–11807;
  - 6.3: VIII Thm 6.3, p. 252.
- **`serre`** (Serre, *A Course in Arithmetic*). Uncertified and not read. It is used for the
  `ℚ` examples and for the `i < j` convention. That convention is corroborated by milne-cft
  VIII Remark 6.6, p. 253, lines 11677–11683.

## Source issues

- **Misprint** in milne-cft at VIII, proof of Theorem 3.5(b), p. 237: the source says the three- and four-variable cases follow from 3.7(c),(d) and Theorem 1.1; it should be Theorem 3.1, the Hasse norm theorem, over `K` and over `K[√ab]`; affects the proof.
- **Misprint** in milne-cft at VIII, proof of Theorem 3.5(b), p. 237: the source calls the induction hypothesis in `n − 1` variables "Theorem 3.1b"; it should be Theorem 3.5(b); affects nothing.
- **Gap** in milne-cft at VIII, proof of Theorem 3.5(b), case `n ≥ 5`, p. 237: the source picks any common value `c_v` of the two summands, possibly `0`, then needs `c/c_v` square and `cY² − r` regular; it should choose `c_v ≠ 0`, possible because an isotropic regular summand is universal; affects the proof.
- **Misprint** in milne-cft at VIII, proof of Theorem 6.3, p. 252: the source names the complements `q₁`, `q₁′` and then compares `q₁` with `q₂`; it should be `q₁` and `q₁′` throughout; affects nothing.
- **Misprint** in milne-cft at VIII, proof of Theorem 1.4, Step 3, p. 230: inside Step 3 the source invokes "Step 3" for the cyclic `p`-power case; it should be Step 2; affects nothing.
