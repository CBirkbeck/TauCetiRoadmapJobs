# Repair report: FIX-PKG-ChromaticHomotopyTheory~2

Files changed: `packages/ChromaticHomotopyTheory/README.md`, `packages/ChromaticHomotopyTheory/Suggested.lean` (docstring only), `packages/ChromaticHomotopyTheory/sources.toml`, `packages/ChromaticHomotopyTheory/design/plan.json` (top-level `gaps` only; a script check confirms that no other key changed).

## F01 (P1) — applied

Old: 27 `gaps` records, 20 of them (G1–G9, G11–G17 with G16a/G16b, G19, G20) with no supplier. New: the plan holds three supplier gaps: `p-local-finite-duality`, `spectral-ringed-sites` and `stable-james-splitting` (G18, see F02). The other 19 records were proof-extraction notes, not supplier gaps, so they are retired. I checked each owner against the README and the supplier text:

| Record | Owner (verified) |
| --- | --- |
| G1 | BordismFormalGroups F6.2 (`muSmashNilpotence`, DHS constructions; main) |
| G2 | BordismFormalGroups F6.3 (periodicity, thick classification) |
| G3 | BordismFormalGroups F6.3 (L_n^f kernel as a localizing ideal); README §4.2 for all spectra |
| G4 | README §5.1 proof route |
| G5 | README §6.3 ("constructed in this subsection") |
| G6 | BordismFormalGroups F2, F3, F5, F6.4; Čech step README §8.1 |
| G7 | BordismFormalGroups F6.4 (Hopkins–Ravenel smashing) |
| G8 | README §8.3 |
| G9 | EllipticCohomology E2 items 2–3; README §7.1–§7.2 for h≥3 |
| G11 | README §9.2 |
| G12 | README §9.4 |
| G13 | README §9.5 (completed-KU locality now derived there, see F05(d)) |
| G14 | README §10.1–§10.4 |
| G15 | HomotopySpheres §4B; TopologicalKTheory T7; GeneralizedCohomology G5.4 |
| G16a | EllipticCohomology E1 (consumes SchemeAndStackFoundations §4.15) |
| G16b | duplicate of `gap:spectral-ringed-sites` |
| G16 | EllipticCohomology E3 |
| G17 | README §12.1–§12.4; EllipticCohomology E4 (Δ²⁴), E6 |
| G19 | README §13.1–§13.2 |
| G20 | README §13.4 |

## F02 (P1) — applied

