# Review of HomotopySpheres (pull request #284 at c4e9076)

**Verdict:** needs changes

## R01 (P2) — Two headlines are statable at the pins but absent, and the docstring says they are not statable

**Location:** `TauCetiRoadmap/HomotopySpheres/Suggested.lean` lines 11–12: "The oriented recognition theorem and the h-cobordism theorem require chosen smooth orientations and compact oriented collared cobordisms."

**Claim:** the claim is that neither the h-cobordism theorem (README §1.2 item 7) nor oriented six-dimensional recognition (README §10.1 item 4) is statable at the pins.

**Witness:** both statements below elaborate inside a copy of this module at Mathlib 6b7abb3c / Tau Ceti a91d3aaf (12 `sorry` warnings, 0 errors). They use `𝓡∂ (n+1)`, Tau Ceti `boundaryChartedSpace` (`Geometry/Manifold/Boundary/Charts.lean` 195), `IsOrientedAtlas` and `orientationPreservingGroupoid` (`Geometry/Manifold/Orientation.lean` 332, 178).

**Repair:** add `public import TauCeti.Geometry.Manifold.Boundary.Charts` and `public import TauCeti.Geometry.Manifold.Orientation`, add the following, keep `smoothPoincareSix` as its corollary, delete lines 11–12, and name both theorems in README §1.2 item 7 and §10.1 item 4:

```lean
/-- The simply connected smooth h-cobordism theorem (Milnor, Theorem 9.1, p. 107). -/
theorem exists_diffeomorph_prod_Icc_of_hCobordism (n : ℕ) (hn : 5 ≤ n)
    (W : Type*) [TopologicalSpace W] [T2Space W] [CompactSpace W]
    [ChartedSpace (EuclideanHalfSpace (n + 1)) W] [IsManifold (𝓡∂ (n + 1)) ∞ W]
    [SimplyConnectedSpace W]
    (V₀ : TopologicalSpace.Opens ((𝓡∂ (n + 1)).boundary W))
    (hV₀ : IsClosed (V₀ : Set ((𝓡∂ (n + 1)).boundary W)))
    (h₀ : ∃ e : V₀ ≃ₕ W, ⇑e.toFun = fun x : V₀ => ((x : (𝓡∂ (n + 1)).boundary W) : W))
    (h₁ : ∃ e : ↥((V₀ : Set ((𝓡∂ (n + 1)).boundary W))ᶜ) ≃ₕ W,
      ⇑e.toFun = fun x => ((x.1 : (𝓡∂ (n + 1)).boundary W) : W)) :
    ∃ f : (V₀ × Set.Icc (0 : ℝ) 1) ≃ₘ⟮(𝓡 n).prod (𝓡∂ 1), 𝓡∂ (n + 1)⟯ W,
      ∀ x : V₀, f (x, 0) = ((x : (𝓡∂ (n + 1)).boundary W) : W) := by
  sorry

/-- Oriented smooth recognition in dimension six. -/
theorem exists_orientationPreserving_diffeomorph_sphere_six
    (M : Type*) [TopologicalSpace M] [T2Space M] [SecondCountableTopology M]
    [CompactSpace M] [ChartedSpace (ModelSpace 6) M] [IsManifold (SmoothModel 6) ∞ M]
    (_h : M ≃ₕ Sphere 6)
    (A : Set (OpenPartialHomeomorph M (ModelSpace 6)))
    (hA : TauCeti.IsOrientedAtlas (SmoothModel 6) ∞ A)
    (B : Set (OpenPartialHomeomorph (Sphere 6) (ModelSpace 6)))
    (hB : TauCeti.IsOrientedAtlas (SmoothModel 6) ∞ B) :
    ∃ f : M ≃ₘ⟮SmoothModel 6, SmoothModel 6⟯ Sphere 6, ∀ e ∈ A, ∀ e' ∈ B,
      (f.toHomeomorph.symm.toOpenPartialHomeomorph ≫ₕ e).symm ≫ₕ e' ∈
        TauCeti.orientationPreservingGroupoid (SmoothModel 6) := by
  sorry
```

