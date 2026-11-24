# Review of DeligneLusztigTheory (pull request #3027 at 6f088b9)

**Verdict:** accepted

**Summary.** Accepted: this head repairs both findings of the previous review, and a fresh pass over every statement found no false or unsupported result. Each sampled statement, each Check and each of the 19 theorems of `Suggested.lean` agreed with the values recomputed on both sides, and the file elaborates with only `sorry` warnings. There are one small correction and one format note, neither blocking. Two points are left for the human reviewers: the decision on sections moving to general roadmaps was applied, and the most-cited source (Deligne–Lusztig 1976) could not be read.

## C01 — The module docstring of `Suggested.lean` says the Iwahori–Hecke algebras `H_m(a)` are not at the pins, but the pinned Tau Ceti has them

In the "Not statable" list of `Suggested.lean` (lines 76–77), §2.5 is said to need "Harish-Chandra induction and those algebras, neither at the pins". The second half is not so: `TauCeti.TypeAHeckeAlgebra R q n` is defined in `TauCeti/Algebra/TypeAHeckeAlgebra/Finite.lean`, line 101, with the quadratic relation `T i * T i = (q − q⁻¹) • T i + 1` (line 148), and TypeAHeckeAlgebras §1.1, which §2.5 cites, says that its carriers are Tau Ceti's. An implementer reading the docstring would think two carriers are missing where only one is.

The smallest change is to the reason: §2.5 is not statable because `End_G(R_L^G σ)` needs the Harish-Chandra induction of a cuspidal representation, which is not at the pins; the algebras `H_m(a)` are Tau Ceti's `TauCeti.TypeAHeckeAlgebra`. The case `L = T`, `σ = 1` (Iwahori's theorem, which §2.5 names) involves only the permutation representation on `G/B` and this algebra at the parameter `√q`; whether to state it is the author's choice, since it is a special case of the section's theorem.

## N01 — The page of the Dudas–Michel locator in §1.1 covers the definition but not the models

In §1.1 (line 114), "Definition 14.2 and the models after it, p. 61": the definition is on p. 61 (DudasMichel2015 line 2709), the two alternative models are on p. 62 (DudasMichel2015 lines 2726–2730). "pp. 61–62" would be exact.

## Questions for the author

- §2.12 (d) allows a sign `ε ∈ {±1}`, and `exists_shintaniCorrespondence` asks for `A^d = 1` with `ε = 1 ∨ ε = −1`. For even `d` the sign can be absorbed into `A`; for odd `d` it cannot. Does Shintani's Theorem 1 give `ε = 1` for a suitable extension when `d` is odd? The statement as written is true either way. I could not read Shintani 1976: the sources service found no open copy.

## Previous findings

- R01 — repaired. Scope and ownership (lines 1085–1092) now reads "SmoothRepresentationsOfLocalGroupsPartII §§4.1 and 4.9 … state the split case of §1.6 (a) and of `St_G(1) = |G^F|_p`, and own it", and Downstream consumers lists FiniteReductiveGroups, BaseChangeAndGaloisRepresentationsForUnitaryGroups and OrbitMeasuresOnAdelicGroups. Both sections exist on main under those names (lines 775 and 899 of that README).
- R02 — repaired. `Suggested.lean` now states `exists_cuspidal_of_regular` and `HasCuspidalValues` (§2.4), `exists_regular_of_isCuspidal` and `exists_equiv_irreducibleCharacters_GL` (§2.7), `gaussSum_of_hasCuspidalValues` (§2.11) and `exists_shintaniCorrespondence` (§2.12 (d)); the docstring's "not statable" list is restricted to what needs `R_T^G(θ)`, `ch_κ` or Harish-Chandra induction. One reason in that list is still inexact (C01).
- C01 — repaired: §2.5 and the References now read "§11.1 (the case `L = T`) and §11.3, Lemmas 11.8–11.10 and Theorem 11.11, pp. 48–50".
- C02 — repaired: `IsUpperUnitriangular` is gone; the file imports `TauCeti.LinearAlgebra.Matrix.GeneralLinearGroup.UpperUnitriangular.Basic` and uses `TauCeti.upperUnitriangularGroup`, named under From Tau Ceti.
- N01 — repaired: each of §§2.1, 2.2, 2.4, 2.7, 2.9–2.12 has an "In `Suggested.lean`:" paragraph naming its declarations.
- N02 — repaired: "The sections of this layer are numbered 2.1, 2.2 and 2.4–2.12; there is no §2.3."
- N03 — repaired: the docstring says the file "states the roadmap's headline theorems against the pinned Mathlib and Tau Ceti".

