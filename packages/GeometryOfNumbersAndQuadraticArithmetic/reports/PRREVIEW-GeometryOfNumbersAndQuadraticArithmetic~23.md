# Review of GeometryOfNumbersAndQuadraticArithmetic (pull request #3027 at 094da69)

**Verdict:** accepted

**Summary.** A review of the change against `main`: 369 changed lines since `74a09b7`. Every added or changed statement (2.2.6, 2.4.7–2.4.8, 2.5.7, 2.7.4–2.7.7, 2.9.2, 2.9.3a–2.9.3c, 2.9.4a–2.9.4b, Layer 2a, 3.2.8–3.2.9 and the two new declarations of `Suggested.lean`) was recomputed on instances, its supplier citations resolved, and its open sources read at their locators; the file elaborates with `sorry` as its only warning. No finding. There is one small correction (an unused hypothesis in 2.4.7 (c) and 2.4.8 (b)) and one format note, neither blocking. Two facts about sources are left for the human reviewers.

## C01 — 2.4.7 (c) and 2.4.8 (b) hold without "totally definite"

In 2.4.7 (c) (README line 445) and 2.4.8 (b) (line 456) the hypothesis "V is totally definite" is used by neither the statement nor its proof. The proof of (c) applies strong approximation with `S` the archimedean places together with `w`, and `∏_{v∈S} SU(V)(K_v)` is noncompact because `SU(V)(K_w)` is, whatever the signatures are; the same argument gives 2.4.8 (b) for every `V` with `n ≥ 2`. A reader may take the definite case to be needed (it is only the case in which (b) of 2.4.7 says nothing, which is how Kirschmer 2016, Corollary 5.1.4, splits the two). The statement is true as written. It would be more exact to drop the hypothesis in both places, or to say in a clause that it marks the case not covered by 2.4.7 (b).

## N01 — 2.5.7 could name the Tau Ceti theorem that is its inclusion case

For a square matrix `A` with nonzero determinant over a principal ideal domain, pinned Tau Ceti proves `length(Rⁿ/A·Rⁿ) = ord(det A)` (`Matrix.length_quotient_range_mulVecLin_eq_ord_det`, `TauCeti/LinearAlgebra/Matrix/SmithNormalForm/Length.lean`, line 58). This is `idx(A, gA) = v(det g)` when `gA ⊆ A`. The `*Needs:*` line of 2.5.7 (README line 503) lists only Mathlib; naming this theorem would tell an implementer that the remaining work is the integer-valued index without inclusion and its additivity.

## Previous findings

- none: the previous review, of `cd99c75`, had no finding, small correction or format note, and the folder has not changed since.

## Verified sound

