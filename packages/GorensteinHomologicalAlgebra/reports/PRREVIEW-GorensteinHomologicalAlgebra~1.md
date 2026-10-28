# Review of GorensteinHomologicalAlgebra (pull request #323 at 59db116)

**Verdict:** needs changes

Files reviewed: `TauCetiRoadmap/GorensteinHomologicalAlgebra/README.md` (315 lines) and
`TauCetiRoadmap/GorensteinHomologicalAlgebra/Suggested.lean` (216 lines). Sources read at their
locators: Bennis–Mahdou (`bennis-mahdou-2007`, arXiv math/0606770v1), Mahdou–Tamekkante
(`mahdou-tamekkante-2011`, arXiv 0904.4013v1), Šaroch–Šťovíček (`saroch-stovicek-2020`,
arXiv 1804.09080v2), Bennis, *Rings over which the class of Gorenstein flat modules is closed under
extensions* (`bennis-2009-gfclosed`, arXiv 0801.1183v1), Bennis, *A note on Gorenstein flat
dimension* (`bennis-2011-gfd`, arXiv 0811.2650v1). Holm 2004 could not be read legally (see
`## Not verifiable`). The worker's gate at this head fails (sorry-data 4, residue 3, metadata 1,
outside-folder 3); every failure is a finding below.

## R01 (P1) — Four definitions are sorry'd data and eight statements mention them

Location: `Suggested.lean` lines 133–134 (`IsGorensteinProjective`), 151–152
(`gorensteinProjectiveDimension`), 166–167 (`IsGorensteinFlat`), 173–174
(`IsProjectivelyCoresolvedGorensteinFlat`), each `:= sorry`.

Claim: the file states the summand theorem, the dimension-zero criterion, `PGF ⊆ GP`, closure of
`GF` under extensions, the flat summand direction and the `ZMod 2` non-example against these
predicates (lines 136, 141, 154, 178, 184, 195, 213).

Witness: the gate rule "no `sorry` in the body of a `def`" fires on all four; a `Prop := sorry`
predicate makes every theorem about it unfalsifiable (with `IsGorensteinProjective := True` all
of lines 136–145 and 178 hold and line 213 is false; with `:= False` the reverse).

Repair: give the two Gorenstein classes and `PGF` real bodies on native carriers, as the README
already describes them in Layer 0–1: a family `P : ℤ → Type v` of projective modules with
differentials `d n : P n →ₗ[R] P (n+1)`, `Function.Exact (d n) (d (n+1))` for all `n`, exactness
of `fun g : P (n+1) →ₗ[R] Q => g ∘ₗ d n` against `fun g : P n →ₗ[R] Q => g ∘ₗ d (n-1)` for every
projective `Q : Type v`, and `Nonempty (LinearMap.range (d 0) ≃ₗ[R] M)` (dually with
`TensorProduct.map LinearMap.id` for the flat classes; `PGF` is the projective-terms variant of
the tensor condition). This is the same shape StablePeriodicCurved uses for its finitely generated
carrier (its `Suggested.lean` line 488, with `CochainComplex (ModuleCat.{u} Rᵐᵒᵖ) ℤ` and
`Function.Exact` on Hom sets). For the dimension, either define `gorensteinProjectiveDimension`
by a real body (a recursive "has a Gorenstein projective resolution of length ≤ n" predicate on
`(n : ℕ)` and `⨅` over it into `ℕ∞`) or delete lines 149–155 and name the dimension statements in
the module docstring as not stated. Nothing may mention a sorry'd definition.

## R02 (P2) — StablePeriodicCurved on main already owns complete resolutions and Gorenstein-projective modules

Location: `README.md` line 101 ("This is a greenfield area: no Tau Ceti file develops Gorenstein
homological algebra"), lines 25–27 (singularity categories and the stable module category excluded
with no owner named), lines 105–111 (sibling dependencies: GrothendieckEulerForms and
ZigzagPreprojective only).

Claim: no roadmap builds these objects.

