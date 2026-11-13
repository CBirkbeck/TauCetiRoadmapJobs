# Review of LocalGaloisDeformationRingsPartII (pull request #2278 at 6f34703)

**Verdict:** needs changes

Incremental re-review of the 101 lines changed since `7f3bea4`.

## R01 (P2) — At `n = 3`, 1.1–1.2 and `LocalGaloisDeformationRings` §6.9 both define the Frobenius matrix and the shape, with no stated relation

**Location:** `TauCetiRoadmap/LocalGaloisDeformationRingsPartII/README.md` line 7: "At `n = 3` Layer 1 covers the setting of the `GL₃` charts of `LocalGaloisDeformationRings` §6.9, which keep that roadmap's normalization after LLHLM18"; lines 179 (1.1) and 194 (1.2).

**Claim:** The rank-`n` statement of 1.1–1.2 gives, at `n = 3`, a second definition of the normalized Frobenius matrix `A^(j)` and of the shape of a rank-three Kisin module with tame descent, in another normalization. The sentence names the overlap and neither says which roadmap owns the rank-three objects nor relates the two.

**Witness:** `LocalGaloisDeformationRings` §6.9 at its open head: `GL3KisinChart.frobMatrix` ("`A^{(j)} ∈ Mat₃(R[[v]])` … shifted-isotypic partial Frobenius matrix") and `GL3KisinChart.shape` (Iwahori double coset). Instance: `n = 3`, `f = 1`, `s = (1 2 3)` has both.

**Repair:** Replace the sentence by: "`LocalGaloisDeformationRings` §6.9 owns the `GL₃` eigenbasis charts in the normalization of LLHLM18; 1.2 identifies the rank-three case of 1.1–1.2 with them." Add to 1.2 the target: "For `n = 3` and a 1-generic `τ`, prove that an eigenbasis in the sense of §6.9 is an eigenbasis here for the presentation of `τ` obtained by the change of embedding labels (BHHMS23, Remark 2.3.2, p. 14, and §3.1.1, p. 18), and that under it `A^(j)` and the shape of 1.1–1.2 are §6.9's Frobenius matrix and shape, with the relabelling of `j` and of `w̃` stated explicitly. *Needs:* 1.1; `LocalGaloisDeformationRings` §6.9." Add one Check that computes both shapes on a diagonal `A^(j)` for `f = 2` with `s₀ ≠ s₁`, where the two labellings differ.

## R02 (P3) — The new page locators into LLHLM23 are pages of a version the reference does not name

**Location:** README line 69: "(LLHLM23, Lemma 7.2.10(1), p. 107; its `Hom` form is Lemma 7.2.10(3) there"; line 376: "LLHLM23, Lemma 7.2.10(2), p. 107, in every rank"; References: "Invent. Math. 231 (2023), 1277–1488; arXiv:2007.05398."

**Claim:** Page 107 is a page of arXiv v2; the published article runs over pp. 1277–1488, and the reference entry, unlike those of BHHMS23, LLHL19 and LLHLM18, does not say which pagination is cited.

**Witness:** LLHLM23 line 4798 (page marker 107 of arXiv:2007.05398v2), Lemma 7.2.10 at lines 4806–4815.

**Repair:** In the References write "arXiv:2007.05398v2, whose printed pages are cited."

## Previous findings

- R01 — repaired: "§§0.1–0.4 and Layers 1–3 are stated for `GL_n`; §0.5 and Layers 4–7 take `n = 2`"; the gap reads "the §6.9 construction in every rank `n`". The repair introduced R01 of this report.
- R02 — repaired: "there are a finite extension `𝔽′/𝔽` and `D ∈ T(𝔽′)^f` with `ρ ⊗_𝔽 𝔽′ ≅ V(w̃, D)` … one can take `𝔽′ = 𝔽` when the `n` characters of `τ(s′, μ′)` are pairwise distinct".
- R03 — repaired: "leaving `(𝒪/p)⟦d₁₁, d₂₂, x₁₂, x₂₁, …⟧/(d₁₁d₂₂)`; setting the variables to zero retracts it onto `𝒪/p`, so `ϖ ≠ 0` in it when `e(E/ℚ_p) ≥ 2`".
- R04 — repaired: "This Part owns the explicit tame theory needed for these rings. In every rank `n`: …".
- R05 — repaired: the description lists "#2282 (ModpRepresentationsOfGL2OverLocalFields)" and "The README declares eight supplier gaps under `## Exact supplier contracts`", all eight by slug.

