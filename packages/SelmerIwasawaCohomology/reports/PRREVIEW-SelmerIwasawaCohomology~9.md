# Review of SelmerIwasawaCohomology (pull request #3187 at 494ecd3)

**Verdict:** accepted

**Summary.** A review of the change against `main`: 392 changed lines since `94e80af`. I recomputed every statement, proof step and Check of the five new sections (§§2.22a, 2.23a, 2A.6–2A.8) and of the edited overview, dependency, scope and contract lines, read every Kings–Loeffler–Zerbes and Nekovář locator in the open texts, and resolved every supplier citation. No finding: the mathematics, the locators and the supplier order hold, so the folder is accepted. There are two small corrections (the duality step of §2.23a does not name the supplier section that owns its main input, and three sentences of the description do not match the head) and two format notes; the previous review had no finding to repair, and its three remarks still stand because the head is the same. One point of merge order is left for the human reviewers.

## C01 — The duality step of §2.23a rests on Nekovář's global duality theorem but does not name the supplier section that owns it, nor say that it needs the truncated cup product

The isomorphism of `H²(RΓ_f(M; L))` with the dual of `Sel_{L^⊥}(M^∨(1))` is obtained from "Nekovář's duality theorem" (proof sketch of §2.23a, line 887). In Tau Ceti that theorem is ArithmeticGaloisDuality §D7.7.4 (Duality for a global mapping fibre with local conditions), with its orthogonality data from §D7.7.3; the *Needs:* line of §2.23a (line 896) lists §§R02.4.2, R02.4.3, D7.7.1 and D7.4 but neither of these, so an implementer is sent to the source and not to the section that will hold the theorem. The layer's Dependencies do cover §§D7.7.1–D7.7.6, which is why this does not block.

The step also uses something §D7.7.3 does not say. That section asks for "a chosen nullhomotopy of their cup product". For the untruncated product no nullhomotopy exists for simple conditions in general: for `M = 𝔽_p` with trivial action at a finite place containing `μ_p`, the degree-zero component `U⁰ ⊗ U⁰ = M ⊗ M^∨(1) → C⁰(μ_{p^∞})` is the nonzero evaluation map, while the differential on `(U ⊗ U)⁰` is zero and there are no cochains in degree `−1`. The argument of §2.23a is correct because it uses the product followed by `τ_{≥2}` (Nekovář 6.2.1.2 and 6.2.1.5, p. 138), which is zero as the text computes. Adding ArithmeticGaloisDuality §§D7.7.3–D7.7.4 to the *Needs:* line, with one sentence under *From ArithmeticGaloisDuality* saying that this step uses the cup product truncated in degrees `≥ 2`, would state the contract.

## C02 — Three sentences of the description do not match the head

"It states exactly when a termwise tensor product of these complexes is the derived one": §2A.6 item 2 (line 1305) gives two sufficient conditions, (α) and (β), and no characterisation, and none holds in that form: over `R = k[x]/(x²)` the complex `⊕_{n≥0} R[−n]` with zero differential is K-flat, so its termwise reduction is the derived one, yet `k` has no finite flat resolution and `H^n` of the reduction is `k` for every `n ≥ 0`, so (α) and (β) both fail. "It gives two conditions under which the termwise tensor product is the derived one, with a Check that it is not in general" would be accurate.

The "Depends on" line says the §D7.3 statement is cited by "§2A.6 and §2A.7"; §2A.8 cites it too (its proof sketch and *Needs:* line, line 1566), so it should read "§§2A.6–2A.8". And "Left out on purpose: … the statement that the dual classical structure is the derived orthogonal complement" is true only outside the case §2.23a treats: for finite `M` and odd `p` its proof sketch shows exactly that `U(L_v)` and `U(L_v^⊥)` are orthogonal with zero homotopy and that the adjoint is a quasi-isomorphism. "for lattice coefficients or `p = 2`" applied to both items would be right.

## N01 — §2A.7 carries no locator and does not say that it is not taken from a source

