<!-- from @CBirkbeck, https://github.com/TauCetiProject/TauCetiRoadmapJobs/pull/957#issuecomment-6393486333 -->
Red team round 2 pass b (claude) of 0afb099

Verdict: needs changes

1. **F01** (P3) Repair r1a F04 moved every Theorem 4.10 locator into the wrong Teschl section

   - Location: `packages/CongruenceSpectralGap/README.md:30` ("§4.4, p.119"), :199, :221, :277 ("§4.4, Theorem 4.10"), :753, :772, :800 ("§4.4, Theorem 4.10 and the form-domain observation p.119"); `sources.toml:26` ("sections 2.3 and 4.4").
   - Claim: Theorem 4.10 (min–max) and its form-domain remark are in Teschl §4.4.
   - Witness: teschl line 4991 is the section heading "4.3. The min-max theorem"; Theorem 4.10 at line 5044 and the remark at 5053 follow it; the heading "4.4. Estimating eigenspaces" is at line 5060, after Corollary 4.11. Line 5043 ("4.4. Estimating eigenspaces 119"), which r1a took for a heading, directly follows the `=== page 131 ===` marker and is the running head of p.119, exactly like line 2963 ("72 2. Self-adjointness and spectrum") after the page-84 marker. The round-1 repair applied the wrong section everywhere and declared r1b's correct attribution "incorrect".
   - Repair: replace "§4.4" by "§4.3" at README:30, :199, :221, :277, :753, :772, :800 and in `sources.toml:26` ("sections 2.3 and 4.3"); keep theorem number, p.119 and the line locators. Tested: §4.3 begins at line 4991 (p.117) and contains lines 5044–5055 on p.119.

2. **F02** (P3) The two new §4.2b targets are stated below the generality of their sources

   - Location: `packages/CongruenceSpectralGap/README.md:577` ("Let p be a prime, S an excellent noetherian scheme over 𝔽_p"); :567 ("over an algebraically closed field of characteristic p>0 … Σx∈C∖U Sw_x(L)").
   - Claim: the Swan-constancy criterion is a statement about 𝔽_p-schemes; the curve Euler–Poincaré formula is a statement over algebraically closed fields.
   - Witness: laumon-swan lines 391–395 take S any excellent noetherian scheme and ℓ invertible on S, with no characteristic restriction (Théorème 2.1.1 at line 413, Corollaire 2.1.2 at 423); katz-gkm line 1352–1358 states the formula for a curve over a field k with each closed point of C∖U weighted by its residue degree over k. The brief forbids narrowing a statement below what the sources support; the roadmap's own use (S=𝔾ₘ over a finite field, geometric fibres) is an instance.
   - Repair: at :577 write "Let S be an excellent noetherian scheme and ℓ a prime invertible on S, f:C→S a smooth proper morphism of relative dimension one, …" and add after the conductor-function sentence: "On a fibre of residue characteristic zero every Swan conductor is zero and a_L(s)=r·#D_s̄." At :567 write "For a smooth connected curve U over a perfect field k with smooth proper completion C, ℓ invertible in k and a lisse finite-dimensional Eλ-sheaf L, prove χ_c(U⊗k̄,L)=rank(L)χ_c(U⊗k̄,Eλ)−Σ_{x∈C∖U} deg_k(x)·Sw_x(L)", keeping χ_c(U⊗k̄,Eλ)=2−2g(C)−Σ deg_k(x), and add the Check "Over 𝔽_q with one closed boundary point of degree 2 and L of rank one with Swan 1 there, the sum contributes 2·1; over 𝔽̄_q the same point splits into two points of Swan 1 each." Tested: for k algebraically closed every degree is 1 and both formulas reduce to the current text; the Checks at :571–573 and :581–584 are unchanged.

