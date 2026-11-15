# Review of QuantumEnvelopingAlgebras (pull request #2363 at ccc89ca)

**Verdict:** needs changes

## R01 (P3) — The section `QuantumPlaneLattice` is still padding and breaks the Lean form rules

**Location:** `TauCetiRoadmap/QuantumEnvelopingAlgebras/Suggested.lean:579–684` and the docstring paragraph at `:25–28` ("`QuantumPlaneLattice` states the integral matrix comparisons of Layer 8").

**Claim:** Re-raised: R08 of the previous review (F08 in the description). The reason given, that the section predates this revision, does not answer it: the form rules hold for the file at this head. The seven matrix theorems stand in for the Layer 8 module comparisons that the same docstring (`:50–51`) lists as not statable; none of the section's 15 non-generic names occurs in `README.md`; 12 declarations have no docstring; `:584–588` is process wording; `gaussian_at_one` restates the API bullet at `README.md:323` and `gaussian_first_root` is `quantumLucas` at `m = l`.

**Witness:** `grep -c` in `README.md` gives 0 for `comparison_intertwines`, `hopfDualComparison`, `specializedComparison_ker_range`, `gaussian_at_one`, `gaussian_first_root`, `monomialE`, `weylE`, `dualE`. No docstring: `A`, `monomialE`, `monomialF`, `weylE`, `weylF`, `torus`, `dualF`, `specializedComparison`, four theorems.

**Repair:** Delete `Suggested.lean:579–684` and the docstring lines `:25–28`; the README keeps 8.1–8.2 as targets and Checks. A scratch copy without these lines elaborates with 16 `sorry` warnings and nothing else.

## R02 (P3) — Section 1.3a constructs the `Tᵢ` before 2.1 and carries one *Needs* line for two different theorems

**Location:** `README.md:602–603` ("Construct the automorphisms `Tᵢ` over `ℚ(v)` preserving `U_R` and the factorizations with respect to a simple root, then specialize them through these identifications."); `:555`; `:744–755`.

**Claim:** The `Tᵢ` are a target of 2.1 (`exists_braidOperator`, with generator values and hypotheses), whose *Needs* is "1.1–1.3a"; 1.3a constructs them first, without values, and its single *Needs* line puts KacMoody §§1.4, 2.1, 4.1, 4.3–4.4 in front of `J = I_S`, which uses none of them.

**Witness:** `README.md:559–599` (the proof of `J = I_S` and the comparison over `R`) uses 1.0–1.3 only. `README.md:752–754`: 2.1 specializes through `U_R` of 1.3a. The character formula (`:620–625`) uses `Tᵢ` and KacMoody §4.4.

**Repair:** Move `README.md:602–625` and the Checks at `:630–635` to a new `### 2.3 Category O, the quantum Casimir and the character formula` after 2.2, opening "With the automorphisms `Tᵢ` of 2.1 and their factorizations with respect to a simple root, prove …", with "*Needs:* 1.3a, 2.1; KacMoody §§1.4, 2.1, 4.1 and 4.3–4.4". Reduce `:555` to "*Needs:* 1.0–1.3." Write §2.3 for §1.3a at `:31`, `:68`, `:172`, and move the KacMoody sentence of `:722–723` to the Dependencies of Layer 2.

## R03 (P3) — Two new targets have no locator, and the References list locators that nothing cites

**Location:** `README.md:450–451` ("prove `[Eᵢ,x⁻]=(KᵢLᵢ(x)⁻−Rᵢ(x)⁻Kᵢ⁻¹)/(qᵢ−qᵢ⁻¹)`, and its positive analogue"); `:389–397`; `:1461–1462` ("§14.2 (the integral basis of `f`)"); `:1484–1485`.

**Claim:** The commutator formula of 1.1 and the skew derivatives of 1.0 carry no locator, while the lemmas that state them are listed in the References and cited by no sentence. Lusztig1993 §14.2 is cited nowhere, and 1.3a uses no basis of `f_A`.

**Witness:** HeckenbergerDoubles2010 lines 1054–1060 (Lemma 4.15: `[E, Fᵢ] = ∂ᴷᵢ(E)Kᵢ − Lᵢ∂ᴸᵢ(E)`, with (4.35)–(4.36)); lines 1178–1179 (Lemma 4.20: both derivatives from the coproduct). `grep "14\.2" README.md`: line 1461 only. AndersenPoloWen1991 line 1013: `H⁰(λ) = D′(−λ)*`.

**Repair:** At `:451` add "(HeckenbergerDoubles2010 Lemma 4.15, line 1054, with separate tori `Kᵢ`, `Lᵢ`)"; at `:397` add "(HeckenbergerDoubles2010 Lemma 4.15, (4.35)–(4.36), and Lemma 4.20, line 1178)"; delete "§14.2 (the integral basis of `f`)," from `:1461–1462`. At `:1419–1420` and `:1476` write "Proposition 3.3, line 1013": line 571 is a remark pointing forward to it.