## Verified sound

| Statement | Instances tried | Values computed | Result | Change |
|---|---|---|---|---|
| Conventions, action of `S_n` | `ṡ e_i = e_{s(i)}`, `diag(x)` | `ṡ diag(x) ṡ⁻¹ e_{s(i)} = x_i e_{s(i)}`, so entry `k` is `x_{s⁻¹(k)}`; pivot of `ẇ v^ν` at `(w(k), k)` | agrees with 1.3 | none |
| Conventions, `k_(n)` | `s_τ ∈ S_n`, orbit length `d(i) ≤ n` | `ord(s_τ)` and `d(i)` divide `lcm(1..n) = m`; `n = 2`: `m = 2` | holds | none |
| 0.1, new Check | `n = 3`, `f = 1`, `s = (1 2 3)`, `μ = 0`, `p = 5` | `α′₁ = (1,0,2)`, `α′₂ = (0,2,1)`; exponents `7, 51, 35`; `7·5 = 35`, `35·5 ≡ 51`, `51·5 ≡ 7 (mod 124)`; other action `27, 11, 55` | holds; BHHMS23 lines 612–646 | none |
| 0.1, central shift | `μ_j + (b_j,…,b_j)` | exponent shift `c(p^{f′}−1)/(q−1)`, and `ω̃_{f′}^{(p^{f′}−1)/(q−1)} = ω̃_f` | holds | none |
| 0.3 at `n = 3` | same instance, `j′ = 0` | `s′_or = s^{−2} = s`; `s⁻¹·a′ = (a₂, a₃, a₁) = (51, 35, 7)`, dominant | holds | none |
| 0.4 | `N = 1`; rank `n` | LLHL19 lines 491–506 (Proposition 2.2.15 of arXiv v4, p. 14): `d ≥ 1`, loss one in every rank; `d − n + 1` is 2.2.16, a different statement | locator now right | none |
| 1.1 minors, 1.2 shape | `i = 1..n`; `w t^(2,1)` | exponent `Σ_{k≤i} λ_{j,n+1−k}` (BHHMS23 line 846); `ẇ diag(v², v) = [[0,v],[v²,0]]` | holds; double ownership at `n = 3` | R01 |
| 1.3–1.4 | `w̃ = w t^(2,1)`; `R = 𝔽[ε]` | bounds `(≤1, 1; 2, ≤1)`; ambiguity `(1+ε𝔽)ⁿ` per embedding, dimension `nf` | BHHMS23 lines 863–872, rank `n`, `(h+1)`-generic | none |
| 2.3 | rank `n` | `ε_{j,t} ∈ p^{L−(h−1)−t} M_n(R)`: BHHMS23 line 984 has `M_n`, line 971 prints `M₂` | holds | none |
| 3.2 route | `d \| d(i)` proper; `f = 2`, `p = 3`, `δ = (2, −1)` | `\|c_k − c_ℓ\| ≤ q − 1`; `S = Σ q^k e_k`, `e₀ ≢ 0 (mod q)`, `\|S\| ≤ q^{d(i)} − 1` with equality only for equal signs, excluded by `Σ e_k = 0`; `\|2 − 3\| = 1` | holds | none |
| 3.6 | `f = 1`, `s′ = 1`, `a = b`; distinct characters; two orbits with equal characters | `ω^a ⊗ ρ₀` needs `𝔽′` quadratic; distinct: eigenlines over `𝔽`, orbit sums `G_K`-stable, one entry of `D` gives any `α ∈ 𝔽^×`; scalar rescaling gives only `α = c^d` | holds | none |
| 3.7 | `n ≥ 2`; `n = 1`, `p = 2`; `n = 1`, `p > 2` | `3(n−1) ≤ ⟨μ, α̃^∨⟩ < p − 2`, so `p ≥ 3n > n`; `δ_j − 1 ∈ [2, p−4] ∪ [−(p−2), −4]`, sum `< p^{f′} − 1`; `ad = 1 = ω` at `p = 2` | holds; LLHLM23 lines 4802–4809 | none |
| 3.9 | `n = 1`, `p = 2`; right side empty | odd order, tame, both sets `𝔽^×`; both empty | holds | none |
| gap:kummer-restriction-invariants | LLHLM23, Lemma 7.2.10(1) | `H⁰(G_K, ρ) ≅ H⁰(G_{K∞}, ρ)` for cyclotomic-free `ρ` (line 4806); the `Hom` form is (3) | matches; page version unstated | R02 |
| 7.5, third Check | modulo `Q₂ + P` | `p = 0`, `d₁₁d₂₂ = 0`; retraction onto `𝒪/p`, where `ϖ ≠ 0` iff `e ≥ 2` | holds | none |

