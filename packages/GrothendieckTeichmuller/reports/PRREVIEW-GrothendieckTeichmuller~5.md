# Review of GrothendieckTeichmuller (pull request #1058 at 2104451)

**Verdict:** needs changes

Incremental re-review of 0 changed lines since 3ba2400. The head is a merge of main into the
branch: the folder `TauCetiRoadmap/GrothendieckTeichmuller/` is byte-identical to the one the
previous review accepted, and the only change that touches this roadmap is the pin bump the merge
brings in (`lake-manifest.json`: Mathlib `a91d3aa → f6090c70`, Tau Ceti `6b7abb3c → 358314d`). At
the new pins the push gate's build check fails on Lake's module-system warning (R01); everything
else passes. The diff outside the folder against the merge base
(`git diff --stat origin/main...HEAD -- . ':!TauCetiRoadmap/GrothendieckTeichmuller'`) is empty.
Gate run on this head without the build: OK (depcheck=0, set_option=0, prnum=0, tex=0, residue=0,
readme-ids-missing=0, stray-files=0, outside-folder=0, dirty=0). Gate run with `--build`:
`build=1 FAIL`, the one line being the warning quoted in R01; the targeted build itself produced
`Suggested.olean` (195 KB). Dependency check: `depcheck: 205 roadmaps, 1418 edges, 0 problem(s)`, no
UPWARD or CYCLE line; the merge order lists GrothendieckTeichmuller at line 368. One blocking finding
(the gate), three P3 notes carried from the previous review.

## R01 (P1) — the gate's build check fails at the new pins: `Suggested.lean` needs the module-system header

Location: `TauCetiRoadmap/GrothendieckTeichmuller/Suggested.lean` lines 1–7, `import Mathlib`
followed by six `import TauCeti.…` lines, and line 45, `namespace TauCetiRoadmap.GrothendieckTeichmuller`.

Claim: the gate's targeted build (`lake build TauCetiRoadmap.GrothendieckTeichmuller.Suggested`)
passes at the pins of `lake-manifest.json`.

Witness: run on this head, the gate reports `build=1 FAIL` with the single line
`warning: TauCetiRoadmap/GrothendieckTeichmuller/Suggested.lean: imports `Mathlib` from package
`mathlib`, which is designed for use with the module system; consider adding `module` to the start of
this file`. The elaboration is otherwise clean (the olean is built; `lake env lean` on the file gives
exit 0 and the fifteen `declaration uses 'sorry'` warnings only), so this is not a mathematical
defect: the merge of main moved the pins to Mathlib `f6090c70` and Tau Ceti `358314d`, both
module-system packages, and the gate counts every non-`sorry` warning of the build as a failure. The
previous review's head 3ba2400 pinned `a91d3aa`/`6b7abb3c`, where no such warning is emitted.

Repair, tested on a copy in the scratch directory: make the file a module-system module and keep
its declarations public. Line 1 `module`, a blank line, then `public import Mathlib` and `public
import TauCeti.<…>` for each of the six Tau Ceti modules, then the module docstring unchanged, then
the line `public section` before `namespace TauCetiRoadmap.GrothendieckTeichmuller` (no `end` for the
section). The copy elaborates with exit 0 and the same fifteen `sorry` warnings (shifted by the five
added lines), and a second scratch file importing it sees every headline: `#check` of
`eq_of_beta_eq`, `closure_artin`, `isUnit_iff_bijective_beta`, `isGT0_iff`, `GTHat.isGT0`,
`GTHat.injective_mk_betaEquiv`, `isClosed_setOf_isGT`, `GTHat.isClosedEmbedding_betaEquiv`, `Param`,
`gtMonoid`, `GTHat` all print their types (the public olean is 78 KB). `module` alone, without
`public import` and `public section`, silences the warning but makes every declaration private, so an
importer reports the theorem names as unknown identifiers: do not use that form. The gate's import
scanner admits `public import`.

## R02 (P3) — Scope: Brown's theorem is stated by PeriodsAndSpecialValues Layer PS.9; name the owner (carried from the previous review's R01)

