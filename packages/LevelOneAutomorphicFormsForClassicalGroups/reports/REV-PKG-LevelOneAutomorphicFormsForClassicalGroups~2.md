# Review of LevelOneAutomorphicFormsForClassicalGroups (package, round 2)

**Verdict:** needs changes

Twelve findings: four P1, three P2, five P3; seven blocking. These are local repairs, not a rejection of the scope. The four Lean headlines elaborate and survived the padding probes. The package's mathematical claims still need the corrections below.

## Previous findings, checked individually

Locations below refer to `packages/LevelOneAutomorphicFormsForClassicalGroups/README.md` unless another file is named. The repair report marks no finding “not actionable in this package.”

| Previous finding | Repaired passage | Assessment and evidence |
|---|---|---|
| F01 | §5.4: “dimension between 14 and 42”; §5.7: “at most 183” | **Partly repaired.** The original errors are fixed: CT20 lines 1431, 1503 give the range and `U_exc ∉ V`; `181 + 2 = 183`. The additional change in §5.8, “then every element of V,” wrongly deletes the surviving exception; see R05. |
| F02 | §2.2: “The kernel g is odlyzkoKernel of SmallRamificationAndAbelianVarietyBaseCases §1.5” | **Repaired.** Its §§1.5–1.7 supply the kernel, Poitou function and strip positivity. The retained `C²` refinement has `g″(0)=−π²`, `g″(1)=0`; the Fourier adapter sends `s=0,1` to `−i/(4π),i/(4π)`. |
| F03 | §4.6: “Import the Zassenhaus formula” | **Repaired.** SymplecticReidemeisterTorsionModSquares #1645, `TauCetiRoadmap/SymplecticReidemeisterTorsionModSquares/README.md:751`, §4.1 supplies the primary-space formula. For the order-four rotation, `det((1+γ)/2)=1/2` and `Q(−1)=2`, ratio `1/4`, a square. Only its characteristic-polynomial translation remains here. |
| F04 | Supplier contract: “What CFSGBasicProperties must provide (gap:conway-group-average-charpoly)” | **Repaired differently, correctly.** The identical slug is in the plan. P2-L owns the Conway group but does not yet give the average. This precise gap preserves the unconditional lattice route. The alternative through §8.8 carries Arthur premises and is not used to justify the unconditional Lean headlines. |
| F05 | Contract: “for p = 2 and every regular quadratic form q on ℤ₂ⁿ” | **Repaired.** The plan agrees. GeometryOfNumbersAndQuadraticArithmetic #851, `TauCetiRoadmap/GeometryOfNumbersAndQuadraticArithmetic/README.md:593`, §2.4.2 supplies the nondyadic unimodular statement. Regular polar determinants `±1,±2` are units at odd primes; rank-one special orthogonal groups are trivial. R10 concerns a separate endpoint error in its example. |
| F06 | Remaining contract: “LieHighestWeight Layer 6 and ClassicalGroups Layers 3–5” | **Repaired.** The unsupported RootSystems clause has been deleted; no remaining Needs line consumes it. |
| F07 | §6.3: “using the p-neighbour relation of IntegralLattices §4G” | **Repaired.** The carrier is explicitly attributed to Completed/IntegralLattices Layer 1. Main `TauCetiRoadmap/IntegralLattices/README.md:1424` supplies the neighbor relation. The new search found a different error in the pairing on that carrier, R06. |

## R01 (P2) — The explicit-formula adapter assumes an unavailable Satake bound

**Location:** README lines 247–250, 652 and 774–778: “a specialization of that statement with c = 0.”

**Claim:** AnalyticNumberTheoryPartI §1.8 applies with `c=0` to every cuspidal Rankin–Selberg pair here.

**Witness:** `TauCetiRoadmap/AnalyticNumberTheoryPartI/README.md:1112` requires Euler roots bounded by `p^c`. AutomorphicLFunctionsAndLocalFactors #924, `TauCetiRoadmap/AutomorphicLFunctionsAndLocalFactors/README.md:1622`, AL.3.3.8 only supplies individual roots strictly below `p^(1/2)`.

The tensor-product roots are bounded by `p`, not by `1`, from those inputs. An unramified unitary complementary series with roots `p^(1/4),p^(−1/4)` has a tensor root `p^(1/2)>1`; this is a local test of the claimed implication, not a claimed global counterexample to Ramanujan.

**Repair:** Apply §1.8 with `c=1`, importing AL.3.3.8 and the unramified tensor-product formula. State the compact-support `C²` admissibility adapter for every `c≥0`. Use the supplied nonvanishing and functional equation to restrict the zero contribution back to the critical strip. Update the contract and Needs line accordingly. Also replace `weil_test_function` by the supplier's actual name `WeilTestFunction` (main README line 985). The test root then satisfies `p^(1/2)≤p`; no temperedness assumption or restriction on primes is introduced.

## R02 (P1) — The diagonal formula drops a possibly nonzero root term

**Location:** README line 837: “The diagonal entry is A_F/m_i − J_F(U_i²).”

**Claim:** This simplification holds for every admissible quadruple of §2.9.

**Witness:** Take `r=m₁=δ₁=1`, `U₁=I₀=1+e`. Then `U₁²=2+2e`, `ε(U₁²)=−1`, so admissibility holds but the actual diagonal is `A_F−J_F(U₁²)−B_F/2` (CT20 line 754).

**Repair:** Retain the term `−(B_F/4)δ_i(1−ε(U_i²))`. State the simplified formula only when `δ_i=0` or `ε(U_i²)=1`, in particular for a realized self-dual class by §1.8. Add `I₀` as a negative control. For a nonzero Poitou function `B_F>0`, the difference is exactly `−B_F/2`, so the repaired formula passes this instance.

## R03 (P1) — Polynomial negation does not preserve odd special orthogonal indices

**Location:** README line 1480: “P ↦ P^− is an involution of P(G).”

**Claim:** The assertion includes `SO_{2n+1}`.

