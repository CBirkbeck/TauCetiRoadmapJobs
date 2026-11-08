# GATE-HomotopySpheres~4: answers to human review of the HomotopySpheres pull request

Head before: `a4f5c1e`. Head after: `0705b9a`, two commits. `55547a5` edits
`TauCetiRoadmap/HomotopySpheres/README.md` and line 3 of `TauCetiRoadmap/HomotopySpheres/Suggested.lean`.
`0705b9a` puts line 3 back (see H01), so `Suggested.lean` at `0705b9a` is byte-identical to
`a4f5c1e` and the only net change is to the README.
There is one review to answer: CBirkbeck, 2026-11-08T05:24:26Z, of head `a4f5c1e`. Its seven
findings F01–F07 are H01–H07 here. The copy of the review given to this job breaks off inside its
"Verified sound" part, after "The consumers on main: PositiveScalarCurvature (". All seven
findings come before that point. The previous-findings list (R01–R07) states no new point: its
open items R02 and R05 are F02 and F04.

"Main's pins" means Tau Ceti `2fd255d` and Mathlib `1b1ccf4`: the pins of main, of this job's
brief, and of the pull request's CI. CI builds GitHub's merge of the pull request into main
(`.github/workflows/ci.yml` on main, lines 12 and 94). The branch's own `lake-manifest.json` still
pins Tau Ceti `a91d3aa` and Mathlib `6b7abb3`, because the branch forks from main before the pin
bump `a891cd19`. The targeted build and the gate's import check in this worktree run at the
branch's pins.

## H01 (CBirkbeck) — applied differently

The finding is correct, but the folder at `0705b9a` does not contain the import change.
`Suggested.lean`:3 still reads `import TauCeti.Geometry.Manifold.Orientation`, which is the module
at the branch's pin `a91d3aa`. The change to `import TauCeti.Geometry.Manifold.Orientation.OrientedAtlas`
is right only once the branch has main's `lake-manifest.json` (step 1 of the suggested repair), so
it has to go into the same commit as that manifest step.

- **Why the change waits for step 1.** `55547a5` made step 2 on its own. The branch still pins
  `a91d3aa`, and `TauCeti/Geometry/Manifold/Orientation/OrientedAtlas.lean` does not exist there
  (at `a91d3aa`, `Orientation` is the single file `Orientation.lean`). As a result the targeted
  build failed with `bad import 'TauCeti.Geometry.Manifold.Orientation.OrientedAtlas'` and the
  gate gave `imports=1`. `0705b9a` puts line 3 back. Step 1 is a branch operation, not a folder
  edit, so it is the worker's to make.
- **No import is valid at both pins.** The two declarations the file uses are defined in
  `Orientation.lean` (:332 and :178) at `a91d3aa` and in `Orientation/OrientedAtlas.lean` (:283
  and :129) at `2fd255d`. The only modules present at both pins that re-export them are unrelated
  ones such as `TauCeti.LowDimTopology.Geometrization`. Importing one of those would break the rule
  that the file imports only the Tau Ceti modules it actually uses, so it was rejected.
- **Why the line must change at the rebase.** At `2fd255d`, `TauCeti/Geometry/Manifold/Orientation` is a
  directory with no `Orientation.lean` beside it. The current import therefore fails in CI's merge
  build and in any rebase of the branch, and the worker's own signature run at main's pins failed
  on it.
- **Meaning is the same under either import.** `TauCeti.IsOrientedAtlas` (`Orientation/OrientedAtlas.lean`:283 at
  `2fd255d`; `Orientation.lean`:332 at `a91d3aa`) has identical fields at both pins.
  `TauCeti.OrientationPreservingOn`, `orientationPreservingPregroupoid` and
  `orientationPreservingGroupoid` (`OrientedAtlas.lean`:50, 116 and 129 at `2fd255d`;
  `orientationPreservingGroupoid` at `Orientation.lean`:178 at `a91d3aa`) have identical bodies at
  both pins, checked with `diff`. So switching line 3 at the rebase changes no statement.
