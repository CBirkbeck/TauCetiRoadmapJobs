# Review of HomotopySpheres (pull request #1287 at 29eac99)

**Verdict:** needs changes

This is a full review of `TauCetiRoadmap/HomotopySpheres/` at `29eac99`, the same head the previous review read. The folder has not changed. Main has moved from `3f7196b` to `623f5d6`. On 2026-11-09 it merged GeometricTopology #903 (`488fd41b`), which rewrote that roadmap. That merge does three things to this README:
- It resolves old R03.
- It makes several of this README's GeometricTopology citations wrong (R01, R02).
- Together with the head of TangentialBordism #942, it drops a supplier gap this README cites (R03).

Line numbers of other roadmaps refer to their README at the commit named.

## Previous findings

- **Old R01 (BordismFormalGroups owns the James construction and the Toda brackets): not repaired.** README:3187–3188 still reads "BordismFormalGroups consumes the James stages of 3B in F6.2 and the Toda brackets of 3C.3 in F4". The three open revisions still say "Own". Carried as R04.
- **Old R02 (#1742, #1799, #851 own objects this roadmap owns): not repaired.** All three are unchanged in substance. Carried as R05.
- **Old R03 (GeometricTopology §1.4 associativity defined only by #903): repaired, by main rather than by this head.** #903 merged as `488fd41b`. Main's GeometricTopology README:956 now reads "**Associativity** up to orientation-preserving diffeomorphism", inside §1.4 (:939). README:739–740 is thereby a citation of main.
- **Old R04 (branch pins differ from the pins the README is written against): not repaired.** `lake-manifest.json` still pins Tau Ceti `a91d3aa` and Mathlib `6b7abb3`. Carried as R08, with a longer witness.

## R01 (P2) — 1.2 restates GeometricTopology §1.3.1, which is now on main

**Location.** `TauCetiRoadmap/HomotopySpheres/README.md`:578 "From Morse functions on a compact cobordism, build a finite ordered handle decomposition"; :372–373 "the smooth product of Milnor's Theorem 3.4 is part of 1.2"; 2.2's *Needs* at :722–724, "Morse-number-zero product case (Milnor, Theorem 3.4, p.21…)".

**Claim.** This roadmap owns three objects that main's GeometricTopology now owns: Morse functions on a compact triad, the smooth product of a band without critical points (Milnor's Theorem 3.4), and the elementary handle step (Milnor's Theorem 3.13), iterated over the critical points. That gives each object two owners. GeometricTopology is on main, so it is the earlier owner.

**Witness.** In main's GeometricTopology §1.3.1 (`623f5d6`): README:898 is "**Existence**" of Morse functions on every triad. README:905 is "**Regular bands**": the band is diffeomorphic to `f⁻¹(a) × [a, b]`, identity on `f⁻¹(a)`. README:912 is "**The elementary handle step**".

**Repair.**
- In 1.2, consume GeometricTopology §1.3.1's Morse functions on triads, its regular-band product (Milnor, Theorem 3.4, p.21) and its elementary handle step (Milnor, Theorem 3.13, p.31).
- Keep in 1.2 only what main's GeometricTopology README:156–161 leaves to others: the ordered decomposition as a structure, reordering (Theorem 4.8), cancellation (Theorem 5.4), slides and basis change (Theorem 7.6), and the deformation retract with H_*(W,V) (Theorem 3.14, Corollary 3.15).
- At :372–373, write that the smooth form of `TauCeti.exists_bandHomeomorph` is GeometricTopology §1.3.1's regular-band theorem.
- In 2.2's *Needs* and in Layer 1's Dependencies (:699), cite §1.3.1. Add §1.3.1 to "From TauCetiRoadmap.GeometricTopology" (:391–398).
- Test on the instance at issue, 2.2's two-dimensional route. Once its critical points are cancelled, W has Morse number zero. Its product structure is then §1.3.1's regular band with [a,b] = [0,1], and 1.2 supplies only the cancellations.

## R02 (P2) — Four GeometricTopology citations no longer say what main's GeometricTopology says

**Location.**
- Scope, README:89–91: "general framed surgery and smooth triangulation".
- Supplier contract, :395–397: "Layer 5 supplies surgery on a framed embedded sphere in general dimension; the smoothing-and-triangulation comparison, item 1, supplies smooth triangulation".
- 7A.3 *Needs*, :2408, and 7A *Needs*, :2433: "GeometricTopology Layer 5 surgery".
- 2.1 *Needs*, :709, and Layer 2 Dependencies, :852: "the smoothing-and-triangulation comparison, item 1".
- 6B E₈ *Needs*, :2300: "GeometricTopology Layer 1 plumbing by handle gluing".
- "From Mathlib", :314–315 and :328–330, lists GeometricTopology, DifferentialGeometry, HeegaardFloer and AlgebraicTopology outputs as Mathlib carriers.

**Claim.** After #903, main's GeometricTopology Layer 5 is three-dimensional Dehn surgery. General-dimensional surgery on a framed sphere is only Tau Ceti's topological record `TauCeti.SphereSurgery`, which GeometricTopology consumes and does not plan. Plumbing is assigned to "GeometricTopology, Part II", which does not exist and comes later. The old section "The smoothing-and-triangulation comparison" is now Layer 11.3. As written, 7A.3's surgery operation and its trace, and 6B's plumbing input, have no owner.

**Witness.** Main GeometricTopology `623f5d6`:
- README:5893 is "## Layer 5: Dehn surgery".
- README:190 begins the "GeometricTopology, Part II" bullet; at README:211 that bullet owns "disc bundles, clutching, plumbing and intersection forms".
- README:776–778 maps "item 1 … → Layer 11.3".
- README:5960 consumes `TauCeti.SphereSurgery`, which is at main's pin `TauCeti/Topology/Surgery/Basic.lean`:189 and is a closed-embedding record without smooth structure.

**Repair.**
- (a) Scope, :91: say that GeometricTopology owns handle attachment (§1.3) and smooth triangulations (Layer 11.3). Say that the topological surgery record is Tau Ceti's `TauCeti.SphereSurgery`. Say that this roadmap owns the smooth surgered manifold as the outgoing boundary of the trace.
- (b) Supplier contract, :395–397: §1.3 supplies handle attachment along an embedding `S^(k−1) × D^(n−k) → ∂M`, hence surgery traces; Layer 11.3 supplies smooth triangulation.
- (c) 7A.3 and 7A *Needs* (:2408, :2433): replace "GeometricTopology Layer 5 surgery" by GeometricTopology §1.3 handle attachment and Tau Ceti `TauCeti.SphereSurgery`. Add to 7A.3 the target that the outgoing boundary of the trace is the surgered manifold.
- (d) :709 and :852: cite "GeometricTopology Layer 11.3".
- (e) :2300: cite GeometricTopology §1.3's face gluing with corners. Add to Scope and ownership that 6B owns the E₈ plumbing P⁴ᵏ for every k ≥ 1, so that GeometricTopology, Part II cites it rather than restating it.
- (f) Delete the non-Mathlib items from the "From Mathlib" list (:314–315, :328–330). Each is already stated in its own supplier paragraph.
- Test on the instance at issue: surgery on the unknotted framed S¹ ⊂ S⁵. GeometricTopology §1.3 attaches a 2-handle to S⁵ × [0,1] along S¹ × D⁴ ⊂ S⁵ × {1}, and the outgoing boundary is S² × S³. Main's Layer 5 concerns links in S³ and does not reach dimension five.

## R03 (P2) — `gap:finite-quadratic-arf` is cited as a supplier, but TangentialBordism at its head declares no such gap

**Location.**
- README:490–493: "Its declared gap:finite-quadratic-arf specifies the needed finite nonsingular quadratic algebra over 𝔽₂".
- :2537 and :2566 (7C.3 text); :2562, 7C.3 *Needs*, "TangentialBordism B3.2(a), gap:finite-quadratic-arf"; :2596.

**Claim.** The cited id is dropped at the open supplier's head. TangentialBordism at #942 (`7022ba9`) contains no `gap:` at all. Its B3.2(a) now consumes main's GeometricTopology §4.3.1 for the finite quadratic Arf algebra. So the contract this README describes does not exist where it is cited, and the algebra has a different owner.

**Witness.** TangentialBordism at #942, README:372 is "### 1.1 Arf interface for Spin surfaces (B3.2(a))". README:374–375: "Consume GeometricTopology Layer 4.3.1's finite nonsingular-F₂ quadratic Arf algebra". Main GeometricTopology README:2430 is §4.3.1, which states every item listed at :491–493.

**Repair.** At :490–493, :2537, :2562, :2566 and :2596, replace "TangentialBordism B3.2(a)'s (declared) gap:finite-quadratic-arf" by "GeometricTopology §4.3.1's finite quadratic Arf algebra". Keep "TangentialBordism B3.2(a)–(c)" only for the Spin-surface refinement and filling criterion, and add §4.3.1 to "From TauCetiRoadmap.GeometricTopology". Test: two anisotropic planes have Arf 1 + 1 = 0 and a q-zero Lagrangian. §4.3.1's own Check computes this, with 10 zeros = 2³ + 2¹.

## R04 (P2) — BordismFormalGroups at #1854, #1807 and #1808 still owns the James construction and the Toda brackets that 3B and 3C.3 own

**Location.** README 3B.1–3B.6 (:1018–1107), 3C.3 (:1203–1219), and :3187–3188, "BordismFormalGroups consumes the James stages of 3B in F6.2 and the Toda brackets of 3C.3 in F4".

**Claim.** Unchanged since the last review, and the description does not mention these pull requests. On main the sentence at :3187 is true: main's BordismFormalGroups README:331 and :668 consume this roadmap. Each open revision owns both objects and no longer mentions HomotopySpheres. If any of them merges, each object has two owners and :3187–3188 becomes false.

**Witness.** "Own the three-fold Toda brackets of pointed spaces" and "Own the James construction" appear at:
- BordismFormalGroups at #1854 (`f9b2a10`), README:1017 and :1564;
- #1807 (`cabeb14`), README:999 and :1509;
- #1808 (`b71fe82`), README:944 and :1475.

**Repair.** Keep this roadmap as the owner, as main has it. Record in the description that #1854, #1807 and #1808 must turn their "Own" sentences (F4, F6.2) into citations of 3C.3 and 3B before they merge. The alternative is a recorded human decision that moves ownership, with 3B.1–3B.3 and 3C.3 rewritten as citations.

## R05 (P2) — Three later open roadmaps own objects this roadmap owns

**Location.** README 3B.1–3B.4 (:1018–1059), 4A.1 (:1437), 4B.1–4B.8 (:1578–1692), 7B.2–7B.4 (:2446–2480).

**Claim.** Unchanged since the last review. All three roadmaps come after this one in `ORDER.txt`: HomotopySpheres is at 45, DGFloerPartII at 46, GeometryOfNumbersAndQuadraticArithmetic at 55 and GeneralAlgebraicKTheoryPartII at 333. Each still owns an object of this roadmap without citing it:
- GeneralAlgebraicKTheoryPartII (#1742, `ca44359`) owns J(W), its word filtration, the James map and J(W) ≃ ΩΣW. It cites only §3B.6.
- DGFloerPartII (#1799, `ba8a414`) owns stable O and real Bott periodicity.
- GeometryOfNumbersAndQuadraticArithmetic (#851, `3b084ef`) owns Wall's forms and formations and the quadratic L-groups of ℤ.

**Witness.**
- #1742 README:13: "The James reduced product with its word filtration and smash-power quotients, the James map and the connected James equivalence are owned here (§4.30b)".
- #1799 README:1330 is §4.2a, stable orthogonal groups; :1442 is §4.2c, real Bott periodicity. HomotopySpheres is mentioned 0 times.
- #851 README:23 covers formations and quadratic L-groups; :2718 is §6.8. HomotopySpheres is mentioned 0 times.

**Repair.** Name #1742, #1799 and #851 in the description as consumers whose sections must become citations before they merge:
- #1742's §4.30b becomes a citation of 3B.1–3B.4.
- #1799's §§4.2a–4.2c become citations of 4A.1 and 4B.1–4B.8.
- #851's §6.8 becomes a citation of 7B.2–7B.4.

The alternative is a recorded human decision for the reverse settlement.

## R06 (P3) — 9.7 cites Kervaire–Milnor §§4–6 for the quadratic refinement and the comparison with P₆; those are in §8

**Location.** README:2882: "Kervaire--Milnor, Sections 4--6, supplies the geometric refinement and the comparison with `P_6`". References entry :3249–3255 lists §§4–6 but not §§7–8.

**Claim.** In the cited text, §4 constructs bP and the Pontryagin–Thom classes, and §§5–6 are spherical modifications, which give bP₂ₖ₊₁ = 0. The quadratic function and the Arf invariant c(M) that compare coker J₆ with P₆ are in §8, "A cohomology operation".

**Witness.** In `kervairemilnor1963`: §8 starts at line 1011, on p.531. The Arf invariant c(M) is defined at line 1146, and Lemma 8.4 (c(M) = 0 lets framed modifications kill H_k M) is at line 1150, both on p.535. Theorem 5.1, the vanishing of bP₂ₖ₊₁, is at line 346, on p.512.

**Repair.** At :2882, write: "Kervaire–Milnor §§5–6, pp.512–526 (Theorem 5.1, p.512), give bP₇ = 0; §8, pp.531–537, defines the quadratic function and the Arf invariant c(M) (definition and Lemma 8.4, p.535), used for coker J₆ → P₆". Add "§§7–8, pp.526–537" to the References entry. Test on S³ × S³ with q(a) = q(b) = 1: c(M) = 1 by the p.535 definition, whereas §§4–6 contain no such invariant.

## R07 (P3) — 6A.3 and 8.1 attribute the almost-framed group to Kervaire–Milnor Part I, which does not define it; 8.1 has no locator

**Location.**
- README:2012: "Separately define the historical Kervaire--Milnor carrier: a closed oriented `n`-manifold with their stable normal frame field on the complement of one chosen top cell"; 6A.3's *Needs* at :2010 is "Kervaire–Milnor §§3–6".
- 8.1 (:2602–2612): "construct the always-defined forgetting homomorphism `π_n^S → A_n`", with no source.

**Claim.** Kervaire–Milnor Part I defines Θₙ, bPₙ₊₁ and the stable groups Πₙ. It has no almost-framed bordism group and no framings on the complement of a cell. Its framed manifolds in §6 carry a stable tangent framing on all of M. So the "historical" carrier and the forgetting map are cited to a text that does not contain them. 8.4 (:2652–2654) already says that the sequence of 8.2 for all almost-framed cycles is not Kervaire–Milnor's literal statement; 6A.3 and 8.1 need the same honesty.

**Witness.** In `kervairemilnor1963`, "almost parallelizable" occurs only at line 949 (p.529), quoting another paper. The framed-manifold definition at line 593 (p.519) trivializes the whole stable tangent bundle. Lemmas 4.2–4.5 (lines 257–307, pp.510–511) concern s-parallelizable manifolds only.

**Repair.**
- In 6A.3, replace "the historical Kervaire--Milnor carrier" by "the normal-frame model", and drop the attribution of the group to Kervaire–Milnor.
- In 8.1, either give the locator of a source that defines A_n and the forgetting map, or state, as 8.4 does for 8.2, that the map is a construction on 6A's carrier. In the latter case cite Kervaire–Milnor §4, Lemmas 4.2 and 4.5, pp.510–511, for the Pontryagin–Thom classes p(M, Φ) it starts from.
- Test: two framings of S⁷ that differ by J₇(1) form part of the coset p(S⁷) = im J₇ of Lemma 4.5 (p.511). Both forget to 0 in A₇, which is 8.1's own Check.

## R08 (P3) — The branch pins Tau Ceti `a91d3aa` and Mathlib `6b7abb3`; the README and the import are written against main's `2fd255d` and `1b1ccf4`

**Location.**
- `lake-manifest.json`, unchanged.
- README:332–389, "From Tau Ceti", and 2.2 (:719–741).
- `Suggested.lean`:2–3 and :9–11, the workaround import. `Suggested.lean`:38, "The pins have that connected sum".
- README:325 and :312.

**Claim.** Not repaired. The README paragraph names Tau Ceti declarations, with files and line numbers, that are absent at the pin this branch builds against. The Mathlib line numbers are main's.

**Witness.**
- At `a91d3aa`, a search of the pinned Tau Ceti finds none of `TauCeti.Manifold.Orientation`, `…IsOrientationPreservingAt`, `TauCeti.OrientedConnectedSum`, `TauCeti.degreeAtRegularValue`, `TauCeti.dense_isRegularValue` or `TauCeti.exists_bandHomeomorph`. `IsOrientedAtlas` is at `Geometry/Manifold/Orientation.lean`:332.
- In Mathlib, `padicValRat_bernoulli` is at line 689 at `6b7abb3`, against README's 696; `sSetTopAdj` is at line 73, against 74.
- All of these exist at main's pins: every README line was checked at `2fd255d` and `1b1ccf4`.

**Repair.** Unchanged. Merge main when rebasing, so that the manifest pins `2fd255d` and `1b1ccf4`, and rebuild. Then replace `Suggested.lean`:3 by `import TauCeti.Geometry.Manifold.Orientation.OrientedAtlas`, and delete the workaround sentence at :9–11. After the rebase, `Suggested.lean`:38 is true as written.

## Verified sound

**Gate and dependency check** (my runs at `29eac99`):

```text
gate HomotopySpheres: set_option=0 blob=0 latex=0 tex=0 prnum=0 sorry-data=0 sorry-examples=0 residue=0 private-paths=0 imports=0 mathlib-subimports=0 no-import-mathlib=0 lean-lines=0 statement-hygiene=0 forbidden=0 dropped=0 readme-ids-missing=0 empty-sections=0 round-labels=0 long-fences=0 layer-ids=0 target-ids=0 depcheck=0 metadata=0 stray-files=0 dirty=0 outside-folder=0 source-material=0 OK
depcheck: 236 roadmaps, 2281 edges, 0 problem(s)
```

- The worker's gate also reports `build=0`. The dependency check prints no UPWARD, CYCLE or `moved:` line.
- `git diff --stat origin/main...HEAD -- . ':!TauCetiRoadmap/HomotopySpheres'` is empty. The folder holds only `README.md`, `Suggested.lean` and `metadata.toml` (`topic = "math.GT"`).

**Elaboration, signatures, padding** (branch pins):
- `lake env lean` on `TauCetiRoadmap/HomotopySpheres/Suggested.lean` exits 0. Its only output is 16 `declaration uses 'sorry'` warnings, at lines 96–234.
- A scratch copy with `#check @name` for all 19 declarations exits 0. Every elaborated type carries its hypotheses in its own signature; the file has no section `variable` beyond `universe u`. Examples:
  - `[T2Space W] [CompactSpace W] [SimplyConnectedSpace W]`, `5 ≤ n` and `IsClosed ↑M₀` on `exists_diffeomorph_prod_Icc_of_hCobordism`;
  - `[T2Space M] [SecondCountableTopology M] [CompactSpace M] [IsManifold (𝓡 6) ∞ M]` on both recognition theorems;
  - `0 < n` on `sphere_parallelizable_iff`.

  Each of the 19 matches its README statement in generality: :650–661, :1336–1339, :1668–1670, :1679–1686, 9.2–9.3, 9A.1 and 10.4.
- One-tactic probe on a scratch copy: each of the 16 theorems, with `first | rfl | infer_instance | trivial | decide | (simp; done) | (norm_num; done) | (aesop; done)`, fails, 16 of 16. No declaration restates a definition, mirrors a Check or computes a small value.
- Headlines against the docstring:
  - Stated: the h-cobordism theorem; the parallelizable spheres; Bott periodicity and the entries for degrees 2–8; stems 4, 5, 6 and 7; oriented and unoriented recognition.
  - Named as not statable at the pins: Θₙ and Θ₆ = 0; stable stems, J and Pontryagin–Thom; James, EHP and splitting; Hopf invariant one; Aₙ, Pₙ, Lₙ and the Kervaire–Milnor sequence; Θ₇ and the E₈ results.
  - Claims checked at both pins: there is no topological suspension homomorphism on `HomotopyGroup`, no framed bordism, and no topological mapping cone with a Hopf invariant. The mapping cones found are chain-level ones.

**Library declarations opened.**
- Tau Ceti at main's pin `2fd255d`, 28 cited lines, each checked:
  - `Orientation/OrientedAtlas.lean`:129 and :283. The structure requires the atlas to cover M and to lie in the maximal atlas, so `smoothPoincareSix_oriented` is not vacuous.
  - `Orientation/Basic.lean`:32 and `Orientation/Preserving.lean`:63.
  - `Boundary/Charts.lean`:195, :321 and :374.
  - `ConnectedSum/Oriented.lean`:128, :143, :155, :160, :208, :222, :238 and :295; `ConnectedSum/Orientation.lean`:250.
  - `Sard/EqualDimension.lean`:105 and :112; `Degree/Basic.lean`:76; `Morse/Deformation.lean`:259.
  - `AlgebraicTopology/Sphere/SimplyConnected.lean`:408; `Topology/Homotopy/MappingCylinder.lean`:87 and :425.
  - `LowDimTopology/Plumbing/E8.lean`:63 and :199; `Plumbing/IntersectionForm.lean`:108.
  - Also opened: `Topology/Surgery/Basic.lean`:189 (`SphereSurgery`) and `Geometry/Manifold/PontryaginThom/Basic.lean` (collapse map). The latter is consistent with Layer 5, which constructs only comparisons with the supplied Pontryagin–Thom theorem.
- Mathlib at both pins: `Bernoulli.padicValRat_bernoulli`, with hypotheses prime p, 0 < k and p − 1 ∣ 2k, as 9A.4 states; `SingularSet.lean`'s `sSetTopAdj`; `CompactlyGeneratedSpace.lean`'s `TopologicalSpace.compactlyGenerated`; `PoincareConjecture.lean`:41.
- The Mathlib proposition `ContinuousMap.HomotopyEquiv.NonemptyDiffeomorphSphere` assumes only Hausdorffness. `nonempty_diffeomorph_sphere_six` adds compactness and second countability. Both follow from the other hypotheses: a connected 6-manifold with H₆ ≅ ℤ is compact, and a compact manifold is second countable. So the two statements are equivalent, and README:522–525 records the comparison.

**Cross-roadmap citations resolved today.**
- AlgebraicTopology on main: Stage 4 items 4, 5 and 7 (:535, :635, :817); Stage 6 item 4 (:1515); Stage 8 items 4, 5 and 7 (:1694, :1700, :1811).
- AlgebraicTopology at #1652 (`946a78a`, a newer head than the last review read): §4.8 is still "Compact generation and the pointed adjunction" (:1571), with the map "Stage 4 items 1–8 are §§4.1–4.8" (:725). The description names #1652.
- GeometricTopology on main: §1.4 (:939, :956); §1.3 (:851); §1.3.1 (:888); §4.3.1 (:2430); Layer 5 (:5893); Layer 11.3 (:7887). See R01–R03.
- TopologicalKTheory on main: T1.5a (:364), T1.6a–d, T2 item 5 (Adams operations), T4 item 8, T7 (:1517).
- CharacteristicClasses: C1.2b, C6 (:1731), C7 (:1817), C7.3.
- GeneralizedCohomology: G2 items 4–5 (:271, :302), G4.0a–b, G5 item 6 (:2212).
- SpinRepresentations Layer 7, real Clifford algebras (`RepresentationTheory/SpinRepresentations/README.md`:881), on main.
- DGFloer Layer 1 items 2 and 4 (main :470, :659). #1798 (draft) moves their ordinary content to AlgebraicTopology but keeps both item numbers and a forwarding map (#1798 README:160–177), so these citations resolve.
- MorseTheory M3 (:453) and M5 (:857); RiemannianGeometry R3.3c; ComplexKahlerGeometry K7.1; SpinGeometry G4 and G6; HeegaardFloer Lanes M and F0.
- DifferentialGeometry Layer 2 (:341, the oriented-atlas criterion), Layer 3 (:371) and 5.1 (:507, outward-first boundary orientation); Completed/UniversalCovers.
- TangentialBordism at #942: B1.1, B1.2, B1.6, B3.2(a)–(c), B4.1, B4.2, B4.7 and B5.2 all exist, but the gap does not (R03).
- StringOrientation at #948: S2.2 (:551) and S2.3 (:607). IndexTheory at #1077: I7.2 (:1371) and I7.5 (:1514).
- The open suppliers are earlier in `ORDER.txt`: IndexTheory 10, StringOrientation 11, TangentialBordism 14.
- Downstream consumers on main mention HomotopySpheres: GeneralizedCohomology 2, BordismFormalGroups 6, DGFloer 7, CharacteristicClasses 5, MorseTheory 2, GeometricCurrents 1, AlgebraicTopology 14, RiemannianGeometry 4, Orbifolds 3, TopologicalKTheory 7, PositiveScalarCurvature 21. These match :3173–3195.
- The overlap list (`scratch/overlaps.md`) names #284, which conflicts: its 1084-line README is the baseline this pull request extends, and the description says this pull request carries it forward.

**Ownership.** This roadmap is the earliest owner of:
- h-cobordism, the handle calculus and Whitney discs: GeometricTopology README:156–161 disclaims them, and FourManifolds owns only the proper five-dimensional variant;
- Θₙ;
- James, EHP and Toda (3B–3C);
- stable SO, Bott and J (4A–4C);
- Aₙ, Pₙ and the Wall comparisons (6–8);
- the low stems (9, 9A);
- six-dimensional recognition (10).

The exceptions are R01, where main owns the regular band, the elementary handle step and Morse functions on triads, and the later second owners in R04 and R05.

**Seeded sample** (15 targets; 13 sound, 2 with findings):
- 1.2, `milnor_hcobordism` (printed page = PDF page − 5; line 1804 prints "70" on PDF page 75):
  - Theorem 3.13 at line 810 (p.31); Theorem 3.14 and Corollary 3.15 at lines 830–834 (p.32);
  - Theorem 4.8 at line 1071 (p.44); Theorem 5.4 at line 1182 (p.48);
  - Theorem 7.6 at line 2418 (p.92), proof ending at line 2564 (p.97), with hypothesis 2 ≤ λ ≤ n−2 and W connected.
- 1.3: Theorem 7.8 at line 2565 (p.97); Theorem 8.1 at line 2613 (p.100).
- 1.4: Theorem 6.6 at line 1841 (p.71); the local-model isotopy at lines 1897–1938 (pp.73–74), inside the cited pp.71–76.
- 1.5–1.6: Theorem 6.6's hypotheses r + s ≥ 5 and s ≥ 3, with π₁(V − M′) → π₁(V) injective when r = 1, 2 (lines 1847–1848). The remark for connected M, M′ is at lines 1860–1867 (p.72). The λ = 2 case of 6.4's proof is at lines 1885–1896 (pp.72–73). §7 starts at line 2187 (p.84), so "proof, pp.73–84" is exact.
- 1.7: Theorem 9.1 at line 2784 (p.107). Definition 9.2 and its remark are at lines 2804–2823 (pp.107–108). The duality remark after Theorem 9.1 is at lines 2791–2794 (p.107).
- 2.3–2.4, `kervairemilnor1963` (printed page = PDF page + 503): Theorem 1.1 at line 25 (p.504); Lemmas 2.1 and 2.2 at lines 70–107 (pp.505–506); Lemma 2.3 at lines 108–124 (pp.506–507); Lemma 2.4 at lines 125–136 (p.507). The half-disc gluing in 2.3 matches line 131. Θ₁ = Θ₂ = 0 is on p.507 (lines 142–144).
- 5.0b: in `hatcher_at`, Examples 4.45 and 4.46 at lines 16405 and 16424 (pp.377–378). In `atiyah1971`, Proposition (4.1) at line 419 and Theorem 3′ at line 432, both on p.58.
- 8.1: R07.
- 9.1: in `hatcher_at`, Corollary 4J.4 at line 20409 (p.474). The derivation of π_(n+2)(Sⁿ) ≅ ℤ/2 via Proposition 4L.11 is at lines 20438–20445 (p.475).
- 9.6: π₅SO = π₆SO = 0, so A₆ ≅ coker J₆ = π₆ˢ. The p.512 table, at lines 323–327, gives Π₆ = Π₆/p(S⁶) = ℤ₂.
- 9.7: the mathematics holds (P₇ → Θ₆ → ℤ/2 ≅ ℤ/2, so Θ₆ = 0, and p.504 lists |Θ₆| = 1). The locator is R06.
- 10.1: a construction from DifferentialGeometry Layer 2 and AlgebraicTopology Stage 6; there is no external claim.
- 10.2: Kervaire–Milnor §2, pp.505–507, and Milnor, Theorem 9.1, p.107.
- 10.3: an internal construction.
- 10.4, outside the sample: Proposition B at line 2847 (p.109). Its proof uses Kervaire–Milnor–Wall and Proposition A at lines 2892–2898 (p.110).
- Also checked:
  - `hatcher_at`: Proposition 4.13 with the uniqueness argument before it at lines 15335–15378 (pp.352–353); the Toda bracket at line 16802 (p.387); Exercise 39 at line 17033 (p.392); Propositions 4I.1 and 4I.2 at lines 20117 and 20146 (pp.467–468); Proposition A.19 at line 23328 (pp.537–538).
  - `hatcher_vbkt`: Theorem 2.16(b) at line 2326 (p.59); the frames on S¹, S³ and S⁷ at lines 196–206 (p.5); the K̃O table at lines 101–102 (p.1); Proposition 1.14 at line 988 (p.25).
  - `kervairemilnor1963`: Theorem 3.1 at line 172 (p.508); Lemmas 4.2–4.5 at lines 257–307 (pp.510–511); the Remarks and table at lines 316–327 (p.512).

**Adversarial table.**

| Statement | Instances | Values computed | Result |
| --- | --- | --- | --- |
| `exists_diffeomorph_prod_Icc_of_hCobordism` | W = S⁵×I with M₀ = S⁵×0; D⁶ with M₀ = S⁵; (S⁵×I) minus a ball; n = 4 | H₅: ℤ→ℤ at both ends, f = id; M₁ = ∅ fails h₁ since π₀(∅) = ∅ ≠ {*}; H₅: ℤ→ℤ² fails h₀; excluded by `5 ≤ n` | Pass |
| 1.2 Milnor 3.13–3.15, 5.4, 7.6 | one index-0 point on Dⁿ; slide range at N = 6 | H_*(Dⁿ, ∅) = ℤ in degree 0; λ ∈ {2,3,4}, with λ = 1 left to Theorem 8.1 | Pass (duplication: R01) |
| 1.3 trading | n+1 = 6 | remove indices 0, 1, 5, 6, leaving 2–4 | Pass |
| 1.4 Whitney move | opposite pair (+1, −1) | count 2 → 0, signed sum 0 → 0 | Pass |
| 1.6 level five | (r, s) = (2, 3) in V⁵ | r+s = 5 ≥ 5, s = 3 ≥ 3, r = 2 needs π₁-injectivity; attaching circle has codimension 4 | Pass |
| 2.3 inverse h-cobordism | Σ = Sⁿ; the one-handle model | V = D^(n+1), W = Sⁿ×I, H_n ℤ→ℤ; the one-handle model has π₁ = ℤ and H_n = ℤ² | Pass |
| 2.4 Θₙ and n ≥ 5 comparison | n = 6, 7 | orders 1 and 28 (p.504); for n = 7, [Σ] ≠ [−Σ] since 28 ∤ 2 | Pass |
| 5.0b offsets | c = 1, 2, 3, 4; Lie torus | π₃S¹ = 0, π₃S² = ℤ, π₄S³ = ℤ/2, π₆S⁴ = ℤ/2; Arf = 1·1 = 1, two tori 1+1 = 0; Whitney bound 7 = 2·3+1; S⁴ 3-connected, S³ 2-connected | Pass |
| 8.1 forgetting map | n = 7; n = 6 | J₇(1) ↦ 1 mod 240 in π₇ˢ, both images 0 in A₇; ν² ↦ nonzero in A₆ | math Pass; source R07 |
| 8.2 and 8.3 obstruction | n = 5…12 | π_(n−1)SO = 0 at n = 5, 6, 7, 11; ℤ at 8, 12; ℤ/2 at 9, 10, which matches n ≡ 3, 5, 6, 7 mod 8 | Pass |
| 9.1 first stems | k = 1, 2 | ℤ/2 (p.474), ℤ/2 (p.475) | Pass |
| 9.2 odd-primary gap | (p, k) = (3, 3…7), (5, 7), (5, 15) | 3-parts: ℤ/3, 0, 0, 0, ℤ/3; 5-parts: ℤ/5 at 7 and at 15 (480 = 2⁵·3·5) | Pass |
| 9.6 A₆ | n = 6 | π₅SO = π₆SO = 0, so A₆ = coker J₆ = ℤ/2 | Pass |
| 9.7 Θ₆ = 0 | exact segment | 0 → Θ₆ → ℤ/2 →(1↦1) ℤ/2 gives Θ₆ = 0 | math Pass; locator R06 |
| 10.1–10.3 | M = S⁶; reflected e | H₆ = ℤ, π₁ = 0; sign (−1)(−1) = +1 | Pass |
| `sphere_parallelizable_iff` | n = 0, 1, 2, 3, 7, 15 | n = 0: left side true (empty frame), right side false, so excluded; 1, 3, 7: both true; 2, 15: both false | Pass |
| 3C.5 exclusion | r = 1, 2, 3, 4, 6 | ν₂(3^r−1) = 1, 3, 1, 4, 3, so 2^r ∣ 3^r−1 only for r = 1, 2, 4; ψ²ψ³ = ψ³ψ² gives 2^r(2^r−1)b₃ = 3^r(3^r−1)b₂ | Pass |
| 3C.5 Clifford frames | Cl₀,₁, Cl₀,₃, Cl₀,₇ | ℂ, ℍ×ℍ, M₈(ℝ)², modules ℝ², ℝ⁴, ℝ⁸; skew-adjoint and A² = −I give ⟨x, Ax⟩ = 0 and ‖Ax‖ = 1 | Pass |
| `nonempty_orthogonalGroup_bottPeriodicity` | (k, n) = (0, 11), (3, 14), (6, 17) | ℤ/2 ≅ ℤ/2; 0 ≅ 0; ℤ ≅ ℤ | Pass |
| π₂…π₈ of O(n) | n = 4, …, 10; n = 4 at degree 3, n = 8 at degree 7 | 0, ℤ, 0, 0, 0, ℤ, ℤ/2; π₃SO(4) = ℤ², π₇SO(8) = ℤ², both excluded | Pass |
| stems 4–7 | n = 6, 7, 8, 9; n − 1 | π₁₀S⁶ = 0, π₁₂S⁷ = 0, π₁₄S⁸ = ℤ/2, π₁₆S⁹ = ℤ/240; π₉S⁵ = ℤ/2, π₁₁S⁶ = ℤ, π₁₅S⁸ = ℤ⊕ℤ/120, all excluded | Pass |
| `smoothPoincareSix_oriented`, `PreservesOrientedAtlases` | S⁶ with A = B; reflected atlas; S³×S³; CP³ | identity transition det +1; reflection −1, so compose; H₃ = ℤ² and H₂ = ℤ fail the hypothesis | Pass |
| 9A.2–9A.4 | z = 1; −E₈; (h, j) = (2, −1); k = 3, 4 | p₂ = 6·240 = 1440, σ = 7·1440/45 = 224; μ = 8/224 = 32/896 = 1/28 both ways; d₃ = 992/63 (v₂ = 5), d₄ = 2032/15 (v₂ = 4) | Pass |
| R02 test: framed surgery | unknotted S¹ ⊂ S⁵ | trace S⁵×I ∪ 2-handle, outgoing boundary S²×S³; main's GeometricTopology Layer 5 covers links in S³ only | Fail as cited |
| R03 test: Arf algebra | two anisotropic planes | Arf 0, Gauss sum 4, 10 zeros; owned by GeometricTopology §4.3.1, gap absent at #942 | Fail as cited |

## Not verifiable

- **Bott 1959**, pp.313–315 and 333–336, cited for 4B.6–4B.8 and the λ table: JSTOR only. The six λ formulas are internally consistent with their Checks (r = 1, 2, 8), but not checked against the source.
- **Toda 1962**, which the README marks uncertified; **Gray 2001**; **Fomenko–Fuchs 2016**: paywalled or print only.
- **Browder 1969**, Theorems 1.4 and 3.2: JSTOR only.
- **Milnor, *Topology from the Differentiable Viewpoint*** (§7); **Adams–Atiyah 1966**; **Wall 1999**; **Milnor, *Morse Theory***; **Smale 1961**; **James 1955**: no legal copy found.
- **Elaboration at main's pins**: Lean runs only in this worktree, which pins `a91d3aa`. The Tau Ceti declarations were read at `2fd255d` in the content checkout but not compiled there.

## Source issues

- none
