# Review of ThetaLiftsForDefiniteUnitaryGroups (pull request #3027 at 3bddf73)
Folder: `TauCetiRoadmap/RiemannHypothesisForDirichletLFunctions/ThetaLiftsForDefiniteUnitaryGroups/`
**Verdict:** accepted

**Summary.** A review of the change against `main`: 680 changed lines since `b8f3652`. The change adds `*Origin:*`, `*Method of the formal proof:*` and `*Corollary of:*` labels, restates 3.4 around a linear-algebra lemma, adds the formal proof's local form of the integrality statement to 1.6, and repoints supplier citations. Every new `*Corollary of:*` citation was checked against the supplier section it names, and the new statements in 1.6 and 3.4 were checked by computation. None makes a stated result false, so there is no finding. There are eight small corrections, all non-blocking: a wrong subsection number for GQT's global theta lift, one formal-proof label that points at the wrong parameter formula, provenance labels that do not match their sections, the unclear status of 3.4's criterion, missing locators, an ambiguous normalisation, and the pull-request description. Nothing is left for the human reviewers to decide.

## C01 — GQT's global theta lift is §11.2, not §11.1

A reader who follows the locator finds the table of dual pairs, not the lift. In the numbering of arXiv:1207.4709v3, §11.1 is "Dual Pairs" (GQT line 2491). The automorphic realisation and the lift θ_{n,r}(φ, f) are §11.2, pp. 51–52 (GQT lines 2503–2538). MetaplecticAutomorphicForms §6.13 itself says "as in GQT §11.2". The wrong number appears in the origin of 1.5 (line 608) and in the GQT entry of the References (line 3494). Both would read "§11.2".

## C02 — The label of 2.3 describes the split-place relation without the inversion, but points to 2.2, which has it

The method label of 2.3 (lines 1090–1092) credits the formal proof with "the original parameter times `χ_V/χ_W`" plus a segment, and cites 2.2. Section 2.2 states `(c_w α⁻¹, segment)` for the tensor pair, and its last Check says that the inversion can be detected. The formal proof's `UpperTheory.Gal.TP.Loc.LiftSatU` (`SatakeLifts/CompUnit.lean`, at the cited commit) sends a parameter `B` to `B` times `χX(ϖ)/χW(ϖ)` plus the segment, written there as `B.map (· * (val χX w * (val χW w)⁻¹)) + seg …`, with no inversion. That is the homomorphism-pair form 2.5 (d). Would cite "2.5 (d); for the tensor pair of 2.2 the parameter is inverted".

## C03 — Six sections are labelled "definitions and conventions" although each states results to prove

Sections 0.3, 0.4, 1.1, 1.3, 2.5 and 5.1 (lines 351, 419, 462, 541, 1184, 1660) each have a `Prove:` list: lattice vectors and their transport, invariance and boundedness of the kernel, convergence and equivariance of the lift, the lattice form, the dictionary (a)–(g), and the theta integral. The Labels paragraph (line 220) calls them definitions. So the provenance of these statements is never given. The References already attribute 0.3 and 0.4 to Weil (1964) and Kudla (1994), and 2.5 (e) names a formal-proof declaration. Would write, for example, "*Origin:* definitions, with standard properties from Weil (1964) and Kudla (1994)", or move the statements under a label of their own.

## C04 — 5.3's route is credited to the formal proof, but it runs through 5.2's norm identity, which the formal proof lacks

The References entry for [FormalProof] (lines 3428–3430) lists 5.3 among the routes taken from the formal proof, and 5.3's label does not say that its route differs. The route of 5.3 (line 1777) is "5.2 in its second form". Yet 5.2's label says the formal proof "states the implication from a vanishing theta integral, not the equality of the norm with the `L`-values", and that 5.2's own route is not the formal proof's. Would add to 5.3's label that the route written here goes through 5.2, and narrow the References entry to what 5.3 shares with the formal proof (the factorisation and the choice of test function).

## C05 — In 3.4 the definite-pair criterion, the section's statement on `main`, now sits under "Remark"

The new `Prove:` statement (lines 1465–1466) is the linear-algebra lemma, which is correct: `T T^*` acting by `c ≠ 0` on `U` gives `U ⊂ im T`, and `T^*x = 0` with `x = Tu` gives `‖x‖² = ⟨u, T^*x⟩ = 0`. The criterion for `θ_φ` follows under "*Remark (the criterion for a definite pair)*", which says it "is proved by the route below". A reader cannot tell whether it is still a target of 3.4. Would head it "Prove also (the criterion for a definite pair):".