- **The README cites main's pins** (the pins of this job's brief). It names
  `Orientation/OrientedAtlas.lean`:283 and :129 in its Tau Ceti supplier contract, and it matches
  the Lean once line 3 changes with the manifest step. No README edit is needed for that step.
  Spot-checked at `2fd255d` and `1b1ccf4`:
  - Tau Ceti: `MappingCylinder.lean`:87/425, `Orientation/Basic.lean`:32,
    `ConnectedSum/Oriented.lean`:143/208 and `Sard/EqualDimension.lean`:105/112;
  - Mathlib: `SingularSet.lean`:50/66/74, `CompactlyGeneratedSpace.lean`:68, `Bernoulli.lean`:696
    and `PoincareConjecture.lean`:41.

  The line numbers in the review's table are those at `a91d3aa`. The docstring sentence "The pins
  have that connected sum" holds at main's pin (`OrientedConnectedSum` is at `Oriented.lean`:143).
- **The `.OrientedAtlas` import, verified at main's pins.**
  - The folder at `55547a5` was copied into a temporary detached worktree of `origin/main`, using
    main's package set, and removed afterwards.
  - The targeted build there gave `Build completed successfully`, with 16 `declaration uses
    'sorry'` warnings and nothing else.
  - The gate there passed every check except `dirty=1`, which comes from the uncommitted copy in
    that worktree; in particular it gave `imports=0`.

## H02 (CBirkbeck) — applied

The three consumer bullets for GeneralAlgebraicKTheoryPartII, DGFloerPartII and
GeometryOfNumbersAndQuadraticArithmetic are deleted from Downstream consumers (old README:3140–3149).
Their names are removed from the "Feeds" column of tracks 3, 4 and 7 (old :3172, :3174, :3177; now
:3165, :3167, :3170). The ownership stays here: HomotopySpheres is line 72 of ORDER.txt, before
DGFloerPartII (73), GeometryOfNumbersAndQuadraticArithmetic (74) and GeneralAlgebraicKTheoryPartII
(333). Scope items 4, 5 and 7 already state this ownership.

- **None of the three cites this roadmap.** Each head mentions `HomotopySpheres` 0 times: #1742 at
  `3f10248`, #1799 at `4e506b6`, and #851 read through `roadmaps show`.
- **Each owns the objects itself.**
  - #1742 README:13 owns the James reduced product, the connected James equivalence and the
    stable splitting (§§4.30b–4.30c). Its current head has dropped EHP and assigns James–Hopf to
    BordismFormalGroups.
  - #1799 README:20–24 and :66–71 owns the convenient category and stable O/SO with real Bott
    periodicity (4.2a–4.2c). Its table (:90) takes James from GeneralAlgebraicKTheoryPartII §4.30b.
  - #851 README:24 owns Wall's nonsingular quadratic forms and formations, the
    characteristic-two Arf invariant and the simply connected L-groups of ℤ.
- **Human decision.** For one owner, those three heads must cite 3B, 4A.1–4B.8 and 7B–7C here.
  The project's dropped-names list still contains `HomotopySpheres`, and the gate refuses any
  mention of a listed name, so the gate refuses those citations in the operators' roadmaps
  (#1742, #1799 and #851 included). The consistent settlements are the two the review names:
  1. remove that entry, or narrow it to #284's folder, and the three heads cite this roadmap; or
  2. this roadmap moves after them in the merge order and cites them.

## H03 (CBirkbeck) — answered

The `dropped` failure no longer occurs, and no folder change was needed. Before any edit in this
round, the gate at `a4f5c1e` reported `dropped=0 … OK`. It reports `dropped=0` again at `55547a5` and at `0705b9a`.
The roadmap's own namespace `TauCetiRoadmap.HomotopySpheres` (`Suggested.lean`:61 and :229) now
passes, even though `HomotopySpheres` is still the first entry of the dropped-names list. So the
operator-side exemption the review asks for is in place.

## H04 (CBirkbeck) — applied differently

The README is not changed to say "§1.4 as revised by #1797". House style forbids pull-request
numbers in a README, and the gate's `prnum` check refuses them. The README already identifies the
cited content by what it says: README:96, :390–397 and :727–736 describe GeometricTopology §1.4 as
consuming `TauCeti.ConnectedSum` and proving native-sum associativity. Both citations are
confirmed to exist only in open revisions, and are listed below for the merge-order paragraph,
which is the worker's to write.

- **AlgebraicTopology Stage 4 item 8.** Main's Stage 4 ends at item 7 (`simplicialRealizationCW`,
  main README:817; Stage 5 starts at :849). Item 8 exists at #1663 (`8029fe9`, README:911) and, as
  "4.8", at #1652 (`4e825d6`, README:1301).