## R02 (P2) — Index-two cancellation is planned only in total dimension six, but Layer 10 needs dimension seven

**Location:** `README.md` lines 308–312 ("Treat the six-dimensional cobordism boundary case separately … `(p,q)=(2,3)` … The `p,q>=3` theorem does not cover this case") and line 1037 ("Apply Stage 1's six-dimensional-boundary case of the h-cobordism theorem").

**Claim:** items 5 and 6 supply every Whitney disc the cancellation in item 7 needs, and §10.1 uses item 6's case.

**Witness:** Milnor Theorem 6.4 (`milnor_hcobordism` line 1800, pp. 69–70) cancels at λ = 2 in every dimension n ≥ 6, which gives (r,s) = (2, n−3). Theorem 6.6 (line 1847, p. 71) needs π₁(V∖M′) → π₁(V) injective when r = 2. The 7-dimensional h-cobordism of §10.1 gives (2,4), which neither item covers.

**Repair:** replace item 6 with: "For index-two/index-three cancellation in total dimension n ≥ 6 the level V has dimension n−1 and (p,q) = (2, n−3). Prove π₁(V∖S_R) = 1 from the trajectory diffeomorphism V₀∖S_L ≅ V∖S_R, using that the attaching circle has codimension n−2 ≥ 4 (Milnor, proof of Theorem 6.4, pp. 72–73), then apply the Whitney move (Theorem 6.6, p. 71)." In line 1037 write "Layer 1's h-cobordism theorem in total dimension seven". Extend the Checks on line 328 to total dimensions six and seven.

## R03 (P2) — Kervaire–Milnor I is cited for `A_n`, `P_n` and an exact sequence it does not contain

**Location:** `README.md` line 797 ("the Kervaire–Milnor exact segment (Groups of Homotopy Spheres I, §§4–6)"), line 805 ("Sections 3--6, is normative for `A_n`, `P_n` … and the exact sequence"), lines 664, 762, 944–945 and 1009.

**Claim:** KM I defines "historical" `A_n` and `P_n` carriers and proves `… → P_(n+1) → Theta_n → A_n → P_n → …`.

**Witness:** `kervairemilnor1963` (pp. 504–537) has no `A_n`, `P_n` or almost-framed cycles. §4 (lines 237–315) proves only `Theta_n/bP_(n+1) ↪ Π_n/p(S^n)`. §§5–8 compute `bP`. The refinement `c(M)` is in §8 (line 1150, p. 535).

**Repair:** cite KM I only for what it proves: Theorem 1.1 (p. 504), Lemmas 2.1–2.4 (pp. 505–507), Theorem 3.1 (p. 508), Theorem 4.1 with Lemmas 4.2–4.5 (pp. 510–512), Theorem 5.1 (p. 512), Theorem 8.5 (p. 536), and §8 (pp. 531–536) for 9.1's refinement. For §6.1 item 3, §6.2 item 4, §6.3 item 2 and §8.1, cite the source that defines `A_n`, `P_n` and proves the sequence, at its theorem number. Otherwise drop "historical Kervaire–Milnor" and state those carriers as this roadmap's own.

## R04 (P2) — `finiteQuadraticArf` and TangentialBordism B3.2 do not supply the Arf algebra

**Location:** `README.md` lines 890–897 ("Consume the pure algebra substage of TangentialBordism B3.2 for `finiteQuadraticArf`, basis independence, hyperbolic/anisotropic decomposition…"), lines 907, 917 and 1069.

**Claim:** TangentialBordism B3.2 owns `finiteQuadraticArf` and the finite Arf algebra.

**Witness:** `finiteQuadraticArf` occurs only in this README (roadmaps grep over main and 430 heads). TangentialBordism §1.1 (B3.2(a), its README lines 510–532) consumes "GeometricTopology Layer 4.3.1's finite nonsingular-F₂ quadratic Arf algebra". GeometricTopology §4.3.1 (line 2430) owns it on `QuadraticForm (ZMod 2) V`.

