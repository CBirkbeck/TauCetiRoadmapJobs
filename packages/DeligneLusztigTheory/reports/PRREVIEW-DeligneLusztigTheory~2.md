# Review of DeligneLusztigTheory (pull request #3027 at e47c8ec)

**Verdict:** needs changes

**Summary.** The mathematics holds up under recomputation: every sampled statement, every Check and every theorem of `Suggested.lean` agreed with the values computed on both sides, and the file elaborates with only `sorry` warnings. Two findings block acceptance. First, the split case of the Steinberg theorem (§1.6) already has an owner on main, SmoothRepresentationsOfLocalGroupsPartII §§4.1 and 4.9, which the README wrongly calls a consumer of §1.6. Second, Green's classification of the characters of `GL_n(𝔽_q)` (the cuspidal characters of §2.4 and the degree formula of §2.7) can be stated at the pins but is missing from `Suggested.lean`, whose docstring says it cannot be stated. There are also two small corrections and three format notes. One point is left for the human reviewers: the source with the largest share of citations could not be read.

## R01 (P2) — The split case of §1.6 already has an owner on main, SmoothRepresentationsOfLocalGroupsPartII §§4.1 and 4.9, which the README presents as a consumer of §1.6

The scope paragraph (lines 1047–1049) says that SRU.4.1 "is a consumer of §1.6, not a second supplier". The Downstream consumers section (lines 1024–1026) lists it as this roadmap's only consumer. An implementer reading this would expect SRU.4.1 to wait for §1.6, and the same theorem would be built twice.

This is not what main says. SmoothRepresentationsOfLocalGroupsPartII §4.1 states that for a split connected reductive group over `𝔽_q` the alternating sum `Σ_J (−1)^{|J|} Ind_{P_J} 1` is the character of an irreducible representation of degree `q^N`. Its §4.9 is the target that proves this through Solomon's Coxeter-complex identity. The *Needs:* line of §4.1 cites ReductiveGroups Layer 7, SmoothRepresentationsOfLocalGroups SR.1, ReductiveGroupsPartII RG2.3 and SRU.4.9, and never this roadmap. This pull request does not change that roadmap. It also could not consume §1.6: it is on main and stands at position 318 of the merge order, while this roadmap stands at 444.

For split `G` with the `q`-Frobenius, `R_{L_J}^G(1) = Ind_{P_J} 1` and `|G^F|_p = q^N`. So in that case §1.6 (a) and the first clause of (b) restate SRU.4.1/4.9.

The smallest change is to rewrite that scope sentence. It would say that SmoothRepresentationsOfLocalGroupsPartII §§4.1 and 4.9 state the split `q`-Frobenius case of §1.6 (a) and of `St_G(1) = |G^F|_p`, and that §1.6 cites them for that case and extends it to non-split groups and Steinberg endomorphisms. Add that citation to the *Needs:* line of §1.6. In Downstream consumers, replace SRU.4.1 with the roadmaps that do cite this one: FiniteReductiveGroups, BaseChangeAndGaloisRepresentationsForUnitaryGroups and OrbitMeasuresOnAdelicGroups.

## R02 (P2) — Green's classification of the characters of `GL_n(𝔽_q)`, the headline of Layer 2, can be stated at the pins but is missing from `Suggested.lean`, whose docstring says it cannot be

`Suggested.lean` is the roadmap's acceptance test. As written it tests Layer 2 on counts, on the mirabolic criterion and on Shintani's norm map, but not on its main theorem. The module docstring (lines 42–47) gives the reason: §§2.4–2.8 cannot be stated because `σ_θ` and `χ_λ` are defined through `R_T^G(θ)`. Both theorems, however, have existence forms that need no Deligne–Lusztig character.