- **GeometricTopology §1.4.** Main's GeometricTopology has no §1.4 (its Layer 1 starts at :177 with
  no numbered subsections). #1797 (`11a9ca1`) §1.4 consumes `TauCeti.ConnectedSum` and
  `TauCeti.OrientedConnectedSum`, compares them with the gluing model, and proves associativity
  for connected oriented summands. #903's §1.4 is a different, gluing-model construction, and
  #903 conflicts with #1797 there.

## H05 (CBirkbeck) — applied

README:630 changes "pp.73–89" → "pp.73–84", and README:617 changes "pp.78–79" → "pp.79–80". The
same fault occurs once more, at README:584: "pp.92–96" → "pp.92–97", because the proof of Milnor's
Theorem 7.6 ends on printed p.97.

In `milnor_hcobordism` the printed page is the PDF page minus 5. For example, line 1804 prints 70
on PDF page 75, and Theorem 9.1 (line 2784) falls on PDF 112, which is p.107. On that basis:

- the proof of 6.6 starts at line 1897 (p.73), and Lemma 6.7's proof ends at line 2185 (p.84);
  §7 starts at line 2187 (p.85);
- Lemmas 6.10–6.12 are at lines 2049–2058 (p.79), and the proof of 6.10 ends at line 2077 (p.80);
- Theorem 7.6 is at line 2418 (p.92), and its proof ends at line 2564 (p.97).

Every other Milnor locator was rechecked and holds: 3.4 p.21, 3.13–3.15 pp.31–32, 4.8 p.44, 5.4
p.48, 6.6 and its remark pp.71–72, the proof of 6.4 pp.72–73, 7.8 p.97, 8.1 p.100, 9.1 and 9.2
pp.107–108, and the twisted-sphere step of the proof of Proposition B on p.110. The Kervaire–Milnor
locators also hold: page N of `kervairemilnor1963` is p.503+N, Lemmas 2.1–2.2 are on p.505, 2.3 on
p.506 and 2.4 on p.507.

## H06 (CBirkbeck) — applied

The old Check at README:678 said that W=D^(n+1) shows the hypothesis on M₁ is needed. It now says
that both inclusion hypotheses fail there: Sⁿ→D^(n+1) induces ℤ→0 on H_n, and ∅ misses
π₀(D^(n+1)). A new Check (README:679) states the actual role of the hypothesis on M₁. Given the
hypothesis on M₀ and simple connectivity of W, duality gives H_*(W,M₁;ℤ)=0 (Milnor, remark after
Theorem 9.1, p.107; `milnor_hcobordism` lines 2791–2794). So the hypothesis on M₁ holds exactly
when π₁(M₁)=0. It excludes a far end with the homology of M₀ and nontrivial π₁, which the
conclusion would make diffeomorphic to the simply connected M₀×{1}.

## H07 (CBirkbeck) — applied

- README:251: "is a example" → "is an example".
- README:3094–3099 (10.3): "`e.deriv` sends the chosen `Manifold.Orientation` …" is replaced by
  the condition that at every point the manifold derivative of `e` carries the chosen
  `TauCeti.Manifold.Orientation` of `M` to the standard orientation of `S⁶`
  (`TauCeti.Manifold.Orientation.IsOrientationPreservingAt`, `Orientation/Preserving.lean`:63 at
  `2fd255d`).
