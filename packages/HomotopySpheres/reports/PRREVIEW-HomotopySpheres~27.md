# Review of HomotopySpheres (pull request #284 at f10f2a4)

**Verdict:** needs changes

## R01 (P2) — Freudenthal is planned again; GeneralizedCohomology owns it on main

**Location:** `TauCetiRoadmap/HomotopySpheres/README.md` lines 453–456: "Prove Freudenthal: for `n>=2`, suspension `pi_q(S^n) -> pi_(q+1)(S^(n+1))` is an isomorphism for `q<=2*n-2` and a surjection for `q=2*n-1`."

**Claim:** this roadmap owns the Freudenthal suspension theorem for spheres.

**Witness:** on main, `TauCetiRoadmap/GeneralizedCohomology/README.md` line 326 (G2 item 5) proves Freudenthal for (k−1)-connected pointed CW spaces: iso for 1 ≤ i ≤ 2k−2, onto at 2k−1. With k = n this is item 4. StringOrientation line 616 already consumes it for spheres.

**Repair:** replace the first sentence of §3.1 item 4 with "Use GeneralizedCohomology G2 item 5's Freudenthal theorem for the (n−1)-connected CW complex `Sⁿ`: suspension `π_q(Sⁿ) → π_(q+1)(S^(n+1))` is an isomorphism for `q ≤ 2n−2` and onto for `q = 2n−1`." Keep the deduction for the kth stem. Add G2 item 5 to the GeneralizedCohomology contract (lines 140–143), and add it to §3.1's *Needs:* as the input of item 4 only.

## R02 (P2) — The third stable stem is planned again; StringOrientation S2.3 owns it on main

**Location:** `README.md` lines 1138–1141: "Use the Hopf-invariant calculation, EHP, and composition relations to prove `pi_1^S ~= Z/2{eta}`, `pi_2^S ~= Z/2{eta^2}`, and `pi_3^S ~= Z/24{nu}`."

**Claim:** this roadmap owns `π₃^S ≅ ℤ/24{ν}`.

**Witness:** `TauCetiRoadmap/StringOrientation/README.md` (main) line 639 states "`π₃S≅ℤ/24` with generator ν, and `J:π₃SO≅ℤ→π₃S` is onto with kernel 24ℤ", together with `π_(n+3)(Sⁿ) ≅ ℤ/24` for n ≥ 5. Its line 100 records that HomotopySpheres states the same thing again.

**Repair:** in §9.1 item 1 write "Consume StringOrientation S2.3's `π_(n+3)(Sⁿ) ≅ ℤ/24` (n ≥ 5), whose generator ν is the stable class of the quaternionic Hopf construction, and its `J : π₃SO → π₃S`, onto with kernel 24ℤ. Prove here `π₁^S ≅ ℤ/2{η}`, `π₂^S ≅ ℤ/2{η²}` and the unstable groups in stems ≤ 3 that the EHP steps of items 2–3 use." Add S2.3's third stem to the StringOrientation contract (lines 150–154) and to §9.1's *Needs:*.

## R03 (P2) — The Type-0 skeleton codes only boundaryless manifolds, but the cycles of `P_n` have boundary

**Location:** `README.md` lines 174–180: "A finite smooth atlas code consists of finitely many charts on `EuclideanSpace R (Fin n)` … Thus the cycle and quotient carriers live in Type 0". Line 801 defines a filling cycle as "a compact connected oriented smooth `n`-manifold whose boundary is identified …".

**Claim:** every cycle carrier, including §6.2's, is realized in Type 0 by this code.

**Witness:** a realization glued from open subsets of `EuclideanSpace ℝ (Fin 7)` has no boundary points. The standard `D⁷` filling of §6.2 item 4 is therefore not diffeomorphic to any realization, so the `P_n` cycle type has no Type-0 code.

**Repair:** in line 175 write "finitely many charts on `EuclideanSpace ℝ (Fin n)` or on `EuclideanHalfSpace n`". In line 177 write "every compact Hausdorff second-countable smooth manifold, with or without boundary (model `𝓡∂ n`), in `Type u` is diffeomorphic to a realization; the boundaryless manifolds are the codes with no half-space chart". In §6.2 item 1 add "coded by the skeleton of the Conventions". Add the Check "`D⁷` is realized by three charts: an interior ball chart and two half-space charts around the two closed hemispheres of its boundary; no code without a half-space chart realizes it".

