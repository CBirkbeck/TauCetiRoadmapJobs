# Review of EtaleMassFormula (pull request #1792 at 47d1e4a)

**Verdict:** needs changes

Two blocking findings (R01, R02); nine P3. The mathematics of every stated theorem checked out on
every instance I computed (table under *Verified sound*); the blocking findings are ownership and
a false supplier claim, not the formulas.

## R01 (P2) — Layer 1 has two owners: it is PadicExtensionFamilies §0.6 at its open head

Location: `TauCetiRoadmap/EtaleMassFormula/README.md` lines 180–218 (Layer 1), 289–296 (the
quartic and automorphism worked examples), 43 and 335–337 (“which consumes Layer 1 here”), 144
(“none of it is claimed by the roadmaps this one consumes”).

Claim: the classification of degree-`n` extensions by their unramified part, the automorphism
count `#Aut_K(L) = #Aut_{K_f}(L) · #Stab([L])` with the displayed sum identity, the remark on
inseparable extensions, and the two worked examples are this roadmap’s own, and the `p`-adic
extension families roadmap consumes them from here.

Witness: `TauCetiRoadmap/PadicExtensionFamilies/README.md` at the head of its open pull request,
§0.6 “Extensions of degree `n` by their unramified part” (lines 458–499): the same fixed `n ≥ 1`,
`f ∣ n`, `𝒯(K_f, n/f)` with the `τ⁻¹` transport action, the same bijection with the same three
proof steps citing `eq_unramifiedExtension_inertiaDegree_iff`, the same automorphism count, the
same `Σ … = (1/f) · Σ …` display, the same sentence on inseparable extensions, and the same two
Checks (`ℚ_4` with `16` square classes, `6 + 4·2 = 14`; `ℚ_2(ζ_12)` and `ℚ_2(∜−3)` with
`4 = 2·2` and `2 = 2·1`). That README cites nothing from EtaleMassFormula (grep of its README and
`Suggested.lean` for `EtaleMassFormula` and `natCard_algEquiv_eq_mul`: no match), and its
*Not owned here* list (line 159) defers only “the étale (Bhargava) mass formula”. The merge order
lists PadicExtensionFamilies at position 373 and EtaleMassFormula at 374, so the sentence “which
consumes Layer 1 here” would be an upward dependency on that roadmap’s side.

Repair, within this pull request: cite the owner. Replace the classification and the automorphism
count by “Supplied by PadicExtensionFamilies §0.6” and keep in Layer 1 only what §0.6 does not
state, each with one clause saying how it differs: the subfield form
`inf_maximalUnramifiedExtension` (`L ⊓ K^ur = K_{f(L)}` inside `SeparableClosure K`), the Lean
form `natCard_algEquiv_eq_mul` of §0.6’s count on a subextension (say it is §0.6’s count read on
`IntermediateField K (SeparableClosure K)`), and the orbit count for every finite subextension
`ncard_isomorphic_mul_natCard_algEquiv` (§0.6 uses the mass formula roadmap’s totally ramified
case). Delete the copied worked examples (or keep the quartic one as a Check of the subfield
form, attributed to §0.6), delete the inseparable-extension sentence (every carrier here is a
subextension of `SeparableClosure K`, and `TauCeti.discriminantExponent_tower` at the pin assumes
`Algebra.IsSeparable K M`), delete the *Acknowledgements* section, and add a `*Needs:*
PadicExtensionFamilies §0.6` line. Then line 144 is true. If instead the move into this roadmap
is agreed, the other pull request must drop §0.6 first and this roadmap must be placed before it;
neither can be done from this folder, and until then the two READMEs each build it.

## R02 (P2) — Serre’s Theorem 1 is cited as implemented in Tau Ceti under a name that does not exist

Location: `TauCetiRoadmap/EtaleMassFormula/README.md` lines 97–100 (“These are implemented in Tau
Ceti … `TauCeti.tsum_one_div_natCard_residueField_pow_wildExponent` … Consume them by those
names”); `Suggested.lean` lines 24–26 say the same.

