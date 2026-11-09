# Review of BordismFormalGroups (pull request #1808 at 55323ac)

**Verdict:** needs changes

The gate fails on `outside-folder` only (R09). Every other gate check passes, including the targeted build. `TauCetiRoadmap/BordismFormalGroups/Suggested.lean` elaborates with `sorry` as its only warning. The dependency check gives `depcheck: 239 roadmaps, 2338 edges, 0 problem(s)`: no UPWARD or CYCLE line.

## R01 (P1) — The p=2 strong-type Check is false under the roadmap's own definition

**Location.** `TauCetiRoadmap/BordismFormalGroups/README.md` line 1597: "at p=2, S/2 has type 1 but not strong type 1: … P₁¹=Sq² acts as zero … which the condition at (s,t)=(1,1) forbids".

**Claim.** S/2 fails condition (a) of strong type 1 because of P₁¹.

**Witness.** README line 1560 and ravenel-orange line 2471 index P_t^s by s<t, so (1,1) is no condition. For n=1 and p=2 only P₁⁰=Sq¹ enters, an isomorphism H⁰→H¹. Q₁H=0 and dim H=2=rank K(1)^*(S/2).

**Repair.** Replace the bullet with: "at p=2, S/2 is strong type 1 (for n=1 only P₁⁰=Sq¹ enters condition (a), and it is an isomorphism), whereas S/4 has type 1 but not strong type 1: Sq¹ vanishes on H^*(S/4;𝔽₂), so its Margolis homology is all of H."

Checked on S/4:
- K(0)_*(S/4)=0.
- K(1)_*(S/4) has rank 2, because 4=0 in K(1)_*.
- Sq¹=0 on H^*(S/4;𝔽₂), because the attaching map has degree 4.

## R02 (P1) — Milnor's theorem route: A does not act freely on y₁⋯y_n at odd p

**Location.** Lines 539–540: "through the action of A on the product of the degree-one (p=2) or degree-two (odd p) classes of (Bℤ/p)^n, which is free through degree n."

**Claim.** At odd p, θ↦θ(y₁⋯y_n) is injective on A_q for q≤n.

**Witness.** y_i=βx_i and β²=0, so β(y₁⋯y_n)=Σ±y₁⋯β(y_i)⋯y_n=0. But β≠0 in A₁ and 1≤n, so the map fails to be injective in degree 1.

**Repair.**
- Keep the freeness statement at p=2 (Miller, Chapter 1, Lemma 11.1, miller-cobordism line 1105).
- At odd p, state the detection in two parts, each with its own range and locator:
  - the reduced powers P^I act on y₁⋯y_n (the dual of P_*);
  - the Milnor primitives act on the exterior classes, with Q_j x_i=y_i^(p^j). This holds because Q₀x=y and Q_(j+1)x=P^(p^j)(y^(p^j))=y^(p^(j+1)).

## R03 (P2) — Steenrod algebras, Adams towers and MO coefficients have two owners (TangentialBordism)

**Location.** Scope lines 17–21 and 44–47: "TangentialBordism consumes F1–F2's formal laws, Steenrod and Adams carriers and coefficient rings"; line 569; lines 629–656.

**Witness.** TangentialBordism at #942's head, README lines 54–55: "Owned here: the mod p Steenrod algebras and Adams towers (B4.1–2, B4.7), which BordismFormalGroups consumes". Line 3093: "BordismFormalGroups consumes … B4's MO coefficients". Its §§6.1–6.3 build MO's splitting.

**Repair.** Settle a single owner. Since TangentialBordism consumes F1–F2's formal laws, the cycle-free choice is this roadmap's F2, which is on main and therefore earlier. TangentialBordism's pull request must then replace B4.1–B4.2, B4.4–B4.7 and its consumer sentences with citations of BordismFormalGroups F2. Name that pull request in this one's merge-order paragraph until it changes.

## R04 (P2) — The Lubin–Tate theorem is statable at the pins and absent from Suggested.lean

**Location.** Suggested.lean docstring: "Not statable at the pins …: the Lubin–Tate universal deformation theorem (no deformations of formal groups over complete local rings and no universal deformation ring)". The README target is at lines 1033–1038.

**Witness.** Every carrier exists at the pins: `FormalGroup.map`, `TauCeti.FormalGroupIso`, `FormalGroup.height`, `WittVector`, `MvPowerSeries` and `IsArtinianRing`. ModularCurves' `Suggested.lean` in this pull request already states the elliptic analogue (`exists_universalDeformation`, line 646).

