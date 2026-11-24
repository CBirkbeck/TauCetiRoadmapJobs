# Review of ThetaLiftsForDefiniteUnitaryGroups (pull request #3027 at 7b5fe43)
Folder: `TauCetiRoadmap/RiemannHypothesisForDirichletLFunctions/ThetaLiftsForDefiniteUnitaryGroups/`
**Verdict:** accepted

**Summary.** A review of the change against `main`: 680 changed lines since `b8f3652`. The folder's text is the same as at the head the previous review read; what changed since is in four supplier roadmaps, so every `*Corollary of:*` and repointed supplier citation was resolved again at this head, the new statements of 1.6 and 3.4 were recomputed, and the sampled locators were reread in the sources and in the formal proof. No stated result is false or unsupported, so there is no finding. Eight small corrections remain, none blocking: a wrong subsection number for the global theta lift in Gan–Qiu–Takeda, a method label that points at the wrong parameter formula, provenance labels that do not match their sections, the unclear status of the criterion of 3.4, origin citations without locators, an ambiguous valuation, and two changes the description leaves out. Nothing is left for the human reviewers to decide.

## C01 — GQT's global theta lift is §11.2, not §11.1

A reader who follows the locator finds the list of dual pairs, not the lift. In the numbering of arXiv:1207.4709v3, §11.1 is "Dual Pairs" (GQT line 2491); the automorphic realisation and the lift `θ_{n,r}(φ, f)` are §11.2, pp. 51–52 (GQT lines 2503–2538). MetaplecticAutomorphicForms §6.13 itself says "as in GQT §11.2". The number stands in the origin of 1.5 (line 608) and in the GQT entry of the References (lines 3493–3494). Both would read "§11.2".

## C02 — The method label of 2.3 describes the split-place relation without the inversion and points to 2.2, which has it

The label (lines 1090–1092) credits the formal proof with "the original parameter times `χ_V/χ_W`" plus a segment, "(2.2)". Section 2.2 states `(c_w α⁻¹, segment)` for the tensor pair (line 1044). The formal proof's `UpperTheory.Gal.TP.Loc.LiftSatU` (`SatakeLifts/CompUnit.lean`, line 37 at the cited commit) sends a parameter `B` to `B.map (· * (val χX w * (val χW w)⁻¹)) + seg w (val χX w) (d - n)`, with no inversion: that is the homomorphism-pair form of 2.5 (d) (line 1206, "with no inversion"). The pointer would read "2.5 (d); for the tensor pair of 2.2 the parameter is inverted".

## C03 — Six sections are labelled "definitions and conventions" although each states results to prove

Sections 0.3, 0.4, 1.1, 1.3, 2.5 and 5.1 (lines 351, 419, 462, 541, 1184, 1660) each carry a `Prove:` list (lattice vectors and their transport, invariance and boundedness of the kernel, convergence and equivariance of the lift, the lattice form, the dictionary (a)–(g), the theta integral), and the Labels paragraph (line 220) calls them definitions. So the provenance of these statements is never given, though the References already attribute 0.3 and 0.4 to Weil (1964) and Kudla (1994) and 2.5 (e) names a formal-proof declaration. The label would say so, for example "*Origin:* definitions, with standard properties from Weil (1964) and Kudla (1994)".

## C04 — The References credit the route of 5.3 to the formal proof, but that route runs through the norm identity of 5.2, which the formal proof lacks

The [FormalProof] entry (lines 3428–3430) lists 5.3 among the routes taken from the formal proof, and two lines later says that the route of 5.2 is not that proof's. The route of 5.3 (line 1777) is "5.2 in its second form", and the label of 5.2 says the formal proof "states the implication from a vanishing theta integral, not the equality of the norm with the `L`-values". The label of 5.3 would add that the route written here goes through 5.2, and the References entry would keep for 5.3 only what it shares with the formal proof (the factorisation and the choice of test function).

## C05 — In 3.4 the definite-pair criterion, the section's statement on `main`, now stands under "Remark"

The new `Prove:` statement (lines 1465–1466) is the linear-algebra lemma, which is correct (see the table). The criterion for `θ_φ` follows under "*Remark (the criterion for a definite pair)*" (line 1468), which says it "is proved by the route below". A reader cannot tell whether it is still a target of 3.4. It would be headed "Prove also (the criterion for a definite pair):".

