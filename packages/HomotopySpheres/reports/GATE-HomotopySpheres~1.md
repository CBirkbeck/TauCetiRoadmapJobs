# GATE-HomotopySpheres~1: answers to the review of head 0b90c9b

The repairs are in two commits, neither pushed: `60f8ea2c` (the review points) and `62a0c689` (the
worker's gate findings). Files changed: `TauCetiRoadmap/HomotopySpheres/Suggested.lean` and
`TauCetiRoadmap/HomotopySpheres/README.md`.

The gate findings were sorry-data=84, imports=1 and two linter warnings. To fix them, commit
`62a0c689` rewrites `Suggested.lean` into acceptance-test form (see "Repair of the gate findings"
below). That removes the Lean carriers into which `60f8ea2c` had written the H01–H06 repairs. Each
repair is therefore now carried by its README statement, and each section below cites the README
line at `62a0c689`.

## H01 (CBirkbeck) — applied

The tube's normal derivative was unconstrained, so the tube `y ↦ −y` with the identity coordinate was admitted. README Stage 5 item 4 (`TauCetiRoadmap/HomotopySpheres/README.md` line 811) and the Conventions bullet (line 239) now require that the derivative along each normal fibre at the zero section induces the identity on the normal quotient `T_ambient / d e(TM)`. The Stage 5 negative-control Check (line 837) records that `y ↦ −y` is excluded, since its derivative induces `−1`.

## H02 (CBirkbeck) — applied

The old requirement admitted an arbitrary base-preserving homeomorphism as the normal coordinate. It is replaced by radial compression `v ↦ (base v, a(v)·v)`, with `a` continuous and positive (README Stage 5 item 4, line 811; Conventions line 241). The counterexample `v ↦ −v` on the positively framed point (`n = 0`, `k = 1`, identity tube) satisfied every old requirement and gives a collapse of degree −1. It would need `a ≡ −1`, so it is now excluded, and it appears as the negative-control Check at line 834.

## H03 (CBirkbeck) — applied

The Thom identification `Th(ν) ≅ Σ^k M_+` is no longer an independently chosen pointed isomorphism. README Stage 5 item 3 (line 801) constructs it from the normal trivialization `φ`: the class of `v` goes to the class of `φ(v) = (base v, framing coordinate of v)` in the compactification of `M × ℝ^k`, and infinity goes to the basepoint. The text says why an independent choice fails: composing it with a fibre reflection reverses the sign. The augmentation is pinned as `(x, v) ↦ v` in compactification coordinates, with infinity going to the basepoint (line 822).

## H04 (CBirkbeck) — applied

README Stage 5 item 4 (line 823) defines the framed collapse as the composite of the tubular collapse, the framed Thom equivalence and the augmentation. It requires that this composite be independent of the tube and the compression, up to homotopy relative to the basepoint. The positive-point regression is the first Stage 5 Check (line 828): the identity tube gives the identity of `OnePoint ℝ`, of degree +1, and every other allowed tube gives a homotopic map. Two further Checks cover the tube and the framing reflection, each of degree −1 (lines 834 and 838).

## H05 (CBirkbeck) — applied

The product condition near a defect, and near a tube's lateral face, now returns a width `0 < ε < 1` and asserts equality only at collar time `s < ε`. This is the Conventions bullet "Product near a boundary carries a proper width" (README line 223), and defect deletion cites the returned proper subcollar (line 1039). The whole-collar condition failed on the hemispherical defect of `S⁶` with radial collar `c(s, b) = (1 − s)b`. The collar normals `−b` and `+b` meet at the disc centre and would both be sent to the same frame vector, which contradicts linearity there.

## H06 (CBirkbeck) — applied

The defect tube's lateral face is now matched at its ends with `c_X(ε_X s, b)` and `c_Y(ε_Y s, b)`, with `0 < ε_X, ε_Y < 1` strictly below the two product widths (README Stage 6A item 1, line 889). Previously it was matched with `c(s, b)` for `s < 1`. That old form blocked reflexivity: with the radial collar, continuity forced the slice `s = 1` to the disc centre for every `b`, so the lateral collar was not injective. Reflexivity is now derived from the standard tube `(s, t, b) ↦ (t, c_X(εs, b))` (line 893).

## H07 (CBirkbeck) — applied differently

The interface repairs from the later HomotopySpheres proposal head `fb7c47e` were checked one by one, and each is carried over as a README requirement: tube, Thom equivalence, augmentation, tube independence, the positive-point regression, defect and tube widths, rescaled endpoints and the cylinder. The proposal's Lean regression declarations and its `restrict` helpers are not carried over. `Suggested.lean` states only headline theorems, and these are either one-step consequences of definitions or regressions, which stay in the README as Checks (the positive-point, radial-collar and `D⁷` Checks of Stages 5 and 6B).

## Repair of the gate findings

- **sorry-data=84 → 0.** All definitions with `sorry` bodies are deleted, together with everything that mentioned them. This covers the convenient-space coreflector, the stable stem and `SO` diagrams, the Thom carriers, the framed, almost-framed and filling quotients, `Theta`, and the Kervaire–Milnor maps. The file now states five headline theorems:
  - `orthogonalGroup_bottPeriodicity`
  - `sphere_homotopyGroup_sixthStem`
  - `sphere_parallelizable_iff`
  - `smoothPoincareSix_oriented`
  - `smoothPoincareSix`

  It also keeps three simple definitions with real bodies that those statements need: `Sphere`, `OrthogonalGroup` and `PreservesOrientedAtlases`. The module docstring names the headlines that are not statable at the pins and the carrier each lacks:
  - the h-cobordism theorem: no smooth cobordism carrier;
  - `Theta_n` and `Theta_6 = 0`: no connected sum and no h-cobordism relation;
  - the stable stems as colimits, stable `J` and Pontryagin–Thom: no suspension homomorphism and no framed bordism;
  - `A_n`, `P_n`, `L_n` and the Kervaire–Milnor sequence.
- **imports=1 → 0.** `import TauCetiRoadmap.AlgebraicTopology.Suggested` and its `#check` gate are removed, and the imports are now `import Mathlib` and `TauCeti.Geometry.Manifold.Orientation`. The README paragraph that described `Suggested.lean` as naming this gate is removed (old line 310).
- **Two linter warnings → 0.** The declarations that produced them (`emptyChartCode`, old line 520, and `FramedNormalLine`, old line 959) are among those deleted. The build now prints only `declaration uses 'sorry'`.
- **README consequences.**
  - The paragraph on the two supplier mirrors under `Internal` (old lines 121–140) is replaced by a description of the headline statements and their carriers. Its supplier-consumption content is kept (lines 121–137).
  - The acceptance-check bullet that claimed `Suggested.lean` exposes the quotients (line 1444) now says that they are constructed.
  - Eleven backticked names of deleted declarations were in README prose: `SmoothAtlasCode`, `SmoothTubularNeighborhood`, `framedThomEquiv` (twice), `framedCollapse`, `FramedCycle`, `AlmostFramedBordism`, `StableFramedFillingCycle` (twice), `CollarNormalizedParallelizableFillingCycle` and `homotopySphereClassOf`. They became plain prose, and `HomotopySphereClass` was dropped from the rewritten acceptance-check bullet.
  - Each headline name is cited at its claim: Stage 4B item 7, Section 3C item 5, Stage 9 item 3 and Stage 10 item 4.

## Elaborated-signature check

I appended `#check @name` for all six new declarations to the module, elaborated it once with `lake build`, and then removed those lines; the committed file has no `#check`. Every binder is in each declaration's own signature (`T2Space`, `SecondCountableTopology`, `CompactSpace`, `IsManifold (𝓡 6) ∞`, the two `IsOrientedAtlas` hypotheses, `0 < n`, `8 ≤ n`, `k + 11 ≤ n`). Each elaborated type matches its README sentence. No change was needed.

## Adversarial pass (new statements)

| Statement | Instances tried | Values computed | Result | Change |
|---|---|---|---|---|
| `orthogonalGroup_bottPeriodicity` | k = 0, 1, 2, 6; stable range | π₉(O) = ℤ/2 = π₁; π₁₀ = 0 = π₂; π₁₁ = ℤ = π₃; π₁₅ = ℤ = π₇. `O(n) → O(n+1)` is bijective on `π_i` for `n ≥ i + 2`, so `i = k+9` needs `n ≥ k+11` | true | `k+1` used instead of `k`, since `π₀` is not a group at the pins |
| `sphere_homotopyGroup_sixthStem` | n = 8 (stable edge), n = 2, 3, 4 (outside the hypothesis) | π₁₄(S⁸) = ℤ/2; outside: π₈(S²) = ℤ/2, π₉(S³) = ℤ/3, π₁₀(S⁴) = ℤ/24 × ℤ/3 | true for n ≥ 8; n ≤ 4 shows a bound is needed | base point universally quantified (`S^n` is path-connected for n ≥ 1) |
| `sphere_parallelizable_iff` | n = 0, 1, 2, 3, 7 | n = 0: the empty family is independent, so the left side holds, but `0 ∉ {1,3,7}`; n = 1: rotation field; n = 2: hairy ball, left side false; n = 3: quaternion frame; n = 7: octonion frame | the `n = 0` case is false without the hypothesis | `0 < n` hypothesis |
| `sphere_parallelizable_iff` (frame form) | `n` independent vectors in an `n`-dimensional fibre | they form a basis, so the frame trivialises `TS^n` | equivalent to triviality | none |
| `smoothPoincareSix` | M = S⁶; M = S³ × S³ | S⁶: identity; S³ × S³: H₃ = ℤ², not homotopy equivalent to S⁶, so the hypothesis fails | true (Kervaire–Milnor Θ₆ = 0 with Smale) | none |
| `smoothPoincareSix_oriented` | M = S⁶ with A = B; A = the reflected atlas of B | identity preserves; for the reflected atlas compose with a reflection, whose determinant is −1 against both, so the transition is positive | true, since M is connected and orientation is globally ± | none |
| `PreservesOrientedAtlases` | f = id, A = B; A = reflection of B | transitions lie in the oriented atlas, so true; transitions have det −1, so false | determines orientation preservation | none |

## Ownership and citations

The headline theorems belong to this roadmap: Stages 4B, 9, 3C and 10 already owned them. `roadmaps grep` was not run again for the five new names. The previous round's ownership check covers these objects, and this round adds no new cross-roadmap citation. No declaration has the name of a declaration in another roadmap. These Tau Ceti declarations were checked at the pin in `TauCeti/Geometry/Manifold/Orientation.lean`: `TauCeti.IsOrientedAtlas` (line 332) and `TauCeti.orientationPreservingGroupoid` (line 178). No source was fetched, and the roadmap has no `sources.toml`.

## Build

`lake build TauCetiRoadmap.HomotopySpheres.Suggested`: `Build completed successfully (8979 jobs).` The only warnings are five instances of `declaration uses 'sorry'`.

## Gate

`gate HomotopySpheres: set_option=0 blob=0 latex=0 tex=0 prnum=0 sorry-data=0 sorry-examples=0 residue=0 private-paths=0 imports=0 mathlib-subimports=0 no-import-mathlib=0 lean-lines=0 forbidden=0 dropped=0 readme-ids-missing=0 empty-sections=0 round-labels=0 long-fences=0 layer-ids=0 target-ids=0 depcheck=1 metadata=0 dirty=0 outside-folder=0 source-material=0 FAIL`

The only remaining failure is `depcheck: NOT IN ORDER: HomotopySpheres (insert it after its last supplier)`. HomotopySpheres is at the design stage and not yet in the merge order, which is expected.

## Depcheck

```
depcheck: 148 roadmaps, 999 edges, 0 problem(s)
```

There is no UPWARD or CYCLE line.
