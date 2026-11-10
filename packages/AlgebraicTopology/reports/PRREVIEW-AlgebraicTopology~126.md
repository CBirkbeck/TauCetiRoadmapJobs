# Review of AlgebraicTopology (pull request #1797 at 79f76f0)

**Verdict:** needs changes

This is an incremental re-review of the 37 lines changed since 85b5c37, all in `TauCetiRoadmap/AlgebraicTopology/README.md`; `Suggested.lean` is unchanged. The three findings below are the previous review's three. None of them was touched by this round. The changed passages themselves introduce no new defect.

## R01 (P2) — GeometricTopology 11.3 still owns the finite CW type of compact smooth manifolds and hands it to this roadmap

This is the previous R01, not repaired. The GeometricTopology folder has not changed since 85b5c37.

**Location.** All in `TauCetiRoadmap/GeometricTopology/README.md`:
- Lines 10662–10664: "a compact smooth manifold has finite CW type, `TauCeti.FiniteCWType`, by `TauCeti.IsTriangulable.finiteCWType` (Layer 11.1). This is the item that AlgebraicTopology (compact smooth manifolds have finite CW type) and AffineMorseLefschetz consume."
- Lines 10883–10884, the same claim in the downstream entry.
- Lines 10752–10755, the Needs entries for it.

**Claim.** This theorem has two owners, and each hands it to the other:
- This roadmap owns it: README lines 76–80 and 720–721 name Stage 8.7 as the owner and consume only the triangulation of GeometricTopology 11.3.
- GeometricTopology, in the same pull request, also proves it and says AlgebraicTopology consumes it from there.

**Witness.** This README, lines 720–721: "Of 11.3 only the triangulation is consumed: the finite CW type of compact smooth manifolds is Stage 8.7's." Main's consumers cite this roadmap's `compactManifoldFiniteCWType`: HeegaardFloer README line 2347 and FuchsianOrbifolds README line 81.

**Repair.** Make three edits in the GeometricTopology folder, which belongs to this pull request:
- Lines 10661–10664: replace the clause from "and that a compact smooth manifold has finite CW type" to the end of the paragraph with "that a compact smooth manifold, with or without boundary, has finite CW type is AlgebraicTopology Stage 8.7 (`compactManifoldFiniteCWType`, `compactManifoldWithBoundaryFiniteCWType`), which consumes this item and 11.1."
- Lines 10883–10884: replace "and, through the smooth triangulations of Layer 11.3, that compact smooth manifolds have finite CW type" with "and Layer 11.3's smooth triangulations for its Stage 8.7 finite-CW-type theorem".
- Lines 10752–10755: drop `TauCeti.FiniteCWType`, `TauCeti.IsTriangulable.finiteCWType` and "and finite CW type".

## R02 (P3) — Ids that only open revisions define are cited, and no revision is named

This is the previous R02, not repaired.

**Location.** `TauCetiRoadmap/AlgebraicTopology/README.md`:
- Line 111: "owns the pointed uniqueness of aspherical CW complexes (its Layer 1)".
- Line 114: "(its Layer 2, the comparison with the nerve model)".
- Line 182: "(its C1.5a, the classical Eilenberg–MacLane comparisons)".
- Line 698: "projectiveEMComparisons is CharacteristicClasses C1.5a".

**Witness.**
- On main (f8836c4), ClassifyingSpaces has only Stages 1–4. Its Stage 3, at line 177, is uniqueness and the comparison of the models.
- On main, CharacteristicClasses has no C1.5a.
- At #1854's head, ClassifyingSpaces has "Layer 1" at line 245 and "Layer 2: comparison with the nerve model" at line 388, and CharacteristicClasses has C1.5a at line 325. #1807 also has C1.5a, at line 820.
- `scratch/overlaps.md` reports C1.5a (line 698) under "only an open revision defines". The pull-request description names no revision.