## Verified sound

| Statement | Instances | Values computed (both sides) | Result | Change |
|---|---|---|---|---|
| 1.1 Deligne–Lusztig varieties | `B` rational; `G = T`; `v ∈ U ∩ F(U)` | `Y_U = G^F/U^F`; `Y_U = T^F`; `ℒ(gv) = v⁻¹ℒ(g)F(v) ∈ F(U)`; DudasMichel2015 line 2730: `dim = dim U − dim(U∩F(U)) = ℓ(w)` | agrees | N01 |
| 1.2 characters, Green functions | `w = 1`; unipotent `u` | weight `θ(t)⁻¹` matches DudasMichel2015 line 2715 (`λ(l⁻¹)`); line 2793: `Q(u) = |T^F|⁻¹ L(u, X_U)`, only `t = 1` survives | agrees | none |
| 1.3 character formula | regular `s`; `GL₂` at `a·u`, elliptic `z` | DudasMichel2015 line 2799 same sum; regular: `x⁻¹sx ∈ T ⇔ x⁻¹T′x = T`; `GL₂`: `R_{T_s}θ(au) = θ(a)`, `θ(z) + θ(z^q)` | agrees | none |
| 1.4 inner product | `SL₂(𝔽₂) ≅ S₃`, `T^F ≅ μ₃` | `R(1) = 1 − St`, norm `2`; `R(θ) = −sgn`, degree `−3/3 = −1`, `⟨R(θ), R(θ⁻¹)⟩ = 1`; formula: `[θ′=θ] + [θ′=θ⁻¹]` | agrees | none |
| 1.5 (c), (d) | `f = 1`; `f = St` on `GL₂` | `f = 1`: `|T|⁻¹Σ conj θ = [θ = 1]`; `St`: left `1`, right `((q−1)q + (q−1)(q−2))/(q−1)² = 2` | agrees; hypothesis needed | none |
| 1.6 (b), Checks | `U₃`; `GL₃`, `diag(a,a,b)` | `2 − 1 − 1 + 1 = 1`; flags `3(q+1)`, planes and lines `q+2`: `3(q+1) − 2(q+2) + 1 = q` | agrees | none |
| 1.8 regular character | value at `1`; `GL₂` | needs `|W|⁻¹Σ_w |T_w^F|⁻¹ = |G|_p/|G|_{p′}`; `GL₂`: `½(1/(q−1)² + 1/(q²−1)) = q/((q−1)(q²−1))` | agrees | none |
| 1.10 regular unipotent | `GL₂`, both tori | `(Ind_B 1)(u) = 1`; `(1 − St)(u) = 1 − 0 = 1` | agrees; source unread | none |
| 1.11 Gelfand–Graev | `GL₂`, `θ` regular and `θ = α∘N` | `−⟨Γ, σ_θ⟩ = −1`; `⟨Γ, α∘det − α·St⟩ = 0 − 1 = −1 = ε_Gε_{T_s}` | agrees | none |
| 2.1 classes | `q ∈ {2,3,4,5,7}`, `n ≤ 7`; `n = 2` pairs | `q^n − c_n = 1, 1, q, q, q²+q−1, q²`; pairs `½q(q−1) + ½(q²+q−2) = q² − 1` | agrees | none |
| 2.2 (a), (c), (d) | `n = 2`; `GL₃`; `σ × σ` | `(q−1)·1 + (q−1)² = q(q−1)`; `(q−1)(q²−1), −(q−1), 1`; `ϖ_{2d}/(q^d−1)² = (q^d+1)D`, parts `q^dD`, `D` | agrees | none |
| 2.4 cuspidal characters | `n = 1`; `n = 2` central, `a·u`, elliptic | `θ(a)`; `(q−1)θ(a)`, `−θ(a)`, `−(θ(z)+θ(z^q))`; `−R_{T_{(2)}}(α∘N) = α·St − α∘det` | agrees | none |
| 2.5 Hecke algebras | `GL₂`, `GL₃`; pinned relation | `(T−q)(T+1) = 0`; `1 + 2q(q+1) + q³ = (q²+q+1)(q+1)`; `(√aT)² = (a−1)(√aT) + a` from `T² = (q−q⁻¹)T + 1` | agrees | C01 |
| 2.6 signs | `p_{(1^κ)}`; `⟨p_ν, e_k⟩` | `(−1)^{Σκ(O)(|O|−1)} = (−1)^{n+Σκ}`; `(−1)^{n+Σκ}(−1)^{n−Σℓ(ν_O)} = ∏(−1)^{κ(O)−ℓ(ν_O)}` | agrees | none |
| 2.7 degree formula | `GL₂` all data; label `2·O`, `|O| = d` | `1, q, q+1, q−1`; column: `q^dϖ_{2d}/((q^{2d}−1)(q^d−1)) = q^dD`, as §2.2 (d) | agrees | none |
| 2.8 (a), (b) | `μ = (1^n)` against `τ = (n)`; `n = 2`, four class types | `∏_{i<n}(1−q^i)` both; `(q+1) + (1−q) = 2`; `1 + 1 = 2`; `θ(a)+θ(b) + 0`; `0 + θ(z)+θ(z^q)` | agrees | none |
| 2.10 counting | `q ≤ 7`, `n ≤ 7` | bounds hold in all 35 cases; `c₅ − qc₄ = 1 − q < 0 < q² − q = c₄ − qc₃`; FulmanGuralnick2012 line 401 | agrees | none |
| 2.11 Gauss sums | `n = 1`, `n = 2` | `g₁(θ)`; `(q−1 − (q²−1))Σθ(a)ψ₀(2a) − q(q−1)Σ_{z∉F} = −q(q−1)g₂`, so `w = −qg₂` | agrees | none |
| 2.12 (a), (b), (d) | `GL₂(𝔽₂) ⊂ GL₂(𝔽₄)`; `d = 1`; `n = 1` | fibres `30, 90, 60`, sum `180`; `d = 1`: `Nm = id`, `A = 1`, `ε = 1`; `n = 1`: `χ′ = χ∘N`, `A = 1` | agrees | none |
| `exists_equiv_conjClasses_GL` | `n = 0`; one block `F[X]/(f^m)` | one class, one datum; `dim ker f^k = deg f · min(m, k)` | agrees | none |
| `card_semisimple_conjClasses_GL` | `n = 1`; `n = 0` excluded | `q − 1` both; at `n = 0`: `1` against `1 − 1 = 0` in ℕ, so `hn` is needed | agrees | none |
| `coeff_card_conjClasses_GL_mul_prod` | `N = 1, 2` | `c₁ − q = −1`; `c₂ − qc₁ − q = −1` gives `c₂ = q² − 1` | agrees | none |
| `card_conjClasses_GL_bounds` | `q = 2`, `n ≤ 7` | `c = 1, 3, 6, 14, 27, 60` inside `[2^{n−1}, 2^n]` | agrees | none |
| `isGeneric_and_finrank_of_isCuspidal` | `n = 0, 1`; `ψ₀ = 1` | `n = 0`: dim `1` = empty product, `U = 1`; `n = 1`: dim `1`; `ψ₀ = 1` on `GL₂`: a cuspidal has no `U`-fixed form, so `hψ₀` is needed | agrees | none |
| `isCuspidal_iff_character_mirabolic` | `n = 1` | `P₁ = U = 1`: right side says `dim V = 1`, true of every irreducible, all cuspidal | agrees | none |
| `character_unipotent_of_isCuspidal` | `n = 0`; `GL₂`; `GL₃` | `1`; `q−1`, `−1`; `(q−1)(q²−1)`, `−(q−1)`, `1` | agrees | none |
| `HasCuspidalValues`, `exists_cuspidal_of_regular` | `n = 1`; `n = 2`; `deg P ∤ n` | `θ(a)`; `(q−1)θ(a)`, `−θ(a)`, `−(θ(z)+θ(z^q))`; `P^{n/deg P}` has degree `< n`, clause vacuous; `dim_F ker(u−1) = d·ℓ_d` | agrees with §2.4 | none |
| `exists_regular_of_isCuspidal` | `n = 1`, `n = 2` | every character of `F^×`; the `½q(q−1)` cuspidals against the `½(q²−q)` orbits of regular `θ` | agrees with §2.7 | none |
| `exists_equiv_irreducibleCharacters_GL` | `n = 0`; `GL₂`; transposed diagram | `1 = 1`; degrees `1, q, q+1, q−1`; `q_f^{h} − 1 ≠ 0` as `h ≥ 1`; transposing all `λ(f)` is a bijection, so the row convention cannot falsify it | agrees | none |
| `gelfandGraevCharacter_pairing_self` | `n = 1`; `GL₂` | `Γ₁` regular, norm `q − 1`; `(q−1) + ½(q−1)(q−2) + ½q(q−1) = q² − q` | agrees | none |
| `ncard_cuspidal_characters_GL`, `ncard_generic_characters_GL` | `n = 1, 2` | `q − 1` monic linear `f ≠ X`; `½q(q−1)`; generic `q² − q` | agrees | none |
| `gaussSum_of_hasCuspidalValues` | `n = 1`, `n = 2` | `Σ_xψ₀(x)θ(x) = g₁`; `(−1)^1 q^1 g₂ = −qg₂`; `n(n−1)/2` exact in ℕ | agrees with §2.11 | none |
| `norm_isConj_bijective`, `card_norm_fiber_mul_card` | `d = 1`; `GL₂(𝔽₂) ⊂ GL₂(𝔽₄)` | `Nm = id`, clauses reduce to conjugacy; `30·6 = 1·180`, `90·6 = 3·180`, `60·6 = 2·180` | agrees | none |
| `shintaniLift_isometry`, `shintaniLift_det` | `d = 1`; `n = 0` | identity; `det Nm δ = ∏_i Fr^i(det δ) = N(det δ)`; `n = 0`: `ω(1) = ω(1)` | agrees | none |
| `exists_shintaniCorrespondence` | `d = 1`; `n = 1`; `(δ·Fr)^d` | `e = id`, `A = 1`, `ε = 1`; `χ′ = χ∘N`; `(δFr)^d = Nm(δ)·Fr^d`, consistent with `A W(g) = W(Fr g) A` | agrees with §2.12 (d) | none |
| Layer 1 headlines (1.3, 1.4, 1.7, 1.8, 1.11) | carriers at the pins | no `ℓ`-adic cohomology, Harish-Chandra functors, parabolic induction for `GL_n(𝔽_q)` or cuspidality in Mathlib or Tau Ceti; docstring names each | not statable; named | none |