## R04 (P3) — Roadmaps on main cite letter ids that this head no longer has, and no old → new numbering is given

**Location:** `README.md` section headings, for example line 577 "### 4.2 Full real Bott proof spine" and line 440 "### 3.1 Pointed constructions and stabilization" (formerly "4.2 4B …" and "3.1 3A …").

**Claim:** the renumbering keeps existing citations valid.

**Witness:** on main, `TauCetiRoadmap/TopologicalKTheory/README.md` line 1605 cites "HomotopySpheres §4B.1–4B.9", and `GeneralizedCohomology/README.md` line 37 cites "HomotopySpheres Stage 3A". CharacteristicClasses (24), DGFloer (56, 292), Orbifolds (430), GeometricCurrents (997) and PositiveScalarCurvature (89, 1005) also cite letter ids.

**Repair:** add after "How to read the build" a table headed `| Former numbering | Section here |` with rows: `3A.1 | AlgebraicTopology §4.8 (consumed in §3.1 item 1)`; `3A.2 | §3.1 item 2 (cones and Puppe sequences; suspension, loops and smash are AlgebraicTopology §4.8)`; `3A.k, k = 3, 4 | §3.1 item k`; `3B.k | §3.2 item k`; `3C.k | §3.3 item k`; `4A.k | §4.1 item k`; `4B.k | §4.2 item k`; `4C.k | §4.3 item k`; `6A, 6B, 6C | §6.1, §6.2, §6.3`; `7A, 7B, 7C | §7.1, §7.2, §7.3`.

## R05 (P3) — Two theorems in `Suggested.lean` compute small values and mirror a README Check

**Location:** `TauCetiRoadmap/HomotopySpheres/Suggested.lean` lines 61–67 (`stableSOHomotopy_five_subsingleton`, `stableSOHomotopy_six_subsingleton`).

**Claim:** these are headline theorems.

**Witness:** they state `π₅(SO(7)) = 0` and `π₆(SO(8)) = 0`. These are two entries of §4.2 item 8's table and the content of the Layer 4 Check at README line 651: "The groups in degrees five at rank seven and six at rank eight vanish."

**Repair:** delete lines 61–67 from `Suggested.lean`. In the README, delete the sentence at lines 611–613 ("The targets `stableSOHomotopy_five_subsingleton` … respectively.") and keep item 8 and the Check.

## R06 (P3) — `nonempty_diffeomorph_sphere_six` restates Mathlib's smooth Poincaré predicate with two extra hypotheses

**Location:** `Suggested.lean` lines 217–223, and `README.md` lines 277–278: "It does not invoke an unrestricted proposition whose typeclasses omit those assumptions."

**Claim:** Mathlib's predicate omits hypotheses the theorem needs.

**Witness:** Mathlib `ContinuousMap.HomotopyEquiv.NonemptyDiffeomorphSphere` (`Mathlib/Geometry/Manifold/PoincareConjecture.lean` 41) omits compactness and second countability. Both follow from `M ≃ₕ S⁶`: `H₆(M;ℤ/2) ≠ 0` forces compactness (`hatcher_at` line 10370, Prop. 3.29, p. 239), and compact locally Euclidean Hausdorff spaces are second countable.

**Repair (elaborated at the pins):**

```lean
/-- Smooth recognition of homotopy six-spheres, as Mathlib's smooth Poincaré predicate in
dimension six (Milnor, Theorem 9.2, p. 108, with `Θ₆ = 0`). -/
theorem nonempty_diffeomorph_sphere_six (M : Type*) [TopologicalSpace M] [T2Space M] :
    ContinuousMap.HomotopyEquiv.NonemptyDiffeomorphSphere M 6 := by
  sorry
```

Add the predicate to "From Mathlib". Replace lines 275–278 with "The final theorem is Mathlib's `ContinuousMap.HomotopyEquiv.NonemptyDiffeomorphSphere M 6`; compactness and second countability are derived from the homotopy equivalence (Hatcher, Proposition 3.29, p. 239)." Add that derivation to §10.1 item 1.

## R07 (P3) — Four locators point at the wrong statement