- The following sentence no longer speaks of an "equation with the opposite sign". It now says
  that, M being connected, a failing `e` reverses orientation at every point and is corrected by
  a reflection.
- No other `.deriv`, and no other bare `Manifold.Orientation`, occurs in the README.

## Build and gate

- Targeted build in this worktree at `0705b9a` (branch pins `a91d3aa`/`6b7abb3`):
  `lake build TauCetiRoadmap.HomotopySpheres.Suggested` gave `Build completed successfully (8987
  jobs)`, with exactly 16 `declaration uses 'sorry'` warnings and no other warning or error.
- At `55547a5` the same build failed with
  `bad import 'TauCeti.Geometry.Manifold.Orientation.OrientedAtlas'`, and the gate gave
  `imports=1`. That is the failure `0705b9a` repairs.
- Gate summary line in this worktree at `0705b9a`:

```text
gate HomotopySpheres: set_option=0 blob=0 latex=0 tex=0 prnum=0 sorry-data=0 sorry-examples=0 residue=0 private-paths=0 imports=0 mathlib-subimports=0 no-import-mathlib=0 lean-lines=0 statement-hygiene=0 forbidden=0 dropped=0 readme-ids-missing=0 empty-sections=0 round-labels=0 long-fences=0 layer-ids=0 target-ids=0 depcheck=0 metadata=0 stray-files=0 dirty=0 outside-folder=0 source-material=0 OK
```

  This build and gate pass at the branch's pins only. CI builds the merge into main at `2fd255d`,
  where `TauCeti.Geometry.Manifold.Orientation` does not exist, so CI's merge build still fails on
  line 3. When the branch takes main's manifest (merge or rebase), the same commit has to change
  line 3 to `import TauCeti.Geometry.Manifold.Orientation.OrientedAtlas`. At main's pins that
  version built with 16 `sorry` warnings and passed the gate with `imports=0`, as recorded under H01.
- Depcheck:

```text
depcheck: 244 roadmaps, 2465 edges, 0 problem(s)
```

  There is no UPWARD, CYCLE or `moved:` line.
- `roadmaps resolve` on the README: no cross-roadmap citation and no Lean name found nowhere.

**Signature check.** One scratch file held `Suggested.lean` with a `#check @name` line for each
of its 19 declarations, and it was elaborated once at main's pins with the `.OrientedAtlas`
import. The elaborated types match the README statements and the previous round's signatures.
`Suggested.lean` at `0705b9a` is byte-identical to `a4f5c1e`, and the targeted build at the
branch's pins elaborates all 19 declarations. The `#check` file was not re-run at the branch's
pins, because the brief lists no Lean command for it. The definitions it depends on have the same
fields and bodies at both pins (H01), so no statement changed.

- `exists_diffeomorph_prod_Icc_of_hCobordism` keeps `5 ≤ n`, `T2Space`, `CompactSpace`, the
  half-space charted space and `IsManifold`, `SimplyConnectedSpace`, `IsClosed` on `M₀`, both
  inclusion-fixed homotopy equivalences, and `f (x, 0) = x`.
- `sphere_parallelizable_iff` keeps `0 < n`.
- The Bott and stem theorems keep every range bound.
- Both recognition theorems keep T2, second countability, compactness and `IsManifold (𝓡 6) ∞`.
- `PreservesOrientedAtlases` takes only its own binders.

## Adversarial pass on the statements changed this round