- **The degree formula of §2.7.** It can be stated as a bijection from the irreducible characters of `GL (Fin n) F` onto the Green data of weight `n` with `χ(1) = ϖ_n(q) ∏_f q_f^{n(μ_f)} / H̃_{μ_f}(q_f)`, where `q_f = q^{deg f}`. The Green data are the index type already used in `exists_equiv_conjClasses_GL`. Two short definitions are needed: the hook product over the cells of Mathlib's `YoungDiagram.ofPartition μ`, with hook lengths from `YoungDiagram.rowLen` and `YoungDiagram.colLen`, and `n(μ)`, the sum of the row indices of the cells. I elaborated exactly this statement against the pinned Mathlib; the only message was the `sorry` warning.
- **§2.4 in existence form.** In this form, each regular character of the units of a degree-`n` extension gives an irreducible cuspidal representation of dimension `ϖ_{n−1}(q)` with Green's values, and every cuspidal representation arises this way. FiniteReductiveGroups' `Suggested.lean` in this same pull request already states it at the same pins as `exists_cuspidal_of_regular` and `exists_regular_of_isCuspidal`, with `HasCuspidalValues`, as a consumer of this roadmap's §2.4. That file elaborates.
- **§2.11.** Kondo's formula would allow the same treatment; its carriers, Mathlib's `gaussSum`, `AddChar`, `MulChar` and `Algebra.trace`, are at the pin.

The smallest change has three parts:
1. State §2.7's degree formula and §2.4 in these forms, with the two definitions.
2. Restrict the docstring's "not statable" line to what really needs `R_T^G(θ)` or Harish-Chandra induction: the maps `ch_κ`, uniformity, `J_n` and §2.5.
3. Then the description's sentence that `Suggested.lean` "states what Mathlib can express of Layer 2", and the same claim in How to read the build (lines 38–40), become true.

## C01 — The Dudas–Michel locator for §2.5 names the wrong subsection

In the source paragraph of §2.5 (line 646) and in the References (line 1197), Lemmas 11.8–11.10 and Theorem 11.11 are placed in "§11.1". In the notes, §11.1 is the first example: the case `L = T`, for split `(G, F)` with `q(q − 1)` invertible (DudasMichel2015 line 2001). The lemmas and the theorem are in §11.3, "The Hecke algebra H(L, N)", pp. 48–50 (DudasMichel2015 lines 45 and 2126–2175).

Write "§11.1 (the case `L = T`) and §11.3, Lemmas 11.8–11.10 and Theorem 11.11, pp. 48–50".

## C02 — `IsUpperUnitriangular` repeats a definition the pinned Tau Ceti already has

`Suggested.lean` line 129 defines the upper unitriangular elements of `GL_n(𝔽_q)` itself. The pinned Tau Ceti has the same subgroup as `TauCeti.upperUnitriangularGroup (Fin n) F`, built on `Matrix.IsUpperUnitriangular`, which requires upper triangular with every diagonal entry `1`. See `TauCeti/LinearAlgebra/Matrix/GeneralLinearGroup/UpperUnitriangular/Basic.lean`, line 108, and `TauCeti/LinearAlgebra/Matrix/Triangular.lean`, line 90. The two conditions agree entry by entry.

Importing `TauCeti.LinearAlgebra.Matrix.GeneralLinearGroup.UpperUnitriangular.Basic` and using that subgroup would give implementers its API. It would also make this file agree with FiniteReductiveGroups' file, which imports the same module. Name it under From Tau Ceti.

## N01 — None of the 22 declarations of `Suggested.lean` is named in the README

A reader of §§2.1, 2.2, 2.9, 2.10 and 2.12 cannot tell which statements have a Lean form. Name each declaration at its item.

## N02 — Layer 2 has no §2.3

The numbering runs 2.2, 2.4. A line saying that there is no §2.3 would stop readers from looking for it. Renumbering would break the citations from FiniteReductiveGroups and BaseChangeAndGaloisRepresentationsForUnitaryGroups.

## N03 — The module docstring describes the file as suggested forms for milestones