Confirmed: at both open heads of HomotopySpheres (#284 and #1287), §3B states the filtration, the quotients, the James map, the connected theorem and the James–Hopf map. The splitting appears only inside the regression check of item 4. New contract under `### From TauCetiRoadmap.HomotopySpheres`: `gap:stable-james-splitting`, with the wording the review proposed. The plan entry is supplier HomotopySpheres, section §3B. The scope bullet, the supplier paragraph and §13.5 *Needs* now cite the contract.

## F03 (P2) — applied differently

Confirmed in substance, but the section numbers differ. At the RefinedTraceMethods head the tool indexes (#1493, df13161), the material is §2.3 (the Segal statement "S^tC_p≃S_p^∧", as an "Also establish"), §2.6 (THH of E₁-rings with Frobenius), §2.9 (TC), §2.10 (categorical THH), §4.9 (K, IK) and §4.11 (trace). The review's §2.4/§2.7/§2.10 do not match that head. Changes: deleted the three gaps; deleted the GeneralAlgebraicKTheory subsection; rewrote the RefinedTraceMethods contract with these sections; repointed §8.3 and §9.5 *Needs* and the Dependencies.

## F04 (P2) — applied

Confirmed: StableHomotopyKTheory §7.24 states strong convergence for exhaustive filtrations bounded below, with no hypothesis on E. §6.1 now says the spectral sequence converges strongly for every CW base and every E (§7.24). The API bullet, the proof route, the supplier caveat and the §6.2 clause are corrected. The false Check is replaced by the KU/ℂP^∞ check, which collapses in even total degree. *Needs* names §7.24. The bhm locator is now Lemma 3.5, line 258.

## F05 (P3) — applied differently

(a) G4.1→G4.5 for orientations, at scope, contracts and Layer 1 Dependencies; G5.3→G5.4. (b) Serre–Tate→ModularCurves §7F at scope, contracts, §12.4 route and *Needs*, and the Layer 12 Dependencies. (c) Real Bott→HomotopySpheres §4B, with T7 for the Clifford coefficients and G5.4 for c(a)=2u², c(b)=u⁴; the a, b, u dictionary is stated. (d) Differs from the review: the gap is retired, not narrowed. BordismFormalGroups F3 (Adams splitting with its Bott cyclic action) plus F6.5 (Landweber E(n)-locality and the K(n)-localization formula) already give K(1)-locality of KU_p^∧, and RefinedTraceMethods §6.8 (L_K(1)X≃(L_KU X)_p^∧) gives it directly. §9.5 states this route. (e) The §8.4 route is replaced by the v_n-cofiber induction.

## F06 (P3) — applied

All 51 distinct `<id> line N` locators were checked against the extractions and the review's lines were confirmed.

- **Changed as the review said:** lmmt 301 (12 uses) → 322/344, 317, 239, 265, 259, 904, 876, 890, 826/834; lmmt 1729→914, 1160→925, 164→153; behrens 1160 (11 uses) → 132/220, 766/1007, 876, 1252, 1016, 1048, 1183, 233, 455, 457/845; hs 129 at three places → 89/582, 152/166/790; goerss 688→152.
- **Further corrections of the same pattern:** hs 129 at Layer 0 → 359, 548/664; lmmt 811→808, 321→322, 837→834; ravenel 401→379, 386, 405/407; bhm 225→233 (Postnikov) and 258 (§6.1); hahn 19→432/442 (§10.4); akq 632→186, 205; akq 210→218/236; goerss 688→670 (height); mm 1729→1244/1256/1270, 1682; behrens 761→766.
- **Kept, because correct:** lmmt 301 at §3.3 (Lemma 2.3), behrens 1160 at §12.4, mm 1729 at §12.1, and hs 129 where Theorem 7 is meant.

## F07 (P3) — applied

Confirmed at BordismFormalGroups F6.3 (main, lines 1171–1173). Deleted (d) and (g) from §3.2 and relabelled the remaining items (a)–(f); no external reference used the letters. The scope bullet and the F6.3 contract now name ⟨K(n)⟩≤⟨T(n)⟩ and the choice-independence of ⟨T(n)⟩. The proof route no longer compares detector classes. The Check about "acyclicity, not identification" is replaced by an Hℤ/V Check of (f).

## F08 (P3) — applied

Confirmed: at h=2 the law has height 3. New Check: π₀E=W(𝔽₈)[[u₁,u₂]], and the 2-series mod 2 is u₁z²+_F u₂z⁴+_F z⁸. g₂=[2](z)/z⁴ exists only modulo (2,u₁) (k=1), with leading coefficient u₂. The old form u₁z²+_F z⁴ is identified as the h=1 series, for which the range of k is empty.

## F09 (P3) — applied

Layer 0 Example: "L_0S=0" → "L_(zero spectrum)S=0". With the Conventions, L₀S=Hℚ (as at the Hopkins–Ravenel Example), so the clash is gone. No other L₀ means the zero-spectrum localization (grep).

## F10 (P3) — applied

§13.5 now holds for every spectrum E. The proof route says that no property of E is used (Σ∞(W^∧k)≃Σ∞W⊗Σ∞W^∧(k−1)). The T(n)∨T(n−1) and type-m instance and the A-theory sentence are kept. New Check: E=Hℚ, W=K(ℤ/p,1). *Needs* scopes §3.2 to the T(n)∨T(n−1) instance.

## F11 (P3) — applied

"supplied by H.6" removed (F04). "explicit parts of the E3 request" → "supplied by BordismFormalGroups F6.5"; I verified F6.5's unstraightening, pointwise Kan formulas and composition at main lines 2094–2117. "The §4 periodicity construction is not audited (G2)." deleted from References. The same pattern was repaired in the `hs` manifest locator in `sources.toml`.

## F12 (P3) — applied

Confirmed: EllipticCohomology E2 uses R[u,u⁻¹], |u|=2. The Conventions now say that E2's degree-two generator is u⁻¹ here and that ψ_(−1) negates both. They cite behrens line 1024 (|u|=−2). New §7.1 Check: the w=u⁻¹ dictionary, ψ_(−1)(w)=(−u)⁻¹=−w, and the degree check |u_iu^(1−pⁱ)|=2(pⁱ−1).

## F13 (P3) — applied

`Suggested.lean` docstring, §6.2 item: missing spectra and their smash with suspension spectra. The pinned Eilenberg–Steenrod homology pretheory has no excision axiom and no weak-equivalence invariance, and neither library has homotopy fibres of maps of spaces. I verified the classes at the pins: `IsHomotopyInvariant`, `HasPairSequence`, `IsAdditive`, `HasDimensionAxiom`. Mathlib's `HomotopyFiber.lean` covers only chain complexes, hence "of maps of spaces".

## F14 (P3) — applied

- **Capitals:** fixed in all Example lead-ins: Bousfield, Brown–Peterson, Morava/Johnson–Wilson, Postnikov, Ravenel's Bousfield, Hopkins–Ravenel, K-theory. Lower case after the comma in every Example lead-in that had a capital there (eleven lead-ins, including the three listed).
- **Symbols:** all bare Z→ℤ (including Σ∞ℤ, ℤ_p/ℤ, K(ℤ,2), ℤ₂), Q→ℚ, HF→H𝔽; TM𝔽→TMF; §12.3 grammar fixed.
- **§4.3:** the unsourced Clausen–Mathew sentence now says L_n^(p,f) is cmnn's localization of that name (cmnn line 97).
- **Examples:** the five verbatim Examples blocks are replaced by new examples (Layers 4, 5, 7, 9, 10).
- **References:** `sources.toml` is no longer backticked.

## F15 (P3) — applied

`sources.toml`: `licence_class` changed from "author-page" to "institutional" for `hs`, `greenlees-sadofsky` and `hesselholt-ku`. All three are other authors' papers in the `otherpapers` directory of Ravenel's departmental site. `ravenel` stays "author-page". Nothing else in those entries changed.

## Checks

- `lake env lean packages/ChromaticHomotopyTheory/Suggested.lean` (from the content checkout): exit 0, no messages, 2.8 s. No `TauCeti.*` import, so nothing was built.
- `#check` probe: `Suggested.lean` declares nothing; it is a docstring and an empty namespace, which the review accepted with its statability table. There is nothing to `#check`, and no signature changed.
- Depcheck output: `depcheck: 46 roadmaps, 490 edges, 0 problem(s)` (no UPWARD, CYCLE or moved line).
- `roadmaps resolve` on the README: no cross-roadmap citation and no Lean name found nowhere. The `sources.toml` lead is resolved.

## Adversarial pass (statements added or changed)

| Statement | Instances | Values computed | Result | Change |
| --- | --- | --- | --- | --- |
| Conventions: u⁻¹ dictionary | ψ_(−1) at h=1; v₁ at p=2,3 | u↦−u, u⁻¹↦(−u)⁻¹=−u⁻¹; \|u₁u^(1−p)\|=2, 4 | holds | added |
| §6.1 strong convergence | Y=*; KU over ℂP^∞; Klein bottle with Hℤ; X=∅ | one column, E²=E^∞; even total degree, all d_r=0; H₁=ℤ⊕ℤ/2, H₂=0; all terms 0 | holds | restated |
| §3.2 new Check of (f) | X=Hℤ; X=V | H^(−k−rd)(V)=0 for large r; id↦v^r≠0 | holds | added |
| §8.4 induction route | n=0,i=1; p=2,n=1,i=2; i=n | T(1)⊗Hℤ_(p)=0; T(2)⊗Hℤ_(2)=0 so T(2)⊗BP⟨1⟩≃T(2)⊗E(1)=0; at i=n, T(n)⊗BP⟨n⟩≃T(n)⊗E(n)≠0, as the T(n)-equivalence requires | holds | route replaced |
| §9.5 KU_p^∧ K(1)-local | p=2: KU_(2)≃E(1); p=3: E(1)∨Σ²E(1); X=H𝔽_p | π₀holim KU/pⁱ=ℤ_p; L₁H𝔽_p=0, so the formula gives 0 although H𝔽_p is p-complete | holds | route added |
| §13.5 for all E | W=*; E=Hℚ, W=K(ℤ/p,1); W=S⁰ | 0=0; reduced rational homology 0 on both sides; S⁰ excluded since π₀J∞S⁰=ℕ≠ℤ | holds | generalized |
| gap:stable-james-splitting | W=S², S¹, * | ⋁S^(2r); ⋁S^r (H_*(ΩS²)=ℤ in every degree); 0 | holds | added |
| §10.1 Check | p=2,h=2; h=1 | mod (2,u₁): u₂z⁴+_F z⁸, g₂ leading u₂; u₁z²+_F z⁴, k-range ∅ | holds | replaced |
| L_(zero spectrum)S | zero spectrum vs Conventions L₀ | 0 vs Hℚ | distinct | relabelled |
| Layer 4 example | n=0,1; Hℚ, H𝔽_p | L₀^fHℚ=Hℚ, L₀^(p,f)Hℚ=Hℚ[1/p]=Hℚ; H𝔽_p[1/p]=0, T(1)⊗H𝔽_p=0 | holds | added |
| Layer 5 example | X=S⁰ | [Σ^jV,S⁰]_*=0 for j≥1; L_T(n)S≠0 | holds | added |
| Layer 7 example | a=−1 on u; a=2 on π₂ at p=3 | (−1)^(−1)=−1; 2¹=2 | holds | added |
| Layer 9 example | n=0,±1,−2 | Ĥ⁰=ℤ/2, Ĥ^(±1)=0, Ĥ²=ℤ/2; L_n^(2,f)Hℤ=Hℤ[1/2]≠Hℤ | holds | added |
| Layer 10 example | Hℤ_(p), KU_p^∧ | T(0):Hℚ≠0, T(1):0, ht 0; T(1)≠0, T(2)=0, ht 1 | holds | added |
| §7.1 new Check | h=1 odd p | w=u⁻¹ has degree +2; ψ_(−1)w=−w | holds | added |
| RTM contract F(A^hG)→F(A)^hG | G=1; F=id | identity; identity | holds | added |
| §3.2 after deleting (d),(g) | n=1 | ⟨K(1)⟩≤⟨T(1)⟩ now cited from F6.3 | consistent | moved to scope |

## Notes for the maintainer

- **RefinedTraceMethods numbering.** Its sections are cited as at the head of #1493 (df13161): §2.3, §2.6, §2.9, §2.10, §4.9, §4.11, §6.8. RefinedTraceMethods' own "Downstream consumers" line says this roadmap uses §2.4 and §6.8; it now also uses §§2.3, 2.6, 2.9, 2.10, 4.9 and 4.11. Its §2.3 Segal statement is an "Also establish" with no proof route.
- **Retired supplier gaps:** `sphere-segal-comparison` and `completed-ku-locality` (BordismFormalGroups), `spectral-perfect-k-theory` (GeneralAlgebraicKTheory), `cyclotomic-trace-carriers` (RefinedTraceMethods). GeneralAlgebraicKTheory is no longer a supplier here.
- **New supplier gap:** `stable-james-splitting` on HomotopySpheres §3B. Both open heads (#284, #1287) lack it.
- **Ownership:** no new target was added. The roadmap index was searched for the James splitting (no owner anywhere) and for KU K(1)-locality (RefinedTraceMethods §6.8, now cited).
- **Licence flag on `hs`:** the `hs` extraction carries a JSTOR download footer with a JSTOR terms-of-use line. The institutional classification may deserve a human look.
- **No suspicious instructions** were found in the review or in the fetched texts.
