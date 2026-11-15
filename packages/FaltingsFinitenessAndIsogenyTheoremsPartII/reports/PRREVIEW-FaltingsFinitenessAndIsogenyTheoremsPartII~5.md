# Review of FaltingsFinitenessAndIsogenyTheoremsPartII (pull request #1738 at f49680f)

**Verdict:** needs changes

Incremental re-review of the 61 lines changed since 5b87710. One P3 finding; no P1 or P2.

## R01 (P3) — Cartier's theorem is attributed to the wrong owner

**Location:** `TauCetiRoadmap/FaltingsFinitenessAndIsogenyTheoremsPartII/README.md:136`: “its existence uses Cartier's smoothness theorem, which is proved there.”

**Claim:** EllipticCurveModularityPartII §6.0f proves the existence of A_ω but does not prove Cartier's theorem: it consumes it from another roadmap. The sentence, added by the repair, cites the supplier for a statement it does not make.

**Witness:** `TauCetiRoadmap/EllipticCurveModularityPartII/README.md:822` at its open head: “it is smooth by Cartier's theorem (GroupSchemesOverABase §4.5)”; line 832 lists that section under *Needs*; line 92 is its supplier contract for it.

**Repair:** Replace the clause with: “its existence, which needs characteristic zero, is proved there.” Nothing else in §2.1 or the scope paragraph depends on the clause; the contract then states only what §6.0f itself supplies (lines 822–830 and 842 of the supplier).

## Previous findings

- R01 — repaired: nine paragraphs now open “What <Supplier> must provide (gap:<slug>):” at README lines 59, 69–79, 120, 126; the nine slugs match the registered ones, mathematics unchanged.
- R02 — repaired: line 124 cites “B5.1a, which is §12.2 in the supplier's own numbering, `ScalarFourierJacobi.torsorDescription`” and `HodgeLineFJ` of ShimuraCompactifications §7.15; both resolve (AutomorphicBundles README lines 222, 4568–4574; ShimuraCompactifications line 2534).
- R03 — repaired: line 949 reads “mz20, Lemma 2.2, p. 644, for the D≥2 form; gr14, Theorem 1.4 p347, and EllipticCurveModularityPartII §6.0f for every degree D≥1, including D=1”.

## Verified sound

