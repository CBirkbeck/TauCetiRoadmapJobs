# Review of BordismFormalGroups (pull request #1807 at edec751)

**Verdict:** needs changes

Full review of `TauCetiRoadmap/BordismFormalGroups/README.md` and `Suggested.lean` at `edec751`. Nothing in this folder changed since `ec7b876`. Gate: the worker's gate passes, including the targeted build. My rerun fails only `outside-folder`, on the 13 sibling folders the brief names as this pull request's own, so that is not a finding. The dependency check reports `236 roadmaps, 2277 edges, 0 problem(s)`. `lake env lean Suggested.lean` gives only the two `sorry` warnings. Two blocking findings: a statable headline is missing, and three objects have a second owner among the open pull requests.

## R01 (P2) — The invariant-prime-ideal theorem is a headline, statable at the pins, but neither stated nor named as not statable

- **Location:** `README.md` line 13 (Summary: "proves the invariant prime ideal theorem, Landweber's exact functor theorem and the Lubin–Tate universal deformation theorem (F5)") and lines 1168–1177 (F5 classification). `Suggested.lean` lines 7–45 never mention it.
- **Claim:** this F5 headline has no statement in `Suggested.lean`. The docstring's not-statable list names Landweber exactness and the Lubin–Tate theorem but not this one.
- **Witness:** the statement below elaborates at the pins with only `sorry` and no new definitions. It uses `LazardRing.grading`, `LazardRing.rightUnit` and `FormalGroup.heightIdeal`. The invariance half is already pinned: `TauCeti.LazardRing.map_rightUnit_heightIdeal` (`CoordinateChange/HopfAlgebroid.lean:390`).
- **Repair:**
  - In `Suggested.lean`, under `/-! ## Layer 5: … -/`, import `TauCeti.RingTheory.FormalGroup.CoordinateChange.HopfAlgebroid` and `TauCeti.RingTheory.FormalGroup.Height.Ideal` and state:
    `theorem eq_bot_or_eq_heightIdeal_of_isPrime_of_map_rightUnit_eq {𝔭 : Ideal TauCeti.LazardRing} [𝔭.IsPrime] (hhom : 𝔭.IsHomogeneous TauCeti.LazardRing.grading) (hinv : 𝔭.map TauCeti.LazardRing.rightUnit = 𝔭.map MvPolynomial.C) : 𝔭 = ⊥ ∨ ∃ p : ℕ, p.Prime ∧ ((∃ n, 1 ≤ n ∧ 𝔭 = TauCeti.LazardRing.formalGroup.heightIdeal p n) ∨ 𝔭 = ⨆ n, TauCeti.LazardRing.formalGroup.heightIdeal p n)`
    This exact statement elaborated in the probe.
  - In F5, add this form on (L, L[b₁,b₂,…]) as a target under that name. Locator: Ravenel, Theorem 4.3.2(iv), p. 121, transported by F5's p-typical comparison.
  - Cite `TauCeti.LazardRing.map_rightUnit_heightIdeal` for the invariance of the I_(p,n), and keep the homogeneity hypothesis. The README's own Check on (p,v₁−1) shows that the ungraded statement is false.
  - Check it: (p) = `heightIdeal p 1` is invariant (pinned) and prime, since L/(p) is a polynomial ring over 𝔽_p.

## R02 (P2) — Steenrod/Adams/MO items, the James construction and Toda brackets each have a second owner among the open pull requests

- **Location:** `README.md` lines 59–72 ("The ordinary-operation items of TangentialBordism's Layer 4 and its additive MO splitting are F2 targets, which TangentialBordism consumes"), line 999 ("Own the three-fold Toda brackets of pointed spaces") and lines 1508–1509 ("Own the James construction").
- **Witness:**
  - #942, `TauCetiRoadmap/TangentialBordism/README.md` lines 62–63: "Owned here: the mod p Steenrod algebras and Adams towers (B4.1–2, B4.7), which BordismFormalGroups consumes".
  - #1287, `TauCetiRoadmap/HomotopySpheres/README.md` lines 3266–3267: "BordismFormalGroups consumes the James stages of 3B in F6.2 and the Toda brackets of 3C.3 in F4".