Claim: Theorem 1, `∑_{L ∈ σ_K(n)} q^{−c(L)} = n`, is implemented in Tau Ceti as that declaration.

Witness: at the pinned Tau Ceti (358314d4) there is no `TauCeti/NumberTheory/LocalField/MassFormula/`
directory at all (listing of `NumberTheory/LocalField/`), and no declaration containing
`wildExponent` or `ncard_isomorphic`. On main, `TauCetiRoadmap/MassFormula/PROGRESS.md` line 14
records “Still missing are Serre’s local fibre count, the integral of the root count, … and with
them both mass formulas”, and line 19 says the quadratic cases “do not come from a general
Theorem 1”; line 21: “Two pieces of Layer 4 now wait only on Theorem 1”. The library’s own
documentation of the `MassFormula.Finite` module lists only
`tsum_one_div_natCard_residueField_pow_wildExponent_ne_top_iff_finite` and `…_eq_encard`
(the tame case), not the equality with `n`. The names that do exist beyond the pin are the orbit
count `TauCeti.ncard_isomorphic_mul_natCard_algEquiv` (module `MassFormula.Orbit`), the wrapper
`IntermediateField.discriminantExponent` and `IntermediateField.discriminantExponent_eq_of_algEquiv`
(module `MassFormula.Basic`).

Repair: cite Theorem 1 as the mass formula roadmap’s Layer 4 target (“Theorem 1” of
`TauCetiRoadmap/MassFormula/README.md`, Lean form
`MassFormula.tsum_one_div_natCard_residueField_pow_wildExponent` of its `Suggested.lean`), and
list under the Tau Ceti names only the three that exist, with the note that they are beyond the
pin. Say nothing is “implemented” that the supplier’s own progress record says is missing. The
Lean file is unaffected: it already consumes the roadmap target, not a Tau Ceti name.

## R03 (P3) — Gate `imports`: `Suggested.lean` imports another roadmap’s module

Location: `TauCetiRoadmap/EtaleMassFormula/Suggested.lean` line 2,
`import TauCetiRoadmap.MassFormula.Suggested`.

Claim: the import is the way to consume `intermediateFieldDiscriminantExponent` while the pin
predates Tau Ceti’s wrapper.

Witness: the gate rule (`gate.md`, imports): `import Mathlib` first, then only individual
`TauCeti.*` modules. The import also pulls `Completed.LocalFieldsRamification.Suggested`, which is
where the file’s `LocalFieldsRamification.finiteIntermediateFieldValuativeRel`,
`…Topology`, `…_isNonarchimedeanLocalField`, `…_valuativeExtension` and
`LocalFieldsRamification.inertiaDegree` (lines 192–201) resolve; each is a reducible alias of a
Tau Ceti declaration that exists at the pin (`TauCeti.finiteIntermediateFieldValuativeRel`,
`TauCeti/NumberTheory/LocalField/FiniteExtension/IntermediateField.lean` line 71;
`TauCeti.inertiaDegree`, `InertiaDegree.lean` line 71).

Repair: drop the import. Use the `TauCeti.*` names directly in `intermediateFieldInertiaDegree`,
and define the totalized discriminant exponent here with the same body as the mass formula
roadmap’s wrapper (`TauCeti.discriminantExponent K L` under the four `TauCeti.finiteIntermediateField*`
adapters on the finite branch, `0` otherwise; `TauCeti.discriminantExponent` is
`Discriminant/Basic.lean` line 137 at the pin). The README then says in *Exact supplier contracts*
that this definition coincides with the mass formula roadmap’s `intermediateFieldDiscriminantExponent`
and is replaced by Tau Ceti’s `IntermediateField.discriminantExponent` when the pin moves, and
`tsum_inertiaDegree_eq` cites Theorem 1 from the README rather than from an imported name.

## R04 (P3) — Gate `build`: five module-system warnings

Location: `gate.md`, build (5): `imports Mathlib … designed for use with the module system;
consider adding module` for `EtaleMassFormula/Suggested.lean` and four transitively imported
roadmap files.

Witness: the worker’s gate counts every warning other than `declaration uses sorry` as a build
problem, and reports `build=5 FAIL` at this head; my own `lake env lean` run of the file gave
exactly 14 `declaration uses sorry` warnings and no error.

