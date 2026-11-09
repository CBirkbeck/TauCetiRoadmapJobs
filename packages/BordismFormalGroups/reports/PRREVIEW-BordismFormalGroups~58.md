# Review of BordismFormalGroups (pull request #1854 at 200e4f3)

**Verdict:** needs changes

## R01 (P1) — Milnor's theorem route: A does not act freely on the product of the degree-two classes at odd p

**Location.** `TauCetiRoadmap/BordismFormalGroups/README.md` lines 619–621: "through the action of A on the product of the degree-one (p=2) or degree-two (odd p) classes of (Bℤ/p)^n, which is free through degree n."

**Claim.** At odd p, the map A_q → H^(2n+q)((Bℤ/p)^n), θ ↦ θ(y₁⋯y_n), is injective for q ≤ n.

**Witness.** Here y_i=βx_i, so βy_i=β²x_i=0, and the Cartan formula gives β(y₁⋯y_n)=0. Since β≠0 in A₁ and 1≤n, injectivity already fails in degree 1. The cited freeness (`miller-cobordism` line 1105, Lemma 11.1) is for p=2 only.

**Repair.** Restrict the freeness clause to p=2: "at p=2, through the action of A on x₁⋯x_n∈H^n((ℝP^∞)^n), which is free through degree n (Miller, Chapter 1, Lemma 11.1)". At odd p, replace it with a detection statement that accounts for β:
- β and every Q_j annihilate y₁⋯y_n;
- the Q_j are detected on the exterior classes, Q_j x = y^(p^j);
- the reduced powers P^I are detected on y₁⋯y_n.

Give the odd-prime step its own target and locator. Ravenel's Theorem 3.1.1 (`ravenel-green` line 3673) cites Milnor 1958 without proof.

Tested at n=1: β(y)=0, while Q₀x=y and Q₁x=P¹βx−βP¹x=P¹y=y^p, because P¹x=0 for |x|=1.

## R02 (P2) — Steenrod/Adams/MO, James construction and Toda brackets still have several constructors among open heads

Re-raises the previous review's R03, which is now partly repaired.

**Location.**
- README lines 53–59: "This roadmap is the single owner of the mod-p Steenrod operations and algebras, … the three-fold and higher Toda brackets (F4) and the James construction with its James–Hopf maps (F6.2)".
- README lines 3161–3171: "it cites these items rather than constructing them"; "its James reduced product (its §4.30b) is F6.2's James construction, cited from there".

**Claim.** This roadmap and the open roadmaps below each construct the same objects, and each says the other consumes them.

**Witness.**
- TangentialBordism at #942's head, README lines 62–63: "Owned here: the mod p Steenrod algebras and Adams towers (B4.1–2, B4.7), which BordismFormalGroups consumes". Lines 2007–2008 say the same for B4.8's change of rings.
- HomotopySpheres at #1287's head, lines 3266–3267: "BordismFormalGroups consumes the James stages of 3B in F6.2 and the Toda brackets of 3C.3 in F4".
- GeneralAlgebraicKTheoryPartII at #1742's head, §4.30b (line 1212): constructs J(W) and declares `JamesReducedProduct` in its `Suggested.lean` (line 1235).
- StableHomotopyKTheoryPartII at #1733's head, line 12: assigns the Steenrod algebras and Adams tower to TangentialBordism §B4.

**Repair.** Keep the ownership here: this roadmap is on main, so it precedes all four heads, and HomotopySpheres may not be cited as a supplier. The README half is done.
- Name #942, #1287 and #1742 in the description's merge-order paragraph, with what each must replace by a citation before it merges:
  - #942: B4.1–B4.2, B4.4 and B4.7–B4.8 by F2;
  - #1287: 3B by F6.2 and 3C.3 by F4;
  - #1742: §4.30b by F6.2.
- Name #1733's line 12, which must cite F2.

With that in place, each object has one constructor. Until those heads change, the sentence at lines 3164–3166 states a contract, not a fact; keep it, but do not cite any of those heads.

## R03 (P2) — F6.7 plans a construction inside SymplecticGeometry/ConvexityToric T2, which neither plans nor consumes it

**Location.**
- README lines 3129–3140: "Construct the geometric instantiation in SymplecticGeometry/ConvexityToric T2, … Supply its actual stable-stratum/support cofiber, j, diagonal Thom/Euler homotopy … SymplecticGeometry/ConvexityToric T2 supplies the geometric cofiber data on its side."
- The same claim at lines 222–226 and 3178–3179.

**Claim.** T2 instantiates F6.7, and T2 supplies cofiber data to this roadmap.

**Witness.**
- `TauCetiRoadmap/SymplecticGeometry/ConvexityToric/README.md` §T2 (line 73 on), both on main and at this head, never mentions BordismFormalGroups, F6.7, MU-modules or nullhomotopies (grep count 0).
- This roadmap's own Scope (lines 71–72) says "Nothing geometric … is constructed here."

