# Review of SelmerIwasawaCohomology (pull request #3187 at c673f11)

**Verdict:** accepted

**Summary.** A review of the change against `main`: 516 changed lines since `94e80af`. Every statement, proof step and Check of the five added sections (§§2.22a, 2.23a, 2A.6, 2A.7, 2A.8) was recomputed, including the widened scope of §2.22a, the dual `D` without involution in §2A.7 and its general statements (a)–(e); every source locator of the changed passages was read in Kings–Loeffler–Zerbes and Nekovář; every cross-roadmap citation was resolved; the description was read against the head. No finding, no small correction and no format note: the folder is accepted. The three remarks of the previous review are repaired. Three facts about merge order and the library pin are left for the human reviewers.

## Previous findings

The previous report (at `8989684`) had no finding. Its other remarks:

- C01 (previous) — repaired: the description now reads "§§2A.6–2A.8 are not taken from a source, apart from the failure of the unramified condition to be stable under base change in §2A.6 (d), which is Kings–Loeffler–Zerbes, Remark 11.2.5".
- N01 (previous) — repaired: the proof sketch of §2A.7 opens "No source is cited for this section; each statement is proved here" (line 1521).
- N02 (previous) — repaired: the heading of §2A.7 is "The module co-representing Selmer groups in the lowest degree" (line 1427), and the title of the pull request uses the same phrase; "dual Selmer" now names only the Selmer group of the dual structure.

## Verified sound

