# Review of AlgebraicGromovWittenTheory (pull request #1998 at 2457b2a)

**Verdict:** needs changes

## R01 (P3) — Three contracted suppliers appear in no *Needs:* line, and Layer 0's Dependencies omit the supplier §0.2 needs

**Location:** `TauCetiRoadmap/AlgebraicGromovWittenTheory/README.md:175–179, 244, 523, 537`: "*Needs:* §§2.1, 3.4 and VirtualFundamentalClass §§3.3, 6.1."; "MotivesAndAlgebraicCycles and SchemeAndStackFoundations Layer 5."

**Claim:** The contracts list AlgebraicVectorBundles L1A–L2B, DerivedModuleAlgebra §§0.4, 0.25 and EnhancedDerivedSheaves §0.3, E1.8, but no target or layer names them. §4.1 uses `Rπ_*`, duals, perfectness and square-zero obstructions; §4.2 uses vector-bundle resolutions. Layer 0's Dependencies omit VirtualFundamentalClass.

**Witness:** The three names occur only at lines 175–178. Line 234 reads "*Needs:* MotivesAndAlgebraicCycles §0.5 and VirtualFundamentalClass §§2.2, 2.5"; line 244 lists neither VirtualFundamentalClass nor any target using SchemeAndStackFoundations Layer 5.

**Repair:**
- §4.1: "*Needs:* §§2.1, 3.4, VirtualFundamentalClass §§3.3, 6.1, EnhancedDerivedSheaves §0.3 and E1.8, and DerivedModuleAlgebra §§0.4, 0.25."
- §4.2: "*Needs:* §§3.2, 4.1, AlgebraicVectorBundles L1A–L2B and VirtualFundamentalClass §7.3."
- Layer 4 Dependencies: append "AlgebraicVectorBundles L1A–L2B, DerivedModuleAlgebra §§0.4, 0.25 and EnhancedDerivedSheaves §0.3, E1.8".
- Layer 0 Dependencies: "MotivesAndAlgebraicCycles §§0.5, 3.1 and VirtualFundamentalClass §§2.2, 2.5."

## R02 (P3) — The Novikov pushforward, rescaling and grading used in §§1.2, 8.1 and 8.4 exist at the pin and are not cited

**Location:** `TauCetiRoadmap/AlgebraicGromovWittenTheory/README.md:918–919, 298, 982`: "group the resulting Novikov monomials by their functional on the original divisor lattice"; "Replacing the ample degree by a positive multiple gives the same convergent series."

**Claim:** §8.1's grouping of monomials along `NE(X_K) → NE(X)` is the pinned continuous pushforward ring map; §1.2's rescaling and the grading `deg Q^β = 2c₁(T_X)·β` of §8.4 are pinned as well. "From Tau Ceti" names none of them.

**Witness:** `TauCeti/RingTheory/NovikovSeries/Functoriality.lean:184` `mapRingHom` (hypothesis `∃ c > 0, ∀ h, N' (φ h) = c * N h`; here `c = 1`), `:302` `continuous_mapRingHom`; `Equiv.lean:192` `rescaleContinuousAlgEquiv`; `Grading.lean:92, 165` `gradeBy`, `gradeBy.gradedMonoid`.

**Repair:** Append to "From Tau Ceti": "For the field-extension comparison of §§4.5 and 8.1 use `NovikovSeries.mapRingHom` with `continuous_mapRingHom` along the restriction `NE(X_K) → NE(X)`, which preserves `ω_A`. For positive multiples of the ample class use `NovikovSeries.rescaleContinuousAlgEquiv`. For the grading of §8.4 use `NovikovSeries.gradeBy` and `gradeBy.gradedMonoid` with degree `β ↦ 2c₁(T_X)·β`." Test on the quadric Check of §1.1: both ruling monomials `Q^(1,0)`, `Q^(0,1)` have image `s`, giving `H⋆H = 2p+2s`.

## R03 (P3) — Nine definitions have fewer than three Checks

**Location:** `TauCetiRoadmap/AlgebraicGromovWittenTheory/README.md` §1.1 (two Checks, line 276), §§2.3, 3.4, 3.5, 4.1, 4.3, 9.4, 10.3 (one each, lines 395, 468, 491, 527, 563, 1082, 1163), §5.4 (two, line 699).