The docstring of `Suggested.lean` should say that the file states the roadmap's headline theorems against the pinned libraries.

## Questions for the author

- §2.12 (d) allows a sign `ε ∈ {±1}`. Is that because, when `d` is odd, an extension can only be changed by a `d`-th root of unity? Or does Shintani's Theorem 1 give `ε = 1` for a suitable extension? I could not read Shintani1976 legally.

## Verified sound

| Statement | Instances | Values computed (both sides) | Result | Change |
|---|---|---|---|---|
| 1.2 DL character, Green function | `B` rational (`w = 1`); `G = T`; `GL₂` | Fixed points of `(g,t)` on `G^F/U^F` give `Ind_{B^F}θ`; `θ(t)` for `θ(t)⁻¹` gives `Ind θ⁻¹`; DudasMichel2015 line 2713 uses `λ(l⁻¹)` | agrees | none |
| 1.3 character formula | regular `s`; `GL₂` elliptic `z` | DudasMichel2015 line 2799: same sum over `h⁻¹sh ∈ T`; regular `s`: `Q^{T′}_{T′}(1) = 1`; `GL₂`: `R_{T_s}θ(z) = θ(z) + θ(z^q)` | agrees | none |
| 1.4 inner product | `SL₂(𝔽₂)`, `T^F ≅ μ₃` | `W_{G^F}(T) = ℤ/2` by inversion: `[θ′=θ] + [θ′=θ⁻¹]`, `2` at `θ = 1`; DudasMichel2015 Cor 14.6 same count | agrees | none |
| 1.5 (b), (d) | `GL₂`, `L = T₁`; `f = St` | (b) index set `W`, order 2, `*R(Ind_B 1) = 2·1`; (d) left `1`, right `((q−1)q + (q−1)(q−2))/(q−1)² = 2` | agrees; hypothesis needed | none |
| 1.6 Steinberg (R01) | `U₃(𝔽_q)`; `GL₃` at `diag(a,a,b)`; split `G` | `⟨St,St⟩ = 2−1−1+1 = 1` (5 with all double cosets); `St(s) = 3(q+1) − 2(q+2) + 1 = q`; split case is SRU.4.1/4.9 | true; second owner | R01 |
| 1.7 degree | `GL₂`, `T_s` | `ε_Gε_T(q²−1)(q−1)/(q²−1) = −(q−1) = deg(1 − St)`; DudasMichel2015 Prop 15.6 same formula | agrees | none |
| 1.8 regular character | at `1`, at `u ≠ 1` | DudasMichel2015 Cor 15.11 (sum over `F`-classes, `|C_W(wF)|⁻¹`) equals `|W|⁻¹Σ_{w∈W}`; `|G|_{p′}St`: `|G|` at 1, `0` else | agrees | none |
| 1.9 cuspidality | Coxeter torus of `GL_n` | `xTx⁻¹ ⊂ L`, `x ∈ G^F`, puts `T` in `x⁻¹Lx`; `𝔽_{q^n}^×` irreducible on `F^n`: Mackey index set empty | agrees | none |
| 1.10 regular unipotent | `GL₂`, `T₁` and `T_s` | `Q_{T₁}(u) = 1` (one fixed point on `ℙ¹(𝔽_q)`); `Q_{T_s}(u) = (1 − St)(u) = 1` | agrees; source unread | none |
| 1.11 Gelfand–Graev | `GL₂`; the induction step | `⟨Γ, R_{T_s}θ⟩ = −1` for regular `θ` and for `α∘N`; step: `(−1)^{|S/F|}⟨Γ,R⟩ = ε_Gε_T(−1)^{|S/F|}` | agrees | none |
| 2.1 classes | `q ∈ {2,…,11}`, `n ≤ 6` | product gives `q^n − c_n = 1, 1, q, q, q²+q−1, q²`; `GL₂` families sum `q² − 1`; pairs `½q(q−1) + ½(q²+q−2)` | agrees | none |
| 2.4 cuspidal characters (R02) | `n = 1, 2`; regular unipotent; `θ = α∘N` | `(−1)^{n−1}∏(1−q^i) = ϖ_{n−1}(q)`; `(−1)^{n−1}` at regular unipotent; `α·St − α∘det` is not a character | true; statable, absent | R02 |
| 2.5 Hecke algebras (C01) | `GL₂`, `GL₃`, `σ = 1`; TypeAHeckeAlgebras §1.1 | `(T_s−q)(T_s+1) = 0`; `1 + 2q(q+1) + q³ = (q²+q+1)(q+1)`; `T² = (√a − 1/√a)T + 1` gives `(√aT−a)(√aT+1) = 0` | agrees | C01 |
| 2.7 degree formula (R02) | all `GL₂` data; `GL₃`, `(2,1)` | degrees `1, q, q+1, q−1`, `Σ deg² = |GL₂|` for `q ≤ 7`; `(2,1)`: `qϖ₃/((q³−1)(q−1)²) = q(q+1)` | true; statable, absent | R02 |
| 2.8 (b) `J_n` recursion | `n = 2`, four class types; `n = 3` central | `n=2` central `(q+1) + (1−q) = 2`; `n=3`: `(q²+q+1) + (q²+q+1)(1−q) + (1−q)(1−q²) = 3` | agrees | none |
| 2.11 Gauss sums | `n = 2` | central `(q−1)Σθψ₀(2a)`, non-semisimple `−(q²−1)·` same, elliptic `−q(q−1)Σ_{z∉F}`; total `−q(q−1)g₂`; `w = −qg₂` | agrees | none |
| 2.12 (a), (b) Shintani | `GL₂(𝔽₂) ⊂ GL₂(𝔽₄)`; `d = 1` | fibres `180/6·(1,3,2) = 30, 90, 60`, total 180; `Nm δ = x⁻¹Fr^d(x)`, `γ = Fr^d(x)x⁻¹` is `Fr`-fixed | agrees | none |
| `exists_equiv_conjClasses_GL` | `n = 0`; `F[X]/(f^m)` | `n=0`: one class, one datum, both kernel dims `0`; `dim ker f^k = deg f · min(m,k)` | agrees | none |
| `card_semisimple_conjClasses_GL` | `n = 0` (excluded), `1`; `GL₃(𝔽₂)` | `n=1`: `q−1` both; `n=0` would give `1` against `0` in ℕ; `GL₃(𝔽₂)`: `4 = 8 − 4` | agrees | none |
| `coeff_card_conjClasses_GL_mul_prod` | `N = 1, 2`; `q ≤ 11`, `N ≤ 6` | `N=1`: `c₁ − q = −1`; `N=2`: `c₂ − qc₁ − q = −1` gives `q² − 1`; numerics agree | agrees | none |
| `card_conjClasses_GL_bounds` | `q = 2` | `c = 1, 3, 6, 14, 27, 60` inside `[2^n − 2^{n−1}, 2^n]`; FulmanGuralnick2012 line 401 | agrees | none |
| `isGeneric_and_finrank_of_isCuspidal` | `n = 0, 1`; `GL₂(𝔽₂) ≅ S₃`; `ψ₀ = 1` | dimension `1` = empty product; sign is cuspidal, dim `1 = q−1`, `ψ(u) = −1`, generic; `ψ₀ = 1` breaks genericity | agrees | none |
| `isCuspidal_iff_character_mirabolic` | `n = 1`; `GL₂(𝔽₂)` | `n=1`: `P₁ = U = 1`, right side `1 = dim V`; `GL₂(𝔽₂)`: `P₂ = U`, sign gives `ψ`, trivial and `St` do not | agrees | none |
| `character_unipotent_of_isCuspidal` | `GL₂`, `GL₃`, `GL₃(𝔽₂)` | `ℓ = 2, 1`: `q−1, −1`; `ℓ = 3, 2, 1`: `(q−1)(q²−1), −(q−1), 1`; degree-3 characters of `GL₃(𝔽₂)`: `−1, 1` | agrees | none |
| `gelfandGraevCharacter_pairing_self` | `n = 0, 1`; `GL₃(𝔽₂)` | `Γ₁` regular, norm `q−1`; `GL₃(𝔽₂)`: `8+7+3+3 = 21 = 168/8`, norm `4`; `n=0` would give `1` against `0` | agrees | none |
| `ncard_cuspidal_characters_GL` | `n = 1, 2`; `GL₃(𝔽₂)` | `q−1 = #{X − a}`; `½q(q−1)` irreducible quadratics; `2 = (8−2)/3` | agrees | none |
| `ncard_generic_characters_GL` | `GL₂`; `GL₂(𝔽₂)` | `(q−1) + ½(q−1)(q−2) + ½q(q−1) = q² − q`; `GL₂(𝔽₂)`: sign and `St`, `2` | agrees | none |
| `norm_isConj_bijective` | `d = 1`; general `d` | `d=1`: `Nm = Fr = id`, clauses become conjugacy; `x^{q^d} = x` so `Fr^d = id`; `Fr`-conjugates have conjugate norms | agrees | none |
| `card_norm_fiber_mul_card` | `GL₂(𝔽₂) ⊂ GL₂(𝔽₄)` | `30·6 = 1·180`, `90·6 = 3·180`, `60·6 = 2·180` | agrees | none |
| `shintaniLift_isometry` | general; `d = 1` | `Σ_δ = Σ_c |c|(|G′|/|G|) f(c) conj f′(c)`; `d = 1`: identity | agrees | none |
| `shintaniLift_det` | `n = 0`; general | `det Nm δ = ∏ Fr^i(det δ) = algebraMap(norm(det δ))` (`FiniteField.algebraMap_norm_eq_prod_pow`); `n = 0`: `1 = 1` | agrees | none |
| Layer 1 headlines (1.3, 1.4, 1.7, 1.8) | carriers at the pins | no reductive `G^F`, Deligne–Lusztig variety or compactly supported `ℓ`-adic cohomology in Mathlib or Tau Ceti; docstring says so | not statable; named | none |
| `IsUpperUnitriangular` (C02) | definition | `u_ij = δ_ij` for `j ≤ i` is Tau Ceti's upper triangular with unit diagonal, entry by entry | same object | C02 |

