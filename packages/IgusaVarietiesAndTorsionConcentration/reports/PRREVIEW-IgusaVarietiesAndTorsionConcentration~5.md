# Review of IgusaVarietiesAndTorsionConcentration (pull request #1090 at 25763ac)

**Verdict:** needs changes

**Summary.** Changes are needed, for two reasons. The implication in 7.2 from a decomposed-generic witness to cohomological genericity rests on the compact-case Igusa trace argument, which no layer of this roadmap and no supplier provides once the trace-formula sections are gone; and statement (3) of 3.4 calls the Newton map on the flag variety lower semicontinuous, where with the order of 0.2 it is upper semicontinuous. The new Layer 7 (Koshikawa's local and global vanishing, level descent, the integral forms and the Caraiani–Newton export) was checked against the sources and stands. There are five small corrections and two format notes, none blocking, and nothing is left for a human to decide.

## R01 (P1) — The implication of 7.2 from a decomposed-generic witness to cohomological genericity has no owner for its proof

The last interface bullet of 7.2 (line 2090) is a stated result: for `F⁺ ≠ ℚ`, "an auxiliary split decomposed-generic witness … implies cohomological genericity, by repeated application of LTXZZ PropositionD.1.3". SelmerIwasawaCohomologyPartII consumes it by name (its supplier contract for §IG.7.2, line 890 of its README at its open head). An implementer who opens Proposition D.1.3 finds that it is not a formal consequence of anything stated here. Its proof (ltxzz lines 9500–9574, Appendix D.1) builds the Hodge-type Shimura datum of the honest unitary group times a torus, forms Mantovan's Igusa varieties over its integral model, modifies the stable trace identity for their alternating cohomology (CS17 Theorem 5.2.3 and Corollary 5.2.5), reruns the argument to CS17 Theorem 5.5.7, and then repeats the proof of CS17 Theorem 6.3.1(2). This head removes the sections that carried the nearest inputs (the Galois representations of Igusa constituents, the rational constituent and "genericity forces ordinarity"), the *Needs* line of 7.2 is now "AutomorphicGaloisRepresentationsPartII AG2.7" alone, and Layer 7 proves generic vanishing only for the quasi-split `U(n, n)` datum at a completely split prime. The compact theorem is owned by IgusaVarietiesAndTorsionConcentrationPartII (its Layers 9–11), which comes later in the merge order and treats only the two PEL similitude cases, not the unitary-group variant of Appendix D.

The smallest change that makes the text true: keep in 7.2 the predicate with its formal properties (enlarging `Σ⁺`, extension of the coefficient field), and move the implication to the roadmap that proves the compact concentration theorem, as a target there with the unitary-group trace identity among its inputs; a sentence in Scope and ownership then says that the implication is not proved here. If the bullet stays, it needs its own targets (the datum, its Igusa varieties, the modified trace identity and the passage to the middle degree) and a *Needs* line naming them, and none of them may come from the later roadmap. In either case the witness should be stated as the source has it: for each enlargement `Σ⁺′`, a place `w` of `F⁺` outside `Σ⁺′` and the places above `ℓ`, split in `F`, at which the Hecke polynomial has distinct nonzero roots with no ratio equal to the residue cardinality (ltxzz Definition D.1.2, line 9485).

## R02 (P2) — Statement (3) of 3.4 has the direction of semicontinuity reversed

In 3.4 (line 1467) statement (3) reads "`x ↦ b(x)` is lower semicontinuous on `|Fℓ_{G,μ}|`", and the interface exports it as "Statement (3)". With the order of 0.2 the map is upper semicontinuous: statement (4) of the same target says that the upper sets `Fℓ^{≽b}` are closed and the basic stratum is open, and the Check for `GL₂`, `μ = (1, 0)` computes it. There `{x : b(x) ≼ basic}` is Drinfeld's upper half plane, which is open and not closed, while `{x : b(x) ≽ ordinary} = ℙ¹(ℚ_p)` is closed. So (3) contradicts (4) and the Check of its own section. The word comes from the source, which prints "lower" in Proposition 3.5.7(1) (cs17 line 1654, p. 689) although its Corollary 3.5.9 has the upper unions closed. BunGAndNewtonStrata, which consumes 3.4, already records the opposite word for the same map (its README at its open head, line 1723: "the Newton map is upper semicontinuous and the upper unions are closed").

Replace "lower" by "upper" in (3), or state (3) as "the sets `Fℓ^{≽b}` are closed" and let (4) keep the rest.

## C01 — Two hypotheses survive from the removed trace-formula route and are used by nothing

5.2 is stated "in the trace-comparison setting" (line 2015), which brings `F⁺ ≠ ℚ`, the character `ϖ` and the integer `N₀`; the statement is Poincaré duality on a smooth finite-level Igusa variety with the Hecke involution, and neither it nor its consumer (the Poincaré duality section of Part II, which says it uses only smoothness and the Hecke action away from `p`) needs them. 7.7 assumes `F⁺ ≠ ℚ` (line 2132, and the Summary, line 7), but its proof sketch uses only the Levi calculation, 6.6a–6.6b, the unitary consequence of 7.14 and 7.6, none of which has that hypothesis; for `F⁺ = ℚ` and `n = 1` the boundary system is `ρ₁ε⁻¹ ⊕ ρ₁^{c,∨}`, reducible as in the first Check. Both statements are true as written. It would be more useful to state 5.2 for `ℓ ≠ p` and a neat level only, and 7.7 without `F⁺ ≠ ℚ`, now that 7.14 holds for imaginary quadratic `F`.

## C02 — Part II still cites the removed section 5.4

IgusaVarietiesAndTorsionConcentrationPartII, at its open head, says in Scope and ownership (line 622 of its README) that "the parent's §§0.4, 5.1, 5.2 and 5.4 state the Hecke algebra, the dual ideal, Igusa Poincaré duality and the rational constituent". This head has no 5.4: the rational constituent went with the trace-formula sections. No other roadmap cites a removed section (4.8–4.10, 5.3, 5.4, 5.6, 6.1–6.7, 7.1, 7.3, 7.5, 7.8 were searched). The reference breaks when this roadmap merges; the repair belongs in Part II's sentence (drop "5.4" and "the rational constituent", its §11.4 then being the only statement), and the description of this pull request could say that those sections are gone.

## C03 — The locator of 3.16 covers only its first statement

3.16 cites "CS17, §4.2, Proposition 4.2.6, p. 702 (with Remark 4.2.8, p. 703)" (line 1663). Those give statement (1), the factorization of the local period map through the `b`-stratum and its agreement with the global one. Statement (2) and the stalk formula (every geometric rank-one point of the fibre lies in `𝒮^b`, the fibre of `𝒮^b` is a quasicompact open with the same rank-one points, and the stalk is its cohomology) are in the proof of Theorem 4.4.4, printed p. 728 (cs17 lines 3182–3187), which uses the argument of Lemma 4.2.18 and Lemma 4.4.2. Add that locator.

## C04 — In 6.6a "roots" means reciprocal roots

Line 2045 says "the roots of `P_std` are the roots of `P_v` divided by `q_v`", and the Checks speak of "the root `6` of `P_v`" for `P_v = 1 − 6X` and say that the roots of `1 − 6X + 40X²` are `2` times those of `Y² − 3Y + 10` (lines 2051–2052). The root of `1 − 6X` is `1/6`. What is meant, and what is true, is the statement about the Frobenius eigenvalues, the reciprocal roots of `P_v = det(1 − Xσ(Frob_v))`: `6/3 = 2`, and the eigenvalues of `σ` are `q` times the roots of `P_std`. Write "reciprocal roots" (or "Frobenius eigenvalues") in the three places.

## C05 — 0.2 indexes the split decomposition by a prime of `F₀` before `F₀` exists

0.2 writes `G_{ℚ_p} ≅ ∏_{w|𝔭} GL_{2n}(ℚ_p) × 𝔾_m` with "`𝔭` the prime of `F₀` chosen above `p`" (line 80). An imaginary quadratic subfield is fixed only in 0.4, and the first statement of 7.14 is for an arbitrary CM field, where there may be none. The source of 7.14 indexes the product by a choice of one place of `F` above each place of `F⁺` over `p` (kos21 lines 55–59). Say that in 0.2; when `F₀` exists the places above one prime of `F₀` are such a choice.

## N01 — A pointer in 0.6 names the wrong Check

0.6 (line 216) refers to "0.4, first check" for the failure of restriction on the full algebra to be a ring map; that is the third Check of 0.4 (the one with `U_q · U_q⁻¹ = 1`).

## N02 — Downstream consumers omits the roadmaps that use the compact and local parts

IgusaVarietiesAndTorsionConcentrationPartII (0.11, 0.12, 0.24, 1.1–1.8, 3.14, 3.17, 4.5, 5.1, 5.2, 5.5), PotentialAutomorphyInfrastructure (0.3–0.6, 5.1, 6.6a–6.6b, 7.4, 7.6, 7.14–7.15) and SelmerIwasawaCohomologyPartII (7.2) cite this roadmap and are not in the list; since 1.8, 5.2 and 5.5 now serve only the first of these, naming it would tell a reader why they are kept.

## Verified sound

| Statement | Instances tried | Values computed | Result |
|---|---|---|---|
| 0.6 open and closed unitary component | `n = 1`, `F` imaginary quadratic; source Lemma 2.1.1 | `c(γ) ∈ ℚ^× ∩ ∏ℤ_p^× = {±1}`, positivity gives `1`; restriction to an open-closed part is onto; csnc lines 506–527, p. 12 | agrees |
| 0.7 Hasse principle | `n = 1`; torus `G/G^der` | pairs `(z, t)` with `N(z) = t^{2n}`, isomorphic to `Res T × 𝔾_m` by `(z/tⁿ, t)`; csnc lines 529–544, p. 12; README has places of `ℚ` | agrees; source misprint noted |
| 0.12 Newton stratification | `n = 1`, `p` split | two classes, `d_b = 1, 0`; class in `B(G, μ⁻¹)` and choice of `X_b` at cs17 lines 2655–2666, p. 714 | agrees |
| 0.13 splitting symplectic filtrations | `X = μ_{p^∞} ⊕ ℚ_p/ℤ_p`, `Z_{−2} = Z_{−1} = μ_{p^∞}` | middle piece zero, splitting is the given sum, `λ` pairs the two; csnc lines 616–633, p. 14 | agrees |
| 1.8 alternating cohomology | finite basic leaf | only `H⁰_c`, so class equals the representation; definition and `S`-unramified part at cs17 lines 3312–3345, pp. 731–732 | agrees |
| 2.6 connected and biconnected groups | empty boundary; ordinary cusp | no boundary: `𝒜[p^∞]` is `p`-divisible; `X° = Hom(X, μ) ⊕ X°_Z` at csnc line 1756; Propositions 3.2.1, 3.2.2 on pp. 39, 40 | agrees |
| 2.12 EO strata and Hasse sections | `n = 1` imaginary quadratic | dimensions `1, 0`; csnc lines 1976–1984, p. 45; box15 Theorem C printed p. 17, Theorem 6.2.3 and Corollary 6.2.4 printed p. 190 | agrees |
| 2.14 central-leaf EO stratum | `GL₂`, ordinary and basic | each class meets `Kμ(p)K` and has a fundamental element; nie15 Theorem 1.4, Proposition 1.5 on p. 3, Corollary 1.6 on p. 4 | agrees |
| 3.4 Newton stratification of the flag variety | `GL₂`, `μ = (1, 0)` | lower set of basic is `Ω`, open not closed; upper set of ordinary is `ℙ¹(ℚ_p)`, closed; source prints "lower" | (3) reversed: R02 |
| 3.6 local Hodge–Tate period map | Lubin–Tate `GL₂` | image `ℙ¹ ∖ ℙ¹(ℚ_p)`; Theorem 4.2.4 printed p. 699, Propositions 4.2.5, 4.2.6 printed p. 702 (cs17 lines 2030, 2132, 2143) | agrees |
| 3.16 Newton strata on rank-one points | proper case, rank-one `x ∈ Fℓ^b` | (1) from 4.2.6 and Remark 4.2.8, pp. 702–703; (2) and the stalk at cs17 lines 3182–3187, p. 728 | true; locator incomplete: C03 |
| 4.0a valuation models | `X = Spec O_C`; smooth relative curve | `Λ ↦ Λ` in degree `0`; `Λ[1] ↦ Λ[1]`; hs-relative Theorem 4.1 p. 16, Corollary 4.2 p. 17, Lemma 6.3 p. 28; bh Theorem 4.2(8) p. 31 | agrees |
| 4.3 cofinal formal models | `d_b > 0` versus basic | integral map from the valuative criterion, `A°/p` of finite presentation over `O_C/p`; csnc lines 2660–2673, pp. 61–62 | agrees |
| 4.6a two-level bounds | modular curve, tame level `Nℓ^∞` | `Rj_*𝔽_ℓ = 𝔽_ℓ` after the `m₂`-colimit, bound `d = 1`; csnc lines 2685–2709, pp. 62–63 | agrees |
| 4.7 semiperversity | `n = 1`, `F` imaginary quadratic | `d = [F⁺:ℚ]n² = 1`; csnc lines 2615–2620, p. 60, end of proof p. 63 | agrees |
| 5.1 dual Hecke ideals | `2n = 2`; `{1, 2}`, `q = 7`, `ℓ = 11` | dual roots `q/α, q/β`: sum `T₁/T₂`, product `q/T₂`; `{7, 9}`; ratios avoid `7` in both systems | agrees |
| 5.5 splitting generic lifts | `q ≢ 1` and `q ≡ 1` mod `ℓ` | inertial orbit of length `r > 1` forces eigenvalue ratios in `μ_{r′}`, which contains `q̄`; unipotent part forces ratio `q` | agrees |
| 6.6a normalization | `r = 1`, `q = 3`, `U₁ = 2`; `r = 2`, `q = 2`, `U = (3, 5)` | `1 − 6X` and `Y − 2`: eigenvalue `6 = 3·2`; `1 − 6X + 40X²` is `(qX)²P_std(1/(qX))` | true for eigenvalues; wording: C04 |
| 7.2 cohomological genericity | `N = 1`; the implication for `F⁺ ≠ ℚ` | `N = 1`: no degree `i ≠ 0`, vacuous; implication needs ltxzz D.1.3, proved by a modified Igusa trace identity (lines 9500–9574) | predicate sound; implication unowned: R01 |
| 7.6 integral forms | long exact sequence of the boundary | `H^{d−1}(X)_𝔪 = 0` and `H^{d+1}_c(X)_𝔪 = 0` give the four-term sequence; `H^d(ℤ_ℓ)[ℓ]` is a quotient of `H^{d−1}(𝔽_ℓ) = 0` | agrees |
| 7.7 boundary exclusion | `n = 1`; `n = 2, r₁ = 1`; `F⁺ = ℚ` | exponents `−1, 0`; `−3, 0` and `−1`, dimensions `1 + 1 + 2 = 4`; proof never uses `F⁺ ≠ ℚ` | true; hypothesis unused: C01 |
| 7.11 local vanishing | `GL₁`; `ℤ_ℓ[t, t⁻¹]/(t − ℓ)` | every `J_b` quasi-split for `GL₁`; the module is `ℚ_ℓ`, `ℓ`-divisible, zero mod `ℓ`; source proves the mod-`ℓ` case (kos21 line 222) | agrees; source gap noted |
| 7.12 ordinary costalk bound | `Z₀ = ∅`; `ℙ¹(ℚ_p) ⊂ ℙ¹` | zero complex; `Rlim` of complexes in `D^{≥d}` stays in `D^{≥d}`; kos21 Corollary 8.2 and Lemma 8.3, lines 515–557, pp. 13–14 | agrees |
| 7.13 costalk–stalk comparison | split balanced `GL_{2n}` factor | integral slopes in `[−1, 0]` with total `−n` are `n` zeros and `n` minus-ones, so nonordinary `b` has a division factor; kos21 lines 575–645 | agrees |
| 7.14 global vanishing | `n = 1`, `F` imaginary quadratic, `H⁰`; arbitrary neat level | trivial system: `T₁ = p + 1`, `T₂ = 1`, roots `1, p`, ratio `p`, not generic; Hochschild–Serre keeps the bound `i ≥ d`; kos21 Theorem 1.3, p. 2 | agrees |
| 7.15 Caraiani–Newton export | hypotheses on `F`, `T`, genericity | cn23 Definition 2.1.27 (`α_i/α_j ≠ ℓ`, no distinctness) and Theorem 2.1.28, lines 1235–1265, p. 25; Theorems 2.1.20, 2.1.26 on pp. 22, 24 | agrees |
| 0.2 ordinary class and `d_b` | completely split `p`; `GL₄`, `μ = (1, 1, 0, 0)` | `[F⁺:ℚ]` factors each with `⟨2ρ, μ⟩ = n²`, total `d`; `2ρ = (3, 1, −1, −3)` gives `4` | agrees; indexing: C05 |

- Source locators checked against the text: 41, in csnc (14), cs17 published (11), kos21 (9), cn23 (4), nie15 (3), ltxzz, box15, hs-relative, bh, ls18a-author.
- Library declarations opened at the pins (Mathlib `1b1ccf4`, Tau Ceti `2fd255d`, as in `lake-manifest.json`): `IsProper.of_valuativeCriterion` (`Mathlib/AlgebraicGeometry/ValuativeCriterion.lean:342`, with the three instance hypotheses the README lists), `RestrictedProduct.coeMonoidHom` (`Mathlib/Topology/Algebra/RestrictedProduct/Basic.lean:308`), `proetaleTopology` (`Mathlib/AlgebraicGeometry/Sites/Proetale.lean:64`), `smallEtaleTopology` (`Mathlib/AlgebraicGeometry/Sites/Etale.lean:50`), `HeckeCosetModule.instRingHeckeRing` (`TauCeti/NumberTheory/HeckeRing/Associativity.lean:484`), `HeckeAntiInvolution.ofAmbient`, `onHeckeCoset`, `mul_comm_of_antiInvolution` (`TauCeti/NumberTheory/HeckeRing/Commutativity.lean:135, 165, 459`), `TauCeti.ReductiveAffineGroupSchemeCat` (`TauCeti/AlgebraicGeometry/AffineGroupScheme/Reductive/Basic.lean`), the three Witt declarations.
- Cross-roadmap citations resolved: EndoscopicTransferAndUnitaryTraceComparison §§7.1–7.10, 10.2, 10.3, 10.26–10.32, 12.1–12.22 and AutomorphicGaloisRepresentationsPartII AG2.6 (three subsection titles), AG2.7 (`IsDecomposedGeneric`, `IsDecomposedGenericPrime`, infinitely many witnesses) on main; IntegralHeckeAndGaloisDeterminants Layer 3a and ArithmeticLocallySymmetricSpaces ALS.5a on main; TorsionCohomologyInfrastructure §§2.6–2.8, 3b.1, 3b.1a, 3b.2, 4.3, 4.6, 4.7, HodgeTateAndCanonicalSubgroups §§0.14–0.16, 0.28, 1.2, 1.4, 2.4–2.8 and PerfectoidShimuraVarieties Layers 0–6 at their open heads.
- Dependency check: `depcheck: 204 roadmaps, 2240 edges, 0 problem(s)`; no UPWARD or CYCLE line. The merge order lists this roadmap after TorsionCohomologyInfrastructure and before its Part II.
- Automatic checks at this head: all passed. `lake env lean` on `Suggested.lean`: no output. The file declares nothing, so there is no signature to compare and no one-tactic probe to run; its docstring names every headline theorem as not statable and the missing carriers. No file is changed outside the folder.
- Previous review (of `d692c6f`): accepted with no finding, so there is none to recheck. The pull request's title and description were read against this head: Koshikawa's route only, no `F⁺ ≠ ℚ` and no length bound in the main theorem, the Lean file declaring nothing, the consumers named. No sentence is contradicted.

Overlap check: read IgusaVarietiesAndTorsionConcentrationPartII, BunGAndNewtonStrata, HeckeStacksAndLocalShtukas, EndoscopicTransferAndUnitaryTraceComparison, AutomorphicGaloisRepresentationsPartII; shared: central leaves, Igusa towers and `J_b` (owner EndoscopicTransferAndUnitaryTraceComparison §§7.2–7.10, aliased here); the genericity predicates and the geometric Hecke and spectral actions (owner AutomorphicGaloisRepresentationsPartII AG2.6–AG2.7, cited); the flag Newton strata 3.4–3.5 and the local PEL data 0.11, 0.27 (owner this roadmap, cited by the two consumers); the compact concentration theorem (owner Part II, which cites 4.5, 5.1, 5.2, 5.5 here and restates the rank-`n` dual ideal as a declared variant).

Source independence: 16 passages compared with 6 sources (csnc, cs17, kos21, cn23, nie15, ltxzz), none copied; the longest shared run is about 14 words, in the statement of 4.7 against csnc lines 2617–2618, a theorem statement the mathematics fixes; largest share csnc, 81 of about 204 locators; contents compared with csnc: independent at the level of layers (Layers 0, 1, 3 and 4 combine cs17, csnc and others, Layers 5–7 rest on kos21, fs, acc23 and cn23); the order of Layer 2 is that of csnc §3 and is forced by the chain of *Needs* lines 2.1 → 2.2 → 2.5 → 2.6 → 2.7 → 2.8 → 2.9 → 2.11 → 2.16 → 2.17 → 2.18 → 2.20 → 2.21, with 2.10–2.15 the roadmap's own additions.

Research link: Layer 7 states Koshikawa's local and global generic vanishing (2021), which removes the hypotheses of Caraiani–Scholze (2017, 2019) and is the input to Caraiani–Newton (2023) for modularity over imaginary quadratic fields and to potential automorphy over CM fields (Allen et al., 2023); rests on kos21, cn23 and the README.

## Not verifiable

- The published pagination of ltxzz (Definition D.1.1 and Proposition D.1.3 on p. 365, Corollary D.1.4 on p. 368): only the arXiv version was read, where they are on its pp. 171–173.
- ls18a-author, Theorem 2.3.2 on author-copy pp. 17–19 (cited by 2.2): the statement was not located at that page in the extraction; 2.2 was outside the sample.
- The locators of fs, hkw21 beyond the earlier reviews, ms14a, ms14b, acc23-published, sch15, man05, man08, shi09, lil21, lil22, rsz20, oz02, ham15, vw, sw13, fargues and ls18b were not reopened in this round.
- The description's generated `depends-on` and `merge-order` blocks are outside the check of the text.

Automatic checks set aside as false positives: the lead that the citation "IntegralHeckeAndGaloisDeterminants Layer 3" in the *Needs* line of 5.1 resolves nowhere; the line reads "Layer 3a", a layer that exists on main.

## Source issues

- **Gap** in kos21 at Theorem 1.1, p. 1 (proof in §4, p. 6): the source says the localized compactly supported cohomology with `ℤ_ℓ` coefficients vanishes, but argues only with irreducible subquotients of the mod-`ℓ` cohomology; it should be stated mod `ℓ`, or the integral passage supplied; affects nothing.
- **Error** in kos21 at §4, p. 6: the source says the shift and half twist in the Hecke description of local Shimura cohomology are `d = dim r_μ`; it should be `⟨2ρ, μ⟩`, which is `1` and not `2` for `GL₂` with `μ = (1, 0)`; affects nothing.
- **Misprint** in kos21 at Lemma 8.3, p. 13: the source says the pushforward along a closed immersion admits `Ri^!` as a left adjoint; it should be a right adjoint; affects nothing.
- **Misprint** in csnc at Proposition 2.1.2, p. 12: the source says the product in the Hasse principle runs over the places of `F`; it should be the places of `ℚ`; affects nothing.
- **Misprint** in cn23 at the proof of Theorem 2.1.28, p. 25: the source says the hypotheses are removed by Koshikawa's Theorem 1.4, the anisotropic case; it should be Theorem 1.3, the quasi-split case; affects nothing.
- **Misprint** in cs17 at Proposition 3.5.7(1), p. 689: the source says the Newton map on the flag variety is lower semicontinuous; it should be upper semicontinuous for the order of its p. 677, as its Corollary 3.5.9 has the upper unions closed; affects a stated result.

## For the human reviewers

- none