**Claim:** Each of these sections defines an object (curve-class monoid, stabilization, universal maps, gluing, obstruction complex, virtual class, stabilized class, fundamental solution, small connection) and lists fewer than three discriminating Checks.

**Witness:** Count of bullets under each `**Checks.**` heading at the lines above; §8.1, by comparison, has three.

**Repair:** Add the following (values computed):
- §1.1: "On `ℙ¹` with `A = 𝒪(2)`, `ω_A(β) = 2β`; exactly the two classes `0, 1` have `ω_A ≤ 3`."
- §2.3: "A genus-one curve with a rational tail carrying the single marking stabilizes to the genus-one curve marked at the node; deleting the marking would give the unstable type `(1,0)`." "A chain of three rational curves with markings `1,2 | ∅ | 3,4` stabilizes to the boundary point `12|34` of `Mbar 0 4`."
- §3.4: "For `β = 0` in the stable range every `ev_i` is the projection `Mbar g n × X → X` and `st` is the other projection." "On `MbarMap 0 3 ℙ¹ 1`, `(ev₁,ev₂,ev₃)` is birational onto `(ℙ¹)³`, both of dimension three, and `st` maps to the point `Mbar 0 3`."
- §3.5: "External gluing of `MbarMap 0 {1,2,a} X 0` and `MbarMap 0 {3,4,b} X 0` is the closed immersion `X → Mbar 0 4 × X` at the point `12|34`, of degree one." "Gluing `MbarMap 1 {a} X 0 ×_X MbarMap 1 {b} X 0 → MbarMap 2 0 X 0` has degree two onto its image."
- §4.1: "At a genus-two constant map to a curve, `H⁰` has rank one and `H¹` rank two; the rank is `−1 = d(1−g)`."
- §4.3: "`MbarMap 0 0 ℙ² 1` is the dual plane; `vdim = −1+3 = 2` and the virtual class is the fundamental class." "For a threefold with `c₁ = 0` and `n = 0`, `vdim = 0` for every `g` and `β`; at `g = 2`, `β = 0` the stack `Mbar 2 0 × X` has dimension six."
- §5.4: "For an elliptic target at `(1,1,0)` with a point insertion, the class is `−λ₁` on `Mbar 1 1`, of codimension `1 = c+d(g−1)` and degree `−1/24`."
- §9.4: "On `ℙ¹` the coefficient of `t_H` is `−z⁻¹[[0,Q],[1,0]]` in the basis `(1,H)`." "Along the unit coordinate alone the solution is `exp(−t⁰/z)·id` for every `X`."
- §10.3: "On `ℙ¹`, `∇^small_H(H) = z⁻¹Q·1`." "On `ℙ¹×ℙ¹` with `h₁⋆h₁ = Q₁`, both `∇_{h₁}∇_{h₂}h₁` and `∇_{h₂}∇_{h₁}h₁` equal `z⁻²Q₁h₂`, since `δ_{h₂}Q₁ = 0`; using `δ_{h₁}` in `∇_{h₂}` would add `z⁻¹Q₁`."

## Previous findings

- R01 (curve classes over a non-closed field) — repaired: lines 97–102, "The class of an integral one-cycle on `X_k̄` is its functional on the numerical Cartier divisor lattice `N¹(X)_ℤ` over `k`"; §1.1 lines 251–256 give the Galois-orbit argument; the quadric Check (line 277) recomputes to `2s²+2sp` on both sides.
- R02 (§5.4 comparison) — repaired: lines 676–681 state the identity after capping with the virtual class; the `ℙ²` excess example is at lines 686–688.
- R03 (§6.5 recursion) — repaired: formula at lines 804–810, with Kontsevich–Manin 1998 Thm. 1.2 and Cor. 1.3 for general targets and Kock 5.4.1 for the homogeneous case.
- R04 (five locators) — repaired: lines 350, 436, 484–485, 736, 1071.
- R05 (Iritani locators) — repaired: lines 1038, 1152, 1193.
- R06 (uncited pinned API) — repaired: lines 140–155 and 317–320. The further Novikov declarations of R02 above were not in that list.
- R07 (Checks) — partly repaired: every definition now has a Check, and the two non-discriminating Checks are replaced (lines 1021, 1062). Nine definitions remain below three (R03 above).
- R08 (symplectic roadmap unnamed) — repaired: lines 73–76.