- **Source locators checked against the text: 25.** In DudasMichel2015: Cor 13.2; Defs 14.2, 14.7, 15.1; Props 14.3, 14.8, 14.9, 14.13, 15.6, 15.10; Conj-Thm 14.4; Thm 14.5; Cors 14.6, 15.3, 15.11; Lemma 15.2; Rem 15.7; §11.1; Lemmas 11.8–11.10; Thm 11.11. In FulmanGuralnick2012: §3.2 and Prop 3.5 (2). In Geck2017: Ex 2.13. Pages agree except C01.
- **Library declarations opened at the pins.**
  - Mathlib: `FiniteField.frobeniusAlgHom` and `coe_frobeniusAlgHom` (`FieldTheory/Finite/Basic.lean`, lines 334 and 346); `Module.End.IsSemisimple` (`LinearAlgebra/Semisimple.lean`, line 56); `FiniteField.algebraMap_norm_eq_prod_pow` (`FieldTheory/Finite/Trace.lean`, line 59); `gaussSum` (`NumberTheory/GaussSum.lean`, line 72); `YoungDiagram.rowLen` and `colLen` (`Combinatorics/Young/YoungDiagram.lean`, lines 278 and 326); `YoungDiagram.ofPartition` (`Combinatorics/Enumerative/Partition/YoungDiagram.lean`, line 36).
  - Tau Ceti: `TauCeti.ClassFunction` (`RepresentationTheory/CharacterTable/ClassFunction.lean`, line 53); `equivConjClasses` (same file, line 218); `TauCeti.ClassFunction.characterPairing` (`Pairing.lean`, line 48, bilinear `|G|⁻¹Σ f₁(g)f₂(g⁻¹)`); `TauCeti.virtualCharacters` (`VirtualCharacter.lean`, line 127); `TauCeti.upperUnitriangularGroup` (line 108).