**Repair:** replace with: "Consume GeometricTopology Layer 4.3.1's finite quadratic Arf algebra on native `QuadraticForm (ZMod 2) V` (symplectic-basis Arf, basis independence, hyperbolic/anisotropic classification, the q-zero Lagrangian criterion, `m = 0` included); own the integral Wall-form reduction to it." Change *Needs:*, Dependencies and the table row to "GeometricTopology Layer 4.3.1", and remove the backticks.

## R05 (P2) — Layer 3A plans again the compact-generation foundation that AlgebraicTopology §4.8 owns

**Location:** `README.md` lines 375–389 (§3.1 item 1: "construct compact generation as the right adjoint `k` … prove `i ⊣ k` … exponential law"), lines 387–389 (item 2), 110–115 and 247–250 ("the compact-generation coreflector … are targets here").

**Claim:** this roadmap owns the coreflection `i ⊣ k`, convenient products and exponentials, smash, reduced suspension and the suspension–loop adjunction.

**Witness:** AlgebraicTopology on main, §4.8 "Compact generation and the pointed adjunction" (its README line 1795), owns exactly these, built from Mathlib's `GeneratedByTopCat.adj` (`Mathlib/Topology/Convenient/Category.lean` 297). Its lines 167–169 assign only pointed cones, Puppe sequences and stabilization to consumers.

**Repair:** replace §3.1 item 1 with a citation of AlgebraicTopology §4.8: the coreflection on `CompactlyGenerated`, `k(X×Y)`, compact-open mapping spaces followed by `k`, the exponential homeomorphism, the smash, reduced suspension, the suspension–loop adjunction and the CW comparisons. In item 2 keep mapping cones and cofiber/Puppe sequences. Correct lines 110–115 and 247–250, and add §4.8 to the AlgebraicTopology contract.

## R06 (P2) — The stable framed Pontryagin–Thom map and isomorphism have owners earlier in the order

**Location:** `README.md` lines 581–583 (§5.1 item 5: "pass to the sequential colimit") and 588–589 (item 7: "Conclude Pontryagin--Thom `Omega_n^fr ~= pi_n^S`").

**Claim:** this roadmap owns the stable framed PT map and `Ω^fr_n ≅ π_n^S`.

**Witness:** TangentialBordism on main, B5.5 (its README line 1875), defines "the stable framed PT map" as B5.4 with B a point, and states that `Ω^fr_n ≅ π_nS` "is StringOrientation S2.3's". StringOrientation, earlier in the merge order, proves it in S2.3 (its README line 607).

**Repair:** replace items 5 and 7's construction with "Consume TangentialBordism B5.5's stable framed Pontryagin–Thom map and StringOrientation S2.3's isomorphism `Ω^fr_n ≅ π_n^S`." Keep here the product, suspension, boundary and change-of-framing formulas with stable `J`. Add both to the supplier contracts and the §5.1 *Needs:*.

## R07 (P2) — §5.1 item 3 plans again the Thom space that CharacteristicClasses and GeneralizedCohomology own

**Location:** `README.md` lines 569–571 ("Construct one-point compactification of a vector bundle and its Thom space. If the rank-`k` normal bundle `nu` of `M` is framed, prove … `Th(nu) ~= M_+ smash S^k ~= Sigma^k M_+`").

**Claim:** this roadmap constructs the Thom space and its suspension identification.

**Witness:** CharacteristicClasses on main, C2.0 (line 730), builds the pointed Thom CW model with rank-0 case `X₊`. GeneralizedCohomology on main, G4 item 2 (line 1214), proves `Th(ε^r⊕ξ) ≃ Σ^r Th ξ`, `Th(0_B) = B₊` and the one-point-compactification comparison for compact B.

**Repair:** replace the first sentence with "Use CharacteristicClasses C2.0's pointed Thom model and GeneralizedCohomology G4 item 2's comparisons." Keep the evaluation law of the framing-induced equivalence on finite normal vectors and at infinity.

## R08 (P2) — §1.1 plans again GeometricTopology's complements of embedded balls

**Location:** `README.md` lines 279–282 ("For an embedded standard closed disc, give the closed complement of its interior the induced half-space model. Identify its intrinsic boundary with the disc boundary and give it an exterior collar") and lines 72–74.

**Claim:** this roadmap owns the exterior-collared embedded disc.

