# Review of ProfiniteArithmetic (pull request #775 at 53d0c7b)

**Verdict:** rejected

The pull request edits `TauCetiRoadmap/ProfiniteArithmetic/`, a folder that no longer exists on
main: main archived this roadmap under `Completed/ProfiniteArithmetic/` with a `sorry`-free
certificate, and a consumer already imports that certificate. Merging this head would re-create the
active folder beside the archive, give every fully qualified name two owners, and reopen a completed
roadmap with three `sorry`'d targets whose content is at the pinned Tau Ceti or on Tau Ceti main.
Editing the two files under review cannot repair that, so the verdict is rejected rather than needs
changes. The remaining findings are listed so that whatever survives can be carried into the archive
or into a Part II.

## R01 (P1) — The roadmap is already completed and archived on main; this head re-creates it

- **Location.** `TauCetiRoadmap/ProfiniteArithmetic/README.md` and `Suggested.lean`, whole files
  (merge base `0e8b058a`, two commits behind main `ffcc9d31`).
- **Claim.** The pull request revises the active roadmap `TauCetiRoadmap/ProfiniteArithmetic`.
- **Witness.** On main the folder is `Completed/ProfiniteArithmetic/` (commit `632ef72f`, "discharge
  the targets in place and archive the roadmap", then `7baea00d`, "Reconcile the archive with
  current main and the implemented finite-kernel interfaces"); `git ls-tree origin/main
  TauCetiRoadmap/ProfiniteArithmetic/` is empty. The archive's `Suggested.lean` has 206
  declarations and no `sorry`; its README 2.4 already states the pro-`p` theorem in the
  compatible-family formulation ("Identify this kernel ... with the closed subgroup of the product
  of finite kernels consisting of compatible families ... This description does not require an
  arbitrary element of each full finite kernel to descend"), and its header names the Tau Ceti
  declarations that implement it (`TauCeti.IsProP.range_pi_mapQuotient_ker_proPFrattini`,
  `TauCeti.ContinuousAut.isEmbedding_pi_mapQuotient_ker_proPFrattini`, on Tau Ceti
  `9d7da548`). `TauCetiRoadmap/PeripheralActions/Suggested.lean` on main has
  `import Completed.ProfiniteArithmetic.Suggested` and `open TauCetiRoadmap.ProfiniteArithmetic`.
  This head declares the same names (`TauCetiRoadmap.ProfiniteArithmetic.padicPow`, `zpowHat`,
  `ContinuousAut`, `frattiniKernel`, …) in a second module.
- **Repair.** Close this pull request. A roadmap on main is built on, never re-planned: if the
  compatible-family correction of 2.4 adds anything to the archive's 2.4, open it against
  `Completed/ProfiniteArithmetic/` with the certificate kept `sorry`-free (the archive's header
  already records where the post-pin declarations live); an extension is a Part II roadmap.

## R02 (P1) — `set_option` in `Suggested.lean` (gate failure)

- **Location.** `TauCetiRoadmap/ProfiniteArithmetic/Suggested.lean:42` (`set_option autoImplicit
  false`), `:83` (`set_option quotPrecheck false in` before the notation `ẑ`), `:528`, `:615`,
  `:630` (`set_option linter.unusedSectionVars false in`).
- **Claim.** The file elaborates under the defaults.
- **Witness.** The worker's gate: `set_option=5 … FAIL`. The principles make a `set_option` a
  blocking finding.
- **Repair, tested.** Delete line 42. Replace lines 83–84 by
  `scoped notation "ẑ" => Additive (TauCeti.zHat : Type)` (the ascription fixes universe `0`
  without an explicit level, so the precheck passes). Replace each
  `set_option linter.unusedSectionVars false in` by `omit [IsTopologicalGroup G] in`, as the file
  already does at lines 507, 514, 656. A copy with exactly these edits elaborates with `lake env
  lean` with no error and only the three existing `sorry` warnings (lines 722, 728, 737).

## R03 (P2) — Section 2.4 plans a construction whose theorem and ingredients are at the pin

- **Location.** `README.md:549–585` ("The pro-`p` theorem and its complete compatible-family
  model … Construct the following model of the entire `H`", steps 1–4) and `:803`;
  `Suggested.lean:724–751` (the three `sorry`'d targets).
- **Claim.** The cofinality of the index `I`, the quotient-Frattini identity, the reconstruction of
  an automorphism from a compatible family, and the identification `H ≃ₜ* K_comp` are new targets
  of this roadmap.
- **Witness, at the pinned Tau Ceti (`a91d3aa`).** The end theorem is proved:
  `TauCeti.IsProP.isProP_ker_mapQuotient_proPFrattini` and
  `TauCeti.ContinuousAut.isOpen_ker_mapQuotient_proPFrattini`
  (`TauCeti/Topology/Algebra/Group/ContinuousAut/ProP.lean:64,84`), which `Suggested.lean:758`
  itself uses to prove `isProP_ker_toFrattiniQuotient`. The reconstruction over all characteristic
  open quotients is `TauCeti.ContinuousAut.exists_mapQuotient_eq`, the range description is
  `range_pi_mapQuotient`, and the closed embedding is `isClosedEmbedding_pi_mapQuotient`
  (`ContinuousAut/Profinite.lean:104,156,172`). Cofinality is
  `TauCeti.IsTopologicallyFinitelyGenerated.exists_isTopCharacteristic_le` and the trivial
  intersection `iInf_isTopCharacteristic_eq_bot` (`ContinuousAut/Characteristic.lean:203,238`);
  openness of `Φ` is `isOpen_proPFrattini` (`ProP/FiniteGeneration.lean:44`). The quotient-Frattini
  identity is `TauCeti.map_proPFrattini_eq_of_surjective` (`ProP/Frattini/Basic.lean:407`) composed
  with `IsPGroup.proPFrattini_eq_frattini` (`ProP/MaximalSubgroup.lean:145`). On a probe copy,
  `frattiniCharacteristicIndex_cofinal` closes in three lines from the first two (and does not use
  `hG`), `frattiniCharacteristicIndex_map_Frattini` in four lines from the last two (and does not
  use that `N` is characteristic or `N ≤ Φ`); `frattiniCompatibleFamily_existsUnique` is the proof
  of the pinned `exists_mapQuotient_eq` with its index restricted to the cofinal subfamily `I`.
  The restriction of the pinned embedding to the Frattini kernel is on Tau Ceti main as
  `range_pi_mapQuotient_ker_proPFrattini` (named in the archive's header). No roadmap on main or
  in an open pull request cites `K_comp` or the compatible-family model.
- **Repair.** State 2.4 as the archive does: the theorem, cited to the pinned declarations, and one
  comparison statement, that the image of `H` under the pinned closed embedding is the set of
  compatible families whose every coordinate lies in the finite kernel, cited to Tau Ceti main
  where that is implemented. Delete the three `sorry`'d targets and the four-step construction.

## R04 (P3) — "Changes to existing Tau Ceti declarations" describes the pin wrongly; `lift_eq_tauCeti` is `rfl`

- **Location.** `README.md:99–120` and `:336–345`, `:781`; `Suggested.lean:281–283`.
- **Claim.** `TauCeti.ProfiniteCompletion.continuousMonoidHomEquiv` "is generalized from profinite
  targets in the universe of the group to profinite targets in any universe", the ring API "is
  added … in its own file", and `zHat.lift_eq_tauCeti` records that the generalized lift agrees
  with the existing one.
- **Witness.** At the pin `continuousMonoidHomEquiv` (`Profinite/Completion.lean:179`) already takes
  `P : Type v` ("The target `P` may live in a different universe from `G`"), `zHat.lift` is
  `zHat.{u} →ₜ* P` for any `P` (`ZHat/Basic.lean:140`), and `ZHat/Ring.lean` exists with
  `ZHat/Basic.lean:16–18` pointing to it. `lift` in `Suggested.lean` is an `abbrev` for
  `TauCeti.zHat.lift`, so `lift_eq_tauCeti` closes by `rfl` on the probe copy: it states nothing.
- **Repair.** Delete the subsection and the theorem; the supplier table already lists the
  declarations, and the sentence at `README.md:119` goes with them.

## R05 (P3) — `Suggested.lean` is an API catalogue, with two in-file duplicates of pinned theorems

- **Location.** `Suggested.lean` throughout: 136 of 139 declarations are `abbrev`s of Tau Ceti
  declarations or theorems proved by one term (`ContinuousAut.mul_apply := rfl` at `:455`,
  `zpowHat_zero` at `:308`, `lcsBracket_add_left` at `:908`, …); `isClosed_isConj_pair` at
  `:576–590` and `ContinuousAut.isClosed_isConj` at `:594–600` are proved by tactic although
  `TauCeti.isClosed_isConj_pair` (`Topology/Algebra/Group/Conjugacy.lean:27`) and
  `TauCeti.ContinuousAut.isClosed_isConj` (`ContinuousAut/Congruence.lean:284`) are at the pin
  (both close by `exact` on the probe copy). The module docstring (`:47–49`) says the file "is not
  exhaustive" and that "`sorry` is allowed … these are goals, not proofs", not which headlines are
  statable.
- **Claim.** The file is the roadmap's acceptance test.
- **Witness.** The one-tactic probe: every non-`sorry` declaration already closes by its single
  term; the headline theorems (`nonempty_ringEquiv_pi`, `ContinuousAut.compactSpace`,
  `isProP_ker_toFrattiniQuotient`, `lcsGradedPiece_zero_freeProP_bijective`,
  `lcsGradedPiece_one_freeProP_bijective`, `lcsGradedPiece_eq_sum_bracket`) are among them and are
  the ones worth keeping.
- **Repair.** Keep the headline theorems and the definitions they need; delete the API lemmas and
  the two duplicated proofs (cite the pinned names). The README keeps every statement.

## R06 (P3) — Three README names are unqualified (gate `readme-ids-missing`)

- **Location.** `README.md:105` (`continuousMonoidHomEquiv_symm_apply_etaFn`), `:581`
  (`ContinuousAut.exists_mapQuotient_eq`), `:706` (`isProP_multiplicative_padicInt`).
- **Witness.** The gate reads each as a claim that `Suggested.lean` declares it; none is declared
  there. All three exist at the pin under `TauCeti.`
  (`Profinite/Completion.lean:198`, `ContinuousAut/Profinite.lean:104`, `ProP/PadicInt/Basic.lean`).
- **Repair.** Write the fully qualified `TauCeti.…` name at each place.

## R07 (P3) — Process vocabulary and a mandatory route in 2.4; unused hypotheses

- **Location.** `README.md:205–206, 573–584, 639, 819` ("native" as a term for "already in Tau
  Ceti": "native congruence coordinate", "native compactness", "native parents");
  `README.md:552` ("Construct the following model"), `:580–582` ("do not define a second
  automorphism topology"); `Suggested.lean:724–734`.
- **Witness.** "Native" is neither the literature's nor Mathlib's word and is defined nowhere. A
  proof sketch names a route and its inputs; steps 1–4 prescribe one. `hG` in
  `frattiniCharacteristicIndex_cofinal` and the conjuncts `IsTopCharacteristic` and `≤ Φ` in
  `frattiniCharacteristicIndex_map_Frattini` are unused: the probe proofs go through without them.
- **Repair.** Say "Tau Ceti's" where "native" is meant; state the route as a sketch; drop the
  unused hypotheses if the statements are kept anywhere.

## Verified sound

**Gate and direction.** The worker's gate fails only on `set_option` (R02) and
`readme-ids-missing` (R06); build, imports, dependency check and the other scanners pass.
`gate --depcheck … --movable` reports `depcheck: 155 roadmaps, 1063 edges, 0 problem(s)`: no
UPWARD or CYCLE line. The diff against the merge base outside the roadmap folder is empty. No
other open pull request builds a `ProfiniteArithmetic` folder (`roadmaps list` shows only #775).

**Elaboration.** `lake env lean` on a probe copy with the R02 repairs applied and five witness
declarations appended: no error, `sorry` warnings only at the three admitted targets. The probe
witnesses: `frattiniCharacteristicIndex_cofinal` from `exists_isTopCharacteristic_le` and
`isOpen_proPFrattini`; `frattiniCharacteristicIndex_map_Frattini` from
`map_proPFrattini_eq_of_surjective` and `IsPGroup.proPFrattini_eq_frattini`; `lift_eq_tauCeti` by
`rfl`; `isClosed_isConj_pair` and `ContinuousAut.isClosed_isConj` by the pinned declarations. The
signature transcript's nine "dropped binder" leads are all instances the aliased Tau Ceti
declaration does not need (`[IsTopologicalGroup G]` on `IsTopCharacteristic`, `mapQuotient`,
`mapClosedQuotient`, `ClosedSubgroupConjClasses`, `smul_closedSubgroup_toSubgroup`,
`isTopCharacteristic_proPFrattini`/`_proPKernel`; `[CompactSpace G]`,
`[TotallyDisconnectedSpace G]` on `closedZpowers`), consistent with the README.

**Library declarations opened at the pins.** Tau Ceti `a91d3aa`: `proPFrattini`
(`ProP/Frattini/Basic.lean:102`, the intersection of the open normal subgroups of index `p`),
`IsProP` (`ProP/Basic.lean:68`), `QuotientGroup.mapOfLE` (`GroupTheory/QuotientGroup/Map.lean:66`),
`MulAut.mapQuotient` (`GroupTheory/QuotientGroup/MulAut.lean:40`),
`IsPGroup.isPGroup_ker_mapQuotient_frattini` (`GroupTheory/Frattini.lean:128`),
`continuousMonoidHomEquiv` and `_symm_apply_etaFn` (`Profinite/Completion.lean:179,198`),
`zHat.lift`, `lift_unique`, `hom_ext` (`ZHat/Basic.lean:125–158`),
`exists_mapQuotient_eq`, `range_pi_mapQuotient`, `isClosed_range_pi_mapQuotient`,
`isClosedEmbedding_pi_mapQuotient` (`ContinuousAut/Profinite.lean`),
`isProP_ker_mapQuotient_proPFrattini`, `isOpen_ker_mapQuotient_proPFrattini`
(`ContinuousAut/ProP.lean:64,84`), `exists_isTopCharacteristic_le`,
`iInf_isTopCharacteristic_eq_bot` (`ContinuousAut/Characteristic.lean:203,238`),
`map_proPFrattini_le`, `map_proPFrattini_eq_of_surjective`, `ContinuousMulEquiv.map_proPFrattini_eq`
(`ProP/Frattini/Basic.lean:212,219,407`), `IsPGroup.proPFrattini_eq_frattini`
(`ProP/MaximalSubgroup.lean:145`), `isClosed_isConj_pair` (`Conjugacy.lean:27`),
`ContinuousAut.isClosed_isConj` (`ContinuousAut/Congruence.lean:284`),
`exists_sum_gradedBracket_eq_of_range` (`Graded/ClosedSpan.lean:113`),
`lcsGradedPieceZeroEquiv` (`Graded/Abelianization.lean:28`), `HeisenbergGroup.equivProd` and
`commutatorElement_eq` (`SpecificGroups/Heisenberg.lean:68,113`), `HeisenbergGroup.isProP_padicInt`
(`ProP/Heisenberg.lean:125`), and every other name of the "From Tau Ceti" table (`ofInt_ofAdd`,
`existsUnique_forall_mk_eq`, `continuous_iff_forall_continuous_mk`, `isProP_maximalProPQuotient`,
`maximalProPQuotient.lift`, `map_proPKernel_eq`, `surjective_of_leftInverse_of_ker_le_proPFrattini`,
`bijective_of_surjective`, `topologicallyGenerates_iff_frattiniQuotient`,
`topologicalClosure_closure_range_of_eq_top`, `degreeOneBasis`,
`span_gradedPow_gradedMkZero_union_gradedBracket_eq_top`, `padicPowHom`, `IsProP.module`,
`coordinateHom`, `gradedPieceZeroEquiv`, `gradedMap_gradedBracket`,
`maximalProPQuotientEquivPadicInt_mk_eq_component`, `not_isDomain`). Not at the pin, as the
archive's header says: `range_pi_mapQuotient_ker_proPFrattini`,
`isEmbedding_pi_mapQuotient_ker_proPFrattini`, `HeisenbergGroup.level`,
`exteriorSquareEquivLcsGradedPieceOne`. Mathlib `6b7abb3`: `frattini`, `frattini_nongenerating`
and its characteristic/normal instances (`GroupTheory/Frattini.lean`), `IsPGroup.isNilpotent`
(`GroupTheory/Nilpotent.lean`), `TopologicalAbelianization`, `ClosedSubgroup`, `OpenNormalSubgroup`
(`Topology/Algebra/OpenSubgroup.lean:465`), `PadicInt.lift`, `lift_spec`, `lift_unique`,
`ext_of_toZModPow` (`NumberTheory/Padics/RingHoms.lean`), `Nat.chineseRemainder`,
`ZMod.chineseRemainder`, `modularCyclotomicCharacter`,
`IsCompact.nonempty_iInter_of_directed_nonempty_isCompact_isClosed`, `commutatorElement_def`
(`Algebra/Group/Commutator.lean:46`).

**Cross-roadmap citations resolved.** ProfiniteProPGroups (opening section and `IsProP`,
`freeProP`, Frattini, Burnside, Hopf, on main and at #618), BelyiMaps Layers 12.7 and 13.1
(#767), PeripheralActions Layer 3.2 (main; it imports the archived certificate), ProfiniteCohomology
(#616), LocalFieldsRamification (#617): all exist as cited; the citations tool found no missing
cross-roadmap citation. Consumers' names used from this roadmap (`padicPow_one`,
`padicPow_units_injective`, `zpowHat_idem_of_isProP`, `commutator_mem_closedLowerCentralSeries`,
`lcsBracket_add_left`, `lcsBracket_add_right`, `lcsGradedPiece_eq_sum_bracket`,
`isClosed_isConj_pair`) are declared in this head with the signatures PeripheralActions lists.

**Adversarial pass** (sampled targets, headline theorems and every target a finding touches).

| Statement | Instances tried | Values computed on each side | Result | Change |
|---|---|---|---|---|
| 0.1 product `a * b = lift a b`; `1 = gen`; `(n : ẑ) = gen ^ n` | `a = b = gen`; `n = 0, 1` | `lift gen = id`, so `gen * gen = gen`; `gen ^ 0 = 1_mult = 0_add`, `gen ^ 1 = gen = 1` | consistent with `TauCeti.zHat.toMul_one`, `toMul_mul` | none |
| 0.1 ⚠ `ẑ` not a domain | `ω_2`, `1 - ω_2` | components at `(2, 3)`: `ω_2 ↦ (1, 0)`, `1 - ω_2 ↦ (0, 1)`, product `(0, 0) = 0`, both factors nonzero | true (`not_isDomain` at the pin) | none |
| 0.2 `toZMod n`, index `ℕ+`, compatibility `castHom ∘ toZMod m = toZMod n` for `n ∣ m` | `n = 1`; `m = 6, n = 2`, `a = gen` | `ZMod 1 = 0`, `toZMod 1 a = 0` for all `a`; `toZMod 6 gen = 1 ↦ 1 = toZMod 2 gen` | true; `ZMod 0 = ℤ` excluded by `ℕ+` | none |
| 0.3 `component ℓ'(ω_ℓ) = if ℓ' = ℓ then 1 else 0`; reductions | `ℓ = 2`, levels `2^k`, `3`, `6` | `toZMod 4 ω_2 = 1`, `toZMod 3 ω_2 = 0`, `toZMod 6 ω_2 = 3` (CRT of `(1, 0)`) | matches worked example `ω_2 ≡ 3 (mod 6)` | none |
| 0.3 `ẑ ≃ ∏_ℓ ℤ_ℓ` | `(1, 0, 1, 0, …)` | not an integer: its reductions mod `2` and mod `3` are `1` and `0`, mod `5` `1`, mod `7` `0`, no integer `k` has `k ≡ 1 (2), k ≡ 0 (3), k ≡ 1 (5), k ≡ 0 (7)` and so on for all primes alternately | the example separates `ẑ` from `ℤ` | none |
| 0.4 `IsUnit a ↔ ∀ n, IsUnit (toZMod n a) ↔ ∀ ℓ, IsUnit (component ℓ a)` | `a = 2`, `a = ω_2 + 1 - 2 ω_2 = 1 - ω_2`, `a = -1` | `2`: not a unit mod `2`, `component 2 = 2` not a unit; `1 - ω_2`: `component 2 = 0`; `-1`: unit everywhere | both directions hold on these | none |
| 1.1 `x ^ᶻ (n : ẑ) = x ^ n`, `x ^ᶻ 0 = 1`, `(x ^ᶻ a) ^ᶻ b = x ^ᶻ (a * b)` | `x = 1`; `x` of order `m = 6` in `Multiplicative (ZMod 6)`, `a = ω_2`; `a = 2, b = 3` | `1 ^ᶻ a = 1`; `x ^ᶻ ω_2 = x ^ (toZMod 6 ω_2).val = x ^ 3`, the `2`-component of `x`; `(x ^ 2) ^ 3 = x ^ 6 = x ^ᶻ 6` | agrees with the finite-group Check and the worked example | none |
| 1.1 ⚠ `(x * y) ^ᶻ a ≠ x ^ᶻ a * y ^ᶻ a` without commutativity | `S_3`, `x = (12)`, `y = (23)`, `a = 2` | `(xy)^2 = (123)^2 = (132) ≠ 1 = x^2 y^2` | ⚠ is a true negative control | none |
| 1.2 `x ^ᶻ ω_ℓ = x` on a pro-`ℓ` group; README's wider form "whenever `closedZpowers x` is pro-`ℓ`" | `G = Multiplicative ℤ_[3]`, `x = ofAdd 1`; `G = Multiplicative (ZMod 6)`, `x` a generator | `ofAdd 1 ^ᶻ ω_3 = ofAdd (component 3 ω_3) = ofAdd 1`; in `ZMod 6`, `x ^ᶻ ω_2 = x ^ 3 ≠ x` and `closedZpowers x = G` is not pro-`2` | Lean form (`hG : IsProP ℓ G`) is the special case of the README's; README's follows by naturality along the inclusion of `closedZpowers x` | none (note) |
| 1.3 `x ^ᶻ a = x ^[ℓ] (component ℓ a)`; unit exponents | `ℓ = 3`, `a = 2`, `u = 2 ∈ ℤ_3ˣ`; non-unit `u = 3` on an element of order `3` | `x ^ᶻ 2 = x ^ 2 = x ^[3] 2`; `(x ^[3] 2) ^[3] 2⁻¹ = x ^[3] 1 = x`; `x ^ 3 = 1 = 1 ^ 3` kills injectivity | ⚠ negative control for non-units true | none |
| 2.1 `(φ * ψ) x = φ (ψ x)`, `conj g x = g * x * g⁻¹` | `G = S_3`, `φ = conj (12)`, `ψ = conj (13)`, `x = (23)` | `φ (ψ x) = (12)(13)(23)(13)(12) = (12)(12)(12) = (12)`; `conj ((12)(13)) x = (132)(23)(123)` `= (12)` | composition convention equals `MulAut.conj`'s, `conj` is a homomorphism | none (`mul_apply := rfl`) |
| 2.2 congruence topology, `⊥` discrete | `Multiplicative ℝ`; discrete `ℤ × ℤ` | ℝ connected ⇒ only open subgroup is ℝ, `ℤ + √2 ℤ` dense ⇒ topology indiscrete; `⊥` open characteristic in `ℤ²` ⇒ `GL_2(ℤ)` discrete, infinite, not compact | both ⚠ examples correct; `discreteTopology_bot` at the pin | none |
| 2.2 `isClosed_isConj_pair` | `G × G` compact Hausdorff | image of `(g, x) ↦ (x, g x g⁻¹)` is `{(x, y) : IsConj x y}` by `isConj_iff` (`∃ c, c x c⁻¹ = y`) | proof in file correct; duplicate of `TauCeti.isClosed_isConj_pair` | R05 |
| 2.3 `outerAction_mk` quantifier order | `∃ φ, mk φ = outerAction (e N) ∧ ∀ n, φ n = e n e⁻¹` | one `φ = conjNormal e` for all `n`; swapping quantifiers would allow a different `φ` per `n` | correct order, proved from the pin | none |
| 2.4 `frattiniKernel P = ker (MulAut.mapQuotient (frattini P))` | `P = 1`; `P = ZMod 2 × ZMod 2`; `P = ZMod 4` | `frattini 1 = ⊤ = ⊥`, kernel `= {1}`; `frattini (ZMod 2)² = ⊥`, kernel `= {1}` inside `GL_2(𝔽_2)`; `frattini (ZMod 4) = 2 ZMod 4`, both automorphisms (`x ↦ ±x`) satisfy `(φ x)⁻¹ x ∈ 2 ZMod 4`, kernel `= MulAut (ZMod 4)` of order `2`, a `2`-group | definition and `isPGroup_frattiniKernel` consistent | none |
| 2.4 `frattiniCharacteristicIndex_cofinal` | rank `0` (`G = 1`): `I = {⊥}`, `U = ⊥`; general `U` | `N = ⊥ ≤ U`; `N := exists_isTopCharacteristic_le (U ⊓ Φ)`, `Φ` open by `isOpen_proPFrattini` | true, 3-line proof from the pin, `hG` unused | R03, R07 |
| 2.4 `map (mk' N) Φ = frattini (G ⧸ N)` | `G = ℤ_p` (`p` odd), `N = p^2 ℤ_p` | `Φ = p ℤ_p`, image `p ℤ/p² ℤ`; `frattini (ZMod p²) = p ZMod p²` | equal; 4-line proof from the pin, characteristic and `N ≤ Φ` unused | R03, R07 |
| 2.4 `frattiniCompatibleFamily_existsUnique` | rank `0`; `G = ℤ_p`, `σ_N = (x ↦ (1 + p) x)` on `ℤ/p^k` | rank 0: `σ_⊥ = 1`, `φ = 1` unique; `ℤ_p`: family compatible, each coordinate acts trivially mod `p`, `φ = (x ↦ (1 + p) x)`, in `ker (mapQuotient Φ)` since `(1 + p) x ≡ x (mod p)`; uniqueness from `⋂ I = 1` | true; the `Φ` coordinate gives `φ ∈ ker` (`frattini (G ⧸ Φ) = ⊥`, elementary abelian); same proof as pinned `exists_mapQuotient_eq` over `I` | R03 |
| 2.4 `isProP_ker_toFrattiniQuotient` (headline) | `G = freeProP p (Fin 2)`; `G = 1` | `H` open: preimage of `{1}` under the continuous map to the discrete `MulAut (G ⧸ Φ) = GL_2(𝔽_p)`; `G = 1`: `H = ContinuousAut 1 = 1`, pro-`p` | proved at the pin | none |
| 3.1 `closedLowerCentralSeries_succ`, `_one` | `p = 0`, `n = 0` | step `closure (⟨x^0⟩ ⊔ ⁅γ_0, G⁆) = closure ⁅⊤, ⊤⁆ = closure (commutator G)` since `x ^ 0 = 1` | proof in file correct | none |
| 3.1 ⚠ `γ_n` not open | `F = freeProP p (Fin 2)`, `n = 1` | `F ⧸ γ_1 = ℤ_p²` by 3.4, infinite | ⚠ correct | none |
| 3.2 bracket degree `j + k + 1`, Jacobi, alternation | `j = k = 0`, `x = y` | `⁅x, x⁆ = 1 ↦ 0 ∈ gr_1` | matches `gradedBracket_self` | none |
| 3.3 finite form needs compactness | `ℤ × ℤ² × ℝ`, `(a, b, c)(a', b', c') = (a + a', b + b', c + c' + a (b'_1 + √2 b'_2))` | cocycle bilinear ⇒ group; `⁅g, g'⁆ = (0, 0, a (b'_1 + √2 b'_2) - a' (b_1 + √2 b_2))`; generated subgroup `ℤ + √2 ℤ`, closure `ℝ` ⇒ `gr_1 ≅ ℝ`; brackets of the three generators with any `y` lie in `ℤ + √2 ℤ` | counterexample correct | none |
| 3.4 Heisenberg commutator, index, ranks | `(x, y, z)`, `(x', y', z')`; level `n` | `g h g⁻¹ h⁻¹ = (0, 0, x y' - x' y)`, so `⁅(1,0,0), (0,1,0)⁆ = (0,0,1)`; index `(p^n)^3 = p^{3n}`; `rank gr_1 = r (r-1)/2`: `0, 0, 1, 3` for `r = 0, 1, 2, 3` | matches `commutatorElement_eq` at the pin and the worked example | none |
| 3.4 `lcsGradedPiece_zero/one_freeProP_bijective` (headlines) | `r = 0`; `r = 1` | `r = 0`: `Fin 0 → ℤ_p` and `gr_0 (1) = 0`, both trivial, bijective; `r = 1`: no pair `i < j`, `gr_1 = 0` (free pro-`p` of rank `1` is `ℤ_p`, abelian) | proved at the pin | none |
| 1.1 `lift_eq_tauCeti` | any `Q : Type` | both sides are the term `TauCeti.zHat.lift a` after unfolding the `abbrev` | `rfl`: vacuous | R04 |

**Sources.** `lazard1954` (Numdam, read): Chapter I §2, journal pages 109–110 (`lazard1954 line
343–375`) defines the graded Lie ring `⊕ H_i / H_{i+1}` of an N-sequence with bilinear bracket
induced by the commutator, as the README's references say; Lazard's sequences are 1-based with
`[H_i, H_j] ⊆ H_{i+j}`, the README's 0-based `[gr_j, gr_k] ⊆ gr_{j+k+1}` is the same after
reindexing. The remaining locators (Ribes–Zalesskii §4.1, §4.3, §4.4, §4.5, Prop. 2.5.2, 2.8.7;
Dixon–du Sautoy–Mann–Segal Chapter 5; Gorenstein Chapter 5 §1; Huppert III §3; Magnus–Karrass–Solitar
§5.7; Serre Part I Chapter IV; Labute 1967; Neukirch–Schmidt–Wingberg I §1, III §9) are section- or
chapter-level citations of standard facts; the mathematics of every target they support was
checked independently above and at the pin, and the texts are listed under Not verifiable.

## Not verifiable

- Ribes–Zalesskii, *Profinite Groups* (DOI 10.1007/978-3-642-01642-4): paywalled; the service
  records it `uncertified`. Cited for §4.1, §4.3, §4.4, §4.5, Prop. 2.5.2, Prop. 2.8.7.
- Dixon–du Sautoy–Mann–Segal, *Analytic pro-p groups* (DOI 10.1017/CBO9780511470882): the
  Cambridge landing page is on no licence class; no legal text found; recorded in
  `needs-references.toml`.
- Labute, Invent. Math. 4 (1967) (DOI 10.1007/BF01425754): paywalled, `uncertified`.
- Gorenstein, *Finite Groups*; Huppert, *Endliche Gruppen I*; Magnus–Karrass–Solitar,
  *Combinatorial Group Theory*; Serre, *Lie Algebras and Lie Groups*: no legal source found by the
  service; recorded in `needs-references.toml`.
- Neukirch–Schmidt–Wingberg, *Cohomology of Number Fields*, 2nd ed.: the authors' page
  (`https://www.mathi.uni-heidelberg.de/~schmidt/NSW2e/`) offers the book's PDF free for
  non-commercial use, but the service twice returned the directory page for the PDF URL
  (`NSW2.3.pdf`) and extracted no book text; Chapter I §1 and III §9 are not checked here.
- Ownership against open pull requests was checked only against the sibling checkouts this brief
  lists and `roadmaps grep`; no open pull request other than #775 carries a `ProfiniteArithmetic`
  folder.

## Source issues

- none
