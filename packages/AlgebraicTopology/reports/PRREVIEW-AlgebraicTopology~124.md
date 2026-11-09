# Review of AlgebraicTopology (pull request #1797 at 85b5c37)

**Verdict:** needs changes

This is an incremental re-review of the 39 lines changed since 8709785: 33 in `README.md` and 6 in `Suggested.lean`. It covers the changed passages, everything that cites them, and the four findings of the previous review.

## R01 (P2) — GeometricTopology 11.3 still owns the finite CW type of compact smooth manifolds and hands it to this roadmap

This is the previous R02, only partly repaired. This roadmap's side is now right; the GeometricTopology side, in the same pull request, is unchanged.

**Location.**
- `TauCetiRoadmap/GeometricTopology/README.md` lines 10661–10664: "and that a compact smooth manifold has finite CW type, `TauCeti.FiniteCWType`, by `TauCeti.IsTriangulable.finiteCWType` (Layer 11.1). This is the item that AlgebraicTopology (compact smooth manifolds have finite CW type) and AffineMorseLefschetz consume."
- The same claim at lines 10882–10884 ("through the smooth triangulations of Layer 11.3, that compact smooth manifolds have finite CW type").
- The Needs entries that serve it, at lines 10752–10755.

**Claim.** The two READMEs contradict each other, so the theorem has two owners and each hands it to the other:
- This README (lines 76–80 and 721–722) says Stage 8.7 owns the theorem and takes only the triangulation from GeometricTopology 11.3.
- GeometricTopology 11.3 still plans to prove the theorem and says AlgebraicTopology consumes it from there.

**Witness.** This README, lines 721–722: "Of 11.3 only the triangulation is consumed: the finite CW type of compact smooth manifolds is Stage 8.7's." Main's consumers cite this roadmap's `compactManifoldFiniteCWType`: HeegaardFloer README line 2347 and FuchsianOrbifolds README line 81. Main's GeometricTopology has no finite-CW-type claim.

**Repair.** Edit GeometricTopology's folder, which is part of this pull request:
- Lines 10661–10664: replace the clause from "and that a compact smooth manifold has finite CW type" to the end of the paragraph with: "that a compact smooth manifold, with or without boundary, has finite CW type is AlgebraicTopology Stage 8.7 (`compactManifoldFiniteCWType`, `compactManifoldWithBoundaryFiniteCWType`), which consumes this item and 11.1."
- Lines 10883–10884: replace "and, through the smooth triangulations of Layer 11.3, that compact smooth manifolds have finite CW type" with "and Layer 11.3's smooth triangulations for its Stage 8.7 finite-CW-type theorem".
- Lines 10752–10755: drop `TauCeti.FiniteCWType`, `TauCeti.IsTriangulable.finiteCWType` and "and finite CW type" from the Needs entries for the additions.

Main's AffineMorseLefschetz README never mentions finite CW type, so its name can go from that sentence. After these edits GeometricTopology 11.3 no longer proves the theorem, and the two READMEs agree with each other and with main's consumers.

## R02 (P3) — Ids that only open revisions define are cited, and no revision is named

This is the previous R03, not repaired.

**Location.** `TauCetiRoadmap/AlgebraicTopology/README.md`:
- Line 111: "the pointed uniqueness of aspherical CW complexes (its Layer 1)".
- Line 114: "(its Layer 2, the comparison with the nerve model)".
- Line 182: "(its C1.5a, the classical Eilenberg–MacLane comparisons)".
- Line 698: "projectiveEMComparisons is CharacteristicClasses C1.5a".

**Claim.** None of these ids exists on main. The pull-request description names no revision as a merge prerequisite. All four lines are added by this pull request: the diff against main shows them as insertions.

**Witness.**
- Main's ClassifyingSpaces README has Stages 1–4 and no Layers. Its Stage 3 (line 177) is "uniqueness and the comparison of the models".
- Main's CharacteristicClasses has C1.5 (line 63) and no C1.5a.
- Only #1854's head defines both "Layer 2: comparison with the nerve model" (ClassifyingSpaces line 388) and C1.5a (CharacteristicClasses line 325). #1807 and #1808 also have C1.5a, but their Layer 2 is group (co)homology.