§2A.6 cites Kings–Loeffler–Zerbes Remark 11.2.5 and §2A.8 says that its comparisons are not stated in that paper (line 1559); §2A.7 has neither, so a reader cannot tell whether its statements come from the literature. One clause would settle it: a locator, or a sentence that the statements are not in the sources cited here.

## N02 — "Dual Selmer module" names two different objects

In §2.13 (line 633) the dual Selmer module is the Selmer module of the dual structure, and §2.23a calls `Sel_{L^⊥}(M^∨(1))` a dual Selmer group in the same sense. The title of §2A.7 uses "the dual Selmer module" for the co-representing module `Q`, which for finite `R` is the Pontryagin dual `Sel(R^∨)^∨` of a Selmer group of the same structure; the body never uses or defines the term. "The module co-representing Selmer groups", the phrase the overview and the scope paragraph already use, would avoid the clash; the heading can keep its anchor.

## Verified sound

| Statement | Instances tried | Values computed | Result | Change |
|---|---|---|---|---|
| §2.22a: `U(L)` simple with classical condition `L` | `L = 0`, `L = H¹`, general `L` | `B¹ ⊆ Z¹_L`, so `H^{≤0}(U(L)) = H^{≤0}(C_v)`, `H¹ = Z¹_L/B¹ = L`, `H^{≥2} = 0` | holds | none |
| §2.22a: zigzag `U ← τ_{≤1}U → U(L)`; negative control | `U(L) ⊕ N[−2]`, zero map on `N` | zigzag bijective in degrees `≤ 1`; control has `H²(i) = 0`, `H²(U) = N`, fibre `RΓ_f(U(L)) ⊕ N[−2]` | holds; printed clause of the source fails | Source issue |
| §2.22a: cones of `U(L) ⊆ U(L′)`, `0 → U(0)`, `τ_{≤1}C → C` | degreewise cokernels | `Z¹_{L′}/Z¹_L ≅ L′/L` in degree 1; `U(0) ≃ τ_{≤0}C_v`; `τ_{≥2}C_v` | holds | none |
| §2.22a: `H^{<0} = 0`, `H⁰ = H⁰(G_{F,S},T)`, `H¹ = Sel_L` | long exact sequence of `RΓ_f → C(G_{F,S},T) → ⊕U_v^−` | `H^{≤0}(U^−) = 0`, `H¹(U^−) = H¹/L`, `H^{≥2}(U^−) = H^{≥2}(C_v)` | holds | none |
| §2.22a Check: classical strict, `ℚ`, `{p,∞}`, `𝔽_p` | ordinary strict fibre of §2.22 | strict kernel `0` (`ψ̄` ramified at `p`); `k → k ⊕ k` has cokernel `k`, so fibre `H¹ = k` | holds, agrees with the Check of §2.22 | none |
| §2.22a Checks at a real place, `p = 2`, `𝔽₂` | transported `U(L)`; `{2,∞}` strict | `Ĥ⁰ = 𝔽₂` (norm is `0`), `Ĥ^{−1} = 𝔽₂`; `H^j(U^−) = 𝔽₂` for `j ≤ −1`, so `H^i(RΓ_f) = 𝔽₂`, `i ≤ −1`; classical strict: none | holds, agrees with §2.21 Checks | none |
| §2.22a under `(P)` | real place `p` odd; complex place | `2` invertible kills `H^{≥1}` and Tate groups; ordinary `U(0) ≃ T^{G_v}[0]`, modified acyclic; transport simple iff `T^{G_v} = 0` | holds | none |
| §2.22a Check: unramified condition | `T = ℤ` discrete; `T = ℤ_p`; `μ_p` relaxed | `H²(Ẑ,ℤ) ≅ H¹(Ẑ,ℚ/ℤ) = ℚ/ℤ`; `H²(Ẑ,ℤ_p) = lim H²(Ẑ,ℤ/p^n) = 0`; `H²(K_v,μ_p) = ℤ/p` | holds | none |
| §2.23a: `H²` sequence, change of conditions | `ℚ`, `{p,∞}`, `𝔽_p`, `L = 0 ⊆ L′` relaxed | `h¹(G_S) = 1`, `h²(G_S) = 0` (Euler characteristic `1 − 1`), `h¹(ℚ_p) = 2`; `0 → 0 → 𝔽_p → 𝔽_p² → H² → 0`, `H² ≅ 𝔽_p` | holds | none |
| §2.23a: duality, `p` odd, finite `M` | same data on the `μ_p` side; adjoint degrees | `H¹(G_S,μ_p) = ⟨p⟩ ≅ 𝔽_p`; strict `= 0` (`p` not a `p`-th power in `ℚ_p`); adjoint: `H⁰ ↔ H²(M^∨(1))^∨`, `H¹ ↔ (H¹/L^⊥)^∨ = L` | holds | C01 |
| §2.23a: truncated product is zero; untruncated is not null-homotopic | `M = 𝔽_p` trivial, `μ_p ⊆ K_v` | degree 2: cup of `L` and `L^⊥` has invariant `0`, a coboundary, zero in `C²/B²`; degree 0 untruncated: evaluation `≠ 0`, `d = 0` | text correct; supplier wording needs the truncation | C01 |
| §2.23a Check 2 | `ℚ_p`, `p` odd, `𝔽_p` | `H¹_ur` a line in `𝔽_p²`; `ℚ_p^×/p ≅ 𝔽_p²`; `μ_p^{I} = 1` as `[ℚ_p(μ_p):ℚ_p] = p − 1 ≥ 2` | holds | none |
| §2A.6 item 1 | `0 → U^n → C^n → (C/U)^n → 0` tensored with `B` | `Tor₁((C/U)^n, B) = 0`: injective, exact in `B`, `U^n` flat | holds | none |
| §2A.6 (β) | `X` flat, `H^n(X ⊗ B′) = 0` for `n > e` | `H^n(X ⊗ B′) ≅ Tor₁(Z^{n+2}, B′)` for `n > e`; `Z^m` flat for `m ≥ e + 3`, then for `m ≥ e` | holds | none |
| §2A.6 Check 1; (α), (β) not necessary | `R = k[x]/(x²)`: `(R →x R → ⋯)`; `⊕ R[−n]` | first: `H^n(X ⊗ k) = k` (`n ≥ 0`) against `Tor_n(k,k) = k` in degree `−n`; second: K-flat, both conditions fail | head correct; description overclaims | C02 |
| §2A.6 (b) | `U^i = C^i` (`i ≠ 1`), `B¹ ⊆ U¹`; evaluation map | `H¹(U) = (U¹ ∩ Z¹)/B¹`; `B²/d(U¹) = C¹/(U¹ + Z¹)`; `(g_j − 1)x − s_j(h_j − 1)x = 0` on coboundaries | holds | none |
| §2A.6 (d) and its Check | `(ℓ,p) = (2,3), (5,3), (7,5), (3,5), (11,7)` | `φσφ⁻¹ = σ^ℓ` in all five; `𝕋^I = ℤ_p e₁`, `(𝕋/p)^I = 𝔽_p²`; `φe₂ = e₂` not in `(𝔽_p e₁)^{Frob}` | holds | none |
| §2A.6 item 4 and Check 4 | `ℤ_p` trivial, `L = pℤ_p[z]` | `Z¹_L = ℤ_p·pz` (`B¹ = 0`); `pz ≠ 0` in `Z¹_L/p`, `= 0` in `C¹/p`; `(H¹/L)[p] ≠ 0` | holds | none |
| §2A.7 items 1–5 | `C = [O →λ O]` in degrees 1, 2; `e = 1,2,3`, `n = 1,2,4` | `H¹(C ⊗ B) = B[λ] = Hom(O/λ, B)`, `H¹(C) ⊗ B = 0`; both lengths `min(n,e)` in 9 cases | holds | N01, N02 |
| §2A.7 item 3, finite `R` | `G(N) = Sel(N^∨)^∨` | right exact, so `G(N) = G(R) ⊗ N`; `Sel(B) = (G(R) ⊗ B^∨)^∨ = Hom(G(R), B)` | holds | none |
| §2A.7 Check 2 | same complex in degrees 0, 1 | `H⁰(C ⊗ k) = k`; `O/λ → O/λ²`, `1 ↦ λ`, injective, zero on `B/λB` | holds | none |
| §2A.7 item 7 | finite free `P` in `[1,b]` | `ker(P¹ ⊗ B → P² ⊗ B) = Hom(coker((P²)^* → (P¹)^*), B)`; `H^{−1}(P^*)` is that cokernel | holds | none |
| §2A.8 item 1 | long exact sequence and snake lemma | `H⁰(Q_v)`: extension of `(L ∩ fH¹)/fL` by `H¹[f]/L[f]`, as is `(H¹/L)[f]`; `H^{≠0}(Q_v) = 0`; `Z¹_L/f = Z¹_{L̄}` when torsion-free | holds | none |
| §2A.8 Check 1 | `p = 3, 5, 7`; `L_p = ℤ_p(ψ| + pχ)` | `H¹/L_p ≅ ℤ_p` by `(a,b) ↦ b − pa`, `ψ ↦ −p`: `H² = ℤ/p`; `Sel_L = 0`; `Sel_{L̄} = 𝔽_p ψ̄`; `0 → 0 → 𝔽_p → 𝔽_p → 0` | holds | none |
| §2A.8 Check 2 | `L_p = pℤ_p χ` | `(H¹/L)[p] = 𝔽_p`; `H² = ℤ/p`; `H⁰(G_S,𝔽_p) → 𝔽_p` is zero (constants lift); `H¹(𝔽_p ⊗^L C_f) = 𝔽_p` both ways | holds | none |
| §2A.8 general: `Q_v`, `Tor` conditions | `H^b(C_f) ≠ 0` only for `0 ≤ b ≤ 3` | `H¹`: `R′ ⊗ L ↠ L′`, so `H^{≥1}(Q_v) = 0`; total degree 1: `(1,2), (2,3)`; into `E^{0,1}`: `(2,2), (3,3)` | holds; the list is complete | none |
| §§2.21, 2.22 (seeded sample, affected) | Nekovář 6.1.1–6.1.4 against the new §2.22a | printed pp. 135–137; "bijective `H⁰`, injective `H¹` give the classical kernel" is the case `J = 0` used in §2.22a | consistent | none |
| §3.9 against §2A.8 | orientation of the correction cone | `E_v = Cone(U ⊗^L R → U_R)`, the same arrow as `R′ ⊗^L U(L_v) → U(L′_v)` | consistent | none |

