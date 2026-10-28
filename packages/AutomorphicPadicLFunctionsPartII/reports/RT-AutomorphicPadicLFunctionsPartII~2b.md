<!-- from @CBirkbeck, https://github.com/TauCetiProject/TauCetiRoadmapJobs/pull/1015#issuecomment-6399202730 -->
Red team round 2 pass b (claude) of f343fd9

Verdict: needs changes

1. **F01** (P2) The embedding of the local units into G_f is not pinned, and the two natural choices give different measures

   **Location.** `packages/AutomorphicPadicLFunctionsPartII/README.md:1154` ("G⁰_f=(O_L⊗ℤ_p)×/closure(U_f), and use the exact sequence 1→G⁰_f→G_f→Cl_f→1. Let q_f ... be the quotient map"); the Conventions at line 28 ("Arithmetic Artin maps a prime ideal to arithmetic Frobenius"); the gap contract at line 56 ("with arithmetic Artin ... compatibility").

   **Claim.** §8.3's pushforward along (t,s)↦Art(a_i)q_f(t⁻¹,s), weighted by ∏σ(t)⁻¹, extracts from μ_Eis the critical moment t^(α−1)s^β twisted by χ_fin, so that ∫χ dμ_(f,c) is the displayed smoothed value (line 1159); the Check at line 1186 computes "evaluating the algebraic character at (t⁻¹,s) gives t²s".

   **Witness.** The README never says which map (O_L⊗ℤ_p)×→G_f is meant. Two exist and differ by inversion on G⁰_f. (i) Ideal-theoretic, as in KS-v4 lines 3336–3339: a local unit u goes to the class of (λ) with λ≡1 mod f, λ≡u mod p^n; then χ_p(u)=χ_fin(u)·u^(β−α) and χ_p(q_f(t⁻¹,s))·t⁻¹=χ_fin(t⁻¹,s)·t^(α−1)s^β, the critical moment the Check asserts. (ii) The idelic arithmetic Artin map u↦Art(u_p): since the principal idele λ is trivial and its archimedean and f-components are trivial for λ≡1 mod f, Art(λ_p)=Art((λ))⁻¹, so χ_p(u)=u^(α−β) and χ_p(q_f(t⁻¹,s))·t⁻¹=t^(−α−1)s^(−β), not a critical monomial. Two-term instance: L=ℚ(i), p=5, f=(3), χ((λ))=λ⁻⁴ (the §8.3 example), u=7∈(O_L⊗ℤ_5)× (7≡1 mod 3): under (i) the value is χ((7))=7⁻⁴=1/2401; under (ii) it is 7⁴=2401. The gap contract with ClassFieldTheory asks for "arithmetic Artin" compatibility, which under reading (ii) is the inverse of what §8.3 uses; the only place the convention is implicit is §8.1's definition of χ_fin.

   **Repair.** In §8.3, after "Let q_f:(O_L⊗ℤ_p)×→G⁰_f be the quotient map", add: "The inclusion G⁰_f→G_f is the ideal-theoretic one: the class of a local unit u is the class of (λ) for any λ≡1 mod f with λ≡u mod p^n; in idelic terms this is Art(u_p)⁻¹. Under it the arithmetic avatar satisfies χ(q_f(u))=χ_fin(u)·u^(β−α)." Add the Check: "For L=ℚ(i), p=5, f=(3) and χ((λ))=λ⁻⁴, the local unit 7 has value χ((7))=7⁻⁴=1/2401; the idelic image Art(7_p) would give 7⁴=2401, which with the weight t⁻¹ produces the noncritical exponent t⁻⁵ instead of t³." Add the same sentence to the ClassFieldTheory contract (line 56): "the kernel's identification with the local units is the ideal-theoretic one, inverse to the local Artin map". On the refuting instance the repaired text gives t^(α−1)s^β=t³ and the value 1/2401, as §8.3 needs.