Witness: `TauCetiRoadmap/StablePeriodicCurved/README.md` on main, Layer 2 "self-injective
modules, total acyclicity, and singularities" (line 223; lines 233–245) defines totally acyclic
complexes of finitely generated projective right modules over a left-and-right noetherian ring,
finitely generated Gorenstein-projective modules as their degree-zero cycles, independence of the
complete resolution, the Frobenius category `Gproj-R` and Buchweitz's equivalence; its
`Suggested.lean` declares `TauCetiRoadmap.StablePeriodicCurved.CompleteProjectiveResolution`
(line 488) and `TauCetiRoadmap.StablePeriodicCurved.IsGorensteinProjective` (line 501). That is
the same object (a complete projective resolution and its cocycle), specialised to finitely
generated modules over noetherian rings, with `Hom_R(−,R)`-acyclicity as the test.

Repair: in `## Scope and ownership` name StablePeriodicCurved Layer 2 as the owner of the
finitely generated, noetherian, stable-category and singularity-category theory, and say in one
clause how this roadmap's class differs (arbitrary modules over an arbitrary ring, tested against
every projective `Q`). Add a comparison target in Layer 1: for `R` left-and-right noetherian and
`M` finitely generated, `IsGorensteinProjective R M` holds exactly when `M` has a
`StablePeriodicCurved.CompleteProjectiveResolution` (route: for a finitely generated projective
`P`, `Hom(P, −)` commutes with direct sums, so `Hom(P, R)`-acyclicity gives `Hom(P, Q)`-acyclicity
for every projective `Q`; the converse is the specialisation `Q = R`). Never restate the stable
or singularity material (lines 25–27 should defer to StablePeriodicCurved, not only to
GrothendieckEulerForms, which merely excludes it).

## R03 (P2) — The flat summand theorem is an equivalence over every ring; the "open problem" is not open

