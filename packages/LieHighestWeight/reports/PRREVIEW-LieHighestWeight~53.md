# Review of LieHighestWeight (pull request #1220 at 9428968)
Folder: `TauCetiRoadmap/RepresentationTheory/LieHighestWeight/`
**Verdict:** accepted

This is an incremental re-review of the 93 lines changed since `37a5164` (all in `README.md`; `Suggested.lean` is unchanged). Both findings of the previous report are repaired, the repairs introduce no new problem, and no finding remains.

`README.md` and `Suggested.lean` are the folder's files. `TauCeti/…` and `Mathlib/…` paths are at the manifest pins. Main was read at `697bab2`.

## Previous findings

- R01 — repaired: `README.md:54–60` “Degreewise symmetrization with its adjoint equivariance on each homogeneous component, its PBW degree and its leading symbol is native … Layer 7 extends the equivariance to the whole symmetric algebra”; contract `:868–882`; route and Etingof locator `:1880–1909`.
- R02 — repaired: `README.md:894–898` “Layer 3 (§3.2, with `R` a commutative ℚ-algebra and `g = Rx ⊕ Ry`, `[x,y] = y`) and Layer 7 (with `R` a characteristic-zero field) use it and assume nothing else of it.”

## Verified sound

### Gate, build, signatures

- **Worker's gate.** Every rule passes, with `build=0 OK`.
- **My rerun.** `outside-folder=1` for `TauCetiRoadmap/RepresentationTheory/README.md`, which is the pull request's own family index. Every other rule is 0. The brief's outside-folder diff returns nothing.
- **Dependency check.** Output: `depcheck: 235 roadmaps, 2136 edges, 0 problem(s)`. No UPWARD, CYCLE or `moved:` line.
- **Elaboration.** `lake env lean` on `Suggested.lean` gives 15 `sorry` warnings and nothing else. The file is byte-identical to the one the previous review read (`git diff 37a5164 HEAD` is empty for it), so the signature comparison and the one-tactic probe of that review stand: 15 theorems, 10 definitions with real bodies, no `set_option`, no sorried data.

### Native declarations opened at the pin (13, each with `#check` in a scratch file)

All are in the namespace `TauCeti.UniversalEnvelopingAlgebra` unless noted.

| Declaration | File and line | What the README says of it | At the pin |
| --- | --- | --- | --- |
| `pbwSymmetrization` | `PBW/Symmetrization.lean:78` | degree-n map on `Sym[R]^n L`, `n!` a unit, no freeness | `(R : Type)`, `IsUnit ↑n.factorial`, no `Module.Free` |
| `pbwSymmetrization_tprod` | `:85` | permutation-average formula | `↑hn.unit⁻¹ • ∑ σ, (List.ofFn …).prod` |
| `pbwSymmetrization_mem_pbwFiltration` | `:116` | PBW degree n | `∈ pbwFiltration R L n`, no freeness |
| `mk_pbwSymmetrization` | `:150` | leading symbol | equals `pbwHomogeneousComponentMap R L n (toHomogeneous x)`, no freeness |
| `pbwHomogeneousSymmetrization` | `:182` | same map on the homogeneous component | `homogeneousSubmodule R L n →ₗ[R] U` |
| `mk_pbwHomogeneousSymmetrization` | `:219` | symbol on a homogeneous element | as stated |
| `lie_ι_pbwSymmetrization_tprod` | `:287` | equivariance on words | one letter replaced by `⁅x, m k⁆`, summed over k |
| `lie_ι_pbwHomogeneousSymmetrization` | `:316` | equivariance on each component | hypothesis uses `lieModuleDerivation R L L x` |
| `pbwSymmetrization_mem_center_iff` | `:412` | needs `L` free in addition | `[Module.Free R L]` (the `variable` at `:373`) |
| `pbwHomogeneousComponentMap_injective` | `PBW/Injective.lean:196` | free `L`, any universe | `(R : Type u_1)`, `[Module.Free R L]` |
| `prod_map_ι_mem_pbwFiltration` | `PBW/Basic.lean:119` | word of length n in step n, any universe | `(R : Type u_1)`, `l.length ≤ k` |
| `prod_map_ι_sub_prod_map_ι_mem_pbwFiltrationPrevious_of_perm` | `PBW/LeadingTerm.lean:78` | permuted word differs by step n − 1, any universe | `(R : Type u_1)`, `l₁.Perm l₂` |
| `TauCeti.SymmetricAlgebra.lieModuleDerivation_mem_homogeneousSubmodule`, `TauCeti.SymmetricAlgebra.gradedAlgebra` | `LinearAlgebra/SymmetricAlgebra/LieModule.lean:119`, `Grading.lean:74` | the derivation preserves the grading | as stated |