2. **F02** (P3) The normalisation of δ_t in "δ_h·vol" is not pinned; the Lebesgue reading is off by the covolume

   **Location.** `packages/AutomorphicPadicLFunctionsPartII/README.md:483` ("the current δ_t·vol has residue the rigidified unit at t"), `:500` ("A single point Thom current pairs to 1 against a test function equal to 1 near that point"), `:587` ("∇″Φ=δ_h·vol").

   **Claim.** §3.6's equation ∇″Φ=δ_h·vol holds with the current Φ of §3.5, whose §4.3 Check shows Φ^(0)=Σ_t h(t)E^(0,1)(z−t)dz at d=1 with residue h(t).

   **Witness.** With the §3.2 sign convention, (∇″Φ^(0))(η)=−∫∂̄η∧Φ^(0)=2πi·Σ_t h(t)η(t) for every lattice (Cauchy–Pompeiu, ∫(1/(z−t))∂_z̄η dxdy=−πη(t), dz̄∧dz=2i dxdy); the constant mode −π/covol cancels because Tr h=0. So the equation needs (δ_t·vol)(η)=2πi·η(t) at d=1, i.e. δ_t·vol=(2πi)^d times the integration current [t] of line 500, equivalently δ_t is the Dirac of the Haar probability measure. If δ_t is read as the Lebesgue Dirac, (δ_t·vol)(η)=C·(−2i)η(t)=(2πi/covol)η(t): for Λ=2ℤ+iℤ (covol 2, C=−π/2) this is πi·η(t), half of what ∇″Φ gives, and ∇″Φ=δ_h·vol is false. The two readings coincide only for covolume 1, which is every example the README computes. KS-v4 line 1789 defines δ_t only as "the δ-distribution concentrated in t".

   **Repair.** In §3.2 after "the current δ_t·vol has residue the rigidified unit at t" add: "Here δ_t is the Dirac distribution of the Haar probability measure of A(ℂ), so δ_t·vol=(2πi)^d·[t] with [t] the integration current of a point." Add the Check: "For Λ=2ℤ+iℤ, C=−π/2 and vol=πi·dx∧dy; the Lebesgue Dirac would give (δ_t·vol)(1)=πi, whereas ∇″Φ^(0) pairs with a test function equal to 1 near t to 2πi·h(t); the Haar normalisation gives 2πi." On ℤ[i] both readings give 2πi, which is why no existing Check detects the difference.

3. **F03** (P3) Design-stage residue in plan.json still names a roadmap that exists nowhere

   **Location.** `packages/AutomorphicPadicLFunctionsPartII/design/plan.json`: eight node `prerequisites` (KV.0/critical-types, KV.5/partial-l-identity, KV.5/critical-integrality, KV.6/ordinary-level, KV.8/local-factor, KV.8/smoothing-atom, KV.8/smoothed-ray-measure, KV.8/interpolation), one `requests` entry with supplier `AutomorphicPadicLFunctions:L0/locally-algebraic-characters`, one `coverage` remaining item and `libraryAudit.reviewed` cite `AutomorphicPadicLFunctions:L0/...` and `:L3/...`.

   **Claim.** The package's dependencies are the README's suppliers and the twelve declared gaps.

   **Witness.** No roadmap `AutomorphicPadicLFunctions` exists on main, among the 364 open roadmap pull requests (`roadmaps list`), in `merge-order/ORDER.txt` or among the board packages; the README (correctly) carries none of these citations and replaced them by gap:unit-type-classification, gap:hecke-padic-avatar and gap:ray-tower-tame-unit-kernel. The brief freezes plan.json outside its top-level `gaps`, so the round-1 pass recorded this under "not verifiable"; I record it as a finding so that the maintainer sees that the `requests` entry would be announced on a supplier that has no job.

   **Repair.** None is permitted in the package files the brief allows a repair worker to edit; the maintainer should drop or retarget the `requests` entry and the eight node prerequisites to the three gap slugs at intake. Not blocking by itself.

## Round-1 findings at this head

Each earlier finding was re-read against `packages/AutomorphicPadicLFunctionsPartII/README.md` at f343fd9 and recomputed where it is numerical. "a-" is the codex pass, "b-" the claude pass of round 1.

