# GATE-MixedHodgeModulesAndIrregularHodgeTheory~1: answers to the human review of `f23e693`

One review comment (CBirkbeck, 2026-11-15) carries ten findings, F01–F10, numbered H01–H10 here in order. The quoted text breaks off mid-sentence after F10, in its closing summary; that tail holds no further finding. The review quotes section numbers from the twelve-layer board copy. At `f23e693` the layers had already been re-cut into ten. The map is board 8.1 → 6.7, 8.2 → 7.7, 9.1–9.6 → 8.1–8.6, 10.1–10.2 → 8.7–8.8, 11.1–11.6 → 9.1–9.6 and 12.1–12.9 → 10.1–10.9. Every finding was checked against the current text under this map. Repairs are in commit `55c249b8` on top of `f23e693`.

## H01 (CBirkbeck) — applied differently

The route of 2.4 used "formal stationary phase", which no target or supplier provided: §RD.6.52a of PadicDifferentialEquationsAndRigidCohomology gives the formal normal form and slopes, with no Fourier comparison. 2.4 now states and constructs the comparison itself (`TauCetiRoadmap/MixedHodgeModulesAndIrregularHodgeTheory/README.md`, §2.4). For `N` regular holonomic and regular at infinity, the germ of `FT N` at output infinity is `⊕_c E^{ct} ⊗ R_c` with each `R_c` regular, cited at KS §4.2, p. 27, KS lines 973–989. The route has two steps. A Weyl/Fuchs computation on a cyclic presentation gives smoothness on `G_m` and regularity at `0`. The `V`-filtration construction of Sab10, Appendix A, Lemma A.3 (Sab10 lines 1780–1800, put at `z = 1` with the input sign reversed) gives the germ at infinity. *Needs* gains 2.3, FormalConnectionsOpers §F6.2 (cyclic vectors, now in the supplier contract and Scope) and ComplexComparisonPartII §C5.6.

The suggested new source key (Sabbah, arXiv:0706.3570) was not added: the needed statement and method are in KS and Sab10, which the manifest already records. Under the new statement the review's three tests hold: `FT δ_c = E^{ct}`; `FT O = δ_0` with no singular point and an empty sum; and `D/D(τ∂_τ − α)` has its single germ `R_0` regular at both ends.

## H02 (CBirkbeck) — applied

`MHM(X)` was restricted to smooth quasi-projective `X` (Conventions, 4.6, 5.1), yet 5.5 and 5.6 used it on arbitrary smooth varieties. It is now defined on every variety (Conventions "Varieties", 4.6 and the 4.6 API bullet). On a smooth `X` the conditions are Zariski local and are tested on affine opens (Sai90 lines 97–98). In general an object is glued from affine opens embedded in smooth varieties (Sai90, §4.2, pp. 316–317, Sai90 lines 3240–3251 and 3279). 5.1 now covers arbitrary algebraic maps: they reduce to affine covers glued by Čech resolutions (Sai90, Theorem 4.3, p. 319, Sai90 lines 3358–3370). The Summary now says "complex algebraic varieties". Layer 8 keeps "smooth quasi-projective" for pairs, which is FSY's hypothesis (FSY line 2997). Test case: for Hironaka's smooth proper non-projective threefold, `MHM(X)` is now defined and 5.6 applies.

## H03 (CBirkbeck) — applied differently

Scope now has a sentence after the ComplexComparisonPartII item. EtaleDualityAndPerverseSheaves §3.5 (`complexAnalyticComparison`) compares étale complexes with finite and `ℓ`-adic coefficients, and its §5.9 works in `D^b_c(X(ℂ), ℂ)` and its perverse heart. That roadmap constructs neither category. Layer 1 constructs both for `Λ ∈ {ℚ, ℂ}` on the carrier of EnhancedDerivedSheaves §0.1, with the same stalk and costalk conditions on strata. Two parts of the suggested text were changed. §3.5 uses finite and `ℓ`-adic coefficients, not `ℂ`, so it is not described as using the complex heart. The proposed 1.3 API bullet stated ownership rather than mathematics, so it went into Scope instead.

## H04 (CBirkbeck) — applied

SpringerResolutionAndCharacteristicCycles §9.1 (at its open head) already proves "the resulting composition, identity, adjunction and proper-duality comparisons on their bounded coherent/holonomic domains". The README text of gap:regular-holonomic-stability now asks only for stability under `f_+`, `f_!`, `f^†`, external product and diagonal restriction. It names §9.7 and §9.1 for the rest. The matching gap entry in `design/plan.json` is outside the files this job may edit and was not changed.

## H05 (CBirkbeck) — answered

Steps 1 and 3 were already in place at `f23e693` (commit "layers re-cut by mathematics"):

