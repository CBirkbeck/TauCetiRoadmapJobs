# Review of AmenableGroups (pull request #2542 at 1d8464c)

**Verdict:** needs changes

**Summary.** Changes are needed for three findings, none of which touches a headline theorem. The Check of §1.1 computes a product in the affine group wrongly. The Layer 1 example on evaluation means is false for non-Hausdorff group topologies, which this roadmap explicitly admits. And three targets the README declares open (the difference identity of §5.1, the interval estimate of §6.1, the local conventions of §7.7) are already theorems of the pinned Tau Ceti. There are five small corrections and no format notes. Two facts about licences and source copies are left for the human reviewers.

## R01 (P2) — The Check of §1.1 gives the wrong product `xu` in the affine group

This Check is what pins the `f(ux)` convention of Convention 2. A reader who recomputes it from the stated group law gets a different value for `xu`, and the text sends them the wrong way. With `(a, b)(c, d) = (ac, ad + b)`, as stated on line 141, the product of `x = (a, b)` and `u = (α, β)` is `(aα, aβ + b)`. Line 143 says instead that "`xu = (a, aβ + b)` for `u = (α, β)`", which is false whenever `α ≠ 1`: for `a = 1, b = 0, α = 2, β = 0` the product is `(2, 0)`, not `(1, 0)`. The Check's conclusion still holds with the correct product. Writing `t = b/a`, one gets `f(xu) − f(x) = arctan((t + β)/α) − arctan(t)`, whose supremum over `t` is at most `|β|/α + |α − 1|/(2 min(α, 1))` and so tends to `0` as `u → 1`. The repair is to write `xu = (aα, aβ + b)`, so that `f(xu) = arctan((aβ + b)/(aα))`.

## R02 (P2) — "Evaluation at a point … invariant only for the trivial group" is false for the group topologies this roadmap allows

Conventions 1 and 2 stress that no separation axiom is assumed. Under exactly that generality, the Examples paragraph of Layer 1 (line 297) asserts something untrue. Take a nontrivial group with the indiscrete topology. There the only neighbourhood of `1` is `G`, so the condition of Convention 2 forces `f(ux) = f(x)` for all `u` and `x`, and `UCB(G)` is the constants. Then every mean is left invariant, evaluation at a point included. I checked this in Lean against the pinned Tau Ceti. For any group whose open sets are only `∅` and `G`, `(TauCeti.Mean.eval G x).IsLeftInvariant` holds, by `TauCeti.mem_ucb_iff` and `TauCeti.UCB.leftTranslation_apply`. The indiscrete topology on `Multiplicative (ZMod 2)` makes it a topological group. In general, evaluation at a point is invariant exactly when `UCB(G)` consists of the constants. For a Hausdorff group that happens only when `G` is trivial, because then bounded right-uniformly continuous functions separate points. Smallest repair: "invariant only for the trivial group when `G` is Hausdorff; with the indiscrete topology `UCB(G)` is the constants and every mean is invariant."

## R03 (P2) — Three targets declared open are already theorems of the pinned Tau Ceti

The README asks implementers to prove three statements that the pinned library already proves, and its scope paragraph tells readers the library lacks them.

- §5.1, line 720, asks for `|gF △ F| = 2 |gF \ F|`. This is `Finset.card_smul_finset_symmDiff` in `TauCeti/Algebra/Group/Action/Pointwise/Finset.lean`, line 35, stated for any left-cancellative action. The equality `|gF \ F| = |F \ gF|` is Mathlib's `Finset.card_sdiff_comm` applied to `Finset.card_smul_finset`.
- §6.1, line 841, asks for `|(k + F_n) △ F_n| ≤ 2|k|`. This is `Int.card_image_add_left_Icc_symmDiff_le` in `TauCeti/Data/Int/Interval.lean`, line 30, stated for every interval `Icc a b`, not only `Icc 0 n`.
- §7.7, lines 1084–1087, asks for a proof that for σ-finite Haar measure locally Borel sets are Borel and locally null sets are null. `TauCeti/MeasureTheory/Measure/Localization.lean` proves this for every σ-finite measure:
  - `MeasureTheory.Measure.locallyMeasurableSpace_eq` (line 60) for sets;
  - `MeasureTheory.Measure.isLocallyNull_iff` (line 91) for null sets;
  - `measurable_locallyMeasurableSpace_iff` (line 69) and `isLocallyNull_setOf_ne_iff` (line 99) for functions and for equality outside a locally null set.

  Its module docstring cites BDHV §C.5.