## Verified sound

Previous review (at 4f34e39), finding by finding: R01 repaired (`README.md:559–599`, checked step by step below); R02 repaired (`:135–144`, `:277–285`, `Suggested.lean:117–118`); R03 repaired (`Suggested.lean:518–524`); R04 repaired (`README.md:62–64`, `:211–216`, `:381`, `:661`, `:1211`); R05 repaired (`:585–592`; the leftover reference is R03 here); R06, R07 repaired (gate); R08 not repaired (R01 here); R09 repaired (`Suggested.lean:158`, `:509`; `README.md:552–553`); R10 repaired (`:283`); R11 repaired (`:1110`, `:1150–1152`); R12 repaired (`:1264`, `:665`, `:556`); R13 repaired (description); R14 repaired (`:18`).

| Statement | Instances | Values computed | Result |
| --- | --- | --- | --- |
| 0.1 datum, `reflect`, `braidLength` | `B₂`; adjoint `A₁`; `GL₂`; `A₁^(1)` | `d₁a₁₂ = −2 = d₂a₂₁`; `ϖ ↦ ϖ − 2ϖ = −ϖ`; `e₁* ↦ e₂*`; product `4` returns `6`, excluded by `hm` | holds |
| 0.3 `quantumLucas` (headline) | orders of `ζ` in `{1..10, 12, 14, 18}`, `m ∈ [−14, 14]`, `r ≤ 15`, exact in `𝔽_2521`, Lean's `/`, `%` | 6032 instances, 0 failures | holds |
| 1.0 `freePairing_characterisation` (headline) | Lean recursion `removeWord`, `pairingRow` on all words of total degree `≤ 6`, six rank-two matrices, three fields | Gram matrices symmetric in all 450 degrees; `B(θ²,θ²) = 1 + qᵢ²`; `B₂`, `q = 2`: `1 − 1/16 = 15/16` | holds |
| 1.0 Serre elements in `J` | `A₂`, `B₂`, `G₂`, `A₁^(1)`, `(−4, −1)`, `(−3, −3)` over `𝔽_(2⁶¹−1)`, `GF(2¹³)`, `𝔽_1000003` | `B(Sᵢⱼ, w) = B(w, Sᵢⱼ) = 0` for every word `w`, all 36 elements | holds |
| 1.1 presentation, commutator formula | `x = θⱼθₖ`; adjoint `A₁`, `q = 2` | both sides `Kᵢ(δᵢⱼFₖ + δᵢₖχᵢⱼFⱼ) − (δᵢⱼχᵢₖFₖ + δᵢₖFⱼ)Kᵢ⁻¹` over `qᵢ − qᵢ⁻¹`; `K_ϖE = 2EK_ϖ`, `K_hE = 4EK_h` | holds; locator R03 |
| 1.2 coproduct, antipode (headline) | `n = 2` | `(Kᵢ⁻¹Eᵢ)² = qᵢ²Kᵢ⁻²Eᵢ²`; middle term `1 + qᵢ² = qᵢ[2]ᵢ`; LusztigJAMS1990 line 1224 gives `v^(b(N−b))` | holds |
| 1.3 triangular (headlines) | empty `ι`, `Y = ℤ`, any `q ≠ 0` | `J = 0`, `f = K`, map `K ⊗ K[ℤ] ⊗ K → K[ℤ]` the identity | holds |
| 1.3a `J = I_S` (headline), step by step | rank-one string; `S²`; 450 degrees as above | `Rᵢ(eᵢx) = t^m x − t^m x = 0`; `c_n = [n]_(t²)(1 − t^(2(m+n−1)))`, so `m = −r`; `S²(θ²) = t⁴θ²`, `(β,β) − Σ2dᵢnᵢ = 8d − 4d`; Gram rank `=` `dim (T/I_S)_ν` in 450 of 450 | holds |
| 1.3a ring `R`, Casimir | maximal ideals `(p, g)` of `ℤ[v]`; `A₁`; `A₁^(1)` | `v` is `0` or a root of unity in the finite residue field; `f_C(n) − f_C(n−2) = 2n`; dimensions `2`, `3`, `14` at `(1,1)`, `(2,1)`, `(3,3)` | holds; order R02 |
| 1.3a `exists_drinfeldJimbo_equiv` (headline) | ideal generated by images of `Sᵢⱼ` against images of `I_S` | equal in the free algebra, so the two `RingQuot`s agree once `J = I_S` | holds |
| 1.1 `exists_rankOne_algHom` (headline) | relation `KE = q²EK` of `TauCeti.UqSl2` | `KᵢEᵢ = q^(2dᵢ)EᵢKᵢ`, parameter `q^dᵢ` | holds |
| 1.5 pairing and double | `B₂` | `⟨α₁, d₂h₂⟩ = d₂a₂₁ = −2 = d₁a₁₂ = ⟨α₂, d₁h₁⟩` | holds |
| 2.1 braid operators (headlines) | rank one; `A₂`; weight of `Tᵢ(Eⱼ)` | `Tᵢ(K)Tᵢ(E)Tᵢ(K)⁻¹ = q²Tᵢ(E)`; `T₁(E₂) = E₁E₂ − q⁻¹E₂E₁`; `⟨sᵢαⱼ, sᵢy⟩ = ⟨αⱼ, y⟩` | holds; order R02 |
| 2.2 root vectors | `A₂`, word `121`; `B₂`, word `1212` | `E_(β₂)E₁ − q⁻¹E₁E_(β₂) = −q⁻¹[2]·Serre = 0`; roots `α₁, 2α₁+α₂, α₁+α₂, α₂` | holds |
| 3.1 toral basis | one-dimensional torus | `C_n(±1) = 0` for `n > 0`, so `f(−1) = −f(1)`; Lentner2014 line 551 has `k[Λ/2Λ_R]` | holds |
| 3.3 comparison at `v = 1` | weight `−1`, `m = 2` | `(−1)(−2)/2 = 1`; LusztigJAMS1990 lines 1515–1525 | holds |
| 4.1, 4.2 | `A₁`, `λ = 2ω` | `E b₁ = [2]_v b₀`; `F x² = 2xy`, `F^(2)x² = y²`, index `2`; `X(2xy) = 2x²` | hold |
| 5.1 order data | `G₂` at `L = 3`, `9`; `B₂`, `d = (2,4)`, `L = 4` | `ℓ = (3,1)`, `A* = [[2,−1],[−3,2]]`, `9·(−1) = 3·(−3)`; `ℓ = (9,3)`, `d* = (81,27)`; `ℓ = (2,1)` | holds |
| 5.2 unital Frobenius | weight `Lν`, `L ∣ m` | `[Ln choose L]_ζ = n` (Lucas rows above); GrosKaneda2013 lines 70–82 | holds |
| 5.3 `Fr_ζ ∘ Ψ = θ ∘ Ψ* ∘ Fr_(−ζ)` | general `i`, `n = kℓᵢ`; `A₁`, `ζ = i`; `A₁`, `L = 3` | exponents differ by `dᵢ(kℓ(kℓ−1) − ℓ²k(k−1))/2 = dᵢkℓ(ℓ−1)/2`; `−e1₀ = −e1₀`; `−e1₀ ↦ +e1₀` | holds |
| 5.4 sequences | Lentner2014 lines 1119–1137 against the coverage paragraph | `𝓁 = 4`: `A₁^(×n)`, `D_n`, `D₄`; `𝓁 = 3, 6`: `A₂`; `G₂`, `𝓁 = 9`: `G₂`, `G₂`; `B_n`, `𝓁 = 8`: `B_n`, `C_n` | holds |
| 6.1, 6.2 | AndersenWen1992 lines 206–208, 222–234 | restricted simple stays simple; `M(λ⁰) = L(λ¹)` in the proof of §1.10 | locator holds |
| 7.1 contraction | `L_ζ(ω) ⊗ L_ζ(ω)`, `L = 3` | weights `2ω, 0, 0, −2ω`, so `(M ⊗ N)₀` has dimension `2`; GrosKaneda2013 (6.4.4) | holds |
| 8.1 quantum plane | `xy − vyx`, `y²` | `E`: `vx² − vx²`; `F`: `vy² − vy²`; `E(y²) = xy + v⁻¹yx = (v + v⁻¹)yx` | holds |
| 8.2 lattices | `n = 2, 3`; `L = 3` | `C₂ = diag(1, v + v⁻¹, 1)`; `T₃`: `φ₃, −v⁻¹φ₂, φ₁, −v³φ₀`; `[−3 choose 3]_ζ = −1` | holds; Lean section R01 |

