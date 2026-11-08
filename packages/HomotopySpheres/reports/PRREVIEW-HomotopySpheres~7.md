# Review of HomotopySpheres (pull request #1287 at 8a5be10)

**Verdict:** needs changes

Full re-review of head `8a5be100f11d2687774e66b7eb2f54c57c2fed81` (334 changed lines since `52ebd6f`). The gate passes and `Suggested.lean` elaborates with exactly 15 `sorry` warnings. There are seven findings: four P2 and three P3. Two of the P2s come from text added in this change: the James splitting now has two owners, and the AlgebraicTopology item that replaces 3A.1 exists only in open revisions (filed as P3). The other two P2s are in unchanged text that this full review re-read: the h-cobordism headline can in fact be stated at the pins, and the inverse h-cobordism of 2.3 is wrong as written. Separately, DifferentialGeometry Layer 10 is dropped by an open revision.

## Previous findings

The previous review (r6, at `52ebd6f`) recorded no findings and accepted. The two items it carried from r5 are still repaired at this head:

- r5 R01 (singular counit): README:823–827 still consumes "CharacteristicClasses C1.2b's counit ε_X : |Sing X| → X and AlgebraicTopology Stage 4 item 7's CW structure" and defines q_X = ε_X ∘ c_X. **Repaired.** It is not reconstructed.
- r5 R02 (Hopf bundles): README:1669–1682 still uses "RiemannianGeometry R3.3c's based S¹ → S³ → S²" and "GeneralizedCohomology G4.0a–G4.0b's S³ → S⁷ → HP¹", with fixed basepoints. **Repaired.**

No finding is re-raised from a repair report.

## R01 (P2) — The h-cobordism theorem can be stated at the pins but is absent

**Location.** `TauCetiRoadmap/HomotopySpheres/Suggested.lean:31–33`: "the simply connected smooth h-cobordism theorem (Stage 1): the pins lack a full collared smooth cobordism carrier with boundary identifications, product collars and gluing data."

**Claim.** The headline (Scope item 1; README 1.7) is listed as not statable. The statement needs none of the collar or gluing API. It needs a compact manifold with boundary, a clopen piece of its boundary, two homotopy-equivalence conditions and a diffeomorphism to a product. All of these are native at the pins.

**Witness.** The following elaborated in a scratch file against the pins, with only the `sorry` warning. It uses Mathlib `ModelWithCorners.boundary` (`Mathlib/Geometry/Manifold/IsManifold/InteriorBoundary.lean:112`), Tau Ceti's canonical boundary charted space (`TauCeti/Geometry/Manifold/Boundary/Charts.lean:195`), `instIccChartedSpace` (`Mathlib/Geometry/Manifold/Instances/Real.lean:438`) and `Diffeomorph` (`Mathlib/Geometry/Manifold/Diffeomorph.lean:82`).

**Repair.** Add the theorem to `Suggested.lean` under `/-! ## Layer 1 -/` (it then needs `import TauCeti.Geometry.Manifold.Boundary.Charts`). Name it in README 1.7 and in "How to read the build". Delete the docstring bullet. Tested on W = S⁵×[0,1] with M₀ = S⁵×{0}: both inclusions are homotopy equivalences, n = 5 satisfies 5 ≤ n, and f = id satisfies the boundary equation.

```lean
theorem exists_diffeomorph_prod_Icc_of_hCobordism (n : ℕ) (hn : 5 ≤ n)
    (W : Type) [TopologicalSpace W] [T2Space W] [CompactSpace W]
    [ChartedSpace (EuclideanHalfSpace (n + 1)) W] [IsManifold (𝓡∂ (n + 1)) ∞ W]
    [SimplyConnectedSpace W]
    (M₀ : TopologicalSpace.Opens ((𝓡∂ (n + 1)).boundary W))
    (hM₀ : IsClosed (M₀ : Set ((𝓡∂ (n + 1)).boundary W)))
    (h₀ : ∃ e : ContinuousMap.HomotopyEquiv M₀ W, ⇑e.toFun = fun x : M₀ => x.1.1)
    (h₁ : ∃ e : ContinuousMap.HomotopyEquiv
        ↥((M₀ : Set ((𝓡∂ (n + 1)).boundary W))ᶜ) W, ⇑e.toFun = fun x => x.1.1) :
    ∃ f : W ≃ₘ⟮𝓡∂ (n + 1), (𝓡 n).prod (𝓡∂ 1)⟯ (M₀ × Set.Icc (0 : ℝ) 1),
      ∀ x : M₀, f.symm (x, ⟨0, by simp⟩) = x.1.1 := by
  sorry
```