**Repair.** State the theorem below. It needs `universe u` in the file. With these binders and `sorry` it elaborates at the pins, and `sorry` is its only warning. Add the locator "(Lubin–Tate, Theorem 3.1; Proposition 1.1 for the lift Γ)" at README line 1035.

Checked:
- h=1 gives Fin 0, so ψ is the unique W(k)-algebra map out of W(k).
- `[G.IsComm]` matches Lubin–Tate's standing convention (lubin-tate-1966 line 30).
- PerfectRing is needed for W(k) to have residue field k.

```lean
/-- Lubin–Tate: a commutative formal group of finite height `h` over a perfect field `k` of
characteristic `p` lifts to `Γ` over `W(k)[[u₁, …, u_(h-1)]]` such that every commutative lift
to an Artinian local `W(k)`-algebra with residue field `k` is ⋆-isomorphic to the specialisation
of `Γ` along exactly one local `W(k)`-algebra map, by exactly one ⋆-isomorphism. -/
theorem exists_lubinTate_universalLift {k : Type u} [Field k] (p : ℕ) [Fact p.Prime]
    [CharP k p] [PerfectRing k p] (Φ : FormalGroup k) [Φ.IsComm] (h : ℕ)
    (hΦ : Φ.height p = h) :
    ∃ Γ : FormalGroup (MvPowerSeries (Fin (h - 1)) (WittVector p k)),
      Γ.map (WittVector.constantCoeff.comp MvPowerSeries.constantCoeff) = Φ ∧
      ∀ (A : Type u) [CommRing A] [IsLocalRing A] [IsArtinianRing A]
        [Algebra (WittVector p k) A] (π : A →+* k),
        RingHom.ker π = IsLocalRing.maximalIdeal A →
        π.comp (algebraMap (WittVector p k) A) = WittVector.constantCoeff →
        ∀ (G : FormalGroup A) [G.IsComm], G.map π = Φ →
          ∃! ψ : MvPowerSeries (Fin (h - 1)) (WittVector p k) →ₐ[WittVector p k] A,
            (∀ i, ψ (MvPowerSeries.X i) ∈ IsLocalRing.maximalIdeal A) ∧
            ∃! e : TauCeti.FormalGroupIso G (Γ.map ψ.toRingHom),
              PowerSeries.map π e.toHom.toPowerSeries = PowerSeries.X := by
  sorry
```

## R05 (P2) — Landweber's invariant-prime classification is statable on (L, L[b₁,b₂,…]) and absent

**Location.** Lines 942–951: "Classify its homogeneous invariant prime ideals as I₀=(0), I_n=(p,v₁,…,v_(n−1)) for finite n≥1, and I_∞". The Lean docstring neither states it nor names a missing carrier.

**Witness.** The pinned Tau Ceti has `TauCeti.LazardRing`, `LazardRing.grading` (a `GradedAlgebra`), `LazardRing.rightUnit`, `FormalGroup.heightIdeal`, and `TauCeti.LazardRing.map_rightUnit_heightIdeal` (`CoordinateChange/HopfAlgebroid.lean` line 390). Ravenel states the classification on L (Theorem 1.3.16(iv), ravenel-green line 1346).

**Repair.** Add the L-form as an F5 target, with locator Ravenel Theorems 1.3.16(iv), p. 17, and 4.3.2(iv), p. 121. Include the zero ideal; see Source issues. State it as below, importing `TauCeti.RingTheory.FormalGroup.Height.Ideal` and `TauCeti.RingTheory.FormalGroup.CoordinateChange.HopfAlgebroid`. It elaborates.

Checked:
- `heightIdeal p 0 = ⊥` closes by `simp [FormalGroup.heightIdeal]`, so the zero ideal is the case n=0.
- Homogeneity excludes the invariant prime (p, v₁−1) of the README's own Check at line 950.