Consequently the scope paragraph is wrong where it lists these among the missing items, in "Layer 5 except the finite-test facts of §5.1", "Layer 6 except the interval estimate of §6.1" (line 1213) and "the local conventions of §7.7" (lines 1218–1219). The repair has three parts:

- Cite the three declarations in their sections and in the Tau Ceti supplier contracts.
- Reduce the §5.1 target to what is actually missing: monotonicity and the triangle bound.
- Remove the §6.1 and §7.7 "Prove" sentences and amend the scope paragraph to match.

## C01 — Layer 7's numbered items are gone without a map, and one consumed item has no new home

On main, BanachSpaceTheory (README line 1077, and the supplier contract at the head of its open revision) consumes "AmenableGroups Layer 7, item 1". BanachAlgebras (README lines 1557 and 1573–1574) consumes "AmenableGroups7.1–2" and its "localized Fubini" bridges. This rewrite replaces the five numbered items with §§7.1–7.8, so "item 1" no longer exists and "7.1–2" now points at different content. The first part of the old item 1, "measurability and Fubini statements" for the scalar integrands, is dropped, and §7.2 now says the convolutions are Bochner integrals that need no σ-finiteness.

A sentence at the head of Layer 7 would keep both citations followable: "Items 1–5 of the earlier Layer 7 are now §7.2 (item 1), §7.3 (item 2), §7.4 (item 3) and §7.5 (items 4–5). The Fubini statements of item 1 are replaced by the Bochner-integral convolutions of §§7.3–7.4." If BanachAlgebras still needs a localized Fubini statement, keep it as a target in §7.2 instead.

## C02 — The summary's third headline bullet names results that neither the layers nor `Suggested.lean` treat as headlines

Lines 23–26 list, under "The headline theorems are these", several further results:

- the nonamenability of every discrete group containing `F₂`;
- the amenability of finite, abelian and compact groups;
- the closure of discrete amenability under subgroups, quotients, extensions, finite products, directed unions and directed colimits.

The layers mark none of these as a headline. The module docstring of `Suggested.lean` (lines 18–23) lists the headlines without them, and the file neither states nor names them, although all are proved at the pin, for instance `TauCeti.not_amenable_of_injective_freeGroup`, `TauCeti.Amenable.of_commGroup` and `TauCeti.Amenable.of_compactSpace`. Either name them with their Tau Ceti declarations in the module docstring, or present them in the summary as further results rather than headlines.

## C03 — Seven of the eight theorems of `Suggested.lean` are closed by a single term from the pinned Tau Ceti

Each of `amenable_iff_exists_invariantContent`, `not_paradoxical_univ_of_invariantContent`, `freeGroup_two_paradoxical`, `hasFoelnerSets_iff`, `amenable_iff_hasFoelnerSets`, `amenable_iff_exists_finset` and `amenable_iff_not_paradoxical` is proved by one Tau Ceti theorem. `amenable_iff_exists_foelnerSequence` is proved by composing two. So, as targets, they ask an implementer for nothing, and they give each theorem a second name. The module docstring already says they are proved from Tau Ceti, so no change is required. If you prefer a single name for each theorem, you could cite the Tau Ceti theorems in the docstring instead, as QuadraticFormInvariants on main does, and keep only the open `L∞` statement.

## C04 — Downstream consumers omits AnalyticNumberTheoryPartII

