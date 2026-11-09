# Review of BordismFormalGroups (pull request #1808 at d724946)

**Verdict:** needs changes

The gate fails on `outside-folder` only (R02). Every other gate check passes, including the targeted build. `TauCetiRoadmap/BordismFormalGroups/Suggested.lean` elaborates with `sorry` as its only warning, once for each of its three theorems. The dependency check gives `depcheck: 236 roadmaps, 2278 edges, 0 problem(s)`, so there is no UPWARD or CYCLE line.

## Previous findings (review of 55323ac)

| Id | Status | Evidence at d724946 |
|---|---|---|
| R01, S/2 strong type | repaired | Lines 1907–1914: "S/2 has strong type 1: the indices obey 0≤s<t … Sq¹=P₁⁰ is an isomorphism". Lines 1915–1919 add the S/4 negative control. |
| R02, odd-p Milnor route | repaired | Lines 585–597: "β kills each y_i … There prove instead that the map … is an injective map of Hopf algebras". The kernel-primitive argument and the degree bijection were rechecked (table rows 15–17). |
| R03, Steenrod/Adams/MO ownership with TangentialBordism | **not repaired** | Re-raised as R01 below. |
| R04, Lubin–Tate absent | repaired | `exists_lubinTate_universalLift`, Suggested.lean line 107. It is stated over complete noetherian local rings, as in the source. |
| R05, Landweber classification absent | repaired | `isPrime_and_invariant_iff_eq_heightIdeal`, line 90, and README lines 1156–1186. |
| R06, "as comodule algebras" | repaired | Lines 644–649: "simultaneously as a left C-module and as an A_*-comodule". Lines 728–740 derive the ring structure of P (checked in row 22). |
| R07, F6.6 finite CW models | repaired | Lines 2690–2691 cite "AlgebraicTopology Stage 8.7", which is at `TauCetiRoadmap/AlgebraicTopology/README.md` line 2411. The GeometricTopology row is gone. |
| R08, F6.7 SymplecticGeometry | repaired | No mention of SymplecticGeometry or ConvexityToric remains. |
| R09, outside-folder edits | **not repaired** | Re-raised as R02. |
| R10, #1854 ordering | **partly repaired** | #1854's head now carries the correct S/p and S/2 Checks, but its order is still unstated. Re-raised as R10. |
| R11, F6.5 old → new mapping | repaired | Lines 71–79. All five headings exist in GeneralizedCohomology G2.11, at lines 678, 723, 955, 1076 and 1137 of that README. |
| R12, ModularCurves consumer | repaired | The consumer sentences are dropped. ModularCurves at this head does not name this roadmap. |
| R13, docstring's not-statable list | partly repaired | Quillen's unoriented theorem is still missing (R09). |
| R14, locators | repaired | Lubin–Tate Theorem 3.1 (line 1291), Landweber 1976 Theorem 2.6 (line 1253), the `FormalCoordinate` module (line 118) and Lemmas 3.1.6/3.1.8 (line 606) are all in place. |
| R15, Moore ℤ/2^∞ Check | repaired | Lines 625–630. The values were recomputed in row 23. |
| R16, README shape | repaired | Title, Summary, per-layer Examples and Dependencies, *Needs:* lines, and F3's locator and Checks are present. The missing Checks in F6.5–F6.6 are a new finding (R08). |

## R01 (P2) — Steenrod algebras, Adams towers and MO coefficients still have two owners (TangentialBordism)

Not repaired from the previous review's R03.

**Location.** `TauCetiRoadmap/BordismFormalGroups/README.md`:
- lines 31–34: F2 owns "the mod-p Steenrod algebras and HF_p-based Adams towers, the unoriented coefficient ring MO_*";
- lines 58–60: "TangentialBordism consumes F1–F2's formal laws, Steenrod and Adams carriers and coefficient rings".

**Claim.** This pull request moves these objects into F2. The open TangentialBordism roadmap still owns them and says that this roadmap consumes them, so the two roadmaps hand the same objects to each other.

**Witness.** At #942's head, `TauCetiRoadmap/TangentialBordism/README.md`:
- lines 64–65: "Owned here: the mod p Steenrod algebras and Adams towers (B4.1–2, B4.7), which BordismFormalGroups consumes";
- lines 3274–3275: "BordismFormalGroups consumes … B4's MO coefficients".