Repair: with R03 done, the four transitive warnings disappear (only Tau Ceti module files are
imported); make this file a module file as well: first line `module`, then `public import
Mathlib`, `public import TauCeti.NumberTheory.LocalField.Unramified.Existence` (and the other
Tau Ceti modules used), the docstring, `@[expose] public section`, then the namespace. The
declarations need no change.

## R05 (P3) — Gate `prnum`: pull-request numbers in the README

Location: README lines 43, 46, 336.

Repair: name the roadmaps: “PadicExtensionFamilies” (line 43; see R01), “ArithmeticStatisticsPartI
to ArithmeticStatisticsPartV and ArithmeticStatistics” (line 46), and delete line 336 with the
*Acknowledgements* section (R01). The pull-request description’s remark that links “need updating
when they merge” is process narrative and belongs nowhere in the folder.

## R06 (P3) — Gate `tex`: the Layer 1 display is read as TeX

Location: README line 204, the fenced block indented inside the bullet.

Witness: `gate.md`, tex (3), all at line 204 (`Σ_{[L]_K : f(L/K) = f} …`).

Repair: write the identity as an inline code span in the sentence, or move the fence to column 0
(the gate does not treat an indented fence as a code block). With R01 the display moves to the
§0.6 citation anyway.

## R07 (P3) — Gate `readme-ids-missing`: `discriminantExponent_eq_zero_iff`

Location: README line 117.

Witness: `gate.md`, readme-ids-missing (1). The declaration exists at the pin as
`TauCeti.discriminantExponent_eq_zero_iff` (`TauCeti/NumberTheory/LocalField/Discriminant/Basic.lean`
line 215); written without its namespace the gate reads it as a claim that this roadmap’s
`Suggested.lean` declares it.

Repair: write `TauCeti.discriminantExponent_eq_zero_iff`. The same applies to lines 111–113 and
118 (`eq_unramifiedExtension_inertiaDegree_iff`, `isTotallyRamified_unramifiedExtension_inertiaDegree`,
`finrank_unramifiedExtension_inertiaDegree_eq_ramificationIndex`, `ramificationIndex_mul_inertiaDegree`),
all of which exist at the pin under `TauCeti.` (`Unramified/Factorization.lean` lines 144, 124,
106; `InertiaDegree.lean` line 101).

## R08 (P3) — Bhargava locators cannot be verified and disagree with the citing literature

Location: README lines 6, 243, 251, 264, 266–267, 320–321; `Suggested.lean` lines 260, 300, 319,
330, 340 (“Thm. 1.1”, “Props. 2.1–2.3”, “eq. (2.4)”, “(2.1)”).

Witness: the article (IMRN 2007, rnm052) is paywalled at the publisher (the sources service got
HTTP 403; the publisher page offers purchase only), so the locators are unverified here. The two
papers that restate the results cite them by other numbers: Kedlaya 2007 (arXiv math/0511135v4,
kedlaya2007b line 42 “[4, Theorem 1]”, line 204 “[4, Propositions 1–3]”, citing the preprint) and
Wood 2008 (Algebra & Number Theory 2, wood2008 lines 200 and 342 “[Bhargava 2007, Proposition 1]”
for the mass formula by type, line 128 “Section 8.2”, citing the published article).

Repair: check the printed article and cite its numbering (likely “Theorem 1” and “Propositions
1–3”, with “§2” for the symbols and “§8” for general local fields); record the source in the
package’s `sources.toml` as `uncertified` with its DOI if no legal text is found. The statements
themselves are confirmed by the secondary sources (see *Verified sound*).

## R09 (P3) — README shape: no `*Needs:*` lines, no Checks on any definition, upstream headings missing

Location: whole README.

