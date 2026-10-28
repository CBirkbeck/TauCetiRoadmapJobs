# GATE-ProfiniteCohomology~2: answers to the review of `98bf9c1`

Commit on the branch: `a925164` "ProfiniteCohomology: review repairs (headline-only acceptance
test, Tau Ceti contracts, general Evens norm, locators)". Files changed:
`TauCetiRoadmap/ProfiniteCohomology/README.md` and `TauCetiRoadmap/ProfiniteCohomology/Suggested.lean`.
Not pushed.

## H01 (CBirkbeck) — applied differently

The universe comparison is now stated as two propositions on native carriers in
`TauCetiRoadmap/ProfiniteCohomology/Suggested.lean`:
`cohomologicalDimensionAt_universe_eq : TauCeti.cohomologicalDimensionAt.{u} p G = TauCeti.cohomologicalDimensionAt.{0} p G`
and `strictCohomologicalDimensionAt_universe_eq` (the same for `scd_p`), for every topological
group `G : Type u`. The cochain isomorphism and the homology presentations are construction targets
in README Layer 11 ("Independence of the extra coefficient universe", line 1859), with the four
Checks the review gave plus a fifth. A probe showed that `rfl` does not close the equality at the
pins, so the statement is not a renaming. The six sorry'd constructions are in
`CohomologyUniverseComparison.lean` and `DimensionNormalization.lean`, which this job was not
allowed to edit. Nothing in README or `Suggested.lean` refers to either file any more. They still
import the old `Suggested.lean` and use names it no longer declares, so the worker must `git rm`
both files before pushing.

## H02 (CBirkbeck) — applied

`Suggested.lean` now states the class-module theorem natively on `TauCeti.abelianizationProP`,
its action and `TauCeti.abelianizationProPClass`, importing
`TauCeti.RepresentationTheory.Homological.ContCohomology.CohomologicalDimension.ClassModule.Basic`.
The hypotheses are prime `p`, profinite `G`, `TauCeti.strictCohomologicalDimensionAt.{u} p G ≤ 2`,
and `V` open and normal. Two theorems:
- `subsingleton_h1_abelianizationProP`: `Subsingleton (H1 (G ⧸ V) (Additive (abelianizationProP p G V)))`.
- `abelianizationProPClass_generates`: `∃ e : H2 (G ⧸ V) … ≃+ ZMod (p ^ V.index.factorization p), e (abelianizationProPClass p G V hV) = 1`.

The "missing continuity of this file's action" excuse is gone from the docstring. At the pin, Tau
Ceti proves only the case where `G ⧸ V` is a cyclic `p`-group
(`TauCeti.abelianizationProPClass_generates_of_isCyclic`, `Cyclic/SecondCohomology.lean:206`), so
the general statement is an open headline. The name `abelianizationProPClass_generates` is kept
because LocalGaloisGroups cites this target under it. README Layer 11 gives the statement, the
ℤ_p / pℤ_p carry-cocycle Check from the review, and the `V = G`, `p ∤ (G : V)` and `C_p`
negative-control Checks.

## H03 (CBirkbeck) — applied

`Suggested.lean` no longer declares a `TopPairing`, `WreathC2`, a dihedral section or any
index-two construction.
- **Layer 12** (README line 2188) now cites the pinned package milestone by milestone:
  `TauCeti.TopPairing`, `TauCeti.TopPairing.cup` (`Cup/Cohomology.lean:167`), `cup_assoc`
  (`Cup/Assoc.lean:214`), `cup_gradedComm` (`Cup/Graded/Comm.lean:447`), `cup_res`,
  `cup_infl`, `cup_coeffMap`, `cup_projection` (`Cup/ProjectionFormula.lean:293`) and
  `TauCeti.ContCohomology.explicitIso_cup`. The one remaining target is the all-degree
  compatibility with connecting maps, which is not at the pin.
- **Layer 13.1** (line 2298) is now a supplier contract on the Tau Ceti names, including
  `TauCeti.ContCohomology.graphClass_polarization` (`Evens/Identities.lean:139`),
  `TauCeti.ContCohomology.evensNormIndexTwo_eq_ind_pullback` (`Evens/DihedralPullback.lean`) and
  `TauCeti.WreathC2` and its companions. The convention Checks are kept, and the planned proofs are
  deleted.