AnalyticNumberTheoryPartII on main consumes Layer 6 for the amenability of the abelian group `ℚ_+×`, in its *Needs:* lines at README lines 2314 and 2562 and in its §6.33g at line 2564. The list at lines 1180–1195 does not name it. Add one bullet: "AnalyticNumberTheoryPartII: amenability of abelian discrete groups (Layer 6)."

## C05 — The pull-request description no longer matches the head on three points

1. The description says the pinned Tau Ceti lacks, among others, "three finite-test facts", "the interval estimate `|(k + F_n) △ F_n| ≤ 2|k|`" and "the comparison with BDHV's locally Borel and locally null sets". The pin has the difference identity, the interval estimate and the local conventions (R03). The sentence would read "Layer 5 except monotonicity and the triangle bound of the finite test and the eventual-equality fact; all of Layer 6".
2. "The eight layers keep their numbers and titles" is true of the layers, but the description does not say that Layer 7's numbered items became §§7.1–7.8 or that the localized Fubini target was dropped (C01). Add one sentence saying so.
3. "A Downstream consumers section lists the roadmaps that cite this one" misses AnalyticNumberTheoryPartII (C04).

## Verified sound

| Statement | Instances tried | Values computed | Result |
|---|---|---|---|
| §1.2 translations | `δ_1` on a discrete group | `L_gδ_1=δ_g`, `L_gL_hδ_1=δ_(gh)`; variant `f(g·)`: `δ_(g⁻¹)`, composite `δ_((hg)⁻¹)` | Check true; Tau Ceti `leftTranslation_apply` is `f(g⁻¹x)` (Translation.lean:124) |
| §1.3 means | `ZMod 2`, `m=2f(0)−f(1)` | `m(1)=1`, `m(1_{1})=−1`, `‖m‖=3` at `(1,−1)` | Check true; `Mean` bundles positivity and `m(1)=1` (Mean.lean:61) |
| §1.5 Check | trivial group → `ℤ` | push-forward is `ev_0`; `ev_0(1_{0})=1`, `ev_0(L_1 1_{0})=ev_0(1_{1})=0` | true |
| §2.2 Check | `ℤ`, singleton mass `c` | countable: `∑c∈{0,∞}≠1`; finitely additive: `nc≤1⇒c=0` | true; docstring claim holds in ZFC via a countable subgroup's cosets |
| §2.5 finite groups | `ZMod 3` | counting: `{0,1}↦2/3`; `ev_0`: `{0}↦1`, `{1}↦0≠1/3` | true; `uniform` from `[Finite G]` (Finite.lean:103) |
| §3.1 Check | `2ℤ` vs `ℤ`, shift ≤ `C` | `N+1` evens vs `2N−2C+1` targets; fails for `N>2C` | true |
| §3.2 Schröder–Bernstein | Garrido Thm 1.2 (line 43) | `A≲B`, `B≲A ⇒ A∼B`, any action | locator and statement agree |
| §3.5 free group | `1=a·a⁻¹`, `b=a(a⁻¹b)` | both in `aW(a⁻¹)`; `aW(a⁻¹)∩W(a)=∅` | true; Garrido Prop 1.5(1) (line 57); `paradoxical_univ` needs `[Nontrivial α]` |
| §4.1 subgroups | `x=kt`, `r(x)=k` | `r(k'kt)=k'k=k'r(x)`, `r|_K=id` | true; `of_injective`: `G` discrete, `H` any topology (Subgroup.lean:46) |
| §4.3 extensions | fiber average | constant on `x·range ψ ⊇ x·ker φ` by left invariance of `n` | true; Garrido Prop 2.2(2), BDHV G.2.2(ii) |
| §4.6 colimits | filtered `J`, discrete stages | `c.pt` any topology | `of_isColimit_of_discreteTopology` (Colimit.lean:71) matches |
| §5.1 Checks | `ℤ`, `F_n={0..n}`, `g=1`; `F=∅` | `△={0,n+1}`, ratio `2/(n+1)`, one-sided `1,1`; `0≤ε·0` | true; Garrido Def 3.1 uses `≤ε`, equivalent |
| §5.3 averages | `m_F(L_gf)−m_F(f)` | `= |F|⁻¹(∑_{g⁻¹F}f−∑_F f) ≤ ‖f‖|g⁻¹F△F|/|F|` | true |
| §5.5 sequences | uncountable abelian `G` | Følner sets exist, no sequence (`⋃F_n` countable) | `[Countable G]` needed and present |
| §6.1/6.2 | `k=3,n=1` | `{3,4}` vs `{0,1}`: `4 ≤ 6`; exact `2min(|k|,n+1)` | true; Garrido Prop 2.3, Ex 3.5 |
| §7.2 Check | affine group, `g=(2,0)`, `S=[1,2]×[0,1]` | `μ(Sg⁻¹)=1=2μ(S)`; BDHV `μ(Sg)/μ(S)=1/2` | true; Mathlib `map (·*g) μ = c(g)μ` (ModularCharacter.lean:93) |
| §7.3 Check | `ℝ`, `h=1_[0,1]`, `δ≤1/2` | four triangles of area `δ/4`: `‖h⋆k−h‖₁=δ` | true |
| §7.3 route | inversion formula | `h⋆k=∫k(z)c(z)h(·z⁻¹)=∫k(z)R_(z⁻¹)h`, `R_g` weight `c(g⁻¹)` | true (RightTranslation.lean:241) |
| §7.4 translation | `C_h(L_gφ)` | `=c(g)∫h(wg⁻¹)φ(w⁻¹x)`; integral `c(g)c(g⁻¹)∫h=∫h` | true |
| §7.8 compact | `haarProb_def` | `(haar univ)⁻¹ • haar` (Haar.lean:97); `of_compactSpace` needs no `T2` (Linfty.lean:317) | true; BDHV Ex G.1.5 |
| §8.2 Hall | finite `A`, projection `F` | `|A|≤k|F|≤|DF|` | true; CGH Thm 35 (line 904) |
| §8.3 Tarski | `k=2` injection | disjoint images, each `∼G`; subcopy form | true; Garrido Thm 1.11 (line 136), CGH Thm 7 (line 189) |
| headline `amenable_iff_exists_invariantContent` | trivial `G`; `F₂`; `SO(3)` | `δ_1` content; none, not amenable; topological but not discrete | `[DiscreteTopology G]` needed, present |
| headline `not_paradoxical_univ_of_invariantContent` | `X=∅`; paradoxical `X` | `m univ=0≠1`; `1=1+1` | true |
| headlines (Følner forms) | trivial `G`; `F₂`, `K={a,b}` | `F={1}`: `0<ε`; no `F` (else amenable) | true |
| headline `amenable_iff_exists_lpTop_invariant_of_isHaarMeasure` | trivial; `ℝ`; `F₂` with counting | `M=id`; both sides true; both false | true; forward direction absent at pin (Linfty.lean has discrete only) |
| headline `amenable_iff_not_paradoxical` | `ℤ`; `F₂` | amenable, not paradoxical; paradoxical, not amenable | true |
| R01 | `a=1,b=0,α=2,β=0` | `xu=(2,0)`; text gives `(1,0)` | false sentence |
| R02 | `Multiplicative (ZMod 2)`, indiscrete | `UCB` = constants; `ev_0` invariant; Lean probe elaborates | false sentence |
| R03 | pinned declarations | Interval.lean:30, Pointwise/Finset.lean:35, Localization.lean:60/91 | targets duplicated |