## R02 (P2) — The James construction and James splitting have two owners

**Location.** README:2960–2962: "GeneralAlgebraicKTheoryPartII §§4.33 and 7.7 use the reduced and unreduced stable James splittings of 3B.6, and ChromaticHomotopyTheory reaches them through that roadmap." The consumer table at README:2970 makes the same claim. The duplicated objects are 3B.1–3B.6 (README:845–935).

**Claim.** The open pull request GeneralAlgebraicKTheoryPartII (#1742, head `492970e`) now owns these objects itself. At that head, `TauCetiRoadmap/GeneralAlgebraicKTheoryPartII/README.md:1206` owns the James reduced product, word filtration, James equivalence and James–Hopf maps h_k. Its line 1237 (§4.30c) owns Σ∞J(W) ≃ ⋁Σ∞W^∧r, the loop form and ΣJ(W) ≃ ⋁ΣW^∧r. Its §4.33 (line 1337) and §7.7 (line 1987) cite §4.30c, not 3B.6. So this roadmap's consumer claim is false at that head, and the objects have two owners.

**Witness.** For W = S¹ both give ΣΩS² ≃ ⋁_(r≥1) S^(r+1). For W = S⁰ both exclude the loop form, since π₀J(S⁰) = ℕ while π₀ΩS¹ = ℤ. In ORDER.txt, HomotopySpheres is on line 69 and GeneralAlgebraicKTheoryPartII on line 324. AlgebraicTopology at #1663 (README:135) says the James constructions stay in HomotopySpheres.

**Repair.** Keep 3B.1–3B.6 here: this roadmap is earlier in the merge order, and 3B.1–3B.5 feed EHP. Name #1742 in this pull request's description as the consumer that must replace §4.30b–c by citations of 3B.1–3B.6, keeping only its E₁-ring form Σ∞₊J(W) ≃ T(Σ∞W). Until that head cites 3B.6, delete the sentence at README:2960–2962 and the "GeneralAlgebraicKTheoryPartII §4.33" entry at README:2970.

## R03 (P2) — DifferentialGeometry Layer 10 is dropped by an open revision

**Location.** README:1617–1618: "*Needs:* TangentialBordism B5.2 and B1 relative transversality; Layer 3A's pointed sphere models; DifferentialGeometry Layer 10 degree." The same supplier is cited at README:95, :357 ("Layers 3 and 10 supply flows, finite-dimensional Sard and degree") and :604.

**Claim.** This is a supplier citation of an id that open pull request #886 (DifferentialGeometry, head `a565de6`) drops. No citation follows it to that head.

**Witness.** At #886's head the layer headings run 0–5.6 and then 12 (README:288–1204). Its lines 260–262 and 1378–1382 assign "Sard's theorem on manifolds, the Brouwer mapping degree" to DeRhamCohomologyAndDuality. At that roadmap's head (#1768, `1b57dbe`), README lines 8 and 49 import "Sard on manifolds and the degree (layer 10)" back from DifferentialGeometry. So once #886 merges, no head plans the degree.

**Repair.** Repoint the four citations to owners that exist at the heads:

- Sard in unequal dimensions and signed counts of framed points: TangentialBordism B1.6 and B1.1's point sign σ (TangentialBordism README:232 at its head). This roadmap already consumes that supplier.
- Degree of sphere self-maps (the reflection sign in 10.3 and 10.4 and π_c(S^c) ≅ ℤ in 5.0): the induced map on top integral homology, normalized by AlgebraicTopology Stage 4 item 4's `basedSphereReferenceGenerator`.
- Flows: keep DifferentialGeometry Layer 3. Orientations: keep Layer 2. Both survive at #886.

Test on one positive framed point: σ = +1, matching the degree +1 in 5.0's Checks. A reflected point gives −1.

Alternatively, name #886 in the merge-order paragraph as merging after this pull request, which makes the dropped id #886's to renumber.

## R04 (P2) — The inverse h-cobordism of 2.3 is not an h-cobordism as written

**Location.** README:632–635: "start from the punctured cylinder on `Sigma`, attach the standard connecting handle, and prove its outgoing boundary is `Sigma # (-Sigma)` while the incoming boundary is the standard sphere."

**Claim.** The *Needs:* line ("GeometricTopology Layer 1 product and handle gluing") points to the following reading. Remove a ball from Σ×I to make the incoming Sⁿ, then join Σ×0 and Σ×1 by a 1-handle. The ends are then Sⁿ and Σ#(−Σ), as stated, but the result is not an h-cobordism. The target also never asks for the homotopy-equivalence property, which is the whole content.

**Witness.** Take Σ = Sⁿ with n ≥ 2. Then Sⁿ×I minus a ball is ≃ Sⁿ∨Sⁿ, and adding the 1-handle gives ≃ Sⁿ∨Sⁿ∨S¹, so π₁ = ℤ ≠ 0. The cited source builds the witness differently:

- `kervairemilnor1963` lines 125–136 (Lemma 2.4, p.507): (Σ − int D)×[0,π] ∪ S^(n−1)×H² is contractible with boundary Σ#(−Σ).
- Lines 108–124 (Lemma 2.3, pp.506–507): for simply connected M, removing an interior disc gives an h-cobordism to Sⁿ.

**Repair.** Restate 2.3 as follows. "The cylinder on the punctured Σ, (Σ − int D)×I with corners rounded, is contractible with boundary Σ#(−Σ) (Kervaire–Milnor Lemma 2.4, p.507). Removing an interior (n+1)-disc gives a cobordism from Sⁿ to Σ#(−Σ). For n ≥ 2 both inclusions are homotopy equivalences by the pair sequence, duality and simple connectivity (Lemma 2.3, pp.506–507)." Add that last claim to the target. Tested on Σ = Sⁿ: Dⁿ×I minus a ball is Sⁿ×I up to diffeomorphism, an h-cobordism.

## R05 (P3) — The new compact-generation supplier exists only in open revisions

**Location.** README:692–698 makes "AlgebraicTopology Stage 4 item 8, *Compact generation and the pointed adjunction*" the owner of the coreflection, convenient products and exponentials, smash product, reduced suspension, loops and Σ ⊣ Ω. It is cited in *Needs:* lines at README:702, 751, 812, 847, 864, 897, 1074, 1264 and 1405.

**Claim.** That item is not on main. The PR description's merge-order paragraph names neither revision that defines it, and the overlap tool did not flag it.

**Witness.** On main, AlgebraicTopology Stage 4 ends at item 7 (`simplicialRealizationCW`, README:817), and Stage 5 starts at README:849. Main's Stage 4 item 4 (README:567) still compares through "HomotopySpheres §3A.1's coreflection". The item exists only at AlgebraicTopology #1663 (README:911, numbered 8) and #1652 (README:1298, "### 4.8").

**Repair.** Name the defining AlgebraicTopology revision (#1663; #1652 carries the same item as §4.8) in the merge-order paragraph, so that it merges before this pull request. Also fix the stale *Needs:* sentence at README:815, "item 3 uses item 2's suspension maps": 3A.2 no longer builds suspension, and 3A.3's own *Needs:* line (README:751) correctly names Stage 4 items 4 and 8.

## R06 (P3) — The group law for n = 1, 2 rests on an uncited lemma and an unowned input

**Location.** README:622 ("*Needs:* GeometricTopology Layer 1; 2.1; Kervaire–Milnor Lemma 2.1, p.505") and README:641–642 ("give it an `AddCommGroup` structure for n ≥ 1").

**Claim.** Descending connected sum to h-cobordism classes is Kervaire–Milnor Lemma 2.2, not Lemma 2.1. Lemma 2.2's proof works only for n ≥ 3. For n ≤ 2 the source falls back on smoothing and classification results that no layer or supplier here provides.

**Witness.** `kervairemilnor1963` lines 78–80 (Lemma 2.2, p.505) assume closed simply connected manifolds, and the proof opens by assuming n ≥ 3. Lines 142–144 (p.507) get Θ₁ = Θ₂ = 0 from separate classification results. For n = 2 the arc complement W − A in a 3-dimensional h-cobordism has no π₁ control.

**Repair.** Cite Lemma 2.2 (pp.505–506) at 2.2, with its simple-connectivity hypothesis. Then do one of the following:

- Add a named target with an owner: every smooth homotopy 1- or 2-sphere is diffeomorphic to the standard one, hence Θ₁ = Θ₂ = 0.
- State the descent for n ≥ 3 and handle n = 1, 2 by that cited classification.

Tested at n = 3: S³ minus a point and W minus an arc are simply connected, so Lemma 2.2's argument applies.

## R07 (P3) — A 3B.6 Check states a false rank

**Location.** README:983: "Cartesian powers in place of smash powers would add Σ(S¹×S¹) ≃ S²∨S²∨S³ at k=2 and give H₂(ΣJ(S¹);ℤ) of rank 3 instead of 1."

**Claim.** The wrong model ⋁_(k≥1) Σ(X^×k) has infinite rank in H₂, not rank 3.

**Witness.** Σ(T^k) ≃ ⋁ over nonempty subsets S of S^(|S|+1), which contributes k copies of S². The H₂ rank of the wedge up to k = n is therefore 1+2+…+n: 3 at n = 2, 6 at n = 3, and infinite for J.

**Repair.** State the Check on ΣJ₂(S¹): the smash model gives S²∨S³ (H₂ rank 1), the Cartesian model gives S²∨S²∨S²∨S³ (rank 3), and the full Cartesian wedge has infinite H₂ rank.

## Verified sound

**Gate and build.** A fresh run of the push gate at this head returned:

```text
gate HomotopySpheres: set_option=0 blob=0 latex=0 tex=0 prnum=0 sorry-data=0 sorry-examples=0 residue=0 private-paths=0 imports=0 mathlib-subimports=0 no-import-mathlib=0 lean-lines=0 statement-hygiene=0 forbidden=0 dropped=0 readme-ids-missing=0 empty-sections=0 round-labels=0 long-fences=0 layer-ids=0 target-ids=0 depcheck=0 metadata=0 stray-files=0 dirty=0 outside-folder=0 source-material=0 OK
```

The worker's gate also records build=0. Direct `lake env lean` on `TauCetiRoadmap/HomotopySpheres/Suggested.lean` gave exactly 15 `declaration uses sorry` warnings and nothing else. The diff outside the folder is empty.

**Dependency direction.**

```text
depcheck: 239 roadmaps, 2366 edges, 0 problem(s)
```

There is no UPWARD or CYCLE line. Every *Needs:* line was read. Earlier suppliers resolved by name and section:

- On main: AlgebraicTopology Stage 4 items 4, 5, 6, 7; Stage 6 item 4; Stage 8 items 4, 5, 7; `homologicalWhitehead` and `compactManifoldFiniteCWType` (AlgebraicTopology `Suggested.lean`:1214 and :1155).
- On main: GeneralizedCohomology G2 items 4–5 (README:271, :302), G4.0a–b and G5.6; TopologicalKTheory T1.5a, T1.6c, T2.5, T4 item 8 (README:874) and T7; CharacteristicClasses C1.2b, C6 items 2–3 and C7.3; SpinRepresentations Layer 7 (README:881); SpinGeometry G4 and G6; RiemannianGeometry R3.3c; ComplexKahlerGeometry K7.1; MorseTheory M3/M5; HeegaardFloer Lanes M/F0; GeometricTopology Layer 1, Layer 5 (README:546) and the smoothing-and-triangulation item 1 (README:930).
- At their heads: TangentialBordism B1.1 (README:476), B1.2 (:633), B3.2(a–c) (:282, :2036, :2063), B5.2 (:1203) and gap:finite-quadratic-arf (:247); StringOrientation S2.2–S2.3; IndexTheory I7 items 2 and 5 (README:741, :867).

The downstream claim that TopologicalKTheory T7 consumes 4B holds (TopologicalKTheory README:103, :1222). The GeneralAlgebraicKTheoryPartII claim does not (R02).

**Lean form and signatures.** A scratch file ran `#check @` on all 18 declarations. Every elaborated type matches its README statement:

- Compactness, T2, second countability, `IsManifold (𝓡 6) ∞`, both `IsOrientedAtlas` hypotheses, `0 < n` and every stable-range bound are present.
- No binder was lost, and none of the three definitions depends on a section variable.

`TauCeti.IsOrientedAtlas` (`TauCeti/Geometry/Manifold/Orientation.lean:332–339`) requires maximal-atlas membership and cover. That excludes the would-be counterexample of two disjoint charts with opposite orientations, because M is connected (it is homotopy equivalent to S⁶). `orientationPreservingGroupoid` (:178) tests both directions (:165, :186). There is no `set_option`, no sorry'd data, a single `import Mathlib` plus one existing Tau Ceti module, and `theorem` only.

**Padding probe.** A scratch copy replaced every `sorry` with `first | rfl | simp | infer_instance | trivial | decide`. All 15 still failed (3 unsolved goals, 12 exhausted alternatives). None of them restates a definition or mirrors a Check, so there is no padding finding.

**Headline inventory.** The README's headlines are:

- the smooth h-cobordism theorem (R01: statable);
- Θₙ as a group and Θ₆ = 0 (needs connected sum, so not statable; the class content follows from recognition);
- stable stems as colimits, stable J and stable PT;
- James/EHP;
- the Hopf-invariant exclusion (cup product on a mapping cone is absent);
- Aₙ, Pₙ, Lₙ and the Kervaire–Milnor sequence;
- Θ₇ ≅ ℤ/28, Eells–Kuiper and the E₈ boundaries;
- the stated items: sphere framing, Bott periodicity plus the seven base entries, stems four through seven, and the two recognition theorems.

Apart from R01, the docstring's carrier reasons check out at the pins.

**Sources read this round, at the sampled locators.** Each source was fetched through the service, into a scratch manifest; no package manifest was edited.

| Target | Locator and finding |
| --- | --- |
| 1.1 | `milnor_hcobordism` line 2804, Definition 9.2, p.107: both ends are deformation retracts. The cofibration remark justifies the homotopy-equivalence form. |
| 1.2 | Lines 810/830–834 (3.13–3.15, pp.31–32), 1071 (4.8, p.44), 1182–1191 (5.4, p.48: a single transverse point gives a product), 2418–2424 (7.6, p.92: 2≤λ≤n−2, W connected). |
| 1.3 | Lines 2565–2569 (7.8, p.97: dim ≥ 6, no indices 0, 1, n−1, n in Milnor's dim-n convention, which is HS's 0, 1, n, n+1); 2613–2626 (8.1, p.100: index-one trading needs dim ≥ 5). |
| 1.5 | Lines 1841–1857 (6.6, p.71: r+s ≥ 5, s ≥ 3, π₁ injectivity only for r ≤ 2, M oriented, normal bundle of M′ oriented); 1860–1867 (remark, p.72); 2049–2062 (6.10–6.12, p.79). |
| 2.2–2.4 | `kervairemilnor1963` lines 25–26 (1.1, p.504), 70–72 (2.1, p.505), 78–107 (2.2), 108–136 (2.3–2.4), 137–147. These are the basis of R04 and R06. |
| 8.4 | `browder1969` line 218 (1.4, p.162), 393–395 (3.2, p.166, q odd, B⟨v_(q+1)⟩), 464–469 (q = 1, 3, 7 omitted). 9.5 constructs the q = 3 comparison itself, so the roadmap does not depend on the omitted case. |
| 9.2 | `gray2001` lines 4834–4840 (2.1–2.2, p.132), 4843–4879 (2.3 and the fourth stem, pp.132–133), 4882–4888 (2.4, p.133). `kervairemilnor1963` lines 323–325 (p.512 table: Π₄ = Π₅ = 0, Π₆ = ℤ₂, Π₇ = ℤ₂₄₀). `fomenkofuchs2016` lines 13843–13845 (Corollary, p.387). |
| 9.3, 9.4 | The p.512 table gives ℤ₂ for stem 6 and ℤ₂, ℤ₂, ℤ₂₄, 0, 0, ℤ₂ for stems 1–6. Toda 5.11 is settled as uncertified. |
| 9.6, 9.7 | Internal: 8.3 together with π₅SO = π₆SO = 0, and 6C.2 for n = 6. |
| 3B.6 (new) | `hatcher2002` line 20117 (4I.1, p.467: CW X, Y, reduced join and cone collapse), 20146–20173 (4I.2, p.468: connected CW X, s_k, homology splitting, (n−1)-connected smash, Whitehead). These match 3B.6. |
| 10.4 | Lean, above. |

**Ownership.** Searches covered main, the board packages and the open heads (`roadmaps grep`), by object:

- Compact generation: AlgebraicTopology revisions (R05).
- James construction and splitting: GeneralAlgebraicKTheoryPartII (R02); no third owner. AlgebraicTopology #1663 README:135 and DGFloer README:187 treat HomotopySpheres 3B as the owner.
- Degree: R03.
- Mapping-cone and Puppe objects: unchanged, still single-owned.

On the overlaps file:

- #284 (the original proposal) conflicts with this head. The description states that this pull request carries #284's baseline, so the order is stated.
- Ids this pull request drops (3A.1, cited on main by AlgebraicTopology README:117, :567 and RiemannianGeometry README:120, and at DGFloerPartII #1799's head README:315) are mapped old → new at README:696–698. The target of that mapping is R05's.

**Adversarial table.** Each row gives the computed values on both sides.

| Statement | Instances tried | Values on each side | Result |
| --- | --- | --- | --- |
| 1.1 h-cobordism predicate | M×I; Dⁿ from ∅ | Retraction composites id, id; π₀(∅) = ∅ vs π₀(Dⁿ) = {*} | Pass; disc excluded |
| 1.1 disconnected ends | (M⊔N)×I | Boundary signs −,−,+,+; 4 components | Pass |
| 1.2 cancellation | Matrix [1] vs [2] | Relative homology (0,0) vs (0, ℤ/2) | Pass |
| 1.2 basis theorem | λ = 2, N = 6; λ = 1 | 2 ≤ 2 ≤ 4 holds; 2 ≤ 1 fails | Pass; λ = 1 goes to Theorem 8.1 |
| 1.3 trading | dim W = 6 (n = 5) | Removed indices 0, 1, 5, 6; kept 2, 3, 4; Milnor 7.8 needs dim ≥ 6 | Pass |
| 1.5 Whitney | (p,q) = (3,3), (2,3) | Milnor 6.6: 6 ≥ 5, s = 3, no π₁ condition; at r = 2 injectivity is required | Pass; (2,3) goes to 1.6 |
| 1.5 arcs | P = S³×{a} ⊔ −S³×{b}, Q = {c}×S³ | Signs +1, −1; no arc in P | Excluded correctly |
| 1.7 / R01 statement | W = S⁵×[0,1], M₀ = S⁵×0 | n = 5 ≥ 5; both inclusions homotopy equivalences; f = id; scratch elaboration passes | Statable; R01 |
| 2.2 sphere identity | Sⁿ#Σ | [Sⁿ] + [Σ] = [Σ] (Lemma 2.1) | Pass |
| 2.2 descent | n = 3; n = 2 | n = 3: M−p and W−A simply connected, Lemma 2.2 applies; n = 2: proof assumes n ≥ 3 | R06 |
| 2.3 literal route | Σ = Sⁿ, n ≥ 2 | (Sⁿ×I − B) ∪ 1-handle ≃ Sⁿ∨Sⁿ∨S¹, π₁ = ℤ | Fails; R04 |
| 2.3 source route | Σ = Sⁿ | (Sⁿ − D)×I ≅ Dⁿ×I contractible; minus a ball ≅ Sⁿ×I, an h-cobordism | Pass; R04 repair |
| 2.4 Θₙ ⇔ diffeomorphism | n = 5; n = 4 | h-cobordism dimension 6 ≥ 6 holds (Milnor 9.1, 9.2); 5 ≥ 6 fails | Pass |
| 3A.3 stable range | (n,k) = (8,6), (7,6) | 14 ≤ 14 holds; 13 ≤ 12 fails | Pass |
| 3A / R05 item 8 | ΣS⁰ (#1663 Check) | ΣS⁰ = S¹; [S¹, S¹]_* = ℤ = [S⁰, ΩS¹]_* | Pass at #1663; absent on main |
| 3B.6 product splitting | X = Y = S¹ | Σ(T²) ≃ S²∨S²∨S³ on both sides; H₂ rank 2 + H₃ rank 1 | Pass |
| 3B.6 James splitting | X = S¹; X = S⁰ | H_k(ΩS²) = ℤ, k ≥ 1; π₀: ℕ vs ℤ | Pass; S⁰ excluded |
| 3B.6 Tor | X = M(ℤ/2,2) | H̃₅(X∧X) = Tor(ℤ/2,ℤ/2) = ℤ/2; X^∧3 is 5-connected | Pass |
| 3B.6 cup square | J₂(S²) | x² = ±2y vs 0 in S²∨S⁴ | Pass |
| 3B.6 Cartesian Check | n = 2, 3, ∞ | H₂ ranks 3, 6, ∞ vs smash 1 | R07 |
| 3B.6 naturality | f of degree 2 on S¹ | 2^k on S^(k+1) = 2^k on H_k(ΩS²) | Pass |
| 3C.5 divisibility | r = 1, 2, 3, 4, 6, 8 | ν₂(3^r − 1) = 1, 3, 1, 4, 3, 5 vs r | Pass exactly at 1, 2, 4 |
| 3C.5 Adams commutation | ψ²ψ³(x) vs ψ³ψ²(x) | 3^r(3^r−1)b₂ = 2^r(2^r−1)b₃ | Pass |
| 3C.4 Barratt–Toda | (η₂, ν₄) | Sign (−1)^(1·3) = −1; C = 0 + ν₅η₈ = Pι₁₁ (Gray, p.133) | Pass |
| sphere_parallelizable_iff | n = 0, 1, 2, 3, 7 | LHS true, true, false, true, true; RHS false, true, false, true, true | n = 0 excluded by hn; Pass |
| bottPeriodicity | (k,n) = (0,11), (7,18) | π₉O = ℤ/2 = π₁O; π₁₆O = ℤ/2 = π₈O; 9 ≤ 9, 16 ≤ 16 | Pass |
| second entry | n = 4; n = 3 | π₂O(4) = 0; π₂O(3) = 0 too (Lie group) | Pass; bound is the stable range |
| third entry | n = 5 vs 4 | π₃O(5) = ℤ vs π₃O(4) = ℤ² | Pass; sharp |
| fourth entry | n = 6 vs 5 | π₄O(6) = 0 vs π₄O(5) = ℤ/2 | Pass; sharp |
| fifth entry | n = 7 vs 6 | π₅O(7) = 0 vs π₅SO(6) = ℤ | Pass; sharp |
| sixth entry | n = 8 vs 4 | π₆O(8) = 0 vs π₆SO(4) = (ℤ/12)² | Pass |
| seventh entry | n = 9 vs 8 | π₇O(9) = ℤ vs π₇SO(8) = ℤ² | Pass; sharp |
| eighth entry | n = 10 vs 9 | π₈O(10) = ℤ/2 vs π₈SO(9) = (ℤ/2)² | Pass; sharp |
| fourth stem | n = 6 vs 5 | π₁₀S⁶ = 0 vs π₉S⁵ = ℤ/2 | Pass; sharp |
| fifth stem | n = 7 vs 6 | π₁₂S⁷ = 0 vs π₁₁S⁶ = ℤ | Pass; sharp |
| sixth stem | n = 8 | π₁₄S⁸ = ℤ/2; 14 = 2·8 − 2 | Pass |
| seventh stem | n = 9 vs 8 | π₁₆S⁹ = ℤ/240 vs π₁₅S⁸ = ℤ ⊕ ℤ/120 | Pass; sharp |
| 9.2 odd primes | (p,k) = (3,3), (3,4), (3,7), (5,6) | Orders 3, 1, 3, 1 (Fomenko–Fuchs, p.387) | Pass |
| 9.3 ν² | ν₄∘Σ³ν₄ | S¹⁰ → S⁷ → S⁴; order 2; reversed composite is ill-typed | Pass |
| 9.4 table | stems 0–6 | ℤ, ℤ/2, ℤ/2, ℤ/24, 0, 0, ℤ/2 = KM p.512 | Pass |
| 8.1 forgetting map | n = 7, J₇(1) shift; n = 6 | 1 mod 240 ↦ 0 in A₇ = 0; ν² ↦ 1 in A₆ = ℤ/2 | Pass |
| 8.4 Kervaire invariant | 0; H(q=0); one, two anisotropic planes | Arf 0, 0, 1, 0 | Pass |
| 9.6 A₆ | π₅SO = π₆SO = 0 | coker(0 → ℤ/2) = ℤ/2 | Pass |
| 9.7 Θ₆ | right map id vs 0 | ker size 1 vs 2; P₇ = 0 | Pass with id |
| 9A.2 Θ₇ | obstruction 240 | p₂ = ±1440, σ = ±224, σ/8 = ±28 | Pass |
| 9A.3 μ | −E₈; (h,j) = (2,−1), (1,0) | μ = 32/896 = 1/28; (36−4)/896 = 1/28; 0 | Pass |
| 9A.4 valuations | k = 2, 3, 4 | −360 ≡ 4 mod 7; v₂(992/63) = 5; v₂(2032/15) = 4 vs v₂(−8) = 3 | Pass |
| R03 point sign | one positive / reflected point | TangentialBordism σ = +1 / −1 = degree +1 / −1 | Repair passes |
| smoothPoincareSix_oriented | S⁶, A = B; A reflected | f = id, sign +1; f = reflection, (−1)(−1) = +1 | Pass |
| nonempty_diffeomorph_sphere_six | S⁶; ℝ⁶ | id; ℝ⁶ excluded (H₆ = 0, not compact) | Pass |

## Not verifiable

- `toda1962` (Lemma 5.4, Propositions 5.6, 5.8, 5.9 and 5.11, Chapter XIV): settled as uncertified; not reopened.
- `bott1959`, `wall1999`, `smale1961`, `james1955`, `steenrod1967`, `pontryagin1959`, `thom1954`, `whitehead1978`, `husemoller1994`, `hirsch1976`, `kosinski1993`, `adams1960`, `adamsatiyah1966`: none lies in this round's sample; they were not refetched.
- `fomenkofuchs2016`: the service fetch timed out after 100 s this round, so the passage was read from the service cache entry of the same author-page URL.
- Ownership against open pull requests whose files the brief did not supply was not checked beyond `roadmaps grep`.

## Source issues

- **Gap** in browder1969 at Theorem 3.2, proof, printed p.168: the source proves the Arf–Kervaire identification for odd q other than 1, 3, 7 and omits the details for q = 1, 3, 7; it should give that proof or cite one with locator; affects the proof.