## C06 — Several new origin citations give no locator

The following are cited with no theorem, section or page:
- Rallis (1984), *Injectivity properties*, for 1.4 (line 567; References line 3468). The pairing against a kernel is Proposition 1.1, p. 149, with the function `Y(φ, φ′)` defined just before it.
- Rallis (1984), *On the Howe duality conjecture*, for 2.4 and 6.6. MetaplecticAutomorphicForms §§5.6a–5.6b give Theorem I.1.1, p. 345, and Theorem I.2.2, pp. 355–356.
- Rallis (1982) for 2.2.
- Atobe and Gan (2017) for 2.3.
- Braun (1941) for 5.4. HermitianFormsAndLattices §6.5 gives Satz V.
- Weil (1965) for 5.4 and 6.3.
- Kudla and Rallis (1994) for 6.1, 6.3a, 6.7 and 6.11.

## C07 — The label of 1.6 mixes two normalisations of the valuation

The method label (lines 658–659) gives the lift "valuation at least `b − v_p(D)`". The paragraph *The form of the formal proof* measures `b` 𝔭-adically, through `𝔭^b`. With the 𝔭-adic valuation the bound is `b − v_𝔭(D)`. Example: `L₀ = ℚ(i)`, `𝔭 = (1 + i)`, one class with `Γ_c = {±1}`, kernel `1`, `b = 0`. Then `Θ^φ 1 = 1/2` has `v_𝔭 = −2 < −1`. Would write `b − v_𝔭(D)`, or say that the valuation is normalised by `v(p) = 1`.

## C08 — The description misstates one change to this roadmap and leaves two out

The description says that 6.12 gains AutomorphicLFunctionsAndLocalFactors §AL.1.2.1 and §AL.1.2.3. Its `*Needs:*` line already had §AL.1.2.1 on `main`; only §AL.1.2.3 is new. The description also does not mention two changes to stated results here. First, 3.4 now states a linear-algebra lemma, with the definite-pair criterion as a remark. Second, 1.6 gains a statement, the formal proof's integrality at one place `𝔭`. Would add one sentence on each.

## Verified sound

