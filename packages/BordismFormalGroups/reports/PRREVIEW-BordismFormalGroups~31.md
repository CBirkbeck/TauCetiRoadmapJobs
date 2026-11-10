# Review of BordismFormalGroups (pull request #1854 at c9c60d0)

**Verdict:** needs changes

## R01 (P1) — F1 and the Lean docstring say the pinned Tau Ceti lacks what it proves

Location: `TauCetiRoadmap/BordismFormalGroups/README.md:59` "The pinned Tau Ceti has no n-series module, so own the n-series API on `formalNSeries`"; `README.md:101` "The pinned libraries have no invariant differential and no formal-group logarithm"; `Suggested.lean:17–19` "Lazard's polynomial theorem … (no Lazard ring at the pins)".

Claim: all three statements are false at the pin (Tau Ceti 2fd255d, `lake-manifest.json`). The repairs that wrote them were made at the older pin 358314d; the pin bump (a891cd19) arrived later. As a result F1 (`README.md:53–188`) plans again what the pinned Tau Ceti already proves:
- the n-series, the formal inverse, homomorphisms and isomorphisms;
- the Lazard ring with its ungraded and graded universality and the polynomial theorem;
- the any-ring and characteristic-two cocycle lemmas and the obstruction lemma;
- the coordinate-change Hopf algebroid;
- the invariant differential, logarithm, exponential and `logIso`;
- the exponent-two logarithm, with its iso, base change, graded form and universal ring `𝔽₂[a_i : i≠2^k−1]` (which F2 at `README.md:348–350` also says to construct);
- height, with base-extension invariance and coordinate independence.

`README.md:14–21` also cites Mathlib pull-request numbers and says "adopt Mathlib's resulting APIs when they arrive".

Witness: pinned `FormalGroup.nsmulSeries` (`TauCeti/RingTheory/FormalGroup/NSMul/Basic.lean:93`), `FormalGroup.log` (`Logarithm/Basic.lean:333`), `TauCeti.LazardRing.mvPolynomialEquiv : MvPolynomial ℕ+ ℤ ≃ₐ[ℤ] LazardRing` (`LazardRing/Polynomial.lean:112`), `TauCeti.ExponentTwoLazardRing` (`ExponentTwo/Universal.lean:90`).

Repair: rebase this folder on #1807, which the description already orders first. Every commit of this pull request that touches the folder (3039e5ed, f0c1c5cf, 4aa8b0b2, 54a7a0cd, ce0a10e0) is an ancestor of #1807's head. #1807 then adds three more commits to the folder:
- 0f7ed58d: F1 consumes `TauCeti.RingTheory.FormalGroup` by declaration name;
- b0ef6366: three pinned F1 names are cited for what they state;
- bdcbdaa9: the clauses naming dropped roadmaps go, and TopologicalKTheory's Conventions are cited for the Bott class.

Its README cites `mvPolynomialEquiv`, `exponentTwoLog`, `eq_exponentTwoLog` and `TauCeti.ExponentTwoLazardRing` (lines 129, 205–213, 238–239 of that README). After the rebase this pull request has no diff of its own in the folder. Tested: `git merge-base --is-ancestor` holds for each of the five commits against `prreview/1807`, and `git merge-tree` shows no conflict in this folder.

## R02 (P2) — The height classification is stated through stand-ins for native carriers

Location: `Suggested.lean:98–103`, `exists_formalGroupIso_iff_formalHeight_eq`, stated with `IsFormalGroupIso` (line 82) and `formalHeight` (line 92), which are built on `formalNSeries` (line 47).

Claim: these three definitions restate pinned carriers. `formalNSeries` is `FormalGroup.nsmulSeries`, `formalHeight` agrees with `FormalGroup.height` on commutative laws over characteristic-p fields, and `IsFormalGroupIso` stands in for `TauCeti.FormalGroupIso`. A headline forced through stand-ins is a defect when the native carriers exist.

Witness: in the scratch probe, `formalNSeries F n = F.nsmulSeries n` holds by induction using `FormalGroup.nsmulSeries_succ`. Pinned `FormalGroup.height` is at `Height/Basic.lean:200` and `TauCeti.FormalGroupIso` at `Hom.lean:351`.