**Repair.** Either fix is enough:
- README: write "its Stage 3 (uniqueness and the comparison of the models)" at lines 111 and 114, and "CharacteristicClasses C1.5–C1.6" at lines 182 and 698.
- Description: name the CharacteristicClasses/ClassifyingSpaces revision (#1854) as a prerequisite that merges first.

## R03 (P3) — Conflicting open heads change this roadmap, and no merge order is stated

This is the previous R03, not repaired.

**Location.** The pull-request description, which still states no order.

**Witness.** `roadmaps overlaps AlgebraicTopology` lists five open pull requests that conflict with #1797 in this folder:
- #1187 conflicts in `Suggested.lean`.
- #1652, #1807, #1808 and #1854 conflict in both `README.md` and `Suggested.lean`.

**Repair.** State in the description which pull request merges first and which is rebased onto which. The order must agree with R02's choice: for example, #1797 is rebased onto #1854, and #1652 onto #1797. Keep pull-request numbers out of the README.

## Previous findings

- R01 — not repaired: GeometricTopology README lines 10662–10664 still say a compact smooth manifold has finite CW type by `TauCeti.IsTriangulable.finiteCWType`, "the item that AlgebraicTopology … consume[s]"; lines 10752–10755 and 10883–10884 are unchanged.
- R02 — not repaired: README line 111 "(its Layer 1)", line 114 "(its Layer 2, the comparison with the nerve model)", lines 182 and 698 "C1.5a"; the description names no revision.
- R03 — not repaired: the description still states no merge order; #1187, #1652, #1807, #1808 and #1854 still conflict in this folder.

## Verified sound

### Scope of this pass

The changed passages, all in `TauCetiRoadmap/AlgebraicTopology/README.md`:
- Lines 716–721: the GeometricTopology supplier contract, which no longer consumes 1.3.
- Lines 2662–2673: the hypotheses of the compact triad duality, its locator, and the corner exclusion.
- Lines 2687–2693: the nested-pair naturality.
- Lines 2737–2743: the new solid-torus Check.
- Line 2756: the Stage 6.1–6.4 dependency row.

Text that cites them:
- AffineMorseLefschetz §4.5 on main, the consumer of the triad theorem.
- This README's other GeometricTopology citations, at lines 73–80, 1442, 2499–2500, 2653 and 3117.
- GeometricTopology's downstream entry for this roadmap, at its lines 10878–10884.

### The revised compact triad statement (lines 2662–2673)

**Source.** Hatcher Theorem 3.43 is at `hatcher` lines 10976–10980, printed p. 254. It treats a compact R-orientable n-manifold M whose boundary is the union of two compact (n−1)-manifolds A and B, with ∂A=∂B=A∩B, and gives cap with [M] as an isomorphism `H^k(M,A;R)→H_(n−k)(M,B;R)`.
- With A=∂₁K and B=∂₀K this is the README's `H^k(K,∂₁K;L)≃H_(m−k)(K,∂₀K;L⊗or_K)` for constant L and orientable K. The face labels and the stated scope "(R-orientable K and constant coefficients)" are right.
- Hatcher's proof uses collars of A∩B in A and in B and of ∂M in M (`hatcher` lines 10983–10987). It applies the five lemma to the triple (M,∂M,A) and the pair (M,B), which matches the route at lines 2678–2685.

**Model.** Mathlib's `EuclideanHalfSpace (n : ℕ) [NeZero n]` (`Mathlib/Geometry/Manifold/Instances/Real.lean:60`) forces m≥1. So "(empty for m=1)" covers the only low case. At m=1 the faces are disjoint finite sets covering ∂K.

**Collars.** The collars are satisfiable only as topological collars, and that is what Stage 6.4 uses:
- At the pin, `TauCeti.IsCollar` (Tau Ceti 2fd255d997, `Geometry/Manifold/Boundary/Collar/Global.lean:46`) is a topological open embedding `N × [0,1) → M` with zero slice f. Line 2496 already takes the Brown topological collar `TauCeti.IsLocallyCollared.isCollared` (`Boundary/Collar/Brown.lean:459`).
- Near an edge point, a face collar maps a quadrant-shaped domain onto a half-disc neighbourhood. Angle doubling does this as a homeomorphism, so "each face collared in K, the collar restricting on the other face to a collar of the edge" can be met.
- No smooth immersion can do it: the derivative at the corner maps the quadrant into a proper cone.

**Corner exclusion.** "No corner along the edge" is automatic in the `𝓡∂ m` model. The corner exclusion and its attribution agree with main:
- AffineMorseLefschetz README line 854 owns the edge rounding.
- Line 865 proves that the rounded cut's faces carry exactly these collars.
- Line 913 makes the same statement that a quadrant corner has no half-space chart.

The previous remark on line 2665, that GeometricTopology 1.3 named a technique and no stated result, is resolved by this rewording.

### Nested-pair naturality (lines 2687–2693)

**The collar excision is valid under the stated hypotheses:**
- Invariance of domain puts int K inside int K′.
- At a point x of ∂₀K off the edge, ∂₀K⊆∂₀K′⊆∂K′ makes K a neighbourhood of x in K′. So the frontier of K in K′ lies in ∂₁K.
- Hence (K′∖K) together with the collar of ∂₁K is open in K′ and contains the closure of K′∖K. Excising K′∖K gives `H^k(K′,K′∖(K∖∂₁K))≅H^k(K,∂₁K)`.
- Restriction to (K′,∂₁K′) needs ∂₁K′⊆(K′∖K)∪∂₁K, which is the stated ∂₁K′∩K⊆∂₁K.

**A note, not a finding:** the same argument shows that ∂₁K′∩K⊆∂₁K already follows from ∂₀K⊆∂₀K′. A point of int(∂₀K) lies in the interior of ∂₀K′, so it is not in ∂₁K′.

**Consumer match.** AffineMorseLefschetz's cuts satisfy both conditions: for c<c′, ∂₀K_c=K_c∩∂M⊆∂₀K_(c′) and ∂₁K_(c′)∩K_c=∅ (its line 871). Its line 880 consumes "AlgebraicTopology 6.4's single `compactTriadPoincareLefschetz` and its nested-cut naturality". Its A4.0 is its Layer 4 (line 616).

**Direction.** This README names AffineMorseLefschetz only as owner and consumer. No Needs entry or dependency row names it, so there is no supply cycle. No open pull request changes AffineMorseLefschetz (`roadmaps list`).

### Dropping GeometricTopology 1.3

These passages agree:
- The supplier contract (lines 716–721) and the dependency row (line 2756) now both name only 1.1 and 1.5 for Stage 6.4.
- Line 2653 still consumes 1.5. Lines 2499–2500 mention 1.1 and 1.3 only as owners, not as inputs.
- GeometricTopology's downstream entry (its lines 10878–10880) speaks of "Layer 1's boundary and collar constructions" generally.

GeometricTopology is unchanged since 85b5c37, so the previous id table (1.1 → head line 1242, 1.5 → 1551, 11.1 → 10334, 11.3 → 10631) stands.

### Gate, depcheck, elaboration, signatures, padding

- **Gate.** My rerun of `gate … --base origin/main` reports every check at 0 except `outside-folder=17`. All 17 hits lie in GeometricTopology, QuadraticFormInvariants, ReductiveGroups and RepresentationTheory/LieHighestWeight, which the brief names as this pull request's own. `git diff --stat` with those five folders excluded is empty. The worker's gate passes every check, including `build=0`.
- **Depcheck**, verbatim: `depcheck: 235 roadmaps, 2262 edges, 0 problem(s)`. It has no UPWARD, CYCLE or `moved:` line.
- **Elaboration.** `lake env lean` on `Suggested.lean` gives 0 errors and 20 `declaration uses sorry` warnings, and no other warning.
- **Signatures and padding.** `Suggested.lean` is byte-identical to 85b5c37 (`git diff 85b5c37 HEAD -- Suggested.lean` is empty). `signatures.md` lists 50 declarations, none with a dropped binder. The previous rounds' `#check @` binder comparison and one-tactic padding probes therefore stand. The triad theorem is still correctly listed as not statable in the module docstring: the pins have no relative or local-coefficient cap product.

### Source sample

The worker's 15 seeded targets were not matched to any heading. The changed passages carry one source locator, Hatcher Theorem 3.43, which I verified above, including its page. The previous rounds' sample (r122) stands for the untouched text.

### Adversarial table

New rows, for the changed statements:

| Statement | Instances tried | Values computed (left / right) | Result | Change |
| --- | --- | --- | --- | --- |
| Compact triad duality `H^k(K,∂₁K;L)≃H_(m−k)(K,∂₀K;L⊗or_K)` (line 2662) | D² with two arcs, edge S⁰; solid torus, disc/complement; [0,1] with ∂₀={0}, ∂₁={1}; [0,1] with ∂₀={0,1}; annulus with the two circles as faces, edge ∅; Möbius band with two boundary arcs and the or-twist; unit square with corner edge; m=0 | all k 0 / 0; k=1 ℤ/ℤ, other k 0/0; 0/0; k=0 ℤ / H₁([0,1],∂)=ℤ; 0/0 for all k; k=1 H¹(Mö,arc)=ℤ / H₁(Mö,arc;ℤ_tw)=ker(ℤ→ℤ/2)≅ℤ, k=0,2 0/0; square excluded (no `𝓡∂ 2` structure compatible with the corner), rounded to D²; `EuclideanHalfSpace 0` lacks `NeZero 0` | true | none |
| Swapped-face form, and the case ∂₀K=∅ | D², ∂₀=∅; closed K | H²(D²,S¹)=ℤ / H₀(D²)=ℤ; reduces to Hatcher 3.30 | true | none |
| Face-collar hypothesis | quadrant onto half-disc near the edge | angle doubling is a homeomorphism, so an `IsCollar` open embedding exists; no smooth immersion exists | satisfiable topologically, the sense used in 6.4 | none |
| Nested naturality (line 2688) | [0,1]⊂[−1,2] with ∂₁K={0,1}, ∂₁K′={−1,2}, ∂₀=∅; D²=D² with ∂₀K the upper arc, ∂₀K′=S¹, ∂₁K′=∅; AffineMorseLefschetz cuts c<c′ | H¹: ℤ→ℤ→ℤ isomorphisms / H₀: ℤ→ℤ iso; k=0: 0→ℤ / H₂: 0→ℤ, both zero; ∂₁K_(c′)∩K_c=∅ | commutes; hypotheses hold | none (∂₁K′∩K⊆∂₁K is implied by ∂₀K⊆∂₀K′) |
| Solid-torus Check (line 2737) | K=S¹×D², ∂₁K a disc, ∂₀K its complement in T² | H^k(K,∂₁K)=H̃^k(S¹): ℤ at k=1 / H₂(K,∂₀K)=ker(ℤ²→ℤ)=⟨meridian⟩=ℤ, H₃=H₁=H₀=0; same face: H_(3−k)(K,∂₁K)=H̃_(3−k)(S¹) is ℤ at k=2 and 0 at k=1 | Check true and discriminating | none |
| GeometricTopology contract without 1.3 | lines 716–721, 2653, 2756 | consumed: 1.1, 1.5, 11.1, 11.3 / dependency row: 1.1, 1.5 (6.4), 11.x (8.7) | agree | none |
| AffineMorseLefschetz 4.5 attribution | main lines 616, 854, 865, 871, 880, 913 | owns the rounding / consumes the triad theorem and its naturality | consistent, no cycle | none |

Rows carried from the previous report (PRREVIEW-AlgebraicTopology_r124), and through it from r122, for statements the diff leaves untouched:

| Statement | Instances tried | Values computed (left / right) | Result | Change |
| --- | --- | --- | --- | --- |
| `compactManifoldFiniteCWType` | n=0, 3 points; S²; T²; RP²; ∅; infinite-genus surface | χ=3; (4,6,4) χ=2; (7,21,14) χ=0; (6,15,10) χ=1; 0 cells; excluded by `CompactSpace` (r124) | true | none (ownership: R01) |
| `compactManifoldWithBoundaryFiniteCWType` | [0,1]; D²; Möbius band; S¹ on `𝓡∂ 1`; n=0 | χ=1; χ=1; χ=0; χ=0; excluded by `NeZero` (r124) | true | none |
| `ordinaryPairQuotientComparison` | B=∅; (D¹,S⁰); B=X; R=M₂(ℚ); comb | as r122 | true | none |
| `ordinaryPairQuotientCohomologyComparison` | B=∅; (D²,S¹); noncommutative R | as r122 | true | none |
| `exists_cwApproximation` | ∅; ℚ; Warsaw circle; Cantor set | as r122 | true | none |
| `compactSupportTopClass_unique` / `_exists` | K=∅; m=0; ℝ, [0,1]; open Möbius band | as r122 | true | none |
| `poincareDuality_zmodTwo` | RP²; ∅; n=0; S¹⊔S¹ | 𝔽₂/𝔽₂; 0/0; 𝔽₂^k/𝔽₂^k; 𝔽₂²/𝔽₂² (r122) | true | none |
| `poincareDuality_int` | S¹; T²; RP²; ∅ | ℤ/ℤ; ℤ²/ℤ²; excluded; 0/0 (r122) | true | none |
| `lsCupLength_add_one_le_categoryCount` | pt; ∅; Sⁿ; T²; RP^∞; S¹⊔S¹ | as r122 | true | none |
| `relHurewicz_bijective_of_simplyConnected_subspace` | (D³,S²); D³⊔S³ | as r122 | true | none |
| `homologicalWhitehead` | id_{S²}; Poincaré sphere | as r122 | true | none |
| `HasProperHomotopyExtensionProperty`, `properStrongDeformationRetract_of_inverse` | as r122 | as r122 | true | none |
| `groupClassifyingSpace_isEMOne` | trivial; ℤ; ℤ/2; S₃ | as r122 | true | none |
| `hurewicz_isoModSerre`, `SatisfiesSerreAxioms` Checks | as r122 | as r122 | true | none |
| `nonempty_ordinaryEMModel`, `exists_ordinaryEMLoopEquivalence`, `ordinaryEMRepresentability` | as r122 | as r122 | true | none |
| `finiteSourceMappingCWType` / `basedLoopCWType` | K=∅; Cantor→S⁰; ℕ; S¹ | as r122 | true | none |
| Other Stage 4.4–8.11a Checks | as r122 | as r122 | hold | none |

### Ownership

The compact triad theorem is this roadmap's: AffineMorseLefschetz line 880 consumes it, and no other roadmap on main or at the 458 open heads states it. The corner rounding of the cuts is AffineMorseLefschetz's. Ownership of the finite CW type is R01.

### Remark

`may1967` is now in the sources cache as OCR text. The changed passages do not cite it, so it was not rechecked this round.

## Not verifiable

- serre1953, fq1990, tomdieck2008, milnor1963, weibel, lee and thom1954 are settled as uncertified and were not read. This is unchanged.
- dowker1952 was checked only through milnor1959's quotation on p. 274.
- Eilenberg–Steenrod, G. W. Whitehead, Dold, McCleary, K. Brown and Serre 1951 have chapter-level citations and are absent from the manifest.
- Nothing in the changed passages depends on a text I could not read.

## Source issues

- none
