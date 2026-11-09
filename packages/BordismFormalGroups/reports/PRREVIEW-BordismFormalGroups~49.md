# Review of BordismFormalGroups (pull request #1854 at b9f2c11)

**Verdict:** needs changes

## R01 (P1) — The two strong-type Checks contradict the README's own definition

**Location.** `TauCetiRoadmap/BordismFormalGroups/README.md` lines 1587–1595: "at odd p, S/p has strong type 1 … at p=2, S/2 has type 1 but not strong type 1: P₁¹=Sq² acts as zero … which the condition at (s,t)=(1,1) forbids".

**Claim.** The definition at lines 1560–1573 uses P_t^s only for 0≤s<t; at p=2 it requires vanishing for s+t≤n+1 except (0,n+1), at odd p for s+t≤n. Under it both Checks are false, in opposite directions, so an implementation that passes them must use a different definition.

**Witness.** p=2, n=1: only (0,1) is admissible; Sq¹:H⁰≅H¹, Q₁H=0, dim H=2=rank K(1)^*, so S/2 is strongly type 1. Odd p: P¹ acts as zero, H(H;P¹)=H⊕H≠0, so S/p is not (`ravenel-orange` lines 2471–2472, 2509–2515).

**Repair.** Replace the two bullets by:
- "at p=2, S/2 has strong type 1: for n=1 the only index with 0≤s<t, s+t≤2 and (s,t)≠(0,2) is (0,1). Sq¹ is an isomorphism H⁰→H¹, so its Margolis homology vanishes. Q₁=P₂⁰ acts as zero for degree reasons, and dim H=2=rank K(1)^*(S/2). Sq² is not a P_t^s: it would need s=t=1, and (Sq²)²=Sq³Sq¹≠0. Ravenel's Theorem 6.2.4 then gives a v₁ self-map, consistent with the Adams map of degree 8."
- "at odd p, S/p has type 1 but not strong type 1: (s,t)=(0,1) is in range, and P¹=P₁⁰, of degree 2p−2≥4, acts as zero on H^*(S/p;𝔽_p), so its Margolis homology is H⊕H≠0 (Ravenel, *Nilpotence and Periodicity*, Definition 6.2.3, p. 64). The Adams map of degree 2p−2 exists anyway, so strong type is sufficient for a v₁ self-map but not necessary."

Then change "the Smith construction below is needed to produce strong-type seeds at p=2" so that it says the construction is needed at odd p for n=1 and at every prime for n≥2. Tested: S/2 passes every clause of the corrected definition, and S/p fails exactly at (0,1). The head of #1808 already corrects the odd-p bullet (its lines 1588–1596) but keeps the false p=2 bullet (its lines 1597–1603); see R05.

## R02 (P2) — The Lubin–Tate universal deformation theorem is statable at the pins, but the file says it is not

**Location.** `TauCetiRoadmap/BordismFormalGroups/Suggested.lean` lines 24–26: "Not statable at the pins … the Lubin–Tate universal deformation theorem (no deformations of formal groups over complete local rings and no universal deformation ring)". In README F5 (lines 1033–1041) the same headline has no locator.

**Claim.** Every carrier this headline needs exists at the pins: Mathlib `WittVector`, `MvPowerSeries`, `IsLocalRing`, `IsAdicComplete`, `IsLocalHom`, `FormalGroup.map`, `PerfectRing`, and Tau Ceti `TauCeti.FormalGroupIso` and `FormalGroup.height`. No new definition is needed. Tau Ceti's `TauCeti/RingTheory/FormalGroup/Rigidity.lean` (line 229) already proves that ⋆-isomorphisms of deformations are unique. Downstream, LubinTateFormalModulesAndQuasiCanonicalLifts (board package, README line 58) consumes this theorem from F5.

**Witness.** The statement below elaborates under `lake env lean` with this file's own imports and gives only the `sorry` warning. The residue-field-k special case elaborates as well.