**Witness:** GeometricTopology on main, §1.2 "Complements of embedded balls" (line 822), defines `M ∖ e(B°)` with its smooth structure with boundary `e(Sⁿ⁻¹)`, its boundary identification and its canonical radial collar, with Checks for `Sⁿ` and `S¹`.

**Repair:** cite GeometricTopology §1.2 for the complement, its boundary identification and its radial collar. Own here only the orientation law and the defect-tube faces, and say so in lines 72–74.

## R09 (P2) — §7.3 item 2 proves again results that IntegralLattices owns

**Location:** `README.md` lines 887–889 ("identify the obstruction with the signature of the even unimodular middle form divided by eight. Prove divisibility by eight, classify the Witt group").

**Claim:** divisibility by eight and the classification behind `L₀(ℤ) ≅ ℤ` are targets here.

**Witness:** IntegralLattices on main: 1I (line 640) gives `8 ∣ t₊ − t₋` for even unimodular lattices. 6A (line 2019) gives `L ≅ U^{t₋} ⊕ E₈^k` for indefinite even unimodular L, which makes signature/8 injective on Witt classes.

**Repair:** replace with "Consume IntegralLattices 1I and 6A, and deduce that signature/8 is an isomorphism from the even Witt group onto ℤ". Add IntegralLattices to the supplier contracts and the Layer 7 *Needs:*.

## R10 (P3) — Gate: five theorems conclude a bare `Nonempty` of an equivalence

**Location:** `Suggested.lean` lines 101, 109, 116, 213, 217 (`realBottPeriodicity`, `sixthStableStem`, `smoothPoincareSix`, `wallGroupZero`, `wallGroupTwo`).

**Claim:** the file passes the gate.

**Witness:** gate at c4e9076: `statement-hygiene=5 … FAIL`, one hit per line above. Every other check is 0.

**Repair:** rename them `nonempty_realBottPeriodicity`, `nonempty_sixthStableStem`, `nonempty_diffeomorph_sphere_six`, and the two names in R11, and update the README to match.

## R11 (P3) — The Wall-group computations are stated only at q = 0 and q = 1

**Location:** `Suggested.lean` lines 212–218 (`EvenWallGroup 0 ≃+ ℤ`, `EvenWallGroup 1 ≃+ ZMod 2`). README line 889 states "`P_(4k) ~= Z` for `k>=2`" and line 895 "`P_(4k+2) ~= Z/2`".

**Claim:** the Lean states the README's computation of the even L-groups.

**Witness:** `EvenWallForm q` depends on q only through `(-1)^q` and `Even q`, so the computation holds uniformly in k. `EvenWallGroup 2` and `EvenWallGroup 0` are different types, and the README's ranges (q = 2k ≥ 4) are not stated.

**Repair (elaborated):** `theorem nonempty_evenWallGroup_two_mul_addEquiv_int (k : ℕ) : Nonempty (EvenWallGroup (2 * k) ≃+ ℤ)` and `theorem nonempty_evenWallGroup_two_mul_add_one_addEquiv_zmod_two (k : ℕ) : Nonempty (EvenWallGroup (2 * k + 1) ≃+ ZMod 2)`.

## R12 (P3) — Lean and README names do not correspond

**Location:** `README.md` (none of the 8 theorem names appears); lines 661 (`` `AlmostFramedBordism n` ``) and 679 (`` `StableFramedFillingCycle n` ``). Previous R11 was only partly repaired.

**Claim:** every Lean name appears in the README, and every backticked name of this roadmap's own is declared.

**Witness:** grep of the README: 0 hits each for `realBottPeriodicity`, `sixthStableStem`, `smoothPoincareSix`, `EvenWallForm`, `EvenWallGroup`, `wallGroupZero`. The ranges `i+2 ≤ n`, `i+10 ≤ N` appear nowhere in §4.2.

**Repair:** name each declaration at its target: §4.2 items 7–8 (with the finite-rank ranges), §7.2 items 2–4, §7.3 items 1–3, §9.1 item 3 and §10.1 item 4. Remove the backticks at lines 661 and 679.

