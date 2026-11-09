# Review of TeichmullerGeometry (pull request #1169 at 2045060)

**Verdict:** needs changes

This is a full re-review: the folder changed by 229 lines since `73cc9c4`. Of the previous round's nine findings:

- six are repaired;
- two are partly repaired (R01, R02);
- one is not repaired (R08).

The gate passes. Three findings block:

- FuchsianOrbifolds at #1168 still consumes this roadmap, so the supply is cyclic (R01);
- the supplier contract gives DifferentialGeometry's Laplacian the wrong sign (R02);
- the outer automorphism group has a second owner, FiniteGroupInvariants (#1708), and a pinned Tau Ceti variant that the README does not mention (R03).

Mechanical checks at this head:

- **Gate.** My own run agrees with the worker's:
  - `set_option=0 … sorry-data=0 … statement-hygiene=0 … depcheck=0 … outside-folder=0 source-material=0 OK`.
- **Elaboration.** `lake env lean TauCetiRoadmap/TeichmullerGeometry/Suggested.lean` exits 0. It gives 22 `declaration uses 'sorry'` warnings and nothing else.
- **Dependency check.**
  - It prints `depcheck: 238 roadmaps, 2349 edges, 0 problem(s)`, with no UPWARD, CYCLE or `moved:` line.
  - It reads only main, so it cannot see the cycle through #1168 (R01).
- **Other changes.** `git diff --stat origin/main...HEAD -- . ':!TauCetiRoadmap/TeichmullerGeometry'` is empty. The folder holds `README.md`, `Suggested.lean` and `metadata.toml`.

## Previous findings

- **R01 (supply with #1168): partly repaired.**
  - **Repaired in this README.**
    - Line 26 cites FuchsianOrbifolds Layer 0 item 2 for the isometry and the kernel, and §4.1 (line 496) keeps only surjectivity: "every isometry of `ℍ` arises, by the following argument, which is the roadmap's own".
    - §0.0f no longer consumes FuchsianOrbifolds Layer 5.
    - Line 40 now reads "FuchsianOrbifolds supply this roadmap and consume nothing from it".
  - **Not repaired.** #1168's head is unchanged (`62cca0d1`), and its Layer 9 still consumes this roadmap (R01 below).
- **R02 (GeometricTopology ownership): partly repaired.**
  - **Sphere and torus: repaired.** Line 16 reads "the topological forms `mcg_sphere_full` and `mcg_torus_full` … transported from GeometricTopology Layers 1.7.2 and 3.4 through §0.0h". §5.4a routes the torus through GeometricTopology Layer 1.7.2.
  - **Path smoothing: open.** Line 12 now says GeometricTopology Layer 3 does not state the converse. #903 line 1320 still assigns "the smoothing of paths" to its Layer 3.3 (R05).
- **R03 (`S²` in Dehn–Nielsen–Baer): repaired.**
  - Line 581: "the Dehn–Nielsen–Baer isomorphism `dehn_nielsen_baer` (5.4) are stated and proved for closed orientable surfaces of genus at least one".
  - §5.1 excludes the sphere (line 585), and the Check at line 620 computes `ℤ/2 → 1`.
- **R04 (missing headlines): repaired.** `dehn_nielsen_baer` (`Suggested.lean` line 592) and `measurable_riemann_mapping` (line 680) are stated. The Dehn–Nielsen–Baer bullet has left the docstring's not-statable list.
- **R05 (`Max_g`, `ML(T²)`): repaired.**
  - Line 944: "So `Max_g` lies in the locus of Layer 8.5. The converse is not claimed".
  - Line 964 and line 781 (`ML(T²) = ℝ²/{±1}`) are also repaired.
- **R06 (`IsLocalPowerAt`): repaired.**
  - `Suggested.lean` line 372 reads `local_power : ∀ x ∈ (𝓡∂ 2).interior X, TauCeti.IsLocalPowerAt p x (e x)`.
  - `HasPowerMapModelAt` and `local_degree_unique` are deleted.
  - The Tau Ceti contract (line 65) lists `unique`, `ne_zero`, `exists_ncard_inter_preimage_eq` and `isLocalPowerAt_id`.
- **R07 (locators): repaired.**
  - §0.0g (line 233), §4.1 (line 496), §8.3 (line 802) and §10.2 (line 907) now carry "the roadmap's own".
  - §5.1 (line 585) cites Hatcher Example 1B.2, p. 88, and Proposition 1B.9, p. 90. Both are verified at hatcher2002 lines 3810 and 3905.
- **R08 (dependencies in the description): not repaired.** The task list still reads "depends on: #953", and the merge-order paragraph still names #271 (R10).
- **R09 (old → new ids): repaired.** Lines 984–995 map `T0`–`T10`, the lattices `Γ(O)` and the minimum area `π/21`.

## R01 (P2) — FuchsianOrbifolds at #1168 still consumes this roadmap, so the supply is cyclic

**Location.** README line 40: "Supply runs one way: GeometricTopology, ComplexCurveModuli and FuchsianOrbifolds supply this roadmap and consume nothing from it." Line 980 reads "FuchsianOrbifolds, a supplier of this roadmap, consumes none of these."

**Claim.**
- **This roadmap needs #1168.** The PGL form of Layer 0 item 2, Layer 4a and Layer 7 items 1 and 4 exist only at #1168's head.
  - Main's FuchsianOrbifolds ends at Layer 6.
  - Main's Layer 0 item 2 (its line 198) only restricts the action along `PSL(2,R) → PGL(2,R)`.
- **#1168 consumes this roadmap.** At its unchanged head `62cca0d1`, Layer 9 consumes this roadmap's `T0`, `T4a`, `T9` and `T10`. By lines 986–993 of this README, these are Layer 0, §§4.2–4.5, §4.1 with Layer 10, and Layer 11.
- **Consequence.** Lines 40 and 980 are false at the head this roadmap depends on, and the two roadmaps supply each other.
- **What remains.** This README's side of the previous R01 is done. The rest of the repair is in #1168, which has the same author.

**Witness.** #1168 `TauCetiRoadmap/FuchsianOrbifolds/README.md`:
- line 32: "`Teichmuller T0,T4a,T9,T10 → Fuchsian L9`";
- line 1443: "Consume the following precise T9/T10 interfaces";
- line 188 lists the same edge.

**Repair.**
- **In #1168.** Move Layer 9 (the p85 application) to the later Fuchsian roadmap that line 980 already names. Delete the `→ Fuchsian L9` edges at #1168 lines 32, 146–147, 183–189 and 1461–1487.
- **In this README.** No change is needed.
- **Re-test.** After the move, `grep -n Teichmuller` on #1168 returns only ownership notes, none of them consumed.

## R02 (P2) — The supplier contract gives DifferentialGeometry's Laplacian the wrong sign

**Location.**
- Line 77: "Layer 12 (Riemannian metrics, `Δ = −div grad`)".
- Line 31: "the Riemannian Laplacian convention: DifferentialGeometry Layers 0, 2, 5 and 12".
- §4.5 Check 1 (line 565): "with the opposite Laplacian sign the equation would read `−Δu + K₀ + e^(2u) = 0` and the uniqueness proof's monotonicity would fail".

**Claim.**
- **Two conventions.** DifferentialGeometry on main fixes `Δ = div ∘ grad`. This roadmap's `Δ⁺` (line 48) and ComplexCurveModuli D0 item 4 use `Δ = −div grad`.
- **The contract inverts the sign.** In fact `Δ⁺ = −laplaceBeltrami`, but the contract tells an implementer the reverse. Substituting DifferentialGeometry's operator into the displayed equation `Δ⁺u + K₀ + e^(2u) = 0` gives a different equation.
- **The Check does not catch this.** With the opposite-sign `Δ`, `−Δu + K₀ + e^(2u) = 0` is the same equation, so its monotonicity does not fail.

**Witness.**
- DifferentialGeometry README:
  - line 45: "**Laplacian sign**: `Δ = div ∘ grad`, Mathlib's and the PDE roadmap's";
  - line 921: `laplaceBeltrami := divergence ∘ mgradient`.
- ComplexCurveModuli D0 item 4: "Fix positive Laplacian Δ=−div grad".
- On flat `ℝ²`, `laplaceBeltrami (x²) = 2` and `Δ⁺(x²) = −2`.

**Repair.**
- **Line 77.** Write "Layer 12 (Riemannian metrics and `laplaceBeltrami := divergence ∘ mgradient`, `Δ = div grad`, the negative of this roadmap's `Δ⁺`)".
- **Line 48.** Add "`Δ⁺` is `−laplaceBeltrami` of DifferentialGeometry Layer 12.3 and is ComplexCurveModuli D0 item 4's positive Laplacian".
- **Line 565.** Replace the clause after the semicolon with:

  > substituting DifferentialGeometry's `laplaceBeltrami = div grad` for `Δ⁺` gives `div grad u + K₀ + e^(2u) = 0`. Its linearization at `u = 0`, `Δ⁺v = 2v`, has nonzero solutions whenever `2` is an eigenvalue of `Δ⁺`. The correct linearization `Δ⁺v + 2v = 0` has only `v = 0`.

- **Test.** For `h₀` of curvature `−1` and `u = 0`, the corrected equation still reads `0 + (−1) + 1 = 0`.

## R03 (P2) — The outer automorphism group has a second owner and an unmentioned pinned variant

**Location.**
- §4.2 (line 509): "Define the **outer automorphism group** `OuterAut G` of a group `G` as `MulAut G` modulo the range of `MulAut.conj`".
- Scope line 16: "with the outer automorphism group `OuterAut`".
- `Suggested.lean` lines 532–543 (`innerAut_normal`, `OuterAut`).

**Claim.**
- **Second owner.** FiniteGroupInvariants (#1708, a new roadmap) defines the same quotient and proves the same normality in its Layer 3.1.
  - Its suppliers end at merge-order line 62 (InductionRestrictionPartII), so it comes before this roadmap (line 283).
  - Its standing convention asks `[Finite G]`, which neither the definition nor the normality needs.
- **Pinned variant.** Tau Ceti has the topological form `TauCeti.ContinuousOut G`. For the discrete topology every automorphism is continuous, so it is `OuterAut G`.
- **The README names neither.**

**Witness.**
- #1708 `TauCetiRoadmap/FiniteGroupInvariants/README.md` line 665: "Define `Inn(G)` as the range of `MulAut.conj` and `Out(G) = MulAut G ⧸ Inn(G)`. Prove `Inn(G)` is normal". Its Check "`|Out(Q₈)| = 6`" is this README's line 524 Check.
- Tau Ceti `TauCeti/Topology/Algebra/Group/ContinuousAut/Basic.lean`, lines 237 (`normal_range_conj`) and 311 (`ContinuousOut`).

**Repair.**
- **Settle one owner with #1708.** The preferred route:
  - FiniteGroupInvariants Layer 3.1 states `Out(G)` and the normality of `Inn(G)` for every group.
  - Add a `### From TauCetiRoadmap.FiniteGroupInvariants` contract: "What FiniteGroupInvariants must provide (gap:outer-automorphism-group-of-any-group): `Out(G) = MulAut G ⧸ Inn(G)` and the normality of `Inn(G)`, for an arbitrary group `G`".
  - §4.2 and Scope line 16 cite it.
  - `Suggested.lean` keeps `OuterAut` and `innerAut_normal` only so that `dehn_nielsen_baer` is statable.
- **If #1708 keeps the finiteness binder.** Scope line 16 says in one clause that `OuterAut` is the all-groups form of #1708's Layer 3.1.
- **In both cases.** Add to §4.2 the clause and a Check: "for the discrete topology `OuterAut G` is Tau Ceti's `TauCeti.ContinuousOut G`". Tested on `Q₈`, both give `24/4 = 6`.

## R04 (P3) — Tau Ceti's holomorphic Riemann–Hurwitz formula is not cited where it applies

**Location.**
- §8.3 (line 802): "So `riemannHurwitz` (§0.0g) with `Surface.eulerChar_eq_two_sub_two_mul_genus` (§0.0f) gives the **Riemann–Hurwitz formula for the quotient**".
- §10.4 (line 938): "the Riemann–Hurwitz formula of §0.0g, applied to this quotient map as in §8.3".
- Scope line 9.

**Claim.**
- **The pinned theorem applies.** `X → X/F⁺` is a finite holomorphic map of compact connected Riemann surfaces (FuchsianOrbifolds Layer 1). Tau Ceti proves `χ(X) = deg f · χ(Y) − R(f)` for exactly such maps.
- **The dependency is avoidable.** Layers 8.3 and 10.4 therefore need not depend on §0.0g, with its Radó theorem and lifted triangulations.
- **The kept variant is unexplained.** The README also omits Tau Ceti's `TopBranchedCover` and its weighted-fibre degree theorem, a special case of `IsBranchedCover.exists_degree`. So the kept topological variant never says how it differs.

**Witness.** Tau Ceti:
- `TauCeti/Analysis/Complex/RiemannSurface/Branch/EulerCharacteristic.lean` line 130, `FiniteHolomorphicMap.eulerChar_eq_degree_mul_eulerChar_sub_ramificationDegree`;
- `TauCeti/AlgebraicTopology/ThricePuncturedSphere/TopBranchedCover.lean`, lines 148 (`TopBranchedCover`) and 347 (`finsum_mem_preimage_singleton_localDegree`).

**Repair.**
- **§8.3 and §10.4.** Apply the pinned theorem with `R(f) = |F⁺| Σᵢ(1 − 1/mᵢ)`, and put it in their *Needs* in place of §0.0g.
- **Tau Ceti contract.** List both declarations.
- **Scope line 9.** Add: "§0.0g's topological branched covers differ from Tau Ceti's holomorphic ones by allowing non-holomorphic maps, boundary and nonorientable surfaces".
- **Test.** On the genus-two hyperelliptic quotient, `R = 6 · (2 − 1) = 6`, and `−2 = 2 · 2 − 6`.

## R05 (P3) — GeometricTopology Layer 3 is cited for isotopy extension, which it leaves to Tau Ceti, and path smoothing still has two claimants

**Location.**
- §0.3 (line 305): "Isotopy extension is GeometricTopology Layer 3.3's: a smooth family of embeddings of a compact manifold into a boundaryless manifold extends to a `TauCeti.Diffeotopy` compactly supported…".
- Also contract line 81, Scope lines 12 and 27, and §0.2 (line 285).

**Claim.**
- **Isotopy extension.** #903's §3.3 attributes this statement to Tau Ceti's `TauCeti.SmoothIsotopy.exists_diffeotopy_apply_eq` and plans it no further.
  - The pinned theorem gives a diffeotopy, fixed outside a compact set, that agrees with the isotopy on a compact subset of the source.
  - That covers §0.3: apply it in the interior, or in a prescribed open neighbourhood of the trace.
- **Path smoothing (previous R02, remainder).**
  - #903 line 1320 still says "the smoothing of paths is Layer 3.3's", but its §3.3 never states it.
  - §0.2 owns the theorem only for compact surfaces, although it and its Kriegl–Michor locators hold for every compact manifold.
  - Tau Ceti has no path-to-diffeotopy converse at the pin.

**Witness.**
- #903 `TauCetiRoadmap/GeometricTopology/README.md` lines 1367–1378 ("None of these is planned again here") and 1318–1320.
- Tau Ceti `TauCeti/Geometry/Manifold/SmoothIsotopy/Extension.lean` line 82.

**Repair.**
- **§0.3, the Tau Ceti contract and §0.3 *Needs*.**
  - Write "isotopy extension is Tau Ceti's `TauCeti.SmoothIsotopy.exists_diffeotopy_apply_eq` (Hirsch, Chapter 8, Theorem 1.3)".
  - Cite GeometricTopology Layer 3.3 only for its relative form.
- **Path smoothing.** #903 has the same author; it does one of two things:
  - its §3.3 states the theorem for compact manifolds, relative to a collar, and §0.2 and line 12 cite it;
  - or it deletes the clause at its line 1320, and §0.2 states the theorem for every compact manifold, surfaces being the instances.

## R06 (P3) — PDE is cited by lane labels that its README no longer has

**Location.**
- Line 37: "PDE Lane B items 8, 9 and 10".
- Line 61: "PDE Lane A".
- Also lines 101, 555, 569, 577, 737, 741 and 762.

**Claim.** Main's PDE README is organised in Layers:
- Layer 1, §§1.1–1.7, tagged (A1)–(A7);
- Layer 2, §§2.1–2.3, tagged (B8)–(B10).

The labels "Lane A" and "Lane B" occur nowhere in it.

**Witness.** PDE README:
- line 1098: "### 2.1 The Hardy–Littlewood maximal function (B8)";
- line 1148: "### 2.2 Interpolation (B9)";
- line 1187: "### 2.3 Calderón–Zygmund theory (B10)".

**Repair.**
- Replace each "PDE Lane B item 8/9/10" with "PDE §2.1 (B8)", "§2.2 (B9)" or "§2.3 (B10)", and "PDE Lane A" with "PDE Layer 1 (A1–A7)".
- Tested: §2.3 states the Calderón–Zygmund `Lᵖ` bounds, the Mihlin–Hörmander theorem and the absence of an `L¹` bound, which matches line 101 and §7.4 Check 3.

## R07 (P3) — Two Checks argue from conditions that cannot discriminate

**Location.**
- §4.1 Check 1 (line 500): "a convention applying conjugation for `det > 0` instead would make `−I` act as a reflection, contradicting that `−I` is central".
- §10.3 Check 4 (line 932): "two nonisomorphic genus-two surfaces can have isomorphic unmarked double covers of genus three only if related by a deck-preserving isometry".

**Claim.**
- **§4.1 Check 1.** Under the inverted convention, `I` and `−I` both act by `z ↦ z̄`, which agrees with `−I` being central. The real failure is elsewhere: `I` does not act as the identity, and `i ↦ −i` leaves `ℍ`.
- **§10.3 Check 4.** A deck-preserving isometry of the covers descends to an isomorphism of the quotients. That contradicts "nonisomorphic", so the Check exhibits no failure.

**Witness.** Mathlib `Mathlib/Analysis/Complex/UpperHalfPlane/MoebiusAction.lean` lines 91–92: `σ g` is the identity when `0 < det g` and conjugation otherwise. Under the inverted rule `I • i = conj i = −i`, and `Im(−i) < 0`.

**Repair.**
- **Line 500.** Write "a convention applying conjugation for `det > 0` instead would send `I` to `z ↦ z̄`, which is not the identity and takes `i` to `−i ∉ ℍ`".
- **Line 932.** Delete the Check. §10.3 keeps three Checks.

## R08 (P3) — Four sampled targets have neither a locator nor the "roadmap's own" clause

**Location.**
- §1.1 (line 352): "Prove that the Nijenhuis tensor of `J` vanishes in real dimension two".
- §2.1 (line 392): "prove that `κ_X` is a local homeomorphism onto an open marked neighbourhood".
- §3.2 (line 462): "Prove that the two formulas define the same left action".
- §4.3 (line 530): "hence `Π ≃ ⟨aᵢ, bᵢ | R = 1⟩`".

**Claim.** Each states a theorem. §§0.5, 4.1, 5.6, 8.3 and 10.2 carry a locator or the clause; these four carry neither.

**Witness.** hatcher2002:
- lines 2266–2268: Proposition 1.26(a), p. 50;
- lines 2318–2325: the genus-`g` presentation, p. 51, with the 2-cell attached along `[a₁,b₁]⋯[a_g,b_g]`.

Hatcher composes paths in first-traverse order, which is this roadmap's geometric `Π`.

**Repair.**
- **§4.3.** Add "(Hatcher, *Algebraic Topology*, Proposition 1.26(a), p. 50, and the computation following it, p. 51)".
- **§§1.1, 2.1 and 3.2.** Add a theorem-and-page locator, or the clause "proved by the route given here, which is the roadmap's own".

## R09 (P3) — The module docstring omits Teichmüller's extremal theorem, and four instances have no docstring

**Location.**
- `Suggested.lean` lines 59–73, the "Not statable at the pins" list.
- Lines 213, 216, 247 and 250.

**Claim.**
- **Teichmüller's theorem.** The Summary lists Teichmüller's extremal theorem (§7.5) among what is built. `Suggested.lean` neither states it nor names it as not statable.
  - It needs no `Teich(Σ)` carrier.
  - It does need quasiconformal maps between compact Riemann surfaces, their maximal dilatation and holomorphic quadratic differentials, none of which is at the pins.
- **Instances.** The four instances have no docstring, although the form asks for one on every declaration.

**Witness.** `grep -n "Teichmüller's\|extremal" Suggested.lean` returns nothing. Lines 213–217 and 247–251 carry no `/--`.

**Repair.**
- Add to the not-statable list: "Teichmüller's existence and uniqueness theorem (Layer 7.5): quasiconformal maps between compact Riemann surfaces, their maximal dilatation and holomorphic quadratic differentials have no carrier at the pins".
- Give each of the four instances a one-line docstring.

## R10 (P3) — The description still declares the wrong dependencies

**Location.** The description:
- task list: "- [ ] depends on: #953";
- merge-order paragraph: "#271 (SurfaceTopology, mccorvie) → **this pull request**".

**Claim.**
- **Stale entries.** ComplexKahlerGeometry (#953) is on main. SurfaceTopology is barred as a supplier, and neither file of this folder names it.
- **Missing entries.** Two sets of cited sections exist only at open heads:
  - GeometricTopology Layers 1.7.2, 3.3, 3.4, 11.2.1 and 11.3, only at #903's head;
  - FuchsianOrbifolds Layers 4a and 7, and the PGL form of Layer 0 item 2, only at #1168's head.
- **Consequence.** The chain computed from the task list names a wrong predecessor and misses both real ones.

**Witness.** On main:
- GeometricTopology has unnumbered Layers 1 (line 177), 3 (line 357) and 11 (line 831);
- FuchsianOrbifolds ends at Layer 6.

The overlaps report says that #1168 "must merge first".

**Repair.** Make the task list read "- [ ] depends on: #903" and "- [ ] depends on: #1168", and drop #953. The computed merge-order paragraph then names #903 and #1168, not #271.

## Verified sound

### Adversarial table

The table has 38 rows. They cover the fifteen sampled targets, every declaration of `Suggested.lean` and every target a finding touches.

| # | Statement | Instances | Values computed | Result | Change |
|---|---|---|---|---|---|
| 1 | §0.0a `exists_pl_approximation_open` | `f = id`; the `1/q` error; `(x,y) ↦ (x³,y)`; unbounded source | `g = id`; the error has infimum 0 on every ball, so it is excluded; `IsPLOn` is local (Tau Ceti `PL/Map.lean` line 187), so unbounded sources are fine | true | none |
| 2 | §0.0a `exists_pl_approximation_halfPlane` | `(x₀,x₁) ↦ (x₀, x₁+x₀²)` | keeps `x₀ ≥ 0`, fixes `x₀ = 0`; `hH` and `hB` hold | true | none |
| 3 | §0.0b `image_boundary` | closed disc vs `S²`; origin of the half-plane | `∂ = S¹` vs `∅`; the origin is in the boundary | true | none |
| 4 | §0.0d `isotopic_of_homotopic_closedSurface` | `S²` identity vs antipodal map; `RP²`; disconnected `M` | degrees `1` and `−1`, not homotopic; `Mod(RP²) = 1`; holds componentwise; epstein1966 line 604 | true | none |
| 5 | §0.0d `isotopicRel_of_homotopicRel` | disc, identity vs conjugation; annulus twist; disc map equal to the identity on `∂` | conjugation ≠ identity on `∂D`, so the hypothesis fails; the twist is not homotopic rel `∂`; Alexander's trick | true | none |
| 6 | §0.0f `word`, `schemaGluing` | `orientable 0 0`, `orientable 0 1`, `nonorientable 1 0` | `exp(πit) ~ exp(−πit)`; `exp(2πit/3) ~ exp(−2πit/3)`, with the free arc's ends identified; `exp(πit) ~ −exp(πit)` | sphere, disc, `RP²` | none |
| 7 | §0.0f `eulerChar_model` | sphere, disc, `RP²`, Klein bottle, Dyck surface | `2−1+1=2`; `2−2+1=1`; `1−1+1=1`; `0`; `−1` | correct | none |
| 8 | `classification_of_surfaces`, `homeomorph_iff_invariants`, `homeomorph_unique` | torus / genus 2; torus / Klein bottle; torus / annulus | `(χ,o,b)`: `(0,+,0)` vs `(−2,+,0)`; vs `(0,−,0)`; vs `(0,+,2)` | each invariant needed | none |
| 9 | `Surface.genus`, `eulerChar_eq_two_sub_two_mul_genus` | `S²`, `T²`, genus 2; Klein bottle; a non-surface | `0, 1, 2` with `χ = 2, 0, −2`; Klein bottle genus 2 but `χ = 0 ≠ −2`, excluded by orientability; `sInf ∅ = 0` | true | none |
| 10 | §0.0g `IsBranchedCover`, `exists_degree`, `riemannHurwitz` | `zⁿ` on `Ĉ`; `zⁿ` on the disc; a regular value in `B` | `2 = 2n − 2(n−1)`; `1 = n − (n−1)`; it contributes `0` | true | R04 (use) |
| 11 | §0.0h `isotopicToIdSubgroup`, `MappingClassGroupPL.toTop_bijective` | disc conjugation; annulus twist; `S₄` on `∂Δ³` | `\|MCG(D²)\| = 2`; the twist is trivial via `([θ+st], t)`; even permutations are trivial; the subgroup proofs compile | consistent | none |
| 12 | §0.2 paths and isotopies | rotation vs antipodal map of `S²`; torus shear | antipodal degree `−1`; the shear acts by `[[1,0],[1,1]] ≠ I`; kriegl-michor1997 lines 20142, 20284, 20817 | true | R05 (owner) |
| 13 | §0.3 isotopy extension | translated line `ℝ×{0}`; point pushed along a segment | no compactly supported extension; the pinned theorem gives a compact support `K` | true | R05 |
| 14 | §0.4 markings | generic torus shear; genus-2 hyperelliptic involution | `[[1,1],[0,1]] ≠ ±I`, not realized; `h_* = −I`, realized | consistent | none |
| 15 | §1.1 Nijenhuis in dimension two | `N(v, Jv)` | `[Jv,−v] − J[v,−v] − [v,Jv] = 0` | true | R08 |
| 16 | §2.1 and §2.4, dimension | `g = 1, 2, 3` | `0+0+1 = 1`; `4+1−2 = 3`; `8+1−3 = 6` | true | R08 (§2.1) |
| 17 | §3.1 `Mod±` | `S²`, `T²` | `ℤ/2`; `GL₂(ℤ) = OuterAut ℤ²` | consistent | none |
| 18 | §3.2 action law | `f, g` orientation reversing | `ε(fg) = 1`; `(−1)(−1)(f⁻¹)^*(g⁻¹)^* = ((fg)⁻¹)^*`; with `ε f^*` it is a right action | left action | R08 |
| 19 | §4.1 `exists_mulEquiv_isometryEquiv_glAction` | `diag(1,−1)`, `diag(−2,1)`, `λI` with `λ < 0` | `−z̄`; `i, 2i ↦ 2i, 4i` with `dist = log 2`; `det = λ² > 0`, so `λI` acts trivially | true | none |
| 20 | §4.1 Check 1 | inverted convention | `I ↦ z̄`, so `i ↦ −i ∉ ℍ`; `−I ↦ z̄` too | the stated reason is false | R07 |
| 21 | §4.2 `OuterAut` | trivial group, `S₃`, `Q₈`, `ℤ`, `ℤ²`; `ContinuousOut` with `⊥` | `1`; `6/6`; `24/4 = 6`; `2`; `GL₂(ℤ)`; `ContinuousAut = MulAut` | correct; second owner | R03 |
| 22 | §4.2 `η` | circle generator | `η(op p) = loopDeck(p⁻¹)`, translation by `+1`; `op p ↦ loopDeck p` is an antihomomorphism | true | none |
| 23 | §4.3 attaching word | `g = 1, 2` | `B⁻¹A⁻¹BA ↦ R⁻¹`; `[a₁,b₁]⁻¹[a₂,b₂] = [a₂,b₂]² ≠ 1` in `Π` | true | R08 |
| 24 | §4.5 curvature equation | `u = 0`; `u = x²` on flat `ℝ²` | `0 + (−1) + 1 = 0`; `laplaceBeltrami = 2` vs `Δ⁺ = −2` | sign misattributed | R02 |
| 25 | §5.4 `dehn_nielsen_baer` | `T²`, `S²`, Klein bottle | `GL₂(ℤ)` on both sides; `1 ≤ 0` is false; orientability excludes the Klein bottle | true | none |
| 26 | §5.2 `exists_diffeomorph_mapOfEq_eq` | `S²`; torus shear | `Aut(1) = 1`; `(x, x+y)` fixes `0` | true | none |
| 27 | §5.4 `baer_epstein_smooth` | `(x,−y)` on the Klein bottle and on the torus | `= (x+½, y)`, isotopic; `diag(1,−1)` on `H₁`, not homotopic | true | none |
| 28 | §5.4a `mcg_sphere_full`, `torusLinearHomeomorph`, `mcg_torus_full` | `diag(1,1,−1)·(−I)`; shear; `−I`; swap; `AB` | rotation by `π`, `det 1`; `det 1`; four fixed points; `det −1`; `torusLinearHomeomorph (AB) = A ∘ B` | true | none |
| 29 | §5.6 stabilizers | `H = Aut(Π)`, `Inn(Π)` | `∞` with empty fixed set; `1`, everything fixed | consistent | none |
| 30 | §7.4 `measurable_riemann_mapping` | `μ = a`; `μ = 0`; `k < 0` | `U z 1 = 1`, `U z i = i(1−a)/(1+a)`, `f_z̄ = a/(1+a) = a f_z`; `f_z̄ = 0`; `hbound` is false | true | none |
| 31 | §7.5 Teichmüller metric and theorem | Teichmüller map with parameter `k` | `d_T = ½ log((1+k)/(1−k)) = artanh k` | consistent; not named | R09 |
| 32 | §8.2 `nielsen_realization` | `⟨−I⟩` on `T²`; Klein four-group with a translation | `(½−x, −y)` is a second lift; the four-group maps onto `F` but not injectively | true | none |
| 33 | §8.3 quotient Riemann–Hurwitz | hyperelliptic genus 2, via the pinned holomorphic theorem | `−2 = 2·2 − 6` | consistent | R04 |
| 34 | §8.5 genus-two kernel | `h = 0, 1, 2` | `r = 6`, `\|K\| = 2`; `2 ≥ 3` impossible; `\|K\| = 1` excluded | true | none |
| 35 | §10.1 index bound | `(2,3,7)`; Bolza surface | `1/42`; `96 ≤ 168` and `96 > 84` | true | none |
| 36 | §10.3 Check 4 | deck-preserving isometry of the covers | it descends to `X ≅ Y` | Check vacuous | R07 |
| 37 | §10.4 and §11.1 | `B_Π`; Klein quartic | the nontrivial-stabilizer locus is `B_Π`, so `Max_g` lies in the Layer 8.5 locus; `168 = 84·2`, `336 = D`; arithmetic and not maximal | consistent | none |
| 38 | line 40, supply direction | #1168 Layer 9 | it consumes `T0`/`T4a`/`T9`/`T10`, which are Layer 0, §§4.2–4.5, §4.1 with Layer 10, and Layer 11 | false at the head it needs | R01 |

### Probes and signatures

- **One-tactic probe.** I replaced all 22 `sorry`s with `first | rfl | simp | infer_instance | trivial | decide | exact?` in a scratch copy, and all 22 fail. `homeomorph_unique`, `isSurface_model` and `eulerChar_model` pin down the models used by the classification and genus, so I do not count them as padding.
- **Signature check.** I appended `#check @` for 34 declarations to a scratch copy and elaborated it once. Every type matches its README statement:
  - `isotopicRel_of_homotopicRel` keeps `T2Space` and `CompactSpace M`;
  - `riemannHurwitz` keeps compactness, connectedness and Hausdorffness;
  - `dehn_nielsen_baer` keeps `T2Space`, `CompactSpace`, `ConnectedSpace`, `hb`, `ho` and `hg`;
  - no binder is lost, and nothing was changed.
- **The worker's signature file.** Its `groups`, `group` and `and` entries are words of the module docstring, not declarations.

### Headline theorems

- **Stated.**
  - PL approximation in both forms; invariance of the boundary; Epstein's two theorems;
  - the classification, the complete invariant and the genus;
  - degree and Riemann–Hurwitz;
  - the PL comparison;
  - `Isom(ℍ) ≃ PGL₂(ℝ)`;
  - based realization; the Baer–Epstein kernel theorem; Dehn–Nielsen–Baer;
  - the sphere and the torus;
  - measurable Riemann mapping;
  - Nielsen lifting.
- **Named as not statable.** `Teich(Σ)`, its atlas and dimension, Fenchel–Nielsen, completeness, the fixed-point form of Nielsen realization, the fixed-locus dimension, the four loci, and the Euler number.
- **Missing.** Teichmüller's extremal theorem (R09).

### Library declarations resolved at the pins

- **Elaborated by `#check`.** 78 names from the Mathlib and Tau Ceti contracts, in a scratch file that exits 0.
- **Opened in source:**
  - Mathlib `Analysis/Complex/UpperHalfPlane/MoebiusAction.lean` lines 91–92 (`σ`) and 181 (`glAction`), and `Metric.lean` line 329 (an isometric action of `SL(2,ℝ)` only, none for `GL`).
  - Tau Ceti, by file:
    - `Topology/PL/Map.lean` line 187;
    - `Topology/Covering/LocalPower.lean` (`unique`, `ne_zero`, `exists_ncard_inter_preimage_eq`, `isLocalPowerAt_id`);
    - `Geometry/Manifold/Basic.lean` line 128;
    - `Geometry/Manifold/Boundary/Collar/Local.lean` line 246 (`interiorEmbedding`, into `EuclideanHalfSpace (n+1)`);
    - `SimplicialComplex/Realization/CWComplex/EulerCharacteristic.lean` line 156, which needs `M` in the vertex universe, as §0.0c notes;
    - `Topology/Triangulable/FiniteCWType.lean` line 41;
    - `Data/Rat/BranchDeficit.lean` lines 116 and 196;
    - `SmoothTriangulation/Basic.lean` line 209 (`n ≠ 0`);
    - `Diffeomorphism/Sphere.lean` line 283;
    - `Diffeomorphism/Disc.lean` line 63 (`[NeZero n]`);
    - `Sobolev/WeakDeriv/Basic.lean` line 251;
    - `UniversalCover/Deck/FundamentalGroup/UniversalCover.lean` line 115;
    - `UniversalCover/Action.lean` line 172;
    - `Diffeotopy/Path.lean` line 74;
    - `Topology/Homotopy/Isotopy/Basic.lean` lines 114, 163 and 281;
    - `Topology/CombinatoriallyTriangulable.lean` line 44;
    - `Geometry/Manifold/PLGroupoid/Basic.lean` line 106. Its chart-based PL structures differ from `PLStructure`, which carries a triangulation as data.
  - The finding-relevant Tau Ceti declarations of R03, R04 and R05.
- **Not at the pins.**
  - An abstract outer automorphism group;
  - a path-to-diffeotopy converse;
  - Teichmüller space;
  - quasiconformal maps;
  - mapping class groups;
  - the Euler number of a representation.

### Cross-roadmap citations resolved

- **On main (`35809b24`).**
  - ComplexCurveModuli: D0 items 1–5, D3 items 3–6 (including item 5's "Arbitrary smooth complement and offset IFT"), and D4 items 1 and 4. D0 item 4 uses the positive Laplacian.
  - ComplexKahlerGeometry K1 (line 96), K4 (line 444) and K5b (line 1168).
  - AlgebraicTopology Stage 1 items 4 and 5, Stage 6, and Stage 7 items 1, 3 and 4 (line 1573).
  - CharacteristicClasses C2 items 2 and 3.
  - RiemannianGeometry R4 item 7 (line 717).
  - DifferentialGeometry Layers 0, 2, 5 and 12, whose sign is R02.
  - ModularForms 10B (line 1068).
  - `Completed/UniversalCovers` Stages 1 and 2.
  - PDE content exists, under other labels (R06).
- **At #903 (`50f31620`).** Layers 1.7 (line 909), 1.7.2 (line 1072), 3.1–3.4 (lines 1299–1411), 11.2.1 items 1–5 (line 7236) and 11.3 (line 7306) match the contract at line 81, except §3.3 (R05).
- **At #1168 (`62cca0d1`, unchanged).** Layer 0 item 2 (lines 277–286) now matches this roadmap's isometry, kernel and restriction contract, and Layers 1, 4 item 5, 4a and 7 are as before.
- **Consumers.**
  - #1722 cites §9.1.
  - #1728 cites §§5.6, 8.4 and 10.1. All exist, and lines 994–995 map the two objects that moved.

### Sources verified at their locators

- **kriegl-michor1997.**
  - line 20142: Theorem 42.1, p. 439;
  - line 20284: Lemma 42.5, p. 442, with the compact-support property used for the open disc;
  - line 20817: Theorem 43.1, p. 454.
- **hatcher2002.**
  - line 3810: Example 1B.2, p. 88;
  - line 3905: Proposition 1B.9, p. 90;
  - lines 2266 and 2318: Proposition 1.26 and the genus-`g` presentation, pp. 50–51 (R08).
- **epstein1966.**
  - line 109: Theorem 2.1, p. 86;
  - lines 112–115: the remark after it;
  - line 533: Theorem 6.3, p. 99;
  - line 604: Theorem 6.4, p. 101;
  - line 778: Theorem A4, p. 107.

### Supplier order and ownership

- **Merge order.** TeichmullerGeometry is line 283 of the merge order. FuchsianOrbifoldsPartII (line 299) is not cited.
- **#271 (SurfaceTopology).**
  - Checked through `roadmaps grep`, since the brief gives no checkout. It plans the same objects under the same short names: `IsBranchedCover`, `MappingClassGroupFull`, `MappingClassGroupPL.toTop_bijective`, `mcg_sphere_full` and `mcg_torus_full`.
  - The brief bars SurfaceTopology as a supplier, so this roadmap owns them. The fully qualified names differ by namespace.
- **Other pull requests.**
  - Ownership was checked against #903, #1168, #1708, #1722, #1728 and #1696.
  - `roadmaps grep` also covered `Beltrami`, quasiconformal maps, earthquakes, Fenchel–Nielsen and the outer automorphism group. Only R03 came up.

## Not verifiable

- **Paywalled, cited by locator alone.** The sources service found no legal copy of Farb–Margalit (sampled §5.4a, §2.2) at its DOI landing page. The others listed here are paywalled:
  - Moise, §6 (sampled §0.0a);
  - Massey, Chapter 1 (sampled §0.0f);
  - Ahlfors–Bers 1960, Theorem 1, and Imayoshi–Taniguchi §4.4 (sampled §7.4);
  - Hirsch, Chapter 8;
  - Douady–Earle 1986;
  - Hubbard 2006;
  - Wolpert 1979;
  - Munkres, Definition 8.3.
- **Waived.** Kerckhoff 1983.
- **Openly available but not in the manifest, not sampled, and not read this round.** Borel 1981, Takeuchi 1975 and Greenberg 1963.

## Source issues

- **Error** in epstein1966 at Theorem 6.4 a), p. 101: the source asks for orientation preservation only on the plane and the cylinders; it should also ask for it on the closed disc, where conjugation is homotopic but not isotopic to the identity; affects nothing.
