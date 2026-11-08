# Review of HomotopySpheres (pull request #1287 at bb91dff)

**Verdict:** needs changes

This is a full review at the head `bb91dff` that the previous review also read; the folder has not changed since. Eight findings follow, three of them at P2. Two of the P2 findings are new. Both concern AlgebraicTopology and BordismFormalGroups as they stand at the heads of other open pull requests. Line numbers of other roadmaps are README lines at the head named.

## R01 (P2) — The AlgebraicTopology citations resolve at no single AlgebraicTopology head

**Location.** `TauCetiRoadmap/HomotopySpheres/README.md`:
- 116, 444 and 1788: "Stage 4 item 4's `basedSphereReferenceGenerator`".
- 75, 432, 717, 748, 773, 788, 850 and 1068: `homologicalWhitehead`.
- 76 and 433: `compactManifoldFiniteCWType`.
- 29 lines (127, 145, 209, 309, 323, 434, 862, 870, …, 3167): "AlgebraicTopology Stage 4 item 8, *Compact generation and the pointed adjunction*".

**Claim.** This finding extends the AlgebraicTopology half of the previous R03 and is raised to P2. Each of the four AlgebraicTopology texts lacks part of what this README cites:

| Text | Stage 4 item 8 (compact generation) | `homologicalWhitehead` and `compactManifoldFiniteCWType` | `basedSphereReferenceGenerator` |
| --- | --- | --- | --- |
| Main | absent; main assigns compact generation to "HomotopySpheres §3A.1" | absent | present |
| #1652 | present | present | the object is kept but the name is dropped |
| #1663 | present | present | the name is dropped |
| #1854 | moved to Stage 4 item 5; item 8 is a different object | present | the name is dropped |