- **Shapiro claim.** The "landed after this repository's Tau Ceti pin" sentence in Layer 10 now
  cites `Shapiro/AllDegrees.lean` and `Coinduced/Acyclic.lean` as present at the pin.

## H04 (CBirkbeck) — applied

Layer 13.2 (line 2379) now builds the norm `H^{2q}(U, A) → H^{2lq}(G, A)` for a discrete
commutative `G`-ring `A`. It carries transitivity, the double-coset formula, naturality (with
inflation as a special case), multiplicativity, the normalisation and the Theorem 1 expansion.
The characteristic-two all-degree form is milestone 7, with a compatibility clause, and agreement
with `TauCeti.ContCohomology.evensNormIndexTwo` is milestone 8. The out-of-scope bullet excluding
other coefficients is deleted, and §1 item 12 and the §3 convention are rewritten. Evidence:
- **Construction for a commutative `G`-ring:** Evens1963 lines 223–230.
- **Laws:** Props. 1–4 at Evens1963 lines 249, 274, 301 and 313; Thm. 1 at line 345.
- **Checks:** the review's `C₃ × C₂ ⊇ C₃`, `A = 𝔽₃` example was recomputed. `res N(a) = a² ≠ 0`
  and `N(2a) = 4N(a) = N(a) ≠ 2N(a)`. An expansion Check gives
  `res(1 + cor a + N a) = (1 + a)²`.

## H05 (CBirkbeck) — applied

`Suggested.lean` went from 4447 lines (366 declarations, 42 `sorry`) to 103 lines (4 theorems,
4 `sorry`, no `def`, no `example`, no instance). All four declarations the review named are
deleted: `continuousCohomology_preservesFilteredColimits`, `leastENatBound_le_iff`,
`leastENatBound_eq_top` and `res_corestriction_eq_add_evensConj`. The rest of the alias catalogue
went with them.

In the README, each backticked name the old file declared now resolves to an existing pin
declaration:
- 206 aliases were replaced by their Tau Ceti targets, taken from the old bodies.
- 106 other names were replaced by the unique pin declaration of that name, plus 17 hand-mapped
  equivalents (for example `cd_p_le_iff_finite_pPrimary` →
  `TauCeti.cohomologicalDimensionAt_le_iff_forall_finite_subsingleton_succ`).
- Names with no pin counterpart lost their backticks.

All 431 qualified `TauCeti.`, `OpenSubgroup.`, `Subgroup.`, `TopRep.` and `QuotientGroup.` names
in the README were checked against the pinned sources. One error of mine was found and fixed:
`TauCeti.TopPairing.ofDiscreteModulePairing` → `TauCeti.ofDiscreteModulePairing`.

## H06 (CBirkbeck) — applied differently

The form defects (`set_option autoImplicit false`, the imports of another roadmap module and of
`Mathlib.Algebra.Homology.ShortComplex.ModuleCat`, the "failed predecessor" history) are all in
the two auxiliary files. This job could not edit them; as stated under H01, they are now orphaned
and must be deleted. The README's matching process text is rewritten: the old PC11.U block that
named the two files, "honest/uncompiled" targets, and "only then" sequencing. A search of README
for predecessor, PC11, landed, uncompiled, removed, so far, currently, deferred and optional
finds nothing left. The new `Suggested.lean` is a single `import Mathlib` plus two `TauCeti.*`
modules, has no options, and builds with only the four `sorry` warnings (no linter output).

## H07 (CBirkbeck) — applied differently

**Kozlowski.** Corrected against the text (Kozlowski1984 lines 123–130, printed p. 311):
Lemma 2.4 concerns only the cover `EΣ₂ × X → BΣ₂ × X` and gives Steenrod-square formulas (for
degree one, `N(x) = x² + t x`). README Layer 13.2 Source and §8 now say exactly that. They cite
§2 (pp. 310–311, lines 90–102) for the characteristic-two norm and its multiplicativity, and state
that the index-two identities of 13.1 come from Tau Ceti's direct graph-cocycle proofs.