## R13 (P3) — The `SmoothAtlasCode` family is not needed by any headline

**Location:** `Suggested.lean` lines 37–87 (`SmoothAtlasCode`, `PrePoint`, `gluingSetoid`, `Realization`, `quotientProjection`, `chartToRealization`).

**Claim:** these definitions make a headline statable.

**Witness:** none of the 8 theorems mentions them. The README's code also carries "finite triangulation or handle data" (line 131), which the structure lacks.

**Repair:** delete lines 37–87 from `Suggested.lean` and remove the backticks at README line 129.

## R14 (P3) — Lean form: docstrings, layer comments, order

**Location:** `Suggested.lean` lines 5–20, and 27 declarations without docstrings, among them all of lines 92–96, 112–117 and 212–221.

**Claim:** the file follows the form.

**Witness:** only 7 of 34 declarations have docstrings, and none cites a source. There are no `/-! ## Layer k -/` comments. The order is Layers 4, 9, 10, 7, while the README order is 4, 7, 9, 10. The module docstring never says it states the headline theorems.

**Repair:** give each declaration a docstring with its mathematics and locator. Add Layer 4, 7, 9 and 10 section comments, move the Wall block before `sixthStableStem`, and add "This file states the roadmap's headline theorems against the pinned Mathlib and Tau Ceti" to the module docstring.

## R15 (P3) — `EvenWallForm` restates Mathlib's `QuadraticMap`

**Location:** `Suggested.lean` lines 126–134 (`quadratic`, `quadratic_zero`, `quadratic_add`, `quadratic_smul`) and lines 151–154. README lines 852–854 ("polarization, scalar … laws are data").

**Claim:** these fields are needed beyond the library.

**Witness:** `QuadraticMap` (`Mathlib/LinearAlgebra/QuadraticForm/Basic.lean` 146) carries `toFun_smul : Q(a•x) = (a*a)•Q x` and `exists_companion'`. `QuadraticMap.IsometryEquiv` is at `IsometryEquiv.lean` 39. `ZMod 2` is a ℤ-module.

**Repair:** use `quadratic : QuadraticMap ℤ (WallLattice rank) (WallQuadraticValue q)` with `polar_eq : ∀ x y, QuadraticMap.polar quadratic x y = (pairing x y : WallQuadraticValue q)`, and drop the three restated laws. Build `Isometry` on `QuadraticMap.IsometryEquiv` plus the pairing equation.

## R16 (P3) — Layer 1 numbering breaks citations from a roadmap on main

**Location:** `README.md` lines 269 and 289 (only §1.1 and §1.2; the handle steps are items 2–7 of §1.2).

**Claim:** the numbering keeps existing citations valid.

**Witness:** PositiveScalarCurvature on main cites "HomotopySpheres §§1.2–1.6" (line 87), "§1.4 for the local Whitney move, §1.5 … §1.6 for the five-dimensional level" (lines 230–231), "§1.3's handle trading" (790). This head has no §1.3–§1.6.

**Repair:** split §1.2's items into §1.2 Morse handles, §1.3 handle trading, §1.4 local Whitney move, §1.5 Whitney discs with p,q ≥ 3, §1.6 index two (R02), and §1.7 the product theorem. Move item 1 into §1.1.

## R17 (P3) — Scope is at the wrong generality

**Location:** `README.md` lines 32–33 ("form the geometric group `Theta_n` for `n>=5`"), 160–161 ("In dimensions `n ≥ 5` the quotient group structure descends"), 29–31 ("a small skeleton of compact second-countable smooth manifolds. Every manifold … has a coded realization"). Previous R13 was only partly repaired.

**Claim:** `Θ_n` is a group only for n ≥ 5, and every compact second-countable manifold has a code.

**Witness:** KM Theorem 1.1 (line 25, p. 504) gives the group for every n, and line 365 already asks for Checks at n = 3, 4. The circle with a doubled point is compact, second-countable and smooth but not Hausdorff, so field `separated` (line 65) forbids any realization.

**Repair:** "`Theta_n` is a group for every n (KM Theorem 1.1, p. 504); equality is oriented diffeomorphism for n ≥ 5". In item 2 write "compact Hausdorff second-countable".