**Location:** `README.md` line 334 "(Milnor, proof of Theorem 9.1, p. 107)"; line 325 "(Milnor, §3, Theorem 5.4 and §7)"; line 1110 "Kervaire–Milnor, Theorem 3.1 (p. 508)"; lines 1111–1112 "`Theta_n/bP_(n+1) ↪ coker J_n` is their Theorem 4.1".

**Claim:** each locator carries the statement it is attached to.

**Witness:** Milnor's proof of 9.1 (`milnor_hcobordism` lines 2795–2803) only invokes Theorem 8.1 (index-1 trading) and Theorem 7.8. KM Theorem 4.1 (`kervairemilnor1963` line 243) states that `Θ_n/bP_(n+1)` is finite. The embedding is the end of its proof (lines 308–315).

**Repair:**
- Line 334: "(Milnor, Theorem 8.1, p. 100; Basis Theorem 7.6, p. 92; proof of Theorem 7.8, pp. 97–99)".
- Line 325: "(Milnor, Theorems 3.12–3.14, pp. 30–32; rearrangement Theorem 4.8, p. 44; Theorem 5.4, p. 48; Basis Theorem 7.6, p. 92)".
- Line 1110: "the obstruction in the proof of Kervaire–Milnor, Theorem 3.1 (pp. 508–509)".
- Lines 1111–1112: "the last paragraph of the proof of their Theorem 4.1, from Lemmas 4.2 and 4.5, with `p(Sⁿ) = im J_n` by the Remark on p. 512 (pp. 510–512)".
- Line 934: "Lemmas 4.2–4.5 and the proof of Theorem 4.1".

## R08 (P3) — Three sampled subsections have no locator and others cite chapter ranges

**Location:** `README.md` §1.1 (lines 293–318), §7.1 (lines 967–986) and §10.1 (lines 1205–1223) cite no source. Line 342 gives "(Milnor, proof of Theorem 6.6)" without a page. Lines 567, 617, 696–702, 1061 and 1180 cite chapter ranges. Previous R19 was only partly repaired.

**Claim:** every theorem has an exact locator.

**Witness:** Milnor proves gluing in Theorem 1.4 (`milnor_hcobordism` line 140, p. 2) and the collar theorem in Corollary 3.5 (line 615, p. 23). Ranicki §2 (`ranicki2002` line 235, p. 5) states surgery below the middle dimension. None of these is cited.

**Repair:**
- §1.1: add "(Milnor, Definition 1.3, Theorem 1.4 and Definition 1.5, p. 2; Corollary 3.5, p. 23; Kervaire–Milnor, p. 504, for the h-cobordism relation)".
- §1.4: "(Milnor, proof of Theorem 6.6 with Lemma 6.7, pp. 73–84)".
- §7.1 item 4: "(Ranicki, *Foundations of algebraic surgery*, §2, p. 5; Wall, Chapter 1)".
- §10.1 item 3: "(Milnor, Theorem 9.2, p. 108)".
- §9.1 item 7: "bP₇ = 0 is also Kervaire–Milnor, Theorem 5.1 (p. 512)".
- Replace the Wall, Bott, Toda, Steenrod, Husemoller, Pontryagin, Thom, Kosinski and Hirsch chapter ranges with the theorem numbers used.

## R09 (P3) — The Worked examples contradict the layers they summarize

**Location:** `README.md` lines 1287–1289: "reusing Mathlib's fully faithful inclusion and proving its compact-generation right adjoint, counit, exponential law, and limit/colimit comparisons". Also lines 1284–1286, 1301–1304 and 1257–1258.

**Claim:** the Worked examples describe what the layers build.

**Witness:** §3.1 item 1 (line 442) consumes the coreflection and exponential law from AlgebraicTopology §4.8. Line 1284 says "for every connected `X`", but §3.2 item 4 (line 478) proves James only for connected well-pointed CW complexes. Line 1304 claims "both inverse bordisms", which §5.1 item 7 takes from StringOrientation S2.3.

**Repair:**
- Lines 1287–1289: "All stable topology is formed in `CompactlyGenerated`, using AlgebraicTopology §4.8's coreflection, exponential law and limit/colimit comparisons before James, loop-space or Bott arguments use them."
- Line 1284: "for every connected well-pointed CW complex `X`".
- Lines 1302–1304: "…continuous pointed collapse and augmentation maps, their comparison with TangentialBordism B5.2's collapse and regular-value inverse, and the change-of-framing formula for stable `J`; the inverse bordisms are StringOrientation S2.3's."
- Lines 1257–1258: "…index-two/index-three cancellation in every total dimension `d ≥ 6` by its complement-fundamental-group argument."