```lean
/-- Landweber: a homogeneous ideal of the Lazard ring is prime and invariant under the
coordinate-change Hopf algebroid exactly when it is a height ideal `I_(p,n)` (`I_(p,0) = 0`)
or `I_(p,∞)` for a prime `p`. -/
theorem isPrime_and_invariant_iff_eq_heightIdeal {I : Ideal TauCeti.LazardRing}
    (hI : I.IsHomogeneous TauCeti.LazardRing.grading) :
    (I.IsPrime ∧ I.map TauCeti.LazardRing.rightUnit = I.map MvPolynomial.C) ↔
      ∃ p : ℕ, p.Prime ∧
        ((∃ n : ℕ, I = TauCeti.LazardRing.formalGroup.heightIdeal p n) ∨
          I = ⨆ n, TauCeti.LazardRing.formalGroup.heightIdeal p n) := by
  sorry
```

## R06 (P2) — "As comodule algebras" is more than the cited splitting gives

**Location.**
- Line 578: "H_*(MU;𝔽_p)≅P_*⊗C as comodule algebras with C polynomial on the b_i".
- Line 641: "H_*(MO;𝔽₂)≅A_*⊗P as comodule algebras … (… Ravenel, Corollary A1.1.18)".
- Line 653: "the images of the ξ_k".

**Witness.**
- Ravenel A1.1.18 (ravenel-green lines 18101–18103): only "as a left C-module and as a right Σ-comodule".
- Lemma 3.1.7 (line 3770): "as a left A_*-comodule", with C=P(u_i).
- Miller 12.3: freeness over A only.
- Miller §13 (lines 1373–1376) omits the ring proof.

**Repair.**
- At both places, say "as left C-modules and right comodules", with C polynomial on generators u_i of degree 2i (not the b_i).
- Replace "the images of the ξ_k" by "lifts of the ξ_k along the Thom map".
- Either derive the ring structure of π_*MO from the module splitting alone, or add Mahowald's ring map HF₂→MO (Miller, Chapter 1, Theorem 13.2) as the comodule-algebra section.

## R07 (P2) — F6.6's finite CW models cite a heading that an open revision drops, and bypass the owner

**Location.** Lines 2361–2364: "Obtain the smooth finite CW models from GeometricTopology's **The smoothing-and-triangulation comparison**, item1 **Smooth implies PL**, … followed by AlgebraicTopology's manifold-to-abstract-CW comparison." Contract lines 136–138.

**Witness.**
- At GeometricTopology #903's head (README lines 776–779) the heading is gone; item 1 maps to Layer 11.3.
- AlgebraicTopology Stage 8.7 here (lines 2318–2324) owns compact smooth manifolds' finite CW type and consumes that item.
- The quoted AlgebraicTopology phrase occurs nowhere.

**Repair.**
- Cite "AlgebraicTopology Stage 8.7 (compact smooth manifolds, with or without boundary, have finite CW type)" as F6.6's source of finite CW models.
- Add Stage 8.7 to the AlgebraicTopology contract.
- Delete the GeometricTopology contract row and the direct citation; these are the only two GeometricTopology mentions.

## R08 (P2) — F6.7 plans a construction inside SymplecticGeometry/ConvexityToric T2

**Location.** Lines 2516–2525: "Construct the geometric instantiation in SymplecticGeometry/ConvexityToric T2, … Supply its actual stable-stratum/support cofiber, j, diagonal Thom/Euler homotopy …". Also lines 194–198 and 2535–2537.

**Witness.**
- `SymplecticGeometry/ConvexityToric/README.md` never mentions BordismFormalGroups, F6.7, MU-modules or nullhomotopies, either on main or at this head.
- `roadmaps grep 'BordismFormalGroups.{0,40}F6\.[67]'` finds no consumer anywhere.
- Scope line 54 says nothing geometric is constructed here.

**Repair.**
- Delete the final F6.7 paragraph and the consumer sentences at lines 194–198 and 2535–2537. F6.6–F6.7 then stand as general MU-module results.
- If the moment-map application is wanted, ConvexityToric T2 states it, citing F6.7, in that roadmap's own pull request.

## R09 (P3) — Gate: edits outside the pull request's folders

**Location.** `Completed/ArithmeticDirichletSeries/README.md` line 331 and `TauCetiRoadmap/SymplecticGeometry/README.md` line 77.

**Witness.** The gate reports "outside-folder (2) - Completed/ArithmeticDirichletSeries/README.md - TauCetiRoadmap/SymplecticGeometry/README.md". Neither folder is one of this pull request's own.

**Repair.** Move the two one-line wording edits into their own pull request, or name the two folders in this one's description, then re-run the gate.

## R10 (P3) — An open pull request rewrites the same F6.3 Checks, with no stated order