## Verified sound

| Statement | Instances | Roadmap side | Independent value | Result |
|---|---|---|---|---|
| 2.3 Stabilization | `(g,n)` single vertex; `(0,0)` | flat; `Mpre` smooth of dimension `3g−3+n` | `behrend-1997` lines 99–100, 117: `#S−#E−3χ = n−3(1−g)`; `−3` at `(0,0)` | true |
| 3.1 Stable-map stack | `MbarMap 0 0 ℙ¹ 1`; `(0,2,0)` | point; empty | `vdim = −2+0+2 = 0`; `behrend-manin-1996` lines 466–474 (p. 12), 1009–1013 | true |
| 3.2 Boundedness, quotient | locators | §2.3 p. 13; §§3–4 pp. 14–26; §5.1 p. 26 | `fulton-pandharipande-1997` lines 687, 724, 730–1321, 1337 | true |
| 4.1 Obstruction complex | `ℙ¹ (0,·,1)`; elliptic `(1,·,0)`; curve `(2,·,0)` | rank `d(1−g)+c₁·β`: 3; 0 | `behrend-1997` lines 157–161: `χ·dim V − β(ω_V)`; 3; `1−1 = 0`; `1−2 = −1` | true |
| 4.2 Global resolution | Behrend Prop. 5 | two-term bundle resolution | `behrend-1997` lines 165–186: `[R¹π_*H → R¹π_*F]` | true |
| 4.3 Virtual dimension | `ℙ² (0,0,1)`; elliptic `(1,1,0)` | `(1−g)(d−3)+n+c₁·β`: 2; 1, class `−λ₁`, `−1/24` | lines 193–196; `c₁(T_E ⊠ 𝔼^∨) = −λ₁`, `∫_{Mbar 1 1}λ₁ = 1/24` | true |
| 4.4 Point and class zero | `X = pt`; `g = 0` | `[Mbar g n]`; `[Mbar 0 n × X]` | `kontsevich-manin-1998` lines 135–138, eq. (5): `c_G` with `G = g·dim V = 0` | true |
| 5.5 Product formula | Behrend Thms. 1, 9 | `h_*[X×Y]vir = Δ^!([X]vir × [Y]vir)` | `behrend-product` lines 186–192, 447–448; `Δ` diagonal of `M(τ^s)` | true |
| 6.2 Dilaton | point `(0,3)`; point `(1,1)`; `(1,0,0)` | `(2g−2+n)⟨…⟩` | `⟨τ₁τ₀³⟩ = 1 = 1·1`; `⟨τ₁τ₁⟩₁ = 1/24 = 1·1/24`; `(1,0,0)` excluded by Conventions; `kock-psi-notes` line 1589, KM98 lines 279–280 | true |
| 7.3 Potential identities | point | third derivatives kill degree ≤ 2 terms | `F₀ = t³/6`, `∂_0F₀ = t²/2 = ½(t,t)` | true |
| 8.3 Big product | point; `ℙ¹` divisor slice | `1⋆_t1 = 1`; `H⋆_tH = Qe^{t_H}` | `∂³(t³/6) = 1`; `Σ_n ⟨H,H,H,H^n⟩₁/n! = e^{t_H}`; FP lines 1948–1974 | true |
| 8.4 Grading | general; `ℙ¹` | products homogeneous of degree zero; `ℤ/4` | `2c₁β+Σ(2−2p_i)+2d−2p_c = 2(p_a+p_b)`; `N_X = 2` | true |
| 9.2 Curvature | general; converse | `z⁻¹(∂_aC_b−∂_bC_a)+z⁻²[C_a,C_b]` | expansion gives the same; `C_cC_ab = (a⋆b)⋆c`, `C_aC_cb = a⋆(b⋆c)`; `iritani-2008` lines 310–317 | true |
| 10.1 Rees algebra | one parameter | `(z∂)²t² = t²(z∂)²+4zt(z∂)+2z²` | `Pt = tP+z` twice gives the same | true |
| 10.3 Small connection | `ℙ¹`; `ℙ¹×ℙ¹` | `∇_H(Q·1) = Q·1+z⁻¹QH`; flat | `δ_HQ = Q`; both orders give `z⁻²Q₁h₂`; `iritani-2008` line 315 | true |
| 1.1 Quadric Check | nonsplit quadric over `ℚ` | `H⋆H = 2p+2s`, `H⋆p = sH`, `p⋆p = s²` | from `h₁⋆h₁ = q₂`, `h₁⋆h₂ = pt`, `hᵢ⋆pt = qⱼhⱼ`: both associations `2s²+2sp` | true |
| 5.4 Capped comparison | `ℙ¹`, `τ₁(H),H,1`, `β = 1`; `MbarMap 1 1 ℙ² 3` | `1−0 = 1`; excess 11 > 10 | `⟨H,H⟩_{0,1}·g^{H1}·⟨1,H,1⟩_{0,0} = 1`; `1+10 = 11`, `vdim = 1+9`; KM98 lines 81–94 | true |
| 6.4 Separating splitting | general | inverse-metric contraction without Künneth | `deg Δ^!(A₁×A₂) = deg_X(ev_*A₁·ev_*A₂) = Σ g^{ef}(A₁,T_e)(T_f,A₂)` | true |
| 6.5 Recursion | point, `n = 4` | `∫ψ₁ = 1` | `S₁ = {4}`: `1·1·1`; `S₁ = ∅` unstable | true |
| 0.2 / Layer 0 | Needs against Dependencies | line 244 | line 234 names VirtualFundamentalClass §§2.2, 2.5 | R01 |
| 8.1 Field extension | quadric, `K = ℚ(√disc)` | "group the monomials" | `mapRingHom` with `c = 1`: `Q^(1,0), Q^(0,1) ↦ s` | true; uncited (R02) |
| Headline 1: moduli and class | `ℙ²`; point | `vdim` 2; `[Mbar g n]` | as rows 4.3, 4.4 | true |
| Headline 2: equations | string `ℙ¹ ⟨1,τ₁(H),H⟩₁`; divisor `⟨H,H,H⟩₁` | 1; 1 | `⟨H,H⟩₁ = 1`; `(H·1)·1 = 1` | true |
| Headline 3: WDVV | `ℙ²`, degree 2 | `N₂ = 1` | Kontsevich recursion with `N₁ = 1` gives 1 | true |
| Headline 4: small ring | `ℙ¹`; `ℙ^r`; quadric over `ℚ` | `H² = Q`; `H^{r+1} = Q`; associative | `⟨H,H,H⟩₁ = 1`; FP §10; row 1.1 | true |
| Headline 5: big ring | point; `ℙ¹` | constant; `Qe^{t_H}` | row 8.3 | true |
| Headline 6: connections | point; `ℙ¹` | `∂_t+z⁻¹`, solution `exp(−t/z)`; pairing flat | `C_0 = id`; `S(∇_H1,1)+S(1,∇_H1) = −z⁻¹+z⁻¹`; `iritani-2008` lines 385–404 | true |

