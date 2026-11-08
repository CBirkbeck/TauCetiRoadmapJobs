# GATE-DGFloer~2: answers to human review of the DGFloer pull request

Commit `a3913c8f` on top of `fc27fe2`: "DGFloer: review repairs (Serre, Hurewicz fibrations and
filtered spectral sequence consumed from pinned Tau Ceti)". Not pushed.

## H01 (roed-math) — applied differently

Neither proposed owner is right. The Serre-fibration predicate is already in the pinned Tau
Ceti (main's pin `2fd255d`): `TauCeti.TopCat.serreFibrations` in
`TauCeti/Topology/Homotopy/SerreFibration/Basic.lean`. That file also has the disc and cube
characterizations (`mem_serreFibrations_iff`, `mem_serreFibrations_iff_cube`), the
composition, base-change, retract and product instances, covering maps and projections.
`SerreFibration/FiberBundle.lean` has locally trivial maps with no paracompactness (Hatcher
Prop. 4.48, `hatcher-at` line 16461), and `SerreFibration/RelativeCube.lean` has relative cube
lifting. AlgebraicTopology Stage 5.5 on main already consumes it (main README lines 910–914), and
so does the other open DGFloer revision, #963.

What changed:
- **Owned here** (README l. 59–63). Old: "the Serre-fibration predicate with its fibration
  homotopy exact sequence". New: "lifting for arbitrary relative CW pairs and the fibration
  homotopy exact sequence of a Serre fibration".
- **New "Already in the library" paragraph** (l. 89).
- **New Tau Ceti supplier bullet** (l. 340), naming each declaration and file and saying what
  the predicate does not include: total space and base share one `TopCat.{u}`, and there is no
  surjectivity.
- **Layer 1 item 2** (l. 643 on). It now consumes the predicate instead of defining it and
  re-proving its stability. The relative lift that builds the boundary map is the pinned
  `TauCeti.TopCat.exists_lift_openBox_of_mem_serreFibrations`.
- **Checks.** The Checks that tested the predicate are replaced by four Checks on the exact
  sequence this item owns (l. 682).

So #1652's Layer 5.0 (it says the predicate is "absent from the pinned libraries") and #1663's
assignment to DGFloer are both stale at the current pin.

**Same defect elsewhere: the "Not at the pins" sentence.** The old supplier-contract sentence
"Not at the pins, and therefore targets here or of the named supplier: …" (old l. 327–329) was
false at `2fd255d` for all four items it listed. Repairs:
- **Serre-fibration predicate.** Handled as above.
- **Hurewicz fibrations.** `TauCeti.IsHurewiczFibration`, `TauCeti.LiftingFunction`,
  `TauCeti.MappingPathSpace`, `TauCeti.MappingPathFiber`, NDR relative lifting, transport and
  `loopMap` are now cited from Tau Ceti (supplier bullet l. 360). They replace every
  GeneralizedCohomology G2.10 citation:
  - the scope table row;
  - conventions l. 191;
  - the GeneralizedCohomology supplier bullet, deleted because nothing else of it was consumed;
  - Layer 1 item 2's NDR sentence and Layer 1 item 4's path carriers (l. 924);
  - Layer 2 items 2–3 and their dependencies.

  The Moore-path transitive lifting function stays Layer 2 item 2's, since Tau Ceti's carriers
  are fixed-interval.
- **Filtered-complex spectral sequence.** Layer 1 item 3 (l. 798) now consumes
  `CochainComplex.filtrationFunctor` and `CochainComplex.spectralSequence` with their
  first-page, convergence (finite and exhaustive), naturality and comparison API. It owns only
  the homological regrading, the degreewise lower-bound vanishing of the abutment filtration and
  Weibel 5.5.10's complete convergence. The Mathlib bullet no longer says "no convergence
  theorem exists at the pin" without naming Tau Ceti.
- **Sard–Smale.** It is `TauCeti.isMeagre_image_criticalPoints_of_isFredholm`. HeegaardFloer F0
  owns the sharp bound and the adapters, as main's HeegaardFloer README l. 125–132 says. The
  supplier line and the scope-table row now say this.

**Suggested.lean docstring.** The line giving the Serre-fibration predicate as the missing
carrier for the Serre spectral sequences is replaced. The missing carrier is the fibre-homology
local system of a Serre fibration. The pinned `TauCeti.fiberLocalSystem` takes a lifting
function of a Hurewicz fibration, and no Serre version is at the pins. README Layer 1 item 2
says the same. No declaration changed.

## H02 (roed-math) — disputed

No dependency is declared and the citations keep main's "Stage N.M" numbering. #1652 and #1663
are revisions of a roadmap on main, and a revision is never a dependency: a roadmap cites
another as it is on main. Main's AlgebraicTopology still uses Stages, and every Stage this README
cites resolves there to the content claimed:
- 4.4: the based sphere identifications (main l. 541–547);
- 4.5: `cwProductKelley` and `cwSubcomplexNeighborhoods` (l. 750–771);
- 5.5: the Serre consumption (l. 910);
- 6.5: the degree (l. 1560);
- 8.3, 8.5, 8.8: the Hurewicz map, Whitehead and classifying spaces (l. 1684, 1700, 1819).

If #1652 lands as written, the update is one word per citation and no number changes. Its head
uses the same numbers for every cited id (4.4, 4.5, 5.1–5.5, 6.0–6.5, 8.1–8.8, with 8.8a still
named), so "AlgebraicTopology Stage N.M" becomes "AlgebraicTopology Layer N.M".

## Build

`lake build TauCetiRoadmap.DGFloer.Suggested`: "Build completed successfully (8970 jobs)". The
only warnings are the five `declaration uses 'sorry'`.

The worktree still builds against the branch's own Tau Ceti pin `358314d`. No Lean declaration
or import changed.

## Gate

`gate DGFloer: set_option=0 blob=0 latex=0 tex=0 prnum=0 sorry-data=0 sorry-examples=0
residue=0 private-paths=0 imports=0 mathlib-subimports=0 no-import-mathlib=0 lean-lines=0
statement-hygiene=0 forbidden=0 dropped=0 readme-ids-missing=0 empty-sections=0 round-labels=0
long-fences=0 layer-ids=0 target-ids=0 depcheck=0 metadata=0 stray-files=0 dirty=0
outside-folder=0 source-material=0 OK`

Direction check: `depcheck: 239 roadmaps, 2350 edges, 0 problem(s)`, with no UPWARD, CYCLE or
`moved:` line. `roadmaps resolve` on the README: no cross-roadmap citation and no Lean name
found nowhere.

Every library name this repair adds (41 of them) was grepped at `2fd255d`, with namespaces read
from the files. All are present. The resolver itself did not check names outside
TauCetiRoadmap ("no pinned Lake packages on this host").

## Elaborated signatures

The scratch signature file could not be used (its elaboration failed on a missing Tau Ceti
`.olean` in the main-pin build directory). Instead, `#check @…` for all nine declarations was
appended to `Suggested.lean`, the permitted build was run once, and the file was restored (the
commit contains no `#check`).

Every elaborated type carries the binders its README statement needs:
- `[SimplyConnectedSpace ↑Y]` on the mod-2 theorem;
- `[SMulCommClass R Aᵐᵒᵖ M]` on `twistedDifferential`;
- `IsScalarTower`, `SMulCommClass`, `GradedSMul` and `Decomposition` on both twisted-complex
  theorems;
- `[PathConnectedSpace Q]` on Lemma 3.41;
- `[LieGroup I₀ ↑⊤ G] [CompactSpace G] [ConnectedSpace G]` on the torus criterion.

Nothing changed.

## Adversarial pass on the statements this repair adds or changes

| Statement | Instances tried | Values computed | Result | Change |
| --- | --- | --- | --- | --- |
| `serreFibrations` includes no surjectivity (supplier bullet) | `∅ → B`, `B ≠ ∅` | A lifting problem needs a map `Dⁿ → ∅`. `Dⁿ ≠ ∅` for all `n ≥ 0` (`D⁰` is a point), so there is no problem to solve and `∅ → B` is in the class | holds | stated |
| `serreFibrations` lives in one `TopCat.{u}` | `E : Type u`, `B : Type v`, `u ≠ v` | The predicate is `MorphismProperty TopCat.{u}`, so it does not apply. `IsHurewiczFibration.mem_serreFibrations` needs `E B : TopCat.{u}` | constraint | stated in "what Layer 1 item 2 assumes" |
| Relative cube lift, `N` may be empty | `N = ∅` | `I × I^∅ = I`. The boundary of `I^∅` is empty, so the prescribed set is the bottom point: this is path lifting | holds | stated |
| Check: product `B × F → B` has `∂ = 0` | `B = F = S¹`, `n = 1, 2` | The lift is `(α, f)` with `f = e₀` on the bottom and sides, so the top face is null rel `∂`. Splitting: `0 → ℤ → ℤ² → ℤ → 0`. Lift on the bottom only: the top face's boundary leaves `e₀`, so no based class | holds; bad model excluded | new Check |
| Check: double cover `z ↦ z²` | generator `1 ∈ π₁(S¹)` | The lift of `e^{2πit}` from `1` is `e^{πit}`, ending at `−1`. `ker ∂ = 2ℤ = im(×2)`. `π₀(F) = {±1}` | holds | Check kept, value added |
| Check: Hopf | `n = 2, 3` | `π₂(S³) = π₁(S³) = 0`, so `∂ : π₂(S²) → ℤ` is an isomorphism and `π₃(S²) ≅ π₃(S³) = ℤ` | holds | new Check |
| Negative control `{1} → S¹` | the loop `e^{2πit}` | The only lift is constant, so no lift exists. At `π₁(S¹)` the preimage of `pt` is `ℤ` but the image is `0` | the sequence fails, so the hypothesis is needed | new Check |
| Pair homeomorphism `(Dⁿ, Sⁿ⁻¹) ≅ (Iⁿ, ∂Iⁿ)` (All-CW) | `n = 0, 1` | `n = 0`: `(pt, ∅) ≅ (pt, ∅)`. `n = 1`: `[−1,1] → [0,1]`, `s ↦ (s+1)/2`, sends `{±1}` to `{0,1}` | holds | stated as a target here |
| Layer 1.3 homological regrading `(a, b) = (1 − 2p − q, p − 1)` | two-step filtration, `p = 1`, any `q` | Source `(a, b) = (−1−q, 0)`, graded piece `F₁/F₀`, degree `−(1+q)`. Target `(p−1, q)` gives `(1−q, −1)`, which is the Tau Ceti differential `(a+2, b−1)`. Page `r+1`: `(a+r+1, b−r)` equals the homological `(p−r, q+r−1)` | consistent with Tau Ceti's indexing | kept, now on Tau Ceti's construction |
| Layer 1.3 decreasing regrading `(2p + q + 1, −p − 1)` | `E₁^{p,q}` | `G_{b+1}/G_b = F^{−b−1}/F^{−b} = F^p/F^{p+1}` at `b = −p−1`, and `a + b = p + q` | holds | kept |
| The abutment filtration vanishes at `s(n)` from the degreewise bound | `F_{s(n)} C_n = 0` | `Z_n(F_{s(n)}C) = 0`, so `H_n(F_{s(n)}C) = 0` and the image is 0. Junk filtration `F_p = C` for all `p`: no `s(n)`, the filtration is constant `H_n`, and every `E^r = 0` | holds; existing Check excludes the bad model | new clause |
| Lifting function iff Hurewicz | `E : Type u`, `B : Type v` | The pinned statement is `IsHurewiczFibration.{max u v} p ↔ Nonempty (LiftingFunction p)` | holds at `max u v` only | universe written into Layer 2.2 |
| `IsHurewiczFibration.loopMap` is fixed-interval only | Moore loop of length 0 | Tau Ceti says the Moore version is not proved: a length-0 Moore loop needs a lift constant over constant paths | the Moore case is not at the pin | stated, not claimed |
| Sard–Smale at the pin | global form | `isMeagre_image_criticalPoints_of_isFredholm` needs a Lindelöf subset; the local form needs no separability | holds as stated ("for Fredholm maps on Banach spaces") | sentence corrected |
| `TauCeti.fiberLocalSystem` does not apply to Serre fibrations (Lean docstring, Layer 1.2) | its signature | Its section variable is `Λ : LiftingFunction p`. `serreFibrations` occurs nowhere under `TauCeti/AlgebraicTopology/` | holds | docstring and README agree |

## Ownership and overlaps

- **Serre-fibration predicate:** Tau Ceti owns it (above). #1652 Layer 5.0 plans it again, and
  #1663 l. 118 assigns it to DGFloer. Both should consume `TauCeti.TopCat.serreFibrations`, as
  main's Stage 5.5 already does.
- **#963 (DGFloer, @t4v1).** It conflicts with this pull request in both files (overlaps
  report). The two now agree on the native Serre predicate. One must be rebased on the other
  before either merges. This pull request moves the applications to DGFloerPartII, so #963's
  Layer 1 rewrite should be rebased onto it, not the reverse.