## C06 — Several new origin citations give no locator

These are cited with no theorem, section or page:
- Rallis (1984), *Injectivity properties*, for 1.4 (line 566; References entry). The pairing against a kernel is Proposition 1.1, p. 149 (Rallis1984Injectivity lines 342–345), which the same entry already gives for 3.2.
- Rallis (1984), *On the Howe duality conjecture*, for 2.4 and 6.6 (lines 1125, 2540). MetaplecticAutomorphicForms §§5.6a–5.6b give Theorem I.1.1, p. 345, and Theorem I.2.2, pp. 355–356.
- Braun (1941) for 5.4 (line 1788). HermitianFormsAndLattices §6.5 gives Satz V.
- Rallis (1982) for 2.2, Atobe and Gan (2017) for 2.3, Weil (1965) for 5.4 and 6.3, and Kudla and Rallis (1994) for 6.1, 6.3a, 6.7 and 6.11.

## C07 — The method label of 1.6 does not say which valuation its bound uses

The label (lines 658–659) gives the lift "valuation at least `b − v_p(D)`", while the paragraph *The form of the formal proof* measures `b` through `𝔭^b`. With the `𝔭`-adic valuation the bound is `b − v_𝔭(D)`: for `L₀ = ℚ(i)`, `𝔭 = (1 + i)`, one class with `Γ_c = {±1}`, kernel `1` and `b = 0`, the lift of `1` is `1/2`, of `𝔭`-adic valuation `−2 < −1`. The label would write `b − v_𝔭(D)`, or say that the valuation is normalised by `v(p) = 1`.

## C08 — The description leaves out the two changes to stated results in this roadmap

The description names this roadmap once, for the `*Needs:*` line of 6.12. It does not say that 3.4 now states a linear-algebra lemma with the definite-pair criterion as a remark, nor that 1.6 gains a statement, the formal proof's integrality at one place `𝔭` for every common multiple `D`. One sentence on each would do.

## Previous findings

- The previous review had no finding. Its small corrections C01–C07 stand as above, the folder being unchanged; its C08 is kept in part: the description's sentence on 6.12 ("add … §AL.1.2.1, resp. §AL.1.2.3") is correct as written, since "resp." assigns §AL.1.2.3 to 6.12, which is what the head adds.

## Verified sound