**Witness:** For `SO₃`, `P=(X−1)³` has `a₂=0` and belongs to `P(G)`. Its negation is `(X+1)³`, with `a₂=3`, which does not belong to `P(G)`.

**Repair:** Restrict this endomorphism/involution assertion to even standard dimension (`Sp_{2n}`, `SO_{2n}`). For odd `SO`, retain equality as the equivalence relation. Add the identity polynomial above as a negative control. In even degree, the degree parity and even `a₂` force even `a₁`, so exchanging these exponents preserves the set.

## R04 (P1) — A bounded cover is claimed to exhaust an unbounded candidate set

**Location:** README lines 1793–1804: “containing every represented parameter … with J… ≤ c”; “Every represented parameter in the range lies in C.”

**Claim:** A cover only below an arbitrary cutoff implies the stated classification of every represented parameter in `D`.

**Witness:** Choose the positive-definite form of §5.2, `c=−1`, and `C=R=S=∅`. Every quadratic value is nonnegative, so the covering and exclusion hypotheses hold vacuously, but the trivial representation in even-parity `D` is not in `R`.

**Repair:** Explicitly require `c≥A_F/m` for the candidate multiplicity hypothesis, and use §2.8 to put every candidate in `C`; alternatively state that inclusion directly. Specify the known finite set `S` and require every `S′⊂S`, so that a class outside `S` meets §2.17's disjointness premise. The negative-cutoff instance is then disallowed since `A_F>0`; for a candidate of multiplicity `m`, the repaired chain is `J_F(U²)≤A_F/m≤c`.

## R05 (P2) — Three exclusion routes omit their retained exceptions

**Location:** README lines 1001–1002 (“For each of these parameters”), 1943 (“then every element of V”), and 2418 (“forces a summand among”).

**Claim:** The three exclusion steps apply without exceptions.

**Witness:** §2.8 gives `J_F(1)≤A_F`. CT20 line 1594 retains `A`. CT20 line 2160 retains `Δ₁₁[12]⊕[25]`, containing none of the three blocks demanded at line 2418.

**Repair:** In §2.19 apply the strict inequality only to the even-rank family and to the odd-rank family with `n≥1`; treat `PGL₁` separately. In §5.8 exclude `V\{A}`, where `A=I₁+I₇+I₁₁+I₁₅+I₁₉+I₂₁+2I₂₃`; the conclusion is at most one class at `A`, not existence. In §7.7 first separate `ψ=Δ₁₁[12]⊕[25]`; impose the three-block restriction only on the remaining branch, as CT20 lines 2158–2181 do. Tests: the trivial parameter is retained; `dim A=16`; the separated genus-24 parameter has dimension `49` and zero blocks in the three-element list. These repairs do not weaken the final classification statements.

## R06 (P1) — The neighbor operator uses the pairing of the dual space

**Location:** README lines 2065–2066 and 2076: “self-adjoint for the mass-weighted inner product”; weights “1/|O(E₈ ⊕ E₈)| and 1/|O(D₁₆⁺)|.”

**Claim:** The operator `T_p[L]=Σ[L′]` on the unweighted free basis is self-adjoint for reciprocal automorphism weights.

**Witness:** CL14 line 2349 specifies `⟨[L],[M]⟩=|O(L)|δ_LM`. Lines 2402–2407 give cross counts `18225,12870`; line 2470 gives automorphism-order ratio `405/286`. Thus reciprocal weights give `18225/286 ≠ 12870/405`.

**Repair:** Use automorphism-order weights on the free lattice-class basis and reciprocal weights only on the dual function space, explicitly naming the duality. Correct the Check, retaining the unweighted theta map. With normalized orders `405,286`, the correct cross terms are both `5212350`; the erroneous ones are `18225/286` and `286/9`. This also repairs the normalization consumed by §6.4.

## R07 (P2) — The Golay–Mathieu and Conway-coordinate identifications have an existing owner

**Location:** README lines 2620–2625: “define M₂₄ as … permutations … preserving G₂₄. Prove: its order”; “compared with Rank24LatticeConstructions Layer 6.”

**Claim:** This section proves the identification needed to transfer the Mathieu order and compares the Leech coordinate models.

**Witness:** Main `TauCetiRoadmap/CFSGBasicProperties/README.md:533` owns the Golay-automorphism/Mathieu equivalence; line 545 owns the Conway-coordinate scaling comparison. `Completed/AlgebraicCodingTheory/README.md:30` explicitly excludes the Mathieu identification.

**Repair:** Import these two identifications from CFSGBasicProperties P2-L in Scope, contracts and §8.4 Needs. Use its identified group and the already supplied order instead of a new order/coordinate-comparison target. Keep the orientable-orbit theorem, the average polynomial and Mathieu alternating forms here. The transfer gives the same `244823040` and the same norm scaling; it removes the duplicate ownership without changing any mathematical value.

## R08 (P3) — The omitted-face Check still has a candidate

**Location:** README lines 882–883: “omitting I = {1} … would give no candidate at all.”

**Claim:** Omitting that face from `[[1,2],[2,1]]` leaves no eligible face.

**Witness:** The remaining singleton `I={2}` has matrix `[1]`, eigenvalue `1` and strictly positive eigenvector `(1)`. The full matrix has least eigenvalue `−1` with mixed-sign eigenvector.

**Repair:** Say that omitting both singleton faces gives no candidate, or use `diag(0,1)` to show that omitting `{1}` changes the computed minimum from `0` to `1`. Both proposed replacements distinguish the wrong procedure; the present Check does not.

## R09 (P3) — The triangle-transform Check leaves a zero denominator

**Location:** README lines 667–669: “sin²(2πξ)/(πξ)²”; “sinh²(2πy)/(πy)² > 0.”

**Claim:** These formulas include zero frequency without a removable-value convention.

**Witness:** At `ξ=y=0`, the convolution has integral `2·2=4`, whereas totalized division in either displayed expression is `0/0=0` (and ordinary division is undefined).