**Location.** Lines 1588–1606 (strong-type Checks).

**Witness.** The head of #1854 (BordismFormalGroups/README.md line 1588) says "at odd p, S/p has strong type 1". This head correctly says the opposite: P₁⁰=P¹ acts as zero (ravenel-orange line 2512). The two heads conflict, and the description orders only #1101 and #1807.

**Repair.** Name #1854 in the merge-order paragraph and rebase one on the other so that the corrected odd-p Check survives. Carry R01's p=2 correction into both.

## R11 (P3) — F6.5's generic foundations move to GeneralizedCohomology G2.11 without an old → new line

**Location.** Scope lines 36–37 and F6.5 lines 2132–2148: "Consume GeneralizedCohomology G2.11's enriched, quasicategorical and monoidal foundations …".

**Witness.**
- EnhancedDerivedSheaves on main, README line 32: "`BordismFormalGroups` F6.5 owns the generic categorical model, marked straightening, … Kan extensions …".
- ChromaticHomotopyTheory at #1643's head, line 83: "Apply F6.5's pointwise comma-category Kan-extension formula".
- On main, F6.5 item 1 constructed these foundations.

**Repair.** Add one line under Scope and ownership: "F6.5 item 1's categorical-model, straightening, Kan-extension, Ind, monoidal-localization and operadic sub-lanes → GeneralizedCohomology G2.11".

## R12 (P3) — ModularCurves does not consume F1's classification; its PD-5 restates the height-2 case

**Location.** Lines 53–54, 457 and 2534: "ModularCurves consumes F1's height classification."

**Witness.** ModularCurves/README.md at this head never names BordismFormalGroups. Its target PD-5 (lines 1620–1624) asserts that the height-2 formal group over algebraically closed k is "unique up to isomorphism (Lazard's classification)", citing Lazard 1955 (line 2673).

**Repair.** In ModularCurves PD-5, a folder this pull request already changes, cite BordismFormalGroups F1 `nonempty_formalGroupIso_iff_height_eq` for the uniqueness. Otherwise drop the three consumer sentences here.

## R13 (P3) — The docstring's not-statable list omits headline theorems

**Location.** Suggested.lean lines 22–38.

**Witness.** These README results have neither a Lean statement nor a docstring entry:
- Milnor's theorem on A_* and the Serre–Cartan computation (lines 499–540);
- BP_*≅ℤ_(p)[v_i] and BP_*BP (lines 742–746);
- the Adams–Novikov E₂ (lines 915–917);
- the Landweber filtration (line 975).

**Repair.** Name each with its missing carrier:
- no Steenrod operations or Eilenberg–MacLane spectra at the pins;
- no spectra or BP;
- no comodules over a Hopf algebroid.

Then update the list after R04 and R05.

## R14 (P3) — Locators

- **Lubin–Tate (line 1033).** No locator. Add "Lubin–Tate, Theorem 3.1" (lubin-tate-1966 lines 284–289), which is the manifest's own locator.
- **Landweber's exact functor theorem (lines 1008–1011).** It cites only "as surveyed in Ravenel, Section 4.2, p. 118", and that page attributes the theorem to [Lan76] (ravenel-green lines 6660–6674). Cite landweber-1976 by its theorem number: the manifest records Theorem 2.6, uncertified.
- **`TauCeti.FormalCoordinate` (lines 93–94, 244–246).** It is declared in `TauCeti.RingTheory.PowerSeries.Coordinate.Basic` (line 86), not in `CoordinateChange.Basic`, which holds the action and `smulIso`.
- **A//E dual to P_* (line 548).** It cites "Lemma 3.1.4", which gives only H_*(MU)'s image. Cite Lemmas 3.1.6–3.1.8 instead (ravenel-green lines 3763–3787).

## R15 (P3) — The Moore-spectrum Check misstates the classical completion

**Location.** Lines 566–568: "the Moore spectrum of ℤ/2^∞ has classical 2-completion zero but derived 2-completion with π₁=ℤ₂".

**Witness.** π₂M(ℤ/2^∞)=Tor(π₁S,ℤ/2^∞)=ℤ/2. That group is finite and equals its own classical completion. Only π₀=ℤ/2^∞ completes to 0.