- Source locators checked against the text: 58 in 8 sources (HeckenbergerDoubles2010 739, 821, 866, 874, 898, 1039, 1054, 1081–1084, 1104, 1167, 1178, 1184, 1231–1245, 1365–1388, 1556, 1578, 1671, 2259; Lentner2014 106, 192–194, 427–436, 462–478, 515, 549, 1102–1137, 1162; LusztigJAMS1990 179, 1098, 1204, 1222, 1495–1526; McGerty2006 85–108, 161–176, 208–222, 278–310, 332–343; GrosKaneda2013 28–34, 53–84, 1724, 1792–1823, 1845; AndersenPoloWen1991 457–512, 571, 1013; AndersenWen1992 129, 206–234; Tanisaki2016 19–21, 296, 308, 372–374, 420, 525, 666–696, 712, 749, 814, 828).
- Pinned declarations opened (Tau Ceti at 2fd255d): `QuantumInteger/Basic.lean:33, 150, 204, 262`, `Binomial.lean:70`, `Laurent.lean:65`, `UqSl2/Basic.lean:86, 112–121`, `Kostant/Form.lean:125`, `Kostant/Comultiplication.lean:232, 252`, `Kostant/BaseChange.lean:68`, `GroupTheory/Coxeter/Matsumoto.lean:136`, `RootSystem/LongestElement.lean:197, 203, 269`, `RootSystem/Inversions/Basic.lean:70`; Mathlib `RingTheory/Binomial.lean:441`, `Algebra/MonoidAlgebra/Module.lean:73`. No pinned declaration states a target of `Suggested.lean`; the three same-name leads are `FreeAlgebra.lift` and unrelated.
- Cross-roadmap citations resolved on main (1a19c9f): KacMoody §§0.1–0.3, 1.4, 2.1, 4.1, 4.3, 4.4; HopfologicalAlgebra §7.3 (line 728); QuantumGroups Q8 item 1 (lines 232–234); ReductiveGroups §9A, §10B (also at the open head); SchubertGeometry S4, S7; RootSystems Layers 1, 3, 4 and LieHighestWeight Layers 4, 5 through those roadmaps' own old-numbering tables (`RootSystems/README.md:1128–1138`, `LieHighestWeight/README.md:74–80`); ArithmeticStatisticsPartIV §3.2 at its open head.
- Gate at ccc89ca: every check 0, `OK`. Changes outside the folder: none. Dependency check: `depcheck: 245 roadmaps, 2234 edges, 0 problem(s)`; no UPWARD, CYCLE or `moved:` line.
- Elaboration of `Suggested.lean` at the pins: 23 `declaration uses sorry` warnings and nothing else. One-tactic probe (`rfl`, `simp`, `infer_instance`, `norm_num`, `exact?`) on all 23: none closes (three run out of heartbeats). Of the 11 flagged signatures, ten drop binders their statements do not need (`[DecidableEq ι]` on word definitions, the `Y`-module instances on `genE`, `genF`, `genK`); `[CharZero k]` is dropped in the section of R01.
- Pull-request text against the head: counts (23 theorems, 70 and 18 declarations), suppliers, renamed and removed declarations and the locators it names agree with the head.
- Overlap check: read KacMoody, QuantumGroups, HopfologicalAlgebra, ReductiveGroups, SpringerResolutionAndCharacteristicCycles; the bicharacter-braided ambient: owner HopfologicalAlgebra, cited; `U_q(sl₂)`: owner QuantumGroups, cited; the quantum Casimir: owned here, see the last section; nothing else shared.
- Source independence: 11 passages compared with 8 sources, none shared beyond formulas and the two-condition list of McGerty2006 lines 338–339; largest share McGerty2006, 22 of 101 locators; contents compared with McGerty2006 (its §§1–5): independent.

