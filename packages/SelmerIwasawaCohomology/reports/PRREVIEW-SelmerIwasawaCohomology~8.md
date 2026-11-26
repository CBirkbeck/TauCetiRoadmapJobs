# Review of SelmerIwasawaCohomology (pull request #3187 at 494ecd3)

**Verdict:** accepted

**Summary.** A review of the change against `main`: 392 changed lines since `94e80af`. I checked the five new sections (§§2.22a, 2.23a, 2A.6–2A.8) and the edited overview, dependency, scope and contract lines. Every new statement, proof step and Check was recomputed. Every Kings–Loeffler–Zerbes and Nekovář locator was read in the open texts, and every supplier citation was resolved on `main`, apart from one ArithmeticGaloisDuality statement that exists only at the head of #3184, the revision named in the description. No finding: the mathematics, the locators and the supplier order hold. There are two small corrections (the duality step of §2.23a does not name its supplier, and two sentences of the description overstate or understate the head) and one format note. Nothing is left for a human to decide.

## C01 — The duality step of §2.23a cites Nekovář's global duality theorem directly, not the supplier section that owns it

The identification of `H²(RΓ_f(M; L))` with the dual of `Sel_{L^⊥}(M^∨(1))` is proved by "Nekovář's duality theorem" (proof sketch of §2.23a, line 887). In Tau Ceti that theorem belongs to ArithmeticGaloisDuality §D7.7.4 (*Duality for a global mapping fibre with local conditions*, on `main`, cited to Nekovář Theorem 6.3.4), which takes its orthogonality data from §D7.7.3. The *Needs:* line of §2.23a (line 896) names §§R02.4.2, R02.4.3, D7.7.1 and D7.4, but neither §D7.7.3 nor §D7.7.4. The layer's Dependencies cover §§D7.7.1–D7.7.6, so the input has an owner, but the item does not name it, and an implementer working from §2.23a's *Needs:* line is sent to the source instead. Adding ArithmeticGaloisDuality §§D7.7.3–D7.7.4 to that line repairs this. The description says that §D7.7.3 does not state that its cup product is the truncated one, and the step here uses Nekovář's truncated product `τ_{≥2}` with zero homotopy (Nekovář 6.2.1.2 and 6.2.1.5, p. 138). If that is the obstacle, one sentence under *From ArithmeticGaloisDuality* saying that this step needs the truncated product would state the contract.

## C02 — Two sentences of the description do not match the head

The description says that §2A.6 "states exactly when a termwise tensor product of these complexes is the derived one". The head (line 1305) gives two sufficient conditions, (α) and (β), and a Check that the comparison can fail. It gives no characterisation, and none holds in that form. For example, over `R = k[x]/(x²)` the complex `⊕_{n≥0} R[−n]` is a direct sum of K-flat complexes and so computes `k ⊗^L_R −` termwise, yet `k` has infinite flat dimension and `H^n` of its reduction is `k` in every degree `n ≥ 0`, so (α) and (β) both fail. "It gives two conditions under which the termwise tensor product is the derived one, with a Check that it is not in general" would be accurate. The "Depends on" line says the §D7.3 statement is cited by "§2A.6 and §2A.7". §2A.8 cites it as well (its *Needs:* line, line 1560), so it should read "§§2A.6–2A.8".

## N01 — §2A.7 carries no locator and does not say that it is not taken from a source

§2A.6 cites Kings–Loeffler–Zerbes Remark 11.2.5, and §2A.8 says that its comparisons are not stated in that paper (line 1559). §2A.7 has neither, so a reader cannot tell whether its statements come from the literature. One clause would settle it, either a locator or a sentence saying that the statements are not in the sources cited here.

## Verified sound