- **Claim:** each pair hands the same object to the other, so none of them has a single owner.
- **Repair:**
  - Keep the ownership here. This roadmap is on main and so earlier than both. It may consume neither: #942 is not on main, and HomotopySpheres is never a supplier. This side's text is already right.
  - The repair belongs in this pull request's description. Its merge-order paragraph must say that #942 and #1287 are to rebase after this one, replacing B4.1–B4.2, B4.4, B4.7 and 3B, 3C.3 by citations of:
    - F2 **Steenrod algebras and mod-p Adams towers**;
    - F2 **Unoriented coefficients**;
    - F4 (three-fold Toda brackets);
    - F6.2 (James construction).
  - If you judge this coordination out of scope for this package, mark the finding with that reason. The main-first rule supports it.

## R03 (P3) — Lubin–Tate: the uniqueness of the ⋆-isomorphism is pinned but not cited, and the Lean `∃!` nesting is weaker than the README

- **Location:**
  - `README.md` lines 1296–1300: "there is exactly one R-algebra map θ … for which Γ base-changed along θ is ⋆-isomorphic to G, and for that θ exactly one ⋆-isomorphism".
  - `Suggested.lean` lines 93–95: `∃! θ, (∀ i, …) ∧ ∃! e, IsStarIso π e`.
- **Claim:**
  - Taken alone, the Lean text allows a second θ′ that admits two ⋆-isomorphisms. The README's uniqueness of θ, among all θ that admit some ⋆-isomorphism, excludes it.
  - The two agree only through rigidity, and rigidity is already pinned. Neither the supplier contracts nor the *Needs:* line at 1316–1320 cites it.
- **Witness:** `TauCeti.FormalGroupIso.eq_of_map_residue_eq` (`TauCeti/RingTheory/FormalGroup/Rigidity.lean:229`). Over an 𝔪-adically Hausdorff local ring with residue characteristic p, isomorphisms with equal reductions are equal when the reduced source has finite height.
- **Repair:**
  - In `Suggested.lean` line 95, replace `∃! e : …, IsStarIso π e` with `Nonempty {e : TauCeti.FormalGroupIso (Γ.map θ.toRingHom) G // IsStarIso π e}`. This form elaborated at the pins in a scratch copy.
  - Say in the docstring that the uniqueness of e is the pinned rigidity.
  - Add `TauCeti.FormalGroupIso.eq_of_map_residue_eq` (module `Rigidity`) to the From Tau Ceti contract, to the Lubin–Tate *Needs:*, and as an `IsStarIso` API bullet: a ⋆-isomorphism between commutative lifts of a finite-height law is unique. This is the last clause of Lubin–Tate Proposition 2.4, p. 52.

## R04 (P3) — Steenrod paragraph: the change-of-rings formula is not well formed as written, and two locators overreach

- **Location:**
  - `README.md` lines 645–646: "Ext_(A_*)(𝔽_p,P_*⊗C)≅Ext_(E_*)(𝔽_p,C) for an E_*-comodule C (Ravenel, Corollaries A1.1.18 and A1.3.13)".
  - Lines 643–644: A//E dual to P_* "(Ravenel, Theorem 3.1.1 and Lemma 3.1.4)".
  - Lines 685–688: "each a unit multiple of b_i modulo decomposables … (Ravenel, Lemma 3.1.7)".
- **Claim:**
  - For a bare E_*-comodule C, P_*⊗C has no specified A_*-coaction.
  - Lemma 3.1.4 concerns H_*(MU), not A//E.
  - Lemma 3.1.7 gives only C=P(u_i). The unit-multiple-of-b_i clause is the README's own indecomposable count.