## R18 (P3) — README shape

**Location:** `README.md` throughout: §§3.1–3.3 titled "3A/3B/3C", "Stage" used 20 times, lines 62–115 and 235–262, Checks at 326–328, 363–365, 449–451, 545–547, 911–913. Previous R10 was only partly repaired.

**Claim:** the README is in house form.

**Witness:** there are no API bullets. Checks are one prose line per layer, and `EvenWallForm`, `Θ_n`, `A_n`, `P_n` have none. Layers 3, 4, 6 and 7 share one *Needs:* across subsections. The contracts are not per supplier.

**Repair:** give each definition API bullets and three or more discriminating Checks. For `EvenWallForm 0`, for example: `⟨1⟩` fails `diagonal`, `H(ℤ)` satisfies it, and `σ(E₈)/8 = 1`. Put a *Needs:* line on each subsection, write "Layer"/"§" for "Stage", and title subsections without "3A". Use `### From Mathlib`, `### From Tau Ceti`, `### From TauCetiRoadmap.<X>`, cite "SpinRepresentations Layer 7", and make "How to read the build" one paragraph on layer order.

## R19 (P3) — Locators are chapter ranges or missing

**Location:** `README.md` lines 317, 356–357, 439–443, 486–487, 525–527, 591–598, 901–905; §4.3 (lines 532–539) and §3.1 (lines 373–396) have none. Previous R15 was only partly repaired.

**Claim:** every theorem has an exact locator.

**Witness:** the h-cobordism theorem is Milnor Theorem 9.1 (line 2784, p. 107), cited as "§§2–9". The 3.1 exponential law is Hatcher Proposition A.16 (`hatcher_at` line 23081, p. 531). Freudenthal is Hatcher Corollary 4.24 (line 15686, p. 360), cited as "Chapters VII–XI".

**Repair:** at each claim cite theorem and page: Milnor Theorems 6.4, 6.6, 9.1 and 9.2 (pp. 69, 71, 107, 108); KM Lemmas 2.1–2.4 (pp. 505–507); a theorem number for `J` in §4.3. Replace chapter ranges by theorem numbers.

## Verified sound