| Statement | Instances tried | Values computed on each side | Result |
|---|---|---|---|
| 0.2 splitting data (seeded): twist | `χ_V ↦ χ_Vμ`, `μ` trivial on `𝔸_F^×` | factor `μ(x)` at `det h = x/x̄`; well defined since `μ(x) = 1` for `x ∈ 𝔸_F^×` | agrees with label |
| 0.2 existence: BaseChange… §6.3a | section heading and origin at this head | splitting characters for every quadratic extension, prescribed archimedean components, avoidance of split places | supplies it |
| 0.2 origin: HKS §1 | HarrisKudlaSweet1996 lines 410–411, 756–774 | printed p. 950 at file page 10; Proposition 2.2 on p. 958 | locators right |
| 1.6 formal form (seeded, new) | one class, `Γ = {±1}`, `𝔭 = 2`, kernel `1`, `b = 0` | `D = 2`: `D·Θ1 = 1 ∈ ℤ_(2)`; `D = 1` (not a multiple): `1/2 ∉ ℤ_(2)` | true; "common multiple" needed |
| 1.6 global from local | `b = 0`, `D = D_K`, all `𝔭` | `∩_𝔭 𝒪_(𝔭)M′_{t′} = M′_{t′}` for an `𝒪`-lattice | agrees |
| 1.6 label valuation | `ℚ(i)`, `𝔭 = (1 + i)` | `v_𝔭(1/2) = −2`; `b − v_p(D) = −1` | ambiguous (C07) |
| 2.2 split places (seeded) vs `LiftSatU` | `n = d = 1` | formal proof: `B·χX/χW`; 2.2: `c_w α⁻¹`; 2.5 (d): `c_w α` | consistent; label of 2.3 points wrongly (C02) |
| 2.2 origin: Mínguez | file pages 3, 18–19 | p. 718 Théorème 1; p. 733 at file page 18, so Corollaire 6.3 on p. 734 | locators right |
| 2.3 vs MetaplecticAutomorphicForms §3.22a | `n = 0`, `d = 2` | supplier segment `(q^{1/2}, q^{−1/2})`, `q = q_v²`: `(q_v, q_v⁻¹)`; even `n`, `d`, split `W`, trivial characters as the line says | agrees |
| 2.4 constituents (seeded): origin | MetaplecticAutomorphicForms §§5.6, 5.6b, lines 1479, 1499 | Rallis84a Theorem I.1.1 p. 345; Theorem I.2.2 pp. 355–356, Howe duality as hypothesis | supported; locator missing (C06) |
| 3.3 Rallis operator (seeded): convergence | `n` parameters `|α| ≤ q^{(n−1)/2}` | `Σ_w q_w^{(n−1)/2 − Re z}` converges iff `Re z > (n + 1)/2`, i.e. `Re s > n/2` | agrees |
| 3.3 origin | Rallis1984Injectivity line 345; GQT line 137 | Proposition 1.1 at pp. 149–150; §1.7 "First Term Range" | locators right |
| 3.4 lemma (seeded, new) | `T = diag(1, 0)`; overlapping subspaces | span `e₁`: scalar `1`, in range, `T^*` injective; span `e₂`: scalar `0`, fails. For `x = Tu`, `T^*x = 0`: `‖x‖² = ⟨u, T^*x⟩ = 0`, no independence used | true; "nonzero" needed |
| 3.4 last sentence | `T = θ_φ^*` | `TT^* = θ_φ^*θ_φ`, the Rallis operator; `T^* = θ_φ` injective | agrees |
| 3.4 origin | Rallis1984Injectivity line 535 | Theorem 1.6 at file page 19, printed p. 156 | locator right |
| 4.2 criterion (seeded) | `n = 1`, `d = 3`, trivial `π`, `ε_v = −1` | weight occurs iff `m_W ≥ 3`, the same as `ε m_W ≤ −d` in 5.3 | agrees |
| 5.1 theta integral (seeded) | `n = 0` | `I_V(φ)(h) = χ̃_V(det h)φ(0)`; norm `2|φ(0)|²` by 3.2's Check | agrees; label C03 |
| 5.2 norm (seeded) vs LocalFactors… §7.1 | `z = (d − n + 1)/2` | arguments `d/2 + 1 − i`, `i = 1..n`, i.e. `d/2 − i′`, `i′ < n`; least is `> 1` iff `d > 2n`, so (iv) is needed for `d ≤ 2n` | agrees with contract |
| 5.2 corollary line vs MetaplecticAutomorphicForms §6.13 | range, constant | supplier: `d(n) < m ≤ 2d(n)`, cuspidal, vanishing lower lifts, `[E:F]` | as described |
| 5.3 nonvanishing (seeded) | References vs labels of 5.2, 5.3 | route "5.2 in its second form"; formal proof has only the implication | inconsistent credit (C04) |
| 5.4 (c) repointed citation | `ℚ(√−3)`, `O_E²`, `k = 1` | HermitianFormsAndLattices §6.5 first Check: `(4π²/3)(27/4π²)(4/3) = 12 = r(L, 1)` | agrees |
| 6.1 triples (seeded) | label vs definition | `W^♭ ≅ V ⊕ V′(−1)`, `W` not assumed split, as the origin says | agrees |
| 6.5 descent (seeded) | label vs 6.12 | constants at `T` fixed by matching data, as 6.12 uses | agrees |
| 6.8 back-lifts (seeded): constancy | HermitianFormsAndLattices §0.2 at this head | section `s_x` of `det`, `SU(V)` simply connected; AdelicAlgebraicGroups §4.2 present | supplied |
| 6.10 compact case (seeded) | `p = q = 0` | base of 6.11's induction ("When `p = q = 0` this is 6.10") | agrees |
| 6.11 identity (seeded): formal scope | `q = 0` | `V′` negative definite, anisotropic: every test vector regular, so "all matched pairs" | consistent |
| 6.11 formal-proof names | export index | `ThetaIntegralsAgree`, `IsTriple`, `Geo.IsGood` each present | exist |
| 6.12 Needs | AutomorphicLFunctionsAndLocalFactors line 616; merge base line 2500 | AL.1.2.3 exists (ramified: `z` entire, `L = 1`); AL.1.2.1 already on `main` | agrees with description |
| 1.2 corollary line vs AdelicAlgebraicGroups §4.5a | `U(V)` definite, `A_G = 1` | supplier: `vol(U) Σ|Γ_i|⁻¹ ∫ f(g_∞x_i)dg_∞`; 1.2: `vol(K_∞K) Σ|Γ_c|⁻¹ ∫_{K_∞}`, `dk` of mass one | agrees |
| Headline 1 (class-set operator, integrality) | one class, `Γ = {±1}` | lift of `1` is `1/2`; `D_K = 2` restores integrality | holds |
| Headline 2 (Satake relation) | `n = d = 1`, split `w` | tensor pair `c_w μ(ϖ)⁻¹`, homomorphism pair `c_w μ(ϖ)` | consistent |
| Headline 3 (Rallis inner product) | `n = 0` | both sides `2|φ(0)|²` | holds |
| Headline 4 (trivial representation, genus theta) | `n = 2`, `d = 3`; `O_E²` | `L_E(3/2)L_E(1/2)`; `r = 12` | holds |