Repair: state, with `public import TauCeti.RingTheory.FormalGroup.Hom` and `public import TauCeti.RingTheory.FormalGroup.Height.Basic`:
`theorem nonempty_formalGroupIso_iff_height_eq {k : Type*} [Field k] [IsSepClosed k] (p : ℕ) [Fact p.Prime] [CharP k p] (F G : FormalGroup k) [F.IsComm] [G.IsComm] : Nonempty (TauCeti.FormalGroupIso F G) ↔ F.height p = G.height p`.
Tested: this elaborates at the pins with only the `sorry` warning. Its forward direction is `fun ⟨e⟩ => e.height_eq p`, so only the converse is new, which keeps it a headline. This is #1807's `Suggested.lean`, so the R01 rebase supplies it.

## R03 (P2) — This roadmap and TangentialBordism (#942) hand the Steenrod algebras, Adams towers and MO coefficients to each other

Location: `README.md:31–37` "This roadmap owns the mod-p Steenrod algebras and HF_p-based Adams towers, the unoriented coefficient ring MO_* … TangentialBordism consumes F1–F2's … Steenrod and Adams carriers"; `README.md:297` "TangentialBordism and HomotopySpheres consume these operations, algebras and towers".

Claim: #942's head claims the same objects in the opposite direction. Its Layer 4 (B4.1 squares, B4.2 Steenrod algebra, transgression and Adams convergence, B4.7 odd-prime operations and simple systems) duplicates this README's Steenrod paragraph (`README.md:215–297`), including Kudo, Borel and simple systems.

Witness: `TauCetiRoadmap/TangentialBordism/README.md` at #942: lines 46–48, "Owned here: the mod p Steenrod algebras and Adams towers (B4.1–2, B4.7), which BordismFormalGroups consumes"; lines 2898–2899, "BordismFormalGroups consumes the ordinary operation and Adams interfaces, B4's MO coefficients".

Repair: one owner. This roadmap is on main, and TangentialBordism comes later (merge order line 15), so this roadmap cannot consume from it and keeps F2's paragraphs "Steenrod algebras and mod-p Adams towers" and "Unoriented coefficients". TangentialBordism must replace its claims at lines 46–48 and 2898–2899, and its B4.1–B4.2 and B4.7 targets, with citations of BordismFormalGroups F2. No further change to this README is needed, but this finding stays open until #942 makes that change.

## R04 (P2) — The Lubin–Tate theorem is statable at the pins but absent

Location: `Suggested.lean:19–21` "the Lubin–Tate universal deformation theorem (no deformations of formal groups over complete local rings and no universal deformation ring)"; the target is stated in prose at `README.md:745–756`.

Claim: the missing objects are a predicate (a deformation is a law over A whose base change along the residue map is F) and an explicit ring. Both sit on native carriers, so this is a headline that can be stated now.

Witness: `FormalGroup.map` (Mathlib `RingTheory/FormalGroup/Basic.lean:185`), `WittVector.constantCoeff` (Mathlib `RingTheory/WittVector/Basic.lean:343`), `MvPowerSeries`, `IsAdicComplete`, `TauCeti.FormalGroupIso` and `FormalGroup.height` all exist at the pins.

Repair: add (tested: it elaborates at the pins with only the `sorry` warning):
```lean
theorem lubinTate_universal_deformation {p : ℕ} [Fact p.Prime] {k : Type*} [Field k]
    [CharP k p] [PerfectRing k p] (F : FormalGroup k) [F.IsComm] {h : ℕ} (hh : 1 ≤ h)
    (hF : F.height p = h) :
    ∃ Γ : FormalGroup (MvPowerSeries (Fin (h - 1)) (WittVector p k)), Γ.IsComm ∧
      Γ.map ((WittVector.constantCoeff).comp MvPowerSeries.constantCoeff) = F ∧
      ∀ (A : Type*) [CommRing A] [IsLocalRing A] [IsNoetherianRing A]
        [IsAdicComplete (IsLocalRing.maximalIdeal A) A] (π : A →+* k), Function.Surjective π →
        ∀ (G : FormalGroup A) [G.IsComm], G.map π = F →
        ∃! φ : MvPowerSeries (Fin (h - 1)) (WittVector p k) →+* A,
          π.comp φ = (WittVector.constantCoeff).comp MvPowerSeries.constantCoeff ∧
          (∀ i, φ (MvPowerSeries.X i) ∈ IsLocalRing.maximalIdeal A) ∧
          ∃ e : TauCeti.FormalGroupIso (Γ.map φ) G,
            e.toHom.toPowerSeries.map π = PowerSeries.X := by
  sorry
```
Uniqueness among all ring maps is sound: φ sends p and the u_i into 𝔪_A, so it is 𝔪-adically continuous. Add the matching sentence and locator to F5 (Lubin–Tate 1966, at its theorem number) and drop the clause from the docstring. #1807's docstring has the same clause, so this repair is needed after the rebase too.