**Repair:** Give the formula for nonzero arguments and define the value at zero to be `4`. State positivity on the imaginary axis using this extension. The constant term and the limit now both equal `4`.

## R10 (P3) — The hyperbolic-plane Check has not removed the ±1 factors

**Location:** README lines 1567–1570: “t ∈ ℤ_p^×”; “Q(−1) = (1+t)²/t and Q(1) = −(1−t)²/t.”

**Claim:** These are the residual polynomial's values for every unit `t`.

**Witness:** At `t=1`, `P=(X−1)²`, so the required factorization has `a=2,b=0,Q=1`. Its values are `(1,1)`, whereas the displayed expressions give `(4,0)`.

**Repair:** Require `t≠±1` for those formulas. Treat `t=1` and `t=−1` separately, with `(a,b,Q)=(2,0,1)` and `(0,1,1)` respectively; both residual values have valuation `0`. This also avoids invoking a valuation of zero in a nonvanishing argument.

## R11 (P3) — Consistent theta rescaling preserves the Siegel-operator identity

**Location:** README lines 2105–2106: rescaling by `1/|O(L)|` “breaks Φ θ_g = θ_{g−1}.”

**Claim:** Compatibility alone distinguishes the unweighted theta normalization.

**Witness:** Set `θ′_g[L]=θ_g[L]/|O(L)|` for every genus. Linearity gives `Φθ′_g[L]=θ′_{g−1}[L]`. For `E₈`, both genus-one constant terms are `1/696729600`.

**Repair:** Say that this rescaling violates the required constant coefficient `1` (and `θ₀[L]=1`), not compatibility. Explicitly keep the genus-zero normalization. The incorrect scale then fails `1/696729600=1`, while the genuine theta family passes.

## R12 (P3) — Several locators do not identify the statements in the cited version

**Location:** README lines 1298, 1336, 2434 and 2480; `sources.toml:29`.

**Claim:** The odd-generator formulas are (5.2.9)–(5.2.12), the EP definition is (1.4.1), and Tables 5/6 are nonscalar/scalar respectively.

**Witness:** CT20 lines 2373 and 2411 label nonscalar/scalar Tables 6/5. Lines 1903–1947 give odd-generator formulas (5.2.8),(5.2.10), not (5.2.11)–(5.2.12). Line 392 makes (1.4.1) the trace formula, not the EP definition.

**Repair:** Swap the two table citations; cite the EP definition in §1.4, printed p.8 (CT20 lines 337–342); cite (5.2.8),(5.2.10) for §3.12, including (5.2.9) for its congruence. Tighten §3.11 to (5.2.5)–(5.2.7), and correct the manifest's terminal equation number to (5.2.10). Tested by matching all 29 and 32 rows and reading the displayed formulas in the manifest's HAL version. Do not silently switch to published numbering.

## Verified sound

The review read all 110 targets, all Needs lines, their APIs and Checks. Previous computed rows were used only for unchanged statements; the repaired passages and all fifteen seeded targets were reread. The compact table below records the sampled targets, all Lean headlines, changed mathematical passages, and every target touched by a finding. Counts quoted from a source are distinguished from independently recomputed quantities. A test is not a proof of a universal theorem; the conclusions also use the source hypotheses and supplier interfaces.

### Computed adversarial table