## R10 (P3) — Checks that compute nothing, and definitions with fewer than three Checks

**Location:** `README.md` line 529 ("take `X = ℚ` and `Y = [0,1]`"); line 1123 ("A framing change by the zero element of `π_n(SO)` gives the same stable class"); §4.3 (lines 626–643), which has no Check; line 1079, the only Check on `OddWallFormation` and lagrangians. Previous R18 was only partly repaired.

**Claim:** each definition has at least three discriminating Checks.

**Witness:** line 529 states no value. Line 1123 holds for every map, the zero map included. In `H(ℤ)` with q odd, `L = ℤ(e+f)` satisfies `L⊥ = L` and is a direct summand, but `μ(e+f) = 1`. No Check exhibits this.

**Repair:**
- Line 529: "With `Y = [0,1]` (locally compact Hausdorff) and `Z = ℚ` (Hausdorff, not locally compact), Hatcher A.16 still gives `X^(Y×Z) ≅ (X^Y)^Z`; a comparison requiring both factors locally compact does not apply."
- Line 1123: "The bounding framing of `S¹` has class 0; twisting it by the generator of `π₁(SO)` gives `J(1) = η ≠ 0`."
- §4.3: add Checks that "`J₁ : π₁(SO) = ℤ/2 → π₁^S` is an isomorphism, so `J` is not the zero map", "`J₃ : π₃(SO) = ℤ → π₃^S = ℤ/24` is onto with kernel 24ℤ (StringOrientation S2.3)" and "`J₆` has source `π₆(SO) = 0`, so `coker J₆ = π₆^S`".
- §7.3: add "for q odd, `ℤ(e+f) ⊂ H(ℤ)` is isotropic, self-orthogonal and a summand but has `μ(e+f) = 1`, so it is not a lagrangian".

## R11 (P3) — Fifteen `Suggested.lean` names never appear in the README

**Location:** `README.md` (whole file). Previous R12 was only partly repaired.

**Claim:** every Lean name appears in the README.

**Witness:** a backticked grep of the README finds 0 hits for `ModelSpace`, `SmoothModel`, `Sphere`, `SpecialOrthogonal`, `WallLattice`, `WallQuadraticValue`, `EvenWallForm.Lagrangian`, `EvenWallForm.SumIsometry`, `EvenWallForm.IsHyperbolicPlane`, `OddWallFormation.Isometry`, `OddWallFormation.SumIsometry`, `OddWallFormation.IsTrivial`, `evenWallRelations`, `oddWallRelations` and `sphereBasepoint`.

**Repair:**
- Name `ModelSpace`, `SmoothModel` and `Sphere` in the first Conventions bullet.
- `SpecialOrthogonal` in §4.1 item 1.
- `WallLattice`, `WallQuadraticValue`, `EvenWallForm.Lagrangian`, `EvenWallForm.SumIsometry` and `EvenWallForm.IsHyperbolicPlane` in §7.2 item 2.
- `OddWallFormation.Isometry`, `OddWallFormation.SumIsometry` and `OddWallFormation.IsTrivial` in §7.2 item 3.
- `evenWallRelations` and `oddWallRelations` in §7.2 item 4.
- `sphereBasepoint` in §9.1 item 3 ("`nonempty_sixthStableStem` uses `Sphere 8` based at `sphereBasepoint 8`").

## R12 (P3) — The module docstring names a headline this roadmap no longer owns and omits two it does

**Location:** `Suggested.lean` lines 13–14: "Framed Pontryagin–Thom requires geometric framed bordism, Thom spaces and the tubular collapse construction."

**Claim:** the docstring lists this roadmap's headline theorems that are not statable at the pins, and what each lacks.

**Witness:** README §5.1 items 5 and 7 consume the Pontryagin–Thom map and `Ω_n^fr ≅ π_n^S` from TangentialBordism B5.5 and StringOrientation S2.3. The James theorem (Scope item 4) and the group `Θ_n` (item 3) are not mentioned. The bullets never say what is missing at the pins.