- **Witness:** Ravenel Corollary A1.3.13 (`ravenel-green` line 18732) is Ext_Γ(K,Γ□_ΣN)=Ext_Σ(K,N). Lemma 3.1.8 (`ravenel-green` line 3778, p. 64) is the P_*⊗N form, for N an A_*-comodule algebra, with E=A_*⊗_(P_*)𝔽_p.
- **Repair:**
  - Write Ext_(A_*)(𝔽_p,A_*□_(E_*)C)≅Ext_(E_*)(𝔽_p,C) for a left E_*-comodule C (Corollary A1.3.13), with A_*□_(E_*)C≅P_*⊗C as vector spaces.
  - Add the comodule-algebra form Ext_(A_*)(𝔽_p,P_*⊗N)≅Ext_(E_*)(𝔽_p,N) (Lemma 3.1.8, p. 64).
  - For A//E, cite Lemma 3.1.8's E=A_*⊗_(P_*)𝔽_p instead of Lemma 3.1.4.
  - Attribute the b_i clause to the indecomposable count, keeping Lemma 3.1.7 for C=P(u_i).
  - Tested on N=H_*(MU;𝔽_p): it gives Ext_E(𝔽_p,𝔽_p)⊗C=C⊗P(a₀,a₁,…), which is Corollary 3.1.10.

## R05 (P3) — The docstring's not-statable list omits two headlines

- **Location:** `Suggested.lean` lines 28–44. The Summary (README lines 15–20) lists "Bousfield localization" among F6's theorems and "its module-extension nullhomotopy application (F6.6–F6.7)".
- **Claim:** the docstring names F6.6 and the smashing/fracture theorems but not:
  - Bousfield's existence of L_E (F6.1);
  - F6.7's extension-nullhomotopy theorem.
- **Witness:** F6.7 needs G5.7's module-family category and extension classification. Neither has a carrier at the pins: Tau Ceti's `SymmetricSpectrum` is point-set only.
- **Repair:** add both to the not-statable sentence, each with its missing carrier:
  - F6.1 lacks a stable homotopy category of spectra;
  - F6.7 lacks MU-module families over BT and an extension classification.

## R06 (P3) — #1854 changes this folder and conflicts with this head, with no stated order

- **Location:** this pull request's description, merge-order paragraph. It names the stacked ModularCurves/SchemeAndStackFoundations move, which is #1808, but not #1854.
- **Witness:** the overlap report says "#1807 and #1854 conflict in … `TauCetiRoadmap/BordismFormalGroups/README.md`, `TauCetiRoadmap/BordismFormalGroups/Suggested.lean`".
- **Repair:** state in the merge-order paragraph which of #1807 and #1854 is rebased on the other.

## R07 (P3) — README shape: subsections, per-target dependencies, Checks and locator typography

- **Location and claim:**
  - Layers 1–5 have no `### k.n` subsections. Topics are bold run-in paragraphs, for example lines 335, 584 and 881.
  - The whole README has two `*Needs:*` lines (519 and 1316). No other target lists its dependencies.
  - Several targets lack three Checks:
    - F6.6 (lines 2695–2838) and F6.7 (lines 2840–2869) have none;
    - the F4 Toda brackets (line 1014) have two;
    - F4's comodule and Adams–Novikov targets, F5's Landweber exact functor theorem (lines 1235–1258) and F6.4's fracture square (lines 2440–2457) have none.
  - Checks for F1's classification (524), F2 (658, 713, 776), F4 (1014) and F6.2's James construction (1525) are inline "Checks:" prose, not `**Checks.**` bullet lists.
  - About 20 locators lack a space, for example "Lemma8.6" (1070), "Layer8" (1076), "Definitions3.3/3.7" (1046), "item1" (2705), "degree8" (2037) and "AppendixC.2.2" (1787).
  - The `Suggested.lean` section comments read `## F1:` and `## F5:` rather than `## Layer 1: …` and `## Layer 5: …`.
- **Repair:**
  - Split Layers 1–5 into `### k.n` subsections.
  - Give each target a `*Needs:*` line.
  - Add `**Checks.**` lists. Two examples from the roadmap's own data:
    - F6.6: for ℓ=1, χ=[2] gives Π(x)=[2]_F(x)=2x+…, which is regular on MU^*(BT) because its linear coefficient 2 is a nonzero divisor.
    - F6.4: at n=1 and X=Hℚ the square has lower row Hℚ→0.
  - Insert the missing spaces, and rename the Lean section comments.

## Verified sound