| Statement | Instances tried | Computed values on the two sides | Result / change |
|---|---|---|---|
| §1.2 Weil ring | `I₁²`, sign twist | `I₂+1+e`: dimension `2+1+1=4=2²`; `e²=1`, `eI₇=I₇` | Ring convention passes. |
| §1.4 gamma/epsilon | `I₀`, `I₁₁` | `Γ_R(s)Γ_R(s+1)=2(2π)^−sΓ(s)=Γ_C(s)`; `i¹²=1`, determinant `e¹²=1` | Pass. |
| §§1.6–1.8 reconstruction/root signs | `(1,0,0,−1)`, `3·1`, `1+2e`; Δ₁₁×Δ₁₅ | First vector regular by zero exception; latter two both determinant `1`, both three zero weights, unequal parameters. Pair sign `i²⁷i⁵=i³²=1` | Regularity restriction is necessary; same-type sign agrees. |
| §2.1 Fourier convention | `ρ=0,1/2,1`; triangle at zero | Imaginary frequencies `−1/(4π),0,1/(4π)`; triangle integral `4` versus displayed quotient `0` | Strip convention passes; R09. |
| §2.2 repaired supplier adapter | `s=0,1/2,1,3/2`; `x=0,1` | Frequencies `−i/(4π),0,i/(4π),i/(2π)`; `g″=−π²,0`; `A_F(ℓ=1)=8/π²≈0.810569` | Import and retained refinement pass. |
| §§2.3–2.6 explicit formula | `F=0`; `π=π′=1`; complementary-series roots | Zero function: all terms `0`; zeta poles contribute `2A`, paired finite/gamma terms contribute twice, giving `½Z`; tensor root `p^(1/2)>1` but `≤p` | Identity normalization passes; supplier application R01. |
| §2.7 cone inequality (sample) | `F=0,x=1`; `x=Δ₁₇−1` | First value `C(1,1)=0≥0`; second cross coefficient `−2`, not a nonnegative multiplier | POS and cone hypotheses retained. Source proof applies only to nonnegative coefficients. |
| §2.8 multiplicities | two distinct classes of type `I₂₃` | Pole coefficient for their average `2·(1/2)²=1/2`; bound `J≤A/2` | Pass; classes, not distinct parameters, are counted. |
| §2.9 diagonal | `U=I₀`, `δ=m=1` | `ε(U²)=i²=−1`; actual minus claimed diagonal `−B/2`, nonzero for nonzero Poitou `F` | R02. |
| §2.10 local minimum (sample) | `diag(1,2)`, unit `(1/10,√99/10)` near `e₂`; dimension one | Values `199/100<2`; dimension-one values `λ=λ` at both sphere points | Excludes the larger eigenvalue; least-eigenvalue refinement is not the native eigenvector theorem. |
| §2.11 supports | `[[1,2],[2,1]]` | Full minimum eigenvalue `−1`, vector `(1,−1)`; singleton minima both `1`; after omitting `{1}`, minimum still `1` | The theorem survives, Check R08. |
| §§2.12–2.13 | off-diagonal `−2` versus `2`, diagonal `1` | At `(1,1)`, values `−2` versus `6`; determinants both `−3`. For identity matrix both coordinate vectors minimize at `1` | Cone condition and negative-minimum hypothesis necessary. |
| §2.14 self-duality monotonicity (sample) | one newly activated `I₀` flag | `β′−β=−B/2≤0`; for `B=4` difference `−2`; newly activated root `+1` gives `0` | Pass with both quadruples admissible. |
| §2.15 compression | one block of size two, `A=K=1` | Expanded matrix `[[0,−1],[−1,0]]` has minimum `−1`; compressed `[−1/2]` minimum `−1/2`; lift `(t/2,t/2)` gives `−t²/2` on both forms | Correctly preserves negativity, not normalized minimum. |
| §§2.16–2.18 and §5.1 | negative witness; empty cutoff | `(1,1)` gives `−2`; interval `[−.01,.01]` does not prove negativity. PD form at cutoff `−1` has `0` candidates, yet trivial class exists | Witness interface passes; missing exhaustion hypothesis R04. |
| §2.19 Miller | odd family `n=0` | Parameter `1`, rank `1`; §2.8 requires `J(1)≤A`, incompatible with proposed `J(1)>A` | R05; actual nontrivial range `2≤N≤26` unchanged. |
| §§2.20–2.21 elliptic counts | weights 12,23,24,54 | Cusp dimensions `1,0,2,4`; odd motivic weights `1..53` number `27` | Pass. |
| §§3.1–3.3 component test | Δ₁₇[8]⊕[9]⊕[7]⊕[1]; three odd blocks | Dimension `16+9+7+1=33`; sign group size `2³/2=4`; SK generator sign `−1=(−1)^(k−1)` exactly for even `k` | Distinct `(π,d)` convention and determinant relation pass. |
| §3.4 lowest-weight modules | `(g,k)=(1,0),(2,(1,1)),(3,(1,0,0))` | EHW inequalities `0≥0`, `1≥0`, `0≥1/2` false | Trivial, singular-unitary and nonunitary controls pass. |
| §§3.7–3.8 scalar branches | `g=k=12`, Δ₁₁[12]⊕[1] | Dimension `25`; weights `±1..±11` once and `0` three times; long block length `1` | Packet-membership example passes. |
| §3.11 even generators (sample), §§3.9,3.13 | Δ₁₁[12], `g=k=12`; floor sign `δ=−1,a=1` | `χ=(−1)^(24/4)=1=ε(Δ₁₁)` in both branches; floor gives `−1`, matching product `−1` | Formulas pass; locator tightened in R12. |
| §3.12 odd generators | `a=1`, signed factor `+1,−1` | Floors `0,−1`; signs `+1,−1`. For `2·1`, multiplicities of `(1,e)` are `(2,0)`, not `(1,1)` | Condition uses characters, not just zero weights; R12 locator. |
| §3.14 EP (sample), §§3.15–3.16 | `SO₃`, `k=0,5`; wrong packet character | EP values `1,−1`, from `−dim S₂,−dim S₁₂` plus residual `1,0`; character average `(1−1)/2=0` | Residual spectrum/full compact convention passes; R12 locator. |
| §4.4 negation | identity in `SO₃`; identity in `Sp₂` | `a₂:0→3` (invalid) versus `0→2` (valid); odd set has `5` indices, even quotient `3` | R03. |
| §§4.5–4.6 repaired spinor adapter | order-four and order-three rotations; `γ=−1` on a plane | Determinants `(1+γ)/2`: `1/2,1/4`; `Q(−1):2,1`; ratios `1/4,1/4`; minus-primary case gives `disc(q)` | Imported formula and square-class conversion pass. |
| §4.7 / Lean regularity and obstruction | rank zero; hyperbolic plane; `x₁²+x₂²`; `x₁x₃+x₂²`; Φ₁Φ₆ | Polar determinants `1,−1,4,−2`: regular `yes,yes,no,yes`. Obstructing value `Φ₆(−1)=3`, not square; Φ₃ gives `1` | Headline passes these controls, includes every prime. |
| §4.7 endpoint Check | hyperbolic `t=1,−1` | Residual `Q=1` gives `(Q(−1),Q(1))=(1,1)` both times; unremoved expressions `(4,0),(0,4)` | R10. |
| §4.11 recovery (sample), §4.12 SO₃ calibration (sample) | the displayed five-row system | `det A=288`; multiplying by `m=(−1/12,1/4,1/3,0,0)` gives `(1/2,−1/2,−1/2,−1/2,−1/2)` | Full column rank and actual masses agree, including forbidden orders four/six. |
| §§4.8–4.9 polynomial-index counts | all degrees 2 through 17, enumerated cyclotomic exponent vectors | Even-degree negation quotients `3,12,32,92,219,530,1158,2521`; orthogonal filtered counts at degrees `3,4,5,7,8,9,11,12,13,15,16,17`: `3,6,12,34,40,99,244,211,598,1339,992,2948` | All displayed counts recomputed; the source’s `1157` is a misprint. |
| §§4.13–4.17 finite ranges | source counts and arithmetic | Coarse Sp₁₄ rows `974<1158`; Sp₁₆ `1427<2521`; hard complement `2521−766=1755`; final `1086≥766` | Dimensions compatible; full external matrices not reconstructed. |
| §4.18 mass values (sample) | SO₃, exceptional zero counts | Mass sum `−1/12+1/4+1/3=1/2`; exceptional count `6+6=12` from CT20 line 1370 | Sample consistent; all large tables not independently regenerated. |
| §§5.3–5.7, samples §5.4 and §5.7 | repaired residual set and duality | `187−6=181`; `dim U_exc=2·7=14`; `|V∪{U_exc}|=182`; maximum classes `181+2=183`; singleton duality orbit size `1`, non-self-dual orbit size `2` | Repaired statements pass; source explicitly puts `U_exc` outside `V`. |
| §5.8 GRH route | retained `A` | Eight 2-dimensional constituents give `16`; retained parameter count `1`, not `0` | R05. |
| §§5.9–5.10 weight 24 | four survivors and known classes | Survivor ranks `13,13,16,16`; `1260−1256=4`; known classes `16` in `15` blocks | Matches CT20; exact exclusion archive not regenerated. |
| §6.3 neighbors | `E₈,p=2`; two rank-16 classes | `(2⁴−1)(2³+1)=135`; reciprocal pairing `18225/286≠286/9`; correct pairing `5212350=5212350` | Neighbor relation passes, pairing R06. |
| §6.4 theta map (sample) | genus zero; E₈ genus one; scaled family | Constant `1=1`, norm-two coefficient indexed by `T/2=1`; scaled compatibility `1/696729600=1/696729600` | Definition/source normalization passes; R11. |
| §§6.5–6.10 first occurrence and Rallis | `E₈,g₀=0,g=8`; Δ₁₁[12], `n=24,g=12` | Added block lengths `9,1`; dimensions `7+1+9=17`, `24+1=25`; wrong use of `g₀` gives `−7` in `2g₀+1−n` | Actual genus convention correct. |
| §6.11 central values (sample) | Δ₁₉,₇, Δ₂₁,₁₃, Δ₁₇ | Root signs `i²⁰i⁸=1`, `i²²i¹⁴=1`, `i¹⁸=−1`; source orders `0,0,1` | Nonvanishing supported by CL14 IX Proposition 3.38, not by sign alone. |
| §§6.12,8.7 Böcherer orders | all five cases | Rows `(0,0,0,−1,1)`, `(0,0,0,0,0)`, `(0,0,0,−1,1)`, `(0,−4,−4,−1,9)`, `(0,−12,−12,−1,25)` each sum `0`; last gamma count `13+12=25` | Matches companion note; finite nonzero value. |
| §§7.1–7.3 regular dimension headlines | genus 1; `(g,k)=(2,10),(2,11)`; `g=8,9` | Dimensions `dim S₁₂=1`, `1,0`; required dual dimensions `17,19`, available bound `17` | Generality is every regular weight, not a bounded weight sample. |
| §7.4 regular enumeration | disjoint shifted-weight blocks from all 27 classes; all generator signs | Positive-genus candidates `198` after identifying the two Δ₂₃ classes, `223` when distinguished; passing `58=29+29` in both; genus zero adds `1` candidate and `1` pass | Independently recomputed, including epsilon products and packet signs. |
| §§7.5–7.7 singular branches | Δ₁₁[12]⊕[1]; genus-24 survivor; rejected Δ₁₁[6] block | `χ=ε=1`; genus-24 dimension `49`, required-list block count `0`; rejected sign `(−1)^3=−1≠1` | Final two H2 cases match source; intermediate overclaim R05. |
| §7.8 nonscalar table (sample) | all 29 rows reconstructed from block weights | Row counts by genus `3,4,5,6,7,8`: `3,7,4,5,4,6`, sum `29`; all standard dimensions `2g+1`; `(13,10,7)` yields `12,8,4`; `(11,11,7,7)` yields `10,9,4,3` | All rows and weights agree; table label R12. |
| §7.9 scalar headline | all 32 rows reconstructed | Counts by genus `1,2,3,4,5,6,7,8,9,10,11,12,16,24`: `1,2,1,4,2,4,3,6,2,2,1,2,1,1`; sum `32`; every weight multiset and dimension agrees | Table label R12. |
| §7.10 four weight-13 forms | genera `8,12,16,24` | Standard dimensions `17,25,33,49`; genus 24 has three zeros, `±12` once and `±1..±11` twice | Parameter dimensions and multiplicities agree. |
| §8.1 Eichler basis (sample), §8.2 | `g=0`, weights `4,8,12`; stable dimensions | Genus-zero image dimension `1`; stabilized dimensions `1,2,24`; cumulative weight-12 dimensions `1,2,3,4,6,8,11,14,18,20,22,23,24` | Induction uses zero cusp kernel above `k`; no assumption of prior Φ-surjectivity. |
| §§8.3–8.4 orbit forms | `S₃,A₃` on three letters; M₂₄ code forms | Top exterior invariants `0,1`; S₃ degree-two orbit count `1` but invariant dimension `0`; M₂₄ coefficients at degrees `16,12,8` are `2,2,2`; code parity removes one each | Orbit/orientation distinction passes; existing identifications R07. |
| §8.5 / Lean invariant dimensions | Leech degrees `0,1,8,24,25`; trivial group; `{±1}` | Dimensions `1,0,1,1,0`; trivial-group coefficient of `t²³` is `−24=(−1)·24`; `{±1}` odd coefficients `0` | Molien sign and declared-gap route pass. |
| §8.5 / Lean rooted vanishing | zero space; rank-one root norm 2; Golay Construction A | Positive-degree dimensions `0,0,0`; reflection sends an evaluated form to its negative, giving `a=−a`, hence `a=0` over ℚ | No extra positivity hypothesis is needed for the root-reflection argument. |
| §8.6 / Lean theta nonvanishing | genera `8,12,16,24`, normalized ω | Absolute coefficients `4157776806543360000`, `49893321678520320000`, `41577768065433600000`, `8315553613086720000`, all nonzero | From `|O(Leech)|e_g/κ_(24−g)`; linear scaling extends to every nonzero invariant form. |
| §§8.8–8.10 harmonic headlines | ranks `24,16`; genus 8 source; genus 9 | Weights `24/2+1=16/2+5=13`; rank-16 source dimension `2`, image `1`, kernel `1`; genus-nine source/target `0/0` | Distinguishes source from image; independent unconditional lattice route retained. |
| §8.11 stable parameters (sample), §§8.12–8.14 | `k=2,g≥4`; `k=0`; `(k,g)=(4,8),(8,16)` | Sign `−1≠1`; constants dimension `1`; theta dimensions `1=1`, `2=2`; cusp kernel used at `g+1>2k` | Boundary is handled correctly; no natural subtraction underflow. |

