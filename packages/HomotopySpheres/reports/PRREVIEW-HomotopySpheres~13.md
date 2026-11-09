# Review of HomotopySpheres (pull request #1287 at 08479cb)

**Verdict:** needs changes

Full review of the repaired head. Line numbers of other roadmaps are README lines at the head named; `main` is the content repository's main branch at `172efce`/`373d88d`. Seven findings, three at P2; all three P2 findings are carried from the previous review (one partly repaired, two not repaired), and the two new findings are P3.

## R01 (P2) — The compact-generation supplier item exists at no AlgebraicTopology on main, and the merge-order paragraph names no revision that defines it

**Location.** `TauCetiRoadmap/HomotopySpheres/README.md`:128, :146, :210, :310, :324, :436, :866–876 and 22 more lines (29 in all): "AlgebraicTopology Stage 4 item 8, *Compact generation and the pointed adjunction*"; :869–870: "Citations of 3A.1 … refer to that item".

**Claim.** Partly repaired. The three dropped names (`homologicalWhitehead`, `compactManifoldFiniteCWType`, `basedSphereReferenceGenerator`) are gone, and the by-object citations now resolve at every AlgebraicTopology head (main :597, :1684, :1700, :1811; #1652 :1037, §8.3, §8.5, §8.7; #1663 :797, :2081, :2127, :2297; #1854 :803, :2278, :2319, :2435). What remains is the compact-generation item itself:

| AlgebraicTopology text | where compact generation lives |
| --- | --- |
| main | nowhere: README:567, :768, :1933 hand it to "HomotopySpheres §3A.1" |
| #1652 (`287181d`) | `### 4.8 Compact generation and the pointed adjunction` (:1375) |
| #1663 (`2dc8cf2`) | Stage 4 item 8 (:1066) |
| #1854 (`56715a5`) | Stage 4 item 5 (:140, :1004); item 8 is "Connected maps, weak equivalences and CW approximation" (:1111) |

On main, AlgebraicTopology hands the coreflection to HomotopySpheres §3A.1 and HomotopySpheres hands it back to AlgebraicTopology Stage 4 item 8, so the object has no owner until one of the three open revisions merges. The pull-request description's merge-order paragraph is unchanged ("#1142 → #866 → #1077 → #948 → #942 → this pull request") and names none of them.

**Witness.** Main AlgebraicTopology README:567: "with kZ using only HomotopySpheres §3A.1's coreflection"; #1854 README:140: "Stage 4.5 owns the compact-generation interface"; this README:869–870.

**Repair.** In the merge-order paragraph name the AlgebraicTopology revision this roadmap consumes as merging first (#1652 or #1663, whose item 8 is the cited one). If #1854 is the one that merges, replace "Stage 4 item 8" by "Stage 4 item 5" in the 29 lines (the title in the citation stays). The README needs no other edit.

## R02 (P2) — Open #1854 gives BordismFormalGroups the James construction and Toda brackets that 3B and 3C.3 own

**Location.** README:987–1164 (3B.1–3B.6) and :1199–1215 (3C.3); README:3181–3182: "BordismFormalGroups consumes the James stages of 3B in F6.2 and the Toda brackets of 3C.3 in F4".

**Claim.** Not repaired. The only change this round added "in F6.2" and "in F4", but at #1854 those are exactly the sections where BordismFormalGroups *owns* the objects, so the two roadmaps still hand the same objects to each other. Main's BordismFormalGroups cites this roadmap (README:331 "Consume HomotopySpheres Stage3C's three-fold Toda brackets", :668 "HomotopySpheres 3B's actual James stages"), so with main the owner is this roadmap; with #1854 both own.

**Witness.** BordismFormalGroups at #1854 (`56715a5`): README:24 "the three-fold Toda brackets of pointed spaces" in its ownership list; README:787 "Own the three-fold Toda brackets of pointed spaces"; README:1171 "Own the James construction" with the word filtration, the James map and its weak equivalence (:1172–1178).

**Repair.** Unchanged from the previous review: settle one owner and record it in the description. Either #1854 merges first and 3B.1–3B.3 and 3C.3 cite BordismFormalGroups F6.2 and F4 (with README:3181–3182 rewritten), or #1854 drops those sentences and keeps main's citations of 3B and 3C.3.

## R03 (P2) — Three later open roadmaps still own objects this roadmap owns

**Location.** README 3B.1 and 3B.6; 4A.1 and 4B.1–4B.8; 7B.2–7B.4.

**Claim.** Not repaired. Each roadmap is later than HomotopySpheres in `ORDER.txt` (positions 46, 55 and 332 against 45), cites no HomotopySpheres section, and still states the same objects:
- **GeneralAlgebraicKTheoryPartII** (#1742, `3f10248`): `### 4.30b The James reduced product` (:1208) and `### 4.30c The stable James splitting` (:1243).
- **DGFloerPartII** (#1799, `9e65f2b`): README:22–23 "the stable orthogonal groups with real Bott periodicity, proved by Milnor's Morse theory"; `### 4.2a Stable orthogonal groups and the finite-to-stable range` (:1302), 4.2b (:1356), :439–440.
- **GeometryOfNumbersAndQuadraticArithmetic** (#851, `3b084ef`): README:24 "Wall's nonsingular quadratic forms and formations … and the resulting simply connected quadratic L-groups of `ℤ`"; §6.8 (:105, :272).

**Witness.** `grep -c HomotopySpheres` is 0 in each of the three READMEs at the heads above.

**Repair.** Unchanged: the description names #1742, #1799 and #851 as consumers whose §§4.30b–c, 4.2a–4.2c and §6.8 become citations of 3B.1/3B.6, 4A.1/4B.1–4B.8 and 7B.2–7B.4, or records the reverse settlement as a human's decision.

## R04 (P3) — GeometricTopology §1.4, as cited, exists only at open revisions, and neither is named

**Location.** README:96 ("the associativity of the native sum proved in GeometricTopology §1.4"), :392, :721, :732, :737, :852.

**Claim.** Not repaired, and the facts have moved. Main's GeometricTopology has no §1.4 (its Layer 1 is one section at README:177 with no numbered subsections). The cited §1.4, consuming `TauCeti.OrientedConnectedSum`, proving associativity and comparing with the gluing model, now exists at two heads: #1797 (`9864ff4`, README:709–735) and #903 (`61401bd`, README:899–931, which this round rewrote onto the pinned sum). The merge-order paragraph names neither.

**Witness.** #903 README:899 `### 1.4 Connected sum`, :914 "**Associativity** up to orientation-preserving diffeomorphism", :931 "*Needs:* Tau Ceti `TauCeti.ConnectedSum`, `TauCeti.OrientedConnectedSum`"; #1797 README:709, :724–733.

**Repair.** Name #903 or #1797 in the merge-order paragraph as merging before this pull request. The README needs no edit.

## R05 (P3) — The branch pins Tau Ceti `a91d3aa` and Mathlib `6b7abb3`; the README and the import are written against main's `2fd255d` and `1b1ccf4`

**Location.** `lake-manifest.json` (unchanged by the pull request); README:332–388 and :312, :322, :325; `Suggested.lean`:2–3, :9–11.

**Claim.** Not repaired. I re-verified every README line number at main's pins today: all 27 Tau Ceti lines (`OrientedAtlas.lean`:129, :283; `Basic.lean`:32; `Preserving.lean`:63; `Charts.lean`:195, :321, :374; `Oriented.lean`:128, :143, :155, :160, :208, :222, :238, :295; `ConnectedSum/Orientation.lean`:250; `EqualDimension.lean`:105, :112; `Degree/Basic.lean`:76; `Deformation.lean`:259; `SimplyConnected.lean`:408; `MappingCylinder.lean`:87, :425; `E8.lean`:63, :199; `IntersectionForm.lean`:108) and the 6 Mathlib lines match at `2fd255d`/`1b1ccf4`. At the branch pin `a91d3aa` the directory `Orientation/` does not exist (only `Orientation.lean`, with the groupoid at :178 and `IsOrientedAtlas` at :332), and `ConnectedSum/`, `Sard/`, `Degree/` are absent.

**Witness.** `git -C .lake/packages/TauCeti log -1` is `a91d3aa`; `ls TauCeti/Geometry/Manifold/` has no `Orientation/` directory.

**Repair.** Unchanged: merge main at the worker's rebase so the manifest pins `2fd255d`/`1b1ccf4`, rebuild, replace `Suggested.lean`:3 by `import TauCeti.Geometry.Manifold.Orientation.OrientedAtlas` and delete the workaround sentence at :9–11.

## R06 (P3) — The Hatcher *Vector Bundles and K-Theory* frames locator gives the PDF page, not the printed page

**Location.** README:1385: "§1.1, p.9, frames S¹, S³ and S⁷ by complex, quaternionic and octonionic multiplication"; README:3287 (References): "§1.1, p.9 (frames on S¹, S³, S⁷)"; `Suggested.lean`:115: "§1.1, p.9, for the frames on `S^1`, `S^3` and `S^7`".

**Claim.** New, from this round's R08 repair. The passage is on printed page 5 (PDF page 9). The other three locators added this round are right: Theorem 2.16(b) is on printed p.59, the `K̃O(Sⁿ)` table on p.1 and Proposition 1.14 on p.25.

**Witness.** `hatcher_vbkt` line 191 is the running head "Basic Definitions and Constructions Section 1.1 5" of the page whose lines 194–208 give the fields `ix` on S¹, `t₁ix+t₂jx+t₃kx` on S³ and the octonion frame on S⁷. Line 2321 "Section 2.3 59" heads Theorem 2.16 (line 2326); line 974 "Section 1.2 25" heads Proposition 1.14 (line 988).

**Repair.** Replace "p.9" by "p.5" in the three places.

## R07 (P3) — 8.2 and 8.3 state theorems with no locator

**Location.** README:2614–2624 (8.2 "Extension obstruction and exactness") and :2626–2634 (8.3 "The cokernel comparison").

**Claim.** Neither target carries a theorem number or page; the only source text is 8.4's remark (README:2646–2648) that Kervaire–Milnor Lemmas 4.2–4.5 cover homotopy spheres and that 8.2 "is not the literal statement of those lemmas". The classical special cases are in the cached text and can be cited exactly.

**Witness.** `kervairemilnor1963` lines 174–177 (proof of Theorem 3.1, p.508): the obstruction to triviality of `τ ⊕ ε` lies in `H^n(Σ; π_(n−1)(SO))`, identified with the stable group; lines 183–184: it vanishes when `π_(n−1)(SO) = 0`; lines 292–295 (Lemma 4.5, p.511) and 316–319 (Remarks, p.512): the framings of a homotopy sphere form a coset of `im J_n`, so the invariant lands in `coker J_n`.

**Repair.** In 8.2 add "(Kervaire–Milnor, proof of Theorem 3.1, p.508, for the obstruction class; Lemma 4.5 and the Remarks after Theorem 4.1, pp.511–512, for the coset modulo `im J_n` on homotopy spheres; the exactness for all almost-framed cycles is a target of this section)". In 8.3 add "(Kervaire–Milnor, p.508, Case 1)" at the sentence using `π_(n−1)(SO) = 0`.

## Previous findings

- **R01 (AlgebraicTopology citations): partly repaired.** Steps 1 of the repair (cite by item and object, drop the three names) is done and verified at all four heads; steps 2–3 (name the revision; say whether #1854 is rebased) are not. Carried as R01.
- **R02 (BordismFormalGroups at #1854): not repaired.** The edit at README:3181–3182 names F6.2 and F4 but keeps this roadmap as owner. Carried as R02.
- **R03 (three later owners): not repaired.** Heads re-read today: #1742 `3f10248`, #1799 `9e65f2b`, #851 `3b084ef`. Carried as R03.
- **R04 (GeometricTopology §1.4): not repaired.** Now resolvable at #903 as well as #1797; still unnamed. Carried as R04.
- **R05 (pins): not repaired.** Carried as R05.
- **R06 (9.4 documentation instruction): repaired.** 9.4 (README:2799–2827) now states the theorem: for `0 ≤ k ≤ 6` and `n ≥ k+2`, `π_(n+k)(Sⁿ)` is `ℤ{ι}, ℤ/2{η}, ℤ/2{η²}, ℤ/24{ν}, 0, 0, ℤ/2{ν²}` with `E` an isomorphism on named generators, with three Checks and locators. I checked it: the range `n ≥ k+2` is exactly `n+k ≤ 2n−2` (Freudenthal); the Checks at `n = k+1` are right (`π₃(S²) = ℤ`, `π₇(S⁴) = ℤ ⊕ ℤ/12`); `ν_n² = ν_n∘ν_(n+3) = E^(n−4)(ν₄∘Σ³ν₄)`; the orders for `1 ≤ k ≤ 6` are `kervairemilnor1963` lines 323–325; "Stage 8 item 3 (absolute Hurewicz)" resolves on main :1684, #1652 §8.3, #1663 :2081, #1854 :2278.
- **R07 (Steps 1 and 3; Stage k): repaired.** README:2834 now reads "fixed in 9.1 and 9.3"; README:536–538 defines "Stage k is Layer k and Stage kX is Section kX"; no "Stage k" reference to this roadmap's own sections remains (`grep "Stage [0-9]"` finds only AlgebraicTopology stages and that sentence), and `Suggested.lean` says Layer/Section throughout.
- **R08 (locators and References): repaired, with one slip.** `sphere_parallelizable_iff` cites Hatcher VBKT Theorem 2.16(b), p.59 (correct) and §1.1, p.9 (wrong page: R06). The two recognition headlines cite Milnor Proposition B, p.109, with the proof on p.110 and Kervaire–Milnor p.504 (correct: `milnor_hcobordism` lines 2847–2854 under the page-114 marker, printed 109; lines 2871–2898, printed 110, combine Proposition A with the Kervaire–Milnor–Wall theorem; `kervairemilnor1963` lines 37–40 list order 1 at n = 6). Adams–Atiyah, Hatcher VBKT, Milnor *Morse Theory* and Ranicki are in References (README:3281–3295); Ranicki §2 "Forms and formations" begins on printed p.5 (`ranicki2002` line 228) and the stable-equivalence relation of 7B.3 (complementary Lagrangians or a common Lagrangian complement) is lines 287–292.

## Verified sound

**Gate, dependency check and diff outside the folder** (my runs at `08479cb`):

```text
depcheck: 238 roadmaps, 2353 edges, 0 problem(s)
gate (worker's run): set_option=0 blob=0 latex=0 tex=0 prnum=0 sorry-data=0 sorry-examples=0 residue=0 private-paths=0 imports=0 mathlib-subimports=0 no-import-mathlib=0 lean-lines=0 statement-hygiene=0 forbidden=0 dropped=0 readme-ids-missing=0 empty-sections=0 round-labels=0 long-fences=0 layer-ids=0 target-ids=0 depcheck=0 metadata=0 stray-files=0 dirty=0 outside-folder=0 source-material=0 build=0 OK
```

- No UPWARD or CYCLE line. `git diff --stat origin/main...HEAD -- . ':!TauCetiRoadmap/HomotopySpheres'` is empty.
- Suppliers still in pull requests come earlier in `ORDER.txt`: IndexTheory 10, StringOrientation 11, TangentialBordism 14; HomotopySpheres 45.
- The README has no LaTeX delimiters, no process words, no pull-request numbers and no round labels (grep).

**Elaboration and signatures** (branch pins `a91d3aa`/`6b7abb3`).
- `lake env lean` on a scratch copy with `#check @name` for all 19 declarations: 16 `declaration uses sorry` warnings (lines 96–234) and nothing else from the file's own text (the two parse errors in the log come from the worker's two malformed `#check` lines, not from `Suggested.lean`). Every elaborated type equals `signatures.md` and its README statement; no declaration lost a binder: `exists_diffeomorph_prod_Icc_of_hCobordism` keeps `[T2Space W] [CompactSpace W] [SimplyConnectedSpace W]` and `IsClosed M₀`; the two recognition theorems keep `[T2Space M] [SecondCountableTopology M] [CompactSpace M]`.
- **Padding probe.** Replacing every `sorry` by `first | rfl | simp | infer_instance | trivial | decide | exact inferInstance | exact ⟨fun _ _ => Subsingleton.elim _ _⟩` leaves 16 errors (4 unsolved goals at probe lines 108, 122, 228, 238; 12 instance or application failures). None is padding.
- Imports: `TauCeti.Geometry.Manifold.Boundary.Charts` and `TauCeti.Geometry.Diffeomorphism.Disc` exist at the pin; `Disc.lean` re-exports the orientation module (`public import`, lines 8–11), which is why the file builds at `a91d3aa` (R05 asks for the direct import at main's pin).

**Headline theorems.** The README's headlines are the h-cobordism theorem (1.7), the parallelizable-sphere theorem (3C.5), real Bott periodicity and the stable table (4B.7–4B.8), the fourth to seventh stems (9.2, 9.3, 9A.1), `Θ₆ = 0` (9.7), `Θ₇ ≅ ℤ/28` (9A.2), the E₈ nonstandardness (9A.4) and smooth recognition (10.4). The statable ones are stated; `Θₙ`, the stable stems as colimits, PT, James/EHP, Hopf-invariant one, `Aₙ`/`Pₙ`/`Lₙ`, `Θ₇` and the E₈ comparisons are named in the module docstring (lines 34–59) with the carrier each lacks. The docstring's reasons are right at the pin: no suspension homomorphism on `HomotopyGroup`, no framed bordism group, no oriented h-cobordism relation, no reduced word space, no Wall forms.

**Library declarations opened.**
- At the branch pin: `Orientation.lean`:178 and :332; `Boundary/Charts.lean`:195, :321, :374 (differentiability order `k ≠ 0`); `Diffeomorphism/Disc.lean`:8–11.
- At main's pins (`2fd255d`/`1b1ccf4`, the checkout under the content repository): every line of the README's Tau Ceti and Mathlib contract, listed in R05, including `OrientedConnectedSum`'s hypotheses (nonempty T1 oriented boundaryless `C^∞` manifolds on a nontrivial finite-dimensional inner product space), `nonempty_diffeomorph_sphere` for `n ≥ 1`, `dense_isRegularValue` with `[LindelofSpace M]` and equal `finrank`, `padicValRat_bernoulli (hk : 0 < k) (hpk : p − 1 ∣ 2k)`, and `NonemptyDiffeomorphSphere [T2Space M]` without compactness or second countability, as README:522–524 says.

**Cross-roadmap citations resolved** (main `373d88d` unless a head is named).
- AlgebraicTopology: Stage 4 items 4 (:535, generator :597), 5 (:635), 6 (:789), 7 (:817); Stage 6 item 4 (:1515); Stage 8 items 3 (:1684), 4 (:1694), 5 (:1700), 7 (:1811), 11b (:1948); and at #1652 (§4.4–4.8, §6.4, §8.3–8.7), #1663 (:734–1066, :1842, :2081–2297) and #1854 (:739–1111, :2278–2435). Item 8 is R01.
- TopologicalKTheory T1.5a (:364), T1.6a–d (:394, :561, :671, :721), T2.5 (:874), T3 (:928), T4 item 8 (:1094), T7 with `c(a)=2u²`, `c(b)=u⁴` (:1646). The section order T1.5–T1.6 → 4A–4B → T1.6d/T7 is acyclic.
- CharacteristicClasses C1.2b (:599), C6.2–C6.3 (:1748, :1774), C7.3 with the `x^⊥` adapter (:1851–1855).
- GeneralizedCohomology G2 items 4–5 (:271, :302), G4.0a–b (:939–1082), G5 item 6 (:2212–2216).
- RiemannianGeometry R3.3c (:538), R3.4 suspension (:556, :603); ComplexKahlerGeometry K7.1 (:1407); DifferentialGeometry Layers 2, 3, 5.1 (:341, :371, :506–509); MorseTheory M3, M5 (:453, :857); DGFloer Layer 1 items 2 and 4 (:470, :659; item 2 owns the fibration sequence and the ordinary Serre spectral sequence, :140–142); SpinRepresentations Layer 7 real Clifford table on `TauCeti.realCliffordForm` (:883–901, :1098); SpinGeometry G4, G6 (:395, :569, :697); HeegaardFloer Lanes M/F0 (:70–71, :217); Completed/UniversalCovers exists.
- Open heads: TangentialBordism #942: B1.1 (:571), B1.2 (:744), B1.6 (:399), B3.2(a–c) (:363, :2174, :2207), B4.1, B4.2, B4.7 (:1026, :1075, :1159), B5.2 (:1316); its `gap:finite-quadratic-arf` names GeometricTopology as supplier (:328). StringOrientation #948: S2.3 (:608–620) states `Ω^fr_n ≅ π_n S`, takes `π₃S ≅ ℤ/24` from EllipticCohomology E4.S (earlier in the order), owns the quaternionic-Hopf generator comparison and the native form `π_(n+3)(Sⁿ)`, `n ≥ 5`, which is what 9.1 and the contract cite. IndexTheory #1077: 7.2 (:1364), 7.5 (:1507).
- Downstream: main's BordismFormalGroups (:331, :668), DGFloer (:53 at #963 and main), GeneralizedCohomology, CharacteristicClasses, MorseTheory, RiemannianGeometry cite this roadmap; FourManifolds #936 cites 6B, 7A–7C.
- The conflict with #284 has a stated order (the description carries #284's baseline).

**Sources at the sampled targets.** Page keys: `milnor_hcobordism` printed = PDF − 5; `kervairemilnor1963` printed = PDF + 503; `hatcher_vbkt` printed = PDF − 4; `hatcher_at` (fetched this round from the author's page) printed = PDF − 9; `atiyah1971` printed = PDF + 45; `ranicki2002` printed = PDF − 3.

| Target | Locator checked | Result |
| --- | --- | --- |
| 1.1 | Milnor Def. 9.2, line 2804, p.107 | both ends deformation retracts; matches |
| 1.3 | Thm 7.6 (p.92; proof completed line 2512, p.95), Thm 7.8 (line 2565, p.97: `n ≥ 6`, no critical points of index 0, 1, n−1, n), Thm 8.1 (line 2613, p.100), Thm 4.8 (line 1071, p.44) | matches total dimension `n+1 ≥ 6` |
| 1.7 | Thm 9.1 (lines 2784–2790, p.107: W, V, V′ simply connected, `H_*(W,V)=0`, `dim ≥ 6`); remark after Def. 9.2 (lines 2807–2823, pp.107–108) | matches the Lean hypotheses; the equivalence with "both inclusions homotopy equivalences" is the remark plus duality (line 2791) |
| 2.2 | KM Lemmas 2.1–2.2 (lines 70–107, pp.505–506, `n ≥ 3` at line 80); Milnor Thm 8.1 index 0 (line 2614, no dimension hypothesis), Thm 3.4 (line 582, p.21), twisted sphere (line 2875, p.110); KM p.507 `Θ₁ = Θ₂ = 0` (lines 142–144) | matches |
| 2.3 | KM Lemma 2.3 (line 108, p.506), Lemma 2.4 (lines 125–136, p.507: half-disc `H²`, gluing for `½ < t ≤ 1`) | the construction and the duality step match |
| 5.0b | Hatcher AT Examples 4.45–4.46 (`hatcher_at` lines 16405–16427, pp.377–378: fibre `S³` the unit quaternions, `S⁷ → S⁴ = HP¹`); Atiyah Prop. (4.1) and Theorem 3′ (`atiyah1971` lines 419–433, p.58) | matches; TopologicalKTheory T1.5a, SpinGeometry G4, TangentialBordism B3.2 exist |
| 8.2 | none at the target; KM p.508 and pp.511–512 are the special cases | R07 |
| 8.3 | none at the target; KM p.508, Case 1 | R07 |
| 9.1 | Hatcher AT Cor. 4J.4 (line 20409, p.474), Prop. 4L.11 (line 21512, p.498: `η² ≠ 0`, and also `ν² ≠ 0` in `π₆ˢ`); StringOrientation S2.3 (#948 :608–620) | matches |
| 9.2 | KM p.512 table (lines 323–325): `Π₄ = Π₅ = 0` | matches; Gray, Toda, Fomenko–Fuchs not verifiable |
| 9.3 | KM p.512 (`Π₆ = ℤ/2`); Toda Prop. 5.11 uncertified; Hatcher AT Prop. 4L.11 proves `ν² ≠ 0` | matches |
| 9.6 | 4B.8 entries `π₅(SO) = π₆(SO) = 0`; KM p.508 Bott table (lines 180–181) | matches |
| 9.7 | exact segment; KM Thm 4.1 and p.512 table (`Θ₆/bP₇ ⊂ Π₆/p(S⁶) = ℤ/2`, line 326–327, and order 1 at line 40) | matches |
| 10.1 | DifferentialGeometry Layer 2 (:341), AlgebraicTopology Stage 6 item 3 (:1180) | supplier sections exist |
| 10.3 | Milnor Thm 9.1 via 10.2; Prop. B, p.109 (line 2847) | matches; `n = 5, 6` diffeomorphic |
| 3C.5 (headline) | Hatcher VBKT Thm 2.16(b), line 2326, p.59; §1.1 frames, lines 194–208, p.5 | supports `n ∈ {1, 3, 7}` for `n ≥ 1`; page slip is R06 |
| 3B, 3C.3 | Hatcher AT Props 4I.1–4I.2 (lines 20117, 20146, pp.467–468; 4I.2 assumes connected CW), Thm 4J.1 (line 20284), Toda bracket `⟨f,g,h⟩` with `f` first (lines 16798–16803, p.387) and Exercise 39 (line 17033, p.392), Prop. 4.13 (line 15375, p.353), Prop. A.19 (line 23328, p.537) | matches; the README's reversed order is as it says |

**Adversarial table** (values computed on each side; the numbers were recomputed this round).

| Statement | Instances | Values | Result |
| --- | --- | --- | --- |
| `exists_diffeomorph_prod_Icc_of_hCobordism` | `W = S⁵×I`, `M₀ = S⁵×0`; `W = D⁶`, `M₀ = ∂D⁶`; `M₀ = ∅`; `(S⁵×I)` minus a ball; `n = 4` | `f = id` satisfies `f(x,0) = x`; `H₅: ℤ → 0` and `∅ ↛ D⁶`, hypotheses fail; `SimplyConnectedSpace W` forces `W ≠ ∅`, so `∅ ≄ W`; `ℤ → ℤ²` fails; `n = 4` excluded by `hn` | Pass |
| `sphere_parallelizable_iff` | `n = 0, 1, 2, 3, 7, 15` | `n = 0`: left true (empty frame), right false, excluded by `0 < n`; `n = 2`: Euler number 2, both false; `n = 1, 3, 7`: Clifford frames, both true; `n = 15`: both false | Pass |
| 3C.5 Adams–Atiyah divisibility | `r = 1, …, 12` | `v₂(3ʳ−1)` = 1 for odd `r`, `2+v₂(r)` for even `r` (checked r ≤ 12); `2ʳ ∣ 3ʳ−1` exactly for `r ∈ {1, 2, 4}`; the Check values 1, 3, 4 and `1 < 3`, `3 < 6` hold | Pass |
| 3C.5 Adams-operation relations | `ψ²ψ³ = ψ³ψ²` on `x` | `y`-coefficients: `3ʳ b₂ + 2²ʳ b₃ = 2ʳ b₃ + 3²ʳ b₂`, i.e. `3ʳ(3ʳ−1) b₂ = 2ʳ(2ʳ−1) b₃`; `ψ²(x) ≡ x² mod 2` gives `b₂ ≡ H(f) mod 2` since `r ≥ 1` | Pass |
| 3C.5 Clifford convention | `realCliffordForm 0 q` | all weights −1, `ι(e)² = −1`; `q = 1, 3, 7` give `ℂ`, `ℍ×ℍ`, `M₈(ℝ)×M₈(ℝ)`, modules of dimension 2, 4, 8 | Pass |
| `nonempty_orthogonalGroup_bottPeriodicity` | `(k,n) = (0,11), (3,14), (6,17)` | `ℤ/2 ≅ ℤ/2`, `0 ≅ 0`, `ℤ ≅ ℤ`; `k+9 ≤ n−2 ⇔ n ≥ k+11` checked for all `k < 20`, `n < 60` | Pass |
| Bott entries in degrees 2–8 | `n = 4, …, 10` against `n−1` | 0, ℤ, 0, 0, 0, ℤ, ℤ/2; at `n−1`: `π₃SO(4) = ℤ²`, `π₄SO(5) = ℤ/2`, `π₅SO(6) = ℤ`, `π₇SO(8) = ℤ²`, `π₈SO(9) = (ℤ/2)²`, all different, so the bounds `i ≤ n−2` are needed | Pass |
| 4B.6 rank table | `r = 1, 2, 8` | `[2r−2, 4r−2, 4r+4, 2r+2, r+1, r+1]` = `[0,2,8,4,2,2]`, `[2,6,12,6,3,3]`, `[14,30,36,18,9,9]`, as the Checks say; row one excluded at `r = 1` | Pass |
| 9.4 stem table | `k = 0..6`, `n = k+2` | `π₂S² = ℤ`, `π₄S³ = ℤ/2`, `π₆S⁴ = ℤ/2`, `π₈S⁵ = ℤ/24`, `π₁₀S⁶ = 0`, `π₁₂S⁷ = 0`, `π₁₄S⁸ = ℤ/2`; at `n = k+1`: `π₃S² = ℤ`, `π₇S⁴ = ℤ⊕ℤ/12`, so the bound is sharp; `n+k ≤ 2n−2 ⇔ n ≥ k+2` | Pass |
| 9.2 unstable route | `π₈S⁴, π₉S⁴, π₉S⁵, π₁₀S⁵, π₁₀S⁶, π₁₁S⁶, π₁₂S⁷` | `(ℤ/2)², (ℤ/2)², ℤ/2, ℤ/2, 0, ℤ, 0`; `H[ι₆,ι₆] = 2`; odd primes `(3,3), (3,4–6), (3,7), (5,7)` give `ℤ/3, 0, ℤ/3, ℤ/5` inside `24 = 8·3`, `240 = 16·3·5` | Pass |
| 3C.4 Checks | `(α,β) = (η₂,η₂)`, `(ι₂,η₂)`, `(η₂,ν₄)` | `C = 2η₃η₄ = 0 = Pι₇ = [ι₃,ι₃]`; `η₃ − η₃ = 0`, `Hι₂ = 0`; `ν₅η₈ = Pι₁₁ ≠ 0` of order 2 | Pass |
| `PreservesOrientedAtlases` | `A = B` on `S⁶`; `B` reflected; disjoint chart pair | `id` gives `det > 0`; against reflected `B`, `id` gives −1 and `r` gives `(−1)(−1) = +1`; the empty transition lies in every groupoid; `A = ∅` is excluded by `IsOrientedAtlas` covering `M` | Pass |
| `smoothPoincareSix_oriented`, `nonempty_diffeomorph_sphere_six` | `M = S⁶`; `S³×S³`; `CP³` | identity; `H₃ = ℤ²` and `H₂ = ℤ`, not homotopy equivalent to `S⁶`, excluded; Milnor Prop. B needs only a homology sphere, so the hypothesis is stronger than the source's | Pass |
| 2.2 Euler count | `Σ = S², T²` | `χ(W) − χ(V) = (2−2) − 0 = 0`, `c₁ = 0`; torus `(0−2) − 0 = −2`, `c₁ = 2` | Pass |
| 2.3 witness | `Σ = Sⁿ` | `V_Σ = D^(n+1)`, `W_Σ = Sⁿ×I`; the one-handle model `≃ Sⁿ∨Sⁿ∨S¹` has `π₁ = ℤ` | Pass |
| 6B E₈ | edges of `TauCeti.e8Plumbing` | chain 0–6 and 2–7; entries (2,7) = 1, (0,2) = 0, diagonal −2; `det = 1`, `σ = −8`, coordinate −1 | Pass |
| 9A.2 | `z = 1` | `p₂ = 6·240 = 1440`, `σ = 7·1440/45 = 224`, `σ/8 = 28` | Pass |
| 9A.3 Eells–Kuiper | E₈; `(h,j) = (2,−1)`; `(1,0)` | `μ = 32/896 = 1/28`; `e = 1`, `p₁ = 6`, `p₁² = 36`, `μ = 32/896 = 1/28`; `μ = 0`; and `(7p₁²−4p₂)/5760 = (p₁²−4σ)/896` since `7·5760/45 = 896` | Pass |
| 9A.4 | `k = 2, 3, 4, 5, 6` | `7p₂ = −360`, `−360 ≡ 4 mod 7`; `d₃ = 992/63`, `v₂ = 5`; `d₄ = 2032/15`, `v₂ = 4`; `v₂(d₅) = v₂(d₆) = 9`; formula `2k−2−v₂(k)+v₂(aₖ)` agrees at every k; `v₂(−8) = 3` | Pass |
| 9A.1 e-invariant Checks | `1/240`, `2x = 1/120` | `240·(1/240) = 0`, `120·(1/240) = 1/2 ≠ 0` in `ℚ/ℤ`; solutions `1/240` and `121/240` | Pass |
| 8.4 / 9.5 Arf | hyperbolic plane; `q(a) = q(b) = 1`; two anisotropic planes | 0; 1; `1+1 = 0` | Pass |
| 5.0b | `c = 1, 2, 3, 4` | `π₃S¹ = 0`; `π₃S² = ℤ`; `π₄S³ = ℤ/2`, `π₅S³ = ℤ/2`; `π₆S⁴ = ℤ/2`; `π₆S⁷ = π₅S⁷ = 0` so `∂ : π₆S⁴ → π₅S³` is an isomorphism; Stiefel fibre `(c−1)`-connected: 3 at `c = 4`, 2 at `c = 3` | Pass |
| 1.6 codimensions | `V⁵`, `P², Q³` | `5−3 = 2`, attaching circle `5−1 = 4` | Pass |
| 7B Checks | zero module; `[[0,1],[1,0]]`; `𝔽₂` plane `q(a)=q(b)=1` | det 1, σ 0, Arf 0; det −1, σ 0, Arf 0; `q(a+b) = 1`, Arf 1 | Pass |
| AlgebraicTopology compact-generation item | main, #1652, #1663, #1854 | hand-off to HS §3A.1 / item 8 / item 8 / item 5 | R01 |
| 3B, 3C.3 owners | main BFG; #1854 | HomotopySpheres owns / both own | R02 |

**Ownership.** Searched the open heads and main by object with `roadmaps grep` for the James reduced product, real Bott periodicity, Hopf invariant one, Wall forms and formations, the h-cobordism theorem and parallelizable spheres. Second owners: #1742, #1799, #851 (R03) and #1854 (R02). The other hits are citations (#963 DGFloer :53, #1797 GeometricTopology :633, :1719, :3296 citing Milnor) or different objects (#1266's `L`-groups of general rings, which consume #851's §6.8; #1691). This roadmap is the owner of the h-cobordism theorem, `Θₙ`, 3A.2–3A.4, 4A–4C and Layers 5–10; no earlier roadmap states them.

**Declared gaps.** None declared by this roadmap; the one it consumes, TangentialBordism's `gap:finite-quadratic-arf`, has a named supplier (GeometricTopology) and is cited as a gap in 7B and 7C.3.

## Not verifiable

- **Bott 1959** (4B.6–4B.8, docstrings "pp.314–315", table locators (7.4)–(8.9)): paywalled (JSTOR).
- **Gray 2001**, **Fomenko–Fuchs 2016**, **Toda 1962** (3C.4, 9.2, 9.3, 9.4, 9A.1; the README marks Toda uncertified): paywalled or print only.
- **Browder 1969** (8.4, 9.5): JSTOR only.
- **Milnor, *Topology from the Differentiable Viewpoint*** (5.0, 5.1), **Adams–Atiyah 1966** (3C.5), **Wall 1999**, **Milnor, *Morse Theory*** (4B): no legal copy found.
- **Elaboration at main's pins**: Lean is allowed only in this worktree, which pins `a91d3aa`; main's pins were checked by reading the checkout under the content repository.

## Source issues

- none