**Serre.** The Théorème 1′ attribution is deleted rather than re-cited at §4.1. The sources
service finds only a paywalled copy (recorded `uncertified`), so the review's new locator
(pp. 667–668) cannot be verified here. The `w₂` reading of the `D₁₆` class also belongs to the
Quadratic Form Invariants roadmap, which consumes it. That roadmap ownership is stated in 13.1,
with Kahn 1984 th. I.4.2 at rank one kept as the reference for the reading.

## H08 (CBirkbeck) — applied differently

**Concrete defects fixed:**
- The field-extension bridge moved from Layer 9 to Layer 13.3 (line 2462), the first layer where
  all its inputs exist. The §7 table and its "placement exception" paragraph are corrected, and no
  forward edge remains.
- The comparison-table row for `explicitIso_delta0/1` changed from "5 with 10" to "10".
- The new universe-comparison target has its own *Needs:* line and five Checks.
- Layers 12 and 13 end with `### Examples` and `### Dependencies`.

**Disputed:** the request to restructure the whole README into Summary / Scope and ownership /
Conventions / Exact supplier contracts / How to read the build headings, with per-target API
bullets throughout. That section structure (§1 Scope … §8 References, layer-wide Prerequisites)
is the structure of this roadmap on main (`git show origin/main:TauCetiRoadmap/ProfiniteCohomology/README.md`
has the same headings). This pull request corrects contracts; re-planning the presentation of the
existing roadmap is a separate repair of the roadmap on main and would widen this pull request's
scope.

## Build and gate

- `lake build TauCetiRoadmap.ProfiniteCohomology.Suggested`: **Build completed successfully
  (9018 jobs)**. The only diagnostics are four `declaration uses 'sorry'` warnings, at
  `Suggested.lean` lines 62, 70, 80 and 94.
- Gate:
  `gate ProfiniteCohomology: set_option=0 blob=0 latex=0 tex=0 prnum=0 sorry-data=0 sorry-examples=0 residue=0 private-paths=0 imports=0 mathlib-subimports=0 no-import-mathlib=0 lean-lines=0 forbidden=0 dropped=0 readme-ids-missing=0 empty-sections=0 round-labels=0 long-fences=0 layer-ids=0 target-ids=0 depcheck=0 metadata=0 stray-files=0 dirty=0 outside-folder=0 source-material=0 OK`.
  The gate does not inspect the two auxiliary `.lean` files (see H01 and H06).
- Depcheck (`--movable`): `depcheck: 162 roadmaps, 1177 edges, 0 problem(s)`. There is no UPWARD,
  CYCLE or moved line.
- `roadmaps resolve` on the README: no cross-roadmap citation and no Lean name found nowhere.
  Library names were checked separately against the pinned sources (H05).

## Signature check

`#check @` for all four declarations was elaborated once, in a temporary probe appended to
`Suggested.lean` and then removed. Each elaborated type carries every binder its README statement
names:
- `cohomologicalDimensionAt_universe_eq` and `strictCohomologicalDimensionAt_universe_eq`:
  `Group`, `TopologicalSpace`, `IsTopologicalGroup`.
- `subsingleton_h1_abelianizationProP` and `abelianizationProPClass_generates`: `Nat.Prime p`,
  `CompactSpace`, `TotallyDisconnectedSpace`, the bound on `strictCohomologicalDimensionAt`,
  `V.Normal` and `IsOpen ↑V`.

Nothing was missing, so nothing changed after the check. The same probe's
`example : cohomologicalDimensionAt.{u} p G = cohomologicalDimensionAt.{0} p G := rfl` failed
with a type mismatch.

## Adversarial pass (the four statements and the new README targets)