Witness: the folder has no `## Scope and ownership`, `## Conventions`, `## Exact supplier
contracts`, `## How to read the build` or `## Downstream consumers`; layers are `### Layer k`
bullets rather than `## Layer k` with `### k.n` prose subsections, `### Examples` and
`### Dependencies`; none of the eight definitions (`orbitDiscriminantExponent`, `GaloisSet`,
`etaleMass`, `homMulAction`, `etaleDiscriminantExponent`, `intermediateFieldInertiaDegree`,
`splittingSymbol`, `splittingSymbolAut`/`splittingSymbolExponent`/`ramificationPartition`) has a
`**Checks.**` list; no target has a `*Needs:*` line. Consequence: the dependency check records
zero supplier edges for this roadmap (`depcheck: 204 roadmaps, 1652 edges, 0 problem(s)`, no line
for EtaleMassFormula), so the supply direction to MassFormula, LocalFieldsRamification and (after
R01) PadicExtensionFamilies is not checked mechanically.

Repair: reshape to the upstream headings; give each definition its API bullets and at least three
discriminating Checks (the worked examples already contain the values: `d = 2` for `ℚ_2(i)`,
`#Aut(σ) = 2` for `(1 1)` and for `(2^1)`, `ramificationPartition {(2,2)} = (1,1)`, the
`n = 0` Galois set of weight `0`, the infinite `L` with junk inertia degree `0`); add a `*Needs:*`
line per target naming Mathlib and Tau Ceti declarations, earlier layers and supplier sections;
move the *Scope* deferrals into *Scope and ownership* and the consumer sentences into *Downstream
consumers*.

## R10 (P3) — Padding: `etaleMass_unramified` is the `k = 0` case

Location: `Suggested.lean` lines 330–336; also 288–296.

Witness: its docstring says it is “the case `k = 0` of `etaleMass_ramificationPartition`”; the
subtype `∀ x ∈ ρ.splittingSymbol, x.2 = 1` equals `ramificationPartition ρ.splittingSymbol = ∅`
for Galois sets (every `f_i ≥ 1`), and `(0).Partition` has one element with `0 ≤ n` parts.
`etaleMass_isTransitive_splittingSymbol` likewise calls itself “the case `r = 1` of
`etaleMass_splittingSymbol`”, and its `ρ.IsTransitive ∧` conjunct is implied by
`ρ.splittingSymbol = {(f, e)}` (one orbit). One-tactic probe (`simp` on every sorried statement,
scratch copy): none closes, so no declaration is padding by that test.

Repair: delete `etaleMass_unramified` from `Suggested.lean` (the README keeps it as a Check of
Prop. 2.2); either delete `etaleMass_isTransitive_splittingSymbol` or keep it as the Layer 2
milestone without the redundant conjunct.

## R11 (P3) — Module docstring in the old template

Location: `Suggested.lean` lines 6–40.

Witness: “suggest Lean forms for particular milestones”, “discharging all of them finishes
neither a layer nor the roadmap”, “`sorry` is allowed in this human-owned roadmap library — these
are goals, not proofs”, “pins the roadmap’s load-bearing definitions … and its named milestones”.

Repair: the form required of an acceptance test: the file states the roadmap’s headline theorems
(Bhargava’s formula `etaleMass_eq`, the splitting-type and ramification-partition refinements,
and the identification `tsum_etaleDiscriminantExponent` of the étale sum with the Galois-set
mass) against the pinned APIs, says that all of them are statable at the pins, and names the few
definitions they need. Drop the process sentence about `sorry` being allowed.

## Verified sound

Gate: `gate.md` at 47d1e4a: tex=3, prnum=3, imports=1, readme-ids-missing=1, build=5 (R03–R07,
R04); set_option, blob, sorry-data, sorry-examples, residue, private-paths, stray-files, dirty,
outside-folder, metadata, depcheck all 0. `git diff --stat origin/main...HEAD` outside the folder:
empty. `metadata.toml`: `topic = "math.NT"`.