**Repair.** Add the following under `/-! ## F5: exact functors and deformations -/`, with this docstring:

```lean
/-- F5 (Lubin–Tate): a commutative formal group `F₀` of finite height `h` over a perfect field
`k` of characteristic `p` has a deformation `Γ` over `W(k)[[u₁,…,u_{h−1}]]` such that every
deformation `G` of `F₀` over a complete local Noetherian `W(k)`-algebra `A`, with residue field
an extension `K` of `k`, is ⋆-isomorphic to `Γ.map φ` for exactly one local `W(k)`-algebra map `φ`
(Lubin–Tate 1966, Theorem 3.1, p. 36). -/
theorem exists_universal_deformation {p : ℕ} [Fact p.Prime] {k : Type u} [Field k] [CharP k p]
    [PerfectRing k p] (F₀ : FormalGroup k) [F₀.IsComm] {h : ℕ} (hh : F₀.height p = h) :
    ∃ Γ : FormalGroup (MvPowerSeries (Fin (h - 1)) (WittVector p k)), Γ.IsComm ∧
      Γ.map (WittVector.constantCoeff.comp MvPowerSeries.constantCoeff) = F₀ ∧
      ∀ (A K : Type u) [CommRing A] [IsLocalRing A] [IsNoetherianRing A]
        [IsAdicComplete (IsLocalRing.maximalIdeal A) A] [Algebra (WittVector p k) A] [Field K]
        (ι : k →+* K) (π : A →+* K) (_ : Function.Surjective π)
        (_ : RingHom.ker π = IsLocalRing.maximalIdeal A)
        (_ : π.comp (algebraMap (WittVector p k) A) = ι.comp WittVector.constantCoeff)
        (G : FormalGroup A) (_ : G.IsComm) (_ : G.map π = F₀.map ι),
        ∃! φ : MvPowerSeries (Fin (h - 1)) (WittVector p k) →ₐ[WittVector p k] A,
          IsLocalHom φ ∧ ∃ e : TauCeti.FormalGroupIso (Γ.map φ.toRingHom) G,
            PowerSeries.map π e.toHom.toPowerSeries = PowerSeries.X := by
  sorry
```

(This needs `universe u`.) Name the theorem in README F5 with the same locator, and remove Lubin–Tate from the docstring's list of results that are not statable. In the same docstring, "no spectra" is inaccurate: Tau Ceti has `TauCeti.AlgebraicTopology.Spectra.SymmetricSpectrum` (`Spectra/SymmetricSpectrum.lean` line 92). What is missing is stable homotopy groups and the spectra `MU`, `MO` and `HF_p`; say that instead. Tested at h=1, k=𝔽_p, F₀=𝔾ₘ: the ring is ℤ_p[[∅]]=ℤ_p, and the unique φ is the structure map.

## R03 (P2) — Objects owned both here and by open roadmaps, each saying the other consumes them

**Location.**
- This head's F2 owns the mod-p Steenrod algebras, the transgression with Kudo's and Borel's theorems, the computation of H^*(K(ℤ/p,n)), the HF_p-based Adams towers, and the Adams computations for MU and MO (README lines 488–569, 571–604 and 629–664). Line 569 says: "TangentialBordism consumes these operations, algebras and towers".
- F4 line 786 says "Own the three-fold Toda brackets of pointed spaces". F6.2 line 1170 says "Own the James construction".

