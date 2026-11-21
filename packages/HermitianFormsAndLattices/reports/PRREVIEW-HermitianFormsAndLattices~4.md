# Review of HermitianFormsAndLattices (pull request #2882 at d845b7e)
Folder: `TauCetiRoadmap/RiemannHypothesisForDirichletLFunctions/HermitianFormsAndLattices/`
**Verdict:** accepted

**Summary.** Accepted: no finding. Every statement, Check and worked example I recomputed holds (the masses over `ℚ(√−3)` in ranks 1 to 8, the density formulas against the source's general formula, both Landherr statements in `Suggested.lean`), and all 19 locators into Kirschmer's text match the text at the stated theorem and page. The four findings of the previous review are repaired, the first in part: what remains of it is the first of three small corrections (locators still missing at Siegel's main theorem and four other places; two pending supplier contracts of other roadmaps for statements owned here; one hypothesis in 4.4(e) that the cited source does not need). There are two format notes. The human reviewers decide the provenance of the Lean statements and the exclusion of dyadic ramified places.

## C01 — Siegel's main theorem (6.5), Weil's rank-one identity (6.0a), Jacobson's theorem (1.3), the theta inversion (7.1) and the normal forms of norm-maximal lattices (4.4(d), 6.1a(d)) still have no locator at the claim

A reader cannot check the hypotheses of these statements against their sources: for instance whether the mean-value identity of 6.5(a) is stated in [Weil65] for every signature and every `1 ≤ k ≤ n − 1`, as it is here. Each has a complete route in the README, so nothing is unsupported, and Siegel's main theorem is the only one of the four headline theorems left in this state.

The sources appear only in the References, against lists of sections: "[Weil65] … 6.0a, 6.0b, 6.5" (line 3485), "[Braun] … 6.5, 7.1" (line 3489), "[Jacobson] … 1.3" (line 3461), "[GHY] … 4.4, 6.1a(d), 6.3" (line 3500), "[CohenResnikoff] … 7.1" (line 3520); sections 6.5, 6.0a, 1.3 and 7.1 name no source in their text. The smallest change is the one made at 3.1 and 6.2: one clause at the statement with the theorem or section number and the page (in [Weil65] for 6.0a and 6.5(a), in [Braun] for 6.5(b), in [Jacobson] for 1.3, in [GHY] for the three cases of 6.1a(d)).

## C02 — Two other roadmaps ask AdelicAlgebraicGroups and GeometryOfNumbersAndQuadraticArithmetic for statements this roadmap owns, and the Scope section does not say so

If those contracts are filled where they point, 2.1(a) and 3.1–3.2 get a second owner. EndoscopicTransferAndUnitaryTraceComparisonPartII, on main, asks GeometryOfNumbersAndQuadraticArithmetic to "Classify nondegenerate Hermitian spaces over every quadratic extension of nonarchimedean local fields of characteristic zero by dimension and discriminant, including dyadic and ramified extensions" (`TauCetiRoadmap/EndoscopicTransferAndUnitaryTraceComparisonPartII/README.md`, line 888): that is 2.1(a). SelmerIwasawaCohomologyPartII (pull request #1403, its README line 994) and PELModuliPartII (pull request #2453, lines 1474 and 1576) ask AdelicAlgebraicGroups for "the Hasse classification and existence of global hermitian spaces with compatible prescribed local invariants": that is 3.1 and 3.2. Neither named supplier states these today: GeometryOfNumbersAndQuadraticArithmetic has the norm group in odd residue characteristic and the determinant class (its 2.9.1, 2.9.2, lines 586–590), and AdelicAlgebraicGroups has no classification of Hermitian spaces.

One sentence under "Owned here" in the Scope section would settle it: that 2.1(a) and 3.1–3.2 are the statements those two contracts ask for, so that they are repointed here and not built a second time.

## C03 — 4.4(e) states that the norm-maximal lattices form one genus only when no dyadic place ramifies, while the source cited for it in the same section has no such hypothesis

The opening of 4.4 says "that they form one genus is [Kirschmer], Lemma 3.5.2, p. 43, which refers to [Shimura64], Proposition 4.13" (lines 1173–1174), and that lemma is stated for every fractional ideal `𝔞` and every Hermitian space over a number field, with no condition at the places above `2` (Kirschmer line 1529). Target (e) (lines 1188–1189) proves it only "if no dyadic place of `F` ramifies in `E`", because its route passes through the local conjugacy of 4.4(c). An implementer who follows (e) gets a weaker theorem than the one the section cites, and 6.3(b) inherits the hypothesis.

Either state the norm-maximal half of (e) without the hypothesis, with [Shimura64], Proposition 4.13, as its locator (the scale-maximal half keeps it), or say in one clause that the source's statement is more general than the target.

## N01 — Two attributions to [Kirschmer] are a little wider than what its statements say

In 2.1 (line 547) "these are … Theorem 3.2.3 and Corollary 3.2.4" covers (a) and the isotropy criterion of (c); that both classes occur and that a binary space represents every `c` are not stated there (the second is used inside the proof of 3.2.3, for anisotropic planes). The source's chapter assumes a complete discretely valued field with finite residue field (Kirschmer lines 793–796), not characteristic zero, so "In characteristic zero" is narrower than the source. In 5.4 (line 1811) the chains of Proposition 5.2.5 are for neighbours at one prime `𝔓` of `E` and need an extra hypothesis at a split place; the README's `w`-neighbours allow both primes, and (a) is its own statement.

## N02 — In the third Check of 6.3 the `1/72` in "`2·(1/72) = 1/36`" is the mass of `O_E²` in `⟨1, 1⟩`, not the norm-maximal mass `1/72` in `⟨1, 2⟩` of the clause before it

Lines 2717–2720: the lattice `L'` of 5.6's Check lies in `⟨1, 1⟩`, so the sentence is true, but it reads as if it used the mass just computed for another space. "has mass `2·mass(O_E²) = 1/36`" would say which.

## Earlier findings

- R01 (no exact locators): partly repaired. Landherr's theorem (lines 684–686, 719–722), the local classification (546–547), Jordan splittings (1062–1063), 4.3 (1155–1157), maximal lattices (1172–1174), special genera (1786–1787), neighbours (1811–1813), `τ(U(V)) = 2` (2205–2206), local densities (2315–2316, 2425–2426, 2556–2557), the mass formula (2636–2638) and its closed form (2690–2692) now carry locators, all verified. The remainder is C01.
- R02 (split spaces owned by MetaplecticAutomorphicForms §3.2a): repaired. "In characteristic `≠ 2` the decomposition `V ≅ A ⊕ A^∨` and the group of isometries `GL(A)` … are MetaplecticAutomorphicForms §3.2a; 0.1 adds characteristic two and the isomorphism of group schemes" (lines 231–233), with the Needs line, the Scope entry (3237–3240) and the supplier contract (3406–3411), which agrees with §3.2a on main (its lines 564–568).
- R03 (unitary mass also planned in AbelianSchemesAndArithmeticModuliPartII F5.7): repaired by the second option offered. "The mass of the unimodular positive-definite Hermitian lattices over an imaginary quadratic field of class number one … are AbelianSchemesAndArithmeticModuliPartII F5.7's; 5.5 and 6.2–6.3 are kept as the general forms" (lines 3262–3266).
- R04 (false sentence in the route of 2.1): repaired. "Suppose it were. Being closed in `F`, stable under multiplication and containing `1`, it would contain every `m·1` … and hence, being closed, `−1 = lim_k (p^k − 1)·1`" (lines 550–553).
- C01 (undeclared name for §7.5c): repaired (lines 1885, 3423). C02 (out-of-date validation sentence in the description): repaired.

## Verified sound

| Statement | Instances tried | Values computed (each side) | Result | Change |
|---|---|---|---|---|
| 1.5 finite fields | `q = 2`, `n = 2`; general sign | `2·3·3 = 18`; `P_2(−q) = (q²−1)(q²+q)`; sign `(−1)^{n(n−1)/2 + n(n+1)/2} = (−1)^n` | holds | none |
| 2.3 split places | `n = 3`; `⟨1, 1⟩` | Witt index `1`, kernel `⟨1⟩`; `−1 = N((1, −1))`; `GL_3(F_v)` not compact | holds | none |
| 2.4 Witt index and sign | `H^r`; `⟨1, 1⟩/ℚ(i)` | `(−1)^{r(2r−1)}(−1)^r = 1`; `ε_∞ = −1`, `ε_2 = η_2(−1) = −1`, odd `p`: `+1`; product `1` | holds | none |
| 4.4 maximal lattices | split `n = 1`; ramified; `ℚ_2(i)`; source | 6 integral pairs, 3 unimodular; `Tr(𝔓^{−1}) = O_F`; `Tr((1−i)(a+bi)/2) = a+b`; Def. 2.3.3 (7) is the norm notion | holds; (e) narrower than source | C03 |
| 4.9 gluing | inert `q = 2`; `ℚ_3(√−3)`; `ℚ_2(i)` | `#O`: `3`, `6`, `18`; units of `O_E/3` all of norm `1`: `6`, and `−1` not attained; `{1, i}`: `2` | holds | none |
| 4.12 short dual vectors | general | `N⟨x, x⟩ ≥ (d_E²q)^{−1}`; `(2fk)²·rd_E²/(2f) = 2f·k²·rd_E²` | holds | none |
| 4.13 short generators | `ℚ(√−5)`, `M = (2, 1+√−5)` | cross terms of `⟨φ_1(x), φ_{−1}(y)⟩` cancel in conjugate pairs; `n^{3/2}ρ·rd·B`; bound `16·√20·2 = 143.1` | holds | none |
| 5.4 neighbours | split, position `(1, −1)`; source | `L/(L ∩ M)` of length `2`; Def. 5.2.1 uses one prime, Prop. 5.2.5 has a split hypothesis | holds | N01 |
| 5.6 index formula | `ℚ(√−3)`, `L`, `L'` at `2` | 5 lines of `𝔽_4²`, 3 isotropic, 2 not: index `2`; orders `36`, `72` | holds | none |
| 5.8 unimodular genera | `ℚ(√−15)`; `ℚ(ζ_12)/ℚ(√3)` | `η_3(2) = (2/3) = −1`; `∏_v η_v(−1) = (−1)^{[F:ℚ]}`; `144 = 12²·1` | holds | none |
| 6.0a rank-one identity | exponents | `δ`: `2(r−i) − 2(i−1) + 2(r−1) + 2(n−2r) + 2 = 2n−4i+2`; `t_j^{−2j(n−j−1)}`; `2k²−2nk+n`: `2−n` at `k=1`, `n−n²/2` at `k=n/2` | holds | none |
| 6.0b `τ(U(V)) = 2` | cone, `n′ = 3`, `q = 5, 2`; source | `(q³−1)(q²+1) = 3224`, `248`, `49/625`; `7/16`; Kirschmer 4.2.3: `τ(G) = 2` when `dim_K E = 2` | holds | none |
| 6.1 local densities | ramified `n = 1`; `𝔓`-modular plane | kernel of the norm: `2q^N`, so `2`; `1944/3⁴ = 157464/3⁸ = 24`; `12754584/3⁸ = 1944`; `8/27` | holds | none |
| 6.4 ratios of masses | `ℚ(√−3)`, `n = 2..6`; `n = 1` | `0.08333, 0.05556, 0.04167, 0.03333, 0.0515873 = 13/252`; displayed expression `1/12` against `1/6` | holds | none |
| 6.4c weighted count | exponents; Check | `n`: `l/2 + (j+l)/2 + (s+l+2)/2 + 2s = j/2 + (5s+2+3l)/2`; `N_0`: `(3s+l+2)/2`; `24 + 18 = 42` | holds | none |
| 3.1 Landherr, Hasse principle (Lean) | `ℚ(√−3)`: `⟨1, 1⟩`, `⟨1, 2⟩`; `n = 0` | `(2, −3)_3 = −1`, `2` inert of odd valuation; `n = 0`: both sides true | holds; README and Lean agree | none |
| 3.2 Landherr, existence (Lean) | `⟨1, 2⟩`; `n = 0`; split and complex places | non-norm places `{2, 3}`: even; `n = 0`: count `0`; every determinant a norm at split places | holds; README and Lean agree | C02 |
| 6.3 mass formula | `O_E^n`, `n = 1..8`; `⟨1, 2⟩`; source | `1/mass`: `6, 72, 1296, 31104, 933120`; `×235146240 = 13`; `×48372940800 = 41`; `36`, `72`; exponent `m(m−(−1)^m)/4 + m/2` | holds | N02 |
| 6.5 Siegel's main theorem | `O_E²`, `T = 1`, `T = 4` | `(4π²/3)(6/π²)(9/8)(4/3) = 12`; `6+6+36+36 = 84`, `72` primitive; `64·21/16`, `64·9/8` | holds | C01 |
| 2.1 local classification | `ℚ_3(i)`; characteristic `p`; source | `−1 = lim (p^k − 1)`; index `2` from finite local reciprocity in every characteristic; Thm 3.2.3: `⟨1, …, 1, d⟩` | holds | C02, N01 |
| 0.1 split clause | MetaplecticAutomorphicForms §3.2a | same `A ⊕ A^∨`, pairing `(ℓ(y), εk(x))`, group `GL(A)` by `(g, (g⁻¹)^∨)` | cited | none |
| 6.1a(b), (d) | `ℚ_3(√−3)`; general `q` | `8/3`, `4/3`, `16/9`; `λ`: `1/2`, `(1+q^{−m})/(q^m+1) = q^{−m}`, `q^{−n/2}(q^n−1)/(2(q+1))` | holds | none |
| 6.1d(d) | `⟨1, 2, 4⟩`, `⟨3, 9⟩`, `⟨1, 9⟩`; source | `2⁵(3/2)² = 72`, `108`; `3⁵(4/3)² = 432`; `9·(2/3)² = 4`; Kirschmer 4.2.4: `Σ s_im_i² + 2s_im_im′_i = w(L)` | holds | none |
| 4.10 sublattices | `ℤ[i]²` | `3, 7, 6+6, 15, 10, 3·12 = 36`; bounds `i³` | holds | none |
| 4.11 two subspaces | `ℚ(i)`, `L = O_E ⊕ 2O_E` | index `64/4 = 16`; `64·64 = 16·16²` | holds | none |
| 7.1 theta inversion | `ℤ[i]`, `z = i` | covolume `√4 = 2`; Jacobi with `t = 2` | holds | none |

- Source locators checked against the text: 19, all in Kirschmer (Theorems 2.4.1, 3.2.3, 3.3.3, 3.3.18, 4.2.3, 4.2.4, 5.4.14; Corollary 3.2.4; Algorithm 3.3.2; Propositions 3.3.5, 4.2.7 (3), 5.2.4, 5.2.5; Remark 3.4.2 (3); Definitions 2.3.3 (7), 4.2.2, 5.2.1; Lemmas 3.5.2, 4.2.5); statement and printed page agree in each.
- Mathlib: 35 names of the supplier contract resolved with `#check` at the pin, for example `traceForm_nondegenerate`, `groupCohomology.exists_div_of_norm_eq_one`, `Submodule.exists_smith_normal_form_of_le`, `NumberField.dedekindZeta_residue`.
- Tau Ceti at the pin: `LinearAlgebra/IntegralLattice/Discriminant/Group.lean:109`, `Discriminant/Bilinear.lean:96, 128, 160, 192`, `Overlattice/Graph.lean:94, 116, 158, 337`, `Overlattice/Isotropic.lean:353`, `Overlattice/Dual.lean:265`, `NumberTheory/QuadraticForm/Global/SignPrescription.lean:154`, `Global/ProductFormula.lean:67`, `NumberTheory/NumberField/Global/Approximation/Weak.lean:208`, `ClassFieldTheory/Global/HasseNorm/Basic.lean:154, 170`.
- Cross-roadmap citations resolved again at this head: MetaplecticAutomorphicForms §3.2a, AbelianSchemesAndArithmeticModuliPartII F5.7, DiscreteSeriesCoefficientsAndAutomorphicMetrics §§7.5a, 7.5c, OrbitMeasuresOnAdelicGroups §§2.6, 3.4a (six slugs), GeometryOfNumbersAndQuadraticArithmetic (15 names), AdelicAlgebraicGroups (six slugs), ReductiveGroupsPartII RG2.0a, ClassFieldTheory Layer 6, FiniteGroupInvariants 10.2, AutomorphicFormsOnReductiveGroups 7.4–7.5.
- Dependency check: `depcheck: 171 roadmaps, 1995 edges, 0 problem(s)`. Every automatic check passed; no change outside the folder and the family index.
- Elaboration of `Suggested.lean`: two `sorry` warnings and nothing else. `#check @name` for both declarations compared with README 3.1 and 3.2: no binder lost, same generality, file unchanged.
- Padding probe: `first | rfl | simp | infer_instance | decide | trivial` closes neither theorem.
- Computations in plain Python: the masses of 6.3 for `n = 1, …, 8`, the ratios of 6.4, the closed forms of 6.4a and the product of 6.5.

Overlap check: read OrbitMeasuresOnAdelicGroups, ThetaLiftsForDefiniteUnitaryGroups, ThetaKernelsForUnitaryDualPairs, IntegralLattices, BesselPoincareSeriesAndGramBounds, GeometryOfNumbersAndQuadraticArithmetic, EndoscopicTransferAndUnitaryTraceComparisonPartII, AdelicAlgebraicGroups. Hermitian carriers, integral Hermitian lattices and unramified densities: GeometryOfNumbersAndQuadraticArithmetic, cited. Tamagawa and orbit measures: AdelicAlgebraicGroups and OrbitMeasuresOnAdelicGroups, cited (`τ(U(1)) = 2` is a Check there, a target here). Discriminant forms and gluing over `ℤ`: IntegralLattices and Tau Ceti, compared. Split Hermitian spaces: MetaplecticAutomorphicForms §3.2a, cited. The unitary mass over imaginary quadratic fields of class number one: AbelianSchemesAndArithmeticModuliPartII F5.7, recorded in the Scope section. The local and global classification, `τ(U(V)) = 2`, Siegel's main theorem and theta series: owned here; the theta roadmaps consume them, and the pending contracts of C02 point elsewhere.

Source independence: 24 passages compared with 1 source (Kirschmer), none shared; largest share Kirschmer, 19 of 30 in-text locators; contents compared with Kirschmer: independent (Layer 3 ↔ its 2.4 and 3.4, Layer 2 ↔ 3.2, Layer 4 ↔ 2.3, 3.3, 3.5, Layer 5 ↔ 5.2, 5.4, Layer 6 ↔ 4.2, not in its order; Layers 0, 1, 7 have no counterpart). The other cited texts were not read (below).

Research link: Layers 5–6 state Siegel's mass formula for Hermitian lattices as in Kirschmer 2016 (Theorem 4.2.3, Proposition 4.2.7), with the local densities of Gan–Yu 2000, and Weil's `τ(U(V)) = 2` (Weil 1965); Layer 3 is Landherr 1936. The family's theta-lift roadmaps consume them. Rests on Kirschmer's text and the README's Downstream consumers.

## Not verifiable

- [Weil65] (6.0a, 6.0b, 6.5): the DOI resolves only to a paywalled page; the statements were checked by computation and through Kirschmer, Theorem 4.2.3.
- [GHY], [HashimotoKoseki], [Feit]: no legal copy was found at the previous review; not tried again. The values they are cited for (6.1a(d), the Checks of 6.3) were recomputed.
- [Landherr], [Jacobowitz], [Shimura64], [GanYu], [Scharlau]: read only through the theorem numbers Kirschmer quotes, which match the README's.
- [Nikulin], Proposition 1.6.1, and O'Meara 71:19a, §91: not read; the Tau Ceti declarations they are attached to were opened at the pin.
- [Braun], [Jacobson], [Shimura97], [Hironaka], [CohenResnikoff], [Gross], [Knus], [Schiemann], [Weil61], [Minkowski], [Tate], [Ono], [Siegel]: no locator to check (C01 for the first two).
- [Cho]: its text is at hand, but the README gives no locator into it.

## Source issues

- **Misprint** in Kirschmer at Proposition 3.3.5 (3), p. 32: the source says the last diagonal entry has the exponent `i(1 − r)/2`, with `r` undefined there; it should be `i(1 − m)/2`, `m` the rank, as in item 1; affects nothing.
- **Misprint** in Kirschmer at the proof of Theorem 3.3.6, p. 34: the source says `det(L_1)` is congruent to `det(L_1)` and takes their quotient, three times; it should be `det(L_1)` against `det(L′_1)` (and `L_i`, `L′_i`); affects nothing.

## For the human reviewers

- Provenance: the description says the family follows a formal Lean proof by Levent Alpöge announced on 20 November 2026. I could not compare `Suggested.lean` with that formalisation; whether its two statements are adapted from it is for you to read.
- Scope: explicit results exclude the dyadic places that ramify in `E` (4.1, 4.2(b), (d), 4.4(c)–(e), 6.1a(b), (d), 6.1d, 6.3(a), (b)); the Scope section says so (README lines 3253–3254). The general statements 6.1, 6.2 and the first formula of 6.3 cover every place.
- Licence: the source that carries 19 of the 30 locators, Kirschmer's Habilitationsschrift (2016), is read from its author's page; the journal articles it quotes (Jacobowitz, Shimura, Gan–Yu) and [Weil65] were not read.