- Source locators checked against the text: 30 (Garrido 16, BDHV 10, CGH 3, Fremlin §443M 1).
- README backticked names checked at the pins: 458, all found (`#check` for compiled modules, grep of declarations for the 15 Tau Ceti modules without object files).
- Library declarations opened and compared with their README statements: 36 (Tau Ceti 29, Mathlib 7), several with file and line in the table.
- Cross-roadmap citations resolved: 2 outgoing (CompactGroups §0.1, OneParameterSemigroups Part C); 8 listed consumers on main; incoming citations in 10 roadmaps on main and 1 open revision.
- Dependency check: `depcheck: 200 roadmaps, 2192 edges, 0 problem(s)`, no UPWARD or CYCLE line; the full gate passed; 0 files changed outside the folder.
- Elaboration of `Suggested.lean`: 1 message, the `sorry` warning at line 115; `#check @name` of all 9 declarations compared with the README, 0 binders lost, 0 changes.
- Remark probes: 1 Lean probe (R02) elaborated with no error; 3 pinned declarations opened for R03.

Overlap check: read ClassicalErgodicTheory, BanachSpaceTheory, AmenableTracesOnCStarAlgebras, OperatorAlgebraDynamics and FactorRigidity; nothing shared. Each cites this roadmap, or `TauCeti.Amenable`, for invariant means and Følner theory, and none owns them.