Under the overlap rules, a supplier id that an open pull request drops or renumbers is P2. Here that applies to `basedSphereReferenceGenerator` (dropped at three heads) and to Stage 4 item 8 (renumbered at #1854). The description's merge-order paragraph names no AlgebraicTopology revision.

**Witness.**
- Main AlgebraicTopology README:597 names `basedSphereReferenceGenerator`, and `grep homologicalWhitehead` finds nothing on main.
- The generator is unnamed at #1652 README:1009, at #1663 README:770 and at #1854 README:802.
- At #1854, README:1110 makes item 8 "Connected maps, weak equivalences and CW approximation", and README:139 says "Stage 4.5 owns the compact-generation interface".

**Repair.**
1. In the README, cite the three named objects by item and by object, without the backticked names:
   - "AlgebraicTopology Stage 4 item 4's based sphere reference generator of `H_n(Sⁿ,{p};ℤ)`";
   - "Stage 8 item 5's homological Whitehead theorem";
   - "Stage 8 item 7's finite CW type of compact smooth manifolds".

   I tested these phrases. Each resolves on main (README:597, :1700–1702 and :1811–1815), at #1652 (§4.4 :1009, §8.5 :2768, §8.7 :2923) and at #1663 and #1854. For #1854 that is :802, :2321 and :2438.
2. In the description's merge-order paragraph, name the AlgebraicTopology revision whose Stage 4 item 8 this roadmap consumes (#1652 or #1663) as merging first.
3. State whether #1854 is rebased onto that numbering. Otherwise all 29 citations of "Stage 4 item 8" point at #1854's connected-maps item.

## R02 (P2) — Open #1854 gives BordismFormalGroups the James construction and Toda brackets that 3B and 3C.3 own

**Location.** README:987–1164 (3B.1–3B.6, the James construction proof spine) and :1199–1215 (3C.3, Toda brackets). README:3150–3151: "BordismFormalGroups consumes the James stages of 3B and the Toda brackets of 3C.3".

**Claim.** The two roadmaps hand the same objects to each other, so the objects have no single owner. That is P2.
- **At #1854.** #1854 (not a draft; "Cut the dependency loops main acquired after the pin bump") rewrites BordismFormalGroups, which is on main. It makes BordismFormalGroups the owner of the reduced product `J(Y)`, its word filtration, the James map with its weak equivalence, and three-fold Toda brackets of pointed spaces. It also says that HomotopySpheres consumes them.
- **In this README.** This roadmap owns the same objects in 3B.1–3B.4 and 3C.3, and lists BordismFormalGroups as their consumer.
- **Draft #1807.** Its BordismFormalGroups has the same "Own the James construction" sentence.

**Witness.** BordismFormalGroups at #1854 (`1ccc517`):
- README:31–35: "This roadmap owns … the three-fold Toda brackets of pointed spaces and the James construction".
- README:40–41: "HomotopySpheres consumes F4's Toda brackets and F6.2's James construction".
- README:514 owns the Toda brackets and README:868 the James construction.

**Repair.** Settle one owner and record it in the description. There are two choices.
- **BordismFormalGroups owns.** #1854 merges first, and the description names it. Then:
  - 3B.1–3B.3 (reduced words, word filtration, the James map with its field computation) and 3C.3 cite BordismFormalGroups F6.2 and F4;
  - 3B.4–3B.6, 3C.1–3C.2 and 3C.4 stay here;
  - README:3150–3151 is rewritten.
- **This roadmap owns.** #1854 drops those sentences of F4 and F6.2 and cites 3B and 3C.3, as main's BordismFormalGroups does today.

Either choice leaves exactly one of BordismFormalGroups README:868 ("Own the James construction") or HomotopySpheres 3B.1 claiming the reduced product.

## R03 (P2) — Three later open roadmaps still own objects this roadmap owns

**Location.** README 3B.1 and 3B.6 (the James reduced product and the stable James splitting). README 4A.1 and 4B.1–4B.8 (stable `O`/`SO`, real Bott periodicity). README 7B.2–7B.4 (Wall forms and formations, `L_n(ℤ)`).

**Claim.** This is the previous R02, not repaired. The folder and the ownership text of the description are unchanged. Each of the three roadmaps comes after HomotopySpheres in `ORDER.txt` (positions 46, 52 and 331, against 45), cites no HomotopySpheres section, and still owns the same objects:
- **GeneralAlgebraicKTheoryPartII** (#1742, `3f10248`): `### 4.30b The James reduced product` at README:1208 and `### 4.30c The stable James splitting` at README:1243.
- **DGFloerPartII** (#1799, head now `aeddaae`): README:21–23 builds "the stable orthogonal groups with real Bott periodicity". Its 4.2a–4.2c are at README:1310, :1364 and :1422.
- **GeometryOfNumbersAndQuadraticArithmetic** (#851, head now `5180edf`): README:104 says "The Wall form and formation groups of §6.8 with their calculations are specified with the integral L-theory they feed". `### 6.8 Formations` is at README:2713.

**Witness.** `grep -c HomotopySpheres` returns 0 in each of the three READMEs at the heads above.

**Repair.** Unchanged from the previous review. The description names #1742, #1799 and #851 as consumers, which must replace these sections by citations:
- §§4.30b–c by 3B.1 and 3B.6;
- 4.2a–4.2c by 4A.1 and 4B.1–4B.8;
- §6.8 by 7B.2–7B.4.

The alternative is the reverse settlement, stated as a human's decision. DGFloerPartII's convenient category (README:21) should cite AlgebraicTopology's compact-generation item (R01), not this roadmap.

## R04 (P3) — GeometricTopology §1.4, as cited, exists only at #1797

**Location.** README:96, :391–394, :717, :728–733 and :848.

**Claim.** This is the GeometricTopology half of the previous R03, not repaired.
- **What the README cites.** §1.4 "consumes Tau Ceti's `TauCeti.ConnectedSum` and `TauCeti.OrientedConnectedSum`, proves that the native sum … is associative".
- **Main.** Main's GeometricTopology has no §1.4.
- **#903.** Its §1.4 (README:763) defines its own sum from ball embeddings and Layer 1.3 gluing, and never mentions `TauCeti.OrientedConnectedSum`.
- **#1797.** Only #1797's §1.4 is the cited one.

The merge-order paragraph names neither revision. It now reads "#1142 → #866 → #1077 → #948 → #942 → this pull request".

**Witness.** GeometricTopology at #1797 (`f925965`): `### 1.4 Connected sum` at README:708, and README:723 has "the oriented connected sum `TauCeti.OrientedConnectedSum oM oN`". GeometricTopology at #903 (`8bd9871`): README:763–772 builds the sum by gluing complements.

**Repair.** In the description's merge-order paragraph, name #1797 as merging before this pull request, and record that #903's §1.4 would need rebasing onto it. The README needs no edit.

## R05 (P3) — The branch pins Tau Ceti `a91d3aa` and Mathlib `6b7abb3`, but the README is written against main's `2fd255d` and `1b1ccf4`

**Location.**
- `lake-manifest.json`, which this pull request does not change.
- README:331–388, the Tau Ceti contract.
- README:311, :321 and :324, the Mathlib line numbers.
- `Suggested.lean`:37–38: "The pins have that connected sum".

**Claim.** This is the previous R01, not repaired. At the branch pin, `Orientation/OrientedAtlas.lean`, `Orientation/Basic.lean`, `Orientation/Preserving.lean`, `ConnectedSum/`, `Sard/`, `Degree/` and `Morse/Deformation.lean` do not exist. The Mathlib line numbers are also those of `1b1ccf4`. It stays P3, because the merge takes main's pins.

**Witness.**
- At `a91d3aa`, `grep "def OrientedConnectedSum\|IsOrientationPreservingAt\|dense_isRegularValue"` finds nothing.
- At `6b7abb3`, the README's Mathlib lines are off:
  - `padicValRat_bernoulli` is at line 689, not 696;
  - `SSet.toTop` and `sSetTopAdj` are at 65 and 73, not 66 and 74;
  - `TopologicalSpace.compactlyGenerated` is at 67, not 68.
- At `1b1ccf4` and `2fd255d` every number matches.

**Repair.**
1. At the worker's rebase, merge main so that `lake-manifest.json` pins `2fd255d` and `1b1ccf4`.
2. Rebuild `TauCetiRoadmap.HomotopySpheres.Suggested`.
3. Replace `Suggested.lean`:3 by `import TauCeti.Geometry.Manifold.Orientation.OrientedAtlas` and delete the workaround sentence at :9–11.

I tested this at main's pin: `OrientedAtlas.lean`:129 and :283 declare `orientationPreservingGroupoid` and `IsOrientedAtlas`.

## R06 (P3) — 9.4 is a documentation instruction, not a target

**Location.** README:2793–2799: "Record the chain as one compatible table … the table itself is generated documentation, not proof input."

**Claim.** 9.4 states neither a theorem nor a definition. It has no hypotheses and no locator, and "generated documentation" is an implementation instruction, not mathematics. No roadmap on main cites HomotopySpheres 9.4.

**Witness.** The seeded sample asks for 9.4's theorem, page and hypotheses. The section supplies none of the three.

**Repair.** Restate 9.4 as a theorem. For `0 ≤ k ≤ 6` and `n ≥ k+2`, `π_(n+k)(Sⁿ)` is:

| k | 0 | 1 | 2 | 3 | 4 | 5 | 6 |
| --- | --- | --- | --- | --- | --- | --- | --- |
| `π_(n+k)(Sⁿ)` | `ℤ{ι}` | `ℤ/2{η}` | `ℤ/2{η²}` | `ℤ/24{ν}` | 0 | 0 | `ℤ/2{ν²}` |

The suspensions in that range carry each named generator to the next. Locators: Kervaire–Milnor, p.512, table, for the orders; Toda, Chapter XIV, for the generators (uncertified). Delete the "generated documentation" sentence.

I tested the statement at `n = k+2`:
- the values are `π₂(S²)=ℤ`, `π₄(S³)=ℤ/2`, `π₆(S⁴)=ℤ/2`, `π₈(S⁵)=ℤ/24`, `π₁₀(S⁶)=0`, `π₁₂(S⁷)=0` and `π₁₄(S⁸)=ℤ/2`;
- for `k = 1, …, 6` these agree with `kervairemilnor1963` lines 323–325 (Πₖ = ℤ/2, ℤ/2, ℤ/24, 0, 0, ℤ/2).

Alternatively, delete 9.4, since 9.1–9.3 already compute the groups.

## R07 (P3) — Internal references name sections that do not exist

**Location.**
- README:2806: "the normalization of `ν` fixed in Steps 1 and 3".
- "Stage k" for this roadmap's own Layer k: 29 README lines (e.g. 133, 139, 143, 1793, 2205, 2502, 2625, 2808, 2813, 2829, 2837, 3081, 3176–3179) and 18 `Suggested.lean` lines (e.g. :15, :17, :36, :42, :127).

**Claim.**
- **"Steps 1 and 3".** The README has no Steps. 9.1 fixes the sign of ν (README:2707–2708) and 9.3 fixes ν² (README:2782–2785).
- **"Stage k".** The headings are "Layer k". "How to read the build" (README:532–533) defines only the identifiers 3A–3C, 4A–4C, 5.0, 5.0b, 6A–6C and 7A–7C, so "Stage 6B" or "Stage 10" is undefined vocabulary. Main roadmaps cite this roadmap that way: RiemannianGeometry README:165 has "HomotopySpheres Stage 4B" and DGFloer has "HomotopySpheres Stage 4A–4B".

**Witness.** `grep -n "Step 1\|Steps 1" README.md` finds only line 2806. `grep "^## Stage" README.md` finds nothing.

**Repair.**
1. Replace "Steps 1 and 3" by "9.1 and 9.3".
2. Add one sentence to "How to read the build": "Stage k is Layer k, so Stage 4B is Section 4B." AlgebraicTopology at #1652 (README:581–583) uses the same convention.

With these, the main citations "HomotopySpheres Stage 4B" and "Stage 3A" resolve.

## R08 (P3) — Two headlines lack theorem locators, and four cited works are missing from References

**Location.**
- `Suggested.lean`:113–114: "(Adams, *On the non-existence of elements of Hopf invariant one*, 1960; Bott--Milnor and Kervaire, 1958; README Section 3C.5)".
- `Suggested.lean`:209–210: "(Kervaire--Milnor, …, 1963, `Θ₆ = 0`, with Smale's h-cobordism theorem …)".
- README:1377–1382, and References at README:3196–3251.

**Claim.**
- **`sphere_parallelizable_iff`.** No theorem or page is cited in either file. The docstring's three works appear nowhere in the README. README 3C.5 cites Adams–Atiyah by page range and Hatcher's *Vector Bundles and K-Theory* by section.
- **The two recognition headlines.** They cite `Θ₆ = 0` without a page.
- **References.** Four works cited in the text are missing: Adams–Atiyah 1966 (README:1377), Hatcher's *Vector Bundles and K-Theory* (README:1379, :1668, :1685), Ranicki's *Foundations of algebraic surgery* (README:2464) and Milnor's *Morse Theory* (README:1697).

**Witness.**
- `hatcher_vbkt` lines 2326–2330: Theorem 2.16(b), §2.3, p.59, says that `S^(n−1)` is parallelizable only for `n = 1, 2, 4, 8`.
- `milnor_hcobordism` lines 2847–2855 and 2897–2898: Proposition B, §9, p.109, gives the diffeomorphism to Sⁿ for `n = 5, 6`.

**Repair.**
1. Cite Hatcher, *Vector Bundles and K-Theory*, Theorem 2.16(b), p.59, in 3C.5 and in the docstring at `Suggested.lean`:113–114. Either drop Adams 1960, Bott–Milnor and Kervaire 1958, or add them with locators to References.
2. For `smoothPoincareSix_oriented` and `nonempty_diffeomorph_sphere_six`, cite:
   - Milnor, *Lectures on the h-Cobordism Theorem*, §9, Proposition B, p.109;
   - Kervaire–Milnor, p.504, where Θ₆ has order 1 (`kervairemilnor1963` lines 37–40).
3. Add Adams–Atiyah, Hatcher VBKT, Ranicki and Milnor's *Morse Theory* to References.

I tested this at n = 7: Hatcher's theorem with n = 8 gives S⁷, which matches the Lean disjunct `n = 7`.

## Previous findings

- **R01 (pins): not repaired.** `lake-manifest.json` still pins `a91d3aa` and `6b7abb3`, and the Mathlib line numbers are also off at that pin. Carried as R05.
- **R02 (three later owners): not repaired.** #1742 (`3f10248`), #1799 (now `aeddaae`) and #851 (now `5180edf`) still own the objects and cite no HomotopySpheres section. Carried as R03.
- **R03 (ids only open revisions define): not repaired, and extended.** The merge-order paragraph now reads "#1142 (AlgebraicKTheory) → #866 (OperatorKTheory) → #1077 (IndexTheory) → #948 (StringOrientation) → #942 (TangentialBordism) → **this pull request**". It names no AlgebraicTopology or GeometricTopology revision.
  - The AlgebraicTopology half is now R01, at P2. It newly covers `homologicalWhitehead` and `compactManifoldFiniteCWType`, which are not on main. It also covers `basedSphereReferenceGenerator`, which #1652, #1663 and #1854 drop, and #1854's renumbering of Stage 4.
  - The GeometricTopology half is now R04. It is narrowed to #1797, because #903's §1.4 is a different construction.

## Verified sound

**Gate, dependency check and diff outside the folder** (my runs at `bb91dff`):

```text
gate HomotopySpheres: set_option=0 blob=0 latex=0 tex=0 prnum=0 sorry-data=0 sorry-examples=0 residue=0 private-paths=0 imports=0 mathlib-subimports=0 no-import-mathlib=0 lean-lines=0 statement-hygiene=0 forbidden=0 dropped=0 readme-ids-missing=0 empty-sections=0 round-labels=0 long-fences=0 layer-ids=0 target-ids=0 depcheck=0 metadata=0 stray-files=0 dirty=0 outside-folder=0 source-material=0 OK
depcheck: 237 roadmaps, 2341 edges, 0 problem(s)
```

- No UPWARD or CYCLE line. The worker's gate records `build=0`.
- `git diff --stat origin/main...HEAD -- . ':!TauCetiRoadmap/HomotopySpheres'` is empty.
- Suppliers that are still pull requests come earlier in `ORDER.txt`: IndexTheory 10, StringOrientation 11, TangentialBordism 14, HomotopySpheres 45.

**Elaboration and signatures** (pin `a91d3aa`/`6b7abb3`).
- `lake env lean` on a scratch copy with `#check @name` for all 19 declarations, plus `NonemptyDiffeomorphSphere`, `IsOrientedAtlas` and `orientationPreservingGroupoid`, gave 16 `declaration uses sorry` warnings and nothing else.
- Every elaborated type equals `signatures.md` and its README statement, and no declaration lost a binder. The two pseudo-entries and the "line 233/237" errors in `signatures.md` come from the extractor reading docstring text.
- **Padding probe.** I replaced every `sorry` by `first | rfl | simp | infer_instance | trivial | decide | exact ⟨fun _ _ => Subsingleton.elim _ _⟩ | exact inferInstance`. All 16 still fail: 12 instance failures and 4 unsolved goals (probe lines 107, 120, 219 and 228). None is padding.

**Library declarations opened.**
- **At the branch pin `a91d3aa`:** `Orientation.lean`:178 and :332 (`orientationPreservingGroupoid`, `IsOrientedAtlas`). The atlas must lie in the maximal atlas, cover M, and have transitions in the groupoid. Also `Boundary/Charts.lean`:195, :321 and :374; `MappingCylinder.lean`:81; `E8.lean`:63 and :199; `IntersectionForm.lean`:108; and `RealForm/Basic.lean`:124, where `realCliffordWeight p q i = 1` for `i < p` and −1 otherwise.
- **At main's pins `2fd255d`/`1b1ccf4`:** every README line number of the Tau Ceti contract (`OrientedAtlas.lean`:129 and :283, `Basic.lean`:32, `Preserving.lean`:63, `Oriented.lean`:128, :143, :155, :160, :208, :222, :238 and :295, `ConnectedSum/Orientation.lean`:250, `EqualDimension.lean`:105 and :112, `Degree/Basic.lean`:76, `Deformation.lean`:259, `SimplyConnected.lean`:408, `MappingCylinder.lean`:87 and :425, `E8.lean`:52–55 for the edge relation) and of the Mathlib lines (`SingularSet.lean`:50, :66 and :74, `CompactlyGeneratedSpace.lean`:68, `Bernoulli.lean`:696, `PoincareConjecture.lean`:41).

**Cross-roadmap citations resolved.**
- **Main (`b3d628f`):**
  - AlgebraicTopology Stage 4 items 4–7 (:535, :635, :789, :817), Stage 6 item 4 (:1515), Stage 8 items 4, 5, 7 and 11b;
  - CharacteristicClasses C1.2b (:599), C6 items 2–3 (:1731+), and C7 items 1 and 3 with the sphere `x^⊥` adapter (:1855);
  - GeneralizedCohomology G2 (:211), G4.0a–G4.0b (:939–958) and G5 item 6 (:2212);
  - ComplexKahlerGeometry K7.1 (:1407);
  - RiemannianGeometry R1–R3, R3.3c (:538) and R3.4, the suspension range cited as "R3 item 4" (:556);
  - DifferentialGeometry Layers 2, 3 and 5.1 (:341, :371, :507);
  - HeegaardFloer Lane M (:217);
  - MorseTheory M3 and M5 (:453, :857);
  - TopologicalKTheory T1.5a (:364), T1.6a–T1.6d (:394, :561, :671, :721), T2 item 5, T3, T4 item 8 (:1094) and T7 (`c(a)=2u²`, `c(b)=u⁴` at :1646);
  - SpinRepresentations Layer 7 (:881), SpinGeometry G4 and G6, DGFloer Layer 1 items 2 and 4 (:470, :659);
  - GeometricTopology Layer 1, Layer 5 (general framed surgery, :546) and the smoothing comparison item 1 (:937).
- **Open heads:**
  - TangentialBordism #942 (`be5e94d`): B1.1, B1.2, B1.6, B3.2(a–c), B4.1, B4.2, B4.7 and B5.2. Its gap:finite-quadratic-arf has GeometricTopology as supplier.
  - StringOrientation #948: S2.2 and S2.3. IndexTheory #1077: I7.2 and I7.5.
- **Section-level order with TopologicalKTheory.** It is acyclic: T1.5–T1.6 → 4A–4B → T1.6d/T7 → 9A. TopologicalKTheory README:110–117 and :723 cite 4A–4B, and 4B uses no T7.
- **Downstream consumers.** On main, BordismFormalGroups, DGFloer, GeneralizedCohomology, CharacteristicClasses, MorseTheory, GeometricCurrents, RiemannianGeometry, Orbifolds and PositiveScalarCurvature cite this roadmap. FourManifolds (#936) cites 6B and 7A–7C.
- **The conflict with #284** has a stated order: this pull request carries #284's baseline.

**Sources at the sampled targets.** For `milnor_hcobordism`, printed page = PDF page − 5. For `kervairemilnor1963`, printed page = PDF page + 503.

| Target | Locator checked | Result |
| --- | --- | --- |
| 1.1 | Def. 9.2, line 2804, p.107 | both ends deformation retracts; matches |
| 1.2 | Thms 3.13–3.14 and Cor. 3.15 (lines 810–834, pp.31–32); Thm 4.8 (1071, p.44); Thm 5.4 (1182, p.48); Thm 7.6 (2418–2424, p.92, proof to p.97) | 7.6 assumes `2≤λ≤n−2` and W connected, as README:581–583 says |
| 1.3 | Thm 7.8 (2565, p.97): dim ≥ 6, no indices 0, 1, n−1, n; Thm 8.1 (2613, p.100) | matches total dimension n+1≥6 |
| 1.4 | Thm 6.6 (1841, p.71): `r+s≥5`, `s≥3`, π₁ condition for r = 1, 2; disc construction pp.73–76 | matches |
| 1.7 | Thm 9.1 (2784–2790, p.107); remark lines 2807–2823 (pp.107–108); duality remark 2791–2794 | matches the Lean hypotheses |
| 2.1 | no external locator; adapter targets | connectedness needs n≥1 (S⁰), simple connectivity n≥2 (S¹) |
| 2.2 | KM Lemmas 2.1–2.2 (lines 70–107, pp.505–506, n≥3 at line 80); Milnor Thm 3.4 (p.21); Thm 8.1 index 0 has no dimension bound (2614); twisted sphere (2875, p.110); KM p.507 Θ₁ = Θ₂ = 0 (142–144) | matches |
| 2.3 | KM Lemma 2.3 (108, p.506), Lemma 2.4 (125–136, p.507) | the gluing formula and duality match |
| 5.1 | Milnor, *Topology from the Differentiable Viewpoint*, §7 | not verifiable (below) |
| 8.4 | KM Lemmas 4.2–4.5 (257–307, pp.510–511), remarks on `im J` (316–322, p.512) | matches; Browder not verifiable |
| 9.2 | KM p.512 table (323–325): Π₄ = Π₅ = 0 | matches; Toda, Gray and Fomenko–Fuchs not verifiable |
| 9.4 | none | R06 |
| 9.5 | Snaith Ex. 8.3 (`snaith2010` line 1153–1154): Arf-one framings of S³×S³ exist | matches the README's reading |
| 10.1 | DifferentialGeometry Layer 2 (main :341), AlgebraicTopology Stage 6 | supplier sections exist |
| 10.3 | Milnor Thm 9.1 via 10.2; Prop. B, p.109, is the direct statement (R08) | matches |
| 3C.5 (headline) | Hatcher VBKT Thm 2.16, p.59 (`hatcher_vbkt` 2326–2330) | supports n ∈ {1, 3, 7} for n ≥ 1 |

**Adversarial table** (values computed on each side).

| Statement | Instances | Values | Result |
| --- | --- | --- | --- |
| `exists_diffeomorph_prod_Icc_of_hCobordism` | W = S⁵×I with M₀ = S⁵×0; W = D⁶ with M₀ = ∂D⁶; M₀ = ∅; (S⁵×I) minus a ball; n = 4 | id satisfies f(x,0) = x; H₅: ℤ→0 and ∅↛D⁶, so the hypotheses fail; W ≠ ∅ by simple connectivity, so ∅ ≄ W; ℤ→ℤ² fails; n = 4 is excluded by `hn` (5-dimensional smooth h-cobordisms need not be products) | Pass |
| `sphere_parallelizable_iff` | n = 0, 1, 2, 3, 7, 15 | n = 0: left side true (empty frame), right side false, excluded; n = 2: Euler number 2, both false; n = 1, 3, 7: frames from Cliff(0,1), (0,3), (0,7), both true; n = 15: both false | Pass |
| 3C.5 Clifford convention | `realCliffordForm 0 q` at the pin | weights −1, so `ι(e)² = −1`; residues 1, 3, 7 give ℂ, ℍ×ℍ, M₈(ℝ)×M₈(ℝ) (`Classification.lean`:79–94) | Pass |
| `nonempty_orthogonalGroup_bottPeriodicity` | (k,n) = (0,11), (3,14), (6,17) | ℤ/2 ≅ ℤ/2; 0 ≅ 0; ℤ ≅ ℤ; 9 ≤ 11−2 is equality | Pass |
| Bott entries in degrees 2–8 | n = 4, 5, 6, 7, 8, 9, 10 against n−1 | 0, ℤ, 0, 0, 0, ℤ, ℤ/2; at n−1: π₃SO(4) = ℤ², π₄SO(5) = ℤ/2, π₅SO(6) = ℤ, π₇SO(8) = ℤ², π₈SO(9) = (ℤ/2)², all false, so the bounds are needed (π₂ and π₆ also hold lower, which is the Bott-route range) | Pass |
| Fourth to seventh stems | n = 6, 7, 8, 9 against n−1 | π₁₀S⁶ = 0 vs π₉S⁵ = ℤ/2; π₁₂S⁷ = 0 vs π₁₁S⁶ = ℤ; π₁₄S⁸ = ℤ/2; π₁₆S⁹ = ℤ/240 vs π₁₅S⁸ = ℤ⊕ℤ/120 | Pass |
| `PreservesOrientedAtlases` | A = B on S⁶; B with x₀ ↦ −x₀; disjoint chart pair | id gives det > 0; against the reflected B, id gives −1 and r gives (−1)(−1) = +1; the empty transition lies in every groupoid | Pass |
| `smoothPoincareSix_oriented` and `nonempty_diffeomorph_sphere_six` | M = S⁶; S³×S³; CP³ | identity; H₃ ≠ 0 and H₂ = ℤ, so these are not homotopy equivalent to S⁶ (excluded) | Pass |
| 2.2 Euler count | Σ = S², T² | c₁ = (2−2)−0 = 0; c₁ = 2, so T² is excluded | Pass |
| 2.3 witness | Σ = Sⁿ | V = D^(n+1), W = Sⁿ×I; the one-handle model ≃ Sⁿ∨Sⁿ∨S¹ has π₁ = ℤ | Pass |
| 4B.6 rank table | r = 1, 2, 8 | 2,8,4,2,2; 2,6,12,6,3,3; 14,30,36,18,9,9 | Pass |
| 6B E₈ | edges of `TauCeti.e8Plumbing` (`E8.lean`:52–55) | 0–1 … 5–6 and 2–7; entries (2,7) = 1, (0,2) = 0, diagonal −2; det = 1; σ = −8 | Pass |
| 9A.4 | k = 2, 3, 4 | 7p₂ = −360 ≡ 4 mod 7; d₃ = 992/63 with v₂ = 5; d₄ = 2032/15 with v₂ = 4; v₂(−8) = 3 | Pass |
| 9.2 odd primes | (p,k) = (3,3), (3,4–6), (3,7), (5,7) | ℤ/3, 0, ℤ/3, ℤ/5, as in π₃ˢ = ℤ/24, π₆ˢ = ℤ/2, π₇ˢ = ℤ/240 | Pass |
| 8.4 Checks | hyperbolic plane; q(a) = q(b) = 1; two anisotropic planes | Arf 0; 1; 1+1 = 0 | Pass |
| 9.4 | none | no statement | R06 |
| 9.5 | "Steps 1 and 3" | no such steps | R07 |
| AlgebraicTopology citations | main, #1652, #1663, #1854 | see R01's table | R01 |
| 3B and 3C.3 owners | main BordismFormalGroups; #1854 | HomotopySpheres owns, against BordismFormalGroups owns | R02 |

**Ownership.** I searched the open heads by object, using `roadmaps grep` for "h-cobordism theorem", "Hopf invariant one", "Kervaire invariant", "James construction", "real Bott periodicity", "Θ₇/exotic sphere", "Wall form/formation" and "parallelizable sphere".
- The second owners found are #1742, #1799, #851 and #1854 (R02, R03).
- The hits in #1797 and #936 for the h-cobordism theorem and Θ₇ are citations or a different object (controlled h-cobordisms).
- This roadmap is the owner of the smooth h-cobordism theorem, Θₙ, 3A.2–3A.4, 4A–4C and Layers 5–10. No earlier roadmap states them.

## Not verifiable

- **Browder 1969** (8.4, 9.5): JSTOR only; the sources service found no legal copy.
- **Gray 2001**, **Fomenko–Fuchs 2016** and **Toda 1962** (3C.4, 9.2, 9.3; the README already marks Toda uncertified): paywalled.
- **Milnor, *Topology from the Differentiable Viewpoint*** (5.0, 5.1): no legal copy found.
- **Bott 1959** (4B.6–4B.8, docstrings "p.315"), **Adams–Atiyah 1966** (3C.5) and **Wall 1999**: paywalled or print only.
- **Elaboration at main's pins**: the brief allows Lean only in this worktree, which pins `a91d3aa`. The main pins were checked by reading.

## Source issues

- none