- Source locators read in the open texts: 7 in `KingsLoefflerZerbes2017` (arXiv v6): Definition 11.2.3 (line 3306, p. 54), the paragraph after it (3311, p. 55), the base-change paragraph after (11.2.2a)–(11.2.2b) (3346), Remark 11.2.5 (3351), Theorem 11.2.7 (3363, p. 55), Propositions 11.2.8–11.2.9 (3370–3390, p. 56), Remark 12.1.4 (3721, p. 62). 5 in `Nekovar2006` (Numdam): §6.1.4 (line 5282, pp. 136–137), §§6.2.1.2–6.2.2 (5322–5353, p. 138), 6.2.5 (A) (5376, p. 139), 6.2.7 (5398, p. 140), Theorem 6.3.4 (5489, p. 143); all printed pages are PDF page − 9.
- Cross-roadmap citations resolved on `main`: ArithmeticGaloisDuality §R02.1.2, §R02.1.3 (*Rationalisation of lattice cohomology*), §R02.3.1 (*Finiteness of `H¹(G_{K,S}, M)`*), §R02.4.2 (*The defined local Tate pairing*), §R02.4.3, §D7.1 (*Residual criterion for perfect amplitude*), §D7.3 (*Cohomological finiteness and perfect amplitude*, which gives vanishing above degree 2 for finite-type coefficients), §D7.4, §§D7.7.1, D7.7.3, D7.7.4; DerivedModuleAlgebra §0.2 (K-flat models, bounded-above flat complexes); ProfiniteCohomology Layer 11. At the head of #3184 only: §D7.3 *Cochain tensor comparison for profinite groups*, read there; it states the termwise isomorphism, flatness for free coefficients and the Check on a coefficient ring that is not finite.
- Record comparison with the merge base: no layer or item removed, retitled or renumbered; the ids 2.22a, 2.23a, 2A.6–2A.8 are new; each of the 10 deleted lines is replaced by the same sentence extended.
- Consumers: EulerSystemsAndKolyvaginSystems at #3188 cites §§2.22a and 2A.8 with the statements given here.
- Dependency check: `depcheck: 94 roadmaps, 1063 edges, 0 problem(s)`; no UPWARD or CYCLE line. Nothing is changed outside the folder.
- Automatic checks: all pass at this head. `lake env lean` on `Suggested.lean` gives six `sorry` warnings and nothing else; the file is unchanged by the pull request, and its docstring already names the Layer 2–2A statements as not statable (no arithmetic Selmer complexes at the pins), which covers the new sections.
- Previous review: no finding to repair; its remarks C01, C02 and N01 were rechecked and stand (same head).
- Seeded targets outside the change (§§0.11, 2.1, 2.8a, 2.15, 3.8, 3.13, 3.18, 4.8, 4.10, 4.11, 4.15, 4.25) are untouched and unaffected, and were not reopened.