Elaboration: `lake env lean` on a scratch copy of `Suggested.lean` with `#check @name` for all 27
declarations and 12 library declarations: 14 `declaration uses sorry`, no other diagnostic, 27 s.
Elaborated types compared with the README: every theorem keeps `[IsUniformAddGroup K]`; the defs
`orbitDiscriminantExponent`, `GaloisSet.discriminantExponent`, `etaleMass`,
`etaleDiscriminantExponent`, `intermediateFieldInertiaDegree`, `splittingSymbol` drop it (their
types do not mention it; `IsNonarchimedeanLocalField K` does not require it), exactly as the mass
formula roadmap’s wrapper does; `GaloisSet`, `GaloisSet.mulAction`, `GaloisSet.IsTransitive`,
`homMulAction` carry only `[Field K]`. No `def` lost a binder its README statement needs. No
`set_option`, no sorried data, `theorem` throughout, single `import Mathlib`.

Library declarations opened at the pins (Mathlib f6090c70, Tau Ceti 358314d4):
`TauCeti.unramifiedExtension` (`Unramified/Existence.lean` 85: `adjoin K` of the roots of
`X^{q^f} − X`), `TauCeti.existsUnique_isUnramified_finrank_eq` (386, `f ≠ 0`),
`TauCeti.maximalUnramifiedExtension` (`Unramified/Maximal.lean` 93, `⨆ f`),
`IntermediateField.le_maximalUnramifiedExtension_iff` (253, `[IsSepClosed Ω]`),
`TauCeti.eq_unramifiedExtension_inertiaDegree_iff` (`Unramified/Factorization.lean` 144),
`TauCeti.isTotallyRamified_unramifiedExtension_inertiaDegree` (124),
`TauCeti.finrank_unramifiedExtension_inertiaDegree_eq_ramificationIndex` (106),
`TauCeti.discriminantExponent_tower` (`Discriminant/Tower.lean` 42: `δ(M/K) = [M:L]·δ(L/K) +
f(L/K)·δ(M/L)`, hypotheses `[IsScalarTower K L M] [ValuativeExtension K L] [ValuativeExtension L M]
[Algebra.IsSeparable K M]`, as the README states it), `TauCeti.discriminantExponent_eq_zero_iff`
(`Discriminant/Basic.lean` 215), `TauCeti.discriminantExponent_eq_of_algEquiv` (251),
`TauCeti.inertiaDegree` (`InertiaDegree.lean` 71, `finrank 𝓀[K] 𝓀[L]`),
`TauCeti.ramificationIndex_mul_inertiaDegree` (101), the four `TauCeti.finiteIntermediateField*`
adapters (`FiniteExtension/IntermediateField.lean` 64–99); Mathlib
`Algebra.FormallyEtale.iff_exists_algEquiv_prod` (`RingTheory/Etale/Field.lean` 194, needs
`[EssFiniteType K A]`, which `Algebra.Etale` supplies through finite presentation),
`Algebra.Etale` (`Etale/Basic.lean` 205: formally étale and of finite presentation),
`Equiv.Perm.card_of_cycleType` (counts with the fixed points as `(card α − m.sum)!`),
`MulAction.index_stabilizer` (`index = orbit.ncard`), `IsSepClosure.equiv`, `krullTopology` (the
`IsOpen` in `GaloisSet` elaborates against it). `MassFormula.intermediateFieldDiscriminantExponent`,
`…_eq_of_algEquiv`, `MassFormula.tsum_one_div_natCard_residueField_pow_wildExponent`,
`MassFormula.ncard_isomorphic_mul_natCard_algEquiv` opened in
`TauCetiRoadmap/MassFormula/Suggested.lean` on main (lines 136, 248, 448, 467).

Cross-roadmap citations resolved: MassFormula on main (Theorem 1, the wrapper, invariance, orbit
count: present as targets; see R02 for the Tau Ceti claim), LocalFieldsRamification (Completed,
on main; every cited declaration found at the pin), PadicExtensionFamilies at its open head (R01),
the ArithmeticStatistics roadmaps (named only as deferrals). Ownership: `roadmaps grep` for
Bhargava’s mass formula, Galois sets, `splittingSymbol`, `etaleMass`, `orbitDiscriminantExponent`,
`intermediateFieldInertiaDegree` on main and across the 441 open pull requests: no match outside
this folder; the only overlap is §0.6 (R01). Merge order: EtaleMassFormula is listed last (374),
after PadicExtensionFamilies (373); its suppliers MassFormula and LocalFieldsRamification are on
main. Depcheck output: `depcheck: 204 roadmaps, 1652 edges, 0 problem(s)` (no UPWARD or CYCLE
line; no edge for this roadmap, see R09).