**Claim.** Two open heads claim the same objects:
- TangentialBordism (#942) README lines 54–55 say "Owned here: the mod p Steenrod algebras and Adams towers (B4.1–2, B4.7), which BordismFormalGroups consumes". Its §4.2 (line 1131) constructs them, and line 3093 says this roadmap consumes "B4's MO coefficients".
- HomotopySpheres (#1287) owns the James construction (3B, line 991) and the Toda brackets (3C.3, line 1203). Its lines 3187–3188 say that BordismFormalGroups consumes both.

**Witness.** On main, this README consumed TangentialBordism's mod-p Steenrod/Adams carriers (main README lines 1006, 2773) and HomotopySpheres 3B and 3C (main lines 331, 2768). This head constructs those objects itself, while both other heads still construct them too.

**Repair.** Keep one owner, and make it this roadmap: it is on main, HomotopySpheres may not be cited as a supplier, and TangentialBordism consumes F1–F2, so citing it back would be a cycle. In `## Downstream consumers`, name the consuming items: "TangentialBordism B4.1–B4.2, B4.7 and B4.8 consume F2's Steenrod algebras, Adams towers and MU/MO Adams computations. HomotopySpheres 3B and 3C.3 consume F6.2's James construction and F4's three-fold Toda brackets." State this ownership move in the pull-request description, naming #942 and #1287 as the heads that must cite F2, F4 and F6.2 instead of constructing these objects. After that, each object has one constructor.

## R04 (P3) — Push gate fails: two files outside this pull request's folders

**Location.** The gate at b9f2c11 reports `outside-folder=2`: `Completed/ArithmeticDirichletSeries/README.md` (line 331) and `TauCetiRoadmap/SymplecticGeometry/README.md` (lines 76–78).

**Claim.** Both are one-sentence rewordings of the direction of supply. The description explains them, but neither folder is listed among this pull request's roadmap folders, and no acceptance is possible while the gate fails.

**Witness.** `git diff origin/main...HEAD` touches those two files. The gate line ends `outside-folder=2 … FAIL`.

**Repair.** Either move the two sentences into a separate pull request, or have both folders recognised as this pull request's own (the description already motivates both edits). Then re-run the gate.

## R05 (P3) — The head of #1808 conflicts with this one in this README, and no order is stated

**Location.** In the pull-request description, the merge-order paragraph says "#1808 is independent of this pull request".

**Claim.** The overlap tool reports that the heads of #1808 and #1854 conflict in `TauCetiRoadmap/BordismFormalGroups/README.md`. The only differing hunk is the strong-type Checks: lines 1588–1606 at #1808 against lines 1588–1595 here.

**Witness.** Diffing this README at #1808 against this head gives 28 changed lines, all in that hunk. #1808 corrects the odd-p bullet, and this head does not.

**Repair.** State in the merge-order paragraph which of #1808 and #1854 is rebased on the other. Then carry a single version of the bullets, the R01 version, in both pull requests.

## R06 (P3) — README shape, per-target dependencies, Checks and locators

**Location.** The whole README. The title is `# Bordism, formal groups and chromatic operations`, layers are headed `## F1.` … `### F6.7.`, and line 442 holds the only `*Needs:*` line in 2558 lines.

**Claim.**
- There is no `# Roadmap:` title and no `**Summary.**`.
- No layer ends with `### Examples` and `### Dependencies`.
- Except for the F1 headline, no target has a `*Needs:*` line.
- In F1, F2, F4 and F6.2 the Checks are inline prose rather than bullet lists.
- About twenty definitions have no Checks at all: the formal law F_E, the graded Eilenberg–MacLane spectrum HR, the Landweber–Novikov operations, BP, BP⟨n⟩, E(n), K(n), comodules, the Adams–Novikov spectral sequence, Landweber exactness, the Lubin–Tate ring, X(r), Tel(α;R), P(n), B(n), T(n), L_n^f, Γ_k^fS, 𝕊_m, the fracture square, the Tate construction and the F6.6 Euler comparison.
- Several theorems have no locator. Examples: the invariant-prime classification at line 946 (Ravenel, Theorem 4.3.2(iv), p. 121); the Bousfield-class identities at lines 1377–1412 (Ravenel, *Nilpotence and Periodicity*, Theorem 7.3.2, p. 82); the Lubin–Tate theorem (see R02); the three DHS nilpotence statements at lines 1095–1107; and Hopkins–Smith's thick-subcategory and periodicity theorems at lines 1672–1681.

**Witness.** `grep -c '### Examples'` gives 0 and `grep -c '\*Needs:\*'` gives 1. `ravenel-orange` line 3120 states Theorem 7.3.2(a)–(d), which are exactly the identities at lines 1377–1412.

**Repair.**
- Retitle the README `# Roadmap: bordism, formal groups and chromatic operations` and open with a `**Summary.**` paragraph.
- Head the layers `## Layer F1: …` and so on, keeping the F-ids that other roadmaps cite.
- End each layer with `### Examples` and `### Dependencies`.
- Give each target its own `*Needs:*` line.
- Turn the inline Checks into `**Checks.**` bullet lists, with at least three per definition listed above.
- Add the locators named above. For DHS, Hopkins–Smith and Greenlees–Sadofsky the locators are uncertified, so cite them by theorem number.

## R07 (P3) — Locator slips in the seeded sample

**Location.**
- (a) Lines 577–580 and 640–644: "≅P_*⊗C as comodule algebras … (Ravenel, Corollary A1.1.18)".
- (b) The references at line 2532: "Definitions A2.1.24–A2.1.25".
- (c) Lines 271–275: `mvPolynomialEquiv` is attributed to "(module `Indecomposable`, …)".

**Claim.**
- (a) Corollary A1.1.18 gives the splitting only as a left C-module and right Σ-comodule, not as comodule algebras.
- (b) A2.1.24 is a displayed equation and A2.1.25 is a theorem.
- (c) The equivalence is declared in `LazardRing.Polynomial`.

**Witness.** `ravenel-green` lines 18101–18103 (A1.1.18), line 3770 (Lemma 3.1.7: "as a left A_*-comodule"), line 20294 (equation A2.1.24) and line 20299 (Theorem A2.1.25). Tau Ceti `LazardRing/Polynomial.lean` line 112.

**Repair.**
- (a) Write "as left C-modules and A_*-comodules (Ravenel, Corollary A1.1.18; Lemma 3.1.7 for MU)". Keep "algebras" only with a source that proves the multiplicative form.
- (b) Write "equation (A2.1.24) and Theorem A2.1.25".
- (c) Write "(module `LazardRing.Polynomial`; generators and `cotangentBasis` in `LazardRing.Indecomposable`)".

## R08 (P3) — Roadmaps cited by abbreviations

**Location.** "G's" (11 places, for example lines 144, 188, 780, 934, 1026, 1449, 2343); "ELL's" (line 912); "Elliptic E2" (lines 2078, 2299, 2338); "AT8.8's" (line 1577); "CC/G5.7's" (line 2395); "String supplies" (line 764).

**Claim.** Cross-roadmap citations must name the roadmap and its section. "String supplies" in F3 also reads as a supplier citation of StringOrientation, which consumes F3–F5.

**Witness.** The `grep -o -w` count above. The Scope section (lines 47–48) says StringOrientation consumes F3–F5.

**Repair.** Write GeneralizedCohomology G…, EllipticCohomology E2, AlgebraicTopology Stage 8.8a, and CharacteristicClasses Conventions (standard character line) and GeneralizedCohomology G5.7. Write "StringOrientation consumes this splitting for its BO⟨4k⟩ space splitting".

## R09 (P3) — The pinned Young symmetrizer and its hook identity are re-planned

**Location.** Lines 1435–1442: "Consume SchurWeyl Layers0,2,5's … Form the same row-symmetrizer times column-antisymmetrizer finite sum over ℤ, prove its quasi-idempotent equation by the injective rational comparison". The supplier contract at lines 129–133 cites the roadmap.

**Claim.** The symmetrizer over any commutative ring and its quasi-idempotence with the hook-product scalar are already declarations at the pin. SchurWeyl Layer 5 itself consumes them from Tau Ceti (main SchurWeyl README lines 524–534).

**Witness.** `TauCeti.YoungTableau.youngSymmetrizer` (`RepresentationTheory/Symmetric/Symmetrizer.lean` line 103, `{R} [CommRing R]`). `youngSymmetrizer_sq_eq_prod_hookLength` (`Specht/Ideal/Dimension.lean` line 105).

**Repair.** Under "From Tau Ceti", cite these two declarations and `isIdempotentElem_prod_hookLength_inv_smul_youngSymmetrizer`. Keep as targets only the transport to ℤ_(p) through the injective map into ℚ, and the staircase hook product being prime to p.

## Verified sound

**Gate and build.**
- The worker's gate at b9f2c11 passes every rule except `outside-folder=2` (R04). Every other count is 0, including `build=0`, `sorry-data=0`, `readme-ids-missing=0` and `depcheck=0`.
- My own direct gate run, which does not know this pull request's folders, reports 35 out-of-folder files; all but the two in R04 lie in folders the brief names as this pull request's own.
- The dependency check (`--movable` against main) printed `depcheck: 239 roadmaps, 2337 edges, 0 problem(s)`, with no UPWARD, CYCLE or moved line.
- `lake env lean …/Suggested.lean` gives only `56:8: warning: declaration uses sorry`.
- `#check @TauCetiRoadmap.BordismFormalGroups.nonempty_formalGroupIso_iff_height_eq` elaborates to `{k} [Field k] [IsSepClosed k] (p) [Fact p.Prime] [CharP k p] (F G : FormalGroup k) [F.IsComm] [G.IsComm], Nonempty (FormalGroupIso F G) ↔ F.height p = G.height p`. It matches README lines 412–417 binder for binder; no section binder is dropped.
- The worker's `signatures.md` lists two spurious "declarations", `,` and `and`, which are artefacts of its scratch file.
- Padding: there is no Tau Ceti declaration for the separably-closed finite-height case. A grep for `IsSepClosed` and `Nonempty (…FormalGroupIso` over the formal-group tree finds only the infinite-height theorem, so no one-tactic closure exists. It is not padding.
- The Lean form passes: one module docstring, namespace, layer comment, `theorem`, no `set_option`, only the two Tau Ceti modules it uses.

**Library declarations opened at the pins (24).**
- Tau Ceti:
  - Height and Frobenius: `FormalGroup.height` (Height/Basic.lean 200), `height_eq_natCast_iff` (211), `FormalGroupIso.height_eq` (346), `height_eq_top_iff_nonempty_formalGroupIso_𝔾ₐ` (Logarithm/InfiniteHeight.lean 278), `succ_le_order_sub_of_lt_height` (LeadingDifference.lean 112), `existsUnique_iso_comp_iterateFrobeniusHom_eq_nsmulHom_of_height_eq` (Frobenius/Factorization.lean 180).
  - n-series: `natCast_dvd_coeff_nsmulSeries` (NSMul/Basic.lean 310, `k.Coprime n`), `exists_nsmulSeries_eq_of_prime` (327), `natCast_eq_zero_of_nsmulSeries_eq_zero` (298).
  - Lazard ring and cocycles: `existsUnique_eq_smul_lazardCocycle` (SymmetricCocycle/Classification.lean 420, `2 ≤ n`), `LazardRing.lift` (LazardRing/Basic.lean 311), `mvPolynomialEquiv` (Polynomial.lean 112), `generator_mem_grading` (Indecomposable.lean 195, degree 2n), `coordinateChangeLift` (CoordinateChange/Lazard.lean 77).
  - Other formal-group results: `ExponentTwoLazardRing.grading` (ExponentTwo/Universal.lean, aᵢ in degree i), `TauCeti.FormalGroupIso.eq_of_map_residue_eq` (Rigidity.lean 229).
  - Outside the formal-group tree: `youngSymmetrizer` (Symmetrizer.lean 103), `youngSymmetrizer_sq_eq_prod_hookLength` (Dimension.lean 105), `isIdempotentElem_prod_hookLength_inv_smul_youngSymmetrizer` (Dimension.lean 120), `SymmetricSpectrum` (Spectra/SymmetricSpectrum.lean 92).
- Mathlib: `FormalGroup.map` (RingTheory/FormalGroup/Basic.lean 185), `WittVector.constantCoeff` (WittVector/Basic.lean 343), `toCircle_zsmul` (Analysis/SpecialFunctions/Complex/Circle.lean 402), `homeomorphCircle` (435).
- Besides these, all 189 backticked names in F1 resolve, and all 39 Tau Ceti module paths cited in F1 and in the supplier contracts exist.

**Cross-roadmap citations resolved (25).**
- GeneralizedCohomology at this head: G2.4, G2.6, G2.7, G2.9 and G2.11 (G2.11 is defined at this head, at #1807 and at #1808; the description's merge-order paragraph names #1807); G3.3, G3.4/G3.8 (Milnor sequences), G3.9, G4.3, G5.3, G5.4, G5.5 and G5.7.
- AlgebraicTopology at this head: Stages 5.5, 8.8a, 8.8b and 8.10, and the smooth-manifold CW comparison (lines 63–68).
- CharacteristicClasses C3 at this head (`H*(BO(n);F2)=F2[w₁,…,w_n]`).
- TopologicalKTheory Conventions at this head: β=[L]−1 with L=O(−1). From this, x_K(O(1))=u⁻¹β=1, and (1+ux)(1+uy)−1 gives F_K=x+y+uxy.
- On main: ProfiniteCohomology Layers 10–11, SchurWeyl Layers 0, 2 and 5, CompactGroups Layers 1–2, DGAInfinity Layer 8 (matric Massey products), and GeometricTopology "The smoothing-and-triangulation comparison" item 1 (main lines 930, 938).
- Consumers checked at their heads: ChromaticHomotopyTheory #1643 cites F6.1–F6.5, GeneralAlgebraicKTheoryPartII #1742 cites F6.1–F6.4 (its §§4.5, 4.8, 4.17 and 4.24 are telescopic variants, not second owners), and the LubinTateFormalModules package cites F1/F5. All are consistent with this head.
- Ownership against open pull requests: checked against the checkouts of #942, #1287, #284, #1663, #1643 and #1742 and the board packages; the conflicts found are in R03.

**Seeded-sample locators read in the sources (all correct except R07 and the R01 Checks).**
- `ravenel-green`:
  - Appendix A2: A2.1.6 (19937, existence of the logarithm over R⊗ℚ), A2.1.9 (19984, uniqueness inside its proof), A2.1.18 (20167), A2.1.25 (20299), A2.2.7 (20711), A2.2.12 (20790–20792: over separably closed K, height n implies isomorphic to F_n), and (A2.2.13) with t₀θ(v_n)=t₀^{p^n} (20806–20817).
  - Chapters 2–4: 3.1.1 (3673), 3.1.3 (3718), 3.1.4 (3741), 3.1.5(ii) (3750–3755), 3.1.10 (3816), 2.1.1 (2627), 2.2.3 (3146), 2.3.3 (3398), A1.3.13 (18732), 4.1.6 (6062), 4.3.2 (6801–6830, pp. 120–121) and 6.2.10(ii) (11048, p. 204).
- `miller-cobordism`: 10.4 (1023), 11.2 (1142), 12.1 (1226), 12.2 (1238), 12.3 (1239), 12.4 (1261), and §13 (1368–1376), which states MO_* and omits its proof.
- `hatcher-at`: 4L.12 (21777), 4L.13 (21864), 4L.16 (22197), the unnumbered Serre–Cartan theorem on printed p. 500 (21565–21567, proof deferred), 4J.1 (20284) and 3C.8 (12578).
- `guillou-weibel`: 6.1 (748), 6.2 (752), 6.4 (767) and 6.5 (784–788, part (3) giving −Q_a(y)).
- `ravenel-orange`: 6.2.3 (2509), 6.3.1 (2628–2632, slope 1/(2pⁿ−2)), 7.3.2 (3120) and 7.5.6 (3284, p. 87).
- `lubin-tate-1966`: Theorem 3.1 (284–289).

**Adversarial table (values computed on each side).**

| Statement | Instances | Values | Result / change |
|---|---|---|---|
| Headline: Lazard classification (Suggested l.56) | 𝔽̄_p, F=𝔾ₐ, G=𝔾ₘ | heights ⊤ vs 1; no iso; both sides false | holds |
| same, without separable closure | 𝔽_p, 𝔾ₘ vs its twist by u≠1 | heights 1=1; Frobenius X^p is [p] vs [pu] in End=ℤ_p, so no 𝔽_p-iso | IsSepClosed needed; README Check correct |
| same, p=2 | 𝔾ₘ over 𝔽̄₂ | [2](x)=2x+x²=x², order 2=2¹, height 1 | holds |
| same, finite height | F_h vs G with θ(v_h)=a≠0 | t₀^{p^h−1}=a and t_i^{p^h}−θ^{p^i}t_i=c are separable, so roots exist in k | holds |
| Cocycle C_n (F1) | n=2, 4, 6; R=ℤ/2 | d₂=2, C₂=XY; binomials 4,6,4 with gcd 2=d₄; 6,15,20,15,6 with gcd 1=d₆; over ℤ/2, r·XY is unique | holds |
| Invariant differential (F1) | 𝔾ₘ | P=(1+T)⁻¹; P(F)F_X=(1+Y)/((1+X)(1+Y))=P(X); coefficient of Tⁿ in log is (−1)^{n−1}/n | holds |
| Exponent two (F1) | 𝔽₂; generators i with i+1≠2^k | i=2,4,5,6 match MO_* degrees 2,4,5,6; [2]_F=0 forces 2=0 | holds |
| Height Checks | 𝔾ₘ, 𝔾ₐ over 𝔽_p | [p]=(1+x)^p−1=x^p gives height 1; px=0 gives ⊤ | holds |
| Steenrod instability (F2) | a∈H¹(RP^∞) | Sq¹a=a², Sq²a=0 | holds |
| Milnor degrees (F2) | p=2, p=3 | p=2: Q₁=[Sq²,Sq¹] in degree 3=2²−1. p=3: \|ξ₁\|=4, \|τ₁\|=5 | holds |
| Adams d₂ bidegree | (1,2) | goes to (3,3); t−s goes from 1 to 0 | holds |
| Derived vs classical completion | M(ℤ/2^∞) | derived completion ΣS^∧₂ with π₁=ℤ₂; classical completion 0 | holds |
| MU Hurewicz (F2) | x₁…x₆ | i+1=2,3,4,5,6,7 gives 2b₁,3b₂,2b₃,5b₄,b₅,7b₆ (`ravenel-green` 3750–3755, unit −1) | holds |
| Quillen's theorem (headline) | degrees 4, 6 | rank L₄=2=rank π₄MU; rank L₆=3=rank π₆MU | holds |
| Thom's theorem (headline) | degrees 5, 6 | degree 5: 7=1·1+1·2+1·0+2·1+2·0+2·1. Degree 6: p(6)=11=3+1+2+0+2+0+3 | holds |
| Conner–Floyd (headline) | X=pt; (S¹,pt) | MO_*; MO_{*−1} | holds |
| Landweber (headline) | E(1)_*; 𝔽_p via augmentation | E(1)_*: p regular, v₁ a unit mod p, M/I₂=0, so exact. 𝔽_p: p acts by 0, so not exact | holds |
| Invariant primes (F5 Checks) | (p,v₁−1), (v₁), (p,v₂) | (p,v₁−1): η_R(v₁−1)=(v₁−1)+pt₁∈IΓ, quotient a domain, so an ungraded invariant prime. (v₁): pt₁∉(v₁)Γ. (p,v₂): η_R(v₂)≡v₂+v₁t₁^p−v₁^pt₁ (`ravenel-green` 6830, n=j=1) | holds |
| Lubin–Tate (headline, R02) | h=1, 𝔽_p, 𝔾ₘ; h=2 | Fin 0 gives ℤ_p and a unique φ; h=2 gives one parameter u₁; scratch statement elaborates | absent from Lean (R02) |
| Bousfield classes (F6.1 Checks) | S/p, Hℚ | S/p is Hℚ-acyclic but not contractible; Hℚ is HF_p-acyclic but not Hℤ-acyclic | holds |
| DHS nilpotence (headline) | η, 2, δ:M(p)→S¹ | η: image 0 in MU₁=0, and η⁴=0. 2: image 2, not nilpotent. δ: MU_*δ=0 but H₁(δ;𝔽_p) is an iso, so δ^∧r≠0 | holds |
| James (F6.2 Checks) | S⁰, S² | J(S⁰)=ℕ vs ΩS¹≃ℤ; J₂/J₁=S⁴, rank H₂=1 | holds |
| Type and v_n maps (F6.3) | S/p, v₁-cofiber, Adams maps | K(1)_*(S/p) has rank 2, K(0)_*(S/p)=0. Cofiber: K(2)_*≠0. Degrees 8=2·4·1 and 2p−2=2·1·(p−1) | holds |
| Strong type Checks (R01) | S/2, S/p | S/2: only (0,1) admissible, Sq¹ iso, Q₁=0, 2=2, so strongly type 1. S/p: H(H;P¹)=H⊕H≠0, so not | false (R01) |
| Margolis bound (F6.3) | as stated | s>c+(t−s)/(2pⁿ−2) equals `ravenel-orange` 2631–2632 | holds |
| Index arithmetic σⁿE (F6.3) | general E | \|σⁿE\|=Σe_i(2p^i−2pⁿ)=\|E\|−(Σe_i)d_n=c_Ed_n+a_E; and b_E≥Σe_i since 2p^i−2≥d_n | holds |
| Smashing (headline) | n=0; E=Hℤ | L₀X=X∧S_ℚ. L_{Hℤ}S=S but L_{Hℤ}Y=0 for some Y≠0 (`ravenel-orange` 3288–3292) | holds |
| Fracture vanishing (F6.4) | n=1 | L_{K(1)}(X_ℚ)=0 since K(1)∧Hℚ=0; L₀L_{K(1)}S≠0 | holds; order correct |
| Tate vanishing (headline) | K(n), C_p; Hℤ | x^{pⁿ}=v_n⁻¹[p](x)=0, so Euler inversion gives 0. π_{−2k}Hℤ^{tC_p}=ℤ/p≠0 | holds; integral case excluded |
| Torus Euler (headline) | ℓ=1, C=D=pt, weight p; weight 0 | e=[p]_F(x)=px+…, a nonzerodivisor in MU^*[[x]]; weight 0 gives e=0 | holds; weight-0 excluded |
| Smoothing comparison (sample) | compact smooth S¹ | Whitehead triangulation gives a finite CW model | citation resolves |

## Not verifiable

- `bousfield-1979` §6, Theorem 6.6 (Steenrod sample: the HF_p-nilpotent completion equals derived p-completion for bounded-below spectra) and `thom-1954` Chapitre IV (unoriented-coefficients sample): uncertified in the manifest and not in the cache. Miller §13 (`miller-cobordism` lines 1371–1376) states Thom's ring without proof.
- The remaining uncertified texts are outside the sample and were not read: DHS I and Hopkins–Smith II, Johnson–Wilson Proposition 4.14, Würgler 2.16 and 6.19, Toda 1962 Chapter I, James 1955, Greenlees–Sadofsky, Hovey–Strickland 7.10(e), Symonds, Adams, and Quillen 1971.
- The DHS vanishing-line slopes at F6.2 item 2 were not checked against the source.

## Source issues

- **Misprint** in ravenel-green at Corollary 3.1.10, p. 64: the source says the generator a_i at p=2 is represented by [ξ_i]; it should be [ξ_{i+1}], matching the bidegree (1,2^{i+1}−1) and a₀=[ξ₁] stated before Lemma 3.1.3; affects nothing.