| Statement | Instances tried | Values computed on each side | Result |
|---|---|---|---|
| 1.4 adjoint lift (seeded): origin, Rallis 1984 | Rallis1984Injectivity lines 342–345 | `Y(φ, φ′)` and Proposition 1.1 on p. 149; the inner product of lifts is ψ₁∗Y paired with ψ₂ | supported; locator missing (C06) |
| 2.3 inert places (seeded) vs MAF §3.22a | `n = 0`, `d = 2`, trivial characters | MAF segment `(q^{1/2}, q^{−1/2})`, `q = q_v²`, gives `(q_v, q_v⁻¹)`; 2.3 Check gives `(q_v, q_v⁻¹)` | agrees |
| 2.3 method label vs 2.2 and `LiftSatU` | `n = d = 1`, split `w` | `LiftSatU`: `B·χX/χW`; 2.2: `c_w α⁻¹`; 2.5 (d): `c_w α` | pointer wrong (C02) |
| 2.4 constituents (seeded): origin | MAF §5.6b | Rallis84a Theorem I.2.2 and local Howe duality, as MAF states | supported |
| 2.5 dictionary (seeded): (f) continuity | ThetaKernels §4.4a (5) | continuity of `Σ_ξ (ρ(w)ω′(g, h)φ)(ξ)`, the same on both sides | agrees; label C03 |
| 3.3 Rallis operator (seeded): method | `n` parameters `|α| ≤ q^{(n−1)/2}` | `Σ_w q_w^{(n−1)/2 − Re z}` converges iff `Re z > (n + 1)/2`, that is `Re s > n/2` | agrees |
| 3.3 origin: GQT §1.7 | GQT line 141 | convergent range "r = 0 or m − r > n + ε₀", citing KR1, Li, I3, Y4 | agrees |
| 4.2 criterion (seeded) | trivial `π`, `n = 1`, `d = 3`, `ε_v = −1` | occurs iff `a_v = (3 − m_W)/2 ≤ 0`, that is `m_W ≥ 3`, the same as the Check `ε m_W ≤ −d` | agrees |
| 5.1 theta integral (seeded) | `n = 0` | `I_V(φ)(h) = χ̃_V(det h)φ(0)`; 3.2 Check gives `2|φ(0)|²` | agrees; label C03 |
| 5.4 genus theta series (seeded), (c) | `E = ℚ(√−3)`, `L = O_E²`, `k = 1` | `r(L, 1) = 6·2 = 12`, `|U(L)| = 36·2 = 72`; HFL §6.5 Check: `(4π²/3)(27/4π²)(4/3) = 12` | agrees |
| 5.4 origin: GQT Theorem 7.1 | GQT lines 1619–1627 | `c = 1` if `s > 0`, else `2`; `τ(H₀)/[E:F] = 1`; 5.4 (c): `c = 1` for `n > k` | agrees |
| 6.2 matching data (seeded): Mínguez | Th. 1, p. 718; Cor. 6.3, p. 734 | for `n ≤ m`, θ(π) is the Langlands quotient of the segment times π̃ | agrees |
| 6.3 square-integrability (seeded) | `α = β` | `ν = 1`, so no admissible `v₁`, as the text says | agrees |
| 6.5 descent (seeded): origin | the 6.12 constant | the local constants at `T` are fixed by the matching data, consistent with "particular to this proof" | agrees |
| 6.8 back-lifts (seeded): constancy | HFL §§0.2, 2.5 | `SU` simply connected (0.2); strong approximation (2.5, AAG §4.2a) | supplied |
| 6.9 cuspidality (seeded) | label vs body | induction on the isotropic dimension; purity on a rank-two Levi | agrees |
| 6.10 compact case (seeded) | `p = q = 0` | base of 6.11's induction, as 6.11 says | agrees |
| 6.12 recursion (seeded) | `λ_v ↦ λ_v(ϖ_w^k, ϖ_{w̄}^{−k})` | `ν_w(ϖ)^k ν_{w̄}(ϖ)^{−k} = ν_w(ϖ)^{2k}` since `ν` is trivial on `F_v^×` | agrees |
| 6.12 Needs: AL.1.2.3 | AL README line 616 | ramified Tate theory: `z` entire, `L = 1` | exists |
| 1.6 formal form (new) | one class, `Γ = {±1}`, `𝔭 = 2`, `k ≡ 1` | `D = 2`: `DΘ1 = 1 ∈ ℤ_(2)`; `D = 1`: `1/2 ∉ ℤ_(2)` | true; C07 |
| 3.4 lemma (new) | `T = diag(1, 0)` | on span e₁: `TT^* = 1`, `T^*` injective; on span e₂: scalar `0`, injectivity fails | true; "nonzero" needed |
| 0.2 twist via §4.4a | `χ_V ↦ χ_Vμ` | split law factor `χ̃_V(det h)` becomes `μ(x)` at `det h = x/x̄` | agrees with method |
| 1.2 vs AAG §4.5a | one class, `Γ = {±1}` | `vol(U)·½∫dg_∞ = vol(K_∞K)/2 ∫dk`; 1.2 Check gives `/2` | agrees |
| 1.5 origin: GQT §11.1 | GQT lines 2491, 2503–2538 | §11.1 is dual pairs; the lift is §11.2 | wrong (C01) |
| 1.7 vs MAF §1.5 (iv), (ii) | `T = δ₀`, `P = z²` | `ϑ_T = 2^{1/4}e^{−πz²/2}`, `conj(π⁻²ϑ″(0)) = −2^{1/4}/π`, matching the Check | agrees |
| 2.1 vs MAF §3.7a (iii) | `n = d = 1`, `ε = −1` | MAF `(ts)^{−ℓ}`; 2.1 types `−(ℓ + a), −(ℓ + b)`, giving `−ℓ` relative to the vacuum | agrees |
| 3.2 vs MAF §6.13 | `n = 1`, `d = 2`; `n = d = 1` | `C = 2 = [E:F]` in range; `d = n`: `c = 2`, `C = 1`, outside range | agrees |
| 4.1 vs MAF §3.9a (iii) | `d = 2n + 1`; `d = 2n + 2` with sign `−1` | Witt index `n` and `d/2 − 1 = n` ≥ `n` | hypothesis met |
| 5.2 vs LFTT §7.1 (ii) | `n = 2`, `d = 3` | `z = 1`: `L_E(3/2)L_E(1/2)`, matching the Check | agrees |
| 5.3 provenance | References vs 5.2 label | route uses 5.2's identity; formal proof has only the implication | inconsistent (C04) |
| 6.11 formal scope | `q = 0` | `V′` negative definite, hence anisotropic, so every test vector converges | consistent |
| Headline 1 | one class, `Γ = {±1}`, `M̂ = 𝒪̂` | lift of `1` is `1/2`; `D_K = 2` restores integrality | holds |
| Headline 2 | `n = d = 1`, split `w` | tensor pair `c_w μ(ϖ)⁻¹`; homomorphism pair `c_w μ(ϖ)` | consistent |
| Headline 3 | `n = 0` | both sides `2|φ(0)|²`, `C = 2` | holds |
| Headline 4 | `n = 2`, `d = 3`; `O_E²` | `L(3/2)L(1/2)`; `r = 12` | holds |