**Repair.** Replace with: "π₀=ℤ/2^∞ has classical 2-completion 0 and π₀⊗ℤ₂=ℤ/2^∞, while the derived 2-completion has π₀=0 and π₁=T₂(ℤ/2^∞)=ℤ₂". This was recomputed from 0→Ext(ℤ/2^∞,π_n)→π_n(X^∧)→Hom(ℤ/2^∞,π_(n−1))→0.

## R16 (P3) — README shape

**Location.** Line 1 "# Bordism, formal groups and chromatic operations"; layer headings `## F1.` through `### F6.7.`.

**Witness.**
- There is no `**Summary.**`.
- No layer has `### Examples` or `### Dependencies` (0 occurrences).
- The 2569 lines contain one `*Needs:*` line (line 442).
- F3 (lines 739–782) has no locator and no Checks.

**Repair.**
- Retitle as `# Roadmap: bordism, formal groups and chromatic operations` and add a Summary paragraph.
- End each layer with Examples and Dependencies.
- Give each F2–F6 target a *Needs:* line and a locator. For F3, use Ravenel Theorem 4.1.12 for π_*BP.
- Add Checks to F3's BP⟨n⟩ and K(n) definitions.

## Verified sound

**Build and Lean form.**
- `lake env lean` on Suggested.lean gives one warning, `declaration uses 'sorry'`.
- `#check @TauCetiRoadmap.BordismFormalGroups.nonempty_formalGroupIso_iff_height_eq` gives `[Field k] [IsSepClosed k] (p) [Fact p.Prime] [CharP k p] (F G) [F.IsComm] [G.IsComm] : Nonempty (FormalGroupIso F G) ↔ F.height p = G.height p`. This equals the README statement at lines 412–417, and nothing changed.
- One-tactic probe: `simp` made no progress, `aesop` failed, and `exact?` found no library lemma. The theorem is not padding.
- The file is clean of `set_option`, sorry'd data and `lemma`. Its imports are `Mathlib` plus two existing `TauCeti` modules.

**Pinned declarations opened: 152.** I checked every F1 Tau Ceti name in the sampled paragraphs at the pin. All exist where the README places them, except the module slip in R14. Spot-checked:
- `FormalGroup.height` (`Height/Basic.lean` line 200);
- `FormalGroupIso.height_eq` (line 346);
- `height_eq_top_iff_nonempty_formalGroupIso_𝔾ₐ` (`Logarithm/InfiniteHeight.lean` line 278);
- `LazardRing.mvPolynomialEquiv` (`LazardRing/Polynomial.lean` line 112);
- `existsUnique_logarithm_of_nsmulSeries_eq_zero` (`Logarithm/InfiniteHeight.lean` line 249);
- `ExponentTwoLazardRing.lift` (`ExponentTwo/Universal.lean` line 215);
- `homogeneousComponent_homDefect_eq_smul_lazardCocycle` (`Obstruction.lean` line 400, with p=0 in R);
- `heightIdeal_smul` (`Height/Ideal.lean` line 138);
- Mathlib's `FormalGroup`, `IsComm`, `Point`, `𝔾ₐ`, `𝔾ₘ` and `map` (`RingTheory/FormalGroup/Basic.lean`).

The Lean docstring's claim that the rest of F1 is pinned is correct, including Lazard's polynomial theorem.

**Sampled sources read at the text: 47 locators.**
- **ravenel-green:** A2.1.6, A2.1.9, A2.1.18, (A2.1.24), A2.1.25, A2.2.6, A2.2.7, A2.2.12, (A2.2.13), 2.1.1(i)–(ii), 2.2.3, 2.3.3, 3.1.1, 3.1.3, 3.1.4, 3.1.5(i)–(ii), 3.1.10, A1.1.18, A1.3.13, 4.1.6, 4.3.2 at p. 121, §4.2 at p. 118, 1.3.16.
- **hatcher-at:** 4L.12, 4L.13, 4L.16, the unnumbered theorem on p. 500 that defers its proof (line 21565), 4J.1, 3C.8.
- **miller-cobordism:** 10.4, 11.1–11.2, 12.1–12.4, §13, Ch. 2 Theorem 3.5, Proposition 8.3.
- **guillou-weibel:** Definition 6.1, Theorems 6.2 and 6.5, Proposition 6.4. Kudo's signs τβ=−βτ and d_r(y^(p−1)⊗τy)=−βP^kτy match 6.5(1),(3) with Q_a=βP^a.
- **quillen-fgl-bulletin:** Theorems 2 and 3.
- **lubin-tate-1966:** Proposition 1.1 and Theorem 3.1.
- **ravenel-orange:** Definition 6.2.3, p. 64, and p. 65.