Sources: the summit is confirmed in three legal texts: kedlaya2007b (arXiv math/0511135v4) lines
44–57, Theorem 1.1 (Bhargava): `∑ 1/(w(L) q^{c(L)}) = ∑_{k=0}^{n} P(n, n−k)/q^k` with
`P(n, n−k)` = partitions of `k` into at most `n − k` parts and `P(n,0) = 0` for `n > 0`, so the
`k = n` term vanishes and the sum is the README’s; wood2008 lines 37–44, equation (1-1), the same
with `p(k, n−k)`; yasuda2025 lines 22–32, equation (1.2). Kedlaya’s (4.0.1) (lines 236–242) is
the transitive mass by residue degree, `(1/n!) ∑_{ρ transitive, f(ρ) = f} q^{−c(ρ)} = q^{f−n}/f`,
which with `n = fe` is exactly `etaleMass_isTransitive_splittingSymbol`; his Lemmas 3.1, 3.2 and
3.4 (lines 158–195) are the bridge `tsum_etaleDiscriminantExponent` (étale algebras of degree `n`
↔ continuous `ρ : G_K → S_n` up to conjugation, `Aut(L) ≅` centralizer, discriminant exponent
additive over factors). The mass formula by splitting type is attributed to Bhargava’s
“Proposition 1” by Wood (line 200) with the type `(f_1^{e_1} ⋯ f_r^{e_r})` as unordered formal
symbols and `f_i`, `e_i` the residue degree and ramification index of the fixed field of a point
stabilizer (lines 174–181), matching `splittingSymbol`.

Adversarial table (q the residue cardinality; “sym” a splitting symbol as a multiset):

