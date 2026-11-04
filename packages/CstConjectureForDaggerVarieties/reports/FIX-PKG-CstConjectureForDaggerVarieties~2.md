# FIX-PKG-CstConjectureForDaggerVarieties~2

Repair round on the seven findings of REV-PKG-CstConjectureForDaggerVarieties. Files edited: `packages/CstConjectureForDaggerVarieties/README.md`, `packages/CstConjectureForDaggerVarieties/Suggested.lean` (module docstring only) and the top-level `gaps` list of `packages/CstConjectureForDaggerVarieties/design/plan.json`. `metadata.toml` and `sources.toml` are unchanged: every new locator is in CN25, GK04 or BKV22, which the manifest already records.

## F01 (P2) — applied

§0.4: "For r≥0, if the Newton slopes…" → "For an acyclic pair (M,L) and r≥0, …". The arithmetic counterpart now states acyclicity, slopes in [0,r], Fil⁰=M_K, Filʳ⁺¹=0 and is attributed to bounded-arithmetic-filtration, in the gap sentence and the §0.4 Needs. Checks added: the slope-one negative control, two positive cases, and L=M⊗B_dR⁺.

## F02 (P2) — applied

natural-period-hom (README and plan): removed the clause on bounded-image VS Hom vanishing. It now asks only for Ext¹ vanishing (Lemma 3.26(i)), rank equals height (Proposition 3.27(i)) and the VS/TVS comparison. VB3 "Curvature-zero finite-length modules" and "VS Hom vanishing from torsion period modules" are cited in the VectorBundlesAndIsocrystals contract paragraph and in the Needs lines of §§0.8–0.9, 5.4 and 5.5.

## F03 (P1) — applied

New gap strict-countable-derived-limits (LocallyAnalyticDistributions §0.0/§0.2), in README and plan. It asks for exact countable products, the Roos limit, left-heart compatibility, Milnor and six-term sequences, and R^q lim=0 for q≥2, with no Fréchet, Mittag–Leffler or finiteness hypotheses. §§4.1–4.3, 4.5 and Layer 4 point to it. §4.2 gains two Checks.

## F04 (P1) — applied differently