- Source locators checked against the text: 11 (GQT §§1.7, 11.1, 11.2, Theorems 1.3 and 7.1; Rallis 1984 Proposition 1.1 pp. 149–150, Theorem 1.6 p. 156; HKS §1 p. 950, Proposition 2.2 p. 958; Mínguez pp. 718, 734).
- Formal-proof declarations: `LiftSatU` read at the cited commit; 14 cited names found in the export index.
- Cross-roadmap citations resolved at this head: 21 (MetaplecticAutomorphicForms §§1.5, 3.7a, 3.9a, 3.14, 3.22a, 5.6, 5.6b, 6.4, 6.10, 6.13, 6.15; ThetaKernelsForUnitaryDualPairs §§3.9a, 3.21a, 4.4a, 6.13a; AdelicAlgebraicGroups §4.5a; HermitianFormsAndLattices §§0.2, 6.5, 7.1; LocalFactorsOfTwistsAndTypes §7.1; AL.1.2.3; BaseChange… §6.3a). The changes to four of these roadmaps since the previous head touch locators and attributions only, no statement cited here.
- Record: 7 layers at the merge base, none removed or retitled; no heading and no Lean declaration removed.
- Automatic checks: all passed. Dependency check: `depcheck: 129 roadmaps, 1452 edges, 0 problem(s)`.
- `lake env lean` on `Suggested.lean`: exit 0, no messages. The file declares nothing and the pull request does not change it, so there was no signature to compare and no one-tactic probe to run.
- Files outside the named folders: none.
- Overlap check: read ThetaKernelsForUnitaryDualPairs, RowTowerAndRallisIdentities, SeesawForThetaChains and MetaplecticAutomorphicForms; the change adds no object of its own. The Rallis inner product formula for an anisotropic target is owned by ThetaKernelsForUnitaryDualPairs §6.13a (MetaplecticAutomorphicForms §6.13 for `n < d ≤ 2n`) and cited here; the definite-pair objects are owned here.

Source independence: changed passages only; 20 passages (the labels of the 15 sampled sections, 1.6, 3.4, 5.4 (c), the new supplier contracts, the References entries) compared with 4 cached sources (GQT, Rallis 1984, HKS, Mínguez), none shared beyond bibliographic titles; largest share [FormalProof], 73 path locators; arrangement not compared, since no layer is added, removed or reordered.

Research link: the roadmap specialises to definite unitary groups the global theta correspondence of unitary pairs (Kudla 1994; Harris–Kudla–Sweet 1996), the Rallis inner product formula (Rallis 1984; Li 1992; Gan–Qiu–Takeda 2014) and the first-term-identity method of Kudla–Rallis (1994), and supplies the family's theta-chain roadmaps; from the README summary and GQT §§1.7, 11.

## Not verifiable

- Li (1992), Labesse (2011), Braun (1941), Weil (1965), Rallis (1982), Kashiwara–Vergne (1978), Gross (1999), Kudla–Rallis (1994) and Atobe–Gan (2017): no text in the sources cache; cited in origin labels only, not checked.
- The `*Method of the formal proof:*` labels against the formal proof's proofs: only `LiftSatU` was read; for the others only the existence of the cited names was checked.

## Source issues

- none

## For the human reviewers

- The two recorded decisions concern sections that leave a family roadmap. This folder removes no section or layer, so neither was needed here.