### Source sample and manifest

All fifteen requested locators were read in the cached legal texts, with their hypotheses and version numbering. The seven manifest keys are unique and cover the cited works. No source was fetched or manifest entry altered. KT87 remains the settled uncertified exception; no new request was made.

| Sample | Exact readable location | Outcome |
|---|---|---|
| 2.7 Stark–Odlyzko | CT20 Proposition 2.2, printed p.16, lines 674–695 | POS, nonnegative coefficient cone, root contribution and factor `1/2` agree. |
| 2.10 local Rayleigh minimum | CT20 Lemma 2.6, p.19, lines 789–799 | Finite-dimensional real self-adjoint setting and least eigenvalue agree. |
| 2.14 forced self-duality | CT20 Remark 2.10, p.20, lines 848–851 | `B_F≥0` and cone restriction retained; roadmap additionally guards real-valuedness. |
| 3.11 even generators | CT20 §5.2.2, pp.45–46, lines 1864–1902 | Branch conditions and signs agree; equation-range tightening in R12. |
| 3.14 EP | CT20 §1.4, pp.8–9, lines 328–345 | Full compact, dual coefficient, square-integrable spectrum agree; wrong equation identifier R12. |
| 4.11 recovery | CT20 §1.4 strategy, p.11, lines 436–451; §3.3, p.31, lines 1288–1298 | Vanishing rows and full column rank required; no inference from row count alone. |
| 4.12 SO₃ | CT20 §1.4, pp.11–12, lines 455–500 | System and five masses agree. README correctly uses the half-angle denominator despite a source slip. |
| 4.18 masses | CT20 Remark 3.10, p.33, lines 1369–1372; pp.33–34, lines 1358–1414 | Exceptional zeros and Sp₁₆ split supported. Full external data not regenerated. |
| 5.4 weight-23 cover | CT20 Proposition 4.1, p.35, lines 1424–1438; proof pp.36–37, lines 1469–1507 | `181`, dimensions `14..42`, and exclusion of `U_exc` from `V` supported. |
| 5.7 alternatives | Same Proposition 4.1 and CT20 introductory count, line 264 | `182` possible parameters, at most `183` classes; no existence claim. |
| 6.4 theta map | CL14 V §1, printed p.135, lines 5140–5167; Φ relation line 5212 | Unweighted source and `Gram/2` Fourier index supported; R11 is a Check error. |
| 6.11 central values | CL14 IX Proposition 3.38, p.322, lines 12315–12340 | Applies to self-dual weight at most 22; the two PGL₄ signs are +1, so order is zero. |
| 7.8 nonscalar spaces | CT20 Theorem 2 and Table 6, p.58, lines 2344–2375 | All 29 rows agree; cited table number is wrong. |
| 8.1 Eichler basis | CT20 Corollary 5.10, p.54, lines 2216–2221 | All genera, exactly weights 4,8,12. Does not assert weight 16. |
| 8.11 stable parameters | CT20 Proposition 5.14 proof, p.56, lines 2292–2318 | Long block, remainder dimension, parity test and stability agree; `k=0` is separated. |