- **Cross-roadmap citations resolved at the head, none missing.**
  - ReductiveGroups: Layers 4, 7, 7C, 7a–7e, 7h, 7i and 9E, and §§7.1, 7a.1–7a.3, 7c.1, 7C.6, 7h.1–7h.3 and 7i.1–7i.3.
  - SchemeAndStackFoundations §§1.1 and 1.15.
  - EtaleCohomologyFoundations §§F.2.5, F.2.5a, F.2.7, F.3 and F.4.5.
  - EtaleDualityAndPerverseSheaves §7.6, with its four named statements and their parts.
  - CharacterTheory Layers 0–3 and 9 and §§3.6, 9.1, 9.2; InductionRestriction Layers 0–5; SemisimpleAlgebras Layer 1; SchurWeyl Layer 4 and §§7.5–7.7.
  - TypeAHeckeAlgebras §§1.1–1.2 and ClassicalArithmeticCompletion §§3.56 and 3.59.
  - Citations into this roadmap from FiniteReductiveGroups, BaseChangeAndGaloisRepresentationsForUnitaryGroups and OrbitMeasuresOnAdelicGroups all resolve; none cites §2.3.
- **Automatic checks and dependency check.** All automatic checks passed. The dependency check printed `depcheck: 132 roadmaps, 1470 edges, 0 problem(s)`, with no UPWARD or CYCLE line. All ten suppliers are on main.
- **Elaboration.** `Suggested.lean` gives 14 `sorry` warnings and nothing else. I compared the elaborated signatures (`#check @name` for all 23 declarations) with the README. The definitions drop `[Finite F]` and `[Finite F′]` without harm; every theorem keeps them; nothing changed.
- **One-tactic probe** (`rfl`, `simp`, `infer_instance`, `trivial`) on a copy of the file: none of the 14 theorems closes. A statement of the §2.7 degree formula elaborates in a separate file with only the `sorry` warning, and FiniteReductiveGroups' `Suggested.lean` elaborates with 3 `sorry` warnings.
- **Checks recomputed numerically:** `c_n(q)` for `q ∈ {2,3,4,5,7,8,9,11}` and `n ≤ 6`; `Σ deg²` for `GL₂(𝔽_q)` with `q ≤ 7`.
- **Overlap check:** read FiniteReductiveGroups, SmoothRepresentationsOfLocalGroupsPartII and BaseChangeAndGaloisRepresentationsForUnitaryGroups. No open roadmap is close in vocabulary, and the affine Deligne–Lusztig varieties of other roadmaps are other objects.
  - Deligne–Lusztig induction and Green's theory are shared with FiniteReductiveGroups. The owner is DeligneLusztigTheory; FiniteReductiveGroups cites it as *Corollary of:*.
  - The split finite Steinberg character is shared with SmoothRepresentationsOfLocalGroupsPartII §§4.1 and 4.9, which own it on main (R01).
  - The Harish-Chandra series of a label (§§2.6 (d), 2.9) is shared with BaseChangeAndGaloisRepresentationsForUnitaryGroups. The owner is DeligneLusztigTheory, which BaseChangeAndGaloisRepresentationsForUnitaryGroups cites.