Location: `TauCetiRoadmap/GrothendieckTeichmuller/README.md` lines 57–60: "Neither is their motivic
counterpart: Brown 2012 proves that the motivic Galois group of the mixed Tate motives over `ℤ`
acts faithfully on the motivic fundamental groupoid of `ℙ¹ ∖ {0, 1, ∞}` …".

Claim and witness: unchanged since the previous review. PeriodsAndSpecialValues (merge order line
296, earlier than this roadmap) states `MT(ℤ)` and its fibre functor (§PS.9.8), the motivic Galois
group (§PS.9.9), the motivic path torsor of `ℙ¹ ∖ {0, 1, ∞}` (§PS.9.10) and Brown's basis theorem
`H = H_MT^+` (§PS.9.22), which is the equality from which Brown 2012 deduces Conjecture 1.

Repair: after "Neither is their motivic counterpart" add "(mixed Tate motives over `ℤ`, their Galois
group and the motivic path torsor are stated in PeriodsAndSpecialValues §§PS.9.8–9.10 and Brown's
basis theorem in §PS.9.22)". The faithfulness statement and the Deligne–Ihara consequence are not
stated there, so their attribution to Brown 2012, §1 stays.

## R03 (P3) — 4.5: the locator for "profinite" (carried from the previous reviews' R02/R01)

Location: `TauCetiRoadmap/GrothendieckTeichmuller/README.md` lines 621–622: "*Source:* `GT̂` as a
profinite group of automorphisms of `F̂₂`: Lochak–Schneps 1994, §1; Harbater–Schneps 2000, §0."

Claim and witness: unchanged. harbaterschneps00 lines 71–75 give `GT̂₀`, `GT̂` as sets of pairs with
a group structure and no topology; lochakschneps94 §1 (lines 16–155) never calls `GT̂` profinite. The
route the roadmap uses (inverse limit of the images in `Aut(F̂₂/N)`) is Schneps 1997, §1.3, remark
(3), printed pp. 189–190 (schneps97 lines 278–284); Ihara 1991, §3.3 (ihara91 lines 9635–9638)
defines `GT̂` inside `Aut F̂₂`.

Repair: "*Source:* `GT̂` as a group of automorphisms of `F̂₂`: Ihara 1991, §3.3; Harbater–Schneps
2000, §0; `GT̂` profinite as the inverse limit of its images in `Aut(F̂₂/N)`: Schneps 1997, §1.3,
remark (3)."

## R04 (P3) — style: an unwrapped line and a manifest status word in the prose (carried from the previous reviews' R03/R02)

- README line 622 is 137 characters long (every other line of the file is at most 100, and
  `Suggested.lean` line 37 is 101): the sentence "Prove `GTHat.isClosedEmbedding_betaEquiv`: …" sits
  on the *Source:* line. Start it on a new line and wrap.