| Statement | Instances tried | Values computed | Result | Change |
|---|---|---|---|---|
| §2.22a: `U(L)` is simple with classical condition `L` | `L = 0`, `L = H¹`; finite place, `T = 𝔽_p` | `H⁰(U(L)) = Z⁰ = H⁰(C_v)`; `H¹ = Z¹_L/B¹ = L`; `H^{≥2} = 0` | holds | none |
| §2.22a: zigzag `U ← τ_{≤1}U → U(L)` | unramified inflation for `𝔽_p`; negative control `U(L) ⊕ N[−2]` | zigzag bijective on `H⁰` and `H¹`; with `N[−2]` the Selmer complex is `RΓ_f(U(L)) ⊕ N[−2]` | holds; the source's printed clause fails | Source issue |
| §2.22a: `Cone(U(L) ⊆ U(L′)) ≃ (L′/L)[−1]` | `L = 0`, `L′ = H¹(ℚ_p, 𝔽_p)` | cokernel `Z¹_{L′}/Z¹_L ≅ 𝔽_p²` in degree 1 only | holds | none |
| §2.22a: `H^{<0} = 0`, `H⁰ = H⁰(G_{F,S},T)`, `H¹ = Sel_L` | `ℚ`, `S = {p,∞}`, `𝔽_p`, classical strict | `H⁰ = 𝔽_p`; `H¹ = 0` (`ψ̄` ramified at `p`); the §2.22 strict ordinary fibre has `H¹ = 𝔽_p` | holds | none |
| §2.22a: independence of the diagram | `ℚ`, `{2,∞}`, `𝔽₂`, strict, ordinary against modified | modified `U(0)` has `H^j = Ĥ^j = 𝔽₂` for `j ≤ 0`; the cones agree in degrees ≥ 1; Selmer `H^{<0} = 0` in both | holds | none |
| §2.22a Check 3: transport breaks simplicity | real place, `p = 2`, `𝔽₂` | `H^{−1}(i)`: `0 → Ĥ^{−1} = 𝔽₂`; `U_v^−` has `H^j = 𝔽₂` for `j ≤ −1`; `H^i(RΓ_f) = 𝔽₂` for `i ≤ −1` | holds | none |
| §2.22a under `(P)`: simple iff quasi-isomorphism | real place, `p = 3`, `T = ℤ_3` | `H^{≥1}(ℝ, ℤ_3) = 0`; ordinary `U(0) ≃ ℤ_3[0]`; modified acyclic (`ℤ_3/2ℤ_3 = 0`) | holds | none |
| §2.22a Check 1: unramified condition | `T = ℤ` discrete; `T = ℤ_p` | `H²(Ẑ, ℤ) ≅ H¹(Ẑ, ℚ/ℤ) = ℚ/ℤ ≠ 0`; `H²(Ẑ, ℤ_p) = lim H²(Ẑ, ℤ/p^n) = 0` | holds | none |
| §2.22a Check 4 | `μ_p` at a finite place | `H²(K_v, μ_p) = Br(K_v)[p] = ℤ/p`, `H³ = 0`, so `C_v/τ_{≤1}C_v ≃ (ℤ/p)[−2]` | holds | none |
| §2.23a: `H²` sequence and change of conditions | `ℚ`, `{p,∞}`, `𝔽_p`, `L = 0`, `L′` relaxed | `h¹(G_S) = 1`, `h¹(ℚ_p) = 2`, `h²(G_S) = 0` (Euler characteristic `1 − 1`); `H²(RΓ_f(L)) = 𝔽_p` | holds | none |
| §2.23a: duality, odd `p`, finite `M` | same data, `μ_p` side | `Sel_{L^⊥}(μ_p) = H¹(G_S, μ_p) = ⟨p⟩ ≅ 𝔽_p`; `Sel_{L′^⊥} = 0` since `v_p(p) = 1`; matches `H² = 𝔽_p`, `0` | holds | C01 (*Needs:* line) |
| §2.23a Check 2 | `ℚ_p`, `M = 𝔽_p` | `H¹_ur` is a line in `𝔽_p²`; its annihilator is a line; `μ_p^{I} = 1`, so `H¹_ur(μ_p) = 0` | holds | none |
| §2A.6 (β) proof | `X` flat, exact above `e` | splicing `0 → Z^m → X^m → Z^{m+1} → 0` gives `H^n(X ⊗ B′) ≅ Tor₁(Z^{n+2}, B′)` for `n > e` | holds | none |
| §2A.6 Check 1 | `R = k[x]/(x²)`, `X = (R →x R →x ⋯)` | `X ≃ k[0]`; `X ⊗ k` has `H^n = k` for `n ≥ 0`; `k ⊗^L k` has `H^{−n} = k` | holds | none |
| §2A.6 (α)/(β) not necessary (description) | `⊕_{n≥0} R[−n]` over `k[x]/(x²)`, `B = k` | K-flat, so termwise equals derived; `H^n(X ⊗ k) = k` for all `n`; `fd(k) = ∞` | head correct; description overclaims | C02 |
| §2A.6 (d) Check 2 | `(ℓ,p) = (2,3), (5,3), (7,5), (3,5)` | `φσφ⁻¹ = σ^ℓ` in all four; `𝕋^I = ℤ_p e₁`, `(𝕋/p)^I = 𝔽_p²`; reduced `H⁰` misses `e₂` | holds | none |
| §2A.6 item 4, Check 4 | `ℤ_p` trivial, `L = pℤ_p[z]` | `Z¹_L = ℤ_p·pz`; `pz ≠ 0` in `Z¹_L/p`, `= 0` in `C¹/p`; `H¹/L ⊇ ℤ/p` | holds | none |
| §2A.6 (b): conditions cut out in degree one | `U¹ = ker(c ↦ c(g_j) − s_j c(h_j))` | coboundaries vanish since `g_j − 1 = s_j(h_j − 1)`; `H²(U)` is an extension of `H²(C)` by `C¹/(U¹ + Z¹)` | holds | none |
| §2A.6 (c), (d): flatness | `𝕋⁺` a direct summand; `𝕋^{I}` a direct summand | quotient `C(G_v, 𝕋/𝕋⁺)` flat (`𝕋/𝕋⁺` free); inflation injective after `⊗B`, so `Tor₁ = 0` | holds | none |
| §2A.7 items 1–3, Check 1 | `C = [O →λ O]` in degrees 1, 2 | `H¹(C ⊗ B) = B[λ] = Hom(O/λ, B)`; `Q = O/λ`; `H¹(C) ⊗ B = 0` | holds | none |
| §2A.7 item 5 | ramification `e = 1,2,3`; `n = 1,2,4` | length `(O′/π^n)[π^e] = min(n,e) =` length `O′/(π^n, λ)` in all 9 cases | holds | none |
| §2A.7 item 5: is `x` local? | `x : R → O′/a` | a unit `x(m)` has finite order `N`, so `1 − m^N` (a unit) maps to `0`; hence `x(𝔪)` is nilpotent, `O′/a` has finite length | holds | none |
| §2A.7 Check 2 | `[O →λ O]` in degrees 0, 1 | `H⁰(C ⊗ k) = k`; `O/λ → O/λ²` (`1 ↦ λ`) is injective and becomes `0` on `B/λB` | holds | none |
| §2A.7 item 7 | finite free `P` in `[1, b]` | `H¹(P ⊗ B) = Hom(coker((P²)^* → (P¹)^*), B)`; `H^{−1}(P^*) =` the same cokernel | holds | none |
| §2A.8 item 1 | snake lemma on `0 → L → H¹ → H¹/L → 0` | `(H¹/L)[f]` is an extension of `(L ∩ fH¹)/fL` by `H¹[f]/L[f]`, as is `H⁰` of the cone | holds | none |
| §2A.8 Check 1 | `p = 3,5,7`; `L_p = ℤ_p(ψ| + pχ)` | `Sel_L = 0`; elementary divisors `(1,p)`, so `H² = ℤ/p`; `Sel_{L̄} = 𝔽_p ψ̄`; `0 → 0 → 𝔽_p → 𝔽_p → 0` | holds | none |
| §2A.8 Check 2 | `L_p = pℤ_p χ` | `H¹/L = ℤ_p ⊕ ℤ/p`; `H² = ℤ/p`; `H⁰(G_S, 𝔽_p) → 𝔽_p` is zero (the constant lifts), so `H¹ = 𝔽_p` both ways | holds | none |
| §2A.8: `Tor` conditions for the edge map | `a ≥ 0`, `H^b = 0` for `b ≥ 4` | degree-one terms `(1,2), (2,3)`; differentials into `E^{0,1}` from `(2,2), (3,3)`; the list is complete | holds | none |
| §2A.8 general: `Q_v` in degrees `≤ 0` | `R′ ⊗^L U(L)` | `H¹ = R′ ⊗ L ↠ L′`; `H^{≥2}` of the source is `0`, so `H^{≥1}(Q_v) = 0` | holds | none |
| §§2.21, 3.9 against §2A.8 (seeded sample) | Nekovář 6.1.1–6.1.3, 5.7.2, 8.10 | printed pp. 135–136, 131–132, 249; `E_v = Cone(U ⊗^L R → U_R)` has the same orientation as the §2A.8 triangle | consistent | none |
| Overview layer guide | the clauses on Layers 2 and 2A against §§2.22a–2A.8 | each clause matches a stated result; "residual invariants vanish" is the hypothesis `H⁰(C_f(k)) = 0` | holds | none |