- Source locators checked against the text: 14 (GQT §1.7, Theorems 1.3, 7.1 and 11.4, §§11.1–11.2; Rallis 1984 Proposition 1.1 p. 149, Theorem 1.6 p. 156; HKS §1 pp. 950–957, Proposition 2.2 p. 958; Mínguez Théorème 1 p. 718, Corollaire 6.3 p. 734; Atobe–Gan arXiv abstract).
- Cross-roadmap citations resolved at this head: 22. These are MetaplecticAutomorphicForms §§1.5, 3.7a, 3.9a, 3.14, 3.22a, 5.6, 5.6b, 6.13 and 6.15; ThetaKernelsForUnitaryDualPairs §§3.21a and 4.4a; AdelicAlgebraicGroups §4.5a; HermitianFormsAndLattices §§0.2, 2.5, 6.5 (b) and its first Check, 7.1, 7.2; LocalFactorsOfTwistsAndTypes §7.1; AL.1.2.1 and AL.1.2.3; BaseChangeAndGaloisRepresentationsForUnitaryGroups §6.3a.
- MetaplecticAutomorphicForms ids 1.5, 3.7a, 3.9a, 3.22a and 5.6b are defined by no other open head; the other open pull request that changes that roadmap has only §6.13, unchanged.
- One formal-proof declaration opened at the cited commit: `UpperTheory.Gal.TP.Loc.LiftSatU`.
- Automatic checks: all passed. Dependency check: `depcheck: 129 roadmaps, 1452 edges, 0 problem(s)`.
- `lake env lean` on `Suggested.lean`: exit 0, no messages. The file declares nothing and is unchanged by the pull request, so there was no `#check @name` comparison to make.
- Files outside the named folders: none. The family index is the pull request's own.
- Overlap check: read ThetaKernelsForUnitaryDualPairs, RowTowerAndRallisIdentities and SeesawForThetaChains (on main), and MetaplecticAutomorphicForms at both open heads. The change adds no object of its own. The Rallis inner product formula for an anisotropic target is owned by ThetaKernelsForUnitaryDualPairs §6.13a (MetaplecticAutomorphicForms §6.13 for `n < d ≤ 2n`) and is cited here; the definite-pair objects are owned here, and both neighbours cite them.

Source independence: changed passages only. 26 passages were compared with 7 cached sources: the new labels of the 15 sampled sections, the Conventions' continuity clause, 1.6, 3.4, 5.4 (c), the new supplier-contract entries and the References entries. The only shared 7-word runs are bibliographic titles. The largest share is [FormalProof], about 56 of 155 citations. Arrangement was not compared, since no layer was added, removed or reordered.

Research link: the roadmap specialises to definite unitary groups the global theta correspondence of unitary pairs (Kudla 1994; Harris–Kudla–Sweet 1996), the Rallis inner product formula (Rallis 1984; Li 1992; Gan–Qiu–Takeda 2014) and the first-term-identity method of Kudla–Rallis (1994). It supplies the family's theta-chain roadmaps. This rests on the README summary and GQT §§1.7 and 11.

## Not verifiable

- Li (1992), J. reine angew. Math. 428: no legal copy in the cache. The claim in 4.3's label about its §§3–4 was not checked.
- Labesse (2011), Braun (1941), Weil (1965), Rallis (1982), Kashiwara–Vergne (1978) and Gross (1999): not in the cache. They are cited in labels only, not checked.
- About 30 `*Method of the formal proof:*` labels against the formal-proof repository: only `LiftSatU` (2.2–2.4) was opened.
- The copy of the pull request's description supplied for this review was cut short. The passages about this roadmap were read in the description as posted on the pull request, which agrees with the supplied copy wherever both have text.

## Source issues

- none

## For the human reviewers

- The two recorded decisions concern sections that leave GeneralizedRiemannHypothesisFromWindowBounds or another family roadmap. This folder removes no section, so neither decision was needed here.