**Gate, build and Lean**
- Worker gate: all checks pass, including the targeted build.
- Depcheck `--movable`: 0 problems.
- `lake env lean Suggested.lean`: two `sorry` warnings, nothing else.
- I compared the three elaborated signatures (scratch `signatures.md`, re-elaborated) with the README statements:
  - `nonempty_formalGroupIso_iff_height_eq` matches README lines 488–493 binder for binder;
  - `lubinTate_universal_deformation` matches lines 1260–1300, except the `∃!` nesting (R03);
  - `IsStarIso` has a real body on native carriers.
- No `set_option`, no sorry'd data, `theorem` only, single module docstring.
- Padding probe: neither theorem closes in one tactic. Pinned Tau Ceti has only the forward direction (`FormalGroupIso.height_eq`) and the infinite-height case of the classification. A search for `IsSepClosed` and `Nonempty (…FormalGroupIso` in `RingTheory/FormalGroup` finds only the infinite-height theorem.

**Pinned declarations opened (52)**
- Tau Ceti, `RingTheory/FormalGroup/`:
  - `Height/Basic.lean`: `height` (200), `height_eq_top_iff` (205), `height_eq_natCast_iff` (211), `one_le_height` (228), `height_eq_one_iff` (237), `height_map` (263), `height_𝔾ₐ` (270), `height_𝔾ₘ` (276), `FormalGroupIso.height_eq` (346), `height_smul` (356).
  - `Logarithm/InfiniteHeight.lean`: 249, 278.
  - `Hom.lean`: `FormalGroupHom` (137), `FormalGroupIso` (351), `IsStrict` (433).
  - `Rigidity.lean`: 186, 229.
  - `Height/Ideal.lean`: 74, 138, 218.
  - `CoordinateChange/HopfAlgebroid.lean`: 390.
  - `CoordinateChange/Lazard.lean`: 77, 130, 163.
  - `CoordinateChange/Lifting.lean`: 40.
  - `LazardRing/Basic.lean`: 253, 311, 335, 341, 346, 390, 413.
  - `LazardRing/Polynomial.lean`: 112.
  - `LazardRing/Independence.lean`: 264.
  - `LazardRing/Indecomposable.lean`: 398.
  - `SymmetricCocycle/Classification.lean`: 420.
  - `Obstruction.lean`: 386, 400.
  - `LeadingDifference.lean`: 112.
  - `Frobenius/Factorization.lean`: 125, 139, 180.
  - `NSMul/Basic.lean`: 298, 310, 327.
  - `Logarithm/Basic.lean`: 404, 601.
  - `Logarithm/Naturality.lean`: 117.
  - `ExponentTwo/Basic.lean`: 87.
  - `ExponentTwo/Coordinates.lean`: 55.
  - `ExponentTwo/Iso.lean`: 145.
  - `ExponentTwo/CoordinateChange.lean`: 82.
  - `ExponentTwo/Universal.lean`: 83, 90.
  - `AdditiveSeries.lean`: 127.
  - `TopNilpotentPoint/Basic.lean`: 276.
- Tau Ceti, elsewhere:
  - `RingTheory/PowerSeries/Coordinate/Universal.lean`: 58.
  - `Topology/Triangulable/FiniteCWType.lean`: 41.
- Mathlib: `FormalGroup` (`RingTheory/FormalGroup/Basic.lean`: 57, `Point` 127, `𝔾ₐ` 146, `𝔾ₘ` 162, `map` 185), `WittVector.constantCoeff` (`RingTheory/WittVector/Basic.lean`: 343) and `IsAdicComplete extends IsHausdorff, IsPrecomplete` (`RingTheory/AdicCompletion/Basic.lean`: 57).
- All 237 backticked names in README lines 1–560 resolve. The only exceptions are this file's own declaration, module paths and Mathlib names.

**Cross-roadmap citations resolved (24)**
- At this head:
  - GeneralizedCohomology: G2.4–G2.11 and G3.1/3.3/3.8/3.9; G4, G4.3 and G4.5; G5.1 and G5.3–G5.7. The five G2.11 headings named in Scope and ownership exist, once each.
  - AlgebraicTopology Stages 5.5, 8.8 and 8.10.
  - CharacteristicClasses C3 (line 1212).
  - TopologicalKTheory Conventions: `β=[L]−1` with L≅O(−1) (lines 247–254).