The sentence “the scalar ring lies in `Type` because Mathlib's `Sym[R]^n L` puts `R` in the universe of `Fin n`” is correct: `Mathlib/LinearAlgebra/TensorPower/Symmetric.lean:43` has `variable (R ι : Type u)` and `:61` defines `Sym[R]^n M` as `Sym[R] (Fin n) M`.

### Changed passages

- **Route of §7.1 (`:1880–1903`).** Each step uses a declaration above or a target of this roadmap. The converse inclusion is sound: with p = Σ_{k≤m} p_k, m > n and e(p) ∈ F_n ⊆ F_{m−1}, the forward inclusion puts every e(p_k), k < m, in F_{m−1}; hence e(p_m) ∈ F_{m−1}, its degree-m symbol is zero, and `mk_pbwSymmetrization` with injectivity gives p_m = 0. The larger-universe route needs only the three universe-polymorphic lemmas the text names.
- **Former-name rows (`:102–104`).** The three names are declared in main's `Suggested.lean:1375`, `:1399`, `:1407`. They are cited at the head of NoncompactQuantumSymmetry (`README.md:1089–1090`) and of QuantitativeOrbitMethodAndMicrolocalAnalysisOnLieGroups (`README.md:69`, `:486`), as `:106–109` now says. The claim of the third row (“the injectivity its filtration clause gives at n = 0”) holds; see the table.
- **ScatteringDiagrams contract (`:889–898`).** §3.2 (`:1386–1388`) is the Layer 3 consumer it names, over a commutative ℚ-algebra.
- **Family index (`TauCetiRoadmap/RepresentationTheory/README.md:84–86`) and the description's Layer 7 bullet.** Both now say that Layer 7 extends the native degreewise equivariance to the global map; this agrees with the head.
- **Overlap.** #1797 changes the same folder and conflicts; the description's shared-folder order puts #1797 first and this pull request is rebased onto it. No cited id is dropped by an open pull request.

### Adversarial table

Rows marked (r52) are carried from the previous report for statements this diff leaves untouched (`Suggested.lean` is unchanged, so every Lean statement is carried).