Sound sampled targets:
- "Lazard ring, cocycle lemma and Hopf algebroid", "Invariant differential, logarithm and exponential", "Exponent two", and "Height and Lazard's classification" are sound.
- "Steenrod algebras and mod-p Adams towers" is sound except R02, R14 and R15.
- "Unoriented coefficients" is sound except R06.
- "The smoothing-and-triangulation comparison" exists on main (GeometricTopology README line 930, item 1) but is dropped at the open revision (R07).

**Cross-roadmap citations resolved: 24.**
- GeneralizedCohomology G2.4, G2.6, G2.7, G2.9, G2.11 (item 11 at this head, line 669), G3.3, G3.8, G3.9, G4, G4.3, G5.3, G5.4, G5.5 and G5.7.
- AlgebraicTopology Stages 5.5, 8.8 and 8.10.
- CharacteristicClasses C3, which has `H*(BO(n);F2)` at line 1367.
- TopologicalKTheory Conventions, with β=[L]−1 and L=O(−1).
- ProfiniteCohomology.
- RepresentationTheory SchurWeyl Layers 0, 2 and 5, and CompactGroups.
- DGAInfinity Layer 8.
- GeometricTopology's comparison item 1.

GeneralizedCohomology names this roadmap only as a consumer or owner, never as a supplier.

**Ownership against open pull requests.** I read the sibling heads.
- ChromaticHomotopyTheory, RefinedTraceMethods and EnhancedDerivedSheaves cite this roadmap as a supplier.
- GeneralAlgebraicKTheoryPartII §4.24 states Kuhn's T(n)-local Tate vanishing, a different statement from F6.5's K(n)-local Greenlees–Sadofsky form.
- The only two-owner conflict found is R03.

### Adversarial pass