| Statement | Instances tried | Values computed (each side) | Result | Change |
|---|---|---|---|---|
| 2.2.6 gluing | ℤ with `Λ_2 = 2ℤ_(2)`; `Λ_p = pℤ_(p)` for all p | intersection 2ℤ, localizations as given; intersection 0, not a lattice | holds; finiteness needed | none |
| 2.4.7 (a) special genera | n = 1; n = 0; general n ≥ 1 | genus = `U(𝔸_f)/K_L`; modulo `U(K)` and `SU(𝔸_f)` gives `U(1)(K)\U(1)(𝔸_f)/det K_L`; n = 0: one genus, target uncountable | holds; n = 0 excluded correctly | none |
| 2.4.7 (b), (c) | `S = ∞`; `S = ∞ ∪ {w}` | `s = γ·s_w·k`, k stabilizing L away from w, so `sL = γ(s_w L)` with completions `L_v` off w | holds, also for indefinite V | C01 |
| 2.4.8 (a) neighbour chain | unramified w; split w, relative position (1, −1) | `[Λ : Λ_x] = N𝔓 = [Λ(x) : Λ_x]`; `Λ′ ∩ Λ(x) = (Λ′ ∩ Λ) + Ox`; split: lengths 1 + 1 = 2, not a neighbour | holds | none |
| 2.5.7 index | `idx(R, πR)`; `A = R²`, `B = R ⊕ π²R`, `C = π⁻¹R ⊕ πR`; `D = πᴺA` | 1 = v(π); 2, −2, 0 (2 − 2 = 0); `nN − Σ(N − c_i) = Σ c_i` | holds; signs agree with Stacks 02MG–02MI | N01 |
| 2.7.4 dual, scale, norm, volume | hyperbolic plane over ℚ₂(i) and ℚ₂(√−3); `H(e,e) = π` unramified; split form | norm `Tr(O_F)` = 2ℤ₂, resp. ℤ₂; `L^∨ = π⁻¹L`, volume `πO`; `H(y,x)` = swap of `H(x,y)` | holds | none |
| 2.7.5 Jordan splittings | ramified odd, a odd and a even; split F; plane over ℚ₂(i) | `π_F^(−a)H` alternating mod 𝔓; `(cL)^∨ = c̄⁻¹L^∨`; split plane det `cc′ − uv`, valuation 2a; norm 2ℤ₂ ≠ scale | holds | none |
| 2.7.6 unimodular lattices | split line, bases e and (π,1)e; ℚ₃(√−3) diag(1,1), diag(1,2); unramified diag(1,π) | Gram dets 1 and π; residue forms x²+y² anisotropic, x²−y² isotropic, dets 1 and 2 in different norm classes; odd valuation | holds | none |
| 2.7.7 norm-maximal lattices | ramified odd `H(e,f) = π_F⁻¹`; anisotropic binary, ramified odd; split `(O, πO)` | norm `Tr(𝔓⁻¹) = O`, index q over unimodular plane; `N(π_F)⁻¹(a² + ub²)` not integral; dual `(π⁻¹O, O) = π⁻¹L` | holds | none |
| 2.9.2, 2.9.3a–c | 𝔽₄/𝔽₂ vector (1,1); reflection and transvection; ℚ(i): ⟨2⟩ ≅ ⟨1⟩; ℂ/ℝ ⟨1,−1⟩ | h = 1 + 1 = 0; `h(Ty,Ty) − h(y,y) = (μ+μ̄)N(h(u,y)) = 0`; `2·N(x)/2 = N(x)`; `q_h = ⟨1,1,−1,−1⟩` | holds in every characteristic as stated | none |
| 2.9.4a, 2.9.4b | ℚ₃(i): ⟨1,1⟩, ⟨1,3⟩; ℚ₂(i): 3; `ℍ^r` | −1 norm, −3 not a norm; `(3,−1)_2 = −1`; `(−1)^(r(2r−1))·(−1)^r = 1` | holds | none |
| 2a.1 / `hermitian_congr_iff_forall_place` | ℚ(i): diag(1,1) vs diag(1,2), vs diag(1,3); n = 0 | `B = diag(1, 1+i)`; 3 not a norm at 3, both sides false; n = 0 true ↔ true | holds; Lean = README | none |
| 2a.2 / `exists_hermitian_localizations_iff` | ℚ(√−3), n = 2: δ₂ alone; ⟨1,2⟩; n = 1; signs of `a_n` | non-norm places {2}: odd; {2,3}: even, `(2,−3)_3 = −1`; `a_n` sign `(−1)^s·(−1)^(s−1) = −1`, total s negatives | holds; `hfin` excludes `ncard = 0` of an infinite set | none |
| 2a.3 coherent collections | ℚ(i), ⟨1,1⟩ with `V_∞` → (1,1), then `V_2` → ℍ | one change: product −1; two changes: localizations of ℍ, product 1 | holds | none |
| 2a.4, 2a.5 | ⟨1,1,−1⟩, ⟨1,1,1⟩; line at a split place; lines in ⟨1,1,1⟩ | isotropic, definite; `h(x,x) = 0` forces a zero component; ⟨1⟩ ≅ ⟨2⟩, ⟨3⟩ differs at 3 | holds | none |
| 3.2.8 densities | ramified odd n = 1; unramified n = 1; ℚ₃(i), `H = x̄y/3` | fibre `2q^N`, β = 2; `(q+1)q^(N−1)`, β = 1 + q⁻¹; entry `2·3^(N−1) + 3^(2N−1)` | holds; normalization equals that of 3.2.2 | none |
| 3.2.9 (a) | ⟨1⟩⊥⟨2⟩, ⟨1,1⟩, ⟨1⟩⊥⟨2⟩⊥⟨4⟩ at q = 2; split q = 3 | brute force: 48 mod 2, 1152 mod 4 (9/2); 288 mod 4 (9/8); `2⁵(3/2)³ = 108`; 108 and 4 | holds; equals Kirschmer Thm 4.2.4 with `N = Σ min(s_i,s_j)m_im_j` | none |
| 3.2.9 (b) | ℚ₃(√−3): ⟨1,1⟩, ⟨1,2⟩, ⟨1,1,1⟩; general n | brute force 216 and 108 mod 3 (8/3, 4/3); 16/9; `q^(−n(n−1)/2)·#O_n` expands to the stated products | holds | none |
| `Suggested.lean` | elaboration at the pins; one-tactic probe on the two new theorems | 23 `sorry` warnings, no error; `simp`, `rfl`, `infer_instance`, `tauto` leave both goals open | holds | none |