| Statement | Instance | Values on each side | Result |
| --- | --- | --- | --- |
| §7.1 route, converse inclusion (changed) | `[x,y]=y`, p = XY + X, n = 1 | top component XY, m = 2; e(X) = x ∈ F₁; e(XY) = yx + y/2, degree-2 symbol XY ≠ 0, so e(p) ∉ F₁ and p ∉ Sym^≤1 | holds |
| former-name row, injectivity from clause 2 at n = 0 (changed) | any L; p = c, p = X | e(p) = 0 ∈ F₀ forces p ∈ Sym^≤0 = K·1; then e(c) = c = 0. e(X) = x ∉ F₀ = K | e injective |
| former-name row, centre criterion for an arbitrary element (changed) | sl₂: p = 1 + H² + 4EF; p = H | first: ⁅x,p⁆ = 0 for x = e, f, h, and e(p) = 1 + h² + 2ef + 2fe is central. Second: ⁅e,H⁆ = −2E ≠ 0, and e·h − h·e = −2e ≠ 0 | holds in both directions; sign of clause 1 agrees |
| contract `:868–882`, native formula against `he` (changed) | n = 2, K = ℚ, word (x,y) | native: `hn.unit⁻¹` = 1/2, value (xy+yx)/2; `he`: (2!)⁻¹(xy+yx) | equal |
| contract `:894–898`, §3.2 Rees degree (changed) | X = j(H), Y = j(N), `[x,y]=y` | (XY+YX)/2 = YX + ħY/2, in Rees degree 2 from the formula alone | holds |
| `pbwSymmetrization_lie_and_mem_pbwFiltration_iff` (r52) | L = 0; abelian line; `[x,y]=y`, p = XY; sl₂, p = H²+4EF; 𝔽_p with n = p | 1 = 1 and Sym^≤n = K = F_n; xⁿ; (xy+yx)/2 on both sides and −y²; commutator 0; clause 2 fails without `[CharZero K]` | Keep |
| same, wrong model (r52) | ordered map e′(XY) = xy | xy − (xy+yx)/2 = y/2 ≠ 0 | `he` excludes it |
| `normalizedPolynomialTensorBasis` (r52) | 0≤m,n≤3 | 1082 exact equalities; Gram diagonals (1,1): 1, 1/2, 1, 2 | Keep |
| §0.1 item 5 (r52) | m = 2, n = 2, 3, 5 | F²w₁ = (2,4n,n(n−1)); Fw₂ = (1,n−2,−(n−1)); w₃ = (1,−2,1) | Keep |
| `polynomialAction` (r52) | swap, m = n = r = 1 | −(x⊗y−y⊗x), det = −1 | Keep |
| `exists_reesZeroFiberBracket` (r52) | `[x,y]=y`; abelian | B(x,y) = y; B = 0 | Keep |
| `symmetricGradient` (r52) | b = (x,y), ξ = (2,3) | x² ↦ 4x, xy ↦ 3x+2y | Keep |
| `lift_reesZeroFiberBracket_eq_lie_symmetricGradient` (r52) | `[x,y]=y` at (2,3); sl₂ | 3 = 3; 12 = 12; {e, h²+4ef} = 0 | Keep |
| §3.2 ordered and symmetrized products (r52) | p = x, q = y | x⋆y = yx+ħy; D(xy) = y/2, B_sym(x,y) = y/2 | Keep |
| `invariantForm_isSymm_iff_tits_sign` (r52) | sl₂ V(1), V(2); sl₃ adjoint | −1, +1, +1 | Keep |
| §6.2 fixed-point sum (r52) | GL₂, λ = (1,0), t = (2,3) | −4+9 = 5 = 2+3 | Keep |
| §7.1 translation (r52) | A₁, ρ(h) = 1 | τ₋ρ(h²+2h) = h²−1 | Keep |
| `serreLift_injective_of_base` (r52) | A₂; B₂ | 2+6 = 8, 2+8 = 10 | Keep |
| `octonionSerreLift_injective` (r52) | i, j, ℓ | (ij)ℓ = (0,k), i(jℓ) = (0,−k) | Keep |
| `nonempty_derivationAlbert_equiv_f4` (r52) | diag(1,2,3) | (216−252+72)/6 = 6 | Keep |
| `finrank_e6_e7`, `finrank_e8` (r52) | rank + roots | 78, 133, 248 | Keep |
| `exists_complexified_divisionOctonion_equiv`, `compact_g2_derivation_divisionOctonion` (r52) | dimension | 14 = 2+12 | Keep |
| `isotypicMultiplicity_tensor_glIrreducible_eq_card_lrTableau` (r52) | n = 2, λ = μ = (1) | 2·2 = 3+1 | Keep |
| `exists_productCenterEquiv` (r52) | sl₂, characteristic 3 | [h,e³] = 6e³ = 0; [f,e³] = −3e²(h+2) = 0 | Keep |
| `eq_of_mem_closedFundamentalAlcove_of_mem_affineWeylGroup` (r52) | A₁: x = 2/3, 1, 0 | one orbit point in [0,1]; stabilizer of 0 has order 2 | Keep |
| Lie–Poisson sign across roadmaps (r52) | `[x,y]=y` | {x,y} = y here and in LieGroupoidsPoisson §G4.6A | Agree |

### Sources: the seeded sample

No locator in the README is marked unverified.

| Target | Passage read this round | Outcome |
| --- | --- | --- |
| 7.1 (new locator, `README.md:1880–1882`) | EtingofRepresentationsLieGroups lines 2993–2997, proof of Theorem 13.5, between the page markers 69 and 70: `gr U(g) = Sg` for any Lie algebra, and the 1/n! symmetrization map as an isomorphism of g-modules | As cited |
| 3.1, 3.2 | changed text adds no locator; GuttDeformationQuantization lines 899–905 read in r52 | As cited (r52) |
| 7.2 | Needs line unchanged in substance; Theorem 10.1 and Remark 10.2 read in r52 | As cited (r52) |
| 0.1, 5.1, 6.1, 6.2, 9.1, 9.2, 10.1 | untouched; read in r51 at the lines it lists | As cited (r51) |
| 9.3 | Dixmier §1.6 | Not verifiable (below) |

## Not verifiable

- **Dixmier, *Enveloping Algebras*, §1.6** (Layer 9 reference). Not in the sources cache or the manifest; this review edits no manifest.
- **HumphreysIntroLieAlgebras, BourbakiLie78, GoodmanWallachSymmetry.** Settled as uncertified, cited by locator only.
- **Background references, not opened:** Serre 1987, Fulton–Harris 1991, Humphreys 2008, Jantzen, Molev 2007. No changed statement depends on them.

## Source issues

- none