- On main:
  - RepresentationTheory/SchurWeyl Layers 0, 2 and 5 (hook-length, line 522).
  - CompactGroups Layers 1–2 and the circle engine (line 443).
  - DGAInfinity Layer 8 (line 520).
  - ProfiniteCohomology.
  - GeometricTopology "smoothing-and-triangulation comparison" item 1: mapped to Layer 11.3 by its anchor table (lines 776–781). Layer 11.3 (line 7887) proves Cairns–Whitehead smooth triangulations, and `TauCeti.IsTriangulable.finiteCWType` needs `[CompactSpace X]` and `IsTriangulable X`.
- Consumers on main still resolve:
  - EnhancedDerivedSheaves' F6.5 sub-headings, through the mapping list at lines 85–110;
  - GeneralizedCohomology's anchor `#f65-local-group-actions-and-completion-comparisons` (heading unchanged);
  - EllipticCohomology's F1/F4/F5/F6 and PositiveScalarCurvature's F4.

**Seeded sample, read at the text**

| Target | Locators verified | Result |
|---|---|---|
| Lazard ring, cocycle lemma, Hopf algebroid | pinned decls above. Ravenel A2.1.8 (line 19962) | sound |
| Invariant differential, log, exp | Ravenel Thm A2.1.6 (line 19937, pp. 353–354), uniqueness in the proof of A2.1.9 (line 19989) | sound |
| Exponent two | `existsUnique_logarithm_of_nsmulSeries_eq_zero` holds for every prime p over any commutative ring, `natCast_eq_zero_of_nsmulSeries_eq_zero`, `ExponentTwoLazardRing.Index` (i+1 not a power of 2) | sound |
| Height and Lazard's classification | Ravenel Thm A2.2.12 (line 20790, p. 366: K separably closed, char p>0), Def A2.2.11 (p. 367), (A2.2.13) and t₀θ(v_n)=t₀^(p^n) (line 20812), Lemma A2.2.7, Def A2.2.8, Ex. A2.2.10 (p. 366) | sound |
| Steenrod algebras and mod-p Adams towers | Hatcher 4L.12/4L.13/4L.16 (lines 21777/21864/22197), unnumbered theorem p. 500 (line 21565, proof deferred). Miller Thm 11.2 (line 1142, p=2). Ravenel Thms 2.1.1, 2.2.3, 2.3.3, 3.1.1 (pp. 61–62), Def 2.2.1, Lemmas 3.1.3, 3.1.4, Cor 3.1.10, A1.1.18, A1.3.13. Guillou–Weibel Def 6.1, Thm 6.2, Prop 6.4, Thm 6.5 (lines 748–788) | R04; rest sound |
| Unoriented coefficients | Miller Prop 10.4 (line 1023), Thm 12.1, Cor 12.2, Thm 12.3, Thm 12.4 (lines 1226–1261); §13 states π_*MO without proof (lines 1371–1376). Quillen 1969 Thm 3 (line 110) | sound |
| Height-n Honda law | Ravenel Thm A2.2.3 and (A2.2.4) (line 20556, p. 364), Def A2.2.11 p. 367, Ex. A2.2.10(ii) | sound |
| Lubin–Tate deformations | Lubin–Tate p. 49 ⋆ (line 39), Prop 1.1 p. 50 (R a ring with maximal ideal J, R/J≅k; line 65), Prop 2.4 p. 52, Prop 2.6 p. 54, Thm 3.1 p. 56 (line 284), §3.2/Prop 3.3 p. 57, §§3.4–3.5 p. 58 | R03; locators sound |
| Smoothing-and-triangulation comparison | as above | sound |

Also checked: Ravenel Thm 3.1.5(ii), Lemma 3.1.7, Thm 4.3.2 (pp. 120–121); Ravenel orange Def 6.2.3 (p. 64), Thm 6.2.4 (p. 65) and the P_t^s range t>s≥0 (p. 63); Hatcher 4J.1 (line 20284) and 3C.8 (line 12578); Quillen 1969 Thm 2 (line 72).