- Source locators checked in the open texts: 9 in `KingsLoefflerZerbes2017` (arXiv v6). These are Definition 11.2.3 at line 3306, the paragraph at 3311, the triangles (11.2.2a)–(11.2.2b) and the base-change paragraph at 3332–3350, Remark 11.2.5 at 3351, Theorem 11.2.7 at 3363, Propositions 11.2.8–11.2.9 at 3370–3390, and Remark 12.1.4 at 3721. 8 in `Nekovar2006` (Numdam). These are §6.1.4 at line 5282, §§6.2.1.2–6.2.2 at 5322–5353, 6.2.5(A) at 5376, 6.2.7 at 5398, 6.3.4 at 5489, and, for §§2.21 and 3.9, §§6.1.1–6.1.2 at 5238, 5.7.2 at 5139 and 8.10 at 9484. All the printed pages match (PDF page − 9).
- Cross-roadmap citations resolved on `main`: ArithmeticGaloisDuality §R02.1.2 (*Tate's inverse-limit theorem*), §R02.1.3 (*Rationalisation*), §R02.3.1 (*Finiteness of `H¹`*), §R02.4.2 (*The defined local Tate pairing*), §R02.4.3, §D7.1 (*Derived tensor…*, *Residual criterion…*), §D7.3 (*Cohomological finiteness…*), §D7.4, §§D7.7.1, D7.7.3, D7.7.4; DerivedModuleAlgebra §0.2 (K-flat models, bounded-above flat complexes, the extension–restriction adjunction); ProfiniteCohomology Layer 11 (`cd_p Ẑ = 1`). At the head of #3184 (named in the description): §D7.3 *Cochain tensor comparison for profinite groups*, with the `A⟦T⟧` Check that §2A.6 item 1 cites.
- Record comparison with the merge base: no layer or item removed, retitled or renumbered; the new ids 2.22a, 2.23a and 2A.6–2A.8 reuse no existing id; all 10 deleted lines are replaced by extended versions of the same sentences.
- Consumers: EulerSystemsAndKolyvaginSystems at #3188 consumes §§2.22a, 2.23a and 2A.8 under the statements given here, and lies later in the merge order (line 113 against 93).
- Automatic checks: the gate passes every counter at 0. Dependency check: `depcheck: 73 roadmaps, 935 edges, 0 problem(s)`. `lake env lean` on `Suggested.lean` exits 0 with six `sorry` warnings only. `Suggested.lean` is unchanged.
- Signatures: the lead that `complexHodgeGammaFactors` drops `[FiniteDimensional ℂ W]` was checked. Its body uses only the finiteness of Hodge numbers, and both theorems that use it carry the binder (`Suggested.lean` lines 148, 196, 202). Nothing changed.
- Computations: plain-integer probes of the tame relation (4 pairs), the elementary divisors in the §2A.8 Checks (`p = 3, 5, 7`) and the lengths in §2A.7 item 5 (9 cases), all agreeing with the text.
- Seeded targets outside the change (§§0.11, 0.13, 2.8, 2.12, 2.12a, 2.18, 2.20, 3.7, 3.8, 4.10, 4.15, 4.16, 4.25) are untouched and unaffected, and were not reopened. §§2.21 and 3.9 were read for consistency with the change, and their Nekovář locators were checked.

Overlap check: read ArithmeticGaloisDuality (main and the head of #3184), EulerSystemsAndKolyvaginSystems (main and the head of #3188), NoncommutativeAndEquivariantIwasawa (main, §F.4) and ModularIwasawaMainConjectures (#1499). Nothing shared: the derived orthogonality and global duality are owned by ArithmeticGaloisDuality §§D7.7.3–D7.7.4, termwise cochain tensor comparison by its §D7.3, the lattice Selmer complex by NoncommutativeAndEquivariantIwasawa §F.4, and cartesian conditions by EulerSystemsAndKolyvaginSystems §0.4. Simple conditions, flat-quotient conditions, the co-representing module and the base change of simple conditions are owned here.

Source independence: changed passages only. 14 passages compared with 2 sources (`KingsLoefflerZerbes2017`, `Nekovar2006`): 9 at verified locators plus the proofs of §§2.22a, 2.23a, 2A.6 (d) and 2A.8 and the Checks of §2.23a. None is shared beyond mathematically forced phrases, the longest run being 3 words ("up to quasi-isomorphism"). The largest share is `KingsLoefflerZerbes2017`, 10 of 16 locators in the changed passages. Contents were not compared: no layer was added, removed or reordered.

Research link: §§2.22a–2A.8 place the classical Selmer structures of Mazur and Rubin inside Nekovář's Selmer complexes (2006), as Kings, Loeffler and Zerbes (2017, §11.2) use them for Euler-system bounds for Rankin–Eisenstein classes. The roadmap's headline is the Selmer-complex half of Nekovář's parity theorem. This rests on the README overview and `KingsLoefflerZerbes2017` §11.2.

## Not verifiable

- The published Kings–Loeffler–Zerbes (Cambridge J. Math. 5, 2017) was not opened. The README states that its locators use the arXiv v6 pagination, and those were checked.

## Source issues

- **Error** in KingsLoefflerZerbes2017 at Definition 11.2.3 and the paragraph after it, pp. 54–55 (arXiv v6): the source says a condition is simple when bijective in degree 0 and zero on `H²`, and that it is then determined by its `H¹`-image; it should be: require bijectivity in degrees `≤ 0` and `H^j(U⁺) = 0` for `j ≥ 2` (adding `N[−2]` with zero map changes Selmer `H²`); affects a stated result.

## For the human reviewers

- none