- Source locators checked against the texts: 38 (Behrend 1997: 7; Behrend–Manin: 6; Fulton–Pandharipande: 7; Kontsevich–Manin 1998: 6; Kock: 5; Iritani: 5; Behrend product formula: 2). Every sampled locator supports its statement.
- Library declarations opened at the pins: 24, among them `TauCeti/RingTheory/NovikovSeries/Basic.lean:92`, `Derivation.lean:70, 135`, `Multiplication.lean:181, 435`, `Topology.lean:93, 263`, `TopologicalRing.lean:157`, `Functoriality.lean:184, 302`, `Equiv.lean:192`, `Grading.lean:92`; `AlgebraicGeometry/Curves/StableMaps/Basic.lean:73, 88`, `Contracted.lean:95`, `DualGraph/Basic.lean:105, 121`, `Clutching.lean:77, 177`, `Contraction.lean:165`, `Stabilization.lean:64`; `Chow/Basic.lean:295`; `LineBundle/Ample.lean:71`; Mathlib `MvPowerSeries/PiTopology.lean:114`, `Substitution.lean:182, 324` (discrete uniformity required), `Derivative.lean:117`, `Inverse.lean:136`.
- Cross-roadmap citations resolved: 31, all present. On main: SchemeAndStackFoundations Layer 1, §§4.14, 4.15, Layer 5; StableReduction Layers 9–11; AlgebraicModuliForArithmeticGeometryPartII §§1.1–1.4, 1.7(iii); AlgebraicVectorBundles L1A–L2B; DerivedModuleAlgebra §§0.4, 0.25; EnhancedDerivedSheaves §0.3, E1.8. At open heads: MotivesAndAlgebraicCycles §§0.5, 3.1; StableReductionPartII §§3.1–3.3, 3.11; VirtualFundamentalClass §§2.2–2.5, 3.3, 6.1, 7.3, 9.2 and Layers 2, 3, 6–9.
- Dependency check: `depcheck: 264 roadmaps, 2580 edges, 0 problem(s)`; no UPWARD or CYCLE line. The gate passed every check on 2457b2a; nothing changes outside the folder.
- Elaboration: `lake env lean` on `TauCetiRoadmap/AlgebraicGromovWittenTheory/Suggested.lean` exits 0 with no output. The file declares nothing, so the `#check` comparison and the one-tactic probe do not apply. None of headlines 1–6 is statable at the pins (no algebraic stacks, no rational Chow groups of Deligne–Mumford stacks, no virtual class); the docstring names each missing carrier.
- Pull-request text: the title and description agree with the head; the description says the roadmap is new and names its suppliers.
- Ownership: StableReduction's boundary section leaves the stable-map moduli object and its properness to a later roadmap; VirtualFundamentalClass's Scope excludes moduli of stable maps and Gromov–Witten invariants; VirtualFundamentalClassPartII and MotivicStructuresInModuliOfCurves cite this roadmap or its suppliers for the shared objects. No `Suggested.lean` name can collide, the file having none.
- Overlap check: read GromovWittenTheory, StableReduction, AnalyticStableMaps, VirtualFundamentalClass, VirtualFundamentalClassPartII, MotivicStructuresInModuliOfCurves, StableReductionPartII; nothing shared (GromovWittenTheory's invariants and quantum product are on `H^*(X;ℚ)` of a symplectic manifold, a different carrier; the stable-map stack, its virtual class and `Mpre` are owned here).
- Source independence: 20 passages compared with 8 sources, none shared; largest share iritani-2008, 10 of 52 locators; contents compared with iritani-2008 (§§2.1–2.3) and fulton-pandharipande-1997 (§§1–10): independent.

## Not verifiable

- Fulton, *Intersection Theory*: not open access; cited in References without a locator.
- Dubrovin 1996 and Behrend–Fantechi: cited in References without a locator, so nothing to check.
- Kontsevich–Manin 1994 §§2.2.3–2.2.7, 2.3.8: fetched but outside this round's sample; not re-read.

## Source issues

- **Misprint** in kontsevich-manin-1998 at §1.1, p. 2: the source says the stable range is `2g − 2 − n > 0`; it should be `2g − 2 + n > 0`, as its Theorem 1.2 uses; affects nothing.
- **Gap** in kontsevich-manin-1998 at Theorem 1.2, p. 3: the source sketches the proof and defers the virtual-class argument to a later text; it should derive the identity from the pullback property of the virtual classes; affects the proof.
- **Gap** in kock-psi-notes at 4.3.1, p. 44: the source states the string and dilaton equations for stable maps without proof; it should derive them from pullback of the virtual class along the forgetting map; affects the proof.

## For the human reviewers

- **Licence.** `kock-psi-notes` is an unpublished set of notes read from the author's page (cited at README lines 736, 746, 813–816); the general-target statements it supports are also cited to Kontsevich–Manin 1998.
- **Licence.** The description discloses that the roadmap and its text were drafted with OpenAI Codex under the author's direction.