| Statement | Instances tried | Values computed | Result | Change |
| --- | --- | --- | --- | --- |
| Line 3 import: meaning of `IsOrientedAtlas` and `orientationPreservingGroupoid` | both Tau Ceti pins | `IsOrientedAtlas` fields (`Orientation.lean`:332–339 at `a91d3aa` vs `OrientedAtlas.lean`:283–290 at `2fd255d`): `diff` empty. `orientationPreservingGroupoid` body (:178–185 vs :129–136): `diff` empty. `.OrientedAtlas` at `a91d3aa`: file absent, build fails; `.Orientation` at `a91d3aa`: build OK, 16 sorries | holds under either import | line 3 changed in `55547a5`, put back in `0705b9a` |
| `PreservesOrientedAtlases` under either import | the identity of S⁶ with A=B; a coordinate reflection r; A=∅ | identity: every transition has det +1, so it is in the groupoid. r: det −1, so it is not, and the predicate fails, as the 10.4 Check says. A=∅ violates `exists_mem_source` because M≃S⁶ is nonempty | holds | none |
| Check README:678, D^(n+1) instance | n=5 | H₅(S⁵)=ℤ→H₅(D⁶)=0, so the M₀ hypothesis fails; π₀(∅)=∅ vs π₀(D⁶)={*}, so the M₁ hypothesis fails | the old Check was false; the corrected one holds | reworded |
| New Check README:679: given the M₀ hypothesis, the M₁ hypothesis ⇔ π₁(M₁)=0 | W=S⁵×[0,1]; the duality step | H_q(W,M₀)=0 ⇒ H^(6−q)(W,M₁)=0 ⇒ H_q(W,M₁)=0 (W is orientable because simply connected). The LES gives H₀(M₁)→H₀(W) injective, so M₁ is connected. Homological Whitehead then gives ⇐; ⇒ is π₁(M₁)≅π₁(W)=0. For S⁵×[0,1], π₁(S⁵×{1})=0 and the hypothesis holds | holds | added |
| New Check: the conclusion would carry M₀×{1} onto M₁ | W≅M₀×[0,1] with f(x,0)=x | ∂(M₀×[0,1]) = M₀×{0} ⊔ M₀×{1}; f maps M₀×{0} onto M₀, so it maps M₀×{1} onto the complement M₁; π₁(M₀)≅π₁(W)=0 | holds | added |
| 1.6 locator: Theorem 6.6 proof | PDF−5 offset | line 1897 → p.73; line 2185 → p.84; line 2187 → p.85 | was pp.73–89 | pp.73–84 |
| 1.5 locator: Lemmas 6.10–6.12 | PDF−5 offset | lines 2049/2053/2058 → p.79; line 2077 → p.80 | was pp.78–79 | pp.79–80 |
| 1.2 locator: Theorem 7.6 and its basis change | PDF−5 offset | line 2418 → p.92; line 2483 (Lemma 7.7) → p.94; line 2564 (end of proof) → p.97 | was pp.92–96 | pp.92–97 |
| 10.3: pointwise preservation via `IsOrientationPreservingAt` | the identity of S⁶; a reflection; connected M | the identity preserves at every x. The reflection reverses, and `not_isOrientationPreservingAt_and_isOrientationReversingAt` (`Preserving.lean`:220) excludes both at once. A diffeomorphism is preserving or reversing at each point (:148), and that sign is locally constant, hence constant on connected M | holds | reworded |
| Removed consumers | the three heads | `HomotopySpheres` mentioned 0, 0 and 0 times | the old claims were false | removed |

## Ownership, overlaps and dependencies

- **Ownership.** This round adds no construction. Section H02 settles the double ownership of
  3B, 4A.1–4B.8 and 7B–7C: the earliest roadmap, this one, owns them, and the remaining step is
  the human decision about the dropped-names entry.
- **Only an open revision defines:**
  - AlgebraicTopology Stage 4 item 8: #1663 (or #1652, where it is numbered 4.8);
  - GeometricTopology §1.4: #1797.

  Both are operators' revisions. The merge-order paragraph should name them as merging before
  this pull request.
- **#284 (Paul-Lez).** It changes the same folder and conflicts with this pull request in both
  files. Only one can merge. If #284 is kept, it is rebased onto this folder.
- **Ids dropped.** None this round, and no other roadmap loses a cited id.

## Sources

No new source is cited. Three locators were corrected, all against `milnor_hcobordism`.
`needs-references.toml` was not written, and `sources.toml` was not touched.

## Untrusted text

The review contains claims, witnesses and suggested repairs, and no instruction outside them. Its
repair step 1 (rebase onto main) is a branch operation outside this job's edits, and it is left to
the worker as stated under H01. Nothing is quoted as suspicious.