Source independence: 19 passages compared with 3 sources; none shared beyond phrases the mathematics forces, the longest a five-word run "the dimensions of the two" in §2.5 against DudasMichel2015 line 2172. The largest share of citations is DeligneLusztig1976, 16 of 114, which could not be read. Contents compared with DudasMichel2015 (§§11, 13–15): independent. Layer 1's order is forced by its *Needs:* lines, each section using the ones before it.

Research link: Layer 1 is Deligne–Lusztig 1976's induction for finite reductive groups, which Lusztig's classification of their characters builds on (DudasMichel2015 §15.1, Theorem 15.13). Layer 2 is Green 1955, Kondo 1963 and Shintani 1976 for `GL_n(𝔽_q)`, which FiniteReductiveGroups and BaseChangeAndGaloisRepresentationsForUnitaryGroups consume. This rests on the README and DudasMichel2015.

## Not verifiable

- DeligneLusztig1976 (Ann. of Math., JSTOR, paywalled; no legal copy found): every † locator of §§1.1–1.11 and the locators of §§2.4, 2.8 and 2.9.
- Carter1985 (book, no legal copy): Theorems 7.2.8 and 7.3.4, 7.5.1, 7.5.2, §§8.1, 8.4 and 12.1.
- DigneMichel1991 and DigneMichel2020 (Cambridge books, no legal copy): 11.13, 12.14 and the second edition as a whole.
- DeligneLusztig1983 (J. Algebra; the sources service resolved it only to a paywalled page): §1.5 (b).
- Green1955 (Trans. Amer. Math. Soc.; the host is not one the sources service knows): §§2.1, 2.4 (Lemma 6.3), 2.7 (Lemma 7.7, Theorem 13), 2.8 (Lemma 3.2, Theorems 1, 2, 5) and 2.10.
- Kondo1963 and Shintani1976 (J. Math. Soc. Japan; Project Euclid returned a blocking page and J-STAGE a 404): §§2.11 and 2.12.
- HowlettLehrer1980 and FongSrinivasan1982 (Springer, paywalled): §§2.2 (d), 2.5, 2.6 and 2.8 (a).
- SIGelfand1970 and BrundanDipperKleshchev2001 (no legal copy found): §§2.2, 2.4, 2.5 and 2.9.
- Not attempted, as they fall outside the sample: Macdonald 1995 and 1981, Zelevinsky 1981, Feit–Fine 1960, Iwahori 1964, Lusztig–Srinivasan 1977, Gelfand–Kazhdan 1975, Bernstein–Zelevinsky 1976, Maslen–Rockmore 1997, Curtis 1966, Solomon 1966.
- I read FulmanGuralnick2012 in its arXiv v1. I could not check its numbering against the published version.