3. **F03** (P3) The later owner-candidate of the raw Kloosterman sum is not named; it restates §§4.2a–4.2b

   - Location: `packages/CongruenceSpectralGap/README.md:786` ("rigid Bessel realizations consume the same scalar normalization"); :19 ("Rigid realizations … belong to downstream roadmaps").
   - Claim: this roadmap owns the raw all-rank hyper-Kloosterman sum and its numerical Deligne bound, and the rigid consumer is downstream.
   - Witness: PadicDifferentialEquationsAndRigidCohomology (#1002, merge position 139, after this roadmap at 107) declares in its `Suggested.lean:99` `RD6.kloostermanSum ψ n z = Σ_{x∈(Fˣ)ⁿ} ψ(Σxᵢ + z·(Πxᵢ)⁻¹)` and at :107 `kloostermanSum_bound`: `‖kloostermanSum ψ n z‖ ≤ (n+1)·√|F|ⁿ`; its README :14659 and :14727 state them as its own. These are `hyperKloosterman F (n+1) ψ z` (eliminate the last unit) and `hyperKloosterman_bound` at k=n+1, k·|F|^((k−1)/2)=(n+1)|F|^(n/2). Checked at F=𝔽₃, n=1, z=1: both sums give ψ(2)+ψ(1)=−1. This roadmap is the owner by the merge order; the consumer must cite, not restate, and its name belongs in the consumers paragraph so the intake can route it.
   - Repair: at :786 replace "rigid Bessel realizations consume the same scalar normalization" by "PadicDifferentialEquationsAndRigidCohomology RD.6.95–RD.6.97 consumes the raw sum and bound: its rank-(n+1) sum with the last unit eliminated equals `hyperKloosterman` at rank n+1, and its bound (n+1)|F|^(n/2) is `hyperKloosterman_bound` at k=n+1." Maintainer consequence (outside this package): #1002's `RD6.kloostermanSum` and `kloostermanSum_bound` duplicate this file; the KloostermanSheavesAndBesselIsocrystals design (:5) assigns the scalar sum to KloostermanMomentsAndPotentialAutomorphy (position 256), contradicting this earlier owner.

4. **F04** (P3) Two roadmaps carry the title "Automorphic spectral theory and trace distributions, Part II"

   - Location: `packages/CongruenceSpectralGap/README.md:1` ("# Roadmap: automorphic spectral theory and trace distributions, Part II: the congruence spectral gap"); :7 ("This is Part II of TauCetiRoadmap.AutomorphicSpectralTheory").
   - Claim: this roadmap is the Part II of AutomorphicSpectralTheory.
   - Witness: the board package `AutomorphicSpectralTheoryPartII` (`design/README.md:1`) is titled "Automorphic spectral theory and trace distributions, Part II" and its supplier table (:39) routes "Congruence gap 21/100" to "CongruenceSpectralGap:CSG.0–CSG.5; no duplicate LRS or Laplacian development". No object is owned twice, but two roadmaps claim the same Part II designation of one base, and the folder name `CongruenceSpectralGap` does not match its title.
   - Repair: at :1 write "# Roadmap: the congruence spectral gap (an extension of automorphic spectral theory and trace distributions)"; at :7 write "This extends TauCetiRoadmap.AutomorphicSpectralTheory; the roadmap AutomorphicSpectralTheoryPartII extends the same base in the Schwartz-multiplier direction and imports the congruence gap from here." Tested: the depcheck edge set is unchanged by a title; the sentence names no supplier.

5. **F05** (P3) A §0.4 Check is the roadmap's end theorem

   - Location: `packages/CongruenceSpectralGap/README.md:219` ("For every allowed Γ, 21/100≤λ′₁(Γ); a definition that retains the constant eigenvalue and returns zero fails.").
   - Claim: a Check of the definition of λ′₁(Γ).
   - Witness: the statement is §5.3's headline (:718) and needs Layers 0–5; it cannot be evaluated against the definition of §0.4, and it is a forward reference of the kind r1b F05 removed from the same section. The discriminating content (constants removed versus retained) is computable in the model already used at :217: there the infimum over all nonzero vectors is 0 (constant line) and over mean-zero vectors it is 21/100.
   - Repair: replace :219 by "In the model of the first Check, the Rayleigh infimum over all nonzero vectors is 0, attained on the constant line, while over the mean-zero vectors it is 21/100; a definition that retains the constant line returns 0." Tested: diag(0,21/100,1/4): (0,.21,.25) on the three coordinate vectors, min over mean-zero (first coordinate 0) is .21.

Round 2. Files read in full: `packages/CongruenceSpectralGap/README.md` (801 lines), `packages/CongruenceSpectralGap/Suggested.lean` (83 lines), `sources.toml`, the `gaps` list of `design/plan.json`, both round-1 passes and the round-1 repair report. The diff `origin/main...HEAD` touches only `packages/CongruenceSpectralGap/` (8 files). Suppliers on main were read in the content checkout; PR-stage suppliers at their heads through `roadmaps show`; Mathlib and Tau Ceti at the pinned commits (`6b7abb3c`, `a91d3aaf`) through `git show` from a local object store. No Lean was elaborated (the board checkout has no pinned Lake packages): not built.

## Round-1 findings at this head

| Finding | Status | Witness at 0afb099 |
|---|---|---|
| r1a F01 (P3) level-one area attributed to FO Layer 2 | repaired | README:62 "Layer 6, item 1, supplies the level-one modular polygon and signature; together these give area π/3"; also :12, :26, :138, :152, :154, :287. Main `TauCetiRoadmap/FuchsianOrbifolds/README.md:235` (Layer 2, Gauss–Bonnet) and :344–349 (Layer 6 item 1, signature) exist as cited. 2π(−2+1+1/2+2/3)=π/3 recomputed. |
| r1a F02 (P3) three zero Checks | repaired | §0.2 Checks :173–175, §0.3 :195–197, §3.2 :446–448 each keep three discriminating bullets; the zero bullets are gone; the G=0 law survives only as API at :441. |
| r1a F03 (P1) unowned conductor inputs | repaired | New bold targets at :567 (Curve Euler–Poincaré) and :577 (Swan-constancy criterion), route at :588, contracts at :19 and :120. Suppliers exist: AGR §3.1 at #856 line 2448 (perfect-residue setting, Check with F̄_p((t))), §3.7 at line 2741/2753 (break m, Sw=m); IGAFG target at #850 line 6590 (𝔽_ℓ coefficients, Swan term). laumon-swan lines 395/413/423/432 and katz-gkm lines 1352/2469/2486/2489/2812/2816 verified. The new statements are narrower than their sources: S02. |
| r1a F04 (P3) Teschl §4.3 → §4.4 | not repaired: the repair introduced an error | The original §4.3 was correct; see S01. |
| r1b F01 (P2) boundary continuity in gap | repaired | README:98 and `plan.json` gap `all-prime-self-pair-positivity` no longer ask for boundary continuity; :365 derives it from AL.3 *Continuation and the Rankin–Selberg pole criterion* (#924 line 2239) and *Rankin–Selberg nonvanishing on the boundary* (line 2263); new Check :373 recomputed (shifts 2/5,0,0,−2/5; Re ≥ 3/5 on Re s ≥ 1). |
| r1b F02 (P3) manifest sentence | repaired | :796 ends at "Proposition 3.1 pp.395–399."; no manifest sentence. |
| r1b F03 (P3) unread-display attribution | repaired | :790 states the multiplicative-mass and full principal-subtraction conventions without page attribution. |
| r1b F04 (P3) proof-irrelevance "independence" | repaired | :136 "Prove independence of F, and prove 0<μΓ(XΓ)<∞."; API list :142–143 has no proof-independence bullet. |
| r1b F05 (P3) §0.4 → §0.6 forward reference | repaired (applied differently) | :205 "Prove 0≤λ′₁(Γ)."; :223 Needs no longer names §0.6 or §4.8; :269 states λ′₁(Γ)≤1/4 in §0.7 with :279 carrying §4.8 and the gap; :132 updated. Replacement Check :217 recomputed: (21/100)/1=(21/25)/4=21/100 and the wrong first-power denominator gives (21/25)/2=21/50. |
| r1b F06 (P3) Γ₀(N) agreement unnamed | repaired | :168 names `modular_laplacian_realization`; AST §1.16a at #925 line 1315 constructs it for N≥1 on Γ₀(N)/{±I}\ℍ with the same form; −I∈Γ₀(N) for every N. |
| r1b F07 (P3) `LFunctions.AnalyticLFunctionData` owner | repaired | :18, :102, :104–106, :496 name LFunctions Layer 0; #248 `Suggested.lean` lines 76, 121, 127, 133, 139 declare the record and all four predicates, including `HasAverageCoefficientBound` (:139, field `coeff_avg`). |
| r1b F08 (P3) finite-place bound and §7.1a | not actionable (settled) | :22 names AST §7.1a as owner (#925 line 3793 proves the finite-place LRS bound and declares its route "constructed here"); the reason (the base roadmap's route cannot be edited from this package) holds; not re-raised. |

## Verified sound

Counts: 4 declarations read (1 def, 3 theorems); 31 target statements read (§§0.1–0.7, 1.1–1.3, 2.1–2.2, 3.1–3.4, 4.1–4.5 with 4.2a and the three bold targets of 4.2b, 5.1–5.5); 32 source-line locators verified in the five certified texts, with their printed pages; 41 Checks and worked values recomputed (table); 69 supplier citations resolved (sections and backticked names) on main or at the open heads; 17 Mathlib and 7 Tau Ceti declarations read at the pins; the depcheck and resolver run at this head.

- **Mechanical checks.** `gate --depcheck … --movable` printed exactly `depcheck: 48 roadmaps, 545 edges, 0 problem(s)` with no UPWARD, CYCLE or moved line. `roadmaps resolve` found no cross-roadmap citation and no Lean name nowhere. Policy: no `lemma`, `set_option`, `#eval`, `#print`, `True` placeholder, sorry'd data or pull-request number in the README or Lean file; single `import Mathlib`; `theorem` throughout; every target carries a locator; the only process-flavoured sentence (manifest status) was removed in round 1.
- **Lean statements, true as typed.** `hyperKloosterman` (total at k=0: 1 at r=1, else 0; k=1 gives ψ(r)). `hyperKloosterman_bound`: Deligne's bound k|F|^((k−1)/2) for ψ≠1, k≥1, unit r, every characteristic (katz-gkm line 1892–1912: rank Σb′ᵢ with bᵢ=b′ᵢpⁿⁱ, so bᵢ=1 gives rank k; weight n−1; trace sign (−1)^(n−1)); guards necessary: 𝔽₅, k=3, trivial ψ gives 16>15; k=0, r=1 gives 1>0. `gauss_power_even_average_bound`: the identity Σ_{χ even≠1}χ̄(r)τ(χ)^k=((q−1)/2)(Kl_k(r)+Kl_k(−r))−(−1)^k rederived from `sum_characters_eq` and Σ_u Kl_k(u)=(Σ_{x≠0}ψ(x))^k=(−1)^k; the bound (q−1)k q^((k−1)/2)+1 follows by the triangle inequality; q=3 gives an empty sum; q=5, k=2 gives ±5≤8√5+1; q=7, k=0 gives 2>1, so k≥1 is needed. `congruence_eigenvalue_bound`: a bounded C² invariant eigenfunction is L² on the finite-area quotient, lies in the maximal domain (= Friedrichs domain by essential self-adjointness on a torsion-free cover), λ=0 forces constancy, λ≠0 forces mean zero, and the residual spectrum of a congruence quotient is the constants, so λ≥λ′₁(Γ); u=1 (λ=0, excluded by `hnc`), E(z,3/2) (λ=−3/4, excluded by `hbdd`), Γ={1}, u=exp(iz) (λ=0, excluded by `hΓ`); sign fixed by −y²Δyˢ=s(1−s)yˢ. No `variable` block, so no binder can be lost; the repair report's `#check @` record agrees with the README statements (not re-elaborated here).
- **Headlines and padding.** Headlines: λ′₁(Γ)≥21/100 (§5.3), the LRS parameter bound (§5.1), the first moment and nonvanishing (§§4.4–4.5), the two-kernel equation (§3.4), the hyper-Kloosterman bound (§4.2b), the Gauss-power average (§4.3), the Rayleigh inequality and rescaling (§§5.4–5.5), the sheaf realization and the two curve targets (§4.2b). Neither Mathlib nor Tau Ceti has a Kloosterman sum, automorphic representation, Maass form or ℓ-adic sheaf at the pins (grepped), so the docstring's not-statable list (lines 9–27) is complete and correct, and the three stated theorems are the statable headlines. One-tactic probe by reading: none follows from one library lemma; no boundary-case, Check-mirroring or value-computing declaration. The exact Gauss identity and the §3.1 inversion are elementary intermediates and correctly stay in the README.
- **Gaps.** The seven slugs agree verbatim between `plan.json` and the README contracts, each under its supplier's subsection. Minimality rechecked at the heads: AFRG #1037 has no principal-level K(N) or Γ(N) content; AST #925 has no principal-level spectral realization (§4.8 is level one, §1.16a is Γ₀(N)); UO-D06 (#1027 line 172–225) gives closed forms, Friedrichs extension and a form-core/graph-core comparison but no Rayleigh-infima equality; AL #924 has no self-pair coefficient positivity, no unramified-character transport at ramified places, and no `AnalyticLFunctionData` bridge; DWP #929 §7.12 (line 2618) is the Weil II weight bound and DWP has no Artin–Schreier sheaf. No gap asks for what is provided.
- **Suppliers resolved** (all present, as described): FO Layers 0–3 and 6.1; DG Layer 12 (main :910); PDE Lane A.1 (:223) and E.20 (:327); SAST SA-C01–C04 (:799) and SA-E01–E13 (:1202–1230); UO-A01–A03 (:23–25), UO-D06 (:172); AST §§0.6, 0.7, 1.16, 1.16a, 4.3, 4.4, 4.6, 4.8, 4.14a, 7.1a (#925 :191, :208, :1286, :1313, :2352, :2363, :2395, :2417, :2522, :3793); AFRG §§2.5–2.7, 3.1 (`classicalEquiv`, :500), 3.4–3.5, 4.5 (`MaassCuspForm`, :681; `maassClassicalEquiv`, :688); ALS.F.6 (#871 :898, with (iii) cusp form ⇔ bounded ⇔ square-integrable); GNF Layers 6, 9 (`HeckeCharacter.shift`, `unitaryPart`), 10; GL2 R17.4.13 (#931 :2144); AL.1 *Canonical archimedean factors* (:1337), AL.3 *Global Whittaker factorization* (:2141), *Rankin–Selberg local L-factor* (:2044), *Nonarchimedean factors under normalized induction* (:2071), *local Rankin–Selberg functional equation* (:2082), *Continuation and the pole criterion* (:2239), *global functional equation* (:2250), *nonvanishing on the boundary* (:2263), `LDatum` (:2338), `IsNicePinned` (:2360), `rsDatum` (:2373); LFunctions Layer 0 (#248 :320, record and four predicates); ZoL Layer 1 items 2–5 (#253 :475–, item 5 asymptotic −(πd/4)|t|+A(σ)log|t|+O(1)) and Layer 3 items 1–3 (:672–, strip bound polynomial in the analytic conductor), `continuedL`; DWP §7.12, DWP.10 (:3595); ECF F.0–F.6 (main :175–1200), F.10.1, F.10.2, F.10.2b (:907, :940, :1108); AGR §3.1, §3.7; IGAFG Euler-characteristic target; ADS Layer 6 (Completed :256); ANT-I §3.26 (#1126 :2947). Direction: every supplier is on main, Completed, earlier in the order (AGR 52, IGAFG 54, ECF 20, ALS 79, AFRG 80, DWP 95, AL 96, AST 98, ANT-I 99, GL2 106) or an open new-roadmap pull request by another author (LFunctions #248, ZoL #253, UO #1027); roadmaps named only as consumers (GeometricFreyMazur 108, KloostermanMomentsAndPotentialAutomorphy 256) create no edge. EDPS §5.2 `curveEulerPoincareSwan` (#1040, position 123) remains the later planner of the curve formula; the move of that target to §4.2b is recorded in the round-1 repair and is consistent with the merge order.
- **Ownership against open work.** `roadmaps grep` over main and all 352 open heads: no other `Suggested.lean` mentions `IsCongruenceSubgroup`; no README states a 21/100 bound except this one and its two consumers; no roadmap states the Swan-constancy criterion or a rational-adic Euler–Poincaré formula on curves earlier than this one (LPVC #873 cites Vidal's Swan paper in its references only). The one Lean-level overlap is S03.
- **Sources.** laumon-swan: setup on p.185 (line 391–402), Théorème 2.1.1 p.186 (line 413, conductor function Σ(Sw+rank) at line 406–407), Corollaire 2.1.2 and Remarque 2.1.3 p.187 (lines 423, 427–437). katz-gkm: 2.3.1 p.32 (1352), §4.0 pp.47–48 (1845, 1871), 4.1.1 pp.48–49 (1892–1912), §4.3 p.59 (2266), 5.1(1)–(8) pp.63–64 (2392, 2412, 2424), 5.2.1 and proof pp.65–66 (2460, 2469, 2486, 2489), 5.2.4 p.76 (2812, 2816). teschl: 2.12 p.70 (2914), 2.13 pp.71–72 (2960), 4.10 p.119 (5044), form-domain remark (5053); section number: S01. bms02: §2.1 p.4 (151), Assumption B p.5 (196), Corollary 2.10 p.7 (245). gj78: 3.1.3 and 3.2 pp.485–486 (528, 538), §3.7 p.491 (721), 9.3 p.534 (2151), 9.9 p.541 (2384). All page numbers checked against the running heads of the extractions.

### Adversarial pass (computed values)

| Statement | Instances | Values on each side | Result |
|---|---|---|---|
| §0.1 areas | Γ(1), Γ(2), Γ(3) | π/3; 6·π/3=2π (−I∈Γ(2)); 12·π/3=4π (−I∉Γ(3)) | pass |
| §0.1 signature | g=0, c=1, orders 2,3 | 2π(−2+1+1/2+2/3)=π/3 | pass |
| §0.2 sign | 1, y², yˢ | 0; −2y²; s(1−s)yˢ, 1/4+t² at s=1/2+it | pass |
| §0.2 torsion-free cover | N=1,2,3 | N′=3,6,9≥3, −I excluded, normal, complete | pass |
| §0.2 Γ₀(N) kernel | N=1,2 | −I∈Γ₀(N); kernel {±I} | pass |
| §0.3 mean | 1, i, b−B/A | A, iA, 0 | pass |
| §0.4 Check :217 | u, 2iu | .21/1; .84/4=.21; wrong denominator .84/2=.42 | pass |
| §0.4 Check :219 | all vs mean-zero in model | 0 vs .21 | forward reference: S05 |
| §0.5 clipping | ∅, {.21}, {1/3} | .25, .21, .25 | pass |
| §0.6 cusps | Γ(1), Γ(2) | 1; 3, (1/2π)·2π=1 | pass |
| §0.7 | SΓ=∅, {.21}, eigenvalue .25 only | .25, .21, .25 | pass |
| §1.1 | r=1/5 (ε=0,1), 0, 1/2 | .21, .21; .25; 0 | pass; weight-0 K-type forces common parity |
| §1.2 | σ=0,1 | central exponent 0, 2 | pass |
| §1.3 adjoint | (sgn^ε|·|^r, sgn^ε|·|^−r) | ratios |·|^{2r},1,|·|^{−2r}, O(3)-spherical; m=3 bound 2r≤2/5 | pass |
| §2.1 ε at 1/2 | f, q, d | f^{1/2}q^{d/2}(fq^d)^{−1/2}=1 | pass |
| §2.1 boundary | μ=±1/5, Re s≥1 | gamma arguments Re ≥ 3/5>0; sole boundary pole at 1 | pass (repair r1b F01) |
| §2.1 dual factor | {μ_j} unitary | ∏Γℝ(s−conj μ_j−μ_k)=A(s) | pass |
| §2.2 | r=1/5 | pole of A at 2/5=β₀; L_χ entire since (π⊗χ)_q ramified, π_q not | pass |
| §3.1 | Re s>0 | mellin(F₁,s)=mellin(φ,s)/s; F₁(φ_c,x)=F₁(φ,x/c) | pass |
| §3.2 | G=1; G(w)=w; x=1/5, 2 | F₁(φ∘inv,x); βF₁(φ∘inv,x)−φ(1/x); 1; 0 | pass |
| §3.2 line Re s=2 | σ∈(0,1) | poles of A(1−β+s) have Re s≤σ+β₀−1<1; A(β−s) has no zeros | pass |
| §3.3 | σ=1/2, β₀=2/5, ε′=1/10 | x^{−1/2} twice; ∫₀¹=2; poles Re≤σ+β₀−1, order ≤d (+1 at 0) | pass |
| §3.4 contour | s↦−s | residue k(0)L_χ(β)=L_χ(β); dual argument nY/(fq^d), power n^{β−1}, shift from Re 1 to Re 2 pole-free | pass |
| §4.2 orthogonality | q=5: a=0,±1,±2; q=3 | 0, 1, −1; all 0 | pass |
| §4.2a | 𝔽₂ k; 𝔽₃ k=2 at ±1; 𝔽₅ k=3 trivial ψ; k=0 | (−1)^k; −1, 2; 16>15; 1 at r=1 | pass |
| §4.2a scaling | ψ(ax), a=−1, 𝔽₃, k=2 | argument a^k r=r; values unchanged | pass |
| §4.2b curve E–P Checks | const rank r on 𝔾ₘ, ℙ¹; Kummer; Lψ(xᵃ) | 0, 2r; 0 with H_c=0; 1−a (0, −1) | pass; generality S02 |
| §4.2b Swan-constancy Checks | const on 𝔸¹×S; Lψ(tx); Kl_k⊗Lψ(t/x); x²=t | a_L=1, R²_c rank 1; a_L 2→1, H_c² 0→1; Swans (k,1), a_L=3k+1 (4, 7); a_L 2→1, H_c¹ 1→0 | pass |
| §4.2b convolution | F(x)⊗G(t/x) | Swans rank(F)Sw∞G at 0, rank(G)Sw∞F at ∞; H_c⁰=H_c²=0; rank = −χ_c; Kl₂*Kl₃ rank 5; Sw∞ product via H_c¹⊗H_c¹ | pass (Katz 5.1(4)–(6)) |
| §4.2b trace/weight | k=1,2 over 𝔽₃, 𝔽₂ | sign (−1)^{k−1}: +ψ(r); +1/−2; −1; weight k−1 | pass |
| §4.3 identity | q=3,k=1,2; q=5,k=2; q=7,k=0 | 0=−1+1; 0=(−1+2)−1; ±5; 2=3−1 but bound 1 | pass |
| §4.4 exponents | d=4,σ=.9; d=9,σ=.8,.9; Y=Q^{(d+1)/2} | 5/4; 2, 3/2; primal and dual both 1+(d+1)(1−σ)/2 | pass |
| §4.4 main term | dyadic | (1/2)(3/2)=3/4 | pass |
| §4.5 region | m=2,3 | 3/5, 4/5 excluded; exponent 2 at equality | pass |
| §5.1 | m=2,3 | 3/10, 2/5; β₀>1−2/(m²+1)>0 so §2.2 applies | pass |
| §5.2 | r=0, 1/5, 3/10, −1 | .25, .21, .16 (hypothesis fails), −.75 (r≥0 needed) | pass |
| §5.3 chain | 3/16, 21/100, 1/4 | 75/400<84/400<100/400 | pass |
| §5.3 Lean guards | u=1; E(z,3/2); Γ={1}, e^{iz} | λ=0; −3/4, y^{3/2} growth; λ=0 | pass |
| §5.4 | u=0; 2iu; u=1 | 0=0; .84=.84; 0<(.21)A | pass |
| §5.5 | κ=1,4 | μ/κ, κΔ, energy unchanged, threshold κ/4, gap κ·.21 | pass |
| S03 identification | 𝔽₃, n=1, z=1 | both sums ψ(1)+ψ(2)=−1; bounds (n+1)q^{n/2}=k q^{(k−1)/2} | duplicate object |

## Not verifiable

- `lrs95` is settled uncertified: its theorem, lemma, equation and page locators are cited by locator alone and were not compared with the text; the Layer 2–5 mathematics was recomputed independently above.
- No Lean was elaborated on this host (the board checkout has no pinned Lake packages): not built. The `#check @` record of the round-1 repair was read and compared with the README by hand.
- Ownership against open pull requests was checked by `roadmaps grep` over all 352 heads for the objects (Kloosterman, Swan constancy, Euler–Poincaré, congruence eigenvalue bounds, 21/100) and by reading the thirteen supplier heads named above; the 47 sibling checkouts listed in the brief were not read line by line.
- Deligne's bound and the Deligne–Laumon criterion are cited from Katz and Laumon; the primary texts (Deligne's SGA 4½ and Weil II) were not opened.

## Source issues

- none

<!-- tauceti-roadmap-review {"agent": "claude", "head": "0afb099", "job": "RT-CongruenceSpectralGap~2b", "model": "fable", "worker": "fable-rt22"} -->