Instead of extending analytic-syntomic-descent, which would make that gap more compound (F05's defect), I added a separate contract, overconvergent-crystalline-complex (CohomologyComparisons §4.9a). It covers RΓ_cris(X), its Frobenius, the completion map, the strict comparison with completed-unramified HK⊗̂B_cris⁺, and the distinction from ordinary crystalline cohomology. §2.8 cites it and gains point and dagger-disc Checks.

## F05 (P2) — applied differently

geometric-finiteness-tubes is split. New AdicSpacesPartIV contracts: dagger-de-rham-finiteness-over-c (three classes listed), dagger-strictness-kunneth-over-c, and the tube contract with charts, codimension, radius and Čech conditions. Only de Rham, its own object; HK and B_dR⁺ follow via HK comparisons (CN25 line 2564). Resolution belongs to its owner, PadicHodgeTheory §2.7 (proper-pair-resolution-over-c).

## F06 (P3) — applied

§2.3 Check: "the only nonzero piece is the finite Q_p negative-curvature piece Hʳ_proét" → "the only potentially nonzero piece is the negative-curvature piece Hⁱ_proét(X,Q_p(r)), finite dimensional over Q_p". Added the P¹ Check: the graded triple is (0,0,Q_p(1)) at (i,r)=(0,1) and (0,0,0) at i=r=1. No other degree-r misindexing exists: lines 416, 542 and 558 are genuinely degree-r statements.

## F07 (P3) — applied

§3.7: added a prose API for the tube Z(ε). It covers chart gluing via integral units (BKV22 lines 1180–1183), invariance under trivialization changes, ε↦ε/|c| under non-unit rescaling, monotonicity, Zᵃⁿ⊆Z(ε), and the intersection and union tubes with their complements. Four Checks: unit and non-unit rescaling, monotonicity, zero equations and empty union. No Lean added.

## Pattern repairs beyond the cited lines

- F01 pattern: every other use of a weakly admissible sublattice (the §0.8 route, the §0.9 route) already sits under an acyclicity hypothesis. The bounded-arithmetic-filtration gap sentence now states acyclicity explicitly for its subfiltration clause.
- F02 pattern: torsion Hom vanishing was also consumed in §5.4 (the finite torsion pieces) and §5.5 (into B_dR⁺⊇B_cris⁺). Both Needs lines now cite VB3. The §0.7 Needs line no longer claims "torsion Hom/Ext" from the gap; those are internal to the supplier's proof of Proposition 3.27(i).
- F04 pattern (a Needs line attributing to a contract something its sentence does not state):
  - §3.2 consumed cup products on the HK and B_dR⁺ complexes, so analytic-syntomic-descent now says "with their cup products".
  - §5.2 attributed "strict Čech presentations" and finite freeness to analytic-syntomic-descent. Its Needs line now says the Čech presentations are formed in §5.2 itself on the supplied B_dR⁺ complexes, cites AdicSpacesPartIV F1.7 for affinoid coverings, and cites §1.2 smallness (a hypothesis of §5.2).
  - The §3.4 Needs line now takes smallness of U from the geometric-log-periods identification with the proper log pair, not from a finiteness contract.
- F05 consumers repointed: §1.2 (API bullets and Needs), §1.5, §3.2, §3.4, §3.6, §3.7, the Layer 1 and Layer 3 Dependencies, and the Scope bullets for AdicSpacesPartIV, PadicHodgeTheory, LocallyAnalyticDistributions and CohomologyComparisons.
- `Suggested.lean`: the §2.8 docstring item now names the overconvergent log-crystalline complex and its completed-unramified HK comparison as the missing carriers. No declaration changed.

## Checks run

- **Elaboration.** `lake env lean packages/CstConjectureForDaggerVarieties/Suggested.lean`, run from the content checkout, exited 0 with no output. No TauCeti module is imported, so nothing had to be built.
- **Mechanical signature check.** `Suggested.lean` declares no named declarations (one `import Mathlib`, one module docstring, an empty namespace), so there is no `#check @name` to compare. No binder or hypothesis could drop out, and no padding was added.
- **Dependency direction.** Output of `tauceti-roadmap … gate --depcheck … --movable`:

      depcheck: 52 roadmaps, 589 edges, 0 problem(s)

  There is no UPWARD, CYCLE or moved line. All suppliers named (Mathlib, Tau Ceti, AdicSpacesPartII, AdicSpacesPartIV, PadicHodgeTheory, VectorBundlesAndIsocrystals, LocallyAnalyticDistributions, CohomologyComparisons, ClassicalAdicEtaleCohomology) are on main or earlier in the merge order.
- **Citations.** `roadmaps resolve` on the README reports no cross-roadmap citation or Lean name found nowhere. `properRigidLogResolution` resolves to PadicHodgeTheory §2.7 at its open head.
- **README/plan agreement.** All 16 `What … must provide (gap:slug): …` lines match the plan's `gaps` entries in slug, supplier and needs (checked by script). Each needs is one sentence. Only the `gaps` key of `plan.json` differs from HEAD.
- **Gate failures listed in the brief.** None were listed.

## Ownership and supplier verification

- **VB3 Hom vanishing (F02).** Read at VectorBundlesAndIsocrystals head c380d7d, "VS Hom vanishing from torsion period modules" and "Curvature-zero finite-length modules" (§VB3, Period modules and curvature calculus). The target covers both targets B_dR⁺ and B_dR and includes the bounded-image step. VB3 states no Ext¹ (Lemma 3.26), no rank-equals-height (Proposition 3.27) and no TVS comparison, so those stay in the gap.
- **Derived limits (F03).** LocallyAnalyticDistributions head 3a4526a supplies ordinary limits (§0.0), the bounded strict derived category and left hearts (§0.0), and `naProjectiveLimit_cohomology_finiteDimensionalML` (§0.2), which requires Fréchet complexes, strict Roos surjectivity and finite-dimensional Mittag–Leffler cohomology. DerivedModuleAlgebra §1.T.1 (main) supplies lim/lim¹ and Milnor sequences for towers of modules only. A search of every roadmap for derived limits in a left heart or quasi-abelian category found none. LocallyAnalyticDistributions, the owner of the strict derived category, is therefore the supplier.
- **Crystalline complex (F04).** CohomologyComparisons head a99732e, §4.9a, builds the overconvergent HK realization and explicitly separates it from ordinary completed log-crystalline cohomology on nonproper charts. It states no crystalline complex of a dagger space and no comparison of that complex with HK⊗̂B_cris⁺. A search for overconvergent crystalline complexes of dagger spaces found no owner.
- **Finiteness, strictness, Künneth (F05).** AdicSpacesPartIV on main states *dagger-strict-differentials* (F1.9) and *dagger-de-rham-finiteness-and-base-change* and *dagger-de-rham-kunneth* (F1.11), all over a discretely valued mixed-characteristic K. No roadmap states the versions over C. These gaps are extensions of the owner's targets.
- **Resolution (F05).** PadicHodgeTheory head 4c4f1e8, §2.7, owns `properRigidLogResolution` over its standing C, the completion of an algebraic closure of a finite K/Q_p. ResolutionOfSingularitiesCharacteristicZero head bf45c86, §§7.7–7.8, covers schemes and affinoid algebras only and leaves analytic transport to consumers. AdicSpacesPartIV keeps (RES) as a hypothesis. So the contract goes to PadicHodgeTheory and asks only for the extension of the coefficient field, which is the same pattern as the existing galois-period-hom-vanishing gap.
- **Ownership against the open pull requests named in the brief** was checked by object with `roadmaps grep` (README and Lean, at their heads); no competing owner was found for any new contract.

## Adversarial pass on new or changed statements

| Statement | Instances tried | Values computed on each side | Result | Change |
|---|---|---|---|---|
| §0.4 bounded refinement, now under acyclicity | r=1, M=Fⁿʳe, φ(e)=pe, L=B_dR⁺e | Bounds hold; L′=L forced; deg=t_H−t_N=0−1=−1, E=O(−1), H¹=C/Q_p≠0; not acyclic | Without acyclicity the claim is false; with it, the case is excluded | Hypothesis added; negative-control Check |
| same | same M, L=t⁻¹B_dR⁺e; trivial M, r=1, L=t⁻¹B_dR⁺e | deg 1−1=0, E=O, L′=L; E=O(1), L′=B_dR⁺e with B_dR⁺⊆L′⊆L, deg 0 | Holds | Positive Checks |
| same | r=0 (bounds force L=M⊗B_dR⁺); M=0 | Acyclic forces all Newton slopes 0, E=Oⁿ, L′=L; zero pair: L′=0, deg 0 | Holds; degenerate cases consistent | Check on L=M⊗B_dR⁺ |
| same | M=Fⁿʳe₀⊕Fⁿʳe₁, slopes 0,1, r=1, L=t⁻¹B_dR⁺e₀⊕t⁻¹B_dR⁺e₁ | E=O(1)⊕O, deg 1; L′=B_dR⁺e₀⊕t⁻¹B_dR⁺e₁ gives O⊕O, contains M⊗B_dR⁺ | Holds | — |
| L=M⊗B_dR⁺ Check (untwisting) | Rank-two monodromy module, slopes 0,1, N(e₁)=e₀ | exp(uN) maps (M⊗B_cris)^(φ=1) onto (M⊗B_st)^(N=0,φ=1); u∈B_dR⁺, so the lattice is kept; E=O⊕O(−1), not acyclic | Holds; the sign of N is irrelevant to the conclusion | Check added |
| bounded-arithmetic-filtration, acyclic clause | K=Q_p, M=Ke, φ=p, Fil⁰=M, Fil¹=0 | deg=t_H−t_N=−1; every admissible shrinking lowers t_H further, so no weakly admissible subfiltration exists | Acyclicity is needed (CN25 line 1670) | Explicit in the gap |
| natural-period-hom (reduced) | W=Q_p, U₁=(B_cris⁺)^(φ=p), V₁=C, B_dR⁺/t | rk Hom_VS(W,B_dR)=1,1,0,0 = heights 1,1,0,0; Ext¹(B_dR⁺/t,B_dR)=0 (curvature 0≤0) | Consistent with Proposition 3.27(i) and Lemma 3.26(i) | — |
| VB3 citation, §0.8 | Trivial line, L=B_dR⁺, r=1 | Quotient R/tR=C; Hom_VS(C,B_dR)=0 (VB3), Ext¹=0 (gap); Hom(V,B_dR)=Hom(X,B_dR)=B_dR, rank 1 | Holds | — |
| VB3 citation, §0.9 | Hom_VS(B_dR⁺/t, B_dR⁺/t²) | =Hom_(B_dR⁺)(R/t,R/t²)=tR/t²≅C (not 0, not C²) | Proposition 3.17 is what §0.9 uses (CN25 line 1937) | — |
| strict-countable-derived-limits | Constant O(D)/C tower; tail ⊕_(j≥n)Q_p; zero tower; Q_p^(n+1)→Q_p^n | lim=O(D)/C, R¹lim=0 (section (b_n)↦(−Σ_(k<n)b_k)); lim=0, R¹lim=Q_p^N/⊕Q_p∋[(1,1,…)]≠0; 0,0; lim=Q_p^N, R¹lim=0 | The Roos complex is two-term, so R²lim=0; the contract keeps nonzero R¹lim | Gap and §4.2 Checks |
| same, exact products | Product of strict epis/monos in NACvx | The product of open surjections is open onto the product topology; kernels carry the product topology | Exactness holds; requested as part of the contract | — |
| overconvergent-crystalline-complex, §2.8 | Point r=0; point r=1; annulus r=1; closed disc | [B_cris⁺→B_cris⁺] with 1−φ: H⁰=Q_p, H¹=0; 1−φ/p: H⁰=U₁, H¹=0; HK¹=Fⁿʳ·dlogT with φ=p gives H¹=Q_p·e; dagger HK¹=0, Tate algebra has ω=ΣpⁿT^(pⁿ−1)dT non-exact | Agrees with Lemma 7.13 (CN25 lines 2397–2418) | Gap and two Checks |
| §2.3 corrected Check | P¹ at (i,r)=(0,1), (1,1), (2,2); point (0,0) | h⁰₀(1)=B_cris^(φ=p)∩tB_dR⁺=Q_p·t=H⁰_proét(P¹,Q_p(1)); (0,0,0) with H¹=0; HK² with φ=p, {−2}, lattice tB_dR⁺: deg 0, h⁰=Q_p=H²_proét(P¹,Q_p(2)); (0,0,Q_p) | The degree-i reading matches; the degree-r reading gives 0≠Q_p(1) | Check fixed, P¹ Check added |
| dagger-de-rham-finiteness-over-c | Point; closed disc; open disc (naive interior); A^(1,an); G_m^an; ⨿_ℕ points | dims (1,0),(1,0),(1,0),(1,0),(1,1); the last is infinite and lies outside all three classes | Classes are exactly CN25 line 2291 | Gap |
| dagger-strictness-kunneth-over-c | Dagger disc d; rigid disc; annulus×annulus; ⨿_ℕ points | d onto O†dT (strict); rigid image not closed (ω in its closure); H*=(1,2,1) with dlogT∧dlogS; excluded (algebraic tensor misses the identity matrix) | The finite-dimensional hypothesis is necessary | Gap |
| §1.2 API (smallness via HK) | Point; disc; annulus | dR (1,0)→HK (Fⁿʳ,0)→B (R,0); disc B¹=0; annulus (R,R) | Ranks agree with dim HK = dim dR | API bullets reworded |
| §3.2 route (HK Künneth via cup products) | Annulus×annulus | HK¹ classes φ=p; cup product dlogT∧dlogS has φ=p²; after ⊗C it is dR Künneth, an isomorphism | C is faithfully flat over Fⁿʳ, so HK Künneth is an isomorphism | analytic-syntomic-descent adds cup products |
| proper-pair-resolution-over-c | P¹, Z=∅; P¹, Z={∞}; surface, Z=point; surface, Z=nodal curve | Identity; identity (one-point SNC boundary); blow-up needed (codimension-two boundary); blow-up separates branches | Proper with dense image, so surjective; Z=X excluded by nowhere density (§3.4 discards components) | Contract to PadicHodgeTheory §2.7 |
| geometric-finiteness-tubes (restated) | P¹ with ∞ section; m=s (empty intersection); empty union; f=(1−πT)⁻¹ | (1,0) on both sides; complement empty: all 0; complement the generic fibre; gr⁰ fails, unfiltered holds | Unfiltered only; no filtered claim | Gap restated |
| §3.7 tube API/Checks | f=T, ε=abs(π); aT with abs(a)=1; πT; ε=abs(π)²; c=0; empty union | {abs(T)≤abs(π)}∌1; same set; {abs(T)≤1}∋1; contains π², not π; whole chart (complement ∅); ∅ (complement whole chart) | Integral trivialization and radius determine the tube | API and four Checks |

## Sources

No new source was needed and `needs-references.toml` was not created. Locators used: CN25 lines 1670, 1913–1919, 1937, 2289–2302, 2394–2418, 2564, 2601–2618 and Lemma 3.26 / Propositions 3.17 and 3.27 (lines 825–835, 921, 939); BKV22 lines 1176–1187; GK04 lines 499 and 556. All are cited in the roadmap's own words.

## For the maintainer

- **New supplier requests, for those roadmaps' Part II or for their authors:**
  - LocallyAnalyticDistributions: strict-countable-derived-limits.
  - CohomologyComparisons: overconvergent-crystalline-complex. analytic-syntomic-descent now also asks for cup products.
  - AdicSpacesPartIV: dagger-de-rham-finiteness-over-c and dagger-strictness-kunneth-over-c. geometric-finiteness-tubes is narrowed to de Rham tube comparisons.
  - PadicHodgeTheory: proper-pair-resolution-over-c, an extension of the coefficient field of `properRigidLogResolution`.
  - VectorBundlesAndIsocrystals: natural-period-hom is narrower (the Hom-vanishing clause is gone).
- **Changed slugs and names.** No Lean name changed or was added. The slug geometric-finiteness-tubes is kept but now covers only the tube comparisons. Other roadmaps citing this package by section are unaffected: no section was renumbered.
- **Suspicious passages.** None found in the review text.