**Duplication and ownership**
- No ⋆-isomorphism predicate and no Lubin–Tate theorem at the pins.
- `roadmaps grep` for universal deformation and Lubin–Tate finds only Galois-deformation and Lubin–Tate-tower uses. ChromaticHomotopyTheory (#1643), GeneralAlgebraicKTheoryPartII (#1742) and StableHomotopyKTheoryPartII (#1733) consume F1–F6 and own no F-target. GeneralAlgebraicKTheoryPartII §4.8 owns the finite-telescopic fracture lemma, a different object from F6.4's E(n)-local square.
- The two-owner cases are in R02.
- No change outside the pull request's named folders. No id cited by another roadmap is dropped: the F6.5 sub-headings carry old → new lines.

**Adversarial pass**

| Statement | Instances tried | Values computed (each side) | Result | Change |
|---|---|---|---|---|
| `nonempty_formalGroupIso_iff_height_eq` | 𝔾ₐ vs 𝔾ₘ over 𝔽̄_p | heights ⊤, 1; no iso / heights differ | holds | — |
| same | F=G | iso X / ⊤=⊤ or h=h | holds | — |
| same | X+Y+uXY vs 𝔾ₘ | [p]=u^(p−1)x^p, height 1 = 1; iso x↦ux | holds | — |
| same | over 𝔽_p (hypothesis dropped): 𝔾ₘ and a twist by u≠1 | heights 1=1; not isomorphic (Frobenius p vs pu in End=ℤ_p) | IsSepClosed needed | — |
| same | H₁ vs 𝔾ₘ | [p]=x^p for both, height 1; iso over 𝔽̄_p | holds | — |
| `IsStarIso` | [1+p] on 𝔾ₘ over ℤ_p | reduction x+x^p+x^(p+1) ≠ x | not ⋆ | — |
| same | 2x on 𝔾ₐ, p odd | reduction 2x ≠ x | not ⋆ | — |
| same | x↦ux, G=X+Y+uXY, u≡1 (p) | u(X+Y+uXY)=uX+uY+(uX)(uY); reduction x | ⋆ | — |
| `lubinTate_universal_deformation` | h=1, `Fin 0` | θ=algebraMap is the only map; a ⋆-iso exists (H² has dimension 0) | holds | — |
| same | A=k, π=id | θ=ρ∘constantCoeff; Γ_θ=F₀=G; e=X is unique | holds | — |
| same | R=W(k), A=W(k)[[t]], G=Γ | ker(ρ∘const)=(p,t)=𝔪; θ=id, e=id | holds | — |
| same | additive F₀ (excluded by `hF₀`) | over 𝔽_p[ε], X+Y+εC_(p^j): ⋆-change Σg_n d_n C_n with d_(p^j)=0; infinitely many classes vs p^(h−1) maps | hypothesis needed | — |
| same | normal form x+y mod deg p^h | F≡x+y+aC_(p^j) gives [p]≡−a x^(p^j) (telescoping Σ_(m<p)((m+1)^q−m^q−1)/p=p^(q−1)−1), so a=0 when j<h | route sound | — |
| same | two ⋆-isos at θ′≠θ₀ | Lean `∃!` allows it; README excludes it; pinned rigidity forbids it | weaker text | R03 |
| Invariant primes (README F5) | (p,v₂) | η_R(v₂)≡v₂+v₁t₁^p−v₁^pt₁ mod p ∉ (p,v₂)Γ | not invariant | — |
| same | (v₁) | η_R(v₁)=v₁+pt₁; pt₁ ∉ (v₁)Γ | not invariant | — |
| same | (p,v₁−1), ungraded | η_R(v₁−1)=v₁−1+pt₁ ∈ (p,v₁−1)Γ; quotient 𝔽_p[v₂,…] | invariant prime: homogeneity needed | — |
| Honda law H_n | v_n↦1 / v_n↦u / v_n,v_(n+1)↦1 | x^(p^n) / u x^(p^n) / x^(p^n)+_F x^(p^(n+1)); height n each | holds | — |
| Invariant differential | 𝔾ₘ | P=(1+T)⁻¹; P(F)F_X=(1+Y)/((1+X)(1+Y))=P(X); 1+T fails | holds | — |
| Exponent two | X² along X+Y | (X+Y)²−X²−Y²=2XY, zero iff 2=0 | holds | — |
| MU Hurewicz | i=1,…,6 | i+1=2,3,4,5,6,7 → 2b₁,3b₂,2b₃,5b₄,b₅,7b₆ | matches Ravenel 3.1.5(ii) | — |
| Cor 3.1.10 at p=2 | a_i bidegree | (1,2^(i+1)−1) = |ξ_(i+1)|, not |ξ_i| | README right; source misprint | — |
| π_*MO | degrees 0–5 | 𝔽₂,0,𝔽₂,0,𝔽₂²,𝔽₂; degree 5: H 7 = 1·1+1·2+1·0+2·1+2·0+2·1 | holds | — |
| K-theory law | x_K=u⁻¹([L⁻¹]−1) | u⁻¹((1+ux)(1+uy)−1)=x+y+uxy | holds | — |
| ko_(p) splitting | p=3, 5, 7 | degrees 4i+2(p−1)k cover 4ℕ exactly: {0}+4k; {0,4}+8k; {0,4,8}+12k | holds | — |
| Steenrod Checks | Sq on RP^∞; degrees; d₂ | Sq¹a=a², Sq²a=0; at p=3, |τ₁|=|Q₁|=5; (1,2)→(3,3), stem 1→0 | holds | — |
| Strong type | S/2; S/p, p odd | S/2: only (s,t)=(0,1), Sq¹ is an iso, so strong type 1. S/p: P¹=0, Margolis homology = H, so not strong type 1 (orange Def 6.2.3) | holds | — |
| v₁ self-map degree | p=2; p odd | 8=2·4·1, a=4; 2p−2, a=1 | holds | — |
| Type of a cofiber | Cof(v₁) on S/p | K(1)-acyclic; K(2) nonzero; H rank 2→4 | type 2 | — |
| Bousfield classes | ⟨Hℚ⟩<⟨S⟩; ⟨HF_p⟩<⟨Hℤ⟩ | S/p is Hℚ-acyclic and ≠0; Hℚ∧HF_p=0, Hℚ∧Hℤ=Hℚ | holds | — |
| James construction | J(S⁰) | ℕ vs π₀ΩS¹=ℤ | connectedness needed | — |
| Toda bracket | ⟨2,η,2⟩ | η² in π₂^s=ℤ/2; indeterminacy 2π₂^s+π₂^s·2=0 | holds | — |
| BP⟨0⟩₃ at p=2 | K(ℤ_(2),3) | ι₃² of order 2, Sq³ι₃=ι₃²≠0, so 2-torsion in H⁶ and H₅ | holds | — |

## Not verifiable

These are settled as uncertified in `sources.toml`, so they are cited by locator only and I did not read them:
- Thom 1954, Chapitre IV;
- Bousfield 1979, §6 Thm 6.6;
- Toda 1962, Ch. I;
- James 1955, §§1–6;
- Devinatz–Hopkins–Smith §§1–3, Prop 3.27, Lemma 3.35 and Prop 3.33;
- Hopkins–Smith;
- Johnson–Wilson Prop 4.14;
- Würgler Thm 2.16 and Rem 6.19;
- Symonds Thm 5.2 and Prop 5.4;
- Hovey–Strickland;
- Greenlees–Sadofsky;
- Adams;
- Wilson;
- Landweber–Ravenel–Stong.

Lurie HTT/HA, Nikolaus–Scholze, Clausen–Mathew, Kuhn, Hovey–Sadofsky, Hovey (MString), Carrick–Davies–van Nigtevecht and Bauer are in the cache. They are outside the seeded sample, and I did not check them.

## Source issues

- **Misprint** in ravenel-green at Corollary 3.1.10, p. 64: the source says that at p=2, a_i is represented by [ξ_i]; it should be [ξ_(i+1)], since a_i lies in Ext^(1,2p^i−1) and |ξ_(i+1)|=2^(i+1)−1 (a₀=[ξ₁] by Lemma 3.1.3); affects nothing.