| Statement | Instances tried | Values computed | Result | Change |
|---|---|---|---|---|
| §2.22a: `U(L)` simple; zigzag `U ← τ_{≤1}U → U(L)`; cone `(L′/L)[−1]` | `L = 0`, `L = H¹`, `L ⊆ L′` | `H^j(U(L)) = H^j(C_v)` for `j ≤ 0`, `H¹ = Z¹_L/B¹ = L`; cokernel `Z¹_{L′}/Z¹_L ≅ L′/L` | holds | none |
| §2.22a: `H^j(RΓ_f) = 0` (`j < 0`), `H⁰ = H⁰(G_{F,S}, T)`, `H¹ = Sel_L` | `ℚ`, `{p, ∞}`, `𝔽_p`, strict; `ℚ`, `{2, ∞}`, `𝔽₂`, modified | cone `U_v^−` has `H^j = 0` for `j ≤ 0`, `H¹ = H¹/L_v`; strict kernel `0`; ordinary strict fibre `k²/k = k`; `H⁰ = 𝔽₂` | holds; Checks agree | none |
| §2.22a, wider scope (finite free over complete local `R`) | residue characteristic `p` odd, real place; `p = 2`, complex place | `2 ∈ R^×`, so `H^j(G_v, T) = 0` for `j ≥ 1` and Tate groups vanish; `C_v^mod = 0` at complex places | archimedean clauses hold in both cases | none |
| §2.22a Check: transport at a real place, `p = 2`, `T = 𝔽₂` | `i ≤ −1`, `i = 0` | `H^j(U_v^−) = 𝔽₂` for `j ≤ −1`, `0` for `j = 0`; `H^i(RΓ_f) = 𝔽₂` for `i ≤ −1` | holds | none |
| §2.22a Checks: inflation; `U(L) ⊕ N[−2]`; strict and relaxed | `T = ℤ`; `μ_p`; `𝔽_p` | `H²(Ẑ, ℤ) = ℚ/ℤ`; fibre `RΓ_f(U(L)) ⊕ N[−2]`; `H²(K_v, μ_p) = ℤ/p`; `H⁰(0) = 0 ≠ 𝔽_p` | hold | none |
| §2.22a: families `(L_v)` and `TopSelmerStructure` | the structure at Tau Ceti `2a9233e5` | fields `coeffHom`, `localCondition`; `localization` is `R`-linear on `continuousCohomology 1`; `mem_selmerModule_toSelmerData_iff` | the sentence matches the declaration | none |
| §2.23a: `H²` sequence, five-term sequence | `ℚ`, `{p, ∞}`, `𝔽_p`, `L = 0 ⊆ L′` relaxed | `0 → 0 → 𝔽_p → 𝔽_p² → H² → 0`; `h²(G_{ℚ,S}, 𝔽_p) = 0` from `χ = 0`; `H²(RΓ_f(L)) = 𝔽_p` | holds | none |
| §2.23a: duality `H²(RΓ_f(M; L)) ≅ Sel_{L^⊥}(M^∨(1))^∨` | same data; `ℚ_p`, `𝔽_p`, unramified | `H¹(G_{ℚ,S}, μ_p) = ⟨p⟩`, order `p`; strict dual `0`; `H¹_ur(ℚ_p, μ_p) = 0`, annihilator a line | both sides order `p`; Check holds | none |
| §2A.6 item 2 (α), (β) | `k[x]/(x²)`, `X = (R →x R → ⋯)` | `H^n(X ⊗ k) = k` all `n ≥ 0`; `Tor_n(k, k) = k`; `H^n(X ⊗ B′) ≅ Tor₁(Z^{n+2}, B′)` for `n > e` | criterion holds; negative control holds | none |
| §2A.6 item 3 (b), (c), (d), item 4 | tame `ℤ_p²` example; `𝕋⁺ = 0`; `L = pℤ_p z` | `diag(ℓ,1)·τ·diag(ℓ,1)⁻¹ = τ^ℓ`; `𝕋^I = ℤ_p e₁`, `(𝕋/p)^I = 𝔽_p²`; `H²(U) = Z²/dU¹`; `pz ≠ 0` in `Z¹_L/p`, `0` in `C¹/p` | hold | none |
| §2A.7 (a)–(e) | `[O →λ O]` in degrees 1, 2 and 0, 1 | `F(B) = B[λ] = Hom(O/λ, B)`; degrees 0, 1: `B/λB`, `O/λ → O/λ²` goes to zero | co-representable in the first, not left exact in the second | none |
| §2A.7 (c): dual `D` without involution | `(ℤ/p²)[⟨γ⟩]`, map `γ − 1 − p`, `x : γ ↦ 1 + p` | `Q = R/(γ−1−p)`; `Q^ι = R/(γ−1+p)`; `x`-fibres `ℤ/p²` (length 2) and `ℤ/(2p, p²) = ℤ/p` (length 1) | `Q ≠ Q^ι`; `D` is the right dual | none |
| §2A.7 items 5, 8: lengths and Fitting ideals | `O′/π′^n`, ramification `e`; `Y = O′^s ⊕ ⊕O′/π^{d_i}` | both sides `min(n, e)`; `min_j(jn + v(Fitt^j)) = sn + Σ min(d_i, n)`; `(K′/O′)[λ]` of length `e` | hold; agree with PadicMeasuresIwasawaAlgebras §6.5a | none |
| §2A.7 items 6, 7 | `f` nonzerodivisor; finite free `P` in `[1, b]` | `0 → H¹/f → Sel(R/f) → H²[f] → 0`; `H¹(P ⊗ B) = Hom(coker((P²)^* → (P¹)^*), B)` | hold | none |
| §2A.8 principal case | `ℚ`, `{p, ∞}`, `ℤ_p`, `L_p = ℤ_p(ψ + pχ)`; `L_p = pℤ_pχ` | first: `Sel = 0`, `H²(C_f) = ℤ/p`, `Sel_{L̄} = 𝔽_pψ̄`; second: `(H¹/L)[p] = 𝔽_p`, `Sel_{L̄} = 0`, `H¹(𝔽_p ⊗^L C_f) = 𝔽_p` | both sequences of item 2 exact | none |
| §2A.8 general statement: edge map | `Tor` spectral sequence, `H^b = 0` for `b ∉ [0, 3]` | total degree 1: `(0,1), (1,2), (2,3)`; differentials into `(0,1)` from `(2,2), (3,3)` | the four listed pairs are exactly those needed | none |