| Statement | Instances tried | Values computed | Result | Change |
|---|---|---|---|---|
| `cohomologicalDimensionAt_universe_eq` | `u = 0`; `G = 1`, `M = ℤ`, degree 0; `G = C₂`, `M = 𝔽₂`, degree 1; `rfl` at the pins | `u = 0`: both sides are the same term. `G = 1`: `H⁰ = ℤ` on both sides, `[1] ↦ [1]`. `C₂`: `H¹ = 𝔽₂` on both sides, nonzero ↦ nonzero. `rfl`: fails (type mismatch). | true; nontrivial | stated; Checks added |
| `strictCohomologicalDimensionAt_universe_eq` | as above, plus `p`-primary components | an additive equivalence `e` satisfies `e(A(p)) = B(p)`, so the vanishing predicates agree | true | stated |
| comparison isomorphism (README target) | wrong models `x ↦ −x`, the zero map, and naturality along `x ↦ 2x` | `G = 1`, degree 0: `−x` sends `[1] ↦ [−1] ≠ [1]`, excluded by the class condition. Zero map: not injective on `𝔽₂`. `x ↦ 2x`: both paths send `1 ↦ 2`. | specified | Checks added |
| `subsingleton_h1_abelianizationProP` | `G = ℤ_p`, `V = pℤ_p`; `V = G`; `G = ℤ_p × ℤ/ℓ`, `V = ℤ_p` | `Hom(ℤ/p, pℤ_p) = 0`. `V = G`: trivial quotient, `H¹ = 0`. `ℓ` acts invertibly on the pro-`p` module, so `H¹ = 0`. | true | stated |
| `abelianizationProPClass_generates` | `G = ℤ_p`, `V = pℤ_p` at `p = 2, 3`; `V = G`; `p ∤ (G : V)`; `G = C_p`, `V = 1` | `ℤ_p`: `H² = pℤ_p/p²ℤ_p`, carry class `∑_a f(a, 1) = f(p−1, 1) = p ↦ 1`, orders 2 and 3. `V = G`: `ZMod 1`, `1 = 0`. `p ∤ (G : V)`: `H² = 0 = ZMod p⁰`; a version with the full index `ℓ` would be false. `C_p`: `H² = 0` against a claimed order `p`, excluded because `scd_p C_p = ⊤`. | true; the `p`-part and the `scd` hypothesis are both needed | stated; Checks added |
| general Evens norm (13.2) | index 1; `C₃ × C₂ ⊇ C₃`, `A = 𝔽₃`; `C₄ ⊇ C₂`, `A = 𝔽₂`, `q = 1` | Index 1: identity. `C₃ × C₂`: `res N(a) = a·(s·a) = a² ≠ 0` in `H⁴(C₃, 𝔽₃)`; `N(2) = 2² = 1`, so `N(2a) = N(a) ≠ 2N(a)`; `res(1 + cor a + N a) = 1 + 2a + a² = (1 + a)²`. `C₄ ⊇ C₂`: `N(α) ≠ 0` (Tau Ceti `graphClass_cyclicFour_ne_zero`). | consistent with Evens1963 Thm. 1 and Props. 1–4 | target generalised |
| Layer 12 `δ`-compatibility sign | `(m, n) = (2, 1)` and `(1, 2)`, via `cup_gradedComm` | `mn + (m+1)n` mod 2 gives sign `−1` at `(2, 1)` and `+1` at `(1, 2)`; this excludes `(−1)^m`, `(−1)^{mn}` and a constant `−1` | `(−1)^n` is forced | Checks added |
| §7 dependency table | every row against its layer's *Needs* | Layer 9 no longer needs 10, 12 or 13; Layer 13.3 needs 9, 10, 12 and 13.1, all earlier or the same layer | no forward edge | table fixed |

## Ownership and sources

- **Ownership.** Searched open pull requests and main (`roadmaps grep` for `abelianizationProP`,
  class module, `cohomologicalDimensionAt.{u}`, Evens norm and multiplicative transfer). No
  roadmap plans the universe comparison, the general class-module theorem or the general Evens
  norm. ProfiniteProPGroups and LocalGaloisGroups consume this roadmap's Layer 11 by name. The
  "multiplicative transfer" hits in AnalyticNumberTheoryPartI and HabiroNumberFields are unrelated
  objects. All three headlines stay with this roadmap, which already owns Layers 11 and 13 on main.
- **Sources fetched this run.**
  - Evens1963: AMS open archive, publisher-open.
  - Kozlowski1984: AMS open archive, publisher-open.
  - SerreWitt1984: paywalled only, recorded `uncertified`; its citation was deleted (H07).
- **Not recorded.** The roadmap folder has no `sources.toml`, and this job may edit only
  README.md and Suggested.lean, so these entries are not recorded in a manifest. No
  `needs-references.toml` is left: both texts that needed fetching were fetched.