- Source locators checked against the text: 27. DudasMichel2015: Cor 13.2 (line 2579), Props 13.6, 13.8, 13.9, 13.10, Def 14.2 (2709), Prop 14.3 (2732), Conj-Thm 14.4 (2750), Thm 14.5 (2767), Cor 14.6 (2779), Def 14.7 (2790), Props 14.8, 14.9 (2793, 2796), Prop 14.13 (2865), Prop 15.6 (3012), Rem 15.7 (3024), Prop 15.10 (3073), Cor 15.11 (3092), §§11.1, 11.3 (2001, 2092), Lemmas 11.8–11.10 and Thm 11.11 (2126–2175); pages agree except N01. FulmanGuralnick2012: §3.2 (line 388), Prop 3.5 (2) (401), the semisimple count (414). Geck2017: Example 2.13 (line 300).
- Library declarations opened at the pins. Mathlib: `YoungDiagram.ofPartition` (`Combinatorics/Enumerative/Partition/YoungDiagram.lean`, line 36, rows are the sorted parts), `FiniteField.frobeniusAlgHom` and `coe_frobeniusAlgHom` (`FieldTheory/Finite/Basic.lean`, lines 334, 346), `gaussSum` (`NumberTheory/GaussSum.lean`, line 72). Tau Ceti: `YoungDiagram.hookLength` (`Combinatorics/Young/HookLength/Basic.lean`, arm + leg + 1), `TauCeti.upperUnitriangularGroup` (`LinearAlgebra/Matrix/GeneralLinearGroup/UpperUnitriangular/Basic.lean`, line 108), `TauCeti.TypeAHeckeAlgebra` (`Algebra/TypeAHeckeAlgebra/Finite.lean`, lines 101, 148), `TauCeti.ReductiveCommHopfAlgCat` (`Algebra/AlgebraicGroup/Reductive/Basic.lean`, line 169), `TauCeti.FiniteField.rationalPointsMulEquiv` (`Algebra/AlgebraicGroup/Frobenius/FiniteField.lean`). No cuspidality, mirabolic subgroup or Gelfand–Graev declaration at either pin.
- Cross-roadmap citations resolved at the head or on main, none missing: ReductiveGroups Layers 4, 7, 7C (7C.6), 7a–7e, 7h (7h.1–7h.3), 7i (7i.1–7i.3), 9E and §7.1; EtaleDualityAndPerverseSheaves §7.6 with its four named statements and the parts (a)–(d) cited; EtaleCohomologyFoundations §§F.2.5, F.2.5a, F.2.7, F.3, F.4.5; SchemeAndStackFoundations §§1.1, 1.15; TypeAHeckeAlgebras §§1.1, 1.2; ClassicalArithmeticCompletion §§3.56, 3.59; SmoothRepresentationsOfLocalGroupsPartII §§4.1, 4.9. Every section of this roadmap cited by FiniteReductiveGroups, BaseChangeAndGaloisRepresentationsForUnitaryGroups and OrbitMeasuresOnAdelicGroups exists; none cites §2.3.
- Automatic checks: all passed. Dependency check output: `depcheck: 129 roadmaps, 1442 edges, 0 problem(s)`; no UPWARD, CYCLE or `moved:` line. The pull request changes nothing outside roadmap folders.
- Elaboration: `Suggested.lean` gives 19 `sorry` warnings and nothing else. Elaborated signatures of all 27 declarations compared with the README: the eight definitions drop `[Finite F]` (unused in their bodies), every theorem keeps it; nothing changed.
- One-tactic probe on copies (`rfl`, `simp`, `trivial`, `infer_instance`, `exact?`): none of the 19 theorems closes.
- Numerical recomputation: `c_n(q)` from the product for `q ∈ {2,3,4,5,7}`, `n ≤ 7`.
- Overlap check: read FiniteReductiveGroups, SchurWeyl, SmoothRepresentationsOfLocalGroupsPartII and GlaubermanZStar (nothing shared with the last). Deligne–Lusztig induction and Green's theory: owner DeligneLusztigTheory, FiniteReductiveGroups cites it as *Corollary of:*; its `Suggested.lean` states the two theorems of §§2.4 and 2.7 again in its own namespace, in equivalent form, a matter for that folder's review. Symmetric functions and hook lengths: owner SchurWeyl, cited. The split Steinberg character: owner SmoothRepresentationsOfLocalGroupsPartII §§4.1, 4.9, cited. No open pull request outside this one states Deligne–Lusztig characters, Green's classification or Shintani descent (the affine Deligne–Lusztig varieties of other roadmaps are other objects).