The repaired passages were also compared with CT19a formula (1), Proposition 1.4 and its proof (lines 23–35, 283–299), Theorem 2 (lines 105–115), and Proposition 4.1 (lines 1052–1058). The source's positive-definite setting is sufficient for the Leech theorems; the root-reflection proof works with the more general native integral-lattice carrier in the fourth headline.

### Lean acceptance, headlines and native APIs

Running the required `lake env lean` on the unchanged package file from the pinned content checkout exited 0, with exactly four `declaration uses 'sorry'` warnings at lines 80, 123, 136, 148 and no other warning. No object-file build was needed. A separate scratch copy printed `#check @name` for all eight declarations. Every necessary hypothesis is explicitly retained; no section binder disappeared. README and Lean agree on all eight signatures.

The probe replaced each of the four admissions with separate one-tactic attempts using `simp`, `rfl`, `infer_instance`, and `assumption`, each required to close the whole goal. All four declarations failed all four probes. The library near-matches were inspected for an `exact`-one-lemma proof; none has the same conclusion and hypotheses. No declaration is a boundary case, small-value computation, definition restatement, or README Check. The rooted-lattice theorem is CT19a Proposition 4.1 itself, not padding.

| README headline family | Acceptance coverage |
|---|---|
| Cone inequality, Miller, repeated-weight PGL₄ vanishing (§§2.7,2.19,2.21) | Named in module docstring; no global cuspidal GLₙ/Rankin–Selberg carriers at the pins. |
| Spinor obstruction (§4.7) | `spinor_charpoly_obstruction`, actual integral matrices and all `ℤ_[p]`, including 2. |
| Torsion masses and recovery (§§4.13–4.18) | Named in docstring; elliptic Lefschetz trace-formula and orbital-integral carriers missing. |
| Low-weight classifications and GRH restriction (§§5.3–5.10) | Named in docstring; global cuspidal spectrum missing. |
| Dimensions through genus eight, 29/32 rows, four weight-13 forms (§§7.3,7.8–7.10) | Named in docstring; higher-genus Siegel modular-form carriers missing. |
| Eichler basis, harmonic realizations, alternating isomorphism, stable range (§§8.1,8.8,8.10–8.14) | Named in docstring; higher-genus forms, Siegel operator and theta map missing. |
| Leech invariant dimensions and rooted vanishing (§8.5) | Both native alternating-form theorems stated. |
| Leech theta nonvanishing (§8.6) | Native `thetaCoefficient` headline stated. Exact normalized coefficient separately named as not statable: Golay-coordinate normalization and `Q_g` carriers missing. |