Location: `README.md` lines 166–170 ("the flat case is not, and the roadmap keeps them apart"),
178–182 (the converse only "over a coherent ring", Mahdou–Tamekkante Proposition 1.3), 258–260
(open problem: "Is the flat summand theorem an equivalence over an arbitrary ring?");
`Suggested.lean` lines 191–194 (docstring: "The converse is available over a coherent ring … not
in general").

Claim: "summand of a strongly Gorenstein flat module ⟹ Gorenstein flat" needs coherence.

Witness: the converse needs only that `GF` is closed under direct summands (strongly Gorenstein
flat modules are Gorenstein flat by definition). `saroch-stovicek-2020` line 1147, Corollary 3.12:
over any ring there is a hereditary cotorsion pair whose left class is `GF`; a left class
`⊥B` is closed under direct summands because `Ext¹(M ⊕ M', C) ≅ Ext¹(M, C) ⊕ Ext¹(M', C)`.
Equivalently, line 1074, Theorem 3.11(3): `M ∈ GF` iff `Ext¹(M, C) = 0` for all cotorsion
`C ∈ PGF⊥`, a condition inherited by summands. Independently, `bennis-2009-gfclosed` line 326,
Corollary 2.6: over a left GF-closed ring `GF` is closed under direct summands, and
`saroch-stovicek-2020` line 1067 says every ring is GF-closed. Mahdou–Tamekkante's coherence
(`mahdou-tamekkante-2011` lines 94–96) served only to invoke Holm's Theorem 3.7 for this closure.
The roadmap's own Layer 6 (line 232) already says "Closure … under direct summands comes with it."

Repair: state the flat summand theorem as an equivalence over every ring (within this roadmap's
`CommRing` convention), *Needs:* Bennis–Mahdou Theorem 3.5 for the forward direction and Layer 6's
summand closure (Šaroch–Šťovíček Corollary 3.12) for the converse; delete the third open problem
and the coherent-ring clause; make `exists_isStronglyGorensteinFlat_directSummand` an `↔` with
the same shape as line 141. Because the converse consumes Layer 6, reorder so that the general
`GF` closure statements precede Layer 3's flat clause (see R13).

## R04 (P2) — The Gorenstein flat dimension inequalities are restricted to coherent rings against the roadmap's own premise

Location: `README.md` lines 212–214: "Prove the same three inequalities for Gorenstein flat
dimension **over a coherent ring** … the flat case is not known in the generality of the other
two."

Claim: the inequalities of Mahdou–Tamekkante Lemma 1.7 are known only over coherent rings.

Witness: `mahdou-tamekkante-2011` line 132 derives Lemma 1.7 from Holm's Proposition 3.11, and
coherence enters only there. Over a left GF-closed ring, `bennis-2009-gfclosed` Theorem 2.3
(line 108) makes `GF` projectively resolving, Corollary 2.6 (line 326) closes it under direct
summands, and Theorem 2.8 (line 338) gives the Tor-vanishing characterisation of finite `Gfd`
(the generalisation of Holm's Theorem 3.14 that the paper announces at line 68).
`saroch-stovicek-2020` line 1067: every ring is GF-closed, which the roadmap itself states at
lines 222–224. With a projectively resolving, summand-closed class and the Tor characterisation,
the three inequalities with their equality clauses follow by the argument Lemma 1.5 uses for
`Gpd` (Holm's Theorems 2.20 and 2.24 route, with Tor in place of Ext). The sentence "not known in
the generality of the other two" therefore contradicts Layer 6, and the coherence hypothesis
narrows the target below the cited literature.

Repair: state the `Gfd` inequalities over every ring, *Needs:* Layer 6 (Šaroch–Šťovíček
Theorem 3.11 and Corollary 3.12; Bennis 2009 Theorem 2.3, Corollary 2.6, Theorem 2.8), and keep
coherence only for the targets whose sources need it (`Gfd ≤ Gpd`, the finitely presented
comparison, Holm's Theorem 3.14 as stated). Record Bennis 2009 in the references and in
`sources.toml`.

## R05 (P2) — Statable headline theorems are absent from Suggested.lean

Location: `Suggested.lean` module docstring lines 3–17 (names no headline as not statable);
`README.md` lines 215–216 (quasi-Frobenius rings), 240–241 (`PGF = GF` iff right perfect),
180–182 (the flat summand equivalence), 183–185 (finitely generated comparison).

Claim: the file states "the exactness, universe, and test-object conventions"; it does not say
which headlines are missing or why.

Witness: once R01 gives the classes real bodies, these are statable at the pins with no further
definition: "over a quasi-Frobenius ring every module is Gorenstein projective" as
`[IsNoetherianRing R] [Module.Injective R R] → IsGorensteinProjective R M` (a left noetherian,
left self-injective ring is quasi-Frobenius); "`PGF = GF` iff `R` is perfect" with Bass's
characterisation `∀ M, Module.Flat R M → Module.Projective R M` as the perfectness hypothesis
(Mathlib's `PerfectRing` is the characteristic-`p` notion and must not be used); the flat summand
`↔` (R03); the finitely generated comparison with `Module.Finite` and
`Module.FinitePresentation`. The dimension inequalities are statable once `Gpd` has a body (R01).

Repair: state each statable headline with `sorry`; for every headline left unstated (Ext/Tor
comparison on `ModuleCat R`, character-module duality) say so in the module docstring and name
the missing carrier.

## R06 (P3) — Gate residue, missing `metadata.toml`, no `sources.toml`

Location: `Suggested.lean` lines 133, 166, 174 (`: Prop := sorry`, the residue rule);
`TauCetiRoadmap/GorensteinHomologicalAlgebra/` has no `metadata.toml` and no `sources.toml`.

Witness: the gate reports `residue=3`, `metadata=1`; `CONTRIBUTING.md` lines 154–156 say the
`build` check fails without `metadata.toml`. Every cited work must be recorded in `sources.toml`
with its locator and fetch record; none is.

Repair: R01 removes the residue; add `metadata.toml` with the arXiv topic; add `sources.toml`
(schema `tauceti-roadmap-sources/v1`) with one key per work, including Bennis 2009 and the Holm
entry as `uncertified` with its DOI.

## R07 (P3) — Edits outside the roadmap folder

Location: `.github/ISSUE_TEMPLATE/1-intention.yml`, `.github/ISSUE_TEMPLATE/2-roadmap-issue.yml`,
top-level `README.md` (one line added to each).

Witness: `CONTRIBUTING.md` lines 144–152: a roadmap pull request touches only its own directory;
the roadmap list and the two template dropdowns are regenerated and committed by the sync bot
after merge, and hand edits only conflict with other open pull requests.

Repair: revert the three files.

## R08 (P3) — The README is not in the house shape: no supplier contracts, no `*Needs:*` lines, no Checks, most targets without locators

Location: `README.md` headings at lines 14, 49, 89, 113, 115–246, 294; Layers 0–2 and 4
(lines 115–195).

Claim: the layers are bullet lists of targets.

Witness: the required shape (`README.md` of the repository, "Writing a roadmap", and the sibling
roadmaps on main) has `## Scope and ownership`, `## Conventions`, `## Exact supplier contracts`,
`## How to read the build`, `## Layer k:` with `### k.n` prose subsections carrying a `*Needs:*`
line per target, API bullets per definition, a `**Checks.**` list with at least three
discriminating Checks per definition, `### Examples` and `### Dependencies` per layer,
`## Downstream consumers`, `## References`. Here no definition has a Check; no target has a
`*Needs:*` line; Layers 0, 1, 2 and 4 cite no locator for any theorem (for example line 137–138
closure under extensions is Holm Theorem 2.5; line 159–161 is Bennis–Mahdou Propositions 2.9 and
3.6, `bennis-mahdou-2007` lines 257 and 402; line 194–195 is Holm Proposition 2.27 for the
projective case and `bennis-2011-gfd` Theorem 2.2, line 68, for the flat case over any ring).

Repair: rewrite in the house shape; move the one-sidedness discussion (lines 40–47) into
`## Conventions`; put every "already in the library"/"owned by X" statement in
`## Scope and ownership`; give each target its exact hypotheses, locator and `*Needs:*` line.

## R09 (P3) — Wrong locators into Bennis–Mahdou

Location: `Suggested.lean` lines 53, 70, 81 ("Bennis--Mahdou Definition 1.1(1)", "(2)", "(3)");
`README.md` line 211 ("Bennis--Mahdou Lemmas 1.5 and 1.6"), line 213 ("Bennis--Mahdou
Lemma 1.7"), lines 184–185 ("Bennis--Mahdou Corollary 3.7").

Witness: `bennis-mahdou-2007` lines 46–59: Definitions 1.1(1)–(3) are the general Gorenstein
projective, injective and flat definitions (Holm's), not the strongly complete resolutions, which
are Definition 2.1 (line 121) and Definition 3.1 (line 369). Lemmas 1.5–1.7 are
Mahdou–Tamekkante's (`mahdou-tamekkante-2011` lines 113, 124, 133); Bennis–Mahdou's Section 1
has only Propositions 1.2 and 1.3. The finitely generated comparison is Proposition 3.9 (line 433)
in the text read, and it carries no coherence hypothesis and reads "finitely generated strongly
Gorenstein projective iff finitely presented strongly Gorenstein flat", not the README's "over a
coherent ring, a finitely presented module …"; the text read has a Proposition 3.7 (strongly
Gorenstein flat and finite flat dimension implies flat) and no Corollary 3.7.

Repair: cite Definitions 2.1 and 3.1; attribute Lemmas 1.5–1.7 to Mahdou–Tamekkante; state the
comparison as Proposition 3.9 states it, or cite the published numbering with the version read.

## R10 (P3) — Bennis–Mahdou and Mahdou–Tamekkante are commutative sources for statements made over `Ring`

Location: `README.md` lines 37–38 ("the projective and injective theories are built over an
arbitrary `Ring`"), 172–173 (Theorem 2.7 over any ring), 205–211 (Lemmas 1.5–1.6);
`Suggested.lean` line 141 (`[Ring R]`).

Witness: `bennis-mahdou-2007` line 23: throughout, `R` is a commutative ring;
`mahdou-tamekkante-2011` line 17: all rings are commutative. The statements do hold over any
associative ring (the proof of Theorem 2.7 at lines 219–246 uses only Holm's Proposition 2.5 and
`Hom(⊕, L) ≅ ∏ Hom`, and Holm's framework is associative), but as cited the sources prove less.

Repair: say in the target that the source is commutative and that the proof carries over verbatim,
giving the route (sum of all shifts, `Hom(⊕_m Σ^m P, L) ≅ ∏_m Hom(Σ^m P, L)`, and Holm's closure
of `GP` under direct summands), or cite a source stated over associative rings.

## R11 (P3) — Padding in Suggested.lean and a process docstring

Location: `Suggested.lean` lines 31–47 (four Layer 0 lemmas), 119–127 (two acceptance lemmas),
154–155 (`gorensteinProjectiveDimension_eq_zero_iff`), 208–214 (two named examples), 6–9
(module docstring).

Witness (one-tactic probe on a scratch copy, elaborated with the pinned Mathlib):
`comp_self_eq_zero_of_exact` closes by `hf.linearMap_comp_eq_zero`; `homotopy_hom_right` closes
by one `simp [LinearMap.comp_assoc, ← LinearMap.comp_add, add_comm, hs]`; `homotopy_hom_left`
closes by one `simp [← LinearMap.comp_assoc, ← LinearMap.add_comp, hs]`; `exact_of_homotopy` does
not close in one tactic but is a Layer 0 API lemma, not a headline.
`isStronglyGorensteinProjective_of_projective` mirrors the README's acceptance Check (line 264);
`exists_injective_to_projective_…` is an API bullet; `…_eq_zero_iff` restates the definition of a
dimension; `isStronglyGorensteinProjective_span_two` and `not_isGorensteinProjective_zmod_two_over_int`
mirror the named examples (lines 269–286). The docstring's "is not exhaustive … `sorry` is allowed
in this human-owned roadmap library" is process text.

Repair: delete these nine declarations from `Suggested.lean` (the README keeps them as API bullets
and Checks); replace the docstring by the required form (roadmap is `README.md`; headline theorems
against the pinned APIs; which headlines are not statable and what each lacks).

## R12 (P3) — The universe-moving lemma has no route for the injective and flat test objects

Location: `README.md` lines 73–79 ("Each such definition is accompanied by the lemma moving it
across universes"); `Suggested.lean` lines 67, 78, 89 (test objects `Q`, `E`, `I` in `Type v`).

Witness: for `Hom(-,Q)` the reduction holds (a map `P → Q` with `Q` projective lands in a sub-sum
of a free module indexed by at most `|P|` generators, and `Q` is a summand of a free module). For
`Hom(E,-)` with `E` injective and for `I ⊗ -` with `I` injective no cardinality bound on the test
object follows from the complex, and no source is cited for the reduction; Šaroch–Šťovíček's
cotorsion-pair generation by a set (Corollary 3.12, Theorem 4.6) is the nearest tool and is not
named.

Repair: give the three structures their own universe parameter `w` for the test object
(`∀ (Q : Type w) …`, the structure then lives in `Type (max u (v+1) (w+1))`), or cite the source
for the reduction and state the lemma as a target with its route.

## R13 (P3) — Build order: Layer 1 and Layer 3 consume Layer 6

Location: `README.md` lines 137–138 (each class, including Gorenstein flat, closed under direct
summands), lines 178–182 (flat summand converse), Layer 6 lines 229–232.

Witness: closure of `GF` under direct summands over an arbitrary ring is Šaroch–Šťovíček
Corollary 3.12, which the README places in Layer 6; the Layer 3 converse (R03) consumes the same
statement.

Repair: either move the arbitrary-ring `GF` closure statements (extensions, summands, direct
limits; Theorem 3.11 and Corollary 3.12) into Layer 1 with their `*Needs:*` lines, or move the
flat clauses of Layers 1 and 3 after Layer 6; a `*Needs:*` line may never point forward.

## R14 (P3) — Supplier citations without a section, and a term used before its definition

Location: `README.md` lines 109–111 and 216 (`ZigzagPreprojective`), 23–24
(`GlobalNumberFields`), 28 (`DGAInfinity`), 224 ("every ring is GF-closed").

Witness: ZigzagPreprojective on main packages "symmetric Frobenius and self-injective algebra
structures" in its Layer 2 "bases, dimensions, centers, and symmetric Frobenius traces"
(lines 260–273); the README cites the roadmap without a section. `NumberFieldOrder.IsGorenstein`
is a name in GlobalNumberFields' README (line 770 on main), not in its `Suggested.lean`. "GF-closed"
is Bennis 2009 Definition 2.1 (`bennis-2009-gfclosed` line 85) and is used here without a
definition or citation.

Repair: cite each supplier by roadmap and section; define "GF-closed" at first use with the
citation.

## R15 (P3) — Statement precision

Location: `README.md` lines 209–210 (`Gpd N'' - 1` valued in `ℕ∞`), 244–245 (character-module
duality "relating" the two classes), 159–161 (`Ext¹` versus the source's `Ext`), 194–195 (flat
case without a locator).

Witness: in `ℕ∞` the subtraction is truncated, so for `Gpd N'' = 0` the bound reads
`Gpd N ≤ Gpd N'` and for `Gpd N'' = ∞` it reads `∞`; both agree with Mahdou–Tamekkante Lemma 1.5
(computed: `0 → N → N' → N'' → 0` with `N''` Gorenstein projective and `Gpd N' = n ≥ 1` gives
`Ext^n(N', Q) ↪ Ext^n(N, Q)`, so `Gpd N = n`), but the README must say so. The duality is
one-directional over a general ring (`M` Gorenstein flat implies the character module is
Gorenstein injective; the converse needs coherence): state the direction and hypotheses.
Bennis–Mahdou Proposition 2.9 (line 260) writes `Ext(M, Q) = 0`; with the sequence
`0 → M → P → M → 0` dimension shifting makes `Ext¹` and all `Ext^i` equivalent: say so. The flat
case of line 194–195 over any ring is `bennis-2011-gfd` Theorem 2.2 (line 68).

Repair: as stated per item.

## Verified sound

**Gate and build.** `lake env lean` on a probe copy of `Suggested.lean` (the file plus the
one-tactic probes and 32 `#check` lines) elaborates in 20 s with `sorry` the only warnings on
the original declarations. The dependency check:

```
depcheck: 156 roadmaps, 1061 edges, 0 problem(s)
```

No UPWARD or CYCLE line; `GorensteinHomologicalAlgebra` is line 353 of the merge order.

**`#check @name` pass.** All 25 declarations elaborate with the types in the worker's
`signatures.md`; the six "dropped `[Ring R]`" leads are false positives (the flat declarations
rebind `R` with `[CommRing R]`, shadowing the section variable). No declaration lost a hypothesis
its README statement needs.

**Library declarations opened at the pin.** `Module.Flat` (`Mathlib/RingTheory/Flat/Basic.lean`
line 113, under `[CommSemiring R]` from line 82): the README's commutativity claim is correct at
the pin. `Module.Injective` field `∀ ⦃X Y : Type v⦄` (`Mathlib/Algebra/Module/Injective.lean`
line 62): the universe claim is correct. `Module.Projective` (`Mathlib/Algebra/Module/Projective.lean`
line 71, `[Semiring R]`). `Function.Exact.linearMap_comp_eq_zero` (`Mathlib/Algebra/Exact/Basic.lean`
line 315), `LinearMap.exact_iff` (line 249), `Module.Baer.injective`
(`Mathlib/Algebra/Module/Injective.lean` line 399), `CategoryTheory.Abelian.Ext`
(`Mathlib/Algebra/Homology/DerivedCategory/Ext/Basic.lean` line 118, needs `[HasExt C]`). No
Gorenstein, totally acyclic or complete-resolution object exists in the pinned Mathlib or Tau Ceti
(grep of both trees; the only "Gorenstein" hits are Daniel Gorenstein in group theory).

**Cross-roadmap citations resolved on main.** `DGAInfinity`, `GlobalNumberFields` (name at its
README line 770), `GrothendieckEulerForms` (scope exclusion at lines 34–35 as the README says),
`ZigzagPreprojective` (Layer 2, self-injective structures). Ownership against the open roadmap
pull requests the brief lists was checked by object (`roadmaps grep` for Gorenstein
projective/injective/flat, totally acyclic, complete resolutions, strongly Gorenstein): no open
pull request other than this one builds them; the only other owner is StablePeriodicCurved on
main (R02). The board's five packages are unrelated.

**Sampled locators (17 targets).** Bennis–Mahdou Definition 2.1 (line 121) ✓; Definition 3.1
(line 369) ✓; Proposition 2.3 every projective is strongly Gorenstein projective (line 155) ✓;
Theorem 2.4 quasi-Frobenius (line 186) ✓; Theorem 2.7 (line 215) ✓ commutative only (R10);
Proposition 2.9 (line 257) ✓; Theorem 3.5 one direction (line 397) ✓; "Corollary 3.7" ✗ (R09).
Mahdou–Tamekkante Proposition 1.3 (line 95) ✓ coherent; Lemma 1.5 (line 113) ✓ exactly the
README's clause; Lemma 1.6 (line 124) ✓; Lemma 1.7 (line 133) ✓ stated over a coherent ring.
Šaroch–Šťovíček Theorem 3.4 `PGF ⊆ GP` (line 863) ✓; Theorem 3.9 with the perfect-ring clause
(lines 1023–1027) ✓; the remark after it on `GP ⊆ GF`, ℵ₀-coherent rings and `FL ∩ GP = P₀`
(lines 1047–1063) ✓; Theorem 3.11 (line 1068; clause (3) at line 1074) ✓; Corollary 3.12
(line 1147; closure under direct limits at line 1149) ✓. The arXiv v2 numbering agrees with the
README's citations of the Selecta paper.

**Adversarial table.**

| Statement | Instances tried | Values on each side | Result | Change |
|---|---|---|---|---|
| `exact_of_homotopy` | `M = 0`; `M = P × P`, `f(x,y) = (y,0)`, `s(x,y) = (0,x)`; `M = ℤ`, `f = 0`, no `s` | `fs + sf = (x,0)+(0,y) = id`, `ker f = P×0 = range f`; for `f = 0` on `ℤ`: `ker = ℤ ≠ range = 0` and `0 = id` fails | true; `hs` needed | none |
| converse of the above (README line 121–122) | `R = M = ZMod 4`, `f = ·2` | `ker = range = {0,2}`; a contraction would give `4·s(1) = 1` in `ZMod 4`, i.e. `0 = 1` | converse fails as the README says | none |
| `comp_self_eq_zero_of_exact` | `f = ·2` on `ZMod 4` | `f ∘ f = ·4 = 0` | true; one library lemma | R11 |
| `homotopy_hom_right`/`_left` | arbitrary `Q`, `E`; `g = 0`; the `P × P` witness | `g∘(s∘f) + g∘(f∘s) = g∘id = g`; order of composition reversed correctly | true; `f∘f = 0` not needed | R11 |
| `StronglyCompleteProjectiveResolution` | wrong models `f = 0`, `f = id` on `P ≠ 0`; `P = 0` | `f = 0`: `ker = P ≠ 0 = range`; `f = id`: `ker = 0 ≠ P = range`; `P = 0`: valid, cocycle `0` | wrong models excluded by `exact` | R12 (universe) |
| `IsStronglyGorensteinProjective` vs Definition 2.1 | `M ≅ range f` vs source `M ≅ ker f` | equal under `Function.Exact f f` | agrees | none |
| `isStronglyGorensteinProjective_span_two` | `P = ZMod 4`, `f = ·2`, `Q = (ZMod 4)^(S)` | `range = ker = {0,2}`; `Hom(ZMod 4, Q) ≅ Q` with induced `·2`, exact coordinatewise; `|{0,2}| = 2 ∉ {4^n}` so not free, hence not projective over the local ring | true | R11 (padding) |
| `not_isGorensteinProjective_zmod_two_over_int` | `ZMod 2` over `ℤ` | GP ⟹ submodule of a free group ⟹ torsion-free; `2·1 = 0` | true | R11 (padding) |
| summand theorem (line 141) | `M = 0`; `M` projective; `M = ZMod 2` over `ℤ` | `N = 0`; `N = M`; both sides false (summands of torsion-free are torsion-free) | true over any ring, source commutative | R10 |
| `isGorensteinFlat_of_extension` | `A = C = 0`; split `B = A ⊕ C` | `B = 0`; direct sums of GF are GF | true (Cor 3.12) | none |
| `exists_isStronglyGorensteinFlat_directSummand` | forward direction only | matches Theorem 3.5 | true; converse also true | R03 |
| `StronglyCompleteFlatResolution.tensorExact` | `F × F`, `f(x,y) = (y,0)` | `I ⊗ (F×F) ≅ (I⊗F)×(I⊗F)` with `(a,b) ↦ (b,0)`, contraction `(a,b) ↦ (0,a)` | exact | none |
| `Gpd` inequality (line 209) | `Gpd N'' = 0`, `Gpd N' = n ≥ 1`; `Gpd N'' = ∞` | `0 - 1 = 0` in `ℕ∞`, bound `Gpd N ≤ Gpd N'`, equality via `Ext^n(N',Q) ↪ Ext^n(N,Q)`; `∞ - 1 = ∞` | agrees with Lemma 1.5 | R15 |
| `PGF ⊆ GP`, `PGF = GF ↔ perfect` | `R` a field; `R = ZMod 4` (quasi-Frobenius, perfect) | all classes equal all modules | consistent with Theorem 3.9 | R05 (state it) |
| Layer 4 "finite global dimension ⟹ GP = projective, GF = flat" | `R = ℤ` (gldim 1) | `Gfd ≤ fd` with equality when `fd < ∞` (Bennis Theorem 2.2) gives `GF = flat`; Holm Proposition 2.27 gives `GP = projective` | true, locators missing | R08 |
| Open problems 1–2 | — | match Šaroch–Šťovíček lines 1052–1063 verbatim in content | sound | none |
| Open problem 3 | summand of SGF | `GF` summand-closed over any ring (Cor 3.12) | refuted | R03 |
| Layer 5 "Gfd case not known in general" | any ring | GF-closed everywhere (line 1067), resolving and summand-closed (Bennis Thm 2.3, Cor 2.6) | refuted | R04 |

## Not verifiable

- Holm, *Gorenstein homological dimensions*, JPAA 189 (2004): the DOI resolves only to a
  paywalled publisher page and no arXiv or author-page copy was found (web search, arXiv). The
  README's Holm locators (Theorems 2.5, 2.20, 2.24, 3.7, Proposition 3.11, and Theorem 3.14 cited
  in R04) are corroborated only indirectly through `mahdou-tamekkante-2011` lines 94, 121, 132 and
  `bennis-2009-gfclosed` lines 65, 107, 333, 337. It is cited by locator alone (`uncertified`).
- Published numbering of Bennis–Mahdou (JPAA 210, 2007), Mahdou–Tamekkante (the journal version)
  and Šaroch–Šťovíček (Selecta 26, 2020): only the arXiv versions were read; the README should
  cite the version it uses.
- Enochs–Jenda, Auslander–Bridger, Christensen's LNM 1747, Christensen–Frankild–Holm 2006 and
  Bravo–Gillespie–Hovey are listed as references without locators for any target and were not
  opened.

## Source issues

- none