| Id | Status | Witness at this head |
|---|---|---|
| a-F01 (half-plane) | repaired | §4.1 line 614: "Initially take Re(s)>1+(|β|−|α|)/(2d)=1+w/2"; §4.2 line 642 names the same region as "Re(|α|+ds)>d+(|α|+|β|)/2". Recomputed: the Kronecker bound d+|ν|/2 at ν=β+α, S=|α|+d·s is exactly Re s>1+w/2. The ℚ(i,√2) negative control (line 636) recomputed: N(1+√2)=−1 so (1+√2)^(−6)·(1−√2)^(−6)=1, the type is Γ-trivial; at s=−3 each positive integer n contributes n^(−12)·(n⁴)^(3)=1; at s=−1 it contributes n^(−8). |
| a-F02 / b-F01 (class sign) | repaired | §4.3 line 660: ε(d,a,β)=(−1)^(d(d+1)/2+|a|+|β|+1). Recomputed independently at d=1: ∂_z^a(z+λ)^(−1)=(−1)^a a!(z+λ)^(−a−1) gives (−1)^a; the a=β=0 residue argument of the Check at line 670 (∂_ū χ_ℓ=πℓχ_ℓ, Poisson Σ_{ℓ∈Λ*}χ_ℓ=covol·Σδ_λ, so covol^(−1)G=E^(0,1) for every covolume) gives +1. The a=2 witness (line 672): E^(0,3)(1/3,0;ℤ[i]) summed over |m|,|n|≤1500 is 23.46973, class 24·E=563.27 (tail <0.005). The d=2 top contraction recomputed by hand: ι_v d ι_v vol = C(ℓ̄₁ℓ̄₂/(r₁r₂))(u₂−u₁)∧dz₁∧dz₂ = −2C v₁v₂u₁∧dz₁∧dz₂ on u₂=−u₁, matching line 577 and (−1)^(d(d+1)/2)d!. The sign chain (−1)^(j+b) prefactor at j=d−1, (−1)^(d(d+1)/2) contraction, (−1)^d from C, (−1)^|a| from differentiation multiplies to the stated ε. All propagated values (lines 1019, 1083, 1187–1188, 1208, 1216, 1229–1230, 1248) recomputed: ε(1,3,0)=−1, ε(1,2,0)=+1, ε(1,3,1)=+1, ε(1,1,1)=+1, ε(1,2,1)=−1; (3,0),(2,1)→+1 and (4,0),(3,1)→−1 at d=1; +1 at d=2 for admissible types since |a|+|β|≡d(w+1) mod 2. |
| a-F03 (cap target) | repaired (differently, correctly) | §6.3 line 930: "the local-coefficient cap lands in H₀(Γ,M)=M_Γ ... This defines θ_Γ(h,y)∈M_Γ". The repair's refutation of the reviewer's proposed invariant θ is right and I extended it: a bounded measure on a compact space with a free ℤ_p-action satisfying μ(γU)=c(γ)μ(U) for a unit c vanishes (if c^(p^n)≠1 then (c^(p^n)−1)μ(W₀)=0 for the γ^(p^n)-stable slice W₀; if c has p-power order replace γ by γ^(p^N)), so the determinant twist does not rescue an invariant θ. §7.1 (line 998) and §8.3 (lines 1154–1156) consume only Γ-invariant functionals and record the well-definedness obligation. Gap text extended identically in README line 92 and plan.json. |
| a-F04 (identity-isogeny Check) | repaired | §2.4 lines 388 and 403: identity conductor excluded ("f=O_L forces x=e, which lies in D=A[c]"); Gaussian instance at 5 recomputed: i↦3, 2−3≡4, 2+3≡0, deg[2−i]=5, N(3)=9 unit, x of order 5 is outside A[3]. |
| a-F05 / b-F03 (§2.6↔§3.6 cycle) | repaired | §2.6 (lines 429–443) states only the field-base edge-map comparison and needs §1.3, §1.4, P3.3; §3.6 line 600 needs §3.5, §1.3, §2.6, C5.1. Order §2.6→§3.5→§3.6 is acyclic; C5.1 "The ordinary comparison" exists at the ComplexComparisonPartII head (its README line 2338). |
| a-F06 (orbit multiplicity) | repaired | §4.1 line 635: multiplicities 1 (Γ=1), 4 (μ₄, invariant weight), infinite (infinite Γ, d>1); agrees with the Check at line 630 and the API at line 623. |
| a-F07 (three Checks) | repaired | §0.3 lines 191–193: i^(−4)=1 with full invariants; i^(−1)=−i with −(1+i) a unit, invariants 0; ζ₆³=−1≡1 mod 2. §1.4 lines 295–298: four Checks including g=z₂ (0 and 1; swapped 1 and 0); the duplicate zeroth-derivative bullet is gone. |
| a-F08 (proof locator) | repaired | §1.3 line 257: "pp.26–28, KS-v4 lines 1105–1184, with the trace identification and the final injection at KS-v4 lines 1177–1184, p.28". Page markers: 1091→p.26, 1134→p.27, 1176→p.28; Proposition 2.32 starts at line 1106, so p.26 belongs in the range. |
| b-F02 (NonordinaryCMSpecialValues edge) | repaired | Line 18: "The independent inert-prime CM central-value direction is outside this roadmap; nothing here is supplied by it." Depcheck now prints no `moved:` line (output below). NonordinaryCMSpecialValues exists as a board package folder, so the Downstream-consumers mention at line 1244 cites something that exists. |
| b-F04 (gap slugs on PS.0/PS.1) | repaired | Lines 852, 863, 871: "PeriodsAndSpecialValues PS.0 (gap:hecke-motive-periods); PeriodsAndSpecialValues PS.1 (gap:critical-cm-deligne-period)"; slugs, suppliers and sections identical in plan.json (checked programmatically for all 12 gaps). |
| b-F05 (Part II without a base) | settled | Scope line 7 now says no roadmap titled automorphic p-adic L-functions precedes this part and names the three suppliers where the base stops. The repair report marks the renaming as a maintainer decision outside the package; that reason is right (the folder name is the package identity on the board), so I do not re-raise it. |

No repair introduced a new error that I could find: the rewritten sign Checks, the coinvariant reformulation, the §2.4 instance, the §0.3 and §1.4 Checks, and the ℚ(i,√2) control all recompute as stated.

## Verified sound

Read every line of the README (1261 lines) and of `Suggested.lean` (114 lines), the repository rules, the three round-1 documents, `design/plan.json`, `sources.toml` and `metadata.toml`. Inventory: **4 Lean declarations** (2 definitions, 2 theorems), **44 numbered targets** (44 Checks blocks, 44 *Needs* lines), **12 declared gaps**, **16 supplier roadmaps / 60 cited sections**, **58 KS-v4 line locators plus 45 further theorem lines located by name**, **19 pinned library declarations opened at the pins**, **61 Checks recomputed with values**. The package diff against origin/main touches nine files, all under `packages/AutomorphicPadicLFunctionsPartII`. No `lemma`, no `set_option`, no pull-request number or process narrative in README or Lean (grep for "pull request", "round", "repair", "reviewer": 0 hits); 51 gap citations all carry a slug that exists in plan.json with the identical `needs` sentence and supplier.