- **Main changed DGFloer after this branch's base:** #1849 (`eaf17b1`, consuming
  PseudoholomorphicCurveAnalysis PH1–PH7), and the pin bump #1800 (`2fd255d`). This branch is
  still at `358314d` and lacks both, so it needs a rebase onto main before merge.
- **Lead checked, no edit: DifferentialGeometry Layer 10** (README l. 421, 3121, 3141). #886
  revises DifferentialGeometry and drops Layers 6–11. Its prose sends the mapping degree to
  DeRhamCohomologyAndDuality, but that roadmap's head (#1768) numbers no layer for the degree
  and itself still cites "DifferentialGeometry 10". So there is no new id to cite yet, and #886,
  as a revision, is not a dependency. The citation stays on main's Layer 10. DGFloer uses the
  degree only through AlgebraicTopology 6.5.

## Not repaired here: the rest of the pin drift

Main's pin `2fd255d` also has these Tau Ceti modules, which overlap layers this README still
owns:
- **Layer 0 items 1–3:** normalized cubical singular chains in Massey's convention, relative
  chains, augmentation, cross product, the cubical–simplicial comparison and the cubical
  Künneth theorem (`TauCeti/AlgebraicTopology/Singular/Cubical/`).
- **Layer 2 item 1 and Layer 3:** the Pontryagin DG algebra of a topological monoid; DG right
  modules of chains on a space with a right monoid action, and bimodules over Moore paths
  (`TauCeti.MoorePathBetween`); twisting by a path-constant character; `H₀` of the Moore loop
  algebra as the group algebra (`.../Cubical/MonoidAlgebra/`).
- **Fibration lemmas:** the fibre-homology local system of a Hurewicz fibration, fibre homotopy
  equivalences, and the homotopy fibre of the fibre inclusion.

These were not edited. They are outside both review points, the branch does not yet build
against that pin, and a partial migration of Layers 0, 2.1 and 3 would leave the layers out of
step with each other. The rebase onto main must re-audit Layers 0–4 against `2fd255d` by object.
The README's existing claim that applying `Ω`/`Ω²` to a Hurewicz fibration gives a Hurewicz
fibration (Layer 2 item 2) should be scoped then: the pin proves it for fixed-interval loops,
and for Moore loops it needs regular lifts.

## Sources

- **New sources:** none fetched.
- **Locators used:** `hatcher-at` line 16327 (Theorem 4.41) and line 16461 (Proposition 4.48).
- **`needs-references.toml`:** not written; no text was missing.

## Suspicious text

None. The review text contained no instruction outside the roadmap mathematics.