**Repair:** replace lines 12–18 with: "Not statable at the pinned Mathlib and Tau Ceti: the James theorem `J X ≃ ΩΣX` (no James reduced product); Freudenthal's theorem and the stable stems (no suspension homomorphism on `HomotopyGroup`); the group `Θₙ`, the geometric exact sequence and `Θ₆ = 0` (no h-cobordism quotient of oriented homotopy spheres); and the comparison of the filling groups with Wall's groups (no surgery traces). The Wall groups are stated through their additive presentations."

## R13 (P3) — `Theta_n` is claimed to be a group in every dimension, including n = 0

**Location:** `README.md` lines 32–33: "form the geometric group `Theta_n` for every `n` under connected sum (Kervaire–Milnor, Theorem 1.1, p. 504)". Also line 205: "Connected sum gives the group in every dimension."

**Claim:** the construction applies for n = 0.

**Witness:** Kervaire–Milnor define connected sum only for connected manifolds (`kervairemilnor1963` lines 22–23). The homotopy 0-sphere `S⁰` is disconnected, so §2.1 item 2's connected sum is undefined at n = 0.

**Repair:** write "for every `n ≥ 1`" in line 32 and "in every dimension `n ≥ 1`" in line 205.

## R14 (P3) — The orientation carrier is a pinned Tau Ceti declaration that the Tau Ceti contract does not name

**Location:** `README.md` line 169: "An orientation is the shared `Manifold.Orientation I M ι`". Lines 71–74 (From Tau Ceti) name only the boundary charts and oriented atlases, and line 95 attributes "source-indexed manifold orientations" to DifferentialGeometry Layer 2.

**Claim:** the orientation carrier comes from DifferentialGeometry.

**Witness:** `TauCeti.Manifold.Orientation I M ι` is declared at the Tau Ceti pin (`TauCeti/Geometry/Manifold/Orientation/Basic.lean` 32). It is a source-indexed orientation lift modulo simultaneous reversal, and it covers boundary and corner points.

**Repair:** add to "From Tau Ceti": "`TauCeti.Manifold.Orientation I M ι` (`TauCeti.Geometry.Manifold.Orientation.Basic`), including boundary and corner points." Write `TauCeti.Manifold.Orientation` at line 169 and in §10.1 item 3. At line 95, cite DifferentialGeometry Layers 2 and 10 only for the parts the Tau Ceti pin lacks.

## R15 (P3) — Style: process words, invented vocabulary, a notation slip

**Location:** `README.md` line 1158 "fixed in Steps 1 and 3" and line 1181 "in Steps 1--4"; line 995 "The Lean prototype `EvenWallForm`"; line 740 "In the Kervaire–Milnor range `n ≥ 5`"; line 489 "`Ĥ₅(X ∧ X;ℤ)`".

**Claim:** the README uses the literature's vocabulary and the house form.

**Witness:** the referents are items 1 and 3 of §9.1, not steps. Kervaire–Milnor I defines no almost-framed cycles (`kervairemilnor1963` §§3–4, lines 165–315), so "Kervaire–Milnor range" names nothing there. `Ĥ` usually denotes Tate cohomology, whereas the reduced homology meant here is `H̃`.

**Repair:** write "items 1 and 3" and "items 1–4"; write "The signature `EvenWallForm`"; write "For `n ≥ 5`, define …"; write "`H̃₅(X ∧ X;ℤ)`".

## R16 (P3) — The description says the roadmap develops Pontryagin–Thom, which it now consumes

**Location:** pull-request description, first bullet: "Develop James/EHP, real Bott periodicity, smooth framing comparisons, and Pontryagin–Thom." Also "Sources: Bott, Kervaire–Milnor, Browder, and Wall."

**Claim:** the description matches the head.

**Witness:** README §5.1 items 5 and 7 (lines 686, 692) take the stable framed Pontryagin–Thom map from TangentialBordism B5.5 and `Ω_n^fr ≅ π_n^S` from StringOrientation S2.3. Layer 1's source is Milnor's *Lectures on the h-Cobordism Theorem*, which the sources sentence omits.

**Repair:** "- Develop James/EHP, real Bott periodicity and smooth framing comparisons, and compare them with the framed Pontryagin–Thom isomorphism supplied by TangentialBordism B5.5 and StringOrientation S2.3." and "Sources: Milnor (h-cobordism lectures), Kervaire–Milnor, Bott, Hatcher, Ranicki, Wall, Toda, Browder and Snaith."