StableHomotopyKTheoryPartII (#1733), line 12, also names TangentialBordism §B4 as the owner of the Milnor dual.

**Repair.**
- Keep F2's ownership. BordismFormalGroups is on main, so it can consume no open roadmap, and the open roadmap must cite it.
- Record in this pull request's merge-order paragraph that TangentialBordism (#942) must change these items to citations, before #942 merges:
  - B4.1–B4.2 and B4.4–B4.7 become citations of "BordismFormalGroups F2, **Steenrod algebras and mod-p Adams towers**";
  - its MO computation becomes a citation of "F2, **Unoriented coefficients**";
  - its sentences claiming that F2/F6 consume B4.1–B4.8 and B5.4 are deleted.
- Re-run the overlap check once #942 changes.

## R02 (P3) — Gate: two edits outside the pull request's folders

Not repaired from the previous review's R09.

**Location.**
- `Completed/ArithmeticDirichletSeries/README.md` line 331: "`LFunctions` consumes this package and supplies its own character-specific continuation."
- `TauCetiRoadmap/SymplecticGeometry/README.md` line 77: "boundary and sign adapters consumed by HeegaardFloer and consumed by DGFloer".

**Witness.** The worker's gate reports "outside-folder (2) - Completed/ArithmeticDirichletSeries/README.md - TauCetiRoadmap/SymplecticGeometry/README.md". Neither folder is among this pull request's own.

**Repair.** Do one of the following, then re-run the gate:
- move the two one-line edits to a pull request that owns those folders (#1854 lists both);
- or name the two folders in this pull request's description.

## R03 (P3) — F5 re-plans pinned height-ideal results

**Location.** Lines 1244–1245: "Prove independence of lifts of v_i modulo preceding height ideals and of the specified coordinate changes."

**Claim.** The pinned Tau Ceti already proves this. The README still plans it as a target.

**Witness.** In `TauCeti/RingTheory/FormalGroup/Height/Ideal.lean`:
- line 176, `FormalGroup.heightIdeal_succ_eq_sup_of_sub_mem`: every lift v of v_n modulo I_n gives I_(n+1)=I_n+(v);
- line 195, `FormalGroup.heightIdeal_eq_span`: I_n=(v₀,…,v_(n−1));
- line 138, `heightIdeal_smul`, and line 124, `TauCeti.FormalGroupIso.heightIdeal_eq`: coordinate independence.

**Repair.**
- Replace the sentence with: "Lifts and coordinate changes do not matter: `FormalGroup.heightIdeal_succ_eq_sup_of_sub_mem`, `FormalGroup.heightIdeal_eq_span`, `FormalGroup.heightIdeal_smul`."
- Add these three names and `FormalGroup.heightIdeal_one` to F1's height paragraph (line 430) and to the Tau Ceti contract.

## R04 (P3) — Serre–Cartan statement: the odd-prime excess convention is not pinned

**Location.** Lines 539–541: "H^*(K(ℤ/p,n);𝔽_p) is the free graded-commutative algebra on the admissible monomials of excess below n applied to the fundamental class (Hatcher …)".

**Claim.** The statement holds only with Hatcher's odd-prime excess. That convention does not count the leading Bockstein, and the README never states it. With the usual excess 2s₁+ε₀−|I′|, the statement is false at n=1.

**Witness.** Hatcher defines the excess at odd p as Σ_j(2i_j−2p·i_(j+1)−ε_(j+1)) (hatcher-at line 21557). For n=1 and odd p, βι has Hatcher excess 0<1. Its usual excess is 1=n, which would exclude it, whereas H^*(K(ℤ/p,1))=Λ[ι]⊗𝔽_p[βι] (hatcher-at line 21575).

**Repair.**
- After "excess below n", add: "with Hatcher's odd-prime excess e(I)=Σ_j(2i_j−2p·i_(j+1)−ε_(j+1)), which does not count a leading Bockstein".
- Add the Check: "n=1, p odd: ι and βι have excess 0, giving Λ[ι]⊗𝔽_p[βι]; counting the leading β would drop βι."

## R05 (P3) — Build order: an F3 target needs F4, and F3's Dependencies omit it

**Location.**
- Line 928, the *Needs:* of F3's Hopf-ring target: "F4's BP-homology Atiyah–Hirzebruch spectral sequence".
- Lines 938–940, F3's Dependencies: "F1 and F2; GeneralizedCohomology …; AlgebraicTopology's ordinary homology of spaces".

**Claim.** F3 needs F4, while F4 needs F3 (line 1124). This makes a coarse layer cycle, and F3's Dependencies contradict its own *Needs:* line. The same pattern recurs within single layers:
- F4's Moss items need "the Adams–Novikov tower below" (line 1071);
- F5's L-form route uses "F5's p-typical comparison below" (line 1179).

**Witness.** Lines 918–921 already say that the AHSS is built "using only the F3 spectrum/orientation construction". It therefore belongs before the Wilson paragraph.

**Repair.**
- Move the paragraph "Build the AHSS for BP-homology from G's cellular filtration …" (lines 1104–1106) into F3, before line 906.
- Change line 928 to "the BP-homology AHSS above", and line 1124 accordingly.
- Move the Adams–Novikov tower paragraph (lines 1074–1090) before the Massey/Toda comparisons, and the MU-transport paragraph (lines 1237–1249) before the L-form classification. Alternatively, mark each such reference "(route input)" and list it in the layer's Dependencies.

## R06 (P3) — Cross-roadmap citations: one wrong item, undefined abbreviations, incomplete contracts

**Location.**
- Lines 139–140 ("G5.3–G5.5 … finite duality"), 1276, 1341 and 2825 ("G5.5's finite duality").
- Undefined abbreviations:
  - "ELL's … Hovey stable model" (line 1080);
  - "AT8.8's bar/CW model" (line 1887);
  - "Elliptic E2" (lines 2410, 2635, 2674);
  - "CC/G5.7's standard character line" (line 2734);
  - "G's …" (lines 168, 212, 919, 964, 1105, 1269, 1397, 1578, 1759, 2444, 2683).

**Claim.**
- Finite duality is GeneralizedCohomology G5.1, not G5.5.
- The abbreviations are defined nowhere in this README.
- The supplier contracts omit declarations that the headlines consume.

**Witness.**
- At this head, `TauCetiRoadmap/GeneralizedCohomology/README.md` line 2341 is "1. **Finite spectra and Spanier–Whitehead duality.**". Line 2516 is "5. **Orientation example interfaces.**", which has no duality content.
- The Hovey category is EllipticCohomology E4.A (main, line 1032).
- The Tau Ceti contract (lines 110–133) does not list the modules `Rigidity` or `CoordinateChange.HopfAlgebroid`, which F5 uses.
- The Mathlib contract (lines 103–109) does not list `WittVector`, `PerfectRing`, `IsAdicComplete`, `IsNoetherianRing` or `Ideal.IsHomogeneous`, which Suggested.lean uses.

**Repair.**
- Replace "G5.5's finite duality" with "G5.1's finite duality" at lines 1276 and 2825. At line 1341, write "G3 and G5.1". At lines 139–140, write "G5.1's finite duality, G5.3–G5.5 and G5.7's Thom models …".
- Spell out the abbreviations:
  - "ELL's" becomes "EllipticCohomology E4.A's";
  - "Elliptic E2" becomes "EllipticCohomology E2";
  - "AT8.8's" becomes "AlgebraicTopology Stage 8.8's";
  - "CC/G5.7's" becomes "GeneralizedCohomology G5.7's (CharacteristicClasses' O(−1) convention)";
  - "G's" becomes "GeneralizedCohomology's", or add "G denotes GeneralizedCohomology" to Conventions.
- Add the missing modules and declarations to the two contracts.

## R07 (P3) — Locators: F6 headlines without theorem numbers; a reversed equivalence; a missing reference

**Location.**
- F6.1 (lines 1346–1393): existence of Bousfield localization, with no locator.
- F6.3 (lines 1999–2008): the thick-subcategory and periodicity theorems, with no locator.
- F6.5 (lines 2448–2451): "Prove the Greenlees–Sadofsky/Kuhn theorem", with no theorem number.
- Lines 288–289: "`TauCeti.LazardRing.lift` is the natural bijection Hom_ring(L,R) ≃ {F : FormalGroup R // F.IsComm}".
- References (lines 2875–2905): no entry for Landweber 1976, which lines 1232 and 1253 cite.

**Witness.**
- In ravenel-orange, Theorem 7.1.3 (line 2876, p. 76) is the Bousfield localization theorem, Theorem 3.4.3 (line 1597, p. 37) the thick subcategory theorem, and Theorem 1.5.4 (line 577, p. 9) the periodicity theorem.
- Clausen–Mathew Theorem 1.1 (clausen-mathew line 21) states F6.5's K(n)-local theorem, crediting Greenlees–Sadofsky and Hovey–Sadofsky. Kuhn's Theorem 1.5 (kuhn-tate line 151) is the T(n)-local form.
- At the pin, `LazardRing/Basic.lean` line 311 reads `def lift : {F : FormalGroup R // F.IsComm} ≃ (LazardRing →+* R)`.

**Repair.**
- Add "(Ravenel, *Nilpotence and Periodicity*, Theorem 7.1.3, p. 76)" to F6.1.
- Add "(Theorem 3.4.3, p. 37; Theorem 1.5.4, p. 9)" to F6.3.
- In F6.5, write "Prove the K(n)-local Tate vanishing theorem (Clausen–Mathew, Theorem 1.1; Greenlees–Sadofsky; Hovey–Sadofsky)", and cite Kuhn's Theorem 1.5 as its T(n)-local strengthening.
- Rewrite the `lift` sentence as "{F : FormalGroup R // F.IsComm} ≃ Hom_ring(L,R)".
- Add a References entry for Landweber, *Homological properties of comodules over MU_*(MU) and BP_*(BP)*, 1976, Theorem 2.6.

## R08 (P3) — F6.5's Tate construction and F6.6's Euler cancellation have no Checks

**Location.** F6.5 (lines 2442–2679) and F6.6 (lines 2681–2827): neither has a **Checks.** list.

**Witness.** A wrong reading of the F6.5 theorem as "E^(tG)≃0" is consistent with everything in the section. It is excluded only by a computed example such as KU_p below.

**Repair.** Add the following Checks.

F6.5:
- KU_p is K(1)-local. With trivial C_p action:
  - π₀(KU_p^(tC_p))=ℤ_p[[x]]/((1+x)^p−1)[x⁻¹]=ℤ_p[ζ_p][(ζ_p−1)⁻¹]=ℚ_p(ζ_p)≠0;
  - this group is rational, so the Tate spectrum is K(1)-acyclic but not zero, and the theorem asserts acyclicity, not vanishing.
- The K(n)-local hypothesis cannot be dropped: HF_p^(tC_p) has π_* equal to 𝔽_p in every degree, and HF_p is not K(n)-local.
- n=0: for rational E, the composite E_hG→E→E^hG inverts the norm up to |G|, so E^(tG)=0.

F6.6:
- T=S¹, C=D=pt, ν of weight d≠0: eν=[d]_F(x)=dx+⋯ is a nonzerodivisor in MU^*[[x]], because MU_* is a domain.
- Weight 0 gives eν=0, which is not injective. This is why zero weights are excluded.
- r=0 gives eν the identity.

## R09 (P3) — The docstring's not-statable list omits Quillen's unoriented theorem

**Location.** Suggested.lean lines 36–37: "Quillen's theorem `L ≅ MU_*` and Thom's computation of `π_*MO`".

**Witness.** The Summary (README lines 10–11) lists "Quillen's theorems that the real and complex orientations carry the universal exponent-two and commutative formal laws". Lines 692–698 target MO_*≅`TauCeti.ExponentTwoLazardRing` (quillen-fgl-bulletin line 110, Theorem 3).

**Repair.** Extend the docstring entry to read: "Quillen's theorems `L ≅ MU_*` and `MO_* ≅` the exponent-two Lazard ring `TauCeti.ExponentTwoLazardRing`, and Thom's computation of `π_*MO` (no spectra, no `MU`, `MO` …)".

## R10 (P3) — #1854 rewrites this README with no stated order

Partly repaired from the previous review's R10.

**Location.** The pull-request description's merge-order paragraph: "#1101 (ModularCurves) → #1807 (the other loops) → **this pull request**".

**Witness.** `scratch/overlaps.md` reports "#1808 and #1854 conflict in … `TauCetiRoadmap/BordismFormalGroups/README.md`, `…/Suggested.lean`". #1854's README has 3458 lines, with layers subdivided as F1.1 onward, against 2905 lines here. Its F6.3 strong-type Checks now agree with this head.

**Repair.** Name #1854 in the merge-order paragraph and say which of the two is rebased on the other. Before either merges, carry this head's Lubin–Tate and Landweber statements, and the R03–R09 repairs, into the surviving text.

## Verified sound

**Build and Lean form.**
- `lake env lean TauCetiRoadmap/BordismFormalGroups/Suggested.lean` gives three `declaration uses 'sorry'` warnings, at lines 76, 90 and 107, and nothing else.
- Only `import Mathlib` and five existing `TauCeti.*` modules are imported.
- There is no `set_option`, `lemma`, sorry'd data, `#eval` or process wording.

**Elaborated signatures.** Each of the three theorems matches its README statement:
- `nonempty_formalGroupIso_iff_height_eq`: `{k} [Field k] [IsSepClosed k] (p) [Fact p.Prime] [CharP k p] (F G) [F.IsComm] [G.IsComm]`, as at README lines 434–439;
- `isPrime_and_invariant_iff_eq_heightIdeal`: the homogeneity binder `hI` is kept, as at lines 1156–1167;
- `exists_lubinTate_universalLift`: `A : Type u` with `IsLocalRing`, `IsNoetherianRing` and `IsAdicComplete (maximalIdeal A) A`, as at lines 1279–1291.

No section binder is lost. The `on` entry in `scratch/signatures.md` is a parsing artifact: docstring line 34 begins with the prose "theorem on".

**One-tactic probe.**
- On a scratch copy, `simp` made no progress and `exact?` failed on the F1 and Landweber statements.
- Lubin–Tate is an existence theorem with no library counterpart: the pin has only its uniqueness half, `FormalGroupIso.eq_of_map_residue_eq` in `Rigidity.lean` line 229.

None of the three theorems is padding.

**Pinned declarations: 219 backticked README names checked.**
- 162 resolve in Tau Ceti, 10 in Mathlib, and 44 are module paths that exist.
- The remaining 3 are this roadmap's own theorems, each declared in Suggested.lean.

Statements opened at the pin:
- `heightIdeal` (`Height/Ideal.lean` line 74, the span of the coefficients below degree pⁿ, so I_(p,0)=⊥);
- `map_rightUnit_heightIdeal` (`CoordinateChange/HopfAlgebroid.lean` line 390);
- `rightUnit : LazardRing →+* MvPolynomial ℕ+ LazardRing` (`CoordinateChange/Lazard.lean` line 130);
- `existsUnique_eq_smul_lazardCocycle` (n≥2, any ring; `Classification.lean` line 420);
- `lazardGcd_prime_pow` and `lazardGcd_eq_one_of_not_isPrimePow` (`SymmetricCocycle/Basic.lean`, lines 206 and 197);
- `universalStrictCoordinate` (`PowerSeries/Coordinate/Universal.lean` line 58);
- `invariantDifferential` (line 178), `coeff_log` (line 338), `subst_toPowerSeries_eq_add_iff` (ℚ-algebra; line 404) and `eq_logIso` (line 601), all in `Logarithm/Basic.lean`;
- `log_smul` (line 149) and `coeffOneEquiv` (line 117), in `Logarithm/Naturality.lean`;
- `existsUnique_logarithm_of_nsmulSeries_eq_zero` (`InfiniteHeight.lean` line 249) and `height_eq_top_iff_nonempty_formalGroupIso_𝔾ₐ` (same file, line 278);
- `ExponentTwoLazardRing.lift`, from {F // IsComm ∧ [2]_F=0} to ring homomorphisms (`Universal.lean` line 215);
- `subst_X_add_X_eq_add_iff_of_natCast_eq_zero` (`AdditiveSeries.lean` line 127);
- `height_eq_natCast_iff` (`Height/Basic.lean` line 211);
- `existsUnique_iso_comp_iterateFrobeniusHom_eq_nsmulHom_of_height_eq` (`Frobenius/Factorization.lean` line 180);
- `succ_le_order_sub_of_lt_height` (`LeadingDifference.lean` line 112);
- `homogeneousComponent_homDefect_eq_smul_lazardCocycle` (`Obstruction.lean` line 400);
- `mvPolynomialEquiv` (`LazardRing/Polynomial.lean` line 112);
- `generator`, `generator_mem_grading` and `cotangentBasis` (`LazardRing/Indecomposable.lean`, lines 190, 195 and 398);
- `algebraicIndependent_generator` (`LazardRing/Independence.lean` line 264).

**Sampled sources read at the text: 61 locators in the sample, plus 6 read for R07's repairs.**

ravenel-green:
- A2.1.6 (line 19937) and A2.1.9 (line 19984);
- A2.1.18 (line 20167), (A2.1.24) and A2.1.25 (line 20299);
- A2.2.6, A2.2.7 (line 20711), A2.2.12 (line 20790, separably closed) and (A2.2.13);
- 3.1.1 (line 3673; the coproduct matches line 575);
- 3.1.3, 3.1.4, 3.1.5(i)–(ii) (h(x_i)=−pb_i for i=p^k−1), 3.1.6, 3.1.7 (generators u_i with i≠p^k−1), 3.1.8 (E=A_*⊗_(P_*)ℤ/(p)) and 3.1.10;
- A1.1.18 (line 18098) and A1.3.13 (line 18732);
- Definition 2.2.1, Theorems 2.1.1(ii), 2.2.3 (p. 50), 2.3.3 and 2.2.13 (p. 52);
- 4.1.4 (p. 107), 4.1.11 (p. 110), 4.1.12 (pp. 110–111), 4.1.19 (p. 113) and A2.2.3 (p. 364);
- 1.3.16 (p. 17), 4.3.2 (pp. 120–121) and 6.2.10(ii) (p. 204).

ravenel-orange:
- §6.2, p. 63 (the primitives are τ₀ and ξ₁^(p^i), line 2468);
- Definition 6.2.3, p. 64; 6.2.5; p. 65;
- Theorem 7.5.6, p. 87.

hatcher-at:
- 4L.12, 4L.13 and 4L.16;
- the unnumbered theorem on p. 500 (line 21565).

miller-cobordism:
- Chapter 1: Proposition 10.4, Lemma 11.1, Theorem 11.2, Theorem 12.1, Corollary 12.2, Theorems 12.3–12.4, and §13 ("we will omit the proof", line 1376);
- Chapter 2: Theorem 3.5, Proposition 8.3, and Theorem 13.3 on p. 100.

Other sources:
- guillou-weibel: Definition 6.1, Theorem 6.2, Proposition 6.4 and Theorem 6.5 (Kudo's signs match lines 549–551);
- lubin-tate-1966: Proposition 1.1, Theorem 3.1 (complete noetherian local, unique tuple in m^(h−1) and unique ⋆-isomorphism) and §1, p. 50;
- quillen-fgl-bulletin: Theorems 2 and 3.

All six sampled targets are sound apart from the findings above:
- "Lazard ring, cocycle lemma and Hopf algebroid": sound, except the direction of `lift` (R07).
- "Invariant differential, logarithm and exponential": sound.
- "Exponent two": sound.
- "Height and Lazard's classification": sound.
- "Steenrod algebras and mod-p Adams towers": sound, except R04.
- "Unoriented coefficients": sound. The new derivation of the ring structure is correct (row 22).

**Cross-roadmap citations resolved: 31.**

GeneralizedCohomology, at this head:
- G2.4 (strict rings and modules), G2.6, G2.7 (HA), G2.9 (bar model);
- the five G2.11 sub-lanes;
- G3.3, G3.8 (homotopy Milnor sequence, line 1634), G3.9;
- G4, G4.3, G5.3, G5.4 (MU, MO, Bott), G5.5 (MU→Hℤ only), G5.7.

AlgebraicTopology, at this head:
- Stage 5.5 (line 1268), Stage 8.7 (line 2411), Stage 8.8 (line 2433) and Stage 8.10 (line 2698).

Other roadmaps:
- CharacteristicClasses C3 (line 1854);
- TopologicalKTheory Conventions (β=[L]−1, L=O(−1));
- ProfiniteCohomology;
- SchurWeyl Layers 0, 2 and 5, and CompactGroups Layer 1;
- DGAInfinity Layer 8 (line 520);
- EllipticCohomology E2 and E4.A.

The overlap tool finds no id that this pull request drops and another roadmap cites. I spot-checked the roadmaps on main that cite this one: EnhancedDerivedSheaves (via the R11 mapping), PositiveScalarCurvature (F4) and SchurWeyl.

**Ownership against open pull requests.** The overlap tool's closest open roadmaps are ChromaticHomotopyTheory, GeneralAlgebraicKTheoryPartII, StableHomotopyKTheoryPartII and GeneralizedCohomology (the last via #1807 and #1854). I read the first three at their heads, together with StringOrientation and TangentialBordism. All of them cite this roadmap as a supplier, except TangentialBordism (R01).

HomotopySpheres (#1287) also constructs the James map and the James–Hopf maps (its Layer 3B). This roadmap owned them on main, and HomotopySpheres is on the never-cite list, so resolving that duplication falls to #1287 and is not a finding here.

### Adversarial pass

| Statement | Instances tried | Values computed (each side) | Result | Change |
|---|---|---|---|---|
| 1. `nonempty_formalGroupIso_iff_height_eq` | 𝔾ₐ vs 𝔾ₘ over 𝔽̄_p | heights ⊤ vs 1; `FormalGroupIso.height_eq` excludes an iso | false ↔ false | none |
| 2. same | F=G | identity series X; heights equal | true ↔ true | none |
| 3. same | over 𝔽_p: 𝔾̂ₘ vs its twist with Frob=[up], u≠1 | heights 1=1; an iso intertwines Frobenius, which forces u=1 | false ↔ true, so separable closure is needed (README Check) | none |
| 4. same, Ravenel route | (A2.2.13) over sep. closed, non-perfect k | t₀^(p^h−1)=θ(v_h) and t_i^(p^h)−θ(v_h)^(p^i)t_i=c; derivatives nonzero | separable, roots exist | none |
| 5. Landweber (Lean) | I=⊥ | L a domain; ⊥.map=⊥; heightIdeal p 0 = span{coeff 0 [p]_F} = ⊥ (definition, `Height/Ideal.lean` line 75) | true ↔ true | none |
| 6. same | I=(2) | `heightIdeal_one`: I_(2,1)=(2); L/2 polynomial; η_R(2)=2 | true ↔ true | none |
| 7. same | (2,a₁₁−1) | φ=x+b₁x² gives xy-coefficient a₁₁+2b₁; invariant and prime (𝔽₂[x₂,…]) but not homogeneous | excluded by `hI`; without it LHS true, RHS false | none |
| 8. same | (a₁₁), (3,a₁₁) | η_R(a₁₁)−a₁₁=2b₁ lies in neither extension; [3]_F=3X+3a₁₁X²+⋯ and v₁ has degree 4 ≠ 2 | false ↔ false | none |
| 9. same | I=⊤ | not prime; I_(p,∞) ⊆ ker(L→𝔽_p classifying 𝔾ₐ) | false ↔ false | none |
| 10. `exists_lubinTate_universalLift` | h=1 | Fin 0, MvPowerSeries ≅ W(k), ψ unique; source: m⁰ is one point | holds | none |
| 11. same | A=k, π=id | ψ(X_i) ∈ 𝔪=0 forces ψ; the only ⋆-iso Φ→Φ is X | unique ψ, unique e | none |
| 12. same | ⋆ needed | [−1]_G reduces to [−1]_Φ: coefficient −1≠1 at odd p; at p=2, [−1]=X iff [2]=0, false at finite height | two isos, one ⋆ | none |
| 13. same | arbitrary ψ vs continuous | ψ(p)=p·1 ∈ 𝔪 since π(p)=0, so ψ(𝔫ⁿ)⊆𝔪ⁿ, and ψ is fixed by the X_i on a dense subring (A Hausdorff) | matches "unique tuple in m^(h−1)" | none |
| 14. Milnor odd p, surjectivity | (ε₀,s₁,…) ↦ e_i=ε_i, r_j=s_j−ps_(j+1)−ε_j | both degrees equal Σε_i+2(p−1)Σs_j (telescoped); τ₁ ↔ P¹β, degree 2p−1 | bijection | none |
| 15. Milnor odd p, injectivity | lowest kernel element | (f⊗f)Δ̄x=0 with f injective in lower degrees, so x is primitive; ⟨τ₀,β⟩=1 and ⟨ξ₁^(p^k),P^(p^k)⟩=1 | injective | none |
| 16. coaction ⇒ coproduct | p=2 | (λ⊗1)λx=Σx^(2^(i+j))⊗ξ_j^(2^i)⊗ξ_i, giving Δξ_n=Σξ_j^(2^i)⊗ξ_i | = Ravenel 3.1.1 | none |
| 17. Milnor primitive degrees | p=2, p=3 | 2p^i(p−1)+2p^i−1=2p^(i+1)−1; \|Q₁\|=3 at p=2 and 5 at p=3 (=\|τ₁\|) | holds | none |
| 18. Serre–Cartan | odd p, n=1 | βι: Hatcher excess 0<1, usual excess 1=n | false with the usual excess | R04 |
| 19. Kudo | y of degree 2k | y^(p−1)⊗τy at (2k+1, 2k(p−1)); r=2k(p−1)+1; target degree 2kp+2=\|βP^kτy\| | = GW 6.5(3) | none |
| 20. MU Hurewicz Check | i=1…6 | 2b₁, 3b₂, 2b₃, 5b₄, b₅, 7b₆ (i+1=2,3,4,5,6,7) | = 3.1.5(ii) | none |
| 21. C-generators | p=2 | u_i for i=2,4,5,6,8 (i+1≠2^k) = degrees of MO-type generators | = 3.1.7 | none |
| 22. MO ring derivation | degree 5 | H=7 (partitions), A_*=2 (ξ₁⁵, ξ₁²ξ₂), P=1 (x₅); Σ dim A_i·dim P_(5−i) = 1+2+0+2+0+2 = 7 | splitting consistent; P≅H/(s(ξ_k)) polynomial | none |
| 23. Moore ℤ/2^∞ | π₀, π₁, π₂ | ℤ/2^∞, 0 (ℤ/2⊗ℤ/2^∞), ℤ/2 (Tor); derived π₀=Ext(ℤ/2^∞,ℤ/2^∞)=0, π₁=ℤ₂ | holds | none |
| 24. cocycle d_n | n=2,4,6,9 | d=2, 2, 1, 3 (`lazardGcd_prime_pow`, `…_not_isPrimePow`) | holds | none |
| 25. invariant differential | 𝔾ₘ; wrong model 1+T | P(F)F_X=(1+Y)/((1+X)(1+Y))=P(X); (1+X)(1+Y)²≠1+X | holds | none |
| 26. log coefficient | 𝔾ₘ | `coeff_log` n⁻¹·coeff_(n−1)P = (−1)^(n−1)/n | holds | none |
| 27. exponent-two ring | generators | i+1≠2^k: 2, 4, 5, 6, 8, 9 = MO_* degrees; linear coefficient of [2]_F is 2, so [2]=0 forces 2=0 | holds | none |
| 28. strong type | S/2, S/4, S/p | S/2: only (0,1), Sq¹ iso, Q₁=0, dim 2 = rank; S/4: Sq¹=0; S/p: P¹ of degree 2p−2 is 0 | Checks correct | none |
| 29. F1 Example | [2]_F | X³-coefficient a₁₂+a₂₁=2a₁₂, so I_(2,2)=(2,a₁₁) | holds | none |
| 30. K-theory law | x_K=u⁻¹([L⁻¹]−1) | ab−1=(a−1)+(b−1)+(a−1)(b−1), so x+y+uxy; on CP¹, u⁻¹β=1 | holds | none |
| 31. F6.5 (Check proposed) | KU_p with trivial C_p action | ℤ_p[[x]]/((1+x)^p−1)[x⁻¹]=ℚ_p(ζ_p)≠0, rational | K(1)-acyclic, nonzero | R08 |
| 32. F6.6 (Check proposed) | T=S¹, weight d vs 0 | [d]_F(x)=dx+⋯ is a nonzerodivisor; [0]_F=0 | injective iff d≠0 | R08 |
| 33. Euler identity | eν=Π−n, n^q=0 | (Π−n)Σ_(i=1)^q Π^(q−i)n^(i−1)=Π^q−n^q=Π^q | holds | none |
| 34. F3/F4 order | *Needs:* vs Dependencies | line 928 cites F4; lines 938–940 omit it; line 1124 has F4 needing F3 | coarse cycle | R05 |
| 35. finite duality item | G5.1 vs G5.5 | G5.1 at line 2341 is duality; G5.5 at line 2516 is the orientation table | wrong item | R06 |

## Not verifiable

These sources are recorded as uncertified, so they are cited by their locators only; I read none of them:
- bousfield-1979 (Theorem 6.6), thom-1954 (Chapitre IV), toda-1962 (Chapter I), james-1955 (§§1–6);
- landweber-1976 (Theorem 2.6), dhs-nilpotence-i (§§1–3), hopkins-smith-nilpotence-ii, hovey-strickland-memoir (Proposition 7.10(e));
- greenlees-sadofsky, johnson-wilson-1975 (Proposition 4.14), wurgler-1976 (Theorem 2.16, Remark 6.19), symonds-permutation;
- quillen-elementary, adams-blue-book, wilson-omega-spectrum-ii, landweber-ravenel-stong.

These certified sources fall outside the seeded sample, and I did not check them at their locators: nikolaus-scholze, lurie-htt, lurie-ha, cdvn-toda, bauer-tmf and hovey-mstring.

## Source issues

- **Misprint** in ravenel-green at Corollary 3.1.10, p. 64: the source says a_i is represented by [ξ_i] when p=2; it should be [ξ_(i+1)], whose degree 2^(i+1)−1 matches the bidegree (1,2p^i−1); affects nothing.
- **Error** in ravenel-green at Theorem 1.3.16(iv), p. 17: the source lists the invariant primes of L as I_n for 0<n≤∞ only; it should also list I₀=(0), which is invariant and prime because L is a domain; affects a stated result.
- **Gap** in ravenel-green at Theorem 4.3.2(iv), p. 121: the statement covers all invariant primes, but the proof takes a lowest-degree element; it should restrict to homogeneous ideals, since (p,v₁−1) is an invariant prime; affects a stated result.