No statable headline was found missing, and no substitute predicate is used. Searching the pinned library by objects distinguishes the finite-field GL₂ cuspidal representation in `TauCeti/RepresentationTheory/CharacterTable/GL2/Cuspidal/Irreducible.lean:317` from the absent adelic cuspidal carrier.

Opened native declarations, with paths relative to the pinned libraries:

- `TauCeti/LinearAlgebra/IntegralLattice/Basic.lean:63`: the carrier, rational bilinear form, full finitely generated lattice, symmetry and integrality. The native field is `isLattice : carrier.IsLattice ℚ`; it does not assert nondegeneracy or positivity. The finite-dimensional instance at line 121 supplies finite dimension from the full lattice. `IsEven` in `Even.lean:67`; `IsUnimodular` in `Unimodular.lean:61` is equality with the dual carrier; `IsPosDef` in `Signature.lean:171`; `norm` and `vectorsOfNorm` in `Norm.lean:78` and `:221`.
- `TauCeti/LinearAlgebra/IntegralLattice/Isometry/Basic.lean:77` and `Isometry/Group.lean:102`: form-preserving lattice equivalences and the group. These are the group acting in `invariantAlternatingForms`; arbitrary endomorphisms are not substituted.
- `TauCeti/InformationTheory/Coding/Binary/Golay/Basic.lean:66,136,563,606,662`: `code`, `finrank_code`, `isTypeII_code`, `weightEnumerator_code`, `hammingMinDist_code`. `TauCeti/LinearAlgebra/IntegralLattice/ConstructionA/Golay/Basic.lean:33` is `constructionALattice`, the rootful Construction A lattice, not Leech.
- `TauCeti/Algebra/AlgebraicGroup/Symplectic/Basic.lean:120,213` and `Smooth.lean:93`: `groupScheme`, `pointsMulEquiv`, `instSmoothCoordinateHopfAlgebra`. `TauCeti/LinearAlgebra/CliffordAlgebra/Spin/SpinorNorm/Basic.lean:98`: `CliffordAlgebra.orthogonalSpinorNorm`.
- `Mathlib/Analysis/InnerProductSpace/Rayleigh.lean:266`: `IsSelfAdjoint.hasEigenvector_of_isLocalExtrOn` concludes the eigenvector property; it does not conclude that a merely local minimum has the least eigenvalue. `Mathlib/NumberTheory/ModularForms/LevelOne/DimensionFormula.lean:262,65`: `ModularForm.dimension_level_one` and `CuspForm.discriminantEquiv`. `Mathlib/LinearAlgebra/QuadraticForm/Basic.lean:1154`: `Matrix.toQuadraticForm'`; `Mathlib/NumberTheory/Padics/PadicIntegers.lean:145`: `PadicInt.Coe.ringHom`.

### Suppliers, ownership and direction

The mechanical command was `tauceti-roadmap gate --depcheck packages/LevelOneAutomorphicFormsForClassicalGroups/README.md --name LevelOneAutomorphicFormsForClassicalGroups --order merge-order/ORDER.txt --movable`, with the configured content checkout. Its output was:

```text
depcheck: 236 roadmaps, 2150 edges, 0 problem(s)
```

There was no UPWARD, CYCLE or moved line. The resolver listed no unresolved roadmap citations, but its external-library lookup was unavailable; the pinned declarations above were checked directly instead. Its clean output does not override the actual contract mismatch in R01.

Supplier sections were resolved at main for existing roadmaps and at the supplied open heads for new ones: AutomorphicFormsOnReductiveGroups §§2.2,2.4,2.5,3.2,3.4,3.5,4.2,5.1,5.5,6.7,6.8,7.2,7.2a,7.4,7.5; AutomorphicLFunctionsAndLocalFactors AL.1.4, AL.3.6–3.7, AL.3.9; AnalyticNumberTheoryPartI §§1.3,1.8; SmallRamificationAndAbelianVarietyBaseCases §§1.5–1.7; AutomorphicSpectralTheory §§4.4,4.5,4.10,6.9,6.17,6.19,6.20; ModularityAndLanglandsExtensions premises and §§3.4,3.8,3.15,3.17,3.20–3.22; AutomorphicBundles §§11.1,11.2,11.9,11.16,12.10,12.11,12.13,12.15; MetaplecticAutomorphicForms §§0.15,2.4c,3.1,3.4,3.5,3.7,3.10,3.21,5.1,5.6,6.14; SymplecticReidemeisterTorsionModSquares §4.1; GeometryOfNumbersAndQuadraticArithmetic §2.4.2; OrthogonalTamagawaAndLatticeMass §§3.1,4.1,4.2; ComputationalNumberTheory §§4.1–4.7,4.17,4.17a,4.18,4.26,4.29–4.34,5.1; Completed/IntegralLattices Layer 1 and IntegralLattices §4G; Rank24LatticeConstructions Layer 6; ThetaSeries Layers 1,5,8; Completed/AlgebraicCodingTheory Layer 5; SporadicOrders Layer 1; Completed/OrthogonalSpinGroups Layer 1; RepresentationTheory/LieHighestWeight Layer 6 and ClassicalGroups Layers 3–5; ReductiveGroups Layer 9; ModularForms Layers 3–4; CFSGBasicProperties P2-L.

Eight declared gaps match between the plan and README: `sp2g-lowest-weight-modules`, `siegel-adelic-lift`, `gross-volume-rationality`, `same-type-pair-root-number`, `boecherer-theta-image`, `integral-spinor-norm-units`, `split-orthogonal-regular-form`, `conway-group-average-charpoly`. Each has a named owner and precise hypotheses. The current supplier only has scalar discrete series in AFRG §6.8, only GL₂ in §7.2a, and no corresponding Gross-motive, pair-sign, Böcherer, dyadic unit or Conway-average theorem at the cited sections; these are declared contracts, not unowned prerequisites. The regular integral orthogonal comparison includes 2. No gap needs to be widened to an object already supplied. Acceptance after the findings are repaired will remain conditional on these contracts.