## Verified sound

| Statement | Instances tried | Values computed on each side | Result |
| --- | --- | --- | --- |
| §1.1 collared cobordisms (sample) | `M × [0,1]`; empty boundary | `∂(M×I) = (−M) ⊔ M`; empty collar; Milnor Thm 1.4 p. 2, Cor 3.5 p. 23 | sound; locator R08 |
| §1.2 Morse handles (sample) | pair meeting once | Thm 5.4 p. 48 cancels it; reordering is Thm 4.8 p. 44, uncited | R07 |
| §1.3 handle trading (sample) | d = 6, 7 | indices 0, 1, d−1, d removed; Thm 8.1 p. 100 trades index 1 for 3, W, V simply connected, dim ≥ 5 | sound; R07 |
| §1.4 local Whitney move (sample) | r = 2, s = 3 in V⁵ | Thm 6.6 p. 71: r+s ≥ 5, s ≥ 3; r ≤ 2 needs `π₁(V−M′) → π₁V` injective | sound; page R08 |
| §1.6 index two/three | d = 6, 7 | spheres (2,3), (2,4); circle codimension 4, 5; proof of Thm 6.4 pp. 72–73 | sound |
| `exists_diffeomorph_prod_Icc_of_hCobordism` | n = 5; W = ∅; V₀ = ∂W | dim W = 6 meets Thm 9.1; ∅ not simply connected; V₀ = ∂W needs `∅ ≃ₕ W`, false | true |
| §2.1 `Θ_n` | n = 0, 1, 5 | n = 0: `S⁰` disconnected; n = 5: 6-dim h-cobordism gives diffeomorphism (Thm 9.2 p. 108) | R13 |
| §3.1 compact-open, Freudenthal (sample) | Y = [0,1], Z = ℚ; π₁₄(S⁸) | A.16 p. 531: Y LCH, Z Hausdorff, holds; Cor 4.24 p. 360: 14 < 2·8−1 | sound; R01, R10 |
| §3.2 James (sample) | X = S¹; X = M(ℤ/2,2) | `π₁JS¹ = ℤ = π₂S²`; `H̃₅(X∧X) = Tor(ℤ/2,ℤ/2) = ℤ/2`, tensor algebra 0 in degree 5 | Checks correct |
| §3.3 EHP, Toda (sample) | `⟨α,β,γ⟩` | indeterminacy `α∘π + π∘γ`, sum of the two composition subgroups | consistent; Toda unread |
| §4.2 Bott chain | R₀…R₇ | `π₀R_(i+1) = π_iO`: ℤ/2, 0, ℤ, 0, 0, 0, ℤ for i = 1…7; `π₀O = ℤ/2` | matches item 8 |
| `nonempty_realBottPeriodicity` | (1,3,11); (3,5,13); n = 2; i = 0 | ℤ/2 = ℤ/2; ℤ = ℤ; `π₁SO(2) = ℤ` excluded by `hn`; π₀ excluded by `NeZero` | true |
| `stableSOHomotopy_five/six_subsingleton` | SO(7), SO(8); SO(6) | stable as 7 ≥ 5+2, 8 ≥ 6+2; value 0; `π₅SO(6) = π₅SU(4) = ℤ` | true; R05 |
| §4.3 stable J (sample) | i = 1, 3 | VBKT Prop 4.1 p. 108: `Jf(x,y) = f_x(y)` on `Sⁱ×Dⁿ ⊂ ∂(Dⁱ⁺¹×Dⁿ)`; J₁ iso, J₃ onto ℤ/24 | sound; R10 |
| §6.1 almost-framed (sample) | hemispherical defect in S⁶ | lateral collar `(s,t,b) ↦ (t,c(εs,b))`, 0 < ε < 1, embedded at s = 1 | consistent; own carrier |
| §6.2 fillings (sample) | `D⁷`, n = 6 | boundary frame `(t,a) ↦ t − a x`; bP₇ = 0 (KM Thm 5.1 p. 512); `D⁷` has boundary | R03 |
| §6.3 exactness (sample) | n = 6 | `P₇ → Θ₆ → A₆ → P₆`; KM Lemma 4.2, line 308: kernel of `Θ_n → Π_n/p(Sⁿ)` is bP | sound; R07 |
| §7.1 below middle (sample) | n = 2i, 2i+1 | Ranicki line 235 p. 5: surgery makes (f,b) i-connected; §7.1 cites nothing | R08 |
| `EvenWallForm` | q = 0: ⟨1⟩, H(ℤ); q = 1 | ⟨1⟩: `λ(e,e) = 1 ≠ 2Q(e)`; H: polar `x₀y₁+x₁y₀ = λ`; q = 1: `λ(x,x) = 0`, Q in ℤ/2 | matches Ranicki line 263 |
| `EvenWallForm.Lagrangian` | q = 1, `ℤ(e+f) ⊂ H(ℤ)` | `λ(e+f,y) = y₁−y₀`, so `L⊥ = L`; `Q(e+f) = 1` | only `quadratic_zero` excludes it; R10 |
| `nonempty_evenWallGroup_two_mul_addEquiv_int` | k = 0, 1; E₈, H | σ(E₈)/8 = 1, σ(H) = 0; `F ⊕ −F ≅ Hʳ`, so the presentation is the Witt group | true for all k |
| `nonempty_evenWallGroup_two_mul_add_one_addEquiv_zmod_two` | k = 0; (Qe,Qf) = (1,1), (0,0) | Arf 1 and 0; (0,0) is `IsHyperbolicPlane`, hence zero | true |
| `oddWallGroup_subsingleton` | q = 0, 1; `∂(F,0) = (H(F);F,F)` | L₁(ℤ) = L₃(ℤ) = 0; F* complements both, so `IsTrivial` (Ranicki line 291) | true |
| §8.1 comparison (sample) | n = 6 | `π₅SO = 0`: `A₆ ≅ coker J₆ = π₆^S` as `π₆SO = 0`; KM Thm 4.1 (line 243) is finiteness | sound; R07 |
| §9.1 sixth stem (sample) | `ν₄∘Σ³ν₄`; S³×S³ | order 24 in π₁₀(S⁴) = ℤ/24⊕ℤ/3, 2 after suspension; Snaith Ex. 8.3 p. 31: Arf one | sound; R02 |
| `nonempty_sixthStableStem` | n = 8 | 14 ≤ 2·8−2, so stable; π₆^S = ℤ/2{ν²}; one-tactic probe fails | true |
| §10.1 recognition (sample) | M = S⁶; reversed B; M disconnected | identity; compose with a reflection; `≃ₕ S⁶` forces connected | sound; R08 |
| `exists_orientationPreserving_diffeomorph_sphere_six` | A, B standard; arbitrary oriented atlases | `IsOrientedAtlas` (OrientedAtlas.lean 283): maximal-atlas charts covering M; M connected, so one reflection fixes the sign | true |
| `nonempty_diffeomorph_sphere_six` | M = S⁶; Mathlib predicate | predicate lacks Compact and SecondCountable; H₆(M;ℤ/2) ≠ 0 forces compactness (Hatcher 3.29) | true; R06 |
| §3.1 item 4 ownership | GeneralizedCohomology G2 item 5 | (k−1)-connected CW: iso for i ≤ 2k−2; k = n gives q ≤ 2n−2 | duplicate; R01 |
| §9.1 item 1 ownership | StringOrientation S2.3 | `π₃S ≅ ℤ/24`, generator ν (line 639); line 100 notes the restatement | duplicate; R02 |
| Old ids | TopologicalKTheory 1605; GeneralizedCohomology 37 | `§4B.1–4B.9`, `Stage 3A`; head headings `### 4.2`, `### 3.1` | R04 |