**Dependency check** (run on the package README, unedited):

```
depcheck: 52 roadmaps, 589 edges, 0 problem(s)
```

No UPWARD, CYCLE or `moved:` line. `roadmaps resolve`: "Cross-roadmap citations found nowhere: None. Lean names found nowhere: None."

**Elaboration.** The worker's board checkout has no Lake environment, so nothing was built there. I copied `Suggested.lean` to a scratch file, appended `#check @` for the four declarations and elaborated it once with `lake env lean` in a Lake environment whose manifest pins Mathlib 6b7abb3c and Tau Ceti a91d3aaf (the content manifest's pins): exit 0, the two expected `declaration uses 'sorry'` warnings (lines 63, 86) and no error. The elaborated types are exactly the file's signatures: both theorems keep `0<d`, `[DiscreteTopology Λ]`, `[IsZLattice ℝ Λ]`, `∀ i, 0 < h i`; the functional equation keeps `Λd` with its membership iff and `ZLattice.covolume Λ volume`; there is no ambient `variable`, so no binder could be lost. Nothing changed.

### Lean declaration table

| Declaration (line) | Context | Instances and values | Result |
|---|---|---|---|
| `hermitianPairing` (43) | implicit d; h:Fin d→ℝ; z,w | d=0: 0. h=1, z=1/2, w=i/2: H=−i/4, H(w,z)=+i/4, Im H(w,z)=1/4 (phase i in §3.4's Check). h=2, z=w=1: 2 | linear-first, conjugate-second; matches §3.3 |
| `kroneckerTerm` (49) | implicit d; h ν z w s l | l=−z: 0 by branch. d=1, ν=1, z+l=i: numerator star(i)=−i. d=2, z+l=(1,0), ν=(0,1): 0, ν=0: 1. h=0: log 0=0 would give denominator 1 (excluded by hh in the theorems). exp(s·log H(u,u))=‖u‖_H^(2s) | body is §3.3's summand; no 0/0 |
| `kronecker_meromorphic_continuation` (63) | d, hd, Λ, two instances, h, hh, ν, z, w | Convergence: ∏|u_i|^(ν_i)≤‖u‖^|ν| over a rank-2d lattice summable iff 2Re s−|ν|>2d. Square lattice, ν=z=w=0: F(0)=−1, residue π at 1. Poles of M=π^(−s)Γ(s)K only at 0 (residue −e^(2πi⟨−z,w⟩), only if ν=0, z∈Λ, from the omitted constant term) and d (only if ν=0, w∈Λ*); K=π^sM/Γ(s) is then analytic off d. `MeromorphicAt F d` holds with exponent 2 even when G(d)≠0 (the exponent-1 function is 0 at d and G elsewhere). ν≠0: the dual zero-frequency term carries 0^ν=0, no pole | true as typed; README §3.4 generality |
| `kronecker_functional_equation` (86) | as above plus Λd, hΛd | Poisson recomputed: with ⟨x,ξ⟩=(x,iξ), Λ^∨=iΛ*, f̂ of x̄^ν e^(2πi⟨x,w⟩)e^(−πt‖x‖²) gives θ^ν(z,w,t;Λ)=e^(2πi⟨w,z⟩)vol_H^(−1)t^(−d−|ν|)θ^ν(w,z,1/t;Λ*) with the h_i cancelling between ∂_w and the Gaussian; Mellin then gives M^ν(s)=e^(2πi⟨w,z⟩)vol^(−1)M*^ν(d+|ν|−s). Residue at d: vol^(−1) for M, π^d/(Γ(d)vol_H) for K. h=2, ℤ[i]: Λd=½ℤ[i], metric covolumes 2 and 1/2, residue π/2. Excluded points s∈−ℕ, d+|ν|−s∈−ℕ, s=d, s=|ν| are exactly the Gamma poles and the two possible poles of F and G | phase order, volume, residue and exclusions correct |

### README target table

| Target | Instances tried, values on each side | Result |
|---|---|---|
| 0.1 | ℚ(i), μ=(−2,1): a=1, β=1, unit weight at i is i^(−2)·(−i)^1=−i·... = i^(−3)·... recomputed as i^(−2)(−i)=−i^(−1)·... → value −1·... ; explicitly i^μ(σ)·(−i)^μ(barσ)=i^(−2)(−i)=−(−i)=i≠1, so Γ=1 is forced. α=(1,2) on ℚ(i,√(1+i)) not a norm pullback | admissibility separates the examples |
| 0.2 | γ=i: Lie weight i, A-cotangent −i, complementary cotangent barσ(i)=−i; split-torus scalar 2 vs 1/2 | conventions as stated |
| 0.3 | μ₄ on C_(3,0): i^(−3)i^(−1)=1; C_(0,0): −i, −i−1 unit in ℤ[i,1/2]; ζ₆³=−1≡1 mod 2 | three discriminating Checks |
| 1.1 | (2,−1,−1) trace 0; two-auxiliary function on E[15]∖e for ℚ(√−7): 24 points of value 8, 192 of value −1, 8 of value 0 (3 and 5 inert, Nc=9, Nc′=25), trace 192−192=0, 224=225−1 points | construction consistent |
| 1.2 | Spectral sequence H^p(Γ,H^q(A,F)): H^q=0 for q<d, H^d=R gives H^i(A,Γ,F)=0 for i<d, H^d=R | as stated |
| 1.3 | Localisation sequence: Tr h=0 lifts the support class; H^(d−1)(A,Γ,F)=0 gives uniqueness and injectivity | as stated |
| 1.4 | ∂²z²=2 vs divided coefficient 1; ∂₁∂₂(z₁z₂)=1; g=z₂: (0,1) | factorial convention consistent with §4.3's a! |
| 2.1 | b=0 moment = augmentation; H covariant | as stated |
| 2.2 | Projection to the trivial coefficient line before capping makes coinvariants = invariants = C; Γ=ℤ, monodromy −1: H⁰=0, H¹=ℤ/2; shift u^[1]⊗u↦u^[2] vs shuffle 2u^[2] | consistent with the coinvariant cap of §6.3 |
| 2.3 | Free Γ acts freely on nonzero lattice vectors (σ(γ)λ_σ=λ_σ forces γ=1), so each Γ-orbit splits into [Γ:Γ′] Γ′-orbits; projection formula π_*[BΓ′]=m[BΓ] | EK_(Γ′)=m·EK_Γ |
| 2.4 | Gaussian instance at 5: differentials 4 and 0, degree 5, N(3)=9, order of x is 5; f=O_L gives 0 instances | nonvacuous |
| 2.5 | R→R[1/5] injective; 2−i and 2+i nonzero in characteristic 0 | as stated |
| 2.6 | d=1: coherent degree 0 to de Rham degree 1; d=2: 1 to 3 | field-base scope kept |
| 3.1 | 3d−1=5 at d=2; r_i|z_i|² invariant under (σ_iγ^(−1)z_i, |σ_iγ|²r_i) | as stated |
| 3.2 | Sign (−1)^(3d−1−p−q) from Stokes with test first: (−1)^(N−p−q); d=1, (1,0): −1; normalisation of δ_t: S02 | one convention unpinned |
| 3.3 | Square lattice: 4 shortest terms contribute 4; K(0)=−1; translation multiplier exp(−2πi⟨1,i/2⟩)=−1 | as stated |
| 3.4 | Residues: M at 0 is −1, at 1 is 1 for ℤ[i]; K residue π; h=2: π/2; rectangular lattice: Λ^∨=½ℤ+iℤ, Λ*=ℤ+(i/2)ℤ, Im H(1/2,i)=−1/2; phase i, reversed −i, product 1 | as stated |
| 3.5 | d=1: ι_v(dz∧dz̄)=−v dz, C=−π/covol; d=2 contraction recomputed: −2C v₁v₂u₁∧dz₁∧dz₂; d=3: +6C by the same expansion; (A+v)^(−1)=A^(−1)−vA^(−2) | coefficients as stated |
| 3.6 | d=1: ∂̄(χ_ℓ ι_v vol)=π|ℓ|²χ_ℓ vol, so ∂̄[χ_ℓ ι_v vol/(π|ℓ|²)]=χ_ℓ vol; constant mode killed by Tr h=0; (∇″Φ^(0))(η)=2πi Σh(t)η(t) for every covolume | equation holds with δ_t·vol=(2πi)^d[t] (S02) |
| 4.1 | μ₄ orbits of size 4; t=1/3: four distinct cosets, each single-coset series equals the μ₄-series; ℚ(i,√2) control: terms 1 at s=−3, n^(−8) at s=−1; bound 1+w/2=−2 | repaired bound correct |
| 4.2 | d=2 Beta integral: ∫_(r₁r₂=1)∏r_i^(a_i)/(Σr_i|u_i|²)^(a₁+a₂)dr₁/r₁=(1/2)B(a₁,a₂)∏|u_i|^(−2a_i); the leading d=2 cancels the 1/2; unfolding Σ_(Γ\X)∫_(EΓ)=Σ_X∫_(BΓ) with the orbit T_Γ(t′) | formula and Jacobian correct; a!=Γ(α) at s=0 |
| 4.3 | ε at d=1: a=0: +1 (residue), a=1: −1, a=2: +24E≈+563.27, a=3: −3!; d=2 admissible: +1 (a=(1,1), β=0); parity |a|+|β|≡d(w+1) recomputed from |β|−|α|=dw | sign chain consistent |
| 5.1 | Ω=2, q=1: Ω∨=πi; ω↦iω: q↦−i, Ω∨ unchanged; different of ℚ(i) is (2i), Tr(1/2)=1, Tr(i·(−i/2))=1 | as stated |
| 5.2 | α=3, β=0: 2v/Ω³; α=2, β=1: 2πi v/(Ω²Ω∨); matches KS line 3402's (α−1)!(2πi)^|β|/(Ω^αΩ∨^β) | as stated |
| 5.3 | Ideals in the ray class of b are (λ)b with λ∈1+fb^(−1) mod O_f×; χ((λ)b)N((λ)b)^(−s)=χ(b)Nb^(−s)·λ̄^β λ^(−α)N(λ)^(−s); norm character w=2: ζ_L(s−1) | identity correct |
| 5.4 | Γ=1 vs μ₂ at d=1: E(·;Λ,1)=2E(·;Λ,μ₂) for invariant weight, so EK₁∈2·C is the statement that the full-unit-orbit value is integral; at h=0 both 0 | target well posed; its proof not certified (below) |
| 5.5 | u(1+t+a)=1+ut+a since u−1∈f⊂a; orbits of t on c^(−1)a/a cover 1+c^(−1)a once; Gaussian c=(2): 4E(x)−8E(2x), oddness gives 12E(x) | distribution correct |
| 5.6 | χ(c)Nc on the [b] term; c=(7): 49/2401−1=−2352/2401 | as stated |
| 5.7 | Four-term distribution recomputed: Nc χ(c′)^(−1)−χ(cc′)^(−1)−Nc+χ(c)^(−1)=(χ(c′)^(−1)−1)(Nc−χ(c)^(−1)); λ^(−4), c=(7), c′=(3): 80·(−2352)=−188160; ×1/(2401·81)=−1280/1323 (gcd 147), primes 3, 7 over N(cc′)=441 | both conductor cases consistent |
| 5.8 | From §5.2, algebraicity of 𝒩 ⇔ L·Ω̄^β/Ω^α∈Qbar; with Shimura's p(σ)p(σ̄)∼2πi and Ω̄∼Ω mod Qbar this is (2πi)^|β₀|L/Ω₀^(α₀+β̄₀)∈Qbar; quartic repeats each K-period twice | consistent with §5.2 |
| 5.9 | c⁺ is the inverse of the §5.8 factor; L=0 gives 0 | consistent |
| 6.1 | p=5: i↦3, 2+i↦0 (Σ_p), 2−i↦4 (barΣ_p); p=3 inert rejected; N(p_Σ)=p^d since the embeddings inducing Σ_p are exactly Σ | as stated |
| 6.2 | canonical basis: Ω_p=1; uω: uΩ_p; pω not a basis | as stated |
| 6.3 | Γ=ℤ on ℤ₅ by 6: M_Γ=ℤ₅/5, M^Γ=0; twisted-invariant bounded measure under a free ℤ_p vanishes (argument above); dyadic datum: Δ=−343, j=−3375, points of y²+xy=x³+x²+1 over 𝔽₂: (0,1) and ∞, a₂=1, X²−X+2≡X(X+1); index-2 projection gives 2θ | coinvariant formulation consistent |
| 6.4 | (1+T)∂_T twice on (1+T)² at 0: 4; mixed (1,1) of (1+T₁)²(1+T₂)³: 6 | as stated |
| 7.1 | δ_m moments m^k; critical functional t^a s^β invariant iff weight β−a−1 trivial on Γ (action (γ^(−1)t,γs) with determinant ∏σ(γ)^(−1)); ε values at (3,0),(3,1),(2,0): −1,+1,+1 | as stated |
| 7.2 | Weil pairing ⟨γ^(−1)u,γt⟩=⟨u,t⟩ under the dual action; translation by Γ-fixed (s,t) descends to coinvariants | as stated |
| 7.3 | ℤ/4→ℤ/2: (1/4)Σ_(x∈{0,2})i^(−kx)=(1/2)(1+(−1)^k); inflation: F_mρ_m(p^(m−n)k′)=F_nρ_n(k′); C₃: (1,ζ,ζ²)↦(0,1,0), δ₀↦(1/3,1/3,1/3) | as stated |
| 7.4 | A=2, B=3, v=5, w=7: −31 at ε=−1, +31 at ε=+1 | as stated |
| 8.1 | 𝔽₃ quadratic character: (ζ²−ζ)/3=−i/√3; Local=1 for c=b=1; formula matches KS Def. 5.26 at line 3374 | as stated |
| 8.2 | Nc=7, χ(c)=2: 13/2 vs 13; mass Nc−1; c=O_L: δ_c=0; χ_p(Art(c))=χ(c) under arithmetic Artin on ideals | as stated |
| 8.3 | λ^(−4), f=(3): U_f=1 (only 1≡1 mod 3 in μ₄), Nc=49, χ(c)=7^(−4), δ_c(χ)=−2352, ε=−1, product +2352U; (2+i)⁴=−7+24i, factors (12−24i)/5 and (632−24i)/625 (fraction reading of KS line 3407); conductor one: 80, 188160, 62720/27, 82/81; well-definedness: push(γ·m)=∏σ(γ)^(−1)·c(γ)·push(m)=push(m) with the action (γ^(−1)t,γs) and q_f killing the diagonal γ; torsion descent at d=1: ∫_(−V)t^(−1)dμ=∫_V t^(−1)dμ when (−1)_*μ=−μ, so the pushforward is 2∫_V, as the ±1 Check says; the free part is the projection formula; but the embedding direction is unpinned (S01) | one convention missing |
| 8.4 | C_p average: identity indicator 1/p; M(χ)=−Ω_p⁴U, δ₇(χ)M(χ)=2352Ω_p⁴U | as stated |
| 8.5 | (3,1): i^(−3)(−i)=1 trivial on μ₄; rescaling by u=2 at α=2: both sides ×1/4; sign table (3,0),(2,1)→+1; (4,0),(3,1)→−1; d=2: +1; Euler factors match KS line 3404–3409 (fraction bar lost in extraction) | as stated |

### Suppliers, gaps and pins

Resolved at the copies the brief names (main at e98875d for roadmaps on main; the heads under the given sibling paths; `roadmaps show` for the four off-main suppliers): GlobalNumberFields Layers 2, 7, 9, 10 (README lines 273, 453, 502, 525); ClassFieldTheory Layers 7, 11, 12, 13 (1312, 1683, 1724, 1799); ThetaSeries 1A, 1E, 1F, 2A, 2C (bullets at 432, 473, 476, 489, 507); SchemeAndStackFoundations §§2.6, 2.7, 2.19, 2.20, 2.23 (3437, 3482, 4094, 4275, 4558); AlgebraicTopology Stage 5 items 3–4 (finite covers, torus exterior powers), Stage 6 (cap products with local coefficients at 1057; `p_* transfer=d·id` on H₀ at 2133), Stage 8 items 5, 7, 8 (Whitehead, CW type of manifolds, nonabelian classifying spaces); DifferentialGeometry Layers 0, 1, 5 (268, 311, 503); Hyperfunctions HF2.AnalyticPreparation.CurrentResolution (251); PadicMeasuresIwasawaAlgebras §§0.1, 1.2, 1.7, 2.1, 2.2, 3.1 (424, 657, 909, 1148, 1229, 1978); AbelianSchemesAndArithmeticModuliPartII P0.1–P0.6, P1.1, P2.1–P2.8, P3.2–P3.4, P4.1–P4.3 (all headings present at its head, lines 404–938); PeriodsAndSpecialValues PS.0 (238) and PS.1 (399) at its head; ComplexMultiplicationAndExplicitReciprocity §1.3 with `cmHodgeEigenspaces` (418, 432); ComplexComparisonPartII C1.1 (1245), C5.1 (2338), C5.4 (3019); FiniteFlatGroupsAndIntegralPadicHodgeTheory R07.1.7 (890), R07.1.9 (971), R07.1.13 (1164); AutomorphicLFunctionsAndLocalFactors AL.0 with "Local Schwartz–Bruhat spaces and finite Fourier levels" (290, 643), AL.1 with "Local epsilon factors and Gauss sums" (916, 1187), "Global distributions and completed Euler products" (1381), "Rank-one specialisation and Hecke comparison" (1463). All sixteen are earlier in `merge-order/ORDER.txt` than this roadmap (position 202); no citation of a later roadmap; no two owners of one object found (`roadmaps grep` for Eisenstein–Kronecker, Kronecker series, Epstein and Katz measures returns only the LFunctions pull request's `epsteinZeta` on a different carrier and not in the merge order, DirichletPadicLFunctions §§1.6–1.7 on ℤ_p^× only, and references to Kings–Sprang in three suppliers' bibliographies).

Gaps: 12 slugs, suppliers and `needs` sentences identical in README and plan.json (programmatic comparison). None has supplier `none`. Minimality spot-checks: PadicMeasuresIwasawaAlgebras §2.1 is the one-variable Mahler/Amice theory on Mathlib's `AbstractMeasure` and §3.1 defines pseudomeasures without a boundedness criterion; ClassFieldTheory has no fp^∞ ray tower; GlobalNumberFields has no p-adic avatar; PeriodsAndSpecialValues has no Hecke motive; SchemeAndStackFoundations §2.23 has no inverse-limit comparison; AlgebraicTopology Stage 6 has the cap and the H₀ transfer identity but not the group-cohomology compatibility asked for. None asks for what the pins provide.

Pins (Mathlib 6b7abb3c, Tau Ceti a91d3aaf, opened in a checkout at those commits): `IsCMField` CMField.lean:69; `instZLattice_unitLattice` :373 and `logEmbeddingEquiv` :415; `summable_norm_sub_rpow` Summable.lean:236 with `r < −finrank ℤ L`; `IsZLattice` Basic.lean:433; `AbstractMeasure` := C(X,R)→L[R]E at Measure/Basic.lean:40, `dirac` :97, `map` :105; `diracHom` Monoid.lean:115 and the convolution section; `amiceTransformEquiv : D(ℤ_[p],ℤ_[p]) ≃ₗ ℤ_[p]⟦X⟧` AmiceTransform.lean:157 (ℤ_p/ℤ_p only, as the README says); `fourier_gaussian_innerProductSpace (hb : 0 < b.re)` :352; `mellin` :90; `Gamma_eq_integral (hs : 0 < s.re)` :319; `Gamma_neg_nat_eq_zero` :344; `covolume` Covolume.lean:72 and `covolume_pos` :98; `isInternal_weightSpace` :416 and `endOfPoint_tmul_of_mem_weightSpace` :568; `HeckeCharacter.IsAlgebraic` :60; `unitaryPart` :273.

Sources: 58 `KS-v4 line N` locators each land on the named definition, proposition, theorem, equation or proof step, and the page numbers agree with the extraction's page markers for every cited item (for instance Theorem 3.27 at line 2094 is p.44 with its display on p.45, Proposition 3.23 at 1925 is p.42, Remark 2.37 at 1266 is p.29, Definition 5.16 at 2941 is p.64, Step 4 at 3714 is p.79). BKO-2021 line 70 is p.944 and lines 71–73 are the inert/supersingular sentence; the citation supports only the boundary claim it is used for. KS Theorem 5.27 (line 3392) assumes only p-ordinarity, so the README's inclusion of p=2 and 3 is at the source's generality.

Headlines and padding: the headline list is §1.3, §2.4/§2.6, §3.4, §3.6/§4.3, §§5.4/5.7, §5.8, §5.9, §§6.3/7.1, §8.3, §8.4, §8.5. The two analytic headlines are stated; the eight others are named in the module docstring with their missing carriers, and none is statable at the pins (no CM period datum, completed Poincaré sheaf, equivariant support cohomology, Hecke motive or ordinary theta data exists there). Neither theorem follows by one tactic or one library lemma; both definitions are needed by the statements; no example, boundary case or Check is restated in Lean.

## Not verifiable

- The binomial sign (−1)^b of §3.5 and the resulting (−1)^|β| in ε were not recomputed independently beyond the structure (A+v)^(−1)=Σ(−v)^b/A^(b+1); the a-dependence, the d=1 residue, the d=2 top contraction and the (−1)^d volume sign were.
- §5.4's divisibility of the critical coordinate by the torsion order of O_f× at primes dividing it, and §8.3's integral descent for the free part, are theorem targets; the torsion symmetry (d=1 shown above) and the projection formula make them plausible, but no proof was certified.
- KS-v4's Theorem 5.27 Euler factor at Σ_p reads "(1− χ(p−1)Np)" in the extraction (line 3407); I read it as the fraction χ(𝔭⁻¹)/N𝔭, which is what the README states and what its (12−24i)/5 example uses, but the fraction bar is lost in the text.
- Complex-conjugation bars are lost in the extraction (lines 3347–3349, 3374–3376), so the conjugation placements in §§5.1, 8.1 were checked for internal consistency only.
- Ownership against open pull requests whose files the brief does not provide was checked through `roadmaps grep` and `roadmaps show`, not by reading those roadmaps in full.
- The Lean file was elaborated in a separate pinned environment, not in the worker's board checkout (which has none).

## Source issues

- **Error** in KS-v4 at Definition 3.24 and the proof of Lemma 3.26, printed pp.43–44 (lines 2008, 2051): the source says the unit-orbit Eisenstein series converges for Re(s)>d+(b−a)/2; it should be Re(s)>1+(b−a)/(2d), as the orbit count and the unfolded Kronecker bound require; affects a stated result. (Recorded in round 1; reconfirmed.)
- **Error** in KS-v4 at the proof of Proposition 3.23, printed p.43 (line 1977): the source says holomorphic differentiation of the Fourier character contributes +πr; for exp(2πi Im H(ℓ,z)) it contributes −πr; affects a stated result. (Reconfirmed.)
- **Error** in KS-v4 at the proof of Proposition 3.23, printed p.43 (lines 1996–2000): the source says ∧dz_i∧dz̄_i is (2i)^d times the standard measure; it is (−2i)^d times it; affects a stated result. (Reconfirmed.)
- **Gap** in KS-v4 at Definition 3.19, printed p.39 (line 1789): the source says δ_t is the δ-distribution concentrated at t without fixing its normalisation; it should say δ_t·vol=(2πi)^d times the integration current of the point, which is what (3.5.1) needs for residue f(t) on a lattice of covolume ≠1; affects the proof.
- **Error** in KS-v4 at Theorem 5.27 proof Step 1, printed p.74 (lines 3429–3431): the source says the kernel of Gal(L(p^∞f)/L)→Gal(L(f)/L) is the local units modulo the closure of all global units; it is modulo the closure of the units ≡1 mod f; affects a stated result. (Recorded in round 1; reconfirmed.)
- **Gap** in KS-v4 at Lemma 5.15, printed pp.63–64 (lines 2926–2940): the source says the cap lands in Γ-invariant formal functions; the local-coefficient cap lands in coinvariants, and an invariant bounded formal function has zero Amice measure on the units for d≥2; affects the proof. (Recorded in round 1; reconfirmed with the twisted-action argument above.)

<!-- tauceti-roadmap-review {"agent": "claude", "head": "f343fd9", "job": "RT-AutomorphicPadicLFunctionsPartII~2b", "model": "fable", "worker": "fable-rt39"} -->