Overlap check: read ArithmeticGaloisDuality (main and the head of #3184), EulerSystemsAndKolyvaginSystems (main and the head of #3188), NoncommutativeAndEquivariantIwasawa (main) and ModularIwasawaMainConjectures (#1499); nothing shared. Derived orthogonality and global mapping-fibre duality belong to ArithmeticGaloisDuality §§D7.7.3–D7.7.4, the termwise cochain comparison to its §D7.3, the lattice Selmer complex to NoncommutativeAndEquivariantIwasawa §F.4, cartesian conditions to EulerSystemsAndKolyvaginSystems Layer 0.4; simple conditions, flat-quotient conditions, the co-representing module and the base change of simple conditions occur in no other roadmap and are owned here.

Source independence: changed passages only; 17 passages compared with 2 sources (`KingsLoefflerZerbes2017`, `Nekovar2006`): 12 at verified locators and 5 further (the definition of simple, the proof sketches of §§2.22a and 2.23a, §2A.6 (d), the general statement of §2A.8), none shared beyond forced phrases of at most 3 words; largest share `KingsLoefflerZerbes2017`, 10 of 16 locators in the changed passages; contents not compared, since no layer is added, removed or reordered.

Research link: the new sections place the classical Selmer structures of Mazur and Rubin (2013) inside Nekovář's Selmer complexes (2006), as Kings, Loeffler and Zerbes (2017, §11.2) do for their Euler-system bounds; the roadmap's own headlines include the Selmer-complex half of Nekovář's parity theorem. Rests on the README overview and `KingsLoefflerZerbes2017` §11.2.

## Not verifiable

- The published version of Kings–Loeffler–Zerbes (Cambridge J. Math. 5, 2017) was not opened; the README says its locators use the arXiv v6 pagination, and those were checked.

## Source issues

- **Error** in KingsLoefflerZerbes2017 at Definition 11.2.3, p. 54, and the paragraph after it, p. 55 (arXiv v6): the source says a condition is simple when its map is bijective in degree 0, injective in degree 1 and zero in degree 2, and is then determined by its degree-one image; it should be bijective in every degree at most 0 with no cohomology of the condition in degrees at least 2, since adding a module in degree 2 with zero map changes the Selmer complex; affects a stated result.

## For the human reviewers

- Five passages of §§2A.6–2A.8 cite ArithmeticGaloisDuality §D7.3 *Cochain tensor comparison for profinite groups*, which exists only at the head of #3184 (`TauCetiRoadmap/ArithmeticGaloisDuality/README.md` line 5001 there); the description names that order.