| Statement | Instances tried | Values computed | Result |
| --- | --- | --- | --- |
| §1.2 h-cobordism (sample) | Milnor Thm 9.1; n = 6, 7 | W, V, V′ simply connected, `H_*(W,V)=0`, dim ≥ 6; λ = 2 gives (2,3) and (2,4) | statement sound; route gap R02 |
| §1.2 statability | probe at the pins | `exists_diffeomorph_prod_Icc_of_hCobordism` elaborates, 0 errors | R01 |
| §2.1 `Θ_n` group (sample) | n = 3, 4, 5 | KM Thm 1.1 for every n; README Conventions n ≥ 5; Checks n = 3, 4 | R17 |
| §2.1 inverse | Σ # (−Σ) | KM Lemma 2.4 p. 507: bounds contractible (M∖D rotated 180°); Lemma 2.3: h-cobordant to Sⁿ | route consistent |
| §3.1 exponential law (sample) | X = ℚ, Y = [0,1] | Hatcher A.16: homeomorphism, Y LCH, X Hausdorff; Mathlib `Homeomorph.curry` needs both locally compact; ℚ is not | Check discriminates; owner R05 |
| §3.1 Freudenthal | n = 2, q = 2/3; n = 8, k = 6 | iso for q ≤ 2n−2, epi at 2n−1 (Hatcher Cor 4.24); 14 ≤ 2·8−2 | consistent |
| §3.2 James (sample) | X = M(ℤ/2,2); X = S¹ | `H̃₅(X∧X) = Tor(ℤ/2,ℤ/2) = ℤ/2`, `T(H̃_*X)` zero in degree 5; π₁(JS¹) = ℤ = π₂(S²) | Checks correct |
| §3.3 EHP / Toda (sample) | ⟨α,β,γ⟩ | indeterminacy α∘π + π∘γ, the two composition subgroups | consistent; sources not readable |
| §4.2 Bott table (sample) | i = 0..7 | π_i(O) = ℤ/2, ℤ/2, 0, ℤ, 0, 0, 0, ℤ; 4B item 8 identical | consistent |
| `realBottPeriodicity` | (i,n,N) = (1,3,11); n = 2; i = 0 | π₉(SO(11)) = ℤ/2 = π₁(SO(3)); π₁(SO(2)) = ℤ, so `hn` needed; π₀ not a group | true, bounds needed |
| `stableSOHomotopy_five/six_subsingleton` | SO(7) deg 5, SO(8) deg 6 | stable since 7 ≥ 5+2, 8 ≥ 6+2; π₅(SO) = π₆(SO) = 0 | true |
| §4.3 stable J (sample) | n = 3 | J: π₃(SO) = ℤ onto π₃^S = ℤ/24; no locator | R19 |
| §5.1 Thom identification | framed point, k = 1 | Snaith §3.1 pp. 8–9: framing gives `T(ν) ≅ Σ^r M₊`; collapse sends M to non-basepoint; degrees ±1 | consistent; owners R06, R07 |
| §6.1 almost-framed (sample) | KM I, all pages | no `A_n`; §3 Thm 3.1 obstruction in π_{n−1}(SO) only | R03 |
| §6.2 fillings, `bP` (sample) | n = 6 | KM Thm 5.1 p. 512: `bP₇ = 0`; no `P_n` in KM I | `bP` sound; R03 |
| §6.3 exact segment (sample) | n = 6 | KM Lemmas 4.2–4.5: kernel of Θ₆ → Π₆/p(S⁶) is `bP₇` only | R03 |
| §7.1 below middle (sample) | Ranicki §2 line 235 | surgery makes (f,b) i-connected for n = 2i, 2i+1 | consistent; Wall unread |
| §7.2 forms/formations (sample) | Ranicki §2 lines 257–292 | `λ(x,x) = μ(x)+(−)^i μ(x)‾`; lagrangian L = L⊥, μ(L) = 0; trivial formations = `IsTrivial` | matches Lean |
| `EvenWallForm` q = 0 | rank 1 `⟨1⟩`; H(ℤ) | `diagonal` forces λ(e,e) = 2μ(e), so `⟨1⟩` excluded; H: 2x₀x₁ = μ+μ | correct |
| `EvenWallForm` q = 1 | skew λ | λ(x,x) = 0; μ ∈ ℤ/2; μ(2x) = 0 from add and from smul | consistent |
| `wallGroupZero` | E₈, H | σ(E₈)/8 = 1, σ(H) = 0; F ⊕ (−F) ≅ Hʳ, so K₀/⟨H⟩ = Witt group | true; R11 |
| `wallGroupTwo` | H(ℤ), μ(e) = μ(f) = 1 vs 0 | Arf 1 nonzero; Arf 0 class equals [H] = 0 | true |
| `oddWallGroup_subsingleton` | q = 0, 1 | L₁(ℤ) = L₃(ℤ) = 0 | true |
| §7.3 computation (sample) | k = 1 | P₄ excluded (k ≥ 2), P₆ = ℤ/2 (k ≥ 1), odd Pₙ = 0 | ranges right; R04, R09 |
| §9.1 sixth stem (sample) | π₁₄(S⁸) | Toda π_{n+6}(Sⁿ) = ℤ/2{ν²}, n ≥ 5; stable for n ≥ 8 | `sixthStableStem` true |
| §9.1 Θ₆ chain | n = 6 | bP₇ = 0, coker J₆ = π₆^S = ℤ/2 (π₆(SO) = 0), KI(ν²) = 1 (Snaith Ex 8.3 p. 31) | consistent; KM locator R03 |
| §10.1 recognition (sample) | M⁶ ≃ S⁶ | 7-dim h-cobordism, level 6, λ = 2 gives (2,4) | R02 |
| `smoothPoincareSix` | M = S⁶; M = ∅ | homotopy equivalence forces nonempty, connected; Θ₆ = 0 plus h-cobordism gives a diffeomorphism | true; rename R10 |
| oriented recognition | A, B any oriented atlases | reflection reverses B on connected S⁶; probe elaborates | R01 |
| `SmoothAtlasCode` | 0 charts; doubled-point circle | `Fin 0` gives empty realization; `separated` forces Hausdorff | correct; unused R13 |