- Source locators read against the text: 13. `KingsLoefflerZerbes2017` (arXiv v6): Definition 11.2.3 (line 3306, p. 54), the paragraph after it (line 3311, p. 55), triangles (11.2.2a)–(11.2.2b) and the base-change paragraph (lines 3338–3350, p. 55), Remark 11.2.5 (line 3351, p. 55), Theorem 11.2.7 (line 3363, p. 55), Propositions 11.2.8 and 11.2.9 (lines 3370, 3377, p. 56), Remark 12.1.4 (line 3721, p. 62). `Nekovar2006`: 6.1.4 (line 5282, pp. 136–137), 6.2.1.2 (line 5322, p. 138), 6.2.5 (line 5376, p. 139), 6.2.7 (line 5398, p. 140), 6.3.4 (line 5489, p. 143); printed page is PDF page minus 9.
- Library declarations opened: `TauCeti.ContinuousCohomology.TopSelmerStructure`, `localization`, `toSelmerData`, `mem_selmerModule_toSelmerData_iff` in `TauCeti/RepresentationTheory/Homological/ContCohomology/SelmerStructure/Continuous/Basic.lean` lines 89–136 at Tau Ceti `2a9233e5`; Mathlib `continuousCohomology` at the pin (used by `Suggested.lean`, which elaborates).
- Cross-roadmap citations resolved: ArithmeticGaloisDuality §D7.1 (two statements), §D7.3 (*Continuous cochains in the derived category*, *Cohomological finiteness and perfect amplitude*, *Nakamura cochain tensor comparisons*), §§D7.7.1, D7.7.3, D7.7.4 on `main`; §D7.3 *Cochain tensor comparison for profinite groups* at the head of #3184; DerivedModuleAlgebra §0.2 and §1.M.1 on `main`; PadicMeasuresIwasawaAlgebras §6.5a with its four cited statements at the head of #3183; §§2.5, 2.6, 2.8, 2.10, 2.13, 3.9 of this roadmap.
- Record comparison: no layer or item of the README at `94e80af` is removed, retitled or renumbered; five sections are added and twelve lines extended. Nothing is changed outside the folder.
- Dependency check: `depcheck: 94 roadmaps, 1063 edges, 0 problem(s)`; no UPWARD or CYCLE line.
- Automatic checks: all pass at this head. `lake env lean` on `Suggested.lean`: six `sorry` warnings and nothing else; the file is unchanged by the pull request, so the signature comparison and the one-tactic probe of the earlier reviews stand.
- Headline theorems: the overview's headlines are unchanged; the added sections are stated on arithmetic Selmer complexes, which the module docstring names as absent at the pins.
- Seeded sample: §2.22a lies in the change and was checked in full; the locator of §2.22 (Nekovář §6.1.4) was read; the other sampled targets lie in untouched text the change does not affect and were not reopened.

Overlap check: read ArithmeticGaloisDuality (main and the head of #3184), EulerSystemsAndKolyvaginSystems (main and the head of #3188), NoncommutativeAndEquivariantIwasawa (main), PadicMeasuresIwasawaAlgebras (head of #3183); nothing shared. Simple conditions, the co-representing module and their base change are owned here; #3188 cites §§2.22a and 2A.8 as a consumer; lengths and Fitting ideals over a discrete valuation ring are owned by PadicMeasuresIwasawaAlgebras §6.5a and cited.

Source independence: changed passages only; 5 passages compared with 2 sources (`KingsLoefflerZerbes2017` lines 3306–3313, 3346–3353, 3363–3384; `Nekovar2006` lines 5282–5300, 5322), none shared; largest share in the changed passages `KingsLoefflerZerbes2017`, 10 of 17 locators; contents not compared, since no layer is added, removed or reordered.

Research link: the new sections place the classical Selmer structures of Mazur and Rubin inside Nekovář's Selmer complexes (2006), as Kings, Loeffler and Zerbes (2017, §11.2) do for their Euler-system bounds, and state when classical Selmer groups commute with base change. Rests on the README overview and `KingsLoefflerZerbes2017` §11.2, Remark 12.1.4.

## Not verifiable

- The published version of Kings–Loeffler–Zerbes (Cambridge J. Math. 5, 2017) and the date of arXiv v6 given in the References were not opened; the README says its locators use the arXiv v6 pagination, and those were read.
- The description's account of how the text was drafted and read (the number of readings and corrections) cannot be checked against the head.

## Source issues

- **Error** in KingsLoefflerZerbes2017 at Definition 11.2.3, p. 54, and the paragraph after it, p. 55 (arXiv v6): the source says a condition is simple when its map is bijective in degree 0, injective in degree 1 and zero in degree 2, and is then determined by its degree-one image; it should be bijective in every degree at most 0 with no cohomology of the condition in degrees at least 2, since adding a module in degree 2 with zero map changes the Selmer complex; affects a stated result.

## For the human reviewers

- §§2A.6–2A.8 cite ArithmeticGaloisDuality §D7.3 *Cochain tensor comparison for profinite groups*, and §2.23a the truncation clause of §D7.7.3; both exist only at the head of #3184, not on `main`. The description names that order.
- §2A.7 items 5 and 8 cite PadicMeasuresIwasawaAlgebras §6.5a, which exists only at the head of #3183; the description lists it under "Depends on".
- §2.22a (README lines 827, 875, 970, 3034) cites `TauCeti.ContinuousCohomology.TopSelmerStructure` at Tau Ceti `2a9233e5` (committed 2026-11-26); it is not at the Tau Ceti commit pinned in `lake-manifest.json` (`2fd255d`).