Object searches used `roadmaps grep` and the local pins, not merely proposed declaration names. The board package index was read first. The nearby heads were compared: SiegelModularForms #1714, OrthogonalTamagawaAndLatticeMass #1222, AutomorphicLFunctionsAndLocalFactorsPartII #1756, ModularityAndLanglandsExtensions #1180, and AutomorphicSpectralTheory #925. Their general lattice classification/mass, L-factor, packet and spectral objects are imported here; the specific torsion-mass recovery, finite cone exclusion, low-weight classifications and alternating Leech construction belong here. The remaining duplicated bridge is R07. The later Siegel roadmap consumes this roadmap's level-one theta and Siegel-operator inputs; the move-down of §§6.1–6.2 recorded in the previous review remains necessary, with no upward Needs edge added here.

The supplied overlap report has no conflicting head, dropped cited id or numbering existing only in an open revision. No target id was removed by this repair. No fully qualified Lean declaration collision was found. Ownership searches against the board's three other packages found no competing object. No ownership claim is made about unavailable files outside the supplied/indexed open heads.

### Shape and principles

There are 110 numbered targets and 110 Needs lines; each definition has an API and a Checks block with at least three bullets. All eight layers end with Examples and Dependencies. Main ThetaSeries, Rank24LatticeConstructions and CFSGBasicProperties were read for shape. The layers follow the mathematical dependencies, not CT20's chapter order (the packet layer precedes geometric recovery, and theta inputs precede classification consequences). No re-planning of an existing roadmap was found. No copied passage, good-prime restriction, executable computational algorithm, sorry'd data, `set_option`, `lemma`, admitted example, process paths or PR narrative was found in the package. Finite inequalities, rank tests and data interpretation are mathematical statements; large calculations were not treated as proof substitutes.

All eight backticked names presented as this roadmap's Lean declarations resolve in `Suggested.lean`, and each Lean name occurs in the README. The `module`/`public import` form is the pinned Lean equivalent of the single Mathlib import followed by the five used individual TauCeti modules. The source manifest and metadata were read without modification. The findings concern statement correctness, an existing ownership boundary and exact locators; they do not require redesigning the roadmap.

## Not verifiable

- KT87 remains `uncertified` and paywalled under its existing manifest key. Its full character determinant formulas were not read. The rank-one evaluations give `x²+1+x⁻²` for the Sp₂ example and `x²+x+1+x⁻¹+x⁻²` for SO₃, dimension 5 at identity, but do not certify the general formula.
- The authors' large external data arrays were not reconstructed: all 181 elements of `V`, thousands of exclusion triples, full-rank minors for the large mass systems and every entry of §4.18's tables. The source statements, displayed small systems and all 29/32 final parameter rows were checked. A source's cardinality claim is not an independent enumeration.
- Original Weissauer, Resnikoff/Freitag, Rallis, Böcherer and Gross texts cited through the supplied sources/contracts were not separately opened. CT20, CL14 and the companion note were read where the roadmap uses them. The declared supplier gaps remain contracts; no absence finding is made against them.
- The published IHÉS numbering was not independently compared with the HAL manuscript. This review uses exactly the version stated in the manifest; R12 is an internal mismatch with that version.
- Open-head ownership beyond the provided roadmaps and the available index was not independently checked. No missing ownership inference rests on an unavailable pull-request file.

## Source issues

- **Error** in CT20 at Corollary 2.9 and its preceding embedding, printed p.20: the source says normalized compression preserves the quadratic form and negative minima; it should preserve negativity using the unnormalized averaging lift; minima can be −1 and −1/2; affects a stated result.
- **Misprint** in CT20 at §2.4.5, Output, printed p.23: the source says lifted class coefficients use inverse square roots of multiplicities; it should use inverse multiplicities; affects the proof.
- **Misprint** in CT20 at §1.4 after (1.4.5), printed p.10: the source says rationality uses Artin values at nonnegative integers; it should refer to nonpositive critical integers; affects nothing.
- **Misprint** in CT20 at §1.4, SO₃ character formula, printed p.11: the source says the character denominator uses twice the half-angle; it should use sin(π/i); affects a stated result.
- **Misprint** in CT20 at Table 2 and §3.3, printed pp.28,33: the source says the degree-fourteen symplectic negation quotient has 1157 indices; it should have 1158; affects nothing.
- **Misprint** in CT20 at §4.1, printed p.36: the source says the U₁ cutoff uses frequency i/π; it should use i/(4π); affects a stated result.
- **Error** in CT20 at §4.1, printed p.36: the source says U₁ has 12230 elements while the exclusion subtraction starts from 12293; it should give one consistent cardinality; affects a stated result.
- **Misprint** in CT20 at §4.3, proof of Theorem 4, printed p.38: the source says the dual-pair flag and multiplicity are both two; it should set the flag to zero and multiplicity to two; affects the proof.
- **Misprint** in CT20 at §4.3, proof of Theorem 4, printed p.39: the source says every element of V must be excluded; it should exclude every element except the retained parameter A; affects the proof.
- **Misprint** in CT20 at footnote 13, printed p.33: the source says the weight-23 elliptic cusp space has dimension two; it should say weight 24; affects nothing.
- **Misprint** in CT20 at §5.3.1, printed p.48: the source says 199 candidate shapes and 59 passing shapes are in positive genus; it should exclude the genus-zero shape, giving 198 and 58; affects a stated result.
- **Error** in CT20 at §5.3.2, Rallis relation following (5.3.1), printed p.51: the source says added block lengths depend on first-occurrence genus; it should use the actual theta-lift genus; affects a stated result.
- **Misprint** in CL14 at V §1, Fourier-coefficient convention, printed p.135: the source says the coefficient indexed by n counts tuples with Gram matrix n; it should count Gram matrix 2n, consistent with its exponential and genus-one convention; affects a stated result.