- **Step 1:** done as proposed. Board 8.1 is now 6.7, the end of the exponential layer; board 8.2 is now 7.7, the end of the Deligne layer.
- **Step 3:** done in an equivalent form. Board Layers 9 and 10 were merged into Layer 8 (pair cohomology and the `tg` criterion, FSY A.5 + A.6), instead of merging board 10 with 11.

So no current layer has the scope of a single FSY subsection:

- Layer 6 is A.3 + A.4 + KS.
- Layer 8 is A.5 + A.6.
- Layer 9 is A.7 + the MT appendix.

Steps 2 and 4 would renumber ids that KloostermanMomentsAndPotentialAutomorphy cites in the current numbering: §§6.7, 7.7, 8.1–8.5, 8.7–8.8, 9.1–9.6 and 10.1–10.8. Nothing cites the twelve-layer numbering, so no mapping rows are needed. Step 5 would add two sources the review says were not read. 7.6 and 8.2 are already cited at exact FSY and ESY locators.

## H06 (CBirkbeck) — applied

The module docstring of `TauCetiRoadmap/MixedHodgeModulesAndIrregularHodgeTheory/Suggested.lean` lists two more headline theorems that cannot be stated at the pins:

- **Target 10.5 (Kouchnirenko's graded acyclicity).** It needs the associated graded ring of the Newton filtration. The pinned Mathlib has only `IsRingFiltration` (`Mathlib/RingTheory/FilteredAlgebra/Basic.lean:75`). Tau Ceti's associated graded algebra (`TauCeti/Algebra/WordFiltration/AssociatedGraded.lean`) covers only word filtrations, and the Newton filtration is not one in general.
- **Target 10.8 (constant boundary correction).** It needs mixed Hodge modules and their direct images.

No declaration was added.

## H07 (CBirkbeck) — applied differently

4.1 gains two Checks, citing Sai88, Remark 1.2.15, p. 870, Sai88 lines 739–757: compatible subobjects generate a distributive lattice.

- **Positive Check.** On `ℂ³` with steps `span(e₁, e₂)`, `span(e₂, e₃)` and `span(e₁, e₃)`, both sides of the distributive law have dimension 2 and 2.
- **Negative Check.** On `ℂ²` with `ℂe₁`, `ℂe₂` and `ℂ(e₁ + e₂)`, the sides are 1 and 0. These lines are pairwise compatible but not compatible as a triple, which is what a pairwise definition would wrongly accept.

The proposed third Check (`A = B`) was left out because no plausible wrong definition fails it.

## H08 (CBirkbeck) — applied

The vacuous Checks were replaced:

- **2.3:** `M ⋆ 0 = 0` → `δ_a ⋆ O = O` in degree zero, since `E^{at} ⊗^L δ_0 = δ_0` has no `Tor₁`.
- **6.1:** "the zero object lies in `EMHS`" → `j_* L[1]` with monodromy `−1`. It has `RΓ = 0`, lies in `EMHS`, and is neither punctual nor constant.
- **6.3:** `E ⊗_E 0 = 0` → `K ⊗^H K = j_! ℚ_{G_m}[2] = K[1]`, which is outside the heart.
- **7.4:** "zero groups" → the intermediate extension of `j_* L[1]`. Its fibre has the single jump `1/2` (the pair `(A¹, x²)`): `H¹(F^Del_a DR) → H¹(DR)` is `0 → ℂ` for `a < −1/2` and bijective for `a ≥ −1/2`.
- **2.4:** `ℱ(0) = 0` was deleted; three Checks remain.

In 6.1, the review's claim that `EMHS` "is not generated by" the objects `Π δ_a V` was restated as non-containment in the category they generate under extensions and subquotients, because that category also contains `pℚ_{A¹} ∉ EMHS`.

## H09 (CBirkbeck) — applied differently

In 4.3, "treated by the Kashiwara clause" was replaced. For `g` vanishing identically on a strict support of positive dimension, no condition is imposed: the graph embedding gives `ψ_g M = 0` and `φ_{g,1} M = M` with `N_φ = 0`. Excluding these `g` is equivalent to Saito's definition (Sai88, Lemma 5.1.8, p. 957, Sai88 lines 3395–3400). Saito's 5.1.6 is a largest-subcategory definition and not an induction, so the cited lemma is the exact locator for the exclusion.

## H10 (CBirkbeck) — applied

- **1.5:** "Kash84 … §7, pp. 355–358" → "pp. 355–359". The running head of p. 359 is at Kash84 line 1255, the proof of Lemma 7.4 ends at line 1269, and §8 begins at line 1271.
- **MT reference:** "pp. 34–40" → "pp. 35–40". The appendix starts after the p. 35 marker, at MT line 1952.

The other MT locators were checked: Lemma A.4 and its proof are on p. 39 (MT lines 2108–2116), and pp. 36–40 for 9.6 are correct.

## Adversarial pass on changed statements

| Statement | Instances tried | Values computed | Result | Change |
|---|---|---|---|---|
| 2.4 germ `⊕_c E^{ct} ⊗ R_c` | `δ_a`; `O`; `O(∗0)`; `j_!O_{G_m}`; `D/D(τ∂_τ − α)`; `0` | `E^{at}`, one term; `δ_0` has germ 0, empty sum; extension of `O` by `δ_0` has germ `R_0` of rank 1; `O(∗0)` has germ `R_0` of rank 1; `D/D(t∂_t+1+α)` is regular at both ends; `0` gives an empty sum | holds | statement added |
| 2.4 Fuchs step | `P = τ∂_τ − α`; `P = ∂_τ − 1` | `P̂ = −(t∂_t + 1 + α)`, leading coefficient `−t` (`r = 1`); `deg a_0 = 0 > deg a_1 − 1` is excluded, correctly, since `E^τ` is irregular at `∞` | holds | route |
| 2.4 translation and twist | `FT(δ_{−c} ⋆ N)` | `= E^{−ct} ⊗ FT N` (2.3 API with `FT δ_{−c} = E^{−ct}`) | holds | route |
| 4.6 general `X` | point; `A¹`; Hironaka's threefold; overlap of two affines | point is `MHS`; `A¹` unchanged; threefold now defined; overlap affine because `X` is separated | holds | definition |
| 5.1 arbitrary maps | `id_pt`; `G_m → A¹`; a proper non-projective map | unchanged; unchanged; covered by Sai90 Theorem 4.3 | holds | statement |
| 4.1 Checks | `ℂ³` triple; `ℂ²` triple | (2, 2); (1, 0) | as stated | Checks added |
| 2.3 Check | `δ_a ⋆ O` | `FT`: `E^{at} ⊗ δ_0 = δ_0`, `Tor₁ = 0`, so `O` in degree 0 | holds | Check |
| 6.1 Check | `j_*L[1]`, monodromy `−1` | `H⁰(G_m, L) = 0`, `χ = 0`, so `H¹ = 0` and `RΓ = 0` | holds | Check |
| 6.3 Check | `K ⊗^H K` | `Δ^*(j×j)_!ℚ[2] = j_!ℚ_{G_m}[2] = K[1]`, perverse degree `−1` | holds | Check |
| 7.4 Check | `(A¹, x²)` summand | `χ(G_m, L ⊗ E^θ) = 0 − 0 − 1 = −1`, so `dim ω = 1`; jump `1/2` (10.3 Check); `F^λ = ℂ` iff `λ ≤ 1/2`, so `a = −λ ≥ −1/2` | holds | Check |
| 4.3 exclusion | `δ_0` with `g = x`, point support | `gr^V_1 = ℂδ`, `N_φ δ = −(x∂_x + 1)δ = 0` | consistent with 4.2 Check | text |

## Other checks

- **Signatures.** The declarations of `Suggested.lean` are unchanged; only the module docstring changed. The thirteen elaborated types in the job's signature listing therefore still apply. They were compared with 10.4 and 10.6 of the README: no lost binder, and the hypotheses `hfull` and `hnd` match the prose.
- **Sources.** Every key cited by the repairs (Sai88, Sai90, KS, Sab10, Kash84, MT, FSY) is in the manifest; no new key was introduced and nothing was requested.
- **Ownership.** No roadmap on main, on the board or in the open roadmap pull requests owns the `D`-module formal stationary phase. A search for "stationary phase" finds only analytic asymptotics (AsymptoticExpansions and the character-sum roadmaps), so 2.4 owns it. KloostermanMomentsAndPotentialAutomorphy separately asks this roadmap for the inverse, irregular-input direction (gap:irregular-stationary-phase). This review did not raise that request and it is not addressed here.
- **Untrusted text.** Nothing suspicious was found in the review text.

## Build and gate

- **Build:** `lake build TauCetiRoadmap.MixedHodgeModulesAndIrregularHodgeTheory.Suggested` completed (18239 jobs). The only warnings are the module-system notice and `declaration uses 'sorry'` on `twistedDeRham_concentration_finrank`.
- **Gate:** `gate MixedHodgeModulesAndIrregularHodgeTheory: set_option=0 blob=0 latex=0 tex=0 prnum=0 sorry-data=0 sorry-examples=0 residue=0 private-paths=0 imports=0 mathlib-subimports=0 no-import-mathlib=0 lean-lines=0 statement-hygiene=0 forbidden=0 dropped=0 readme-ids-missing=0 empty-sections=0 round-labels=0 long-fences=0 layer-ids=0 target-ids=0 depcheck=0 metadata=0 stray-files=0 dirty=0 outside-folder=0 source-material=0 OK`
- **Depcheck:** `depcheck: 244 roadmaps, 2229 edges, 0 problem(s)`. There is no UPWARD or CYCLE line.
