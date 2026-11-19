# Review of DGFloerPartII (pull request #1799 at e704369)

**Verdict:** accepted

**Summary.** Accepted: this is an incremental re-review of the 28 lines changed since `79b6376`, and all three points of the previous review are repaired without a new problem. The reduced cone, which HomotopySpheres 3A.2 owns on main, is gone from 1.0 and from "Owned here", and no statement used it; the `*Needs:*` line of 4.3 now lists 4.1; the Tau Ceti predicate is cited under one namespaced name. There are no findings, no small corrections and no format notes; five points remain for the human reviewers, as before.

## Previous findings

- R01 — repaired: 1.0 now reads "**The interval and based homotopies.** Write `I = [0, 1]`, `I₊` for `I` with a disjoint base point, and `S¹ = I/∂I` … A based homotopy is a based map `X ∧ I₊ → Y`"; "Owned here" no longer lists cones.
- C01 — repaired: "*Needs:* 1.4, 4.1, DGFloer Layer 1 items 1–2 and 6, Layer 2, Layer 5 item 5, Layer 11, GeometricTopology Layer 3, AlgebraicTopology Stage 8.1–8.7".
- N01 — repaired: `TauCeti.IsAspherical` in the `*Needs:*` line of 4.3 and in Layer 4's Dependencies, as in 4.5 and the Tau Ceti contract; 4.2 likewise now writes `TauCeti.HomologicalOrientation` and `TauCeti.HomologicalOrientation.mapFundamentalClass`.

## Verified sound

| # | Statement | Instances tried | Values computed on each side | Result | Change |
| --- | --- | --- | --- | --- | --- |
| 1 | 1.0 after the cone is dropped | every occurrence of "cone", `CX`, "cylinder" in the README; uses of `I₊`, `S¹ = I/∂I` | "cone" and `CX`: 0 occurrences; "cylinders": 1, the disc cylinders of a DGFloer predicate; `S¹ = I/∂I` still defines `ΩY = Map_*(S¹, Y)` | nothing consumed the cone; no second owner with HomotopySpheres 3A.2 remains | none |
| 2 | 4.3 `*Needs:*` with 4.1 (Propositions 6.29, 6.33) | 4.1's own `*Needs:*`; `ℓ = 1`; odd `Sⁿ` with `ℓ = 2` | 4.1 needs only DGFloer Layers 2, 5, 10 and AlgebraicTopology Stage 6, so 4.1 → 4.3 has no cycle; `ℓ = 1` gives Definition 6.26; `2x ≠ 0` in `π_n(Sⁿ) = ℤ`; class degree `n + (n−2) = 2n−2 > n` for `n ≥ 3` | agrees with `bdho-cotangent` lines 4517–4523, 4919–4937, 5051–5062 | none |
| 3 | 4.2's cited names `TauCeti.HomologicalOrientation`, `…mapFundamentalClass`; `TauCeti.IsAspherical` | the pinned Tau Ceti | `structure HomologicalOrientation` in `namespace TauCeti` (`AlgebraicTopology/Singular/LocalHomology/Orientation/Homological.lean` 65, 75); `mapFundamentalClass` in `TauCeti.HomologicalOrientation` (`…/LocalHomology/FundamentalClass.lean` 79, 91, 275); `IsAspherical` in `TauCeti` (`AlgebraicTopology/EilenbergMacLane/Basic.lean` 49, 59) | the three full names exist as written | none |

The rows for the untouched statements stand as in the previous review, of `79b6376`.

- Source locators checked against the text, 5 (changed passages and the sampled section 4.3): `bdho-cotangent` Definitions 6.11, 6.26, 6.32 and Propositions 6.29, 6.33 (lines 4517–4523, 4919–4937, 5051–5062); the README flags no locator as unverified. The other sampled sections are untouched and stand as in the previous review.
- Library declarations opened at the pins, 3 (row 3).
- Cross-roadmap citations resolved, 2: HomotopySpheres 3A.2 on main still owns the reduced cone (its README lines 168, 970); AlgebraicTopology Stage 4 item 8 is cited unchanged by 1.0.
- Dependency check: `depcheck: 199 roadmaps, 2188 edges, 0 problem(s)`; no UPWARD or CYCLE line. Nothing changes outside the folder.
- Elaboration of `TauCetiRoadmap/DGFloerPartII/Suggested.lean`: exit 0, the only warnings "declaration uses `sorry`" (11 theorems; the one instance has a real body). The file is unchanged since `79b6376`: no `set_option`, no sorry'd data, one `import Mathlib` followed by Tau Ceti modules.
- Headline theorems and padding: unchanged since the previous review (Theorems B and G and the capacity forms of Theorem I stated; Theorem H, products and Proposition 6.36 named in the docstring as not statable).
- Title and description against the head: the bullet for 1.0 no longer names reduced cones and agrees with the head ("the product criterion …, the exponential law …, the closed symmetric monoidal smash product, the agreement with Mathlib's compactly coherent coreflection …, and the comparison with raw mapping spaces"); the summary, the layer bullets, the `Suggested.lean` list and the merge-order paragraph agree with the head; the change adds no section, drops no declaration and adds no supplier.
- The worker's automatic checks all passed on this head.