- README line 203 ("Ribes–Zalesskii 2010, §9.1, uncertified") and line 673 ("Uncertified: paywalled
  book, cited by locator"): `uncertified` is the manifest status of a citation, not a word of the
  mathematics. Cite by locator in the prose and the References and record the status in
  `sources.toml` when the manifest is created; Herfort–Ribes 1985, proof of Theorem C′, printed
  p. 160 (herfortribes85 lines 258–260) is a readable locator for the same decomposition.

## Previous findings

- R01 — not repaired: README lines 57–60 still defer the motivic theory with a citation of Brown
  2012 only, no owner named. (P3; R02 above.)
- R02 — not repaired: README lines 621–622 still read "*Source:* `GT̂` as a profinite group of
  automorphisms of `F̂₂`: Lochak–Schneps 1994, §1; Harbater–Schneps 2000, §0." (P3; R03 above.)
- R03 — not repaired: line 622 is still 137 characters; "uncertified" still at lines 203 and 673.
  (P3; R04 above.)

## Verified sound

**The change.** `git diff 3ba2400 HEAD --stat -- TauCetiRoadmap/GrothendieckTeichmuller` is empty;
the folder holds `README.md` (690 lines), `Suggested.lean` (286 lines), `metadata.toml` (1 line).
The three-dot diff against `origin/main` outside the folder is empty: the 696 files `changes.md`
lists are main's own commits brought in by the merge, not edits of this pull request. The only
effect on this roadmap is the pin bump of `lake-manifest.json` (Mathlib `f6090c70`, Tau Ceti
`358314d`, equal to main's), and the worktree's `.lake/packages` is at those revisions
(`git rev-parse HEAD` in each).

**Every library citation of the README re-resolved at the new pins** (the previous reviews resolved
them at `a91d3aa`/`6b7abb3c`). From Mathlib: `ProfiniteGrp`
(`Topology/Algebra/Category/ProfiniteGrp/Basic.lean:43`); `ProfiniteGrp.ProfiniteCompletion.completion`,
`eta`, `denseRange`, `lift`, `lift_unique` (`…/ProfiniteGrp/Completion.lean` lines 73, 81, 103, 147,
179); `commutator` (`GroupTheory/Commutator/Basic.lean:449`); `Subgroup.topologicalClosure`
(`Topology/Algebra/Group/Subgroup.lean:40`); `Subgroup.normalClosure`
(`Algebra/Group/Subgroup/Basic.lean:628`); `Subgroup.center` (`GroupTheory/Subgroup/Center.lean:30`);
`ContinuousMonoidHom` and `ContinuousMulEquiv` (`Topology/Algebra/ContinuousMonoidHom.lean` lines 57,
310); `Units.instTopologicalSpaceUnits` (`Topology/Algebra/Constructions.lean:100`, the induced
topology from `M × Mᵐᵒᵖ` as the README says); `TopologicalSpace.induced` and
`Topology.IsClosedEmbedding` (`Topology/Defs/Induced.lean` lines 64, 159). From Tau Ceti, in the files
the README names, all nine of which exist at the pin: `freeProfiniteGroup` (`Free/Basic.lean:60`),
`of` (74), `dense_closure_range_of` (94), `hom_ext` (108), `lift` (124), `lift_of` (129),
`lift_unique` (134), `comp_lift` (146), `map` (166), `existsUnique_continuousMulEquiv` (206); `zHat`
(`ZHat/Basic.lean:66`), `zHat.lift` (140); `isUnit_iff_component` and `unitsEquivPiPadicInt`
(`ZHat/Units.lean` 51, 79); `zpowHat` (`ZHat/Pow.lean:77`, notation `^ᶻ` scoped in `TauCeti.zHat`,
line 80), `zpowHat_intCast` (100), `zpowHat_mul` (136), `map_zpowHat` (151), `conj_zpowHat` (167),
`continuous_zpowHat` (217); `ContinuousAut` (`ContinuousAut/Basic.lean:83`), `ContinuousAut.conj`
(183), `ContinuousOut` (305), `ContinuousOut.mk` (313); `ContinuousAut.congruenceTopology`
(`Congruence.lean:79`), `ContinuousAut.t2Space` (`Congruence.lean:258`), `ContinuousAut.compactSpace`
(`ContinuousAut/Profinite.lean:209`), both under `variable … [CompactSpace G]` with
`hG : IsTopologicallyFinitelyGenerated G` as the README states; `IsTopologicallyFinitelyGenerated`
(`Generation.lean:73`), `IsTopologicallyFinitelyGenerated.bijective_of_surjective`
(`Profinite/Hopfian.lean:87`, hypotheses `hG`, `Continuous f`, `Surjective f`, in namespace
`TauCeti.IsTopologicallyFinitelyGenerated`); `BraidGroup` (`Braid/Basic.lean:97`), `sigma` (104),
`lift` (179), `permHom` (304), `permHom_surjective` (312), `pureSubgroup` (394, `(permHom n).ker`),
`sigma_sq_mem_pureSubgroup` (418). No name moved or changed its hypotheses between the pins.

**Elaboration at the new pins.** The gate's targeted build compiled `Suggested.lean` (olean written,
no error, no warning besides Lake's module-system line). `signatures.md` for this head lists the 43
declarations with 0 lost section binders; the file is byte-identical to the one the two previous
reviews compared statement by statement with the README, so that comparison stands. The repaired
scratch copy (R01) elaborates with exit 0 and `sorry` warnings at its lines 103, 107, 111, 115, 119,
135, 172, 206, 210, 224, 247, 255, 277, 282, 288 (the previous fifteen, each shifted by five), and the
scratch importer prints the eight headline types unchanged, e.g.
`eq_of_beta_eq : ∀ {p q : Param}, IsUnit p.lam → p.f ∈ commutatorClosure → q.f ∈ commutatorClosure → beta p = beta q → p = q`
and `GTHat.isClosedEmbedding_betaEquiv : Topology.IsClosedEmbedding GTHat.betaEquiv`.

**Adversarial table.** No statement changed; rows for every statement are carried from the previous
reports, which give the values. The new rows are the ones the pin bump could have affected.

| statement | instances | values | result | change |
|---|---|---|---|---|
| 4.5 `ContinuousAut.compactSpace`/`t2Space` hypotheses at pin `358314d` | `G = F̂₂` | `variable [CompactSpace G]` + `hG : IsTopologicallyFinitelyGenerated G` (Profinite.lean 58, 209; Congruence.lean 258); 0.1 supplies `hG` for `F̂₂` | as the contract says | none |
| 3.3 Hopf input `bijective_of_surjective` at pin `358314d` | endomorphism `β_p`, `p ∈ GT̂^{mon}` | hypotheses `hG`, `Continuous f`, `Surjective f` → `Bijective f` (Hopfian.lean 87); none dropped | as the contract says | none |
| 4.5 topology of `GT̂` = units topology | `Units.instTopologicalSpaceUnits` at pin `f6090c70` | induced from `M × Mᵐᵒᵖ` via `u ↦ (u, u⁻¹)` (Constructions.lean 100) | matches README line 619 | none |
| headline signatures survive the module-system header (R01) | 8 headlines + `Param`, `gtMonoid`, `GTHat` | types printed from a scratch importer identical to `signatures.md`; public olean 78 KB vs 2 KB-class for bare `module` | repair is sound | R01 |
| Scope rows (Brown Conj. 1, `d_N` count, `GT̂¹` slice, HLS levels, degenerate `(0,0,3)`, Hatcher's cycles) | as in the r4 report | values in the r4 table | sound (r4) | none |
| Conventions law, Drinfeld (4.11), 0.1 (two rows), 1.3, 3.2, 3.3, 4.3 (two rows), 4.5 (four rows), 2.4 Check 3 | as in the r3 report | values there (r3) | sound (r3) | none |
| `subst`, 0.2–0.4, 1.1, 1.2, 1.4, 1.5, 2.1, 2.3 Check 3, 2.4 Check 2, 3.1, 3.2 Check 2, 3.3 units, 3.4, 3.5, 4.1, 4.2, 4.4, Scope HMM | as in the r2 report | values there (r2) | sound (r2) | none |

**Seeded sample.** None of the sampled targets (0.1–0.4, 1.3, 1.5, 2.1, 2.2, 3.2–3.5, 4.1, 4.3, 4.5)
is touched by the diff; their locators were verified in the previous reviews (guillot14, schneps97,
lochakschneps94, drinfeld90, ihara91, harbaterschneps00, herfortribes85) and stand. 4.5's locator
note is R03.

**Supplier order, ownership, padding, headlines.** Depcheck output as in the header, no UPWARD or
CYCLE line; the README consumes nothing from another roadmap (its supplier contracts say so and the
dependency check agrees). Ownership against main and the 433 open pull requests was checked in the
previous reviews and no folder changed here. `Suggested.lean` unchanged: the one-tactic probe and the
headline list of the previous reviews apply (five headlines stated at lines 23–34 of the docstring,
3.5 named as not a headline).

## Not verifiable

- As in the previous reviews: Hatcher–Lochak–Schneps 2000 read in the authors' preprint, Brown 2012
  as arXiv 1102.1312v1, Grothendieck 1984 in the French text, Ribes–Zalesskii 2010 §9.1 paywalled,
  Ihara 1994, Belyi 1979, Montpellier folder 145. None is touched by this change.

## Source issues

- none at this round (no source was re-read; the previous reviews' entry on guillot14 Lemma 5.19
  stands).