**Repair.** Either fix is enough:
- In the README: "its Stage 3 (uniqueness and the comparison of the models)" at lines 111 and 114, and "CharacteristicClasses C1.5–C1.6" at lines 182 and 698.
- In the description: name the CharacteristicClasses/ClassifyingSpaces revision (#1854) as a prerequisite that merges first.

## R03 (P3) — Conflicting open heads change this roadmap, and no merge order is stated

This is the previous R04, not repaired.

**Location.** The pull-request description, which states no order.

**Witness.** `roadmaps overlaps AlgebraicTopology`: #1187, #1652, #1807, #1808 and #1854 each change this folder. #1187 changes its `Suggested.lean`; the other four change both its README and its `Suggested.lean`. Each conflicts with #1797 in those files.

**Repair.** State in the description which pull request merges first and which is rebased onto which. If R02 is settled by naming #1854, the order must agree with it: for example, #1797 is rebased onto #1854, and #1652 onto #1797. Keep pull-request numbers out of the README.

## Previous findings

- R01 — repaired: README line 716 now reads "11.3 (the Cairns–Whitehead smooth triangulation …) and 11.1 (the realization and its CW structure) … 1.1 …, 1.3 … and 1.5". Lines 2500, 2654, 2665, 2739 and 3100, and `Suggested.lean` lines 593 and 605, match.
- R02 — partly repaired: README lines 76–80 and 721–722 make Stage 8.7 the single owner, but GeometricTopology README lines 10661–10664 and 10882–10884 still prove the theorem and hand it here (R01 above).
- R03 — not repaired: README line 111 "(its Layer 1)", line 114 "(its Layer 2, the comparison with the nerve model)", lines 182 and 698 "C1.5a"; the description is unchanged (R02 above).
- R04 — not repaired: the description still states no merge order; five open heads still conflict (R03 above).

## Verified sound

### Scope of this pass

The changed passages:
- README lines 73–80 (GeometricTopology ownership) and 716–722 (the supplier contract).
- README lines 2500, 2654, 2665 and 2739 (Stage 6.4 citations and its dependency row) and 3100–3101 (Stage 8.7 item 7).
- The docstrings at `Suggested.lean` lines 592–595 and 604–607.

Text that cites them: the Stage 8 introduction (line 2815), the Stage 8 dependency row (line 3655), line 1443 (AffineMorseLefschetz through GeometricTopology Layer 11), and GeometricTopology's own 11.1 and 11.3 Needs and downstream entry. No stale GeometricTopology id remains: a grep for `12.1`, "Whitehead's smooth" and "GeometricTopology 1.2" finds nothing in either file.

### GeometricTopology ids, resolved on main and at this head

| Id cited here | Main line | Head line | Content | Matches the citation |
| --- | --- | --- | --- | --- |
| 1.1 | 788 | 1242 | smooth collars | yes |
| 1.3 | 851 | 1340 | gluing along the boundary and along faces (head line 1353); handle attachment with the corner rounded by the collar (line 1360) | yes |
| 1.5 | 974 | 1551 | tubular neighbourhoods in a boundaryless Hausdorff second-countable ambient; closed disc bundles for compact S | yes, including the "compact submanifold of a boundaryless manifold" wording at line 2654 |
| 11.1 | 7740 | 10334 | the realization, its pinned CW structure `AbstractSimplicialComplex.realizationCWComplex`, and transport along closed embeddings | yes |
| 11.3 | 7887 | 10631 | Cairns–Whitehead, stated with `TauCeti.IsSmoothTriangulation I n f` for a general model `I`, so for `𝓡∂ n` too; the half-space form at head line 10679 | yes |
| old 1.2 / 12.1 | 822 / none | 1311 / none | complements of embedded balls / nothing | no longer cited |

### Item-level supply

There is no item-level cycle:
- Stage 6.4 takes GeometricTopology 1.1, 1.3 and 1.5. Their Needs lines (head lines 1242–1619) name no AlgebraicTopology item. Only 1.4 (connected sum, line 1515) names AlgebraicTopology Stage 1, and nothing here consumes 1.4.
- Stage 8.7 takes 11.1 and 11.3. 11.1 needs only AlgebraicTopology Stage 4, which is earlier than 8.7. 11.3 needs only GeometricTopology 1.6 and 11.1 (line 10744).

### Gate, depcheck, elaboration, signatures and padding

- **Gate.** My rerun of `gate … --base origin/main` reports every check at 0 except `outside-folder=17`. All 17 hits lie in GeometricTopology, QuadraticFormInvariants, ReductiveGroups and RepresentationTheory/LieHighestWeight, which the brief names as this pull request's own. `git diff --stat` with those folders excluded is empty. The worker's gate (`gate.md`) passes every check, including the build.
- **Depcheck** output, verbatim: `depcheck: 235 roadmaps, 2261 edges, 0 problem(s)`. It has no UPWARD, CYCLE or `moved:` line.
- **Elaboration.** `lake env lean` on `Suggested.lean` gives 0 errors and 20 `declaration uses sorry` warnings, the only warnings. All 91 `#check` pins elaborate.
- **Signatures.** I reran the worker's `#check @` file. The two theorems whose docstrings changed keep their binders:
  - `compactManifoldFiniteCWType`: `n`, `M`, `[T2Space M] [SecondCountableTopology M] [CompactSpace M] [ChartedSpace (EuclideanSpace ℝ (Fin n)) M] [IsManifold 𝓘(ℝ, EuclideanSpace ℝ (Fin n)) ⊤ M]`.
  - `compactManifoldWithBoundaryFiniteCWType`: `[NeZero n] [T2Space M] [CompactSpace M] [ChartedSpace (EuclideanHalfSpace n) M] [IsManifold (𝓡∂ n) ⊤ M]`.

  Both match README line 3102 and the docstrings. The file's 7 errors come from its own `#check` of docstring words (`is`, `itself`) and a malformed name, not from any declaration.
- **Padding probe.** On a scratch copy, both changed theorems fail `first | rfl | (simp; done) | infer_instance | trivial | decide | exact TauCeti.IsTriangulable.finiteCWType inferInstance`, with errors at both proof sites; the other 18 sorries are untouched. The pin has no existence theorem for smooth triangulations (only the negative example `exists_contMDiff_not_isSmoothTriangulation_trans`, `Geometry/Manifold/SmoothTriangulation/Basic.lean:365`), so neither theorem is padding.

### Library declarations opened at the pins (Tau Ceti 2fd255d997)

- `TauCeti.IsSmoothTriangulation`, `Geometry/Manifold/SmoothTriangulation/Basic.lean:191`: an immersion on every closed simplex, for a general model `I`.
- `TauCeti.IsTriangulable.finiteCWType`, `Topology/Triangulable/FiniteCWType.lean:41`: it assumes `[CompactSpace X]` and `IsTriangulable X`, and gives `FiniteCWType X`.
- `TauCeti.FiniteCWType`, `Topology/CWComplex/Classical/FiniteCWType.lean:74`: homotopy equivalent to a finite classical CW complex inside a T2 space of the same universe. It does not require nonemptiness, so ∅ qualifies.
- `AbstractSimplicialComplex.instFiniteCWTypeRealization`, `AlgebraicTopology/SimplicialComplex/Realization/CWComplex/EulerCharacteristic.lean:137`: under `[Finite (Face K)]`.

### Ownership

`roadmaps grep 'compactManifold(WithBoundary)?FiniteCWType'` over main and 458 heads finds two kinds of hit:
- Revisions of this folder: #1187, #1652, #1807 and #1854.
- A consumer: HomotopySpheres (#284), whose `Suggested.lean` line 37 is a `#check`.

No other roadmap declares either name. The only second owner is GeometricTopology 11.3's prose (R01).

### Remark on untouched text

Line 2665 cites GeometricTopology 1.3 for "rounded as in": 1.3 rounds the corner only in handle attachment (head line 1360). Its face gluing leaves a manifold with corners (line 1378). The citation therefore names a technique, not a stated result for triads.

### Source sample

The worker's 15 seeded targets were not matched to any heading. The changed passages carry no source locator: they cite only GeometricTopology ids and pinned declarations. So no sampled target falls in them. The previous round's 15 checks and its extra locators stand (PRREVIEW-AlgebraicTopology_r122, "Source sample").

### Adversarial table

New rows, for the changed statements and passages:

| Statement | Instances tried | Values computed (left / right) | Result | Change |
| --- | --- | --- | --- | --- |
| `compactManifoldFiniteCWType` (docstring now cites GeometricTopology 11.3) | n=0, M three points; S²; T²; RP²; M=∅; infinite-genus surface | 3 zero-cells, χ=3 / 3 points; ∂Δ³ radially projected, (V,E,F)=(4,6,4), χ=2; 7-vertex torus (7,21,14), χ=0; 6-vertex RP² (6,15,10), χ=1, no orientation hypothesis needed; empty CW structure, 0 cells; H₁=ℤ^(ℕ) is not finitely generated, so no finite CW type, excluded by `CompactSpace` | true | none (ownership: R01) |
| `compactManifoldWithBoundaryFiniteCWType` | n=1, [0,1]; D²; compact Möbius band; S¹ on `𝓡∂ 1` with empty boundary; n=0 | one edge (2,1), χ=1; one triangle (3,3,1), χ=1; 5-vertex band (5,10,5), χ=0; triangle boundary (3,3), χ=0; `EuclideanHalfSpace 0` has no `NeZero 0`, so the case is excluded | true | none |
| Single owner of "compact smooth manifolds have finite CW type" | this head; main | owners at head: AlgebraicTopology Stage 8.7 (lines 76–80, 3102) and GeometricTopology 11.3 (lines 10661–10664), 2 / on main: AlgebraicTopology only, 1, cited by HeegaardFloer 2347 and FuchsianOrbifolds 81 | two owners | R01 |
| GeometricTopology ids 1.1, 1.3, 1.5, 11.1, 11.3 | main and head | lines 788/1242, 851/1340, 974/1551, 7740/10334, 7887/10631; contents as in the table above | resolve | none |
| Item-level supply for 6.4 and 8.7 | GeometricTopology 1.1/1.3/1.5/11.1/11.3 Needs | AlgebraicTopology items needed: none, none, none, Stage 4 (earlier than 8.7), none | acyclic | none |

Rows carried from the previous report (PRREVIEW-AlgebraicTopology_r122), for statements the diff leaves untouched. The values are those computed there:

| Statement | Instances tried | Values computed (left / right) | Result | Change |
| --- | --- | --- | --- | --- |
| `ordinaryPairQuotientComparison` | B=∅; (D¹,S⁰); B=X; R=M₂(ℚ); comb | H_n(X)/H_n(X₊,*); ℤ/ℤ, 0/0; 0/0; same exact sequences; ℤ^(ℕ) countable vs ℤ^ℕ uncountable, comb excluded by HEP (r122) | true | none |
| `ordinaryPairQuotientCohomologyComparison` | B=∅; (D²,S¹); noncommutative R | H^n(X;M)/H^n(X₊,*;M); ℤ/ℤ; Hom_R(R[S],M)=M^S (r122) | true | none |
| `exists_cwApproximation` | ∅; ℚ; Warsaw circle; Cantor set | ∅; discrete ℚ; pt→W; uncountable discrete 0-complex (r122) | true | none |
| `compactSupportTopClass_unique` / `_exists` | K=∅; m=0; ℝ,[0,1]; open Möbius band | 0; ⊕L_x; ℤ→ℤ iso; H₂(Mö,Mö∖S¹;or)≅ℤ (r122) | true | none |
| `poincareDuality_zmodTwo` | RP²; ∅; n=0; S¹⊔S¹ | 𝔽₂/𝔽₂; 0/0; 𝔽₂^k/𝔽₂^k; 𝔽₂²/𝔽₂² (r122) | true | none |
| `poincareDuality_int` | S¹; T²; RP²; ∅ | ℤ/ℤ; ℤ²/ℤ²; RP² excluded by orientation; 0/0 (r122) | true | none |
| `lsCupLength_add_one_le_categoryCount` | pt; ∅; Sⁿ; T²; RP^∞; S¹⊔S¹ | 1≤1; excluded by `Nonempty`; 2≤2; 3≤3; ⊤≤⊤; 2≤4 (r122) | true | none |
| `relHurewicz_bijective_of_simplyConnected_subspace` | (D³,S²); D³⊔S³ | ℤ/ℤ; ℤ/ℤ², excluded by `PathConnectedSpace` (r122) | true | none |
| `homologicalWhitehead` | id_{S²}; Poincaré sphere | iso/iso; π₁ of order 120, excluded by `SimplyConnectedSpace` (r122) | true | none |
| proper HEP / `HasProperHomotopyExtensionProperty` | A=∅; A=X; comb; ⋁_ℕ[0,1]; ℝ ⊃ ℤ | compact preimages; K=H; no retraction; not compact; FTW 1.4+1.6 apply (r122) | true | none |
| `properStrongDeformationRetract_of_inverse` | ℝ×I⊃ℝ×0; ℝ⊃{0}; A=X | C×I compact; hypothesis fails; r=id (r122) | true | none |
| `groupClassifyingSpace_isEMOne` | trivial; ℤ; ℤ/2; S₃ | point; S¹; RP^∞; π₁≅S₃ (r122) | true | none |
| `SatisfiesSerreAxioms` Checks | 0; torsion; finite; exponent dᵐ | as r122 | hold | none |
| `hurewicz_isoModSerre` | C=0; torsion, S³; finite, S² | absolute; ℤ≅ℤ, ℤ/2↠0; ℤ≅ℤ, ℤ↠0 (r122) | true | none |
| `nonempty_ordinaryEMModel` | (0,1); (ℤ,1); (ℤ,2); (ℚ,1); S² | point; S¹; CP^∞; telescope; π₃(S²)=ℤ rejects (r122) | true | none |
| `exists_ordinaryEMLoopEquivalence` | A=0; ℤ; ℤ/2; point in a 1-cell | 1/1; π₁(ΩCP^∞)=ℤ; same; pointed by HEP (r122) | true | none |
| `ordinaryEMRepresentability` | S¹,ℤ; ∅; S¹⊔S¹; A=0; −ι | ℤ/ℤ; 1/1; ℤ²/ℤ²; 1/1; −1≠1 (r122) | true | none |
| `finiteSourceMappingCWType` / `basedLoopCWType` | K=∅; Cantor→S⁰; ℕ; S¹ | point; countable discrete; excluded; components ℤ (r122) | true | none |
| cap, cup, `LocallyRepresentedTopSection`, Stage 4.4, 5.0, 6.1–6.5, 7, 4.5–4.7, 5.4, 8.11a Checks | as r122 | values as listed in r122 | hold | none |

## Not verifiable

- serre1953, fq1990, tomdieck2008, milnor1963, weibel, lee, thom1954: settled as uncertified and not read. Unchanged from the previous round.
- may1967: an image-only scan, and this worker has no OCR. It stays in `needs-references.toml`.
- dowker1952: checked only through milnor1959's quotation on p. 274.
- Eilenberg–Steenrod, G. W. Whitehead, Dold, McCleary, K. Brown and Serre 1951: chapter-level citations, absent from the manifest.
- Nothing in the changed passages depends on a text I could not read.

## Source issues

- none