| Statement | Instances tried | Values computed (each side) | Result | Change |
|---|---|---|---|---|
| `nonempty_formalGroupIso_iff_height_eq` | 𝔾ₐ, 𝔾ₘ over 𝔽̄_p | ⊤≠1, no iso (by `height_eq`) | false ↔ false, holds | none |
| same | F=G | identity series X; heights equal | true ↔ true | none |
| same | k=𝔽_p, 𝔾̂ₘ vs Lubin–Tate twist with Frobenius [u·p], u≠1 | heights 1=1; Frobenius X^p gives p≠u·p in End=ℤ_p, so no 𝔽_p-iso | iff fails, so IsSepClosed needed (README Check) | none |
| same | p=2, 𝔾ₐ | [2]=2X=0, height ⊤ | holds | none |
| A2.2.13 induction | t₀, t_i equations | t₀θ(v_h)=t₀^(p^h) (line 20812); ∂/∂t_i = θ(v_h)^(p^i)≠0 | separable, root in sep. closed k | none |
| obstruction at p^k | k below both heights | ord f([p]_F) ≥ p^(h_F) > p^k; ord [p]_G(f) ≥ p^(h_G) > p^k | coefficient 0 | none |
| invariant differential, 𝔾ₘ | P=(1+T)⁻¹ | P(F)F_X=(1+Y)/((1+X)(1+Y))=1/(1+X); wrong model 1+T gives (1+X)(1+Y)²≠1+X | holds | none |
| X² additive | 2=0 vs ℚ | (X+Y)²−X²−Y²=2XY | additive iff 2=0 | none |
| exponent-two ring | generator degrees | i with i+1≠2^k: 2,4,5,6,8 = d≠2^k−1 for MO_* | match | none |
| d_n, C_n | n=1,2,4,6,9 | d=1,2,2,1,3; C₂=XY; C₁=0 (lemma needs n≥2) | holds | none |
| Steenrod instability Check | a∈H¹(RP^∞) | Sq¹a=a², Sq²a=0 | holds | none |
| degrees | p=2, p=3 | ξ₂ and Q₁: 3, 3; ξ₁, τ₀, τ₁, Q₁: 4, 1, 5, 5 | holds | none |
| d₂ bidegree | (1,2)→(3,3) | t−s: 1→0 | holds | none |
| Milnor freeness, odd p | β on y₁⋯y_n | β(y_i)=β²x_i=0, so β(y₁⋯y_n)=0 with β≠0 in A₁ | false | R02 |
| Moore ℤ/2^∞ Check | π₀, π₁, π₂ | classical: 0, 0, ℤ/2; ⊗ℤ₂: ℤ/2^∞, 0, ℤ/2; derived: 0, ℤ₂, ℤ/2 | "classical completion zero" false at π₂ | R15 |
| Hurewicz Check | i=1…6 | 2b₁, 3b₂, 2b₃, 5b₄, b₅, 7b₆ (i+1 = 2,3,4,5,6,7) | matches 3.1.5(ii) | none |
| MO counts | degree 4, degree 5 | π₄: x₄, x₂², rank 2; deg 5: H=7, A_*=2, P=1; Künneth sum 1+2+0+2+0+2=7 | holds | none |
| comodule-algebra splitting | A1.1.18 | gives left-C-module and comodule iso only | overclaim | R06 |
| Kudo transgression | y of degree 2k | source (2k+1, 2k(p−1)), r=2k(p−1)+1, target degree 2kp+2 = deg βP^kτy | holds | none |
| Quillen Thm 3 | F(X,X)=0 | equals [2]_F=0, coefficient of X is 2, so char 2 | holds | none |
| K-theory law | x_K | u⁻¹((1+ux)(1+uy)−1)=x+y+uxy; on CP¹: u⁻¹β=1 | holds | none |
| F5 invariance Checks | (p,v₂), (v₁), (p,v₁−1) | η_R(v₂)≡v₂+v₁t₁^p−v₁^pt₁ mod p; η_R(v₁)=v₁+pt₁ | first two not invariant; (p,v₁−1) invariant but not homogeneous | none |
| Landweber, L-form (R05) | ⊥, I_(p,1), I_∞ | heightIdeal p 0=⊥ (simp); I_(p,1)=(p); L/I_(p,∞) a polynomial domain | statable and true | R05 |
| Lubin–Tate (R04) | h=1, commutativity | Fin 0 gives W(k) and a unique ψ; source requires commutative laws | statable | R04 |
| strong type, odd p | S/p | P¹ has degree 2p−2≥4, so H(P¹)=H≠0 | not strong type 1, head correct | none (R10) |
| strong type, p=2 | S/2, S/4 | S/2: only Sq¹, an isomorphism, so strong type 1. S/4: Sq¹=0, H(Sq¹)=H | Check false | R01 |
| Bousfield class Checks | Hℚ vs S; HF_p vs Hℤ | S/p is Hℚ-acyclic and not contractible; Hℚ∧HF_p=0 while Hℚ∧Hℤ=Hℚ | holds | none |
| James Checks | J(S²), J(S⁰) | J₂/J₁=S⁴, H₂=ℤ; J(S⁰)=ℕ vs π₀ΩS¹=ℤ | holds | none |
| Toda bracket Check | ⟨2,η,2⟩ | η² in π₂^s=ℤ/2; indeterminacy 2π₂+π₂·2=0 | holds | none |

## Not verifiable

These sources are recorded as uncertified, so they are cited by locator only; I read none of them:
- bousfield-1979, Theorem 6.6;
- thom-1954, Chapitre IV;
- toda-1962, Chapter I;
- james-1955, Sections 1–6;
- landweber-1976, Theorem 2.6, the locator R14 proposes from the manifest;
- dhs-nilpotence-i, Sections 1–3;
- quillen-elementary;
- adams-blue-book;
- wilson-omega-spectrum-ii.

Whitehead 1940 and Munkres, cited inside GeometricTopology, are not this roadmap's sources and were not read.

## Source issues

- **Misprint** in ravenel-green at Corollary 3.1.10, p. 64: the source says a_i is represented by [ξ_i] when p=2; it should be [ξ_(i+1)], matching a₀=[ξ₁] before Lemma 3.1.3 and bidegree (1,2p^i−1); affects nothing.
- **Error** in ravenel-green at Theorem 1.3.16(iv), p. 17: the source lists the G-invariant primes of L as I_n for 0<n≤∞ only; it should also list I₀=(0), invariant and prime since L is a domain; affects a stated result.
- **Gap** in ravenel-green at Theorem 4.3.2(iv), p. 121: the statement covers all invariant primes but the proof takes a lowest-degree element; it should restrict to homogeneous ideals, since (p,v₁−1) is an invariant prime; affects a stated result.