**Repair.**
- Delete the final F6.7 paragraph (lines 3129–3140), the How-to-read sentence at lines 222–226 and the consumer sentence at lines 3178–3179. F6.6–F6.7 then stand as general MU-module results.
- In the Summary, call F6.7 "the module-extension nullhomotopy lemma".
- If the moment-map application is wanted, ConvexityToric T2 states it in its own README, citing F6.7.

## R04 (P2) — Landweber's invariant-prime classification is statable at the pins and absent

**Location.**
- README lines 1231–1243 (F5's first target, stated on BP_*).
- The `Suggested.lean` docstring (lines 14–44), which neither states the theorem nor names it as not statable.

**Claim.** The deep algebraic theorem of F5 has no Lean statement, although the pins carry the Lazard Hopf algebroid and its height ideals.

**Witness.** Pinned Tau Ceti:
- `FormalGroup.heightIdeal` (`Height/Ideal.lean` line 74) with `heightIdeal_zero` (line 104);
- `TauCeti.LazardRing.rightUnit` (`CoordinateChange/Lazard.lean` line 130);
- `TauCeti.LazardRing.map_rightUnit_heightIdeal` (`CoordinateChange/HopfAlgebroid.lean` line 390), which already proves the invariance half;
- `LazardRing.grading`.

Ravenel states the L-form (`ravenel-green` line 1346).

**Repair.** Add the L-form as an F5 target in the README, and to the Summary's end theorems. State it in `Suggested.lean`, importing `TauCeti.RingTheory.FormalGroup.Height.Ideal` and `TauCeti.RingTheory.FormalGroup.CoordinateChange.HopfAlgebroid`. The following elaborates at the pins with only the `sorry` warning:

```lean
/-- F5 (Landweber–Morava): a homogeneous ideal of the Lazard ring is prime and invariant under the
coordinate-change Hopf algebroid exactly when it is a height ideal `I_(p,n)` (`I_(p,0) = 0`) or
`I_(p,∞)` for a prime `p` (Ravenel, Theorem 1.3.16(iv), p. 17; Theorem 4.3.2(iv), p. 121). -/
theorem isPrime_and_invariant_iff_eq_heightIdeal {I : Ideal TauCeti.LazardRing}
    (hI : I.IsHomogeneous TauCeti.LazardRing.grading) :
    (I.IsPrime ∧ I.map TauCeti.LazardRing.rightUnit = I.map MvPolynomial.C) ↔
      ∃ p : ℕ, p.Prime ∧
        ((∃ n : ℕ, I = TauCeti.LazardRing.formalGroup.heightIdeal p n) ∨
          I = ⨆ n, TauCeti.LazardRing.formalGroup.heightIdeal p n) := by
  sorry
```

Tested:
- I=⊥ is the case n=0, by `heightIdeal_zero`.
- I=(p) is I_(p,1), because p divides the coefficients of X^k in [p]_F for 1≤k<p (`natCast_dvd_coeff_nsmulSeries`).
- The ungraded invariant prime (p,v₁−1) of the README's own Check (line 1241) is excluded by `hI`.

## R05 (P3) — The Lubin–Tate headline is narrower than Lubin–Tate's theorem

**Location.**
- `Suggested.lean` lines 80–82: `[PerfectRing k p]`, `MvPowerSeries (Fin (h - 1)) (WittVector p k)`.
- README lines 1350–1356: "a perfect field k … over W(k)[[u₁,…,u_(h−1)]]".

**Claim.** The theorem needs a perfect k and the base W(k).

**Witness.** In `lubin-tate-1966`:
- Proposition 1.1 (lines 65–68) takes any field k of characteristic p and any ring R with a maximal ideal J such that R/J≅k.
- Theorem 3.1 (lines 284–288) takes any complete Noetherian local R-algebra with m⊇Jo.

For instance, k=𝔽_p(t) with a Cohen ring as R is covered by the source but not by this headline.

**Repair.** State the headline over a local base ring. The following elaborates at the pins:

```lean
theorem exists_universal_deformation {p : ℕ} [Fact p.Prime] {k : Type u} [Field k] [CharP k p]
    {R : Type u} [CommRing R] [IsLocalRing R] (π₀ : R →+* k) (hπ₀ : Function.Surjective π₀)
    (hker : RingHom.ker π₀ = maximalIdeal R) (F₀ : FormalGroup k) [F₀.IsComm] {h : ℕ}
    (hh : F₀.height p = h) :
    ∃ Γ : FormalGroup (MvPowerSeries (Fin (h - 1)) R), Γ.IsComm ∧
      Γ.map (π₀.comp MvPowerSeries.constantCoeff) = F₀ ∧
      ∀ (A : Type v) [CommRing A] [IsLocalRing A] [IsNoetherianRing A]
        [IsAdicComplete (maximalIdeal A) A] [Algebra R A] (ι : k →+* ResidueField A),
        (residue A).comp (algebraMap R A) = ι.comp π₀ →
        ∀ (G : FormalGroup A) [G.IsComm], G.map (residue A) = F₀.map ι →
        ∃! φ : MvPowerSeries (Fin (h - 1)) R →ₐ[R] A,
          IsLocalHom φ ∧ ∃ e : TauCeti.FormalGroupIso (Γ.map φ.toRingHom) G,
            PowerSeries.map (residue A) e.toHom.toPowerSeries = PowerSeries.X := by
  sorry
```

Keep the perfect-field W(k) form as a README Check (R=W(k), π₀=`WittVector.constantCoeff`). Adjust README lines 1350–1365 to the same generality. Tested at R=k, h=1, F₀=𝔾ₘ: the ring is k, and φ is the structure map.

## R06 (P3) — F6.6's finite CW models cite a removed GeometricTopology section and an AlgebraicTopology phrase that names nothing

**Location.**
- README lines 2939–2942: "Obtain the smooth finite CW models from GeometricTopology's **The smoothing-and-triangulation comparison**, item1 **Smooth implies PL**, … followed by AlgebraicTopology's manifold-to-abstract-CW comparison."
- Also the contract at lines 163–165, the Needs at lines 2953–2954 and the Dependencies at line 3156.

**Claim.** These are the supplier sections.

**Witness.**
- On main, GeometricTopology's README (lines 776–779) keeps only an anchor note: that section's item 1 now lives in Layer 11.3.
- "manifold-to-abstract" occurs in no AlgebraicTopology README.
- The owner is AlgebraicTopology Stage 8 item 7 at this head (lines 2453–2458), with `compactManifoldFiniteCWType`.

**Repair.**
- Cite "AlgebraicTopology Stage 8 item 7 (compact smooth manifolds, with or without boundary, have finite CW type, `compactManifoldFiniteCWType`)" in F6.6, its Needs, the Dependencies and the AlgebraicTopology contract.
- Delete the GeometricTopology contract row and its two mentions.

Checked: Layer 11.3 (Cairns–Whitehead smooth triangulations) is what Stage 8 item 7 consumes, so the content is unchanged.

## R07 (P3) — Push gate fails: edits outside this pull request's folders

The previous review's R04, not repaired.

**Location.** The gate at 200e4f3 reports `outside-folder=2`:
- `Completed/ArithmeticDirichletSeries/README.md` (the LFunctions sentence);
- `TauCetiRoadmap/SymplecticGeometry/README.md` (the CG6 sentence).

**Claim.** Neither folder is one of this pull request's roadmap folders. No acceptance is possible while the gate fails.

**Witness.** `git diff origin/main...HEAD` touches exactly these two files outside the named folders. Each is a one-line rewording of the direction of supply.

**Repair.** Move the two sentences into their own pull request, or have both folders recognised as this pull request's own. Then re-run the gate.

## R08 (P3) — #1807 and #1808 carry other versions of this README; the stated order does not resolve them

The previous review's R05, not repaired.

**Location.** The description's merge-order paragraph: "#1101 → #1807 → this pull request … #1808 is independent of this pull request."

**Claim.** #1808 is independent of this pull request, and this folder follows #1807.

**Witness.**
- `roadmaps show BordismFormalGroups` at #1808 differs from this head's README by 1,418 changed lines; at #1807 the difference is 1,367 lines.
- The overlap report lists both heads as conflicting in `BordismFormalGroups/README.md` and `Suggested.lean`.
- The other folders' commits here say "rebased on #1807's copy"; this folder's commits do not.

**Repair.** Rebase this folder on #1807's copy, or have #1807 drop its BordismFormalGroups changes. In the merge-order paragraph, state that #1808 and this pull request conflict in BordismFormalGroups and which one rebases on the other. Then carry one version of the corrected strong-type Checks and of this review's repairs.

## R09 (P3) — Checks: missing for several definitions, and one wrong-model clause is false

**Location.**
- Toda brackets, lines 1036–1041: two Checks.
- No Checks for:
  - the Smith idempotents e_a, a_V, k_V, e_V (lines 1889–1916);
  - the BP⟨1⟩ Ω-spectrum spaces and Hopf ring (lines 983–1001);
  - the higher Toda operations (lines 1069–1107);
  - the Landweber filtration (lines 1268–1290);
  - the real formal law (lines 711–731);
  - the chromatic resolution N^k, M^k (lines 2414–2424).
- F1 Check 1 (lines 487–490): "a definition of height that returned 0 for the additive group would not".

**Claim.** Each definition has three discriminating Checks, and that clause names a model the Check excludes.

**Witness.** With height(𝔾ₐ)=0, the heights 0 and 1 still differ, so the statement still forbids the isomorphism. The clause excludes nothing.

**Repair.**
- Replace the F1 clause with: "a height read off as the order p^h of [p]_F rather than h would give 𝔾ₘ height p, contradicting `height_𝔾ₘ`".
- For the Smith idempotents, add these Checks:
  - p=3, a=2: λ=(4,2) partitions 6=(p−1)·binom(3,2), and its hook lengths 5,4,2,1,2,1 have product 80, prime to 3. The unscaled staircase (2,1) has hook 3, so it fails.
  - In general, the hook at box (i,j) is (m−q)p+r+1, with m=a+1−i, q=⌈j/(p−1)⌉ and 0≤r≤p−2, never divisible by p.
  - p=2 recovers the staircase (a,…,1), all of whose hooks are odd.
- Add a third Toda-bracket Check and at least three Checks for each definition listed above.

## R10 (P3) — One *Needs:* line covers several targets with different needs

**Location.**
- Lines 1687–1692: F6.2 items 1–4.
- Lines 2618–2623: F6.4 items 1–5.
- Lines 2870–2874: F6.5 items 1–5.

**Claim.** Each target has its own dependency list.

**Witness.** In F6.4, item 3 (the Morava stabilizer) alone needs ProfiniteCohomology Layers 10–11 and Lubin–Tate. Item 2 (E-nilpotence) needs neither, yet the shared line puts both in front of it.

**Repair.** Give each numbered item its own *Needs:* line listing only what its statement and route use.

## R11 (P3) — Kudo's and Borel's theorems are taken from a different spectral sequence than the one the induction uses

**Location.** Lines 600–613: "Theorem 6.2 applies to any first-quadrant spectral sequence of graded-commutative 𝔽_p-algebras; Theorem 6.5 is stated for the Leray spectral sequence … so take it over the point site …"

**Claim.**
- Guillou–Weibel's results apply directly in AlgebraicTopology Stage 5.5's Serre spectral sequence of the path–loop fibration.
- Theorem 6.2 applies to any such spectral sequence.

**Witness.**
- `guillou-weibel` lines 761–764: Theorem 6.5 concerns the Leray spectral sequence (6.3) of the bisimplicial E•G→B•G.
- Lines 752–756: Theorem 6.2 also needs (i) E₂≅W⊗V as algebras and (ii) a simple system of transgressive generators.
- No target compares (6.3) with the Stage 5.5 Serre spectral sequence.

**Repair.**
- Add a target that compares (6.3) at the point site with Stage 5.5's Serre spectral sequence of the realized bundle, compatibly with products, transgression and Steenrod operations, with its own *Needs:*.
- Alternatively, prove Kudo's part (3) directly in the Serre spectral sequence.
- State Theorem 6.2's hypotheses (i) and (ii); with field coefficients over the simply connected K(ℤ/p,n), n≥2, they hold by Künneth.

## R12 (P3) — ModularCurves does not consume F1's classification

**Location.**
- Lines 70–71: "ModularCurves consumes F1's height classification".
- The same claim at line 482 and line 3176.

**Claim.** ModularCurves is a consumer.

**Witness.** ModularCurves on main, README lines 2476–2480 (PD-5), asserts the height-2 uniqueness "(Lazard's classification)" citing Lazard 1955. It never names BordismFormalGroups.

**Repair.** Drop the three sentences, or have ModularCurves PD-5 cite F1's `nonempty_formalGroupIso_iff_height_eq` in its own pull request.

## R13 (P3) — Style and wording slips

**Location and repair.**
- About 40 labels run into their numbers: "AppendixC.2.2", "Lemma3.35/Proposition3.33", "Definitions3.3/3.7", "theorem3.16", "Proposition7.10(e)", "Theorem2.16", "Remark6.19", "Theorem5.2", "item1", "Layers1–2", "degree0", "height∞", "type0", "At2", "period1", "rank0/unit1", "Chapters6–8 and AppendixC". Insert the spaces; `grep -E '(Lemma|Theorem|item|degree|height|type|Layer)[0-9∞]'` lists them.
- Line 758, "the images of the ξ_k": the ξ_k live in A_*, the target of the Thom map. Write "lifts of the ξ_k along the Thom map H_*(MO;𝔽₂)→A_*".
- Line 295: the pinned `TauCeti.LazardRing.lift` is `{F : FormalGroup R // F.IsComm} ≃ (LazardRing →+* R)` (`LazardRing/Basic.lean` line 311). Write the bijection in that direction.
- Line 390: `map_exponentTwoLog` is in module `ExponentTwo.Iso` (line 161), not `ExponentTwo.Basic`. Name the module.
- `Suggested.lean` docstring: the Summary's F6.7 end theorem (the module-extension nullhomotopy) is missing from the not-statable list. Add it, with "no MU-module families over BT, no extension classification".

## Verified sound

### The previous review's findings (head b9f2c11)

- **R01, strong-type Checks: repaired.** Lines 2062–2081 now say "at p=2, S/2 has strong type 1: … the only index … is (0,1)" and "at odd p, S/p has type 1 but not strong type 1". Both agree with Definition 6.2.3 (`ravenel-orange` lines 2509–2515).
- **R02, Lubin–Tate statable: repaired.** It is stated at `Suggested.lean` lines 71–92 with locator "Theorem 3.1, p. 56, and §3.2", and README lines 1350–1365 match. The docstring now says the pin has `TauCeti.SymmetricSpectrum` but no stable equivalences, stable homotopy groups or Eilenberg–MacLane spectra; the pinned `AlgebraicTopology/Spectra/` holds only point-set modules, so this is accurate. (Generality: R05.)
- **R03, two owners: partly repaired.** The README sentences are in place (lines 53–59, 3161–3171), but the other heads still construct the objects. See R02.
- **R04, gate: not repaired.** See R07.
- **R05, #1808 order: not repaired.** See R08.
- **R06, house shape: repaired, except for remaining Check and Needs gaps (R09, R10).**
  - Title `# Roadmap: …` and a `**Summary.**`.
  - `## Layer k: Fk.` headings.
  - Six `### Examples` and six `### Dependencies`.
  - 60 *Needs:* lines (previously 1); Checks as bullet lists.
  - New locators: 4.3.2(iv) p. 121, 7.3.2 p. 82, Hopkins–Smith Theorems 7 and 9, DHS Theorems 1–3.
- **R07, locator slips: repaired.**
  - Lines 667–671 and 746–749 now read "as left C-modules and A_*-comodules … not asserted multiplicatively".
  - Line 459 reads "equation (A2.1.24), Theorem A2.1.25".
  - Lines 299–305 put `mvPolynomialEquiv` in `LazardRing.Polynomial`.
- **R08, abbreviations: repaired.** No "G's", "ELL's", "AT8.8", "CC/G5.7" or "String supplies" remains. The Conventions (lines 82–84) define bare G-ids.
- **R09, Young symmetrizer: repaired.** Lines 148–157 and 1889–1902 cite the three pinned declarations; only the ℤ_(p) transport and the hook product prime to p remain targets.

### Gate, build, signatures and padding

- **Gate.** The worker's gate fails only on `outside-folder=2`. My direct run, which does not know this pull request's folders, reports 38 files; all but those two lie in folders the brief names.
- **Dependency check.** `depcheck: 236 roadmaps, 2274 edges, 0 problem(s)`: no UPWARD, CYCLE or moved line.
- **Elaboration.** `lake env lean …/Suggested.lean` gives only `64:8` and `80:8: declaration uses sorry`.
- **Signatures.** I elaborated `#check @…` for both declarations in one scratch file. Both match their README statements binder for binder (README lines 447–452 and 1350–1365); no section binder is lost, and I changed nothing. The worker's `signatures.md` row "`L`" is an artefact of its scratch file.
- **Padding.** `first | simp | rfl | infer_instance | aesop` fails on the classification. A grep of the pinned formal-group tree finds no `IsSepClosed` classification and no deformation theorem, only rigidity. Neither declaration is padding.
- **Form.**
  - One module docstring, the namespace and layer comments.
  - `theorem` only, no `set_option`, no sorry'd data.
  - Imports: `Mathlib` plus the two Tau Ceti modules used, both present at the pin.

### Library declarations at the pins

- A script checked all 227 backticked names in the README against declarations in pinned Mathlib and Tau Ceti. Every name resolves except module names and the two `Suggested.lean` names.
- All 42 cited Tau Ceti module paths exist.
- I checked 86 declarations in the modules the README names, and read the full statements of about 20 of them. Among them:
  - `FormalGroup.height` (`Height/Basic.lean` line 200), `FormalGroupIso.height_eq` (346), `exists_order_nsmulSeries_eq_pow` (180, which needs `IsComm`, as the README's context says);
  - `natCast_dvd_coeff_nsmulSeries` (`NSMul/Basic.lean` line 310, with `k.Coprime n`), `natCast_eq_zero_of_nsmulSeries_eq_zero` (298);
  - `existsUnique_logarithm_of_nsmulSeries_eq_zero` (`Logarithm/InfiniteHeight.lean` line 249), `height_eq_top_iff_nonempty_formalGroupIso_𝔾ₐ` (278);
  - `homogeneousComponent_homDefect_eq_smul_lazardCocycle` (`Obstruction.lean` line 400): the coefficient of [p]_G∘f−f∘[p]_F, matching README line 471;
  - `existsUnique_eq_smul_lazardCocycle` (`Classification.lean` line 420, needing 2≤n), `lazardGcd_prime_pow` (`Basic.lean` line 206), `mvPolynomialEquiv` (`Polynomial.lean` line 112);
  - `eq_of_map_residue_eq` (`Rigidity.lean` line 186), `exists_iso_lifting_coordinate` (`Lifting.lean` line 40);
  - `heightIdeal` (`Height/Ideal.lean` line 74), `map_rightUnit_heightIdeal` (`HopfAlgebroid.lean` line 390);
  - `youngSymmetrizer` and the two hook-length identities;
  - Mathlib's `FormalGroup.Point`, `FormalGroup.map`, `𝔾ₐ` and `𝔾ₘ`, `AddCircle.toCircle_zsmul`, `homeomorphCircle` and `toCircle_addChar` (`CircleAddChar.lean` line 31).

### Cross-roadmap citations resolved (44: 20 GeneralizedCohomology sections, 5 AlgebraicTopology items, 2 CharacteristicClasses, 1 TopologicalKTheory, 9 roadmaps on main, 7 open heads)

- **GeneralizedCohomology at this head (20 sections):** G2, G2.4, G2.6, G2.7, G2.9, G2.11, G3.1, G3.2, G3.3, G3.4, G3.8, G3.9, G4, G4.3, G4.5, G5.1, G5.3, G5.4, G5.5 and G5.7. Its lines 92–101 map F6.5's old sub-headings to G2.11. That keeps EnhancedDerivedSheaves' main citation of F6.5 (its line 32) followable.
- **AlgebraicTopology at this head:** Stage 4, Stage 5 item 5, Stage 8.8a, 8.10 and Stage 8 item 7.
- **CharacteristicClasses at this head:** C3 and the Conventions' standard character line (line 2911).
- **TopologicalKTheory Conventions:** β=[L]−1 with L=O(−1). Hence x_K(O(1))|CP¹=u⁻¹β=1 and F_K=x+y+uxy.
- **On main:** ProfiniteCohomology Layers 10–11, CompactGroups Layers 1–2 and its Fourier engine, DGAInfinity Layer 8 (Massey products, line 534), and PositiveScalarCurvature and EllipticCohomology's citations of F4 and F5, which are consistent. GeometricTopology (R06), ConvexityToric T2 (R03) and ModularCurves PD-5 (R12) were also resolved and failed.
- **Open heads read for ownership:**
  - #942, #1287, #1742 and #1733: R02;
  - #1643: cites F1–F3, F5 and F6.1–F6.5, consistent;
  - #1807 and #1808 copies of this folder: R08.
- **Overlap report:** no dropped or revision-only ids. The vocabulary-closest roadmaps were checked above.

### Seeded sample, read at the text

- **Lazard ring, cocycle lemma and Hopf algebroid.** All names and modules resolve at the pin. C₂=XY, C₃=X²Y+XY², C₄=2X³Y+3X²Y²+2XY³ and C₆ all check (d₆=gcd(6,15,20)=1).
- **Invariant differential, logarithm and exponential.**
  - A2.1.6 (`ravenel-green` line 19937, p. 353).
  - The uniqueness of the logarithm is used in the proof of A2.1.9 (line 19990).
  - For 𝔾ₘ, P(F)F_X=(1+Y)/((1+X)(1+Y))=P(X).
- **Exponent two.** The pinned names resolve. f=X+X³ has integral inverse with coefficients 1, −1, 3, −12, 55, that is (−1)ⁿbinom(3n,n)/(2n+1); mod 2 this is X+X³+X⁵+X⁹+⋯, with no even terms.
- **Height and Lazard's classification.**
  - A2.1.18 (line 20167, p. 358), (A2.1.24) (line 20294) and A2.1.25 (line 20299, p. 360).
  - A2.2.6 (line 20682) and A2.2.7 (line 20711, p. 366).
  - A2.2.12 (line 20790, p. 367: separably closed, char p>0), and (A2.2.13) with t₀θ(v_n)=t₀^(pⁿ) (line 20812).
- **Steenrod algebras and Adams towers.**
  - `hatcher-at` 4L.12 (line 21777), 4L.13 (21864), 4L.16 (22197), and the unnumbered theorem on printed p. 500 (lines 21565–21567; proof deferred).
  - `guillou-weibel` Definition 6.1 (line 748), Theorem 6.2 (752), Proposition 6.4 (767) and Theorem 6.5 (784–788: (3) gives −Q_a(y)).
  - `miller-cobordism` Theorem 11.2 (line 1142) and Lemma 11.1 (p=2 only; see R01).
  - Ravenel: 3.1.1 (`ravenel-green` line 3673), 3.1.3 (3718), 3.1.4 (3741: image P(ξ_i²) at 2), 3.1.5 (3748: h(x_i)=−pb_i or −b_i), 3.1.7 (3770: left A_*-comodule only), 2.1.1 (2627: (ii) finite type, π_*X⊗ℤ_p), 2.2.1 (3107), 2.2.3 (3146), 2.3.3 (3398), A1.1.18 (18098–18103), A1.3.13 (18732) and 4.1.6 (6062).
- **Unoriented coefficients.** `miller-cobordism` Theorem 12.1 (line 1226), Corollary 12.2 (1238), Theorem 12.3 via Proposition 10.4 (1239, 1023), Theorem 12.4 (1261) and §13 (1368–1376: ring stated, proof omitted). Quillen 1969 Theorems 2 and 3 (`quillen-fgl-bulletin` lines 72 and 110).
- **The smoothing-and-triangulation comparison.** Resolves only through main's anchor note to GeometricTopology Layer 11.3 (Cairns–Whitehead, lines 7887–7928). That content supports finite CW models of compact smooth manifolds; the citation itself is R06.
- **Outside the sample.**
  - `lubin-tate-1966`: Proposition 1.1 (line 65, p. 50), Proposition 2.6 (line 214, p. 54), Theorem 3.1 (line 284, p. 56), §3.2 (323), §3.4 (341: identity substitution iff u∈ℤ_p) and §3.5 (354–367: Y²+tXY+Y=X³ over W(𝔽₄)[[t]]).
  - `ravenel-orange`: 1.4.2 (p. 7), 1.5.4 (p. 9), 3.4.3 (p. 37), 5.1.4 (p. 51), 6.2.3 (p. 64), 6.2.4 (p. 65), 7.3.2(a)–(f) (p. 82), 7.5.6 (p. 87) and 9.0.1 (p. 107, connective of finite type).
  - `clausen-mathew` Theorem 1.1 (line 21: the K(n)-local norm equivalence) and `kuhn-tate` Theorem 1.5 (line 151: the T(n) form).
  - `ravenel-green` 4.3.2 (lines 6801–6830, pp. 120–121) and 1.3.16 (line 1338, p. 17).

### Adversarial table

| Statement | Instances | Values computed on each side | Result |
|---|---|---|---|
| Classification (Lean l.64) | 𝔽̄_p, 𝔾ₐ vs 𝔾ₘ | heights ⊤ vs 1; no iso; both sides false | holds |
| same, without IsSepClosed | 𝔽_p, 𝔾ₘ vs its twist by u≠1 | heights 1=1; X^p is [p] vs [pu] in End=ℤ_p, so no 𝔽_p-iso | hypothesis needed |
| same, finite height | A2.2.13 equations | t₀^(pʰ−1)=θ(v_h) and t_i^(pʰ)−θ(v_h)^(pⁱ)t_i=c have derivatives −θ(v_h)≠0 and −θ(v_h)^(pⁱ)≠0, so they are separable and have roots in k | holds; imperfect sep. closed k is fine |
| same, p=2 | 𝔾ₘ over 𝔽̄₂ | [2]=2x+x²=x², so height 1 | holds |
| Lubin–Tate (Lean l.80) | h=1, 𝔽_p, 𝔾ₘ | Fin 0: the ring is ℤ_p and φ is the unique structure map | holds |
| same | A=K a field | local φ forces φ(u_i)∈𝔪_K=0, unique; e=X | holds |
| same | A=k[ε], h=2 | φ(u₁)=aε, so ⋆-classes form a k-line, of dimension h−1 | holds |
| same | h=0 | [p](x)≡px=0 mod x², so the height is ≥1 and the hypothesis is vacuous | harmless |
| same, imperfect k | k=𝔽_p(t), Cohen ring R | LT Prop 1.1 and Thm 3.1 apply; the Lean form excludes it | narrower (R05) |
| ⋆ vs iso (Check) | LT §3.4 | substitution trivial iff u∈ℤ_p; 𝕊₂⊋ℤ_p^× | holds |
| Invariant primes (Lean form) | ⊥, (p), (p,v₁−1) | heightIdeal_zero; I₁=(p); ungraded case excluded by hI | statable (R04) |
| F5 Checks | (p), (p,v₂), (v₁) | A/(p) is a domain; η_R(v₂)≡v₂+v₁t₁^p−v₁^pt₁; pt₁∉(v₁)Γ | holds |
| Milnor route, odd p | n=1, y=βx | β(y)=0 but β≠0 in A₁ | false (R01) |
| Milnor route, p=2 | x₁⋯x_n | Lemma 11.1 | holds |
| Steenrod degrees | p=2; p=3 | p=2: ξ₂ and Q₁ have degree 3. p=3: ξ₁, τ₀, τ₁, Q₁ have degrees 4, 1, 5, 5. Q_{i+1} has degree 2p^(i+1)−1 | holds |
| Instability | a∈H¹(ℝP^∞) | Sq¹a=a², Sq²a=0 | holds |
| Strong type (repaired) | S/2; S/p | S/2: only (0,1) applies, Sq¹ is an iso, Q₁ (deg 3) acts as 0 and dim H=2=rank K(1)^*, so S/2 is strong type 1. S/p: H(H;P¹)=H⊕H≠0, so it is not | holds |
| Seed B₂^(2pⁿ) basis | odd p | x^k for 1≤k≤pⁿ; yx^k for 1≤k<pⁿ (2k+1≤2pⁿ); Q_i(yx^k)=x^(k+pⁱ); P_t⁰x^k=kx^(k+p^t−1) | holds |
| K-theory law | a=[L⁻¹] | u⁻¹(ab−1)=x+y+uxy; x(L⁻¹)=−x/(1+ux); x′ restricts to −1 | holds |
| MO ranks, deg 5 | H_*MO, A_*, P | 7, 2, 1; Künneth sum 1+2+0+2+0+2=7 | holds |
| HR ranks | R=MO_* | π₂,π₃,π₄ = 1,0,2; H₂=1+0+1=2 | holds |
| LN operations | inverse series | coefficient of x³ is 2t₁²−t₂; s_t(x²) has t₁-term 2x³ | holds |
| BP generators | Hazewinkel vs Araki | m₂=v₂/p+v₁^(p+1)/p²; m₁=v₁/(p−p^p), unit 1−p^(p−1); η_R(v₁)=v₁+pt₁ | holds |
| BP⟨1⟩ splittings | p=3 | ku_(3)=BP⟨1⟩∨Σ²BP⟨1⟩; ko_(3)=BP⟨1⟩ ((p−3)/2=0) | holds |
| K(n)^*(BC_p) | [p]=v_nx^(pⁿ) | rank pⁿ; rationally rank 1 | holds |
| ANSS sparseness | p=3 | needs 2(p−1)∣r−1, so r∈{5,9,…}; d₂=d₃=d₄=0 | holds |
| Landweber criterion | KU; ℤ; V(1) | KU: v₁↦u^(p−1), a unit. ℤ: v₁=0 on 𝔽_p, fails. V(1): MU_*V(1)⊗ℤ=ℤ/p in degree 0 vs H_*=ℤ/p in degrees 0 and 2p−1 | holds |
| Toda bracket | ⟨2,η,2⟩ | degree 0+1+0+1=2; value η²; indeterminacy 0 | holds |
| James | S², S⁰ | J₂/J₁=S⁴ with H₂=ℤ; J(S⁰)=ℕ vs π₀ΩS¹=ℤ | holds |
| X(r) | X(2), degree 4 | bottom Σ⁻²CP² (η); rank 2 for r≥3, 1 for r=2 | holds |
| Tel(α;R) | η, 2, u | η⁴=0 with η³=12ν; S[1/2]≠0; KU | holds |
| Smith staircase | p=3, a=2 | λ=(4,2), hooks 5,4,2,1,2,1, product 80 (prime to 3); (2,1) has hook 3 | holds (R09 Check) |
| Margolis/BP⟨j⟩ | cofiber of v_j | 0→Σ^(2p^j−1)H^*BP⟨j⟩→H^*BP⟨j−1⟩→H^*BP⟨j⟩→0 | holds |
| v_n self-map degrees | Adams maps | 8=2·4·(2−1); 2p−2=2·1·(p−1) | holds |
| Γ_k^fS | k=1 | fib(S_(p)→S_(p)[1/p])=Σ⁻¹S/p^∞; D(S/p^a)=Σ⁻¹S/p^a | holds |
| Fracture square | n=1, odd p, S_(p) | π₀: ℤ_(p)=ℚ∩ℤ_p, ℤ_p+ℚ=ℚ_p; L_(K(1))L₀S_(p)=0 ≠ L₀L_(K(1)) (ℚ_p) | holds |
| Morava stabilizer | m=1; p=3, m=2 | S₁=1+pℤ_p; −1∈1+2ℤ₂ has order 2; ℤ₃[ζ₃] embeds in the invariant-½ order | holds |
| Tate checks | Hℤ^(tC₂); H𝔽_p^(tC_p) | ℤ/2 in even degrees; 𝔽_p in every degree | holds |
| Euler (F6.6) | weight m; weight p over H𝔽_p | [m]_F(x)=mx+⋯, injective; [p](x)=0 | holds |
| F1 Check 1 wrong model | height(𝔾ₐ)=0 | 0≠1, so the iso is still forbidden | clause false (R09) |
| LT example §3.5 | p=2, W(𝔽₄)[[t]] | law ≡ x+y+txy+⋯ mod deg 5, so it is a Γ(t) | holds |

## Not verifiable

- `bousfield-1979` §6, Theorem 6.6 (the Steenrod-sample identification of the HF_p-nilpotent completion) and `thom-1954` Chapitre IV (the unoriented-sample ring structure): both are uncertified and not in the cache. Miller §13 states the ring and omits its proof.
- The following are uncertified and were not read:
  - DHS I (Theorems 1–3 and the vanishing-line slopes of F6.2 item 2);
  - Hopkins–Smith II (Theorems 7 and 9);
  - Toda 1962 Chapter I (the suspension sign Σ⟨f,g,h⟩⊂−⟨Σf,Σg,Σh⟩);
  - James 1955;
  - Johnson–Wilson Proposition 4.14 and Würgler 2.16 and 6.19;
  - Greenlees–Sadofsky 1.1;
  - Hovey–Strickland 7.10(e);
  - Symonds; Adams; Quillen 1971.
- `hovey-mstring`, `hovey-sadofsky`, `nikolaus-scholze`, `lurie-htt` and `lurie-ha` are cached, but their section lists lie outside the sample and were not read.
- Ownership against open pull requests was checked only against the heads named above and this pull request's own folders.

## Source issues

- **Misprint** in ravenel-green at Corollary 3.1.10, p. 64: the source says that at p=2 the class a_i is represented by [ξ_i]; it should be [ξ_(i+1)], matching the bidegree (1,2^(i+1)−1) and a₀=[ξ₁]; affects nothing.
- **Misprint** in ravenel-green at the introduction of §A2.1 (p. 351) and the proof of Theorem A2.2.12 (p. 367): the source refers to the p-typical Lazard ring V as (A2.1.24); it should be Theorem A2.1.25, since (A2.1.24) is the p-typical logarithm display; affects nothing.
- **Gap** in ravenel-green at Theorem 1.3.16(iv), p. 17: the source says the only G-invariant primes of L are the I_n, 0<n≤∞, over all primes; it should include the zero ideal and restrict to homogeneous ideals, since (p,v₁−1) is an ungraded invariant prime; affects a stated result.
- **Gap** in ravenel-green at Theorem 4.3.2(iv), p. 121: the source says the only invariant primes of BP_* are the I_n; it should say homogeneous ones, since (p,v₁−1) is invariant (η_R(v₁)=v₁+pt₁) and prime, and the proof's smallest-dimension argument presumes homogeneity; affects a stated result.