Source independence: 12 passages compared with 3 sources (DudasMichel2015, FulmanGuralnick2012, Geck2017), none shared beyond formulas; largest share DeligneLusztig1976, 15 of about 120 locators, which could not be read; contents compared with DudasMichel2015 §§11, 13–15: independent (§1.5 draws on 14.3, 14.4 and 14.13, §1.7 argues by induction on `dim G` where the notes use `*R_T^G St_G`; the order of §§1.1–1.11 is forced by their *Needs:* lines).

Research link: Layer 1 is Deligne–Lusztig 1976, the basis of Lusztig's classification of the characters of finite reductive groups (DudasMichel2015 §15.1, Theorem 15.13). Layer 2 is Green 1955, Kondo 1963, Shintani 1976 and Howlett–Lehrer 1980 for `GL_n(𝔽_q)`, consumed by FiniteReductiveGroups and BaseChangeAndGaloisRepresentationsForUnitaryGroups. Rests on the README and DudasMichel2015.

## Not verifiable

- DeligneLusztig1976 (Ann. of Math.): the sources service reached only a JSTOR page; every † locator of §§1.1–1.11, including Theorem 9.16 (§1.10) and Theorem 10.7 (§1.11), and those of §§2.4, 2.8, 2.9.
- Green1955 (Trans. Amer. Math. Soc.): the service does not classify the publisher's host; §§2.1, 2.4 (Lemma 6.3), 2.7, 2.8 (Lemma 3.2, Theorems 1, 2, 5), 2.10.
- Kondo1963 and Shintani1976 (J. Math. Soc. Japan): the Project Euclid pages gave the service no PDF; §§2.11, 2.12.
- HowlettLehrer1980 (Invent. Math.): paywalled; §§2.2 (d), 2.5.
- Not attempted this round, with no copy in the sources cache: Carter 1985, Digne–Michel 1991 and 2020, Deligne–Lusztig 1983, S. I. Gelfand 1970, Zelevinsky 1981, Brundan–Dipper–Kleshchev 2001, Fong–Srinivasan 1982, Macdonald 1995 and 1981, Feit–Fine 1960, Iwahori 1964, Lusztig–Srinivasan 1977, Gelfand–Kazhdan 1975, Bernstein–Zelevinsky 1976, Maslen–Rockmore 1997, Curtis 1966, Solomon 1966.
- FulmanGuralnick2012 was read in its arXiv v1; its numbering was not compared with the published version.

Automatic checks set aside as false positives: the listing of elaborated signatures reads the docstring words "class of" (`Suggested.lean` line 99) as a declaration named `of`; the citation resolver reads the four supplier headings "From `TauCetiRoadmap.RepresentationTheory.…`" as Lean names.

## Source issues

- **Misprint** in DudasMichel2015 at the proof of Proposition 14.3, p. 62: the source says `g` lies in `F(g)` inside `P·F(P)`; it should be `g⁻¹F(g) ∈ P·F(P)`; affects nothing.
- **Misprint** in DudasMichel2015 at Corollary 14.6, p. 63: the source says "to" `F`-stable maximal tori; it should be "two"; affects nothing.
- **Misprint** in DudasMichel2015 at Definition 14.2, p. 61: the source names "Lustig" induction and restriction; it should be Lusztig; affects nothing.

## For the human reviewers

- The decision on sections moving from the family to general roadmaps was applied: FiniteReductiveGroups' Deligne–Lusztig and Green sections are stated in full here as Layers 1 and 2, and every section it cites here exists.
- Not tested: the source with the largest share of locators, DeligneLusztig1976 (15 mentions), could not be read legally; its wording and table of contents were not compared with Layer 1.