- Gate rerun at c4e9076: only `statement-hygiene=5` fails (R10). `lake env lean Suggested.lean`: exit 0, 8 `sorry` warnings. `#check @` of 13 declarations: no dropped binders, `∞` is `↑⊤`.
- Dependency check: `depcheck: 229 roadmaps, 2059 edges, 0 problem(s)`. All 11 suppliers are on main, and HomotopySpheres (merge-order line 45) follows TangentialBordism (line 16). No edits outside the folder.
- Probes: 4 repair statements elaborate inside a copy of the module after `lake build` of `TauCeti.Geometry.Manifold.Boundary.Charts` and `TauCeti.Geometry.Manifold.Orientation`.
- 22 source locators checked against the text: Milnor Thms 6.4, 6.6, 9.1, 9.2; KM Thm 1.1, Lemmas 2.1–2.4, Thms 3.1, 4.1, 5.1, Lemmas 7.2–7.4, 8.4, Thm 8.5; Ranicki §2 pp. 6–7; Snaith §3.1 pp. 8–9 and Ex. 8.3 p. 31; Hatcher Cor 4.24, Prop A.16.
- Library declarations opened at the pins: `NonemptyDiffeomorphSphere` (PoincareConjecture.lean 41), `TopologicalSpace.compactlyGenerated` (CompactlyGeneratedSpace.lean 67), `compactlyGeneratedToTop` (CompactlyGenerated.lean 77), `GeneratedByTopCat.adj` (Convenient/Category.lean 297), `Homeomorph.curry` (CompactOpen.lean 556), `IsSmoothEmbedding` (SmoothEmbedding.lean 72), `exists_embedding_euclidean_of_compact` (WhitneyEmbedding.lean 131), `QuadraticMap` (Basic.lean 146), Tau Ceti `IsOrientedAtlas` (332), `boundaryChartedSpace` (195), `isManifold_boundary` (321).
- Cross-roadmap citations resolved on main: AlgebraicTopology (`homologicalWhitehead` 238, `compactManifoldFiniteCWType` 251; `relativeHurewicz` and `poincareDualityMap_isIso` are mapped to §8.4 and §6.4 at its README 4621–4625), GeometricTopology §1.1–1.4, DifferentialGeometry Layers 2 and 10, HeegaardFloer M/F0, UniversalCovers, TopologicalKTheory T1.5–T1.6 and T7, CharacteristicClasses C1.1a (line 246: the overlap tool's "only an open revision" is a false lead), RiemannianGeometry R1–R3, MorseTheory M5, SpinRepresentations Layer 7, TangentialBordism B5.2.
- Previous review (fb7c47e): R01, R02, R03, R04 (order stated in the description), R05, R07, R08, R09, R12, R14 and R16 are repaired. R06 (→ R01), R10 (→ R18), R11 (→ R12), R13 (→ R17) and R15 (→ R19) are partly repaired.
- Ownership was checked by object across main and the open heads (StringOrientation #948, FourManifolds #936, GeometricTopology #1797, #1287). #1287 changes this folder with a conflicting head, and the description orders #284 first. #1287's head already numbers Layer 1 as §1.1–§1.7, treats the general (2, m−2) case, and states the R01 theorems. The description's prose is not contradicted by the head.

## Not verifiable

- Smale 1961, Bott 1959, Browder 1969: the sources service reached only JSTOR landing pages (DOIs 10.2307/1970239, 1970106, 1970686), so no legal copy was found.
- James 1955 (Annals 62): JSTOR only, not fetched.
- Whitehead GTM 61, Toda 1962, Milnor *Morse Theory* §24, Steenrod 1951, Husemoller, Wall 1999 (Chapters 1–6 and §13A): books with no legal open copy, so the 3B, 3C, 4A, 4B and 7A–7C chapter locators are unchecked.
- Pontryagin 1959, Thom 1954, Hirsch, Kosinski: not in the sample. Snaith was read for §5.1 instead.

## Source issues

- none
