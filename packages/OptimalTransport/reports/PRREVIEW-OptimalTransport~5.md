# Review of OptimalTransport (pull request #950 at 6446de1)

**Verdict:** needs changes

This is an incremental re-review of the 123 changed lines since `e67f050`, all in `TauCetiRoadmap/OptimalTransport/README.md`. `Suggested.lean` has not changed since `9634d34`.

## R01 (P2) — The branch still pins Tau Ceti `a91d3aa`, so the docstring's "proved in the pinned Tau Ceti" list is false at the pin

Re-raised: H01

Location: `TauCetiRoadmap/OptimalTransport/Suggested.lean:23–24`, "The following headline theorems of `README.md` are proved in the pinned Tau Ceti, so they are not restated here", against :72–74, "the Tau Ceti pinned by this file's manifest does not contain".

Claim: every headline is stated, proved at the pin, or not statable at the pin.

Witness: `lake-manifest.json` at this head still pins Tau Ceti `a91d3aa` and Mathlib `6b7abb3`. The merge base `6e6a8ebc` predates main's pin bump `a891cd19` (Tau Ceti `2fd255d`). No file of Tau Ceti `a91d3aa` contains `isOptimalCoupling_iff_exists_isCyclicallyMonotone`, `mongeCost_eq_transportCost_of_continuous`, `exists_hasLaw_and_ae_eq_gradient_comp` or `GromovWassersteinSpace`; main's `2fd255d` contains all four.

Why H01's reason does not settle the finding: it is right that a folder-only repair cannot merge `origin/main`, since the merge touches `lake-manifest.json`. That puts the step on whoever controls the branch. It does not make the folder correct at the pin it builds against. At this head the first list still asserts proofs the pinned library does not have, and the third list still describes six statable headlines as unstatable.

Repair (unchanged; no edit to either folder file before it):

1. Merge `origin/main` into the branch.
2. Rebuild `TauCetiRoadmap.OptimalTransport.Suggested` at Tau Ceti `2fd255d` / Mathlib `1b1ccf4`.
3. State the six third-list headlines on the carriers the docstring names, and delete that list.

Check: after the merge, `TauCeti/MeasureTheory/OptimalTransport/Pratelli.lean` exists and declares `mongeCost_eq_transportCost_of_continuous`.

## R02 (P3) — The README's Tau Ceti contracts name declarations and files that the branch's pinned Tau Ceti does not have

Re-raised: H02

Location: `TauCetiRoadmap/OptimalTransport/README.md:360–361`, "The following theorems of Tau Ceti prove targets of the layers below, which cite them".

Claim: the cited declarations exist at the pin of this branch's manifest.