| statement | instances | values each side | result |
|---|---|---|---|
| `etaleMass K 0`, `etaleMass_unramified 0` | one Galois set (`Perm (Fin 0)` trivial), weight `0` | `(0!)⁻¹·1 = 1`; unramified mass `1` | holds; `etaleMass_eq` excludes `n = 0` by `hn`, where the right side would be `0` |
| `etaleMass_eq`, `n = 1` | sym `{(1,1)}` | `M_1 = 1`; `q(0,1)·q⁰ = 1` | holds |
| `etaleMass_eq`, `n = 2`, `K = ℚ_2` | classes `K×K`, `ℚ_4`, six ramified quadratics (`d = 2, 2, 3, 3, 3, 3`) | `1/2 + 1/2 + (2·2⁻² + 4·2⁻³)/2 = 3/2`; `1 + 2⁻¹ = 3/2` | holds |
| `etaleMass_eq`, `n = 2`, `p` odd | two ramified quadratics, `d = 1`, `#Aut = 2` | `1 + 2·(1/2)·p⁻¹ = 1 + p⁻¹`; `q(0,2) + q(1,1)p⁻¹` | holds |
| `etaleMass_eq`, `n = 3` | syms `{(1,1)³}`, `{(3,1)}`, `{(2,1),(1,1)}`, `{(1,2),(1,1)}`, `{(1,3)}` | `1/6 + 1/3 + 1/2 = 1`, `q⁻¹`, `q⁻²`; `1 + q⁻¹ + q⁻²` | holds |
| `etaleMass_eq`, `n = 4`, coefficient of `q⁻²` | syms `{(1,2),(1,2)}`, `{(2,2)}`, `{(1,3),(1,1)}` | `1/2 + 1/2 + 1 = 2`; `q(2,2) = 2` | holds; `M_4 = 1 + q⁻¹ + 2q⁻² + q⁻³` |
| `tsum_isTransitive` | `n = 1`; `n = 2`, `K = ℚ_2` | `1 = 0!·1`; `1 + 2·2⁻² + 4·2⁻³ = 2 = 1!·(1 + 1/2 + 1/2)` | holds; `(n−1)!` labellings per subextension (bijections `G/H ≅ Fin n` with `H ↦ 0`) |
| `tsum_inertiaDegree_eq` | `(f,e) = (2,1)`; `(1,2)` over `ℚ_2`; `(1,2)`, `p` odd | `1 = 1·q⁰`; `2/4 + 4/8 = 1 = 2·2⁻¹`; `2/p = 2·p⁻¹` | holds; `d(L/K) = f·d(L/K_f)` from the tower law with `δ(K_f/K) = 0`, `c = d − e + 1` |
| `etaleMass_isTransitive_splittingSymbol` | `(2,1)`; `(1,2)` over `ℚ_2`; general | `(1/2!)·1!·1 = 1/2 = 1/(2q⁰)`; `(1/2)·1 = 1/2 = 1/(1·2)`; `(fe−1)!·e·q^{−f(e−1)}/(fe)! = q^{−f(e−1)}/f` | holds; equals Kedlaya (4.0.1) `q^{f−n}/f` |
| `etaleMass_splittingSymbol` | `{(1,1),(1,1)}`; `{(1,2),(1,2)}`; `{(1,2),(1,1)}` | `1/2 = 1/(1·2!)`; `3·(2/q)²/4! = 1/(2q²) = 1/(1·2!·q²)`; `3·2q⁻¹/3! = q⁻¹ = 1/(1·1·q)` | holds; block count `n!/∏(f_ie_i)!`, unordering `∏ m_x!`, block mass `(f_ie_i)!/(f_i q^{f_i(e_i−1)})` |
| `splittingSymbolAut`, `splittingSymbolExponent` | `{(2,2)}`; `{(1,3),(1,1)}`; `{(2,1)}` | `2·1! = 2`, exp `2`; `1·1!·1! = 1`, exp `2`; `2`, exp `0` | agree with `#Aut(K_2) = 2`, with `(1²1)` worked example `1/q` |
| `ramificationPartition` | `{(2,2)}`; `{(1,3),(1,1)}`; `{(1,1),(2,1)}` | `(1,1)`; `(2)`; `∅` (zeros filtered) | matches “each `e_i − 1` repeated `f_i` times, zeros dropped” |
| `etaleMass_ramificationPartition` | `n = 4`, `π = (1,1)`; `π = (2)`; `n = 2`, `π = (1)` | `1/2 + 1/2 = 1 → q⁻²`; `1 → q⁻²`; `1 → q⁻¹` (`= 1/2` at `q = 2`, the README’s value) | holds |
| `etaleMass_ramificationPartition`, hypotheses | `n = 3`, `k = 2`, `π = (1,1)` (2 parts `> n − k = 1`) | no symbol has `n_0 = −1`: left side `0 ≠ q⁻²` | `hπ` necessary and present; `k = n > 0` admits no `π` with `0` parts: vacuous, not false |
| `∑_{π(σ)=π} 1/#Aut(σ) = 1` | `m = 2`: `1/2 + 1/2`; `m = 3`: `1/6 + 1/2 + 1/3` | `1`; `1` | `∑_{λ ⊢ m} 1/z_λ = 1` per component `S_{n_t}`, `n_0 = n − k − #parts` |
| `tsum_etaleDiscriminantExponent` | `n = 0` (zero ring, no maps to a field); `n = 2`, `ℚ_2` | `1/(1·q⁰) = 1 = M_0`; `3/2 = M_2` | holds; `#Aut` finite since `Aut` embeds in `Perm` of the `n` embeddings |
| `etaleDiscriminantExponent_pi` | `ι = ∅`; `ι = Fin 2`, `(ℚ_2(i), ℚ_2)` | `0 = 0`; orbits of sizes `2, 1`, stabilizer fixed fields `ℚ_2(i)`, `ℚ_2`: `2 + 0 = 2` | holds; a map from a product of fields to a field factors through one projection |
| `GaloisSet.finrank_fixedField_stabilizer` | trivial `ρ`, `n = 2`; `ρ` onto `S_2` with kernel fixing `ℚ_2(i)` | `finrank ⊥ = 1 = #orbit`; `2 = 2` | holds; open stabilizer ↔ finite fixed field of degree the index |
| `…_fixedField_stabilizer_smul` | conjugate stabilizers `σHσ⁻¹`; `H` not open | `fixedField = σ(fixedField H)`, same `d`; both infinite, junk `0 = 0` | holds without hypothesis |
| `inf_maximalUnramifiedExtension` | `L = ⊥`; `L = ℚ_2(i)`; `L = ℚ_4`; `L = K^ur` (infinite) | `⊥ ⊓ K^ur = ⊥ = U_1`; `⊥ = U_1`; `ℚ_4 = U_2`; `K^ur ≠ U_0 = ⊥` | holds; `[FiniteDimensional K L]` necessary (last instance) |
| `natCard_algEquiv_eq_mul` | `ℚ_2(ζ_12)`; `ℚ_2(∜−3)`; `ℚ_4`; `⊥` | `4 = 2·2`; `2 = 2·1`; `2 = 1·2`; `1 = 1·1` | holds; `−1` is not a square in `ℚ_4(√√−3)`: `x² + y²√−3 = −1` forces `xy = 0`, and neither `−1` nor `−√−3` is a square mod `4` in `ℤ_2[ζ_3]` |
| `ncard_isomorphic_mul_natCard_algEquiv` | `ℚ_4`; `ℚ_2(∜−3)` | `1·2 = 2`; `2·2 = 4` (the class is `{ℚ_4(θ), ℚ_4(iθ)}`) | holds |
| Layer 1 quartic count over `ℚ_2` | `ℚ_4^×/squares` | `2^{2+2} = 16` classes, `14` ramified; Frobenius-fixed classes `8` (`|V^G| = |ℚ_2^×/(ℚ_2^× ∩ ℚ_4^{×2})|·|H¹(G, ℚ_4^{×2})| = 4·2`), so `6` ramified fixed + `4` pairs = `10` orbits; `6·1 + 4·2 = 14` | holds |
| weight convention | `ℚ_2(i)`: `d = 2` (disc `−4`), weight `1/q^d = 1/4` | agrees with the mass formula roadmap’s worked example `d = 2`, `c = 1` | consistent |
| generality | README “every non-archimedean local field”, including `𝔽_p((t))` | Lean `[IsNonarchimedeanLocalField K]`, sums in `ℝ≥0∞` | equal; the equal-characteristic infinite sums are finite values of the formula |

