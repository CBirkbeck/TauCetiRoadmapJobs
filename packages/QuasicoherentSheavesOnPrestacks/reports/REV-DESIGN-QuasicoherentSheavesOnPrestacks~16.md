<!-- from CBirkbeck, https://github.com/TauCetiProject/TauCetiRoadmapJobs/pull/16366#issuecomment-6904943712 -->
Review (claude) of b86d294

Verdict: needs_changes

**For the human reviewers:** this review raises 1 question that a human decides (the scope of the roadmap, or a licence). It is in the section of that name at the end and does not change the verdict.

1. **F01** (P3) 8.2: the Check on `⨿_ℕ Spec ℤ` is false for the coproduct of prestacks

   **Location.** `packages/QuasicoherentSheavesOnPrestacks/design/README.md` line 818 (8.2, third Check): "`⨿_ℕ Spec ℤ` has affine diagonal and compactly generated `QCoh` but is not perfect (8.1's Check)". Mirrored in `design/plan.json`, target 8.2, test `non_qc`: "The coproduct of countably many Spec Z is not perfect".

   **Claim.** The object written `⨿_ℕ Spec ℤ`, which elsewhere in the README (Conventions, 2.2) is a coproduct of prestacks, has affine diagonal.

   **Witness.** Classical context, `Y = ⨿_ℕ Spec ℤ` in `PreStk_CRing`: `Y(R) = ℕ` for every R. The fibre of the diagonal over the point `(0, 1)` at ℤ is the empty prestack, value ∅ at the zero ring; an affine has a point there (2.1's Check).

   The Check is true for `h_X`, X the scheme `⨿_ℕ Spec ℤ`, which is what 8.1's Check uses; the two have the same `QCoh` (3.3) and different diagonals, the phenomenon 7.1's Check on `BΓ` records.

   **Exact repair.**

   1. README line 818, replace the Check by: "For the scheme `X = ⨿_ℕ Spec ℤ`, `h_X` has affine diagonal and compactly generated `QCoh` but is not perfect (8.1's Check): the definition must ask compact = dualizable. The diagonal is affine because a point of `h_X × h_X` at R is a pair of locally constant functions `f, g : Spec R → ℕ`, and the fibre of the diagonal over it is the open and closed subscheme of `Spec R` where `f = g`, the spectrum of a direct factor of R. The coproduct of prestacks `⨿_ℕ Spec ℤ` has the same `QCoh` (3.3) and not affine diagonal: over the pair of indices `(0, 1)` at ℤ the fibre is the empty prestack, with empty value at the zero ring."
   2. `design/plan.json`, 8.2, test `non_qc`: replace "The coproduct of countably many Spec Z is not perfect: O dualizable not compact." by "For the scheme X = the disjoint union of countably many Spec Z, h_X has affine diagonal (the fibre over (f, g) is the open and closed locus f = g) and compactly generated QCoh, and is not perfect: O dualizable not compact. The coproduct of prestacks has the same QCoh and no affine diagonal: the fibre over (0, 1) is empty, also at the zero ring."

   **Tested.** `R = ℤ × ℤ`, `f = (0, 1)`, `g = (0, 0)`: the locus `f = g` is `Spec(ℤ × 0)`, affine. `f = 0`, `g = 1` constant on `Spec ℤ`: the locus is `Spec 0`, affine, with one point at the zero ring; for the prestack coproduct the fibre has none.

2. **F02** (P3) 8.4: exactness of invariants on `BGL_n` uses 7.4(d), which the route and the *Needs* line do not name

   **Location.** README line 852 (8.4, proof route): "so every representation is a sum of irreducible finite-dimensional ones, and the derived invariants `RΓ(BGL_n, −)` are t-exact"; line 863, *Needs*: "7.4 (7.4(a) and the affine diagonal)". Mirrored in the plan, 8.4, API `BGLn`.

   **Claim.** Semisimplicity of the heart gives t-exactness of `RΓ`.

   **Witness.** Constant prestack `K(ℤ, 2) × Spec ℚ`: `QCoh = Fun(K(ℤ, 2), Mod_ℚ)`, heart the ℚ-vector spaces (simply connected), semisimple, O in the heart; yet `π₀ Map(O, O[2]) = H²(K(ℤ, 2); ℚ) = ℚ`. The step needs `π₀ Map(O, M[i]) = Ext^i` in the heart, which is 7.4(d).

   The statement of 8.4 is unaffected: 7.4(d) applies to `[Spec k/GL_n]` (quasi-compact, affine diagonal), and 7.4 is already a prerequisite. The same route also uses 7.4(b) and 7.4(c) by name, outside the parenthesis of the *Needs* line.

   **Exact repair.**

   1. README line 852, replace the quoted sentence (from "Finite-dimensional representations of `GL_n` are completely reducible" to "are t-exact.") by: "Finite-dimensional representations of `GL_n` are completely reducible in characteristic zero (ReductiveGroups Layer 6), so every representation, the union of its finite-dimensional subrepresentations (ReductiveGroups Layer 1, through the heart of 7.4(c)), is a sum of irreducible finite-dimensional ones, and `Ext^i` vanishes in the heart for `i > 0`. By 7.4(d), which applies because `[Spec k/GL_n]` is quasi-compact with affine diagonal, `π₀ Map(O, M[i])` is `Ext^i(O, M)` computed in the heart for M in the heart, hence zero for `i > 0`; with the left and right completeness above, the derived invariants `RΓ(BGL_n, −)` are t-exact."
   2. README, 8.4 Checks, add: "Semisimplicity of the heart alone does not make invariants exact. On the constant prestack `K(ℤ, 2) × Spec ℚ`, `QCoh` is `Fun(K(ℤ, 2), Mod_ℚ)` and its heart is the ℚ-vector spaces, `K(ℤ, 2)` being simply connected, yet `π₀ Map(O, O[2]) = H²(K(ℤ, 2); ℚ) = ℚ`. The route uses the comparison 7.4(d), which has no analogue there."
   3. README line 863: "7.4 (7.4(a) and the affine diagonal)" becomes "7.4 (7.4(a) and the affine diagonal; the hearts of 7.4(b) and 7.4(c); the comparison 7.4(d), for the exactness of invariants)".
   4. Plan, 8.4, `BGLn`: replace "Derived invariants are t-exact, so" by "Ext^i vanishes in the semisimple heart for i > 0 and, by 7.4(d) for the quasi-compact [Spec k/GL_n] with affine diagonal, pi_0 Map(O, M[i]) = Ext^i(O, M) for M in the heart; with completeness the derived invariants are t-exact, so"; add the test of item 2.

   **Tested.** `n = 1`, `k = ℚ`: heart the graded ℚ-vector spaces, `Ext^i = 0` for `i > 0`, 7.4(d) gives `π₀ Map(O, M[i]) = 0` for M in the heart, and for connective M the tower `RΓ(τ_{≤m} M)` has `π₀` constant `(π₀M)_0`, so no `lim¹` enters `π_{−1}`. `K(ℤ, 2)`: `H²(ℂP^∞; ℚ) = ℚ`, as the new Check says.

Two findings, both P3 (R01, R02), each with an exact repair of a sentence or two; a repair, whatever its priority, asks for changes, so a fix round applies them. Nothing is blocking (no P1, no P2). Both findings of round 15 are repaired. The two declared supplier gaps, `gap:chevalley-quasiprojective-quotient` and `gap:twist-quasiprojective`, are precise, minimal and declared in both files, and are not findings. No maintainer notes were supplied. This review changed neither `packages/QuasicoherentSheavesOnPrestacks/design/README.md`, `design/plan.json` nor `sources.toml` (same checksum before and after the two fetches below).

## Verified sound

### The findings of round 15

| Finding | Status | Repaired passage, and what I checked |
| --- | --- | --- |
| F01 (P2) 7.1, base change of the atlas | repaired | Line 719: "the base change of `L X → [X/G]` is `L(G ×_S Spec R_i) → Spec R_i` … When X and `G ×_S Spec R_i` are hypercomplete fpqc sheaves, for instance when X is affine and G is affine over S (3.2, 4.1), `L X = X` and this is the base change of the atlas itself". Line 729 ends with the `L Γ` computation. The plan's `geometric_quotient` and `realization_diagonal` agree. The repair's departure from the review ("X affine and G affine over S" in place of "S and X affine") holds: `G ×_S Spec R_i` is affine by 4.1's definition, with no condition on S. |
| F02 (P3) 7.4, affines are sheaves | repaired | Line 768: "fixing `h_X` and `h_{G ×_k X}`, which are affines, hence fpqc sheaves (3.2) and so fppf sheaves (3.1)"; line 777 has "3.2 (affines are fpqc sheaves, for the affine diagonal)"; plan 7.4 has `target:3.2`. The repair also added the fact itself to 3.2 (line 469), with a Check (line 477) and a Mathlib contract (line 96); all three are reviewed below. |

Nothing in the repair report is marked "not actionable"; nothing is re-raised. The repaired patterns were searched in the whole design: a statement whose hypothesis sits in a neighbouring sentence (none further), a fact cited to a section that does not state it (none further: "affines are sheaves" is now 3.2's, and every "(3.2)" for it in 4.1, 7.1, 7.4 resolves), a route input missing from *Needs* (R02).

### Adversarial pass

Values computed by hand this round. Rows cover the passages the repair changed or added, the fifteen sampled targets, the headline theorems and the targets the findings touch.

| Statement | Instances tried | Values computed | Result |
| --- | --- | --- | --- |
| 3.2, affines are hypercomplete fpqc sheaves (added) | identity hypercover; `A = 0`; `A × A′`; `CAlg^cn`; `CRing` | constant diagram, limit `Map(B, A)`; `Map(B, 0)` a point; `Map(B, A) × Map(B, A′)`; limit in `D(ℤ)_{≥0}` is `τ_{≥0}` of the limit in `D(ℤ)`, which is A, already connective; in `CRing` the limit of the discrete `A_n` over `Δ_s` is the equalizer of `A_0 ⇉ A_1`, `H⁰` of the derived limit A | holds |
| 3.2 Check, affine line (added) | `ℤ → ℤ[1/2] × ℤ[1/3]`; `ℤ → 𝔽_p × ℤ[1/p]` | tensor square `ℤ[1/2] × ℤ[1/6]² × ℤ[1/3]`, equalizer `ℤ[1/2] ∩ ℤ[1/3] = ℤ`; tensor square `𝔽_p × 0 × 0 × ℤ[1/p]`, both cofaces `(a, b) ↦ (a, b)`, equalizer contains `(1, 0)`, and `n ↦ (n̄, n)` hits it only if `n = 0` and `n ≡ 1` | holds; flatness needed |
| Mathlib contract for `Subcanonical` (added) | the pin | `instance : fpqcTopology.Subcanonical` at Mathlib/AlgebraicGeometry/Sites/Fpqc.lean:88; `class Subcanonical` at Mathlib/CategoryTheory/Sites/Canonical.lean:129, in `CategoryTheory.GrothendieckTopology`; it concerns set-valued representables on schemes, as the contract says | holds |
| 7.1 atlas base change (changed) | `Γ = ℤ/2`, `S = X = Spec ℤ`; `G_m`; `G = 1`, any X; `X = G` | `L(Γ × Spec ℤ) = Spec(ℤ × ℤ)`, 4 points at `ℤ × ℤ` against 2 for the prestack; `Spec R_i[t, t⁻¹]`, affine, fixed by L; `L X ×_{L X} Spec R_i = Spec R_i`; `L G ×_{L S} Spec R_i = L(G ×_S Spec R_i)` by left exactness | holds |
| 7.1 affine diagonal and flat atlas (consumers) | `O(G) = ℤ × 𝔽_ℓ`; `G_m` | base change `G → S`, `𝔽_ℓ` not flat over ℤ; `ℤ[t^{±1}]` free | only the sheaf case is used |
| 7.4(a) affine diagonal (changed) | `X = Spec k`, `G = GL_n`; `G = 1` | `h_X = Spec k`, `h_{G × X} = Spec O(GL_n)`, corepresentable; diagonal of an affine | holds |
| 1.2 (sample) | `R → R[t]`, `M = R[1]`, `N = R[t]`; pushout of `ℤ → 𝔽_p` with itself; `A × B` | both sides `R[t][1]`; both sides `𝔽_p ⊗ᴸ 𝔽_p`, `π₁ = 𝔽_p`, against `𝔽_p` for the ordinary square; idempotents `(1, 0)`, `(0, 1)` split modules | sound |
| 1.3 (sample) | `𝔽_p ⊗ᴸ_ℤ 𝔽_p`; `ℤ → ℤ[1/p] × ℤ_p`; `ℤ → ℚ` | `π₀ = 𝔽_p`, heart `ModuleCat 𝔽_p`, unit has `π₁ = 𝔽_p`; `(p)` under `pℤ_p`, other primes under `ℤ[1/p]`; `ℚ ⊗ᴸ ℤ/p = 0` | sound |
| 1.5 (sample) | K empty; K a point; HA 4.7.4.18 with `S = Δ¹`; `(ℤ, ℤ²)` | terminal category; the statement is the hypothesis; a limit in `Fun(Δ¹, Cat∞)` of right adjointable arrows is right adjointable and the projections are morphisms of `Fun^{RAd}`; evaluation rank 4 → 1 | sound |
| 2.1 (sample) | `Spec 0` against ∅; `Spec 𝔽_p ×_{Spec ℤ} Spec 𝔽_p` | a point against ∅ at the zero ring; `Spec 𝔽_p` in `CRing`, `Spec(𝔽_p ⊗ᴸ 𝔽_p)` in `AnRing` | sound |
| 2.4 (sample) | `u_! ∅`; `u_! Spec ℤ`; `ι^* Spec(𝔽_p ⊗ᴸ 𝔽_p)` | ∅; `Spec u(ℤ)`, u(ℤ) initial; `Map(𝔽_p ⊗ᴸ 𝔽_p, ιR) = Hom(𝔽_p, R)`, so `Spec 𝔽_p`, whose `QCoh` has unit without `π₁` | sound |
| 3.4 (sample) | empty scheme; doubled plane, `R = k[x, y, a, b]/(ax + by − 1)`; `ℙ¹` | `h_∅(R)` nonempty only for `R = 0`, so `h_∅ = Spec 0`; opens containing `𝔸² ∖ 0` are `𝔸² ∖ 0`, U, U′, X, of which only U, U′ are affine: two points; cokernel of `k[t] ⊕ k[t⁻¹] → k[t^{±1}]` twisted by `t⁻²` is `k·t⁻¹` | sound |
| 4.1 (sample) | codegeneracies of the Čech nerve in `CRing`; `BG → Spec k` | `B_{n+1} ⊗ᴸ_{R′_{n+1}} R′_n = B_0 ⊗ᴸ_{R′} R′_n` along a vertex map, flat, so derived equals ordinary; `π₁ = G(O(G)) ∋ id ≠ 1` | sound |
| 5.3 (sample) | `⨿_ℕ Spec ℤ`; `j_! O_U` on a DVR | `∏_ℕ D∞(ℤ)` on both sides; stalk at the closed point 0, at the generic point K: not quasi-coherent | sound |
| 6.1 (sample) | SAG 2.8.4.2 against the five properties | its list has n-connective (1), flat (6), almost perfect (9), perfect (10); locally free of finite rank is flat and almost perfect (1.4), so it follows from (6) and (9) | sound |
| 7.2 (sample) | `G = 1`, `X = ∅`; translation; vertex maps | zero category on both sides; Čech nerve of the split `G → S`, limit `QCoh(S)`; the term on `G^n × X` is a pullback of the term on X | sound |
| 7.3 (sample) | Γ trivial; `Γ = ℤ` trivial on `Spec C`; `σ(x) = 2x` | `QCoh(X)`; `H¹(ℤ; C) = C`; `id(x·1) = x ≠ 2x`; coconnectivity: the left adjoint `M ↦ ⊕_γ γ^*M` preserves connective objects, so the underlying object of a coconnective fixed point is coconnective, and conversely a limit of contractible spaces is contractible | sound |
| 8.1 (sample) | `Spec A`; `⨿_ℕ Spec ℤ` | generator O; `Hom(O, ⊕O_i) = ∏ℤ ≠ ⊕ℤ` | sound |
| 8.2 (sample, headline) | prestack coproduct `⨿_ℕ Spec ℤ`, point `(0, 1)`; `h_X`, pair `(f, g)`; `BG_m` | fibre ∅, no point at the zero ring; fibre the clopen locus `f = g`, affine; weight-n part exact | R01 |
| 8.3 (sample, headline) | (a) relative diagonal; (b) tag 0BQR for a family; (d) base change for `p_U` | equalizer of two sections of an affine, affine; the proof uses quasi-compactness, affine diagonal (to represent K by a complex of quasi-coherent modules) and one section s with `X_s` affine, powers of one `L_i`; `g_* g^* p_{U*}F = p_{U*}F ⊗_A A′ = g_* p_{U′*} g′^*F` by the two projection formulas, `g_*` conservative | sound |
| 8.4 (sample, headline) | `K(ℤ, 2) × Spec ℚ`; `BG_m` over ℚ; `G = 1`; `X = ∅` | heart `Vect_ℚ`, `π₀ Map(O, O[2]) = ℚ`; `Ext^i = 0`, `π₀` of the tower constant; 8.1 with 8.2; zero category | R02; statement holds, conditional on the gaps |
| gaps | P trivial; `H = GL_n`; `H = 1` | `X_R` with pulled-back L; a point; `GL_n` | precise, minimal |
| 3.3, 4.2, 5.4, 6.2–6.4, 8.5 (headlines, untouched) | — | rows of round 15, which carry values (`𝔽_p ⊗ᴸ 𝔽_p` against `𝔽_p`; rank 4 → 1; `∏𝔽_p ≠ ⊕𝔽_p`; `k = k ⊕ 0 ⊕ ⋯` for `k[Γ]`) | relied on |

### Sources: the seeded sample

No locator is flagged unverified. Every locator of the fifteen sampled targets was read in the cached texts.

| Target | Locators read | Result |
| --- | --- | --- |
| 1.2 | HA lines 22977–22985 (4.5.3.1, 4.5.3.2, p. 601), 28674 (4.8.5.21, p. 754), 28032 (4.8.4.6, p. 737); SAG lines 17836–17844 (6.2.2.1, pp. 490–491) | match |
| 1.3 | HA lines 47511–47518 (7.2.2.10, 7.2.2.12, p. 1240), 46134–46144 (7.1.1.13, p. 1202: smallest subcategory, accessible, complete, heart, products and filtered colimits), 47519–47522 (7.2.2.13, p. 1240), 47532–47540 (7.2.2.15, pp. 1240–1241), 6013 (1.4.4.11, p. 160), 47387 (7.2.1.19, p. 1236) | match |
| 1.5 | HA lines 26640–26644 (4.7.4.18, p. 699), 23655–23660 (4.6.1.11, 4.6.1.12, p. 620), 26834 (4.7.5.2, p. 704), 26863 (4.7.5.3, p. 705), 31630 (5.2.2.36, p. 835); SAG lines 10219–10222 (2.9.5.5, p. 283), 18368 (6.3.4.1, p. 505); HTT lines 5731 (2.4.1.5, PDF p. 134), 7312 (3.1.2.1, PDF p. 169) | match |
| 2.1 | SAG lines 17853 (6.2.2.3, p. 491), 17867 (6.2.2.7, p. 491) | match |
| 2.4 | SAG line 17845 (6.2.2.2, p. 491); GR-I lines 7397–7401 (§1.2, printed pp. 145–146: a classical prestack is tested on classical affines) | match |
| 3.4 | GR-I line 7572 (1.4.4, printed p. 149); SAG line 17912 (6.2.3.4(3), p. 493); Stacks, Descent, line 1906 (tag 023Q, Lemma 13.7); HTT lines 31671, 31680, 31693 (6.5.3.11–6.5.3.13, PDF p. 698) | match |
| 4.1 | SAG lines 18224–18236 (§6.3.2, p. 501); Stacks, Descent, line 4181 (tag 0245, Lemma 37.1) | match |
| 5.3 | SAG lines 17929 (6.2.4.1, p. 493), 6951 (2.1.2.3, p. 193), 7461 (2.2.6.2, p. 208); GR-I line 7572 | match |
| 6.1 | SAG lines 17990 (6.2.5.3, p. 495), 17995, 17999, 18004, 18011 (6.2.5.4–6.2.5.7, p. 495), 9916–9930 (2.8.4.2, p. 275), 18085–18087 (the paragraph before 6.2.6.3, p. 497), 17975–17986 (6.2.5.2, pp. 494–495) | match |
| 7.2, 7.3 | SAG line 17889 (6.2.3.1, p. 492); GR-I lines 7463, 7474 (1.3.8, 1.3.11, printed p. 147) | match |
| 8.1 | Stacks lines 1806 (tag 09IS), 1969 (tag 09M1); SAG line 29408 (9.6.1.1, p. 807) | match |
| 8.2 | BZFN lines 834–837 (Definition 3.2, p. 17), 970–972 (Proposition 3.9, p. 20) | match |
| 8.3 | BZFN lines 1149 (3.20, p. 23), 1189 (3.21, p. 24), 1209 (3.23, p. 24), 1216 (3.24, p. 25); Stacks line 1897 (tag 0BQR) and its proof, lines 1902–1914; Stacks, Morphisms of Schemes, lines 999–1005 (tag 0FXR), 1011–1013 (tag 0FXS), 1019–1027 (tag 0FXT) | match |
| 8.4 | BZFN lines 1200–1208 (Corollary 3.22, p. 24; Chevalley at line 1205); SGA1 line 6972 (Exposé VIII, Proposition 7.8, PDF p. 190, printed p. 174) | match |

Also read: Stacks, Morphisms of Schemes, line 1100 (tag 02JR, 6.2's Check). Every cited work is in the manifest (nine entries, all `certified`). The Morphisms and Descent chapters were read through the sources service under the existing key `Stacks`; the manifest was kept as recorded. No reference request was written.

### Pins, suppliers, ownership

Lean elaboration: not available (this lane does not elaborate; the command was not offered). The design has no `Suggested.lean`, so there is nothing to probe or `#check`.

Library declarations opened at the pins this round, each at the file and line the contract gives: `SSet.Quasicategory` (Quasicategory/Basic.lean:41), `SSet.KanComplex` (KanComplex.lean:40), `CategoryTheory.nerve` (Nerve.lean:37) and its instance (Quasicategory/Nerve.lean:32), `AlgebraicGeometry.Spec` and `Scheme.Spec` (Scheme.lean:466, 494), `fppfPrecoverage`, `fppfTopology`, `fpqcPrecoverage`, `fppfPrecoverage_le_fpqcPrecoverage`, `fpqcTopology`, `fppfTopology_le_fpqcTopology` and the `Subcanonical` instance (Sites/Fpqc.lean:41, 54, 61, 67, 76, 84, 88), `Module.Flat` (Flat/Basic.lean:114), `Module.FaithfullyFlat` (FaithfullyFlat/Basic.lean:64), `DerivedCategory` (Basic.lean:87), `DerivedCategory.TStructure.t` (TStructure.lean:33), `Pseudofunctor.IsStack` (IsStack.lean:49), `DescentData` (DescentData.lean:59), `CoGrothendieck` (Grothendieck.lean:235), `groupCohomology` (Basic.lean:183), `Rep.coind` (Coinduced.lean:120), `groupCohomology.coindIso` (Shapiro.lean:58), `Rep.FiniteCyclicGroup.groupCohomologyIsoEven` and `…Odd` (FiniteCyclic.lean:80, 114), `exists_prime_orderOf_dvd_card` (Cycle/Type.lean:491), `RingHom.FinitePresentation` (FinitePresentation.lean:392), `Precoverage.mem_toGrothendieck_iff_of_isStableUnderComposition` (PrecoverageToGrothendieck.lean:166; its `HasIsos` hypothesis for `fppfPrecoverage` comes from the instance at Sites/MorphismProperty.lean:104), `Functor.IsFibered` (FiberedCategory/Fibered.lean:65), and `TauCeti.AffineGroupSchemeCat.exists_isClosedImmersion_generalLinear` (Embedding.lean:212, with `[LocallyOfFiniteType G.obj.X.hom]`). All exist as cited.

Supplier citations resolved this round, at main or at the open head:

- EnhancedDerivedSheaves (main): all 64 names and section labels of the contract occur in its README (script); `homotopyFixedPoints` is stated for a finite group (line 1720), as 7.3 says.
- SchemeAndStackFoundations (main): §§1.1, 1.13, 1.16, 1.18, 1.21, 1.22, 2.18 (lines 2793, 3185, 3380, 3538, 3744, 3797, 5030) and all 33 names of the contract. §1.16 states `contractedProduct_isAlgebraicSpace` and no quasi-projectivity (lines 3380–3392), as the gap says.
- ReductiveGroups (main): Layers 1, 3, 6 (lines 1275, 1537, 2448); complete reducibility of linearly reductive groups (line 2477); no statement that `GL_n/H` is quasi-projective (searched "projectiv", 20 hits, none of it), as the gap says.
- DerivedModuleAlgebra (main): §0.2 (line 794), §1.E.0 (line 2472) and the four names.
- PrismaticCohomologyPartII (open): §4.0 (line 709) and all 17 `QCohPrestack` names. LanglandsParameterStacks (open): §§1.7, 1.8 (lines 380, 390). HabiroCohomologyFoundations (open): §§1.27, 1.28 (lines 807, 821). AnalyticStacks (open): §§1.1, 1.2 (lines 393, 414).
- The InfinityCategoryTheory family (open, one pull request adding its folders): all 39 cited statements exist with the cited source results, among them InfinityTopoi §§3.3.2, 7.3.1, 7.3.4, 7.4.1, 7.6.1, 8.4.1 (injectivity step, HTT Lemma 6.2.2.16), 9.1.1 (covering sieves as images), 9.2.3 (its local-lifting step, stated there for any Grothendieck topology, HTT Lemma 6.2.4.5), 14.1.1, and HypercompletenessAndCoherence §§9.3.2, 9.4.1, 11.5.2, 11.5.3 with hypotheses (a)–(e) as the README restates them.
- The twelve name leads of `scratch/citations.md` are qualified supplier names; each was found in its supplier's README above.

`scratch/overlaps.md`: no competing pull request, no dropped id, no id defined only by a revision, no second copy, no roadmap close in results or headings. Searched by object at the open heads and on main: "perfect stack" (nowhere else); SAG Theorem D.6.3.1 (LanglandsParameterStacks §1.7 only, the Čech case, cited and extended); `Ind(Perf(−))` (RefinedTraceMethods and GeometryOfNumbersAndQuadraticArithmetic, for rings); "quasi-coherent sheaves on prestacks" (nowhere else). The board's package index has no second package on this subject. Ownership against pull requests outside the tools' index was not checked.

Overlap check: read EnhancedDerivedSheaves (main), SchemeAndStackFoundations (main), AlgebraicModuliForArithmeticGeometry (main, scope only), AnalyticStacks, HypercompletenessAndCoherence and InfinityTopoi (open); shared objects: module categories of one algebra and of animated rings — owner EnhancedDerivedSheaves E5; fppf stacks, quotient stacks, abelian `QCoh` on stacks and `DQCoh` — owner SchemeAndStackFoundations; ∞-topos theory and the sheaf criteria — owner the InfinityCategoryTheory family; the affine formalism `D(R) = Mod_R(D(ℤ))` and its !-topology — owner AnalyticStacks §§1.1–1.2, later in the order, a consumer of 2.2.

### Dependency gate and the declared gaps

```
candidate: QuasicoherentSheavesOnPrestacks is not in the merge order yet; checked as if placed after HabiroCohomologyFoundations (the intake inserts it when its design is accepted)
depcheck: 237 roadmaps, 2235 edges, 0 problem(s)
```

No UPWARD or CYCLE line. AnalyticStacks, the named consumer, is later than that placement. None of the roadmaps barred as suppliers is cited. Both gaps name a supplier and a section on main, state one `needs` sentence with its hypotheses, carry the same slug in the plan and in the README (lines 135, 181), and ask for nothing a supplier, Mathlib or Tau Ceti states.

### Shape, principles, headlines

- 8 layers, each ending with Examples and Dependencies; 33 subsections, each with exactly one *Needs* line and at least 3 Checks (script). The plan has 33 targets, each with a locator and at least 3 tests.
- Scan (script): no LaTeX delimiters, `set_option`, process words, pull-request numbers, machine paths or `lemma` as a keyword (the hits are "Shapiro's lemma" and cited Lemmas).
- No algorithm, no sorry'd data, no route-specific shortcut, no re-planned roadmap. The README names its sources and does not say it follows one.
- Headline theorems (Summary): flat hyperdescent (3.2) with 3.3; affine pushforward (4.2); `QCoh(h_X) ≃ Dqc(X)` (5.3); the t-structure and perfect = dualizable (6.2–6.3); `QCoh(X/Γ) ≃ QCoh(X)^{hΓ}` (7.3); perfect stacks and permanence (8.2–8.3); characteristic-zero quotients (8.4); the non-compact unit in characteristic p (8.5). Each is a target with hypotheses and locators; statability at the pins is the package stage's question.
- A remark that needs no change: 8.3's "the right adjoint … exists by `adjointFunctorTheorem`" is applied to a target not yet known to be presentable; the adjoint exists all the same, since `Map(c, N) = Map(M, f_*N)` is small for the generators.

Source independence: 14 passages compared with 6 sources (6.1 with SAG 6.2.5.3; 6.3 with SAG 6.2.6.3; 1.3 with HA 7.1.1.13 and 7.2.2.15; 1.5 with HA 4.6.1.11; 8.2 with BZFN 3.2 and 3.9; 8.3 with BZFN 3.20–3.24, the proof of 3.21 and Stacks 0FXR; 8.4 with BZFN 3.22; 8.1 with Stacks 09IS; 4.1 with Stacks 0245; 7.3 with GR-I 1.3.8; the gap's route with SGA1 VIII 7.8), none shared beyond what a statement forces (longest run ten words, "is compactly generated and its compact and dualizable objects coincide", BZFN line 972, a one-line statement); largest share SAG, 68 of 209 locators by a pattern count; contents compared with SAG §§6.2.1–6.2.6 and 6.3.1–6.3.4 (SAG lines 17016–17027) and §9.1 (lines 26414–26419): independent. Layer 2 joins 6.2.2 and 6.2.6 with its own 2.4–2.5; Layer 3 joins Appendix D.6 with 6.2.3; Layer 4 (6.3) precedes Layer 5 (6.2.4) because 5.4 needs 4.2; Layer 6 joins 6.2.5, 6.2.6 and 9.1; Layers 1, 7 and 8 have no counterpart there.

## Not verifiable

- Lean elaboration and the one-tactic probe: not available in this lane, and the design has no `Suggested.lean`.
- The two gaps are declared contracts: their statements were checked, not their future proofs.
- Suppliers still in pull requests were read at the heads of the index of 2026-11-16; they can move before they merge.
- Outside this round's sample and untouched by the repair: the source locators of 1.4, 2.2, 3.1–3.3, 5.4, 6.2 and 7.4 were not reopened; for them I rely on the rows of rounds 11 to 15 that carry line numbers. Stacks chapter numbers (29, 35, 36, 96) were not checked against the online numbering, only the tags and the numbers within each chapter.

## Source issues

- **Misprint** in HA at Theorem 7.2.2.15, p. 1240: the source says R is a connective ring and N a connective left A-module, with A again in conditions (2) and (4); it should be R throughout; affects nothing.
- **Misprint** in HA at Proposition 7.2.1.19, p. 1236: the source says R is a ring, M and N are A-modules and the Tor groups are over the homotopy of A; it should be R throughout; affects nothing.
- **Misprint** in SAG at Remark 6.2.2.7, p. 491: the source says the functor X classifies a left fibration and then speaks of quasi-coherent sheaves on F; it should be on X; affects nothing.

## For the human reviewers

- Licence: SAG (68 of 209 locators) and HA are author-posted manuscripts not issued by a publisher, SAG marked as under construction on its title page (SAG line 5); the manifest records both as `certified` from the author's page.

<!-- tauceti-roadmap-review {"agent": "claude", "head": "b86d294db0dc9f277c0fde3d0c12b188bd62977d", "job": "REV-DESIGN-QuasicoherentSheavesOnPrestacks~16", "model": "fable", "worker": "chris-x26"} -->