- **Previous review:**
  - Repaired: R01, R02, R04, R07, R08, R09, R10, R11, R13, R15, R16 and R17.
  - Partly repaired: R03 (now R07), R05 and R06 (now R09), R12 (now R11), R14 (now R12), R18 (now R10, R15) and R19 (now R07, R08).
  - R17's own replacement text admitted n = 0; that is R13.
- **Gate rerun at f10f2a4:** every check 0, `OK`. Dependency check output: `depcheck: 222 roadmaps, 1964 edges, 0 problem(s)`. No change outside the folder.
- **Elaboration:** `lake env lean TauCetiRoadmap/HomotopySpheres/Suggested.lean` exits 0 with 10 `sorry` warnings and nothing else.
  - The worker's `#check @` types for all 30 declarations match the README; no binder is dropped.
  - The one-tactic probe (`infer_instance | simp | rfl | decide | exact ⟨⟩`) fails on all 10 theorems.
  - The R06 statement elaborates, and `Sphere 6` and `SmoothModel 6` are `rfl` to Mathlib's `𝕊⁶` and `𝓡 6`.
- **Source locators checked against the text (43):**
  - `kervairemilnor1963`: Thm 1.1, Lemmas 2.1–2.4, Thm 3.1, Thm 4.1, Lemmas 4.2–4.5, the Remark on p. 512, Thm 5.1, Lemma 7.2, §8 (pp. 531–536), the c(M) definition on p. 535, Lemma 8.4, Thm 8.5.
  - `milnor_hcobordism`: Thm 1.4, Cor 3.5, Thms 3.12–3.14, 4.8, 5.4, 6.4, Cor 6.5, Thms 6.6, 7.6, 7.8, 8.1, 9.1, 9.2.
  - `hatcher_at`: Cor 4.24, Props A.16 and 3.29. `hatcher_vbkt`: Prop 4.1. `ranicki2002`: §2, pp. 5–7.
  - Snaith, arXiv 1001.4751v1: Def 3.1, §3.1, Ex. 8.3.