| Statement | Instances tried | Values computed on each side | Result |
|---|---|---|---|
| §2.1 G_ω as A_ω of EllipticCurveModularityPartII §6.0f at K=ℚ̄ | Supplier text lines 822–830; bost95 Théorème 2.2 (subvariety of the complex A_σ) | Supplier: algebraically closed K⊆ℂ, ω∈t_A⊗ℂ, A_0=0, image rule: all four present. Complex abelian subvarieties descend to ℚ̄, so both minima agree | Sound; only the Cartier clause (R01) is wrong |
| §2.1 Δ_L(B)=χ(B,L\|_B) API | A2.4 and A5.4(2) at the supplier head (lines 1160–1168, 2659–2664) | A2.4: χ=c₁^g/g! for every L, h⁰=χ>0 ample, g=0 value 1. A5.4(2): h⁰=∏d_i. Type (1,2): χ=2=4/2! | Agrees |
| §2.1 Check, E×E product principal line | ω=(η,η), (η,0), whole surface | Diagonal: deg O(2[0])=2. E×0: 1. Surface: c₁²=2, Δ=2/2!=1. So 2>1 under inclusion | Agrees; non-monotone as stated |
| §2.1 Checks, degree 3 and nef line | Elliptic curve deg 3; pr₁*O([0]) on E×E | Δ=3, map-degree 3²=9. Nef: restriction to 0×E trivial, degree 0; c₁²=0 | Agrees |
| §2.2 new Check | g=2, S first-order neighbourhood, L=(product principal)² | length S=3; S^[2]: (x+x′)²=2xx′≠0, cubes vanish, length 6; d_L(A)=4·2=8; ord₀θ²=4≥3; 3≤8; B elliptic: 2·2=4≤8; binomial(3,2)=3 vs T^c=4 | Agrees with §2.2 and with gr14 Prop. 6.1 (4·1≤8) |
| §2.4 new Check, Weil restriction | A=Res_(F/ℚ)E, E not isogenous to E^τ, L=(product principal)² | A simple over ℚ (a ℚ-factor B would give E∼B_F∼E^τ); divisor E×0+0×E^τ Galois-stable; Δ_L(A)=8/2!=4; Δ_L(E×0)=deg O(2[0])=2 | Agrees; G_ω≠A though A is ℚ-simple |
| §2.4 theorem (seeded sample) | bost95 lines 151–157; gr14 lines 63–68; mw94-preprint lines 228–232 | Sources: constant depends on g,[K:ℚ],deg_L A, exponent on g; gr14 c=c₀D^κ(deg_L A)^(1+gκ), so C_(g,d)·max(1,D,h,q)^(2κ) covers it; g! absorbs normalization | Supported |
| Scope paragraph, gr14 locators | Prop. 6.1 lines 1074–1082; Prop. 6.9 lines 1606–1620; Théorème 7.5 lines 1813–1817 | Order gT along t_A at 0, T^(g−dim A′)deg A′≤n^(…)deg A; g=2 and deg_L A≥10¹⁰; A_ω≅E₁×E₂ over degree ≤2; extraction pages 27, 38, 43 = printed 369, 380, 385 | All three locators correct |
| §6.1 attribution (`elliptic_isogeny_j_height_bound`) | mz20 line 397; D=1 | mz20 states D≥2 only; D=1 in its unclamped form gives factor (log 1)²=0; roadmap gives C>0 through §6.0f, which covers d≥1 | Attribution now correct; statement unchanged |
| Single direction of supply with EllipticCurveModularityPartII | Its README line 1155; this README lines 13, 1213 | Supplier lists this roadmap only as a consumer of §6.0f and calls Δ_L “that roadmap's own definition”; this roadmap's consumer list does not name it | No cycle, one owner for A_ω |

Rows for untouched statements stand as in the previous review, of `5b87710`.

- Source locators checked against the text: 8 (gr14 ×4, bost95 ×2, mw94-preprint, mz20).
- Cross-roadmap citations resolved at open heads: EllipticCurveModularityPartII §6.0f; AutomorphicBundles §12.2 and its B-numbering map; ShimuraCompactifications §7.15; AbelianSchemesAndArithmeticModuli A2.4, A5.4(2).
- Resolver leads: “AutomorphicBundles B4.2” is covered by the supplier's numbering map (line 222); `ScalarFourierJacobi.torsorDescription` is the supplier's name, declared at its §12.2.
- Gate at f49680f: every check passed (build=0, depcheck=0, outside-folder=0). Dependency check: `depcheck: 245 roadmaps, 2241 edges, 0 problem(s)`; no UPWARD or CYCLE line.
- Elaboration of `Suggested.lean`: two `sorry` warnings, nothing else; the diff touches no Lean declaration, so signatures and the padding probe stand as before.
- Pull request title and description read against this head: no sentence contradicted; no supplier, section or declaration added or dropped by the change.
- Declared gaps: the nine README contracts carry the nine registered slugs with named suppliers; the retired legacy entries remain settled as in the previous review.
- Overlap check: read ArakelovGeometryAndAbelianHeights, FaltingsFinitenessAndIsogenyTheorems, SuccessiveMinima (scopes as resolved in the previous review) and EllipticCurveModularityPartII; shared object: the minimal period subvariety, owner EllipticCurveModularityPartII §6.0f, cited here.
- Source independence: changed passages only; 6 passages compared with 4 sources (gr14, bost95, mw94-preprint, mz20), none shared; largest share mw95, 39 of 146 locators; contents not compared again (no layer added, removed or reordered).

## Not verifiable

- mw93-periods, mw95-refine (waived) and igusa, fw84 (uncertified): unchanged from the previous review; no changed passage adds a locator into them.

## Source issues

- none

## For the human reviewers

- none