## Not verifiable

- Lusztig1993 (uncertified): §1.2, Chapter 3, §3.1, §6.1, Theorem 33.1.3, §33.2, Chapters 5, 34, 37–39, 41, Theorem 35.1.9, §37.1.3, §23.2, §31.1.3 are cited by locator only; the agreement of 2.1's formulas with §37.1.3 was not checked against a text.
- Lusztig1990 (uncertified): Theorem 8.10 read only through GrosKaneda2013 line 33 and Lentner2014 line 1102.
- Kassel1995 (uncertified): Chapter VII §3 for 8.1, by locator only.
- AndersenPoloWen1991 and AndersenWen1992 are OCR of scans: statements legible at the cited lines, formulas inside proofs not relied on.
- Ownership against open pull requests was checked through `roadmaps grep` and the closest-roadmap lists only.

## Source issues

- **Misprint** in McGerty2006 at §2, the definition of the form on the free algebra, printed p. 2 (line 90): the source says the norm of a generator is the inverse of one minus the square of `vᵢ`; it should be the inverse of one minus the inverse square of `vᵢ`; affects nothing.

## For the human reviewers

- **Ownership.** Main's `TauCetiRoadmap/KacMoody/README.md:52–54` names KacMoody, Part II as the home of "the quantum Casimir"; `README.md:30–31` here owns it. The description says so and leaves that line to a separate change.
- **Pin.** The generated `STATUS.md` reports `TauCeti.CartanDatum`, `signedLaurentQuantumBinomial` and `quantumFactorial` in Tau Ceti; the pin (2fd255d) has none, so `CartanDatum`, `qFactorial`, `gaussian`, `signedGaussian` in `Suggested.lean` duplicate nothing today.