## R05 (P2) — The smoothing citation names a section an open revision drops, and the AlgebraicTopology half has no locator

Location: `README.md:1994–1997` "Obtain the smooth finite CW models from GeometricTopology's **The smoothing-and-triangulation comparison**, item1 **Smooth implies PL**, … followed by AlgebraicTopology's manifold-to-abstract-CW comparison."

Claim: the open revision of GeometricTopology (#903) deletes that section. Its anchor list sends item 1 to Layer 11.3. "AlgebraicTopology's manifold-to-abstract-CW comparison" names no stage. This is a supplier citation.

Witness: `TauCetiRoadmap/GeometricTopology/README.md` at #903, lines 558–561 (the section's "item 1 … → Layer 11.3") and line 13217 (`### 11.3 Smooth triangulations and combinatorial manifolds`). AlgebraicTopology Stage 8 item 7 (main line 1811; this head line 2412) states the compact case.

Repair: replace the sentence with "Obtain the finite CW models from AlgebraicTopology Stage 8.7 (a compact smooth manifold, with or without boundary, has finite CW type)". Stage 8.7 already consumes GeometricTopology's smooth triangulation, and it resolves on main and at this head. The direct GeometricTopology citation then goes.

## R06 (P3) — Padding in Suggested.lean

Location: `Suggested.lean:45–75`: `formalNSeries`, `formalVariable`, the proved `example`, and `exists_unique_normalized_exponentTwo_logarithm`.

Claim: the theorem is a pinned theorem and closes in one tactic. `formalVariable` is `FormalGroup.tautologicalPoint` (`AddInv.lean:81`), and the `example` restates the definition of `FormalGroup.nsmulSeries`.

Witness: with `F.nsmulSeries 2 = 0` in place of `formalNSeries F 2 = 0`, the statement closes by `exact F.existsUnique_logarithm_of_nsmulSeries_eq_zero Nat.prime_two hexponent` (pinned at `Logarithm/InfiniteHeight.lean:249`), checked in a scratch copy.

Repair: delete them from `Suggested.lean`. The README keeps the statement, cited as `FormalGroup.exponentTwoLog` with `eq_exponentTwoLog`. The R01 rebase does this.

## R07 (P3) — Gate failure: `dropped` (a name on the project's dropped-names list)

Location: `README.md:40` "HomotopySpheres consumes F4's Toda brackets", `README.md:297`, `README.md:883`.

Claim: the gate fails with `dropped=3`. Whatever the clause says, HomotopySpheres may not be named.

Witness: the worker's gate output and my re-run both give `dropped: line 40`, `line 297`, `line 883`.

Repair: delete the three clauses. #1807's commit bdcbdaa9 does exactly this, so the R01 rebase cures it.

## R08 (P3) — Gate failure: edits outside the declared folders

Location: the pull request's diff against `origin/main`.

Claim: `Completed/ArithmeticDirichletSeries/README.md` and `TauCetiRoadmap/SymplecticGeometry/README.md` change, but they are not among the folders this pull request declares as its own.

Witness: the worker's gate gives `outside-folder=2` for exactly these two files. The description describes both changes (ArithmeticDirichletSeries → LFunctions; SymplecticGeometry → DGFloer).

Repair: declare both folders as this pull request's own, or move the two edits to their own pull request.

## R09 (P3) — Steenrod, MU/MO and James locators that do not support the text as written

Location: `README.md:248` "Theorem 6.2 applies to any first-quadrant spectral sequence of graded-commutative 𝔽_p-algebras"; `README.md:276` "(Ravenel, Theorem 3.1.1 and Lemma 3.1.4)" for the Milnor primitives and A//E; `README.md:307` and `README.md:369` "as comodule algebras"; `README.md:874–878` (Hatcher, Proposition 3C.8).

Claim:
- (a) Guillou–Weibel 6.2 needs condition (i), E₂ ≅ W⊗V as algebras, the ℓ-simple transgressive system (ii), and convergence to H^*. The README's Borel parenthetical (lines 241–247) omits E₂ ≅ H^*(B)⊗H^*(F).
- (b) Ravenel 3.1.4 concerns H_*(MU) and the image of the Thom class. P_* is defined in Lemma 3.1.6, and E = A_*⊗_{P_*}𝔽_p is in Lemma 3.1.8. §3.1 states no result about the Q_i.
- (c) Ravenel A1.1.18 and Miller 10.4 give only an isomorphism of left C-modules and Σ-comodules. The MO route then uses "the images of the ξ_k" (line 381), which needs an algebra splitting. Miller §13 omits the proof of the π_*MO computation.
- (d) Hatcher 3C.8 assumes X connected.

Witness: guillou-weibel lines 752–758; ravenel-green lines 3741–3746, 3763–3766, 3778–3786 and 18098–18103; miller-cobordism lines 1023–1025 and 1376; hatcher-at line 12578.

Repair:
- (a) State Borel's theorem with "E₂ ≅ H^*(B)⊗H^*(F) as algebras (B simply connected, H^*(F;𝔽_p) of finite type)", and describe Theorem 6.2 by its hypotheses (i), (ii) and convergence.
- (b) Cite Lemmas 3.1.6 and 3.1.8 for A_* = P_*⊗E and the quotient. Give the Q_i a source that states them, or mark them as constructed here.
- (c) Write "as left P-modules and A_*-comodules". Use lifts of the ξ_k along the Thom map. Add the step that P is polynomial, deduced from H_*(MO) being free over P, with a locator.
- (d) Add "for path-connected Y" at line 874.

## R10 (P3) — Most theorems outside F1–F2 carry no locator

Location: F3 (`README.md:467–510`), F5 (`README.md:668–753`), F6.1, F6.3 (`README.md:984–1471`), F6.6 and F6.7. These sections contain no theorem, lemma, section or page reference.

Claim: these sections state the following without a locator:
- Hazewinkel generators, BP_*BP and Wilson's torsion-free range;
- the invariant prime ideal theorem, the Landweber filtration and the exact functor theorem;
- Lubin–Tate;
- Bousfield localization;
- the Hopkins–Smith thick-subcategory and periodicity theorems;
- ⟨E(n)⟩ = ⟨K(0)∨⋯∨K(n)⟩;
- the E(n)-locality of Landweber-exact theories.

The references list names works without theorem numbers.

Witness: the invariant-prime paragraph (`README.md:670–679`) is exactly ravenel-green Theorem 4.3.2, at line 6801, printed p. 120, parts (i)–(iv), but it is not cited. Ravenel §4.1 describes the Landweber filtration and exact functor theorems only in unnumbered text (ravenel-green lines 6646–6674).

Repair: add a locator at each claim. Use Ravenel Theorem 4.3.2 for the invariant primes. Use Landweber's 1976 paper, at its theorem numbers, for the filtration and exact functor theorems. Use Lubin–Tate 1966 at its theorem number. Use Ravenel's *Nilpotence and Periodicity*, at theorem numbers, for thick subcategories, periodicity and the Bousfield classes.

## R11 (P3) — Twelve backticked names of this roadmap's own are not declared in Suggested.lean

Location: `README.md:698` `gradedComoduleFilteredPresentation`; `793/797/801` `muSmashNilpotence`, `muSelfMapNilpotence`, `muHurewiczNilpotence`; `1125` `muPtypicalRingComparison`; `1474` `muPtypicalPolynomialCoefficientIso`; `1644` `moravaStabilizer_cohomology_vanishing`; `2010` `torusFiniteCellMappingEulerComparison`; `2019` `momentNormalMU_eulerPrecomposition_injective`; `2048` `finiteProductCircleCharacters`; `2095` `muPtypicalFiniteCohomologyComparison`; `2135` `momentStratumExtension_nullhomotopy`.

Claim: a backticked name of this roadmap's own claims that `Suggested.lean` declares it. None of these is declared, and none can be, since its carriers are absent at the pins.

Witness: `grep` finds each name only in `README.md`. `Suggested.lean` declares only the six names in `scratch/signatures.md`.

Repair: write each as a prose target name without backticks, for example "the torus finite-cell mapping Euler comparison". The same twelve names occur in #1807's version.

## R12 (P3) — The README is not in house shape and abbreviates roadmap names

Location: the whole README. Its headings are `## Carriers, conventions and owners`, `## F1.`–`## F6.`, `### F6.1.`–`### F6.7.` and `## Order and references`. In citations: "G's filtration" (11 times, e.g. `README.md:508`), "ELL's" (640), "String" (492, 664), "TopK's" (201), "Elliptic E2" (1722), "CC/G5.7" (2026).

Claim: the README is missing the house sections and per-layer apparatus:
- no `**Summary.**`, Scope and ownership, Conventions, Exact supplier contracts or How to read the build;
- no `## Layer k:` headings with `### k.n` subsections;
- no `*Needs:*` line anywhere, and no `### Examples` or `### Dependencies` in any layer;
- no API bullets, and no `**Checks.**` lists (Checks are run-on sentences);
- no Downstream consumers or References section.

Roadmaps are cited by abbreviations, or without a section.

Witness: `grep -c "Needs:"` gives 0. The headings above are the file's complete heading list.

Repair: restructure to the house shape: one layer per F-section, prose targets with a `*Needs:*` line each, API bullets and at least three Checks per definition, and Examples and Dependencies per layer. Cite GeneralizedCohomology, EllipticCohomology, StringOrientation, TopologicalKTheory and CharacteristicClasses by full name and section.

## Verified sound

**Gate and build.**
- Worker's gate: `dropped=3`, `outside-folder=2`, `build=0`, all other rules 0. My re-run confirms `dropped=3` (lines 40, 297, 883).
- `lake env lean TauCetiRoadmap/BordismFormalGroups/Suggested.lean`: only `declaration uses 'sorry'` at lines 68 and 98.
- `scratch/signatures.md`: 6 declarations. I compared each elaborated type with its README statement. No section binder is lost, and the generality is the same, a separably closed characteristic-p field with commutative laws.
- Probe file (scratch copy): `formalNSeries_eq_nsmulSeries` holds by induction. The exponent-two theorem closes by one `exact`. The native-carrier classification, its forward direction `fun ⟨e⟩ => e.height_eq p`, and the Lubin–Tate statement all elaborate.

**Dependency check.** `depcheck: 238 roadmaps, 2436 edges, 0 problem(s)`: no UPWARD, CYCLE or `moved:` line.

**Adversarial table.**

| # | Statement | Instances | Values computed (each side) | Result | Change |
|---|---|---|---|---|---|
| 1 | `exists_unique_normalized_exponentTwo_logarithm` | R=𝔽₂, F=𝔾ₐ; F=𝔾ₘ over 𝔽₂; R=ℤ; R=0 | 𝔾ₐ: [2]=2X=0; g=X is normalized and additive, and another additive normalized g=X+Σb_jX^(2^j) forces b_j=0, so g is unique. 𝔾ₘ: [2]=X²≠0, hypothesis false. ℤ: coeff₁[2]_F=2≠0, so the hypothesis never holds (2=0 is forced). R=0: both sides trivial | true; equals the pinned theorem at p=2 | R06 |
| 2 | `exists_formalGroupIso_iff_formalHeight_eq` | k=𝔽̄₂: (𝔾ₐ,𝔾ₘ), (𝔾ₘ,𝔾ₘ); k=𝔽̄₃: 𝔾ₘ; k=𝔽_p: 𝔾ₘ vs a twist | 𝔾ₐ: [2]=0, height ⊤. 𝔾ₘ: [2]=X², least h with coeff(2^h)≠0 is 1. ⊤≠1, and no iso exists (it would carry X² to 0): both sides false. (𝔾ₘ,𝔾ₘ): both true. 𝔽̄₃: [3]=X³, height 1. Over 𝔽_p the heights agree (1=1) but the laws are not isomorphic, since H¹(Ẑ,ℤ_p^×)≠0; IsSepClosed excludes this | true (Ravenel A2.2.12) | R02 |
| 3 | `formalHeight` vs `FormalGroup.height` | commutative F over char p; 𝔾ₐ; ℤ, 𝔾ₐ, p=2 | order [p]_F=p^h (`exists_order_nsmulSeries_eq_pow`), so the least h with coeff(p^h)≠0 is log_p(order). 𝔾ₐ: ⊤ on both. ℤ: coeff₁(2X)=2, value 0, a junk value outside the theorem | duplicate | R02 |
| 4 | `IsFormalGroupIso` | φ=X; φ=2X on 𝔾ₐ over 𝔽₃; φ=0; φ=X² | X: an iso. 2X: 2(X+Y)=2X+2Y and 2 is a unit, an iso. 0 and X²: coeff₁ is not a unit, excluded | duplicate of `FormalGroupIso` | R02 |
| 5 | Lubin–Tate (`README.md:745`) | h=1, F=𝔾ₘ; h=2 | h=1: MvPowerSeries (Fin 0) W(k) ≅ W(k), Γ=𝔾ₘ. h=2: W(k)[[u₁]]. 1≤h guards the ℕ subtraction | statable | R04 |
| 6 | Lazard L≅ℤ[x₁,x₂,…] | pin | `mvPolynomialEquiv : MvPolynomial ℕ+ ℤ ≃ₐ[ℤ] LazardRing` | proved at pin | R01 |
| 7 | Steenrod instability Check (`README.md:285`) | a∈H¹(RP^∞) | Sq¹a=a² (Sq^{\|x\|}x=x²); Sq²a=0 since 2>1 | true | — |
| 8 | Degree Check (`README.md:286`) | p=2, p=3 | \|ξ₂\|=3, \|Q₁\|=2²−1=3; \|ξ₁\|=4, \|τ₀\|=1, \|τ₁\|=5, \|Q₁\|=5 (Ravenel 3.1.1) | true | — |
| 9 | d₂ Check | (1,2) | bidegree (2,1): (1,2)↦(3,3), t−s goes 1→0 | true | — |
| 10 | Completion Check | M(ℤ/2^∞) | classical: lim (ℤ/2^∞)/2^n=0. Derived: π₁=Hom(ℤ/2^∞,ℤ/2^∞)=ℤ₂, π₀=Ext(ℤ/2^∞,ℤ/2^∞)=0. Tensor form: π₀=ℤ/2^∞ | true | — |
| 11 | Kudo d_r (`README.md:239`) | \|y\|=2k | y^(p−1)⊗τy lies in E^(2k+1,2k(p−1)); r=2k(p−1)+1 lands in E^(2kp+2,0); \|βP^kτy\|=2kp+2; sign as in GW 6.5(3) | true | — |
| 12 | Borel vs GW 6.2 | hypotheses | the source needs (i) E₂≅W⊗V and convergence; the README says "any" spectral sequence | overclaims the source | R09 |
| 13 | A//E locator | Ravenel 3.1.4 | 3.1.4 is MU; 3.1.6 is P_*; 3.1.8 is E=A_*⊗_{P_*}𝔽_p | wrong locator | R09 |
| 14 | MU Hurewicz Check (`README.md:334`) | i=1..6 | i+1=2,3,4,5,6,7 gives 2b₁,3b₂,2b₃,5b₄,b₅,7b₆ (Ravenel 3.1.5(ii)) | true | — |
| 15 | MO degree-5 Check (`README.md:395`) | n=5 | p(5)=7. A_* dims (1,1,1,2,2,2), P dims (1,0,1,0,2,1) in degrees 0–5. Σ=1+2+0+2+0+2=7 | true | — |
| 16 | MO low-degree Check | n≤4 | π₁=π₃=0; π₂=𝔽₂x₂; π₄ has basis x₄,x₂² | true | — |
| 17 | MU/MO splittings | A1.1.18, Miller 10.4 | the sources give module and comodule isos only | route gap | R09 |
| 18 | Hatcher 3C.8 use | S⁰, S^(2r) | the source assumes X connected; the application to S^(2r) is fine | hypothesis dropped | R09 |
| 19 | James Checks (`README.md:883`) | S², S⁰ | J₂/J₁=S⁴, H₂(J₂S²)=ℤ; J(S⁰)=ℕ vs π₀ΩS¹=ℤ | true | — |
| 20 | Toda Checks (`README.md:543`) | ⟨2,η,2⟩ | η²∈ℤ/2; indeterminacy 2π₂^s+π₂^s·2=0; swap degree (−1)^(1·1)=−1 | true | — |
| 21 | Invariant-prime Check (`README.md:677`) | (p,v₁−1) | η_R(v₁−1)=v₁−1+pt₁ lies in (p,v₁−1)Γ; quotient 𝔽_p[v₂,…] is a domain; the ideal is not homogeneous | true | — |
| 22 | Summand counts (`README.md:487`) | p=2, odd p | ku_(p) has p−1 summands with \|v₁\|=2p−2, so ku_(2)=BP⟨1⟩; ko_(p) has (p−1)/2 | true | — |
| 23 | Moore boundary (`README.md:842`) | δ:M(p)→ΣS | MU_*δ=0 (MU_* torsion-free); H₁(δ;𝔽_p) iso; δ^∧r≠0 by Künneth | true | — |
| 24 | Vanishing slopes (`README.md:921`) | p=2 | 2r·2^k−1 = r·2^(k+1)−1 | true | — |
| 25 | v₁ maps (`README.md:1342`) | p odd / 2 | degrees 2p−2 and 8 | true | — |
| 26 | Smith idempotent (`README.md:1133`) | a | Σλ_i=(p−1)a(a+1)/2=(p−1)binom(a+1,2) | consistent | — |
| 27 | 𝔾ₘ differential Check (`README.md:120`) | X+Y+XY | P(F)F_X=(1+Y)/((1+X)(1+Y))=P(X); for 1+T: (1+X)(1+Y)²≠1+X | true | — |
| 28 | K-theory law (`README.md:202`) | L, M | (1+a)(1+b)−1=a+b+ab, so x_(L⊗M)=x_L+x_M+u·x_L·x_M; x(O(1))=u⁻¹β=1 | true | — |
| 29 | Smoothing (`README.md:1994`) | compact C, D | a finite triangulation gives finite CW; true on main; #903 moves the section; AT 8.7 states the compact case | citation drift | R05 |
| 30 | Fracture square (`README.md:1730`) | n=1 | L₁X→L_K(1)X over L₀X→L₀L_K(1)X; L_K(n)L_(n−1)X≃0 since K(n)∧E(n−1)=0 | true | — |

**Library declarations opened at the pins (27).**
- Mathlib: `FormalGroup` (`RingTheory/FormalGroup/Basic.lean:57`), `FormalGroup.IsComm` (:80), `FormalGroup.Point` (:119), `FormalGroup.map` (:185), `WittVector.constantCoeff` (`RingTheory/WittVector/Basic.lean:343`).
- Tau Ceti (`TauCeti/RingTheory/FormalGroup/…`): `nsmulSeries` (`NSMul/Basic.lean:93`), `nsmulSeries_succ` (:101), `exists_nsmulSeries_eq_of_prime` (:327), `invariantDifferential` (`Logarithm/Basic.lean:178`), `log` (:333), `exp` (:449), `logIso` (:560), `existsUnique_logarithm_of_nsmulSeries_eq_zero` (`Logarithm/InfiniteHeight.lean:249`), `exponentTwoLog` (`ExponentTwo/Basic.lean:64`), `eq_exponentTwoLog` (:113), `exponentTwoLogIso` (`ExponentTwo/Iso.lean:128`), `height` (`Height/Basic.lean:200`), `FormalGroupIso.height_eq` (:346), `heightIdeal` (`Height/Ideal.lean:74`), `FormalGroupHom` (`Hom.lean:137`), `FormalGroupIso` (`Hom.lean:351`), `tautologicalPoint` (`AddInv.lean:81`), `LazardRing.lift` (`LazardRing/Basic.lean:311`), `mvPolynomialEquiv` (`LazardRing/Polynomial.lean:112`), `cotangentBasis` (`LazardRing/Indecomposable.lean:398`), `ExponentTwoLazardRing` (`ExponentTwo/Universal.lean:90`), `eq_of_map_residue_eq` (`Rigidity.lean:182`).
- Searched for `IsSepClosed` in the pinned formal-group tree: absent, so the classification remains a headline.
- `SymmetricSpectrum` exists (`TauCeti/AlgebraicTopology/Spectra/SymmetricSpectrum.lean:92`), but there is no stable homotopy category, MU or MO, so the docstring's other "not statable" items stand.

**Cross-roadmap citations resolved (24).** GeneralizedCohomology G2.4, G2.6, G2.7, G2.9, G2.11 (this head, line 669; #1807 is named first in the description's merge order), G3.4, G3.8 (the Milnor sequence), G3.9, G4.3, G5.3, G5.4, G5.5 and G5.7. AlgebraicTopology Stage 5.5 (the Serre spectral sequences, this head lines 1304–1330), Stage 8.7 and Stages 8.8–8.10. CharacteristicClasses C3 (H^*(BO(n);𝔽₂) at line 1208). DGAInfinity Layer 8 (main line 520). RepresentationTheory/CompactGroups Layers 1–2 and the circle engine (lines 226, 248, 443). SymplecticGeometry/ConvexityToric T2 (line 73). ModularCurves height classification (line 2551). EllipticCurves Layer 1 (line 423).

**Overlaps.**
- ChromaticHomotopyTheory (#1643) and GeneralAlgebraicKTheoryPartII (#1742) consume F1–F6 without re-owning.
- #1807 and #1808 carry prefixes of this folder's history, with no merge conflict here.
- HomotopySpheres (#284) also defines Toda brackets (its line 422), but it is on the dropped list, so it is not treated as an owner.

**Source locators verified (37).**
- hatcher-at: 4L.12 (line 21777), 4L.13 (21864), 4L.16 (22197), the unnumbered theorem on printed p. 500 whose proof is deferred (21565), 4J.1 (20284), 3C.8 (12578).
- guillou-weibel: Def 6.1, Thm 6.2, Prop 6.4, Thm 6.5 (lines 748–788).
- miller-cobordism: Lemma 11.1, Thm 11.2 (p=2 only; the coproduct is derived after it), Thm 12.1, Cor 12.2, Thm 12.3, Thm 12.4, Prop 10.4, §13, Ch. 2 Thm 3.5, Prop 8.3.
- ravenel-green: 2.1.1 (X connective, H^*X of finite type; (ii) needs finite type), 2.2.1, 2.2.3, 2.3.3, 3.1.1, 3.1.3, 3.1.4, 3.1.5, 3.1.10, A1.1.18, A1.3.13, A2.1.6 (∂F/∂y at (t,0), which equals the README's F_X(0,T) for commutative F), A2.2.7, A2.2.12, 4.3.2.
- quillen-fgl-bulletin: Theorems 2 and 3.

## Not verifiable

- bousfield-1979, §6 Theorem 6.6 (HF_p-nilpotent completion = derived p-completion; `README.md:287`): the manifest settles it as uncertified (paywalled), so it is cited by locator only.
- thom-1954, Chapitre IV (`README.md:383`): uncertified, cited by locator only.
- Whitehead 1940 and Munkres 1966 behind GeometricTopology's "Smooth implies PL": no open copy. This README cites only the GeometricTopology item.
- Outside the sample, the following are not checked: dhs-nilpotence-i Props 3.27 and 3.33 and Lemma 3.35 (uncertified); Hovey–Strickland Prop 7.10(e); Carrick–Davies–van Nigtevecht Defs 3.3/3.7 and Thm 3.16; Johnson–Wilson Prop 4.14; Würgler Thm 2.16.

## Source issues

- **Misprint** in ravenel-green at Corollary 3.1.10, printed p. 64: the source says that at p=2 the class a_i in Ext^(1,2p^i−1) is represented by [ξ_i]; it should be [ξ_(i+1)], whose degree 2^(i+1)−1 matches, as Lemma 3.1.3 has a₀=[ξ₁]; affects nothing.