Other checks: `GaloisSet` (open kernel) excludes nothing a continuous action admits and admits no
discontinuous one; `homMulAction` is a left action (`(στ)∘g = σ∘(τ∘g)`); `splittingSymbol` uses
exact division since `f ∣ [F:K]`; `intermediateFieldInertiaDegree` junk `0` on infinite `L` is
harmless in every statement (each has `finrank = fe > 0` or `[FiniteDimensional]`); the
hypotheses `hσ`, `hn`, `hk`, `hf`, `he`, `hn` are each either used or harmless (`hk` follows from
`hπ`). The transport in Layer 2 is sound: `SeparableClosure K` is a separable closure of `K_f`
by the tower, and degree, total ramification and the discriminant exponent over `K_f` are
isomorphism invariants. The README’s route to Prop. 2.2 through conjugacy classes of
`S_{n_0} × ⋯ × S_{n_k}` is correct as written, including the `t = 0` component.

## Not verifiable

- Bhargava 2007 (IMRN rnm052): no legal full text (publisher 403 to the sources service, purchase
  only on the publisher page, no arXiv or author copy found). The statements of Thm 1.1, Props
  2.1–2.3 and (2.4) as the README gives them are confirmed only through Kedlaya 2007, Wood 2008
  and Yasuda 2025 (above). The README’s claim (lines 261–263) that Bhargava “writes the product
  from `t = 1`” and that his statement needs `S_{n_0}` is unverified; if the printed proof does
  omit the unramified component, that is a *Gap* entry for the errata register once someone with
  the text confirms it.
- The numbering “Thm. 1.1 / Props. 2.1–2.3 / (2.4)” versus “Theorem 1 / Propositions 1–3” (R08).
- Ownership against open pull requests beyond those whose files the brief lists was checked only
  through `roadmaps grep` over the 441 indexed pull requests.

## Source issues

- none
