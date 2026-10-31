# Review of GaugeQuiltFieldTheory (pull request #1076 at 25e0ea3)

**Verdict:** accepted

No P1 or P2 finding. The gate passes (every scanner 0, depcheck 0 problems, build 0), `TauCetiRoadmap/GaugeQuiltFieldTheory/Suggested.lean` elaborates under `lake env lean` with exactly the three `sorry` warnings, the three stated headlines are true at the pins and none closes in one tactic, and every supplier citation resolves on main or at an earlier open head. Four P3 notes follow; the author may take or leave them.

Source ids used below (no `sources.toml` exists in this roadmap; these are the keys under which the texts were fetched): `ww-coprime` = Wehrheim–Woodward, *Floer field theory for coprime rank and degree*, arXiv:1601.04924v2; `mww-functors` = Ma'u–Wehrheim–Woodward, arXiv:1601.04919v5; `ww-orientations` = Wehrheim–Woodward, *Orientations for pseudoholomorphic quilts*, arXiv:1503.07803v6; `ss-newstead` = Scaduto–Stoffregen, arXiv:1707.06268v1; `ss-rank-two` = Scaduto–Stoffregen, arXiv:1707.06207v1.

## R01 (P3) — No `*Needs:*` lines, no supplier-contract section, no locators in GQ2–GQ4, Checks only in GQ1

**Location.** `TauCetiRoadmap/GaugeQuiltFieldTheory/README.md`, whole file; e.g. lines 39–43 (GQ2 boundary application, no locator), 60–72 (handle model, no locator), 83–87 (composition and orientation construction, no locator), 108–131 (GQ4, no locator), 142 (`## Ownership and construction order`).