- Source locators read against the text: 31. Kirschmer 2016 (24: Definitions 2.1.3, 2.3.3, 4.2.2, 5.2.1; Theorems 2.1.4, 2.4.1, 3.2.3, 3.3.3, 3.3.6, 4.2.4, 5.1.3, 5.4.14; Propositions 2.1.5, 3.3.5, 5.2.4, 5.2.5, 5.2.7; Corollaries 3.2.4, 5.1.4, 5.2.8; Lemmas 3.5.2, 3.5.3, 4.2.5; Remark 3.4.2; §10.1, with their pages), Voight (4: Theorem 9.4.9, Lemma 9.5.3, Definition 9.6.1, Lemma 9.6.4, printed pp. 141–144), Stacks Project (3: tags 02MG, 02MH, 02MI). Of the seeded targets, 2.2 and 2.5 fall in the change (2.2.6, 2.5.7) and all their open locators agree; the other thirteen are untouched.
- Library declarations opened at the pin: 9. Tau Ceti `QuadraticForm.atFinitePlace` and `atRealPlace` (`NumberTheory/QuadraticForm/Global/Localization.lean`:90, 96), `hilbertSymbol_productFormula` (`Global/ProductFormula.lean`:67), `exists_hilbertSymbol_eq_ite` (`Global/SignPrescription.lean`:154), `weakApproximation_denseRange` (`NumberField/Global/Approximation/Weak.lean`:208), `Matrix.length_quotient_range_mulVecLin_eq_ord_det`; Mathlib `Module.length` (`RingTheory/Length.lean`:31), `Submodule.exists_smith_normal_form_of_le` (`LinearAlgebra/FreeModule/PID.lean`:462), `Matrix.det_conjTranspose`, `LinearMap.IsOrthoᵢ`. Neither library has Landherr's theorem, hermitian Jordan splittings or the hermitian local densities.
- Cross-roadmap citations resolved: GlobalQuadraticForms 4.1 (item 3), 4.3, 6.1, 6.3 and ClassFieldTheory §6.1 (`localArtinEquiv`, `localArtinMap_unit_of_unramified`, `localArtinMap_eq_frobenius_pow_valuation`) and QuadraticFormInvariants Layers 0 and 1 on main; AdelicAlgebraicGroups *class-number-finite* and AA.4.2 *strong-approximation-sufficiency* on main and at this head; ReductiveGroups 9D.1 at this head, where this pull request adds it (characteristic not two, `n ≥ 1`: met by the number fields of 2.4.7).
- Record: the README at the merge base has 7 layers; the head keeps all of them with their ids and subjects and adds Layer 2a. No item is removed; §2.9 keeps its number and widens its title, and no roadmap links to its former anchor.
- Elaborated types: both new declarations carry every binder of README 2a.1 and 2a.2 (`σ ≠ id`, hermitian and invertible matrices, `1 ≤ n`, the finiteness hypothesis).
- Dependency check: `depcheck: 132 roadmaps, 1478 edges, 0 problem(s)`; no UPWARD or CYCLE line.
- Changes outside the folder: all 124 changed files lie in roadmap folders that this pull request revises or adds; none outside `TauCetiRoadmap/`.
- The pull request's text: its sentences on this roadmap (the new Layer 2a, §§2.4.7–2.4.8, 2.7.4–2.7.7, 2.9.2, 2.9.3a–c, 2.9.4a–b, §2.9 retitled, §§2.2.6, 2.5.7, 3.2.8–3.2.9, the two Lean declarations, the order after the two other open pull requests that change this roadmap) agree with the head.