Automatic checks set aside as false positives: the listing of elaborated signatures reads the docstring words "class of" (`Suggested.lean` line 80) as a declaration named `of`. The citation resolver reads the supplier headings "From `TauCetiRoadmap.RepresentationTheory.CharacterTheory`" (and the same for InductionRestriction, SemisimpleAlgebras and SchurWeyl) as Lean names.

## Source issues

- **Misprint** in DudasMichel2015 at the proof of Proposition 14.3, p. 62: the source says `g` lies in `F(g)` in `P·F(P)`; it should be `g⁻¹F(g) ∈ P·F(P)`; affects nothing.
- **Misprint** in DudasMichel2015 at Corollary 14.6, p. 63: the source says "to" `F`-stable maximal tori; it should be "two"; affects nothing.
- **Misprint** in DudasMichel2015 at Definition 14.2, p. 61: the source names "Lustig" induction and restriction; it should be Lusztig; affects nothing.

## For the human reviewers

- The decision on sections moving from the family to general roadmaps was applied. FiniteReductiveGroups' Layers 4–5 on main (Deligne–Lusztig induction, Green's theory) are stated in full here as Layers 1–2, and FiniteReductiveGroups at the head cites each as *Corollary of:*. I checked that each cited section states it.
- Not tested: the source with the largest share, DeligneLusztig1976 (16 of 114 citations), could not be read legally. Its wording and its table of contents were not compared with the README.