Witness: these names occur in no file of `a91d3aa` and occur at `2fd255d`: `relaxedTransportCost`, `SatisfiesWeakMTW`, `boltzmannEntropy`, `sinkhornDivergence`, `cheegerEnergy`, and `mongeAmpereMeasure` (cited at :1459; 14 files at main's pin). H02 is right that every one resolves at main's pin. The defect is the same as R01's and lasts as long as the pin does.

Repair: the merge of R01. No README sentence needs to change for this finding.

## R03 (P3) — 4.5 writes the first-order condition with the sign of the source's `c`-convex potential, not this roadmap's `c`-concave one

Location: `TauCetiRoadmap/OptimalTransport/README.md:1227–1229`, "The mechanism is the first-order condition `∇u(x) + Dₓc(x,y) = 0` at a contact point where the potential is differentiable".

Claim: at a contact point of 4.5's dual potential, `∇u + Dₓc = 0`.

Witness: this README pins `φ x + ψ y ≤ c(x,y)` with `c`-concave potentials (:181, 2.1–2.2). At contact, `x' ↦ c(x',y) - φ(x')` is minimal at `x`, so `∇φ(x) = Dₓc(x,y)`. That is exactly Tau Ceti's `TauCeti.hasFDerivAt_eq_of_mem_contactSet` (`TauCeti/MeasureTheory/OptimalTransport/Twist/Basic.lean:100` at `a91d3aa`, :135 at `2fd255d`). The survey's Step 4 (`depf-survey` lines 1430–1432) writes `∇u + ∇ₓc = 0` for its `c`-convex `u`, which is `-φ`. On `ℝ`, take `U[0,1] → U[1,2]`, `c = (x-y)²/2`, `φ(x) = -x`, `ψ(y) = y - 1/2`. Then `c - φ - ψ = ((x-y)+1)²/2 ≥ 0`, with equality on `y = x+1`. Here `∇φ = -1 = Dₓc(x,x+1)`, while `∇φ + Dₓc = -2`. The head's sign also contradicts 7.2 (:1799–1801): for `c = d²/2`, `Dₓc = -exp_x⁻¹(y)` gives `y = exp_x(-∇φ(x))`, while `∇φ + Dₓc = 0` would give `exp_x(+∇φ(x))`.

Repair: write "the first-order condition `∇φ(x) = Dₓc(x,y)` at a contact point where the `c`-concave potential `φ` of Layer 2.2 is differentiable (Tau Ceti's `TauCeti.hasFDerivAt_eq_of_mem_contactSet`; the survey's (C1) and Step 4 write it as `∇u(x) + Dₓc(x,y) = 0` for its `c`-convex `u = -φ`)". Keep the locators as they are. Check on the refuting instance: `∇φ = -1 = x - (x+1)`.

## R04 (P3) — 3.7, 4.5, 6.7, 9.4 and 9.6 state theorems the pinned Tau Ceti proves, without citing them

Location: `TauCetiRoadmap/OptimalTransport/README.md:1099–1102` (3.7, "For every `p ∈ [1,∞]`, prove that `W_p` is the `Lᵖ(0,1)` distance of the two quantiles"). Also 4.5 (:1223–1226), 6.7 (:1566–1570), 9.4 (:2201–2214), 9.6 (:2267–2272), and their dependents 4.6 (:1239–1240), 9.1 (:2159–2160) and 11.6 (:2594–2596).

Claim: the Scope rule (:60–63) keeps implemented targets as specification and has each layer cite the Tau Ceti theorem that proves it, as 2.4, 2.7, 4.3 and 5.5 do. The pull request description says the same: "the implemented targets cite them at their subsections".

Witness: none of these subsections cites a Tau Ceti declaration, and the contract list (:360–450) names none of the following.

- **At both pins.**
  - 3.7: `TauCeti.wassersteinEDist_eq_eLpNorm_quantile_sub` (`…/OptimalTransport/Wasserstein/Rearrangement.lean:153`, :154 at `2fd255d`) proves `W_p = ‖Q_μ - Q_ν‖_{Lᵖ(0,1)}` for `1 ≤ p ≤ ∞` with no moment hypothesis. It comes with `MeasureTheory.Measure.isOptimalCoupling_quantileCoupling`, `MeasureTheory.Measure.quantile` and `measurePreserving_quantile` (`TauCeti/Probability/Quantile.lean`). The same theorem is 9.6's isometry.
  - 4.5–4.6: `TauCeti.hasFDerivAt_eq_of_mem_contactSet`, `TauCeti.ae_subsingleton_setOf_mem_contactSet` and `TauCeti.IsDualCertificate.ae_exists_condKernel_eq_dirac` (`…/Twist/Basic.lean`), and `TauCeti.IsDualCertificate.exists_optimal_transportMap_unique_ae` (`…/Twist/Map.lean:50`).
- **At main's pin `2fd255d`, the pin the contracts describe (R02).**
  - 9.4, verbatim: `TauCeti.IsGeneralizedGeodesicPlan.wassersteinEDist_sq_add_le` (`…/Wasserstein/GeneralizedGeodesic/Basic.lean:260`) and `…wassersteinEDist_sq_add_wassersteinEDist_sq_le` (:286), with `TauCeti.exists_isGeneralizedGeodesicPlan` (:146) and `TauCeti.generalizedGeodesic` (:170).
  - 11.6: `TauCeti.GeneralizedGeodesicallyConvex.add_edist_sq_div` and `….subsingleton_moreauYosidaResolvent` (`…/GeneralizedGeodesic/Convex.lean:178/258`).
  - 9.6: `TauCeti.WassersteinSpace.isometry_quantileLp` (`…/Quantile/Isometry.lean:130`), `TauCeti.WassersteinSpace.isGeodesicSegment_iff_coe_eq_quantileBarycenter` (`…/Quantile/Geodesic.lean:80`, `1 < p < ∞`) and `TauCeti.sum_mul_wassersteinEDist_sq_quantileBarycenter_le` (`…/Barycenter/Basic.lean:164`).
  - 6.7: `TauCeti.mongeAmpereMeasure_eq_withDensity_inv_add` (the lower bound, `TauCeti/Analysis/Convex/MongeAmpere/Transport.lean:273`), `TauCeti.mongeAmpereMeasure_eq_withDensity_inv_of_convex` (:331) and `TauCeti.exists_isKantorovichOptimalTransportMap_gradient_and_mongeAmpereMeasure_eq_withDensity` (`…/OptimalTransport/Brenier.lean:701`).

Repair:

- Add these declarations to "From Tau Ceti", each with the hypotheses it is consumed with.
- Add `Tau Ceti <name>` to the *Needs:* line and the citation of 3.7, 4.5, 4.6, 6.7, 9.1, 9.4, 9.6 and 11.6.
- Keep the statements and Checks as specification, as the Scope rule says.
- 6.7: keep as this roadmap's own clause only `∂u(X) ⊆ closure Y` for every Brenier potential. Tau Ceti's Brenier corollary instead chooses a potential whose subgradients all lie in the closed convex set.

Check: after the edit, each listed name occurs in the README, and `roadmaps resolve` finds it at main's pin.

## Previous findings

- R01 — not repaired: `Suggested.lean:23–24` still says fifteen headlines "are proved in the pinned Tau Ceti", and `lake-manifest.json` still pins `a91d3aa`. Held as R01 (Re-raised: H01).
- R02 — not repaired: the contracts at `README.md:360–450` still name `2fd255d`-only declarations (`mongeCost_eq_transportCost_of_continuous`, `GromovWassersteinSpace`, …). Held as R02 (Re-raised: H02).
- R03 — repaired: 13.13 now writes `ε Ent_{R^ε₀₁}(π) = (1/2)∫‖x-y‖²dπ + ε Ent_{vol⊗vol}(π) + ε(n/2)log(2πε)`. It defines `Ent_{R^ε₀₁}` as Layer 11.2's signed functional and records `klDiv π R¹₀₁ = 0` as the negative control (:3209–3250).
- R04 — repaired: 11.6 reads "for the `1`-convexity of `W₂(μ,·)²/2` along interpolating curves with base `μ` (Layer 9.4; … which is `λ = 2` in the Conventions)" (:2602–2604).
- R05 — repaired:
  - 6.7 states the bound `MA_u(A) ≥ ∫_A f/g(∇u) dx`, and for convex `Y` the inclusion `∂u(X) ⊆ closure Y` and `λ² Leb ≤ MA_u ≤ λ⁻² Leb`, with three Checks.
  - 9.4 states the inequality with its constant.
  - 4.5, 6.6 and 9.6 now carry locators.
  - The 4.5 sentence introduced a sign problem (R03), and three of the new statements are uncited Tau Ceti theorems (R04).
- R06 — repaired: "[DifferentialGeometry] …, Layer 12, items 12.2--12.5: … and the divergence theorem (Layers 8.9, 11.10 and 14.6)" (:461–464), and the same range at :72–73.

## Verified sound

**Gate and build.**
- The gate rerun on this head gives `set_option=0 … depcheck=0 metadata=0 stray-files=0 dirty=0 outside-folder=0 source-material=0 OK`, and the worker's gate gives `build=0`.
- `git diff --stat origin/main...HEAD` touches only `TauCetiRoadmap/OptimalTransport/README.md` and `Suggested.lean`.
- `lake env lean` on `Suggested.lean` at the branch pins exits 0. It gives eight `sorry` warnings (:110, :134, :163, :199, :223, :245, :262, :284) and nothing else.
- `Suggested.lean` is byte-identical to `e67f050`, so the r4 `#check @name` comparison of all eight signatures still stands and the r4 one-tactic probe (no padding) still applies.

**Dependency check.** The command printed:

```
depcheck: 233 roadmaps, 2263 edges, 0 problem(s)
```

There is no UPWARD or CYCLE line.

**Overlaps and citations.**
- `overlaps.md` lists no conflicting head, no dropped id, and no id that only a revision defines.
- DifferentialGeometry 12.5 "Divergence theorem and Green" is at `TauCetiRoadmap/DifferentialGeometry/README.md:930` on main (`2bbd3cbf`) and at :2914 of its open head (`4753cef1`), so R06's range resolves at both.
- The repairs add no object to own: the new 6.7, 9.4 and 9.6 statements are Tau Ceti's (R04).

**New locators opened at the text (12).**

| Locator | Text | Result |
|---|---|---|
| 3.7, 9.6: Peyré–Cuturi Remark 2.30, (2.34)–(2.36) | `peyre-cuturi` lines 1422–1439; PDF pp. 35–36 = printed 31–32 | correct |
| 9.6: (7.7) | line 4443, printed p. 104 | `C⁻¹_{α_t} = (1-t)C⁻¹_{α₀} + tC⁻¹_{α₁}`; correct |
| 9.6: Remark 9.6 | lines 6007–6024, printed p. 143 | for `p = 2` the barycentric map is the weighted mean; correct |
| 4.5: (C0)–(C1) | `depf-survey` lines 1275–1276, p. 29 | (C0) is a bounded `C⁴` norm on open `X × Y`; correct |
| 4.5: Theorem 3.6 and Step 4 | lines 1326–1331 (p. 30), 1422–1435 (p. 32) | Step 4 uses only an absolutely continuous first marginal, as 4.5 says; sign in R03 |
| 6.6: Theorem 3.1, (3.3) | lines 954–962, p. 23 | compact supports, absolutely continuous source; (3.3) needs `ν = g dy`, which 6.6's equation carries |
| 6.6: Theorem 3.2 | lines 1028–1034, p. 24 | correct |
| 6.6: (3.4)–(3.5) | lines 1048–1050, p. 24 | correct |
| 6.6, 6.7: Theorem 3.3 proof, Steps 1–3 | lines 1111–1191, pp. 26–27 | Step 1 needs no convexity of `Y`; Step 3 gives `∂u(X) ⊆ Ȳ`; correct |
| 6.7: §3.2 | lines 1076–1097, p. 25 | correct; half-disc example at lines 1055–1068 (pp. 24–25) |
| 9.4, 11.6: Definition 3.29 | `ambrosio-gigli-guide` lines 3667–3671, p. 70 | regular base; correct |
| 9.4, 11.6: (3.43) | line 3679, p. 71 | remainder `t(1-t)W₂²(ν₀,ν₁)`; correct |

**The seeded sample.** None of the fifteen sampled targets lies in the changed passages, so per the incremental rules they were not re-verified. I checked the two that depend on changed text:
- 11.7's *Needs:* "items 5--6; Layer 10.5" (:2620) still covers the changed 11.6.
- 12.3 does not consume 9.6 (its *Needs:* is items 1–2, Layer 0.5 and `TauCeti.WassersteinSpace`, :2793).

**Library declarations opened (this round).**
- Mathlib `6b7abb3`: `InformationTheory.klDiv` (`KullbackLeibler/Basic.lean:56–59`), which takes arbitrary measures, so the 13.13 Check's `ofReal(… + 0 - 1) = 0` is right.
- Tau Ceti `a91d3aa`: `Twist/Basic.lean:100/134/170/208/232`, `Twist/Map.lean:50`, `Wasserstein/Rearrangement.lean:153/183/195/212`, `Wasserstein/Quantile.lean:65`, `Probability/Quantile.lean:101/209/245`. I also confirmed that `a91d3aa` has no `GeneralizedGeodesic`, `MongeAmpere`, `relaxedTransportCost` or `boltzmannEntropy`.
- Tau Ceti `2fd255d`: `GeneralizedGeodesic/Basic.lean:97/146/170/225/260/286`, `GeneralizedGeodesic/Convex.lean:100/178/226/258`, `Quantile/Isometry.lean:130`, `Quantile/Geodesic.lean:63/80`, `Barycenter/Basic.lean:91/164/174`, `MongeAmpere/Transport.lean:104/273/305/331`, `Brenier.lean:701`, `Twist/Basic.lean:135`.

**Adversarial table.** Rows marked (r4) are carried from the previous report for statements this diff leaves untouched, with the values computed there. The other rows are new, for the changed statements.

| Statement | Instance | Values | Result |
|---|---|---|---|
| (r4) H1 Gangbo–McCann 5.8 | `h=x²`, `U[0,1]→U[1,2]`; `h=\|x\|` | `T=x+1`, cost `1`; `x+1` and `2-x` both cost `1` | holds; `h_strict` load-bearing |
| (r4) H2 Caffarelli 6.8 | `Y=(0,2)`; `Y=(0,1)∪(2,3)` | `T=2x`, Hölder `C=2`; jump `1` at `1/2` | holds; `hYc` load-bearing |
| (r4) H3 DPF 6.15 | `c=2-⟨x,y⟩`, disc→half-discs; `c≡0` | `S_X` the diameter; `-Dₓc=0` not injective | holds; twist excludes `c≡0` |
| (r4) H4 McCann 7.3 | `U[0,1]→δ₂`; `δ₀` on the circle | cost `7/6`; no map | holds; `hμ` load-bearing |
| (r4) H5 Figalli 7.6 | `U[0,1]→U[1,2]`, `\|x-y\|` | both maps cost `1` | existence only, as stated |
| (r4) H6 Agueh–Carlier 12.7 | `U[0,1]`, `δ₂`; perpendicular segments | barycenter `U[1,3/2]`, value `7/12`; two optima, each `1/6` | holds; dimension hypothesis load-bearing |
| (r4) H7 Gaussian 12.8 | `C=(1,4)`; `C=(1,0)` | `S=9/4`; `S=1/4` | holds |
| (r4) H8 Nutz 13.3 | two-point `μ⊗ν`; diagonal `R` | `(a,-a)` family; two free constants | holds; `hμνR` load-bearing |
| (r4) 2.4, 3.4, 4.1, 5.2, 13.1, 14.2, 15.5 | as in r4 | `1/2=1/2`; `W₁=1/n→0` vs `W₂²=1`; `∞` vs `1/2`; Gibbs identity; `GW_p=2^{-1/p}\|a-b\|` | hold |
| (r4) 11.8 fast diffusion | `n=1,2,3`; `m=1/4`, `m=1/2` tails | thresholds `0`, `1/2`, `2/3`; `∫ρ^m=∞` | range correct |
| 3.7 quantile formula | `δ₀` vs `(δ₀+δ₂)/2`; `μ=ν=(δ₀+δ₁)/2` | `Q=0` on `(0,1/2]`, `2` after, `∫\|Q\|=1=W₁`; antitone cost `1` vs `0` | Checks true; Tau Ceti proves it (R04) |
| 4.5 first-order condition | `U[0,1]→U[1,2]`, `c=(x-y)²/2`, `φ=-x`, `ψ=y-1/2` | `c-φ-ψ=((x-y)+1)²/2≥0`, contact `y=x+1`; `∇φ=-1=Dₓc`; `∇φ+Dₓc=-2` | head's sign false for `φ` (R03) |
| 4.5 against 7.2 | `c=d²/2` | `Dₓc=-exp_x⁻¹y`; correct sign gives `y=exp_x(-∇φ)` as 7.2 says, head's gives `exp_x(+∇φ)` | R03 |
| 6.6 orientation | `u=x²`, `U[0,1]→U[0,2]` | `g(∇u)det D²u=(1/2)·2=1=f`; (3.3): `\|T'\|=f/g(T)=2` | holds |
| 6.7, convex `Y`, disconnected `X` | `X=(0,1)∪(2,3)`, `Y=(0,2)`, `f=g=1/2` | `T=x`, `x-1`; `∂u(X)=(0,1)∪(1,2)⊆[0,2]`; `f/g=1`, `MA_u=Leb` | equality holds |
| 6.7, non-convex `Y`, `n=1` | `X=(0,2)`, `Y=(0,1)∪(2,3)`, `f=g=1/2` | `∂u(1)=[1,2]`, `MA_u({1})=1`; lower bound `1≥0`; upper `λ⁻²·0=0<1` | upper bound needs convexity, as stated |
| 6.7 Check 2 | `B₁`, half-discs `±e₁`, `f=g=1/π`, `λ=1/π` | `det D²u=1` a.e.; `∂u({0}×(-1,1))=[-1,1]×(-1,1)`, area `4`; `λ⁻²·0=0` | Check true |
| 9.4 Checks | `δ₀,δ₀,δ₁`; `δ₀,δ₋₁,δ₁` | `t²=t-t(1-t)`; halved `t/2+t²/2>t²` on `(0,1)`; doubled at `1/2`: `1/4≤0` false; `(2t-1)²=1-4t+4t²` | hold |
| 9.4 normalization | `W₂²` vs `W₂²/2` | remainder `t(1-t)W₂²=(λ/2)t(1-t)W₂²` gives `λ=2` and `λ=1` | matches Conventions :214–215 |
| 9.6 Checks | `δ₀→(δ₀+δ₂)/2`; `δ₀,δ₂` at `1/2`; antitone | `2t²=t²·2`; `δ₁` value `1` vs mixture `2`; `‖Q(·)-Q(1-·)‖₂=2`, `W₂(μ,μ)=0` | hold |
| 9.6 barycenter, unequal weights | `δ₀,δ₂`, weights `1/4,3/4` | quantile `3/2`; `(1/4)x²+(3/4)(x-2)²` minimal at `x=3/2`, value `3/4` | holds |
| 11.6 step and constant | `Φ=∫x²/2`, `δ_a`; penalty `W₂²/(2τ)` | `x+(x-a)/τ=0 ⇒ a/(1+τ)`; `(1/τ)·(W₂²/2)` is `1/τ`-convex | hold |
| 13.13 identity | `π=N(0,I₂)`, `n=1`, `ε=1` | right `1-log(2πe)+½log(2π)=-½log(2π)≈-0.919`; left `E[-½log2π-(x²+y²)/2+(x-y)²/2]=-½log2π-1+1` | equal |
| 13.13 derivation | general `n`, `ε` | `log(dπ/dR)=log ρ_π+(n/2)log(2πε)+‖x-y‖²/(2ε)` | identity holds on the plan domain |
| 13.13 `klDiv` control | same `π` | Mathlib: `ν.real univ=0` for `ν univ=∞`, so `ofReal(-0.919+0-1)=0` | Check true |
| 13.13 guardrail | `δ_{(a,b)}` | not `≪ R^ε₀₁`; 11.2 sets `Ent=∞`; cost `‖a-b‖²/2` | holds |

**Remarks on untouched text (no change requested).**
- 13.13's *Needs:* (:3235) omits Layer 11.2, which its statement uses directly; it is reached through item 12.
- 6.5's weighted identity `MA_{u,g} = f dx` is `TauCeti.mongeAmpereMeasure_eq_of_hasLaw` (`MongeAmpere/Transport.lean:104`) at main's pin, also uncited.

## Not verifiable

- Ambrosio–Gigli–Savaré, *Gradient Flows*, §9.2, Lemma 9.2.1 (9.4, general base): paywalled, recorded `uncertified`. Main's Tau Ceti cites the same lemma in the docstring of `GeneralizedGeodesic/Basic.lean`, which is consistent with the locator but is not a reading of the text.
- Villani 2009, Chapter 10 (4.5, the general statement): paywalled, not in the sources cache.
- Ownership against open pull requests was checked through `overlaps.md` only; the five closest open roadmaps were not read in full.

## Source issues

- **Error** in peyre-cuturi at Remark 2.30, p. 32: the source says the quantile isometry makes `W_p` on the line a Hilbertian metric for every `p ≥ 1`; it should say this only for `p = 2` (`W₁` among `(δ_a+δ_b)/2`, `a∈{0,1}`, `b∈{10,11}`: diagonals `1`, sides `1/2`); affects nothing.
- **Misprint** in ambrosio-gigli-guide at the proof of (3.43), p. 71: the source writes the squared `L²(μ)` norm of `(1-t)T₀ + tT₁` for `W₂²(μ,ν_t)`; it should be the norm of `(1-t)T₀ + tT₁ - Id`; affects nothing.
- **Misprint** in depf-survey at §3.2, p. 25 (already recorded in the previous review): the singular part of the Monge–Ampère measure of `|x|²/2 + |x₁|` is twice the length measure on the diameter, not once; affects nothing.