Overlap check: read HermitianFormsAndLattices (on main and at this head), HermitianKTheoryOfPoincareCategories, SuccessiveMinima, IntegralLattices, GeneralAlgebraicKTheory, and searched every roadmap for Landherr, special genera, neighbours, Jordan splittings, the gluing of lattices and hermitian local densities. Landherr's theorem, the hermitian local theory, special genera, neighbours and the local densities are owned here; HermitianFormsAndLattices cites them as `*Corollary of:*` and states the two Gram-matrix theorems in its own namespace for its own sections 3.1 and 3.2. IntegralLattices owns Jordan splittings, neighbours and densities of quadratic lattices over `ℤ` and `ℤ_p`, and QuaternionArithmetic's "norm-maximal" concerns orders: other objects than the hermitian ones added here. Nothing else is shared.

Source independence: changed passages only; 12 passages compared with 3 sources (Kirschmer 2016, Voight, Stacks Project: the definitions of 2.7.4, the proofs of 2.2.6, 2.4.7, 2.4.8, 2.5.7, 2.9.3a and 2.9.4a, the statements of 2.7.5, 2.7.7, 3.2.8 and 3.2.9, and the two Lean docstrings), none shared; largest share Kirschmer 2016, 20 of 61 locators in the change; contents compared with Kirschmer 2016: independent (its material is spread over 2.2.6 ↔ Ch. 10, 2.4 ↔ Ch. 5, 2.7 ↔ §§2.3, 3.3, 3.5, 2.9 ↔ §§2.1, 3.2, Layer 2a ↔ §§2.4, 3.4, 3.2.8–3.2.9 ↔ §4.2, in another order, and Layer 2a's five sections have no counterpart sequence there).

Research link: Layer 2a and 2.7, 2.9, 3.2.8–3.2.9 give Landherr's classification (1936), Jacobowitz's local theory (1962), Shimura's special genera (1964) and the Gan–Yu densities (2000), which feed the hermitian mass formula (Gan–Hanke–Yu 2001; Kirschmer 2016, Chapter 4) and Kudla's coherent collections (1997). Rests on the README's sources and Kirschmer 2016.

## Not verifiable

- Landherr 1936, Shimura 1964, Jacobowitz 1962, Scharlau 1985, Knus 1991, O'Meara 1963, Witt 1937, Kneser 1957, Hoffmann 1991, Schiemann 1998, Gan–Yu 2000, Hironaka 1998, Braun 1941, Harris–Kudla–Sweet 1996 and Kudla 1997 have no open legal copy that the sources service reads; each statement they are cited for was checked mathematically and, where Kirschmer 2016 states it, against that text.
- Jacobson 1940 (§2 and §3, p. 267): the sources service found the journal's page but does not classify its host, so the locator was not read; 2.9.3c was checked by computation.

## Source issues

- **Misprint** in Kirschmer2016 at Remark 3.4.2 (3), p. 40: the source defines signatures n_i at the s real places where b is negative, then recovers the space from n_1, …, n_r; it should be n_1, …, n_s; affects nothing.

## For the human reviewers

- The change's most-cited source, Kirschmer 2016, is a Habilitationsschrift on its author's page (README References); the refereed sources it quotes for these theorems (Landherr 1936, Jacobowitz 1962, Shimura 1964, Gan–Yu 2000) are paywalled and were not read.
- Licence: Jacobson 1940 is on the publisher's journal page, a host the sources service does not classify; whether that copy is open was not settled.
- The two recorded decisions concern roadmaps under RiemannHypothesisForDirichletLFunctions; this folder removes nothing, so neither was needed here.