Overlap check: read DGFloer, AlgebraicTopology (Stage 4 item 8) and HomotopySpheres (3A.2) on main for the changed passages. Compact generation and the pointed adjunction: owner AlgebraicTopology Stage 4 item 8, consumed in 1.0–1.2. The reduced cone: owner HomotopySpheres 3A.2; this roadmap no longer states it. Theorem B and the Layer 11 applications: DGFloer on main today, this roadmap once the open DGFloer revision merges, as the description states. Nothing else shared.

Source independence: changed passages only; 3 passages compared with 1 source (`bdho-cotangent`), none copied (the rewritten bullet of 1.0 is notation with no source counterpart; the `*Needs:*` lines are lists of names); largest share `bdho-cotangent`, about 220 of 250 locators; the diff adds, removes and reorders no layer, so the comparison of contents stands as in the previous review: independent.

Research link: The headline targets are Theorems B, G, H and I of Barraud, Damian, Humilière and Oancea (2024) on contractible almost existence and the `π₁`-sensitive Hofer–Zehnder capacity in cotangent bundles, which that paper compares with Albers–Frauenfelder–Oancea (2017) and Frauenfelder–Pajitnov (2017); README summary and `bdho-cotangent` §1 and lines 446–448, 5039–5041.

## Not verifiable

- Ziller, *The free loop space of globally symmetric spaces*, Theorems 3 and 8 (2.1–2.3, 2.6): recorded as uncertified; untouched by this change.
- Munkres, *Topology*, §22, Example 7 (1.0), and Bott (1959), the BDHO monograph, Milnor–Stasheff, Steenrod, Pontryagin: not in the cache; untouched by this change.

Automatic checks set aside as false positives: none failed.

## Source issues

- **Misprint** in bdho-cotangent at second proof of Proposition 6.34, printed page 118 (line 5139): the source says the proof concludes by Proposition 6.29; it should be Proposition 6.33, the sphere being 2-covered and not covered; affects nothing.
- **Error** in bdho-cotangent at proof of Proposition 6.38, printed page 120 (line 5236): the source says the class is twice the generator for complex projective spaces; it should be a generator, as its own Remark 6.19 gives on each complex line; affects the proof.
- **Gap** in bdho-cotangent at Lemma 7.7, printed page 126 (line 5503), used on page 127 (line 5536): the source says the lemma holds for an integer at least 2; it should be at least 1, since it is applied with the value 1 when k is 2 or 3; affects the proof.
- **Error** in bdho-cotangent at §7 before Theorem 7.1, printed page 123 (lines 5362–5364): the source says the connectivity of Y forces n ≥ 3k − 1 or n ≥ 2k; it should except n = k, where Y is a point; affects nothing.

## For the human reviewers

- **Ownership.** DGFloer on main still owns Theorem B and its Layer 11 (`TauCetiRoadmap/DGFloer/README.md` lines 1564–1650); this folder states them again and has a single owner only if the open DGFloer revision merges first or together, as the description says.
- **Scope.** The main source is cited as an arXiv preprint (arXiv:2404.07953v3) with no journal reference in the README; the companion monograph is published (Progress in Mathematics 360).
- **Arrangement.** Layer 4's sections 4.1–4.6 run in the order of the source's §6.3–§6.4.5 and §7; the `*Needs:*` lines force most of that order and the scopes differ, as the previous review's `Source independence:` line records.
- **James construction.** HomotopySpheres 3B on main and GeneralAlgebraicKTheoryPartII §4.30b (open) both state the James construction; 1.2 consumes the latter, and HomotopySpheres is on the list of roadmaps not to be cited as suppliers.
- **Not tested.** Ziller (1977), cited for the indices and the perfectness of 2.1–2.3, was not read; the index values were recomputed in the previous review.