- **Library declarations opened at the pins:**
  - Mathlib: `ContinuousMap.HomotopyEquiv.NonemptyDiffeomorphSphere` (PoincareConjecture.lean 41), and `Wanted/Geometry/Manifold/PoincareConjecture.lean`, which has no smooth six-dimensional statement.
  - Tau Ceti: `IsOrientedAtlas` (283), `orientationPreservingGroupoid` (129), `OrientationPreservingOn` (50), `boundaryChartedSpace` (Charts.lean 195), `isManifold_boundary` (321; a theorem, not an instance), `TauCeti.Manifold.Orientation` (Basic.lean 32).
  - Tau Ceti `TauCeti.e8Plumbing` is a four-dimensional plumbing graph, not §7.3's 4k-manifold. Tau Ceti `TauCeti.WittRing` covers fields with 2 invertible, not ℤ-forms. Neither duplicates this roadmap.
- **Cross-roadmap citations resolved on main (22):**
  - AlgebraicTopology §4.8 and `relativeHurewicz`, `homologicalWhitehead`, `poincareDualityMap_isIso`, `compactManifoldFiniteCWType`.
  - GeometricTopology §1.2 and §4.3.1; DifferentialGeometry Layers 2 and 10; HeegaardFloer Lane M and F0; UniversalCovers.
  - TopologicalKTheory T1.5, T1.6 and T7; CharacteristicClasses C1.1a (line 246) and C2.0.
  - SpinRepresentations Layer 7; RiemannianGeometry R1–R3; MorseTheory M5; GeneralizedCohomology G4; TangentialBordism B5.2 and B5.5; StringOrientation S2.3; IntegralLattices 1I and 6A.
  - The overlap tool's "C1.1a only at #1807" is a false lead: C1.1a is on main.
- **Ownership against open pull requests:**
  - Real Bott periodicity is also built in DGFloerPartII 4.2a–4.2c (#1799, merge order 338), and the James reduced product in GeneralAlgebraicKTheoryPartII §4.30b (#1742, 337). This roadmap (45) is the earlier owner, so those two roadmaps are the ones that must cite it.
  - TopologicalKTheory and GeneralizedCohomology on main consume §4.2. The chains T1.6 → §4.1 → §4.2 → T7 and §3.1 → G2 → G4 → §5.1 are acyclic.
  - #1287 changes this folder with a conflicting head, and the description puts #284 first.

## Not verifiable

- Smale 1961, Bott 1959, Browder 1969: JSTOR only (DOIs 10.2307/1970239, 1970106, 1970686), so they are cited by locator; Browder's Arf comparison has no theorem number to check.
- James 1955: the only copy found is hosted by a third party on a host the sources service puts in no licence class, so it was not read; Theorems 1.11, 1.12 and 5.6 are unchecked.
- Whitehead GTM 61, Toda 1962, Wall 1999, Steenrod 1951, Husemoller, Pontryagin 1959, Thom 1954, Kosinski, Hirsch, Milnor *Morse Theory*: books with no legal open copy, so their chapter locators are unchecked.
- The #1287 head is not in the roadmap index, so its contents were not compared; only its stated order was checked.

## Source issues

- none