**Claim.** The README is a dense specification in the GQ1–GQ5 section form (which has precedent on main, e.g. SpinGeometry's G1–G6), but it carries none of the house apparatus that the checklist holds roadmaps to: there is no `*Needs:*` line anywhere, no `## Exact supplier contracts` (suppliers are named inline: HamiltonianReduction R5, SmoothBundlesConnections B1–B5, SpinGeometry G4, FukayaTheory FK0/FK1.1/FK3/FK4.2, HeegaardFloer F0–F3, DGAInfinity, AlgebraicTopology, DifferentialGeometry, InstantonFloerTheory), no `**Checks.**` outside GQ1 (lines 23–27), and the only locators are in GQ1 and the References. GQ2b's handle model (lines 60–62) is WW Lemma 3.4.5 and GQ2's surjectivity and `H⁰,H¹,H²` assertions (line 43) are WW Lemma 3.4.4, but neither is cited at the claim; GQ3's decomposition independence is WW Theorem 2.2.13/3.5.1 and GQ4's functors are `mww-functors`, again uncited at the claim; the weighted-adjoint formulas (line 126) and the determinant-line conventions (line 87) have no locator at all.

**Witness.** The dependency check parses only `*Needs:*` lines, "X supplies" sentences and `### From` headings; on this README it reports `depcheck: 204 roadmaps, 1418 edges, 0 problem(s)` with no edge contributed by GaugeQuiltFieldTheory, so its "0 problems" is vacuous for this roadmap. (I checked the direction by hand: every cited roadmap is on main or earlier in the order, see Verified sound.) `grep -c 'Needs:' README.md` = 0; `grep -c 'Checks' README.md` = 1.

**Repair.** (i) Add an `## Exact supplier contracts` section with one `### From TauCetiRoadmap.<X>` subsection per supplier above, naming the sections consumed (R5's left gauge convention `g·A = gAg⁻¹ − (dg)g⁻¹`, moment map and central-curvature level; B2–B5's associated bundles, transport and flat-holonomy groupoid; G4's spin lifts, `w₂`, pullback/direct-sum laws and `H¹(−;ℤ/2)` torsor; FK0.1–0.4, FK1.1, FK3.1–3.3, FK4.2; F0–F3 of HeegaardFloer; DGAInfinity's Koszul-sign dictionary), and end each GQ section (or each paragraph that is a target) with a `*Needs:*` line so the check sees the edges. (ii) Put the locator at the claim: `ww-coprime` Lemma 3.4.4 at line 43, Lemma 3.4.5 at line 62, Theorem 3.4.3 at line 43, Definition 2.2.1/2.2.6 and Theorem 2.2.13 at lines 41–43 and 139, Theorem 3.5.1 at line 139, `mww-functors` (pin the version read, v5 of 23 Feb 2018) at lines 108–118, `ww-orientations` Theorem 1.0.1 at line 87. (iii) Add three Checks to each definition outside GQ1: for `E_g, B_g` (rank one gives `E_g = 0`; `r = 2, g = 2` gives `η_g ≠ 0`; the parity switch `b_g = (g mod 2)η_g` at `g = 2, 3`); for `δ(E)` (`k = 1` is the trivial lift; the full-turn sign count; `w₂(E⊕E) = 2w₂(E) + w₁(E)² = 0`); for the shift congruence (`k = 0`, inverse, and the `(a+b)` composition law with a concrete `a = 1, b = −1`).

## R02 (P3) — The symplectic normalization is correct but differs from the cited source by `4π²`, with no witness Check

**Location.** `TauCetiRoadmap/GaugeQuiltFieldTheory/README.md` lines 9 (`B(ξ,η) = −tr(ξη)/(4π²)`, `Ω(a,b) = ∫_X B(a∧b)`) and 31 (`c₁(M(P,δ)) = 2r[ω]`, `τ_WW = 1/(2r)`).

**Claim.** The README's constant is the right one, but the source it leans on displays a different form. `ww-coprime` line 1144–1147 (Remark 3.3.1(a), eq. (26), printed p. 27) defines `ω = ∫⟨a₁∧a₂⟩` with the basic inner product, which for `u(r)` is `⟨ξ,ζ⟩ = −Tr(ξζ)` (line 698–701, Definition 3.2.1(b), p. 17), i.e. without the `1/(4π²)`; Theorem 3.3.3 (line 1234, p. 29) then states `c₁ = 2r[ω]` and Proposition 3.3.2 (line 1191, p. 28) the constant `1/2c`. Those two statements hold for the Atiyah–Bott-normalized form `(1/4π²)∫⟨a∧b⟩`, which is the README's `Ω`, not for the displayed eq. (26). The README says it builds "the adapter from R5's arbitrary invariant pairing, including … integral-class normalizations" (line 9) but never states the `4π²` factor or pins the convention with a computed witness.

**Witness.** Rank one on a surface of genus `g`: connections `A = i·a`, gauge `a ↦ a + dθ` with `θ: X → ℝ/2πℤ`, so the flat moduli is `H¹(X;ℝ)/2πH¹(X;ℤ)`; on an integral symplectic basis `e_j = 2πα_j` the form `∫(−Tr)(a∧b)` takes the value `(2π)²·(α_i·α_j) = 4π²`, so `∫⟨a∧b⟩` is `4π²` times the integral generator while `(1/4π²)∫⟨a∧b⟩` is the generator. Consistency check of the README's constant: `ss-rank-two` line 18 (`r = 2`): `α = 2[ω]` generates `H²(N_g;ℤ)` and line 862: `c₁(TN_g) = 2α`, so `c₁ = 4[ω] = 2r[ω]`.

**Repair.** At line 31 add: "WW's form (26) uses the basic inner product without the `1/(4π²)`; `Ω = ω_WW/(4π²)`, and `c₁ = 2r[Ω]` is the statement that holds (Atiyah–Bott normalization)." Add a Check: the rank-one Jacobian computation above (a plausible wrong normalization, `B = −tr`, would give `c₁ = 2r·4π²[Ω]`, not an integral relation). Recorded as a source misprint below.

## R03 (P3) — GQ5 claims a downstream consumer that does not consume it, and the rank-two odd-degree surface moduli has a second builder

**Location.** `TauCetiRoadmap/GaugeQuiltFieldTheory/README.md` line 139: "The symplectic/quilt construction here supplies the surface correspondence side of that comparison"; line 142 (ownership paragraph).

**Claim.** InstantonFloerTheory is earlier in the merge order (ORDER.txt line 271 versus 272 for this roadmap), so it cannot consume anything here, and at its open head it does not: `TauCetiRoadmap/InstantonFloerTheory/README.md` (head f0af253) never mentions GaugeQuiltFieldTheory or GQ1–GQ5. Its IF9 (line 150) instead constructs its own "smooth compact odd-bundle surface moduli, its tangent `H¹`, symplectic form `−∫tr(a∧b)` and Hodge-star complex structure, rank/degree and genus-one models", i.e. the `r = 2`, `d` odd case of this roadmap's `M(P,δ)`, with a form that differs from `Ω` by the same `4π²` as in R02. So the sentence at line 139 is an overclaim about a consumer, and the ownership paragraph does not say how GQ1's general construction relates to IF9's special one.

**Witness.** `grep -n 'GaugeQuilt\|GQ[0-9]' TauCetiRoadmap/InstantonFloerTheory/README.md` at f0af253 returns nothing; IF9 line 150 quoted above.

**Repair.** Replace line 139's sentence by: "InstantonFloerTheory IF9 constructs its own rank-two odd-degree surface moduli with the form `−∫tr(a∧b)`; GQ1's `M(P,δ)` for `r = 2`, `d` odd is the same quotient with `Ω = (1/4π²)·(−∫tr(a∧b))`, and this comparison is a GQ1 target." Add that comparison to GQ1 (one sentence, after line 33) and name IF9 in the ownership paragraph as the owner of the rank-two odd case used by the instanton comparison.

## R04 (P3) — Process vocabulary and reviewer-response phrasing

**Location.** `TauCetiRoadmap/GaugeQuiltFieldTheory/README.md` line 58 (heading "… and regressions"), line 74 ("Retain the nonspin calibration …", "this corrected target"), line 154 ("the rank-two nonspin regression"); and the recurring negative clauses ("does not substitute for", "is not asserted", "do not replace it by", lines 43, 56, 72, 83, 87, 94, 112, 118, 131).

**Claim.** "Regression", "calibration" and "corrected target" are test-process and revision words; the negative clauses tell a reader a year from now which points were contested in review. The mathematics in each sentence is fine.

**Repair.** Rename the heading "Handle relative-spin lifts and the rank-two nonspin example"; line 74: "The rank-two example `r = 2, d = 1, g = 2 → 3` is not spin: …"; "this corrected target" → "the relative-spin statement above"; line 154: "These supply the rank-two nonspin example in GQ2b". Keep each negative clause only where it fixes a hypothesis (e.g. line 56's `−J` convention) and turn the rest into the positive statement of what is constructed.

## Verified sound

**Gate and build.** Worker's gate at 25e0ea3: every scanner 0, `depcheck=0`, `build=0`, OK. `lake env lean TauCetiRoadmap/GaugeQuiltFieldTheory/Suggested.lean` from the worktree: three `declaration uses sorry` warnings (lines 47, 55, 66), nothing else, exit 0. Diff outside the roadmap folder against origin/main: empty. The folder holds `README.md`, `Suggested.lean`, `metadata.toml` only.

**Dependency check** (`gate --depcheck … --movable`): `depcheck: 204 roadmaps, 1418 edges, 0 problem(s)`; no UPWARD or CYCLE line. As noted in R01 the README contributes no edge, so the direction was checked by hand:

| cited supplier | where it is | position |
|---|---|---|
| HamiltonianReduction R5 | main, `TauCetiRoadmap/SymplecticGeometry/HamiltonianReduction/README.md:305` "R5. Gauge actions over a surface" (left gauge convention `g·A=gAg⁻¹−(dg)g⁻¹`, `Ω_A(a,b)=∫_Σ B(a∧b)`, central-curvature level, rough/smooth quotient comparison, holonomy) | on main |
| SmoothBundlesConnections B1–B5 | main, README lines 219–1209 (B1.0–B1.5, B2.1–B2.5, B3, B4, B5.0–B5.2 holonomy and flat connections) | ORDER line 7 |
| SpinGeometry G4 | main, README line 395 "G4. Spin lifts, obstruction and classification" | on main |
| DGAInfinity | main, README (A∞ algebras, Koszul conventions) | on main |
| AlgebraicTopology, DifferentialGeometry | main | on main |
| HeegaardFloer F0–F3 | main, README: F0.x at lines 1185–1751, F1.1 at 1818, F2.x at 2081–2884, F3 at 2949 | on main |
| FukayaTheory FK0, FK1.1, FK3, FK4.2 | open head 93906cc (rev/1045): lines 95, 174, 338, 442 | ORDER line 209 |
| InstantonFloerTheory | open head f0af253 (rev/1083) | ORDER line 271 |

This roadmap is ORDER line 272, after all of them.

**Seeded sample: InstantonFloerTheory.** Checked at f0af253. The README's ownership statements about it (lines 3, 137, 142) match its IF0–IF8 (Chern–Simons critical connections, cylinder ASD analysis, Uhlenbeck compactification, orientations, cobordism maps) and IF9b/IF10 (the admissible Atiyah–Floer comparison, with the Daemi–Fukaya–Lipyanskiy reference at its line 223 and its `Suggested.lean:28`). It cites HamiltonianReduction R5 (line 17) for the surface input exactly as this roadmap does. The one mismatch is R03.

**Sources read at their locators** (`ww-coprime` = arXiv 1601.04924v2 text, line numbers of the cache):

- Theorem 3.3.3 (lines 1225–1237, p. 29): `g ≥ 1` nonempty compact symplectic of dimension `(2g−2)(r²−1)`, even Chern numbers, `c₁ = 2r[ω]`; `g = 0` empty; `g = 1` a point; always connected and simply connected. Proof (lines 1244–1269) cites Atiyah–Bott [2, Theorem 9.12] for connectedness/simple connectivity and contains the splitting argument `⟨c₁(E₁),[X]⟩ = kd/r` (lines 1253–1261), which is the "parallel-subbundle exclusion" of README line 20. README lines 19–21, 29 agree.
- Remark 3.3.7 and eq. (31) (lines 1320–1340, pp. 31–32): `z = exp(2πi d/r)Id`, the homeomorphism of `M(P)` with `{(a₁,…,b_g) : ∏[a_j,b_j] = z}/G₀`. README lines 13 and 17 agree.
- Theorem 3.4.3 (lines 1366–1385, pp. 32–33): `ρ: M(Q) → L(Q)` a Lagrangian embedding; for an elementary bordism `L(Q)` "simply-connected and spin", the spin clause argued from "G₀ simply-connected, so the representation g₀ is spin". Lemma 3.4.5 (lines 1429–1444): `L(Q)` is the set of pairs `([a₁,…,b_g],[a₁,…,b_g,a_{g+1},Id])`, a `G₀`-bundle over `M(P₋)` with vertical tangent the associated bundle of `g`. README lines 60–62 and 74 agree, and the README is right that the spin clause fails: see the table row on the rank-two example.
- Theorem 3.5.1 (lines 1489–1499): the connected field theory `Bor⁰_{2+1} → Symp` for coprime `d, r`. Definition 2.2.1 (line 190), 2.2.6 (line 297), Theorem 2.2.13 (line 442) exist as cited by GQ3/GQ5.
- Definition 3.1.7 (lines 586–595): monotone means `τc₁ = [ω]`, admissible adds compact and even minimal Chern number; the generalized-object definition at line 1590 ("compact simply-connected monotone") matches README line 108.
- `ss-rank-two` lines 18 (`α = 2[ω]` generates `H²`), 30–32 (`α mod 2 = w₂(E)` for an `SO(3)`-bundle with `β = p₁(E)`), 862 (`c₁(TN_g) = 2α`, inside §4.2 which starts at line 811). `ss-newstead` lines 18–28 (free `SO(3)` action by simultaneous conjugation on `f_g⁻¹(−1)`, a principal `SO(3)`-bundle over `N_g`), 305 (`N_g` simply connected, Newstead Cor. 1), 314–318 (Proposition 1: `d₂(x⊗y^i) = αx⊗y^{i−1}`, collapse at `E₃`). README lines 74 and 153–154 agree.
- `mww-functors` is v5 (23 Feb 2018), title and authors "S. Ma'u, K. Wehrheim, and C. Woodward" (line 7), abstract states the composition theorem for smooth embedded compositions (lines 8–12); README line 150 and the "Concatenation remains the object operation when such geometric replacement is unavailable" clause (line 126) agree. `ww-orientations` Theorem 1.0.1 (line 143) is the relative-spin orientation theorem the README's GQ2c–GQ4 adapt.

**Adversarial table.**

| statement | instances tried | values on each side | result |
|---|---|---|---|
| `relationSet r ζ g` (Lean 33–35) | `g=0, r=2, ζ=−1`; `r=1, ζ=1`, any `g`; Mathlib commutator convention | empty product `= 1 ≠ −1` ⇒ `∅`; `SU(1) = {1}`, `1 = 1·1` ⇒ one point; `commutatorElement_def : ⁅a,b⁆ = a*b*a⁻¹*b⁻¹` = README's `ABA⁻¹B⁻¹` | matches README line 26 |
| Check line 25 | `A = diag(i,−i)`, `B = [[0,1],[−1,0]]` | `det A = i·(−i) = 1`, `det B = 1`, `BAB⁻¹ = diag(−i,i) = −A`, so `ABA⁻¹B⁻¹ = A·(−A⁻¹) = −1` | true |
| `relationModuli` is simultaneous conjugation | `ConjAct.toConjAct_smul : g • h = g*h*g⁻¹`, `Prod`/`Pi` actions pointwise | orbit of `x` = `{(uA_ju⁻¹, uB_ju⁻¹)_j}` | matches README line 17; quotient topology instance synthesizes (`TopologicalSpace (relationModuli 2 (−1) 1)`) |
| `relationModuli_genus_one` (Lean 47) | `r=1`; `r=2, ζ=−1`; wrong model `r=2, ζ=1` | point; nonempty by the row above and `ABA⁻¹ = ζB` forces `spec(B) = λμ_r` of size `r`, `det` fixes `λ^r` up to the sign `ζ^{r(r−1)/2} = (−1)^{r−1}`, Heisenberg uniqueness ⇒ one orbit; `ζ=1`: `(1,1)` and `(diag(i,−i),diag(i,−i))` are non-conjugate solutions ⇒ not a subsingleton | true; `IsPrimitiveRoot` excludes the wrong model |
| `relationSet_stabilizer_central` (Lean 55) | `r=2, ζ=−1, g=1, u = diag(e^{iθ},e^{−iθ})`; `g=0, r≥2`; wrong model `ζ=1`; eigenspace route | `uBu⁻¹ = B` iff `e^{2iθ}=1` iff `u=±1` ∈ center; `g=0`: relation set empty, vacuous; `ζ=1, x=(1,1), u=diag(i,−i)` commutes and is not central ⇒ false without primitivity; `V` an eigenspace of dim `m`, restricted commutator product has `det = 1 = ζ^m` ⇒ `r ∣ m` ⇒ `m=r` | true; negative control is README line 27's hypothesis remark |
| `relationModuli_simplyConnected` (Lean 66) | `g=1`; `r=1`; `g=2, r=2, ζ=−1`; wrong model `g=0, r≥2` | point; point; `N(2,1)`, `π₁ = 0` (`ss-newstead` 305, `ww-coprime` 1237); empty space is not `SimplyConnectedSpace` (`simply_connected_iff_unique_homotopic` at `Mathlib/AlgebraicTopology/FundamentalGroupoid/SimplyConnected.lean:43` requires `Nonempty`) | true; `hg : 1 ≤ g` is exactly what excludes the wrong model |
| `IsPrimitiveRoot ζ r ↔ gcd(r,d)=1` (README 17) | `ζ = exp(2πi d/r)`, `r=2`: `d=1` gives `−1`, `d=2` gives `1` | primitive iff `d` odd | true |
| `c₁ = 2r[ω]`, `τ_WW = 1/(2r)` (README 31) | `r=2` via `ss-rank-two`; `r=1` Jacobian | `c₁ = 2α = 4[ω] = 2r[ω]`; `∫(−Tr)(a∧b)` on `2πℤ`-basis = `4π²` per integral generator | true for `B = −tr/(4π²)`; source displays the form without `1/(4π²)` (R02) |
| `τ_FK = τ_WW/2 = 1/(4r)` (README 92) | FukayaTheory line 342: `ω(B) = 2τc₁(B)`, `ω(β) = τμ(β)` | `[ω] = τ_WW c₁ = 2τ_FK c₁` ⇒ `τ_FK = 1/(4r)`; with `μ = 2c₁` on the simply connected support, `ω(β) = τ_FK μ(β)` | consistent |
| `μ ∈ 4ℤ` (README 94) | even Chern evaluations, `μ(β) = 2c₁(A)` | `2·(2ℤ)` | true |
| `w₂(TN_g) = 0` from even Chern (README 54) | `H₁(N)=0` | `H²(N;ℤ) ≅ Hom(H₂,ℤ) ⊕ Ext(H₁,ℤ) = Hom(H₂,ℤ)`, torsion-free; `c₁ = 2x`; `w₂ = c₁ mod 2 = 0` | true |
| `δ(E)` (README 56) | `k = 1, 2, ≥3` | `π₁(SO(k)) → π₁(SO(2k))`: trivial; `ℤ → ℤ/2`, `1 ↦ 2 = 0`; `ℤ/2 → ℤ/2`, `1 ↦ 2 = 0`; `w₂(E⊕E) = 2w₂(E) + w₁(E)² = 0` for oriented `E` | true |
| `−J` orientation sign `(−1)^m` (README 56) | `m = 1`: `(ℂ, −i)` | orientation reversed | true |
| handle model and `w₂(TL_g) = p*b_g + q*b_{g+1}` (README 62–70) | `g` even; `g` odd; right log derivative | `TL_g ≃ p*TN_g ⊕ p*E_g` with vertical `R_g ×_{Ad} su(r)` (`v ↦ vC⁻¹` is `Ad`-equivariant: `(uvu⁻¹)(uCu⁻¹)⁻¹ = u(vC⁻¹)u⁻¹`); `w₂ = 0 + p*η_g`; even: `0 + q*η_{g+1} = p*η_g` via `q*E_{g+1} ≅ p*E_g` (fibers over `[x,C]` are the same `PSU(r)`-orbit of `(x,C,1)`); odd: `p*η_g + 0` | consistent |
| rank-two nonspin example (README 74) | `r=2, d=1, g=2→3` | `L_g = S(ℝ⊕E_g)`, identity section `C = 1`, `s*TL_g = TN_g ⊕ E_g`, `w₂ = 0 + α mod 2 ≠ 0` (`ss-rank-two` 30–31; `ss-newstead` Prop. 1 `d₂(1⊗y) = α`) | `L_g` not spin; WW Theorem 3.4.3's spin clause fails (source error below) |
| composition stable isomorphism (README 83) | exact sequence `0 → TF → TL_01 ⊕ TL_12 → TM_1 → 0` on a transverse fiber product | `TL_01 ⊕ TL_12 ≃ TF ⊕ TM_1`, add `B_0 ⊕ B_1 ⊕ B_1 ⊕ B_2` to both sides, `F ≅ L_02` | consistent |
| determinant-line conventions (README 87) | two blocks of index `i₁, i₂` | Koszul sign `(−1)^{i₁ i₂}` on `det(coker)*⊗det(ker)` graded by `ind` | standard, consistent |
| cohomological grading (README 110) | `k = 1, 2` | `|m₁| = 1`, `|m₂| = 0` | consistent |
| weighted adjoints (README 126) | `D = ∂_s + A`, weight `e^φ` | `e^φ D e^{−φ} = ∂_s + A − φ′`; unweighted formal adjoint `−∂_s + A − φ′`; Hilbert adjoint on `L²(e^{2φ}ds)`: `e^{−2φ}(−∂_s + A)e^{2φ} = −∂_s + A − 2φ′`; opposite-weight dual `−∂_s + A` | all three formulas correct and distinct as stated |
| shift congruence (README 133–135) | `a = 1, b = −1`; relation axioms | `G S_D^b F S_C^a ≃ G F S_C^{a+b}` using `S_D F ≃ F S_C`; `k = 0`, `−k`, `k + l` give refl/sym/trans | true |
| tensoring (README 35) | `L` of degree `ℓ` | `det(P⊗L) = det P ⊗ L^r`, degree `d + rℓ`, connection `δ + ra`; residues `1 ≤ d′ ≤ r−1` for `r ≥ 2` | true |
| Check line 27 (pillowcase) | commuting pairs in `SU(2)` | simultaneously diagonalizable ⇒ `(T×T)/(ℤ/2)`, quotient of `T²` by `x ↦ −x`, a 2-sphere, not a point | true negative control |
| rank one (README 33) | any `g`, any `d` | `SU(1) = {1}`, moduli a point | true |

**Generality.** README lines 19–21 state the three theorems for `r ≥ 1`, `IsPrimitiveRoot ζ r`, genus `g` (any `g` for the stabilizer, `g ≥ 1` for simple connectivity); the elaborated signatures (`#check @` of all five declarations, scratch) carry exactly `(hr : 1 ≤ r) (hζ : IsPrimitiveRoot ζ r)` and `(hg : 1 ≤ g)`; no binder lost. Note (not a finding): `hr` is dispensable (for `r = 0` the matrix type is a singleton and all three conclusions hold, and `IsPrimitiveRoot 2 0` is satisfiable), but it documents the README's `r ≥ 1` and is harmless.

**Headlines and padding.** Headlines listed from the README: the connected field-theory functor (GQ4–GQ5), the smooth symplectic structure, dimension and `c₁ = 2r[ω]` (GQ1), the elementary correspondences and the relative-spin identity (GQ2), Cerf invariance (GQ3), and the representation-model statements (GQ1). Only the last are statable at the pins (no bordism categories, `A∞` categories, Lagrangians, Stiefel–Whitney classes or Cerf theory at the pin), and the module docstring says so with the missing carriers. One-tactic probe on a scratch copy: `relationModuli_genus_one` with `simp`/`infer_instance` leaves the `Subsingleton` goal; `relationSet_stabilizer_central` with `simp_all`/`Subgroup.mem_center_iff` leaves the commutation goal; `relationModuli_simplyConnected` with `infer_instance`/`simp` makes no progress. No padding.

**Library declarations opened at the pin.** `commutatorElement_def`, `ConjAct.toConjAct_smul`, `MulAction.orbitRel`, `Matrix.specialUnitaryGroup` (`= unitaryGroup ⊓ MonoidHom.mker detMonoidHom`, a `Submonoid (Matrix n n α)` with `Group` instance), `IsPrimitiveRoot`, `SimplyConnectedSpace` and `simply_connected_iff_unique_homotopic` (`Mathlib/AlgebraicTopology/FundamentalGroupoid/SimplyConnected.lean:40–45`), the quotient-topology instance on `relationModuli`. No `CompactSpace` instance on `Matrix.specialUnitaryGroup` exists at the pin (not needed by the file).

**Duplication.** `roadmaps grep` for `specialUnitaryGroup|relationModuli|relationSet`, `coprime rank|fixed determinant`, `quilt`, `Atiyah.?Floer`, `Wehrheim` over main and the 433 open heads: no other roadmap states the twisted relation moduli, quilted functors or the coprime field theory; `Matrix.specialUnitaryGroup` is used elsewhere only as a carrier (CompactGroups, LieGroups, McKaySkewGroup). The one object overlap is IF9's rank-two odd surface moduli (R03). The worker's citation resolver found no missing cross-roadmap citation or Lean name; confirmed.

## Not verifiable

- Atiyah–Bott, *The Yang–Mills equations over Riemann surfaces* (Phil. Trans. 1983), Theorem 9.12, cited by README line 21 through WW: paywalled; checked only that `ww-coprime` line 1266 cites it for exactly that clause.
- Drezet–Narasimhan, *Groupe de Picard …* Theorem F (`c₁ = 2r[ω]`, `ww-coprime` line 1220) and Meinrenken–Woodward [37]: not fetched; the `r = 2` instance was confirmed from `ss-rank-two` instead.
- Newstead 1967 Corollary 1 (simple connectivity of `N_g`): read through `ss-newstead` line 305 only.

## Source issues

- **Error** in ww-coprime at Theorem 3.4.3 and its proof, printed pp. 32–33: the source says that for an elementary bordism the correspondence `L(Q)` is spin because its vertical tangent is associated to a bundle with simply connected structure group `SU(r)`; it should be that the bundle `L(Q) → M(P₋)` has structure group `PSU(r)` and `L(Q)` is only relatively spin for the adjoint background (for `r = 2`, `g = 2 → 3` the vertical bundle has `w₂ = α mod 2 ≠ 0`); affects a stated result.
- **Misprint** in ww-coprime at Remark 3.3.1(a) eq. (26) with Definition 3.2.1(b), printed pp. 27 and 17, read against Proposition 3.3.2 and Theorem 3.3.3, pp. 28–29: the source says the form is `∫⟨a∧b⟩` with the basic inner product `−Tr`, while stating monotonicity constant `1/2c` and `c₁ = 2r[ω]`; it should be `(1/4π²)∫⟨a∧b⟩` for those constants (on the rank-one Jacobian the displayed form is `4π²` times the integral generator); affects a stated result (normalization only).