Source independence: 16 passages compared with 4 sources, none shared beyond forced formulas and attributed definitions (BDHV C.5, Garrido Prop 1.5); largest share Garrido, 22 of about 43 locators; contents compared with Garrido §§1–3: independent (Layers 1 and 7 have no counterpart, and Layers 2–3 reverse Garrido's §1.1/§1.2 order).

Research link: Layer 7 is Bekka–de la Harpe–Valette (2008), Theorem G.3.1, the amenability input of their Property (T) theory; Layer 8 is the Tarski alternative of Ceccherini-Silberstein–Grigorchuk–de la Harpe (1999, Theorem 7); VonNeumannAlgebras, FactorRigidity and BanachAlgebras on main consume Layers 1–7. Rests on the README's References and the BDHV and CGH texts.

## Not verifiable

- BDHV at the author-page link the README gives could not be fetched (the host timed out). I read the same manuscript, dated 12 April 2007, from the Geneva institutional archive.
- The two Mathlib pull requests and the Zulip threads in the References are not cited for any statement and were not read.

## Source issues

- **Misprint** in Garrido at Lemma 3.4, p. 9: the source says a group satisfies the Følner condition iff it has a Følner sequence, with no countability hypothesis; it should assume `G` countable, as Definition 3.3 and the proof's enumeration of `G` do; affects nothing.
- **Gap** in Garrido at Theorem 3.6, proof, p. 9: the source says that if each `f` has some `a ∈ A` with `‖f − af‖ > ε`, the set `{f − af}` for one `a` is bounded away from `0`; it should separate in the product of copies of `ℓ¹(G)` indexed by `A`, because `a` depends on `f`; affects the proof.
- **Misprint** in Garrido at Theorem 3.6, proof, p. 9: the source writes `aB ∪ F` among the subsets of `F ∪ aF`; it should be `aB ∩ F`; affects nothing.
- **Misprint** in Garrido at Definition 3.1, p. 8: the source says that in the locally compact case `A` is a compact subgroup; it should be a compact subset; affects nothing.
- **Misprint** in Garrido at Proposition 2.2, proof of (1), p. 6: the source defines the quotient measure as `λ(A) := λ(AN)`; it should be `μ(AN)`, the measure on `G` of the preimage; affects nothing.
- **Misprint** in BDHV at §G.1, p. 450: the source calls `ϕ ↦ gϕ` with `gϕ(x) = ϕ(gx)` the action by left translations; this formula gives a right action, and a left action needs `ϕ(g⁻¹x)`; affects nothing, since invariance under all `g` is the same.

## For the human reviewers

- Licence: the References name two unmerged Mathlib pull requests by one author (Lean 3 invariant means; Lean 4 amenable monoid actions) and state a reuse condition (`TauCetiRoadmap/AmenableGroups/README.md`, lines 1398–1404). `Suggested.lean` wraps pinned Tau Ceti theorems, and I did not compare it with those pull requests.
- Licence: the BDHV text read is the Geneva archive's open-access copy of the 2007 manuscript, labelled as the published version made available under the publisher's policy. The README links a different, author-page copy.