The rows of the previous review, of `7f3bea4`, stand for the untouched statements (0.5, Layers 4–7, 5.3 and `crossing_prime`).

- Source locators checked against the text in the changed passages: 21 (BHHMS23 15, LLHL19 3, LLHLM23 3); statement, hypotheses and printed page agree in each. Seeded targets in the changed passages (0.2, 0.4, 1.3, 2.1, 3.2, 3.4, 3.6, 3.8) are among them; the other seven lie in text the change touches only by the gap's name.
- Cross-roadmap citations resolved: `LocalGaloisDeformationRings` §§6.9, 6.20 read at its open head; no other roadmap cites the renamed gap.
- Gate: every check passed. Dependency check: `depcheck: 239 roadmaps, 2174 edges, 0 problem(s)`. Nothing changed outside the folder.
- Elaboration: `sorry` the only warning; `Suggested.lean` is unchanged since `7f3bea4`.
- Pull request text: the description states the rank-`n` layers, the six open suppliers and the eight gaps by their names at this head; nothing in it is contradicted.
- Remark: the README names the gap `descent-kisin-modules` and states it in every rank; the design plan's entry is `rank-two-descent-kisin-modules`, in rank two.
- Overlap check: read HilbertModularVarietiesAndShimuraCurvesPartII, LocalGaloisDeformationRings, PotentialAutomorphyInfrastructurePartII, ModpRepresentationsOfGL2OverLocalFields, EllipticCurveModularityWild3Adic (the other two lists are empty); shared: the rank-three Frobenius matrix and shape, owner LocalGaloisDeformationRings §6.9 (R01).

Source independence: changed passages only; 8 passages compared with 3 sources (BHHMS23, LLHL19, LLHLM23), none shared; largest share BHHMS23, 60 of 78 locators; no layer was added, removed or reordered, so the contents were not compared again.

## Not verifiable

- Kisin06, Corollary 1.3.15 (2.1): recorded as uncertified; cited through BHHMS23 line 904.
- Ownership against open pull requests was checked on the heads the roadmap tools index, not beyond.

## Source issues

- **Error** in BHHMS23 at Proposition 3.2.7, p. 23: the source says the semisimple `ρ` over `𝔽` with the given inertia are exactly the `V(w̃,D)` with `D ∈ T(𝔽)`; it should allow a finite extension of `𝔽` when two inertial characters coincide; affects a stated result.
- **Misprint** in BHHMS23 at Proposition 3.1.9, p. 21: the source says the remainders lie in two-by-two matrices in a statement written for rank `n`; it should be `n`-by-`n` matrices, as in its equation (18); affects nothing.

## For the human reviewers

- **Licence.** README 5.2, 7.1 and 7.4 restate the chart matrices, generators and change of variables of BHHMS23 Tables 1–5 and Figure 2 (pp. 38, 41–45) in the roadmap's own notation; the arXiv licence of v7 was not read.
- **Scope.** 60 of 78 locators are to one article (BHHMS23, Invent. Math. 2023); five of eight layers have the scope of one of its sections (`README.md` lines 173, 239, 290 and the headings of Layers 4 and 7).
- **Not tested.** The README's gap `descent-kisin-modules` (line 75, every rank) has no entry of that name in the design plan, whose `rank-two-descent-kisin-modules` asks `LocalGaloisDeformationRings` for rank two only.
